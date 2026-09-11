Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE863A4F2F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126829; cv=none; b=D6WEKDE4mnQKBu9yRSKZYF2zr96Vfimx7kgG3cG9rp+M0ZLXjBpaNpMx1PoaBKiApVIZMRewgmUR8ndHWZG1oIzYVqg2mFTtQAWjqRolMMa5f37lB0IRrGQ36UxEF2pA2inC/6PgSyFiysWutLo05LggBStCnpz/4zUFbcUV5mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126829; c=relaxed/simple;
	bh=y4Y8gWkVV/nPSXn6MMWRiSH8kJFJ9j4ufvHdYDsdIUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l7Oz+yKNK36o6XtoRtgxELR5pvMzbuedZL/OyfMC9wKCgCTwYPyhAL9Zp+6OU1IoutMxxp3vnv8/KMB2CGonvrVgywHmYca1kPqANYxaAmKMihk/ZUMC+L8J+cipFEpGRJvj1VdimKp1mzNwsbZDqSuzJpB3VFGI4XzkOwQh/i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dZ+dw9Hx; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dZ+dw9Hx"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3D351655;
	Fri, 11 Sep 2026 04:40:23 -0700 (PDT)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B8473F59E;
	Fri, 11 Sep 2026 04:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789126827; bh=y4Y8gWkVV/nPSXn6MMWRiSH8kJFJ9j4ufvHdYDsdIUM=;
	h=From:To:Cc:Subject:Date:From;
	b=dZ+dw9Hx6GvSXpNwd4/tBgswYE6lZiraGKCdA+o6BmLppWPpRfty50GXiuDedWg8u
	 n9FT7+RZNMH2a9o5LTU2NIqwSUXda+rYksh3hXpwNMM2oD83NkbPdLiGXxqybvkGzj
	 OIu4yUvtdx2EWAOuufNwiKqParnNKY4F3wOog/I8=
From: Ketil Johnsen <ketil.johnsen@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Ketil Johnsen <ketil.johnsen@arm.com>
Subject: [PATCH v3 0/6] drm/panthor: Protected mode support for Mali CSF GPUs
Date: Fri, 11 Sep 2026 13:40:08 +0200
Message-ID: <20260911114014.79139-1-ketil.johnsen@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is a patch series covering the support for protected mode execution in
Mali Panthor CSF kernel driver.

It builds on the initial RFC posted by Florent Tomasin back in January of 2025.

The initial RFC can be found here:
https://lore.kernel.org/lkml/cover.1738228114.git.florent.tomasin@arm.com/

The Mali CSF GPUs come with the support for protected mode execution at the
HW level. This feature requires two main changes in the kernel driver:

1) Configure the GPU with a protected buffer. The system must provide a DMA
   heap from which the driver can get protected buffers.
   It can be a carved-out memory or dynamically allocated protected memory region.
   Some system includes a trusted FW which is in charge of the protected memory.
   This problem is integration specific and the responsibility to allocate the
   required protected memory from the correct and system specific DMA heap is
   left to user space (Mesa). Panthor CSF driver must be handed the needed
   buffers via new IOCTLs.

2) Handle enter and exit of the GPU HW from normal to protected mode of execution.
   FW sends a request for protected mode entry to the kernel driver.
   The acknowledgment of that request is a scheduling decision. Effectively,
   protected mode execution should not overrule normal mode of execution.
   A fair distribution of execution time will guaranty the overall performance
   of the device, including the UI (usually executing in normal mode),
   will not regress when a protected mode job is submitted by an application.


Background
----------

Current Mali Panthor CSF driver does not allow a user space application to
execute protected jobs on the GPU. This use case is quite common on end-user-device.
A user may want to watch a video or render content that is under a "Digital Right
Management" protection, or launch an application with user private data.

1) User-space:

   In order for an application to execute protected jobs on a Mali CSF GPU the
   user space application must submit jobs to the GPU within a "protected regions"
   (range of commands to execute in protected mode).

   Find here an example of a command buffer that contains protected commands:

```
          <--- Normal mode ---><--- Protected mode ---><--- Normal mode --->
   +-------------------------------------------------------------------------+
   | ... | CMD_0 | ... | CMD_N | PROT_REGION | CMD_N+1 | ... | CMD_N+M | ... |
   +-------------------------------------------------------------------------+
```

   The PROT_REGION command acts as a barrier to notify the HW of upcoming
   protected jobs. It also defines the number of commands to execute in protected
   mode.

   The Mesa definition of the opcode can be found here:

     https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/panfrost/lib/genxml/v10.xml?ref_type=heads#L763

