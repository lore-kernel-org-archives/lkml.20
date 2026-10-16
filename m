Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534CD501F49;
	Fri, 16 Oct 2026 18:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175245; cv=none; b=O9kfbK2L3YFNf2wzds29UWuwKlFosTcDlFkWLQYvXOgjhInzyEbAbd3zwXNNOuRuHH6WXrzqghycYQHuv2USfs6V/FPlBkz9wbIH9k3lXrZse/SdeU3r4A/HzcCi/wI8HKdtVl6K5fwUvqoIBtKi8dDxSfKs4ulRvCWfW6bQQTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175245; c=relaxed/simple;
	bh=NALqzJpWWgc9wyCZgTKGgjifFJ6L+Jn6MpaGxt92zqA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S+oIoRFQkJeMU1trZR0JFn8+4qenhrj2Rb0oDGkyopOr89dOLcVCjbNpmN7/5WMnWjCtYeZChLqZI8ldBhUlbuHJCpW4qyR7pubUSa2uurSb1dGqQZZYa7zgIT4Yw+02zjt2CwI6X/bvWy8WoKpR7h4HvYSSXLNmUTbsVSviLqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=u8OLkoM6; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="u8OLkoM6"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70A8D14BF;
	Fri, 16 Oct 2026 11:27:19 -0700 (PDT)
Received: from e142021.manchester.arm.com (e142021.arm.com [10.33.8.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBC323F7B4;
	Fri, 16 Oct 2026 11:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792175242; bh=NALqzJpWWgc9wyCZgTKGgjifFJ6L+Jn6MpaGxt92zqA=;
	h=From:To:Cc:Subject:Date:From;
	b=u8OLkoM6Zh6Ok2habtCKhG1sKxMd28cXPKSIixKcw3BJnVO/bPzf6HS/LF0GIe0BR
	 TKYs3msXsje8t41/LF9phY3SPSiS7ctwZ6wRFeQj2JmOg9GChgPp0v2bYxkAm3ctYJ
	 lCYvHJ+zQw5nkmYXL4FsrILxuab4ZyYMKRJGkiSE=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>,
	vsethi@nvidia.com,
	Varun Wadekar <vwadekar@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v5 0/8] Arm Live Firmware Activation (LFA) support
Date: Fri, 16 Oct 2026 19:27:04 +0100
Message-ID: <20261016182714.1835813-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

an decent overhaul of the series for the "Live Firmware Activation"
kernel support, based on feedback from Mark and Sudeep. Two patches have
been squashed into the main feature patch, the name attribute has been
removed, and documentation (hopefully) improved. Other than that quite
some smaller changes, renames and reworks, hopefully for the better.

I added the two SMCCC bus prerequisite patches to this series, just to
trigger a Sashiko review, which was missing so far. I am sure it will be
a feast for Sashiko to tear this apart ;-) Those two patches have already
been queued in arm64/for-next, for the v7.4 merge window, but I will need
to send at least another revision after the merge window anyway, so I just
added them here meanwhile, for this one version. Please ignore them for
review purposes.

For a high level overview of LFA see the rest of this commit message and
the commit message of the main features patch (4/8). Some simplified over
of the spec is in the top comment in patch 4/8. Also the sysfs ABI
documentation in the last patch contains some more information.

Based on v7.3-rc1, plus those first two patches from Aneesh's SMCCC bus[1]
series. Changelog below.
==============================

This series implements the kernel side support of the Arm Live
Firmware Activation (LFA) specification [2]. LFA enables the activation
of updated firmware components without requiring a system reboot,
reducing downtime and allowing quicker deployment of critical bug fixes
in environments such as data centers and hyperscale systems.
It requires explicit firmware support, both via an agent running in EL3
(for instance in TF-A, already merged), but also in the firmware
component to be activated. TF-RMM recently merged support for this.

Unlike the usual firmware update process (which may use tools like
fwupd), LFA focuses solely on the activation of an already updated
firmware component, called "pending activation" in LFA lingo. This works
by signalling the LFA agent (part of the EL3 runtime firmware) via an
SMC call, which then does the heavy lifting of the live update, in
cooperation with the to-be-updated firmware component.

