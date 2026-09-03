Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C4D3DE44E;
	Thu,  3 Sep 2026 06:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788416483; cv=none; b=lqcHQI4v1Tf1sSUmFKxSWjeTqmJ7an9HZu5XsCKk+oJSJ8XbQgJlJWdM0KNP+ZXUDir2VmZF0BVKywRr/SdxZGIRXR5RBiKV3qW/BinaSdPJXA0Wcud8WHqFAAZTh56ia7+LR7Fq6AMWZGZCwDWbHyJmCJweXW/XPkDDrv0BNJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788416483; c=relaxed/simple;
	bh=D/pvFTpE1fJRZFwmTGRBruaaUiEivAm61dzfvv3UUuY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sa2gLwOpYifpIySu+VrdKyanQYiJjM/ZMQrq8qATwoOLUaMG70lfdkJHivRhUsC1qIvVhjuysFwoxCiqV49YFtH2uvB5gdqydaPuk69g2dDMKBsdeeILQRZlbZwuLcNOL1mFfVDBe01cwjj4MajDHmJ2SnP6NLNazeN3Wwxu5EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AAA3A1A0202;
	Thu,  3 Sep 2026 08:21:19 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4AD211A023A;
	Thu,  3 Sep 2026 08:21:19 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id B9E1518000B1;
	Thu,  3 Sep 2026 14:21:17 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	broonie@kernel.org,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v18 0/8] Add support for NXP P3H2x4x I3C hub driver
Date: Thu,  3 Sep 2026 11:51:00 +0530
Message-Id: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

This series adds support for the NXP P3H2x4x family of multi-port I3C
hub devices, including their on-die regulators and downstream I3C/SMBus
target ports

The series introduces:
- Core I3C master enhancements required for hub support
- Generic I3C hub framework
- MFD driver with regulator and I3C hub child drivers for the P3H2x4x I3C hub

The dependency order within the series is:

- Patches 1 and 2 provide the I3C core helpers required by the generic
  I3C hub framework
- Patch 3 provides the P3H2x4x Device Tree binding
- Patch 4 provides the MFD parent required by both the regulator and
  P3H2x4x I3C hub child drivers
- Patch 5 provides the regulator child driver and depends on patch 4
- Patch 6 provides the generic I3C hub framework and depends on the
  I3C core changes in patches 1 and 2
- Patch 7 provides the P3H2x4x I3C hub child driver and depends on
  patches 4 and 6
- Patch 8 extends the P3H2x4x hub driver with SMBus slave mode support
  and depends on patch 7

Changes in v18:
- Rebased onto v7.3-rc1; no intended driver behaviour changes
- Adapted i3c_master_register_fwnode() to the generic fwnode handling
  introduced in v7.3-rc1
- Link to v17: https://lore.kernel.org/linux-i3c/20260902102929.2268307-1-lakshay.piplani@nxp.com/T/#u

Changes in v17:
- Document the calling context of i3c_dev_recycle_ibi_slot_controller():
  it runs in workqueue context without the bus lock held, while the 
  controller owns and synchronizes its IBI pool
- Retain the request_ibi capability check to preserve the pre-series
  behaviour for regular I3C devices
- Explain in the binding description that all variants share the same register
  interface, software reads the target-port count from DEV_CAPAB, and
  the x0/x1 variants differ only in power-up defaults that the driver
  overrides
- Remove the fixed post-enable delay; regulator settling is now handled
  by the regulator core
- Add .enable_time = 5000 through P3H2X4X_LDO_ENABLE_TIME_US to all four
  LDO descriptors, so the regulator core applies the post-enable
  settling delay
- Move the lockdep-only routing-lock class assignment into a dedicated
  helper, leaving hub context initialization unconditional when
  CONFIG_LOCKDEP is disabled
- Document that hub_dev must already be registered and remove the
  WARN_ON_ONCE checks for its descriptor and parent controller
- Export i3c_hub_master_ops as a const object and reference it directly
  instead of returning it through an accessor
- Document that downstream ports share the parent controller's dynamic
  address domain and that independent per-port DAA domains are not
  provided
- Document that a broadcast CCC on a virtual bus reaches the parent bus
  and devices behind other connected ports; directed CCCs must be used
  for per-device scope
- Document that fixed-DT address reservations remain allocated for the
  lifetime of the parent bus, are reused across driver reprobes, and
  that downstream hot-join support would also require reserving static
  addresses