2) Kernel-space:

   When loading the FW image, the Kernel driver must also load the data section
   of CSF FW that comes from the protected memory, in order to allow FW to
   execute in protected mode.

   The FW uses the same protected memory buffer to execute protected jobs from
   all processes on the system. Note: This buffer must be provided by a user
   space process with CAP_SYS_MODULE though.

   In addition, when a CSG (group) is created, it must have a protected suspend
   buffer. User space must provide this buffer on group creation if it want to
   execute protected jobs.

   The required size of both these buffer types can be queried. See
   query type DRM_PANTHOR_DEV_QUERY_PROTM_INFO.

Design decisions
----------------

The earlier versions (RFC and v1) relied on in-kernel allocation of protected
DMA-bufs, both for the required FW memory (system wide), and per group
suspend buffers (per process). This is no longer needed.
Starting with v2, this is now changed and it is user space which is responsible
for supplying these buffers.
Only a user space processes with elevated privileges (CAP_SYS_MODULE) is trusted
to provide the system wide protected FW memory. This only needs to happen once
per boot, and is needed before any non-privileged processes can make use of
protected rendering.

The Mali Panthor CSF kernel driver will handle enter/exit of protected
mode with a fair consideration of the job scheduling.

If the system integrator does not provide a protected DMA heap, the driver
will not allow any protected mode execution.

Patch series
------------

[PATCHES 1-4]:
  These are refactoring to aid the implementation of the protected rendering
  feature itself.

  * drm/panthor: De-duplicate FW memory section sync
  * drm/panthor: Minor scheduler refactoring
  * drm/panthor: Pass drm_file instead of panthor_file
  * drm/panthor: Don't allocate protm_suspend_buf

[PATCH 5]:
  This patch implements the logic to handle enter/exit of the GPU protected
  mode in Panthor CSF driver.

  Note: To ease the handling of faults from protected mode, only a single CSG is
        allowed to execute in protected mode. It must be the top priority one.

  * drm/panthor: Add support for entering and exiting protected mode

[PATCH 7]:
  The final patch exposes this feature via the uAPI and adds the necessary
  handling/use of user space provided protected memory.

  * drm/panthor: Expose protected rendering features

Testing
-------

1) Platform and development environment

   Any platform containing a Mali CSF type of GPU and a protected memory allocator
   that is based on DMA Heap can be used. For example, it can be a physical platform
   or a simulator such as Arm Total Compute FVPs platforms. Reference to the latter:

     https://developer.arm.com/Tools%20and%20Software/Fixed%20Virtual%20Platforms/Total%20Compute%20FVPs

2) Mesa:

PanVK support can be found here:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40044


Previous versions
-----------------
v2: https://lkml.org/lkml/2026/7/12/369
v1: https://lkml.org/lkml/2026/5/5/1523


Highlevel changes
-----------------

Changes in v3:
- Dropped patch "drm/panthor: Explicit expansion of locked VM region"
- See each patch for detailed changes

Changes in v2:
- Conceptually similar to v1, but heavily reworked to address fault handling
- User space provides all protected memory buffers (no in-kernel dmabuf alloc)


Boris Brezillon (2):
  drm/panthor: Pass drm_file instead of panthor_file
  drm/panthor: Expose protected rendering features

Florent Tomasin (2):
  drm/panthor: Minor scheduler refactoring
  drm/panthor: Add support for entering and exiting protected mode

Ketil Johnsen (2):
  drm/panthor: De-duplicate FW memory section sync
  drm/panthor: Don't allocate protm_suspend_buf

 drivers/gpu/drm/panthor/panthor_device.c |   1 +
 drivers/gpu/drm/panthor/panthor_device.h |  34 ++
 drivers/gpu/drm/panthor/panthor_drv.c    |  61 ++-
 drivers/gpu/drm/panthor/panthor_fw.c     | 274 +++++++++--
 drivers/gpu/drm/panthor/panthor_fw.h     |   6 +
 drivers/gpu/drm/panthor/panthor_gem.c    | 106 +++--
 drivers/gpu/drm/panthor/panthor_gem.h    |   7 +-
 drivers/gpu/drm/panthor/panthor_gpu.c    |  47 +-
 drivers/gpu/drm/panthor/panthor_gpu.h    |   4 +
 drivers/gpu/drm/panthor/panthor_mmu.c    |  35 +-
 drivers/gpu/drm/panthor/panthor_mmu.h    |   6 +-
 drivers/gpu/drm/panthor/panthor_sched.c  | 567 +++++++++++++++++++----
 drivers/gpu/drm/panthor/panthor_sched.h  |  27 +-
 include/uapi/drm/panthor_drm.h           |  85 +++-
 14 files changed, 1033 insertions(+), 227 deletions(-)

-- 
2.43.0