Key features of the driver:
* Detects LFA support in system firmware (EL3).
* Lists all firmware components that support live activation, identified
  by their UUID.
* Exposes component attributes (e.g., activation capability, and
  activation pending) via sysfs under /sys/firmware/lfa/<UUID>/.
* Provides interfaces to:
  - Trigger activation of an updated firmware component.
  - Cancel an ongoing activation if required.
A more detailed list of features can be found in patch 4/8.
Based on v7.3-rc1.

This work is conceptually similar to Intel’s Platform Firmware Runtime
Update and telemetry (PFRUT) [3] and TDX module updates [4], but
targets Arm platforms. The driver has been used to successfully activate
a Realm Management Monitor (RMM) firmware image in a controlled test
environment. RMM is analogous to Intel’s TDX module.

There is effort on similar work from the OCP [5]. Future work may
include integration with utilities like fwupd to automatically select
the appropriate driver, based on platform architecture, for Live/Runtime
firmware updates.

Please have a look, test and comment!

Best regards,
Salman and Andre

Changes in v5:
- merge the timeout and the lock patch into original feature patch
- drop "name" attribute altogether
- rename firmware "image" to "component" everywhere
- add explanation of LFA concepts in top comment
- use switch/case for error strings and error mapping
- define error codes with negative numbers
- rename SMCCC register variable to from "reg" to "regs"
- don't open code bit masking
- use only one SMCCC register set where possible
- rewrite retry:/goto into do/while() loop
- make example IRQ to be edge triggered
- update activation_pending in pending_version_show()
- check SMCCC version to be v1.2 or higher
- check all SMCCC functions are implemented
- remove blank lines before return statements
- use UUID instead of GUID everywhere
- improve comments
- filter for ACPI notification 0x80 only
- update ABI doc to use component, not image
- add activation_pending attribute
- fix IRQ/ACPI registration error handling
- add comments documenting lock requirements
- print LFA error number when printing error strings
- explicitly free IRQ in remove() routine
- reorder functions to avoid early empty prototype
- adjust SMCCC function ID names to match spec
- copy list of activatable images to avoid infinite loop
- update pending status when showing pending_version
- cast error returns to s64
- replace "N/A" error return with empty string

Changes in v4:
- streamline threaded IRQ handler (drop empty hard IRQ part)
- add lfa_to_linux_error() conversion function
- use Linux errno codes in more functions
- drop bogus LFA error numbers for -EAGAIN and -EBUSY
- clarify interrupt purpose and edge trigger requirement in binding
- honour signal related return from msleep_interruptible()
- call clean_fw_images_tree() first in driver teardown
- streamline ACPI and DT registration
- cache rendezvous status to avoid race during activation
- only trigger activation when writing 1/Y/true to sysfs file
- adapt to new version of Aneesh's SMCCC bus patches ([1])

Changes in v3:
- change node name in DT binding example
- move SMCCC function identifiers into generic SMCCC header
- rework to use the new SMCCC bus instead of a using a faux device
- add missing workqueue cleanup in probe() routine
- squash former patch v2 3/8 into base patch
- use get_image_name() more consistently
- also consider -LFA_BUSY return in activate call

Changes in v2:
- restrict build to arm64 (the LFA spec only supports AArch64)
- rename and extend central data structure to fw_image
- use separate GPR register sets for some SMC calls
- provide wrapper for error messages to prevent out-of-bound access
- return GUID in the "name" sysfs file when image is unknown
- fix wrong attribute in pending version number show function
- add missing include files and order them properly
- fix memory leaks in error cleanup paths
- handle lifetime using embedded kobjects and a kset
- drop global lfa_lock, use kset list lock and kobject refcount instead
- add DT binding documentation
- add timeout and watchdog re-arming (contributed by Veda)
- relax timeout period and do not block while waiting
- register ACPI notification (contributed by Veda) and DT interrupt 
- refactor ACPI notification code to allow sharing with DT code
- use faux device instead of platform driver
- add auto_activate file to control automatic activation
- introduce rwsem mutex to prevent using stale sequence ID
- use labels and goto instead of infinite loop when retrying activation
- initialise workqueue only once (thanks to Nirmoy)
- various cleanups on reported messages and code formatting
- rebase on top of v7.0-rc1

