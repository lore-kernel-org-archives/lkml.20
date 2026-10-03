Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FCB38A718
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.232
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018758; cv=pass; b=cSwOGt0IhI1F4qinxqyzu4LkVwj1PPmSO6+RUY/h/iP/MOHlvMgBizq+/x5Mda0auh0VPZ35pZkB9saIGTfO4aQDw++u7gV63YzKHAawGcBsajy2mZekNpETg/oVF5042cdjY+DmJA5b1ZNGIvx0KMV2x6Vuv62w8Ly5PDcFqEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018758; c=relaxed/simple;
	bh=mxCf2cabQDlLkB9pWaY54mBaONIn3Z+oVtSuAPQOhSw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ge4BfC6uy5U+zB8d0pZ7sIoTuNFQDNPh6Ain9+umObf+u8V6LZDadJp+3g2RT2hHGs7MerSlG0O7FyyP40762LdXkn5VIAneq1IWZxT4nCOALHW1DWXbOFJhG/ovy+sTUhYuzpB8mct6u7T1jG7+F/V7y8dbikXqjsUpLTdHXvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nb50KX9N; arc=pass smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nb50KX9N"
Received: by mail-qk2-f40.google.com with SMTP id af79cd13be357-93cc3f1b1a4so6593385a.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:12:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791018755; cv=none;
        d=google.com; s=arc-20260327;
        b=qc5XyWZAn5Itt2uh3naTQPpOINgJbnymuP4uCzo9lWTuO7T5oHAC+hI6dY7sY6ceuH
         8/loanHFXRFHj8DVWU65WbvsH1SipHCG70TdXL+Bj+j+ntLf7QmBM2lhWhiCBvpY1AJr
         TQZBk1VHBNuirTyR135i/z7NrcqwYEmzV3EEZ5aMBIcMCBOAwA9k9UCwH12qgUxn1NUK
         mZiXbWcXF6iWIQWz8zUB5DJx2JTo+9r5eknI1a3HvszUdpPHfQ/6Hn/LwwK0HL1kewkn
         qSiZuXk8cNdK7AgpdtZ3QoUfwVPIAemm6/HMFM2h5KTYB8X2BSp7/xrwjeBnQR75juSu
         s8BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=rc52rTiI8uQA9DrxYgPOUqnoJH9/KQrLX2hPjTUlVqw=;
        fh=UrtBplWJM7DPh6u20r26w0ZZ3juH70oo/OD64BBntVU=;
        b=Bf+a6KwChzyx+8BPOz/DnBqY/ZIViC0BrdrAabZ0PJcn2fqvyMyN4AvHQq6bp8TqwM
         KZFXguzlESt+szh5+d87HvAwhUHLvzbCmLR+Omn4+4rhNhy6yPQlU+8mg+49UJV7gRUZ
         2mqSfhw3+Vx2tXE7f6Fc553a3R841SxMuuX3mxdarrXKnCUbOuJo40gdfyKtpAwC3yI0
         SWc3nBjAAadAPVIUiLPepuQ5O4mHZMIyKGmYSVpmBbZGkVB8/6jZP0rdW/nFa0M3pYSK
         J0a4bGsER0fdWjdvG9CUIZpygh9Y17uMiJwEl5Suj2Y57ebk8SbYzHXn/2pTHfVb3gk5
         52BA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791018755; x=1791623555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rc52rTiI8uQA9DrxYgPOUqnoJH9/KQrLX2hPjTUlVqw=;
        b=nb50KX9N4jArJmutq1nMTnBKP0OBceBgvG1Z9icQBuXcztH441TVG0rkndWWcxKo1z
         oIlTOT+hzT8w7NIdT+K8rA4iXwPLzD+eQgX6qsjA/IZCLQn+ZsZjpXPa/ZgVHJwdAIX8
         4xI/Q4BKz4kh+UPqke8Secm4C9y6S7ZSCv5zZqnfAQHlEV4iikZvehe4WXxBKwdW9NG5
         6gmzCmyNqgJ/0kRZuFyw1FMKUiPr7BsoigLtaNUHeiHXMGn6dU/gNZYcn78yQmM+qh8i
         ilzDR83hOkaxOPWCFYjRhGEAq/KFLYbVJCm0sYAfUe9+QpQTozS2bYjXSe362kOrF8jn
         Dj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018755; x=1791623555;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rc52rTiI8uQA9DrxYgPOUqnoJH9/KQrLX2hPjTUlVqw=;
        b=zi65FzM3EbeSf24729H2YaRHCdb9qJxzwLfmlFLK9vSU8ubGwgONHMwdP0DUlwzyUS
         DBSvZH50aIKu294p57V0qO4R5rtcCaJxIuTsUCZ9nucIrGx5TdB2fnkb6vgy1q50bZQc
         S0E2ovrxatnrGVQbU0swI/pWRdn0hRRb+s0LZpGelqghRl+P4atTTzBIpu14pxWQReC7
         a5Sfv321+zEtq9Zjf+gDuMpYjwnMHUafsAF4ufNTneJcgAfvSPM1Js7eDL9H2rzxUe+W
         ALkCiLLVU1NHbGOFdWmLEhiwXVn5lsfOeuVsoaDYRo+i7mYuc11ci3MgU45SnzJwC1ei
         H50Q==