- Use a named initializer for the platform_device_id table
- Document why I3C target ports are connected once and left connected,
  making their per-operation enable and disable callbacks no-ops
- Reference the exported i3c_hub_master_ops object directly
- Link to v16: https://lore.kernel.org/linux-i3c/20260826103819.1614843-1-lakshay.piplani@nxp.com/T/#u

Changes in v16:
- Rename the controller-only helpers with a "_locked" suffix to
  make the parent-bus locking contract explicit, route IBI slot recycling
  through the controller helper, and destroy the generic IBI workqueue when
  request_ibi() fails
- Fix a lockdep "recursive locking" false positive on the hub forwarding path
  by giving the virtual bus lock and hub routing mutex per-nesting-depth
  lockdep classes
- Fix parent-bus dynamic-address reservation to reserve by assigned-address
  and only when the slot is free, avoiding ENTDAA collisions
- Make downstream reattach atomic against asynchronous IBI and reject it while
  an IBI is live; detach IBI-lifetime invariant documented and checked with
  WARN_ON_ONCE; underlying core IBI teardown fix deferred (known I3C-core
  limitation)
- Tighten the target-port reg schema (explicit minimum 0, maximum 7, and
  maximum 3 for four-port variants)
- Do not ignore regulator-enable failures during hub configuration
- Widen the SMBus poll deadline to the datasheet SDA-stuck/SCL-low recovery
  window and use DMA-safe buffers for controller-agent and SMBus-agent
  transfers over I3C
- Advertise I2C_FUNC_SLAVE only when CONFIG_I2C_SLAVE is enabled, reject slave
  registration unless the upstream I3C device and IBI path are available, and
  always clear the software slave state on unregister
- Validate the SMBus-agent IBI payload length and bound the target-port loop
  by num_target_ports before dispatching receive events
- Link to v15: https://lore.kernel.org/linux-i3c/20260817103844.2142802-1-lakshay.piplani@nxp.com/T/#u

Changes in v15:
- Replace the direct attach and detach APIs with controller-only helpers
  that do not modify address-slot state, device lists or generic IBI
  lifecycle state
- Add controller-only helpers for device attach, reattach and detach,
  and for requesting, freeing, enabling, disabling and recycling IBI
  resources
- Rework the generic hub architecture to keep downstream logical device
  descriptors associated with their virtual controllers
- Add a permanent parent-facing descriptor for each downstream device
  and use it for operations handled by the physical parent controller
- Remove temporary descriptor reparenting and temporary hub dynamic
  address replacement from downstream transfer paths
- Forward downstream private transfers and the complete IBI lifecycle,
  including IBI slot recycling, through the parent-facing descriptor
  with appropriate parent-bus locking
- Add binding and MFD support for the P3H2440, P3H2441, P3H2840 and
  P3H2841 variants
- Fix the target-port reg schema and update the binding examples to use
  SMBus target-port nodes
- Read the device capability register to determine whether the device
  provides four or eight target ports
- Configure and register only the target ports implemented by the
  selected device variant
- Preserve the MFD parent's driver data and store the hub context in the
  shared MFD structure for use by IBI callbacks
- Validate target-port types and indices while ignoring non-target-port
  children, such as the regulators node, during Device Tree parsing
- Correct the SMBus transfer timeout calculation for 400 kHz operation
- Use I2C adapter quirks to enforce the maximum supported read and write
  payload lengths
- Publish callback-visible SMBus adapter state before adapter
  registration and roll it back if registration fails
- Rework SMBus slave registration and unregistration to use the shared
  protected-register lock and update software state only after the
  corresponding hardware operation succeeds
- Update the MFD source description to identify the device as an NXP
  P3H2x4x multi-port I3C hub instead of referring to it as an "MFD
  device driver"
- Link to v14: https://lore.kernel.org/linux-i3c/20260714092053.2461482-1-lakshay.piplani@nxp.com/T/#u

Changes in v14:
- Add i3c_master_register_fwnode() for virtual I3C masters and use it instead of temporarily changing
  parent dev->of_node
- Add runtime PM handling in i3c_master_send_ccc_cmd()
- Export i3c_bus_maintenance_lock()/unlock() and use them in hub paths
- Fix IBI request/free cleanup to handle forwarded callbacks that clear dev->ibi, and destroy the
  allocated IBI workqueue on request failure
- Add a shared MFD protected_reg_lock and use it for protected register accesses across P3H2X4X
  child drivers
- Rework regulator protected-register handling to restore the original protection state after
  each operation