Changes in v1:
- Updated SMCCC version 1.1 to 1.2 per the LFA specification requirement.
- Changed "image_props" array to a linked list to support the dynamic
  removal and addition of firmware images.
- Added code to refresh firmware images following a successful activation.
- Added a work_queue to handle the removal of firmware image attribute
  from it's respective kobject "_store" handle.
- Refactored prime and activate into separate functions.
- Kernel config for LFA now defaults to "y" i.e. included by default.
- Added individual kernel attribute files removal when removing the
  respective kobjects using kobject_put().
- mutex_lock added to activate_fw_image() and prime_fw_image() calls.
- Renamed create_fw_inventory to update_fw_image_node.
- Renamed create_fw_images_tree to update_fw_images_tree.
- Added two more attributes due to specs update from bet0 to bet1:
  current_version: For retrieval of the current firmware's version info.
  pending_version: For retrieval of the pending firmware's version info.
- Minor changes such as, improved firmware image names, and code comments.
- do...while loops refactored to for(;;) loops.

[1] https://lore.kernel.org/linux-arm-kernel/20260914060511.277948-1-aneesh.kumar@kernel.org/
[2] https://developer.arm.com/documentation/den0147/latest/
[3] https://lore.kernel.org/all/cover.1631025237.git.yu.c.chen@intel.com/
[4] https://lore.kernel.org/all/20250523095322.88774-1-chao.gao@intel.com/
[5] https://www.opencompute.org/documents/hyperscale-cpu-impactless-firmware-updates-requirements-specification-v0-7-9-29-2025-pdf


Andre Przywara (4):
  dt-bindings: arm: Add Live Firmware Activation
  firmware: smccc: lfa: Add auto_activate sysfs file
  firmware: smccc: lfa: Register DT interrupt
  firmware: smccc: lfa: add sysfs ABI documentation

Aneesh Kumar K.V (Arm) (2):
  firmware: smccc: Add an Arm SMCCC bus
  firmware: hwrng: arm_smccc_trng: Register as an SMCCC device

Salman Nabi (1):
  firmware: smccc: Add support for Live Firmware Activation (LFA)

Vedashree Vidwans (1):
  firmware: smccc: lfa: Register ACPI notification

 Documentation/ABI/testing/sysfs-firmware-lfa  |  106 ++
 .../devicetree/bindings/arm/arm,lfa.yaml      |   50 +
 MAINTAINERS                                   |    2 +
 arch/arm/include/asm/archrandom.h             |    2 +-
 arch/arm64/include/asm/archrandom.h           |    2 +-
 drivers/char/hw_random/arm_smccc_trng.c       |   32 +-
 drivers/firmware/smccc/Kconfig                |   10 +
 drivers/firmware/smccc/Makefile               |    3 +-
 drivers/firmware/smccc/bus.c                  |  158 +++
 drivers/firmware/smccc/lfa_fw.c               | 1057 +++++++++++++++++
 drivers/firmware/smccc/smccc.c                |   67 +-
 include/linux/arm-smccc-bus.h                 |   48 +
 include/linux/arm-smccc.h                     |   15 +
 include/linux/device-id/arm_smccc.h           |   19 +
 include/linux/mod_devicetable.h               |    1 +
 scripts/mod/devicetable-offsets.c             |    3 +
 scripts/mod/file2alias.c                      |    8 +
 17 files changed, 1560 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-lfa
 create mode 100644 Documentation/devicetree/bindings/arm/arm,lfa.yaml
 create mode 100644 drivers/firmware/smccc/bus.c
 create mode 100644 drivers/firmware/smccc/lfa_fw.c
 create mode 100644 include/linux/arm-smccc-bus.h
 create mode 100644 include/linux/device-id/arm_smccc.h


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