X-Forwarded-Encrypted: i=1; AKwUvBxfHt/kELuWcz87J6FTKLmk/PtX7ZvNaFfe4iivWia1OE12HZn+ipIkj16rH48lc2Ulfj3xeEynnQAeUF8=@vger.kernel.org
X-Gm-Message-State: AFuF++n6k4J7PVInW89QZRrqsKKR7l/7t3JdBt9RfV/gXnaXdwBL0UOG
	2b2kckdQrelRRDM8NAjfCjgPjbgePXNVkCXOrpI/3zVAUHrjXyQChH7ecrzUox7bcK4mPbB7kuQ
	OfH9OSFrsNhBcg6WnnhA+6m80tuG6HX6WMKqCOrA=
X-Gm-Gg: AYBFou2ruRB6RYhMs+VxXTH3U9N04QrN1oV8ivXLhhhxZlGOP/rWS2RFzcx+iZoGZw1
	guyBcyH3pg52TnDMZgKgqL6w5CFc0sYwli9esuvvFISq/lC2v26oroViiRNb/XjPwFwKMcvdV/q
	sRa4UhJ1NaOYAjiBuhmYagQzl10/6A9YjiWuRzspIdrVNRhO3lvoDaoFvvynn7xG3zj/M7C3zRG
	wkpwUQDs6K1V8py3x6aB/O6sN8wwgZyjc+2gKoT3Vy0k89Qi8oLPehFC2YGILwvxDjK3FHN8991
	mvfQX4tsXF8NSHV7M5+a3yuiLvcJIz0db2igkeunOCCaMa0D1SM132bgikYFt3ULv3NZAsKU1lo
	MRUPPFkW5aCjPzowb/vemNGpyN93JQAubGY2EDy+9RqeFq3Hy8zche7WfHGpnHplMmQzyTaIotA
	==
X-Received: by 2002:a05:620a:318a:b0:93e:5060:f961 with SMTP id
 af79cd13be357-93e50610185mr385692785a.6.1791018755446; Sat, 03 Oct 2026
 02:12:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 3 Oct 2026 19:12:23 +1000
X-Gm-Features: AclHuK9nt0T1kXPiBAGDw1JCyLvcJB04uj1AKTxmnsRHF8j7pv4TbOfJFQfqamM
Message-ID: <CAPM=9tzVwVzu5NsshoL0Jgjs3aSiN_aE44H+H54+FNE1F2GKpw@mail.gmail.com>
Subject: [git pull] drm fixes for 7.3-rc6
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Live from Brisbane airport, it's Saturday Night drm fixes. The misc
fixes tree didn't get a PR this week, so I'll probably have that to
you when I see it, there were a few patches in there.

Otherwise amdgpu is the main act, mediatek has a guest spot, and
xe/i915 bring in a fix each.

Regards,
Dave.

drm-fixes-2026-10-03:
drm fixes for 7.3-rc6

