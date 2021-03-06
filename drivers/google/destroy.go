// Copyright 2018 Drone.IO Inc
// Use of this source code is governed by the Polyform License
// that can be found in the LICENSE file.

package google

import (
	"context"

	"github.com/drone/autoscaler"
)

func (p *provider) Destroy(ctx context.Context, instance *autoscaler.Instance) error {
	op, err := p.service.Instances.Delete(p.project, p.zone, instance.ID).Context(ctx).Do()
	if err != nil {
		return err
	}
	return p.waitZoneOperation(ctx, op.Name)
}