- Serialize hub route selection around DAA, CCC, private transfer and IBI paths
- Hold the parent maintenance lock across temporary hub address reattach, transfer and address
  restore
- Fix SMBus polling interval calculation
- Clean up already registered SMBus adapters on adapter allocation or registration failure
- Fix SMBus slave receive status handling by clearing receive flags on error paths, using FIELD_GET()
  and explicitly clearing overflow status
- Link to v13: https://lore.kernel.org/linux-i3c/20260701065755.2067793-1-lakshay.piplani@nxp.com/T/#u

Changes in v13:
- Fix I3C master address management in direct attach/detach paths by using i3c_master_get_i3c_addrs()
  adding rollback on failure, skipping master self attach/detach, and properly releasing addresses to
  avoid stale state and use-after-free issues.
- Export and document address slot helper APIs for I3C hub support.
- Reserve parent bus address slots for downstream devices with identical static and assigned addresses
  by parsing target-port DT nodes prior to virtual controller registration, preventing DAA conflicts.
- Keep broadcast RSTDAA blocked with added documentation, and clarify intentional no-op callbacks
  and pending TODOs (e.g., IBI slot recycle).
- Rework SMBus transaction handling to use polling instead of fixed delays
  avoiding premature reads and data corruption.
- Fix DT handling issues by preventing duplicate target-port node leaks and restoring dev->of_node
  after temporary modification.
- Improve resource management using devm-based cleanup for DT nodes, IBI setup, adapter unregister
  and register relock paths.
- Make IBI setup optional and robust to avoid probe failures on unsupported platforms, with proper cleanup.
- Fix SMBus slave receive path by improving buffer handling, event delivery, and handling of unregistered ports.
- Strengthen concurrency handling with proper locking around shared state.
- Link to v12: https://lore.kernel.org/linux-i3c/20260617110355.1591844-1-lakshay.piplani@nxp.com/T/#u

Changes in v12:
- Rebased on i3c/next
- Dropped patches 1/9 and 2/9 from v11 as they are already applied
- Add address check in i3c_master_direct_detach_i3c_dev_locked() to skip
  detach for unaddressed devices
- Drop redundant depends on I3C from config I3C_HUB
- Return -EOPNOTSUPP for unsupported I2C transfers in the generic hub ops
- Correct default pull-up and drive-strength values
- Add devm cleanup for the IBI request/enable path
- Remove dead code and simplify cleanup by relying on devm-managed resources
- Fix SMBus slave client NULL handling and unregister cleanup
- Link to v11: https://lore.kernel.org/linux-i3c/20260612111816.3688240-1-lakshay.piplani@nxp.com/T/#u

Changes in v11:
- Convert i3c_master_supports_ccc_cmd() to return bool and align
  semantics with CCC support checks used by the I3C core
- Use MFD_CELL_NAME() for child device registration
- Rename driver names to follow subsystem conventions:
     - Use '-' instead of '_' in driver names
     - Drop the "_drv" suffix from driver names
- Fix virtual hub address reattach handling and parent bus locking
- Fix IBI request and cleanup error paths
- Improve SMBus slave mode payload validation and parsing
- Link to v10: https://lore.kernel.org/linux-i3c/20260525064209.2263045-1-lakshay.piplani@nxp.com/T/#u

Changes in v10:
- Rename i3c_master_reattach_i3c_dev() to *_locked to reflect required
  bus locking
- Rename i3c_master_direct_attach_i3c_dev() and i3c_master_direct_detach_i3c_dev()
  to *_locked, as these APIs must be called with the bus lock held for write
- Drop redundant is_p3h2x4x_in_i3c flag from p3h2840.h
- Remove unnecessary ibi_lock handling in request/enable/disable/free
  IBI APIs
- Remove redundant parent pointer from struct i3c_hub and derive upstream
  master from hub_dev
- Split SMBus target/slave mode support, including IBI and MCTP receive handling,
  into a separate patch
- Link to v9: https://lore.kernel.org/linux-i3c/20260420105222.1562243-1-lakshay.piplani@nxp.com/T/#u

Changes in v9:
- Renamed macros to follow consistent uppercase naming conventions
- Made REGMAP selects in the P3H2X4X MFD Kconfig conditional, to avoid I3C/I2C dependency issues
- Referenced i3c.yaml and i2c-controller.yaml for child bus nodes
- Dropped unnecessary #address-cells and #size-cells from child nodes
- Added CONFIG_I2C_SLAVE guards where necessary to avoid build errors when I2C slave support is disabled
- Link to v8: https://lore.kernel.org/linux-i3c/20260323062737.886728-1-lakshay.piplani@nxp.com/T/#u