xe:
- keep VF LMEM bar size low if no VFs enabled

i915:
- Disable VRR DC balance by default to fix timing issues

mediatek:
- Add missing IS_ERR check for ovl_adaptor platform device
- Fix VID_DOWNSAMPLE_CONFIG register offset
- Fix pdev reference leak in mtk_drm_bind()
- Fix runtime PM leak in mtk_hdmi_ddc_v2_probe()
- Fix ovl adaptor platform device leak

amdgpu:
- dc_state_create_copy() fix
- HDMI RGB limited range fix
- eDP ASSR fix
- DCE 6 fixes
- DCE 8.1 fix
- SI DPM fixes
- Reset fixes
- Workaround for multiple SDMA entities with DCC
- PWM backlight fix
- GPUVM fixes
- Switcheroo fix
- Error handling leak fixes
- GC 6 unload FW leak fix
- SDMA 7.1 fix
- DML frame size limit fix
- RGB vs YCbCr 4:4:4 fix
- DP MST fix
- DC Power module fixes
- MacBookPro14,3 fix

amdkfd:
- SVM fix

radeon:
- sparc64 fix
The following changes since commit 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e=
:

  Linux 7.3-rc5 (2026-09-27 13:55:01 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-10-03

for you to fetch changes up to 9c979cba980522f044ea2b14d8cab87ea3cddb56:

  Merge tag 'amd-drm-fixes-7.3-2026-10-01' of
https://gitlab.freedesktop.org/drm/amdgpu/kernel into drm-fixes
(2026-10-03 09:32:49 +1000)

----------------------------------------------------------------
drm fixes for 7.3-rc6

xe:
- keep VF LMEM bar size low if no VFs enabled

i915:
- Disable VRR DC balance by default to fix timing issues

mediatek:
- Add missing IS_ERR check for ovl_adaptor platform device
- Fix VID_DOWNSAMPLE_CONFIG register offset
- Fix pdev reference leak in mtk_drm_bind()
- Fix runtime PM leak in mtk_hdmi_ddc_v2_probe()
- Fix ovl adaptor platform device leak

amdgpu:
- dc_state_create_copy() fix
- HDMI RGB limited range fix
- eDP ASSR fix
- DCE 6 fixes
- DCE 8.1 fix
- SI DPM fixes
- Reset fixes
- Workaround for multiple SDMA entities with DCC
- PWM backlight fix
- GPUVM fixes
- Switcheroo fix
- Error handling leak fixes
- GC 6 unload FW leak fix
- SDMA 7.1 fix
- DML frame size limit fix
- RGB vs YCbCr 4:4:4 fix
- DP MST fix
- DC Power module fixes
- MacBookPro14,3 fix

amdkfd:
- SVM fix

radeon:
- sparc64 fix

----------------------------------------------------------------
Adrian Betschart (2):
      drm/amd/display: Default HDMI RGB output to limited range on CTA mode=
s
      drm/amd/display: Try RGB before YCbCr 4:4:4 in stream validation

Alex Deucher (3):
      drm/amdgpu/gmc12: properly pass flush_type to gmc_v12_0_flush_vm_hub(=
)
      drm/amdgpu: drop userq callback assignment for sdma 7.1
      drm/amdgpu/gmc12.1: properly pass flush_type to gmc_v12_1_flush_vm_hu=
b()

Andrew Martin (1):
      drm/amdkfd: Fix always mapped range mapping to all ACCESS GPUs

Arthur Heymans (1):
      drm/amd/display: Preserve eDP mode on initial ASSR failure

Dave Airlie (4):
      Merge tag 'drm-xe-fixes-2026-10-01' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2026-10-01' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'mediatek-drm-fixes-20261002' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-fixes
      Merge tag 'amd-drm-fixes-7.3-2026-10-01' of
https://gitlab.freedesktop.org/drm/amdgpu/kernel into drm-fixes

Francisco Beltr=C3=A1n Millal=C3=A9n (1):
      drm/amdgpu: reset VI ASIC on MacBookPro14,3

Guangshuo Li (3):
      drm/amdgpu: fix IP instance memory leak on kobject add failure
      drm/amdgpu: fix ACP MFD device leak on init failure
      drm/mediatek: Fix ovl adaptor platform device leak

Haojie Li (1):
      drm/mediatek: Add missing IS_ERR check for ovl_adaptor platform devic=
e

Hari Mishal (1):
      drm/amd/display: guard dc_sink dereferences in MST mode validation

Imre Kaloz (1):
      drm/radeon: Read the VRAM VBIOS signature with readb()

Jesse Zhang (4):
      drm/amdgpu: support non-guilty job save on ring backup
      drm/amdgpu: fix empty fence backup and replay intervals
      drm/amdgpu/gfx12: set KMD_QUEUE for kernel gfx queues
      drm/amdgpu/gfx11: set KMD_QUEUE for kernel gfx queues

Jiangshan Yi (1):
      drm/amd/display: check dc_state_create_copy() for NULL in dm_suspend

Julien Stephan (1):
      drm/mediatek: mtk_hdmi_v2: fix VID_DOWNSAMPLE_CONFIG register offset

Marcin Bernatowicz (1):
      drm/xe/pf: Keep VF LMEM BAR size low if no VFs enabled

Michal Wajdeczko (1):
      drm/xe/pf: Refactor VF LMEM BAR resize helper function

Mitul Golani (1):
      drm/i915/vrr: Disable DC balance by default

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: implement workaround for sdma dcc corruption

Ray Wu (1):
      drm/amd/display: map PWM brightness through custom backlight curve

Sasha Levin (1):
      drm/amd/display: Fix sanitizer check for the DML frame size limit

Simon Polack (1):
      drm/amd/display: Fix stale replay_events after mod_power stream remov=
al

Theo Andersen Carton (1):
      drm/amdgpu: skip the noirq suspend reset for a switcheroo-parked GPU

Timur Krist=C3=B3f (5):
      drm/amd/display: Fix fast updates on DCE 6.x
      drm/amd/display: Fix fast updates on DCE 8.1
      drm/amd/display: Mark DCE 6.4 as not APU
      drm/amd/pm/si: Check AMD_IS_MOBILITY flag for PPSMC_SYSTEMFLAG_GPIO_D=
C
      drm/amd/pm/si: Fix updating clock limits on AC/DC

Wentao Liang (2):
      drm/mediatek: Fix pdev reference leak in mtk_drm_bind()
      drm/mediatek: Fix runtime PM leak in mtk_hdmi_ddc_v2_probe()

Willian Oliveira (1):
      drm/amdgpu/gfx6: fix firmware leak on teardown

 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c            |  13 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   8 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  37 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |   9 ++
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c             |   4 -
 drivers/gpu/drm/amd/amdgpu/vi.c                    |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  13 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  11 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_backlight.c    |  92 +++++++++++++---
 .../amd/display/amdgpu_dm/amdgpu_dm_connector.c    |  24 ++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   6 +-
 .../amdgpu_dm/tests/amdgpu_dm_connector_test.c     | 117 +++++++++++++++++=
++++
 drivers/gpu/drm/amd/display/dc/dc.h                |   1 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |   2 +-
 drivers/gpu/drm/amd/display/dc/dml2_0/Makefile     |   2 +-
 .../dc/link/protocols/link_edp_panel_control.c     |   4 +-
 .../amd/display/dc/resource/dce60/dce60_resource.c |  13 ++-
 .../amd/display/dc/resource/dce80/dce80_resource.c |   2 +
 drivers/gpu/drm/amd/display/modules/power/power.c  |   2 +
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |  39 +++----
 .../gpu/drm/i915/display/intel_display_params.c    |   4 +
 .../gpu/drm/i915/display/intel_display_params.h    |   1 +
 drivers/gpu/drm/i915/display/intel_vrr.c           |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  17 ++-
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c         |   4 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h        |   2 +-
 drivers/gpu/drm/radeon/radeon_bios.c               |   6 +-
 drivers/gpu/drm/xe/xe_pci_sriov.c                  |  30 ++++--
 34 files changed, 399 insertions(+), 87 deletions(-)
