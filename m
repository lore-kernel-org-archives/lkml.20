Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672483;
	b=uQdbWuKL79TAkDwndZjEGzLlSevG0FmOKWct4JmZ4lwNQeM6VTp9ukRAzMqKXxzPKGgg
	 rRgzjk9FePSrduQesNOCXudBEdBfnB4BvstJtlEtzUFwo/N0gKfoPlcZOBk8F3eLyWDXg
	 c7/176DHaEasl1W84j6dLbgnkxtYFQOwv7pVEe5VsiSlUbT5BGjAP/8yvGyb+diWMGXUA
	 6O82/F1g0/kSsFa73sqKuv20Cj2eiIOQ/xc5iCr7wSahKLv/xxyf5/V8un3QKo5AK5Zb7
	 e9MG1joRd4IrvxEe0wAecfan0yEZ6+2owtP/rsAlBvyT84qjiCcf2jSpK+3ROFOoTIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=547AYHesvWuVRdGCIewRd+N2Li/XBFq8XpI3l0Qzhfk=;
	b=Pdwnq2WJU9+NMG3BZpultGXB3mRyMqmZ6I67bMihhOvtYkasxKWU8U0z1OjcksYU86Rg
	 7LmDxoxKNE2/uLN2Oig9WtNpGItfaYjT+w+aXco90ogvrG6LqtVEGcykN0mLmQxf42bKx
	 jzUSUWo2IlvnrUl4lTmLrdpeeBaYmsL0VyryP9V3v9+dElLp8FORuwtJp7yBDtgabEPo8
	 7eBU0hQpKakaHux5bBDlrZf5LVIUMNDgH5Nm505x2ls9xqaDcfV/DcZPQNwZQRvfkNXjX
	 YZM85jjgAeNCM/wwRimLdytoeZE0ivWHzuF6aMmmoyXl8PLBC5SoHv2u4sRurkMOAOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YvgdC3Sl;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0EC606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F0EC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YvgdC3Sl
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so5973898eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794672482; x=1795277282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=547AYHesvWuVRdGCIewRd+N2Li/XBFq8XpI3l0Qzhfk=;
        b=YvgdC3Sl06c5qLDneQThCyVbVmbW7zoeqyvL5D+M9KKgFoajBZBXSK2EMmrk4NOG5/
         yvCl310GqDC9LZ6ED1jLwce1aFeAYkqot15Ff+om0sICZ+/ru8OO2oAxXEX7FZT/CLJ7
         kJQlcF8QPJ9SWXmcWxwE4RYDY2gPEvz/d8fziBPsWfzIgBmPR2GfapD6ZvUAAFOJ4oPP
         VTBNjN8L8aoROkNbxvOIQOuEWMDLMq2Q2aWbJiAi7O2q6x76vqYz694Le0MwKGktxtxc
         zUw9Z7iDKhiY+1WIkYYBCO23zCaOAbuZkd0vh7eAAbi/Y19F2AJ9seTO/HiA9AmWm7nZ
         QeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672482; x=1795277282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=547AYHesvWuVRdGCIewRd+N2Li/XBFq8XpI3l0Qzhfk=;
        b=ld+mgVOamkfENZ29wfvybqxewA1yfeuzvDjg9ghpHsUG5GeHOeWGHtsZP/Jd+XPoic
         GQHF0MeD/WdzQjmpuzLVW7KCRrxm530Vc7+grxu0SCMdqW6xLM2AhhMd6Ua/4zzFgQ9e
         plqeq4LKKHonxUVjbQyf6cZFcRWo4IPH3YC0EtNf2DvM0Zm8WYTIob4gQ1elS+9wz4I3
         X4+rIJjkks9OQIEv6Q7btrmXN4mFy+DwCh7ONq+FSlHSAkCAtEj7cmnE7RA2CXWlNbRt
         IsFYHVGVfGAJZ6OX7w5aNSdxDvIEx6wwbBSYYTl7g2R+4ir6Pe9Qx5sTj0LB/6WY2Fh9
         M1nA==
X-Forwarded-Encrypted: i=1; AL+hErHtS3ve1I0jvxcGC0UCYOYjTaV5F9b0SGd6AY5JA9c2gRlRpJqqm5/0gLWUW9NwkSz11jUD/Rickgx8vZk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HMpxWCiqz4BIp//YAcR4DPs+GMpKbv924fZvTepSJXGWI+A7O
	hJSL9bRVL+WRcFGrhOiDUanViHLwF5G3/hi8T1x79tzdGJHGi4dPIig=