Changes in v8:
- Add compatible in i3c example
- Link to v7: https://lore.kernel.org/linux-i3c/20260319112441.3888957-1-lakshay.piplani@nxp.com/T/#u

Changes in v7:
- Fix kernel-doc warnings across I3C core and hub code
- Rework DT binding schema and examples to pass dt_binding_check
- Update MFD Kconfig to use I3C_OR_I2C
- Convert CONFIG_I3C_HUB to tristate
- Remove unnecessary CONFIG_I2C_SLAVE guards
- Replace custom helpers with find_closest()
- Use devm_regulator_get_enable_optional()
- Link to v6: https://lore.kernel.org/linux-i3c/64c5070c-aa9e-427a-933e-91e168f0510c@kernel.org/T/#u

Changes in v6:
- Update DT binding with vendor-prefixed properties
- Add generic I3C hub support
- Remove generic code from P3H2x4x driver
- Link to v5: https://lore.kernel.org/linux-i3c/20260206120121.856471-1-aman.kumarpandey@nxp.com/T/#u

Changes in v5:
- Update supply naming and descriptions
- Improve MFD Kconfig/Makefile ordering
- Link to v4: https://lore.kernel.org/linux-i3c/20260113114529.1692213-2-aman.kumarpandey@nxp.com/T/#u

Changes in v4:
- Split driver into MFD, regulator and I3C hub parts
- Update I3C master for hub support
- Fix DT binding issues
- Link to v3: https://lore.kernel.org/linux-i3c/20250811-bittern-of-abstract-prestige-aaeda9@kuoka/T/#u

Changes in v3:
- Add MFD support for hub and regulators
- Add regulator integration
- Link to v2: https://lore.kernel.org/linux-i3c/17145d2f-5d07-4939-8381-74e27cde303c@kernel.org/T/#u

Changes in v2:
- Fix DT binding warnings
- Refine DT parsing logic
- Link to v1: https://lore.kernel.org/linux-i3c/822d6dca-b2c6-4439-ade5-219620ebc435@kernel.org/T/#u

Aman Kumar Pandey (5):
  i3c: master: Add APIs for I3C hub support
  dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
  mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub and on-die regulator
  regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x
    i3c hub
  i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality

Lakshay Piplani (3):
  i3c: master: Add controller-only device operation helpers
  i3c: hub: Add support for the I3C interface in the I3C hub
  i3c: hub: p3h2x4x: Add SMBus slave mode support

 .../devicetree/bindings/i3c/nxp,p3h2840.yaml  | 328 +++++++
 MAINTAINERS                                   |  15 +
 drivers/i3c/Kconfig                           |  15 +
 drivers/i3c/Makefile                          |   2 +
 drivers/i3c/hub.c                             | 832 ++++++++++++++++++
 drivers/i3c/hub/Kconfig                       |  11 +
 drivers/i3c/hub/Makefile                      |   4 +
 drivers/i3c/hub/p3h2840_i3c_hub.h             | 362 ++++++++
 drivers/i3c/hub/p3h2840_i3c_hub_common.c      | 413 +++++++++
 drivers/i3c/hub/p3h2840_i3c_hub_i3c.c         | 178 ++++
 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c       | 651 ++++++++++++++
 drivers/i3c/internals.h                       |  14 +
 drivers/i3c/master.c                          | 385 ++++++--
 drivers/mfd/Kconfig                           |  13 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/p3h2840.c                         | 167 ++++
 drivers/regulator/Kconfig                     |  10 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/p3h2840_i3c_hub_regulator.c | 289 ++++++
 include/linux/i3c/device.h                    |   2 +
 include/linux/i3c/hub.h                       |  92 ++
 include/linux/i3c/master.h                    |  17 +
 include/linux/mfd/p3h2840.h                   |  41 +
 23 files changed, 3791 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
 create mode 100644 drivers/i3c/hub.c
 create mode 100644 drivers/i3c/hub/Kconfig
 create mode 100644 drivers/i3c/hub/Makefile
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub.h
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_common.c
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
 create mode 100644 drivers/mfd/p3h2840.c
 create mode 100644 drivers/regulator/p3h2840_i3c_hub_regulator.c
 create mode 100644 include/linux/i3c/hub.h
 create mode 100644 include/linux/mfd/p3h2840.h


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.25.1