X-Gm-Gg: AYBFou3yIgJnZvEy1UItfQM++JCLIuD3y3ufEfr6tVNKFI82pYhoU8Nk3EjgnaDVNlu
	Bi47fsgG9dL36R/lh4EIyx8aQxu+uAjcgFb6Gf7NLlBvUrwhfN0pPEfTlT10BU9qTma2hwaUdg0
	Figu/apqPNJElDfyd7nfmVYlqgYXHe/mrSd5kAgccolyzuV/PAFyD/JzFiKfmHvg3mbtpuZf0Uv
	fcInyWWwEDwNvZSLd6bfCw7NMv+39Q6Rhv0Pbn1hzAAvEksURdz1S+CxExqhkUymJ6GSTfUY0Gj
	uHVmR1aFvt0kRSPCvFVSWRd5KhPP9h/MtMBgl/ZHXVacSOy9V4kD4hQwzhX8Z2ZqHTrp9D8GatL
	hhafJ/akLosqwQpgs4HrwmHCpSP4tPVgxQvAtOJJE+/SGW3mKuwAHTn9bLPrYbULPsCUC+78Cd1
	rMTzr7DEemXOacd8pP6+ItDDWpgpz9IXdxspot4Ezg8SG71ucLd2FfBafV7wN4b9HAcfZMtb4FP
	t3/c2X6wBhIbUArMfZjMZf0PqFlrYv4vnb+ZRRN8WeyQLW049lPniVm2uCG8e2RlimokvKWIywU
	oUJeLzTGzNxUiAjW+YzISQvUJIRgebEb+r8VEznRNVzpbPpNKibxyDv8awKQ9LXZQQ==
X-Received: by 2002:a05:693c:8212:b0:36f:550f:bb0d with SMTP id 5a478bee46e88-37963953f17mr6197803eec.5.1794672482123;
        Sat, 14 Nov 2026 08:08:02 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.127.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm17567582eec.29.2026.11.14.08.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:08:01 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andre Eikmeyer <dev@deq.rocks>,
	linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH v2 00/12] Fixes for apple-gmux and runtime support
Date: Sat, 14 Nov 2026 11:06:24 -0500
Message-ID: <20261114160731.3756-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes apple-gmux on T2 Macs (2018-2020):

  - Fix interrupt handling
  - Automatically turn on dGPU when a external monitor connects.
  - Fix base register read/write
  - Fix power handling
  - Improve documentation
  - New module parameter to toggle boot GPU.

It also adds vga_switcheroo runtime power management for T2 Macs, built
on gmux power control, so the dGPU is powered off automatically when
idle and users no longer need to toggle it manually.

Changes in v2:
- Check the discrete pdev config before GFX0 restore (01/13)
- Don't save bridges state when state is VGA_SWITCHEROO_OFF (01/13)
- Fixes discrete_pdev initialization (01/13)
- Used PWRD on 15,1 and 15,3 aswell
- Add quirk to 0x7360 PCI id aswell (02/13)
- Add 15,1 and 15,3 and its gpu's aswell
- Removed ignore_access code (02/13)
- Initialized val in read functions (03/13)
- Fixed permanent mutex block on failure (03/13)
- Only resumed when pm_runtime is available (skipping on iMacs) (04/13)
- Corrected ordering of interrupt_work (04/13)
- Notified drm about hotplug change (04/13)
- Checked if EFI_RT_SUPPORTED_SET_VARIABLE is available before writing
  gpu-active (05/13)
- Wrote gpu-active on shutdown aswell (05/13)
- Dropped boot-gpu parameter (06/13)
- Checked if vga_switcheroo has been initialized (09/13)
- Added additional pci_is_thunderbolt_attached check to
  amdgpu_device_supports_gmux (09/13)
- Removed duplicate check (10/13)
- Renamed gmux_off to runpm_active
- Checked if adev->dev exists in dm_dp_aux_transfer to fix null ptr
  deref (11/13)
- Removed GMUX specific code (12/13)
- Initialized edp_sink_present in testing code (13/13)

Link to v1:
https://lore.kernel.org/all/20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com/

Andre Eikmeyer (6):
  platform/apple-gmux: Write switch state to EFI on MMIO devices
  drm/amdgpu: Add Apple GMUX runtime PM support
  drm/amdgpu: Catch register access while GMUX keeps the GPU off
  drm/amd/display: Refuse DP AUX while GMUX keeps the GPU off
  drm/amdgpu: Skip AC/DC notification while the GPU is runtime suspended
  drm/amd/display: Skip panel power savings on eDP links without a panel

Atharva Tiwari (6):
  platform/apple-gmux: Fix power for MMIO systems
  PCI: Disable pcie port on specific amd devices
  platform/apple-gmux: Fix MMIO interface
  platform/apple-gmux: Fix Interrupts for MMIO systems
  platform/apple-gmux: Add check to detect FSS
  platform/apple-gmux: Add documentation about iMacs

 arch/x86/pci/fixup.c                          |  43 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  61 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  48 ++-
 .../gpu/drm/amd/amdgpu/amdgpu_reg_access.c    |  24 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  14 +
 .../display/amdgpu_dm/amdgpu_dm_backlight.c   |   3 +
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  19 +-
 .../tests/amdgpu_dm_backlight_test.c          |   1 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c           |  19 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h       |   1 +
 drivers/pci/pcie/portdrv.c                    |   2 +-
 drivers/platform/x86/Kconfig                  |   1 +
 drivers/platform/x86/apple-gmux.c             | 365 +++++++++++++++---
 include/linux/apple-gmux.h                    |   1 +
 include/linux/pci.h                           |   1 +
 16 files changed, 534 insertions(+), 72 deletions(-)

-- 
2.55.0

