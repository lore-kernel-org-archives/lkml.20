Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793997421;
	b=0JxYs1eN+F/eXoaqA5wvtbosl0KgdLLS9Lff6FJf9HYlY/vCOm4tabm0I48tNRSOHsaB
	 nXU5M5vdRNz08cTZEcm1iSh6r+EEEg5Tq56tMt9Rly7LYo1gkUN/QK2bv2Zz+Ca+5RdY8
	 uAxCCEHYLBdug/crGb3UwL3OQ9VOmpThE4Wk0Ycwr36UsvfYfaE7BJ/kRh/hRrOJM7OL3
	 APNBhINjgT3kCqI9Ohrnq4F/9Jtug03aXr9ouI7j6Crg4ckG53f8Uf3ADp1vRz7GzVZzb
	 lCtwlxp0cK6/3c/whBqYCKM8VrHbpsP/kkQ99flU8Yf0QLjJnK5nOCs5lBsgcQzbBRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793997421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=fQQwGWUF3g0/8cOPjoVHS0rKrLN6G5Et09AmY1qnp+4=;
	b=3beJ9V4bJj7N0Pc3+yA/wSTtqzvvCfFFHyuNbyLk5r2QE+Q+yqgAvD7JndHdH/EBummg
	 hDIGwFqwFEFnnm8MwY9f7bLPyekhgB42ayUcB457PvfCGKQr4TGRSXn02R3NpQlvMh18v
	 pimtQdi4HRRQ+A4wJXbR5jTucni4mvq7vLTMTew+bF9kb150qtKMBMVc0R7r+feItFsIC
	 Pg3xULmjncKD/7j1scqRgojrUdQK1rPvi4bzWFVwRXyoitA2nSkyZs+QxzZmqIR1oOVSm
	 fqkOM+sNeNfgFT0JW3F6yW7FNUaFsi87585PBtQ0Sfc3I4NL9OTxjsvzKcx3IkwMwUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWe8vg2A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0308B606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0308B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWe8vg2A
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93e6eb77f0bso95280085a.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:37:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793997420; cv=none;
        d=google.com; s=arc-20260327;
        b=fJ6WpJF0gH3m6ByeeWF3pp2XnsEsWT5hISU1k2tWo2LDMwDhf9zqo5BMaxiwrIHxpB
         Qvwr9zeMzUcl+cYP2zR1E3qnA292Ow4WKBn/GyhRCQPqu6sXCAqdq3DPjJ4Nbu67N822
         AHMGp45pAdjk6ckD8LG7wMlwIUpx4Jb+nd9+gy3UxaGsPUBtCbHYv/+ivBA4JqVF7+vv
         wgNchlpbH0fdSWau3ByaVK/jvPLbx5ZBvFbECT7zYTa6RXpOSBZ5dce+EYQP0zeZbBZB
         dbR+LNhoejhVXE9BLKUdWGsOr8dSCASzwRCs/fLPJwA6ngWMvAB2IXRfUMd7kzTVy+m2
         okcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=fQQwGWUF3g0/8cOPjoVHS0rKrLN6G5Et09AmY1qnp+4=;
        fh=dstZvROKM1XYd1EH8GDppddGFWQnhUDH8A01VJyEZqg=;
        b=kafkND3usNB2wB7L7+2PicZxlwpahmvAMMuXSkgWCRiYwJuCyjD8Kddp8+DXL2aSdc
         xAJIrZoHBnbijlcZLvbNeOcMGSVmPZTsxlewfiS3KV0u4TgBB7znQUbRC9Xw1IKbDQsQ
         8N7cnzsvmqb00N6Zy0glSHkJWWsY5FeGvCYU0QyDpDvbZ4CLrMsgPTeRWceElCeYQuVl
         EV+6WKRCE5CzsJzMLkCoYxI4R4pcU7d9cctzq98sOnf8wpluPMiLrLrZNV5PrEhKISxu
         P79RJxDhoRWaw+GiRziP2GmzEkPWsawA5XLe7TGxVmoxoXDhp7wa7suJtV6ztCTNpZAL
         DK7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793997420; x=1794602220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fQQwGWUF3g0/8cOPjoVHS0rKrLN6G5Et09AmY1qnp+4=;
        b=eWe8vg2Ae+FgiYv/ivL+1DD6s5CTbWZywJq8Ks+NrKehARAXuL2wF7/1C0SmtOusPq
         23WmKpecb45NN1RLZ7gVp8qXLmtDV8BKNt3VZMM8sbVnBc6+a9dpf+gaBDGGTimqmjWL
         juux+FjBas0Cnq8WDODcVeWUh0vCV22fp39OyyInrg4j9nSADdayiwfM50/Pn3qx7WaA
         bsPJNoo8FJKi82gQnmQ/6bQPzDGOvpRrmKuM8OHBueMe9G7yBRawlK1NNN770CWZRvAJ
         OemgxrXGLo9NBxO/uBhG7vyXxLna9wMnIWkBaiuhrR84KDkoLFka3/bnzZtQD0TvYhzi
         uhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793997420; x=1794602220;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fQQwGWUF3g0/8cOPjoVHS0rKrLN6G5Et09AmY1qnp+4=;
        b=IukD/tIQrGlBMIDV62G0HLflTZaLyYdbv1COjbcex4nN3xe7SMHajZB/BF2i+18Rpy
         MFUPdF20Hu3qrnmQ+zrtNGhgKsgZFtM83f/CLhchtk0cd9DKeSKL5yu+jWqLFa3coYXW
         w7tTfWvSbIhnHIC1pT8ifiySA85NNVfrBME21G+0cFAm52I6BKXzAEdlH3b1gJR7ciA5
         cKwP1dXS63++ypVMmDR2IluoN99HBlVP9Tp7Le3asdhq6YM8He81zCnYolhisIcXweph
         ROkE6kBwmfzSOeR0gExPZ8mg0PW2pmog94snAlEPQOTU7LxWw/1encxc3vGmg8CeiGNm
         OCMg==
X-Forwarded-Encrypted: i=1; AKwUvBylBbVanPt/x8/eXIZrCLX6n7YvD9VPU/tmBwVPV6SIB5UX97elBffeqcCm3GA/ZK4MOfSUFZhbzRATp/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+y1aatqnwQ5Bbt/etiqoDPbuugWqXDrYO+MGO8rL0Az0c7sE74
	VYoGN6JIEcrwDsMGkieLnyCrmUKCHZxdcpPz1CP7a/GvXJ0lHpZaFNFpharOzmD6OBF3bGMK/Mt
	SnoGX1GrKnANHZFjNluRfF4n/8sKZHto=
X-Gm-Gg: AYBFou2islLuMGS+XvzQzP8Br/jJhojWo7jPzXUso1wBfPuw0oaAaDUvW/U/lz0wOD2
	jsrWVHyS7rdy9lCv3IH9scALzfziNxbS34wVjsaIEmF0UvQO48ho6N665IkZLVp5JRG9bJbetop
	hU2xnYOjFOCl2UTXQasbrdvXxRhG6sHzLlXyAC7VpEsRlM+0SbYdEQCzaE5SEgImuS46CVWJxNl
	403g0a4Pqv1olTOlgOkxj2Ucs5NscvF6gB0W6lAesGb9wXh0PVh1G6i9PB6c95/s1yn5i7nmCdT
	yVBVBg1VoNRisdjASgJvV6JQBaDs/gtktDtV9XF/3o9gYFQ46i285qoWBSpXFTfR5hTvImiL3RL
	5aUstEfwowHEDxNEjTOsdA01/IIGWQVQb0Nnk1oqVeTmIfgcKbn2IJ6BkmlbLzslfnq9ZGSXtY1
	QFhhE+ud0tNvMmlU5mXU7doQ==
X-Received: by 2002:a05:620a:2b97:b0:943:faab:a15b with SMTP id
 af79cd13be357-945f3511afamr561119585a.32.1793997419785; Fri, 06 Nov 2026
 12:36:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 7 Nov 2026 06:36:45 +1000
X-Gm-Features: AclHuK_wdGmxrzTQn_UlkE7TQTv7WxNPYWt-xeVVF7zb7NBqA10sotD50lCDnJ8
Message-ID: <CAPM=9tz9wWFUO4Ua84DF3V3GWHSL1k_t2UhShUHS4MkGpXR+Mw@mail.gmail.com>
Subject: [git pull] drm fixes for 7.4-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

This is the weekly drm fixes, amdgpu leading the way with some i915,
nouveau and other fixes.

There should be a bunch of xe fixes, but their tree got screwed up so
I guess I'll send those next week once they cleanup whatever happened.

Dave.

drm-fixes-2026-11-07:
drm fixes for 7.4-rc2

atomic:
- Fix CRTC dma-fence handling

drm:
- Add parsing for additional HDMI 2.2 FRL rates

bridge:
- nwl-dsi: Fix LCDIF handling

dma-buf:
- Fix IOVA offset
- Restore the scatter-list entry count before freeing

dp:
- Keep MOT set between messages when no_zero_sized is set

panel:
- visionox-r66451: Set brightness MSB first; Increase reset waiting time

panic:
- Fix display loop
- Fix line parsing

sched:
- Fix out of bounds entity priority check
- Adjust run-queue when changing priority at runtime

amdgpu:
- UALink fixes
- RAS fixes
- GEM_OP fix
- Parse IB fixes
- CS user fence fix
- GPU reset fixes
- Multi-media idle work handler cleanup fixes
- UserQ fixes
- CRC fix
- SR-IOV fixes
- IP discovery fix
- HDMI 2.2 FRL fixes
- DDC pin fix
- HUBP fix
- SPM fix
- DCN 3.2 fixes
- VRR/freesync fix
- Seamless boot fix
- SMU 13.0.7 fix
- Backlight fix
- dma-buf fixes
- GPUVM fixes
- Move DMCUB back to VRAM
- Non-DC audio fix
- BACO fix

amdkfd:
- Fix WPTR BO eviction fence handling
- GPUVM locking fix

i915:
- Fix GitLab #8991 where tiled displays (LG UltraFine 5K) broken on PTL
- Limit NVL TRANS_VTOTAL.Vtotal skip display workaround to A-step
- Single scaler per pipe number to 1 and disable pipe joiner on WCL
- Add quirk to force backlight type on some TUXEDO devices
- Fix "CMTG: A disable timeout" splat
- Fix intel_vrr_dcb_vmin_vblank_start
- Bunch of PSR fixes
- Static checker fixes

etnaviv:
- Fix NULL dereference in etnaviv_unbind()
- Flush the tile status cache through both the PE and BLT

imagination:
- Align rogue_fwif_hwrtdata to 64 bytes

loongson:
- Fix BO handling in several places

nouveau:
- Map Kepler video engine contexts non-privileged
- Clear use.enabled when subdev init fails
- Avoid running VBIOS twice
- Fix CE channel creation on pre-Kepler GPUs

v3d:
- Initialize job timedout_batches
- Fix cache_clean_lock

vc4:
- Move output fence and BO unreserve out of job_lock
- Power down PYH when output is disabled
- hdmi: Fix scrambling
The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4=
:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-11-07

for you to fetch changes up to 19e67d977d3d4d0c54f03906ef578578190db9e1:

  Merge tag 'amd-drm-fixes-7.4-2026-11-05' of
https://gitlab.freedesktop.org/drm/amdgpu/kernel into drm-fixes
(2026-11-06 10:43:59 +1000)

----------------------------------------------------------------
drm fixes for 7.4-rc2

atomic:
- Fix CRTC dma-fence handling

drm:
- Add parsing for additional HDMI 2.2 FRL rates

bridge:
- nwl-dsi: Fix LCDIF handling

dma-buf:
- Fix IOVA offset
- Restore the scatter-list entry count before freeing

dp:
- Keep MOT set between messages when no_zero_sized is set

panel:
- visionox-r66451: Set brightness MSB first; Increase reset waiting time

panic:
- Fix display loop
- Fix line parsing

sched:
- Fix out of bounds entity priority check
- Adjust run-queue when changing priority at runtime

amdgpu:
- UALink fixes
- RAS fixes
- GEM_OP fix
- Parse IB fixes
- CS user fence fix
- GPU reset fixes
- Multi-media idle work handler cleanup fixes
- UserQ fixes
- CRC fix
- SR-IOV fixes
- IP discovery fix
- HDMI 2.2 FRL fixes
- DDC pin fix
- HUBP fix
- SPM fix
- DCN 3.2 fixes
- VRR/freesync fix
- Seamless boot fix
- SMU 13.0.7 fix
- Backlight fix
- dma-buf fixes
- GPUVM fixes
- Move DMCUB back to VRAM
- Non-DC audio fix
- BACO fix

amdkfd:
- Fix WPTR BO eviction fence handling
- GPUVM locking fix

i915:
- Fix GitLab #8991 where tiled displays (LG UltraFine 5K) broken on PTL
- Limit NVL TRANS_VTOTAL.Vtotal skip display workaround to A-step
- Single scaler per pipe number to 1 and disable pipe joiner on WCL
- Add quirk to force backlight type on some TUXEDO devices
- Fix "CMTG: A disable timeout" splat
- Fix intel_vrr_dcb_vmin_vblank_start
- Bunch of PSR fixes
- Static checker fixes

etnaviv:
- Fix NULL dereference in etnaviv_unbind()
- Flush the tile status cache through both the PE and BLT

imagination:
- Align rogue_fwif_hwrtdata to 64 bytes

loongson:
- Fix BO handling in several places

nouveau:
- Map Kepler video engine contexts non-privileged
- Clear use.enabled when subdev init fails
- Avoid running VBIOS twice
- Fix CE channel creation on pre-Kepler GPUs

v3d:
- Initialize job timedout_batches
- Fix cache_clean_lock

vc4:
- Move output fence and BO unreserve out of job_lock
- Power down PYH when output is disabled
- hdmi: Fix scrambling

----------------------------------------------------------------
Alex Hung (1):
      drm/amd/display: Avoid closing unowned DDC pins

Andr=C3=A9 Draszik (2):
      drm/drm_crtc: ensure dma_fence_ops remain valid during device unbind
      drm/drm_crtc: fix race with dma_fence_signal() in ::get_driver_name()

Animesh Manna (1):
      drm/i915/cmtg: Disable CMTG after encoder disable in hsw_crtc_disable=
()

Bas Nieuwenhuizen (1):
      drm/amdgpu: Check cs flags.

Calvin Owens (1):
      Revert "drm/amd/display: Allocate DCN32/1 dmub memory to GTT"

Ce Sun (1):
      drm/amdgpu: skip RAS error count reset in debug mode

Christian Gmeiner (2):
      drm/etnaviv: Fix NULL dereference on unbind without PPU flop reset
      drm/etnaviv: Flush the tile status cache through both the PE and BLT

Dariusz Marcinkiewicz (1):
      drm/amdgpu: check amdgpu_vm_ready() in dma-buf move notify

Dave Airlie (3):
      Merge tag 'drm-intel-fixes-2026-11-05' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2026-11-05' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-7.4-2026-11-05' of
https://gitlab.freedesktop.org/drm/amdgpu/kernel into drm-fixes

Davidlohr Bueso (1):
      dma-buf: validate the attachment before asserting its reservation loc=
k

Devin Wittmayer (2):
      drm/panic: Fix kmsg screen hang on a long log line
      drm/panic: Accept a trailing newline in panic_screen

Dom Cobley (1):
      drm/vc4: hdmi: power down the BCM2712 PHY when the output is disabled

Erhan Bilgili (2):
      drm/amdgpu: Fix duplicate dependency fence releases
      drm/amdgpu: Report MES ring wait timeouts.

Esben Haabendal (2):
      drm/bridge: nwl-dsi: Cleanup endpoint mux control selection
      drm/bridge: nwl-dsi: Limit LCDIF specific sync override

Evanshenf (3):
      drm/loongson: Fix framebuffer selection in async cursor updates
      drm/loongson: Fix double free on BO initialization failure
      drm/loongson: Handle buffer mapping failures when clearing a BO

Fangzhi Zuo (2):
      drm/edid: Parse HDMI 2.2 FRL rates from the SCDS
      drm/amd/display: Accept HDMI 2.2 FRL rates from the sink EDID

Finn Zeruhn (1):
      drm/dp: keep MOT set between messages when no_zero_sized is set

Hugo Sales (1):
      drm/amdgpu: Clamp the ATIF backlight curve to its 99 points

Ilia Mirkin (1):
      drm/nouveau/devinit/gf100-: try to avoid double-running vbios scripts

Jesse Zhang (11):
      drm/amdgpu: sign extend the addresses GEM_OP(GET_MAPPING_INFO) return=
s
      drm/amdgpu: parse CS IBs at the BO offset their VA mapping starts at
      drm/amdgpu: keep the CS user fence BO in GTT
      drm/amdkfd: use the queue's process info for the WPTR BO eviction fen=
ce
      drm/amdgpu/userq: validate the moved individual BOs on restore
      drm/amdgpu/gfx12: disallow GFXOFF while updating the SPM VMID
      drm/amdgpu: drop the dma-buf reference when a KFD import fails
      drm/amdgpu: unlock the VM and BO when attaching a KFD BO fails
      drm/amdgpu: rewrite all PTEs of the BOs after a VM reset
      drm/amdgpu: don't walk the CS chunks when allocating them failed
      drm/amdgpu: don't drop the gang dependency fence twice

Jose Maria Casanova Crespo (1):
      drm/v3d: Initialize timedout_batches when running a CSD job

Jouni H=C3=B6gander (5):
      drm/i915/psr: Clear selective fetch area when duplicating plane state
      drm/i915/display: Add enabled pipe planes into state for selective fe=
tch
      drm/i915/psr: Disable linked plane sel fetch as well
      drm/i915/psr: Fix SFF and CFF CTL register bit definitions
      drm/i915/psr: Don't clip plane state destination rectangle

Karl Mehltretter (1):
      dma-buf: keep the DMA flags in the DMABUF_DEBUG copy

Kent Russell (1):
      drm/amdgpu: Ensure that harvest information gets set

Kevin Wang (1):
      drm/amd/pm: populate unique ID for smu 13.0.7

Konstantin Sinyuk (1):
      MAINTAINERS: Update habanalabs maintainer contacts and status

Kylie C (1):
      drm/amd/display: Don't select zero V_TOTAL_MIN/MAX on seamless boot

Leo Liu (1):
      drm/amdgpu: cancel idle work in hw_init failure paths for vcn/uvd/vce=
/jpeg

Leon Romanovsky (1):
      dma-buf: Restore the scatterlist entry count before freeing

Lu Yao (1):
      drm/i915/gem: Reset err for each fence entry

Lucas Tanure (2):
      drm/vc4: hdmi: always cancel the scrambling work synchronously
      drm/vc4: hdmi: enable scrambling before the TMDS clock starts

Mario Limonciello (1):
      drm/amd/pm: track BACO state in the SMU v11 ArmD3 sequence

Matthew Schwartz (1):
      drm/amd/display: Keep the nominal vtotal while VRR is inactive

Ma=C3=ADra Canal (3):
      drm/vc4: Publish the output fence outside of job_lock
      drm/vc4: Drop the BO reservations outside of job_lock
      drm/v3d: Widen cache_clean_lock over the whole L2TCACTL sequence

Melissa Wen (1):
      drm/amd/display: Signal PQ EOTF in FreeSync infopacket for DP HDR

Michal Wilczynski (1):
      drm/imagination: Align rogue_fwif_hwrtdata to 64 bytes

Mikhail Gavrilov (1):
      drm/amd/display: set allow_freesync before validating a new stream

Milan Milicevic (2):
      drm/amdgpu: clear RB_OVERFLOW bit when enabling interrupts for navi10=
_ih
      drm/amdgpu: publish IH enabled before PSP programs IH_RB_CNTL

Misha Nasledov (1):
      drm/amd/display: Drop clock requirements on DCN32 when no
displays are active

Mitul Golani (1):
      drm/i915/display: Allow port sync on PTL

Mukul Joshi (1):
      drm/amdgpu: only tear down an active UALink accelerator

Munique Feitoza (1):
      drm/nouveau: Fix CE channel creation on pre-Kepler GPUs

Prike Liang (7):
      drm/amdgpu/mes: skip unmap queue notification during GPU reset
      drm/amdgpu/uvd: don't allocate or lock BOs in the direct IB test
      drm/amdgpu/userq: wait for GPU reset before mapping or unmapping queu=
es
      drm/amdgpu: finish GPU recovery callbacks before restarting scheduler=
s
      drm/amdgpu: stop the schedulers before preparing the GPU reset
      drm/amdgpu/vce: don't allocate a scheduler fence in the direct IB tes=
t
      drm/amdgpu: stop GPU recovery wait for the JPEG/VCN idle work

Roman Demidov (1):
      drm/amd/display: Fix NULL deref in dcn401_update_clocks_update_dtb_dt=
o

Roman Li (1):
      drm/amd/display: Reset DET of HUBPs without a plane before
outstanding updates

Rosen Penev (2):
      drm/nouveau/fifo: map Kepler video engine contexts non-privileged
      drm/nouveau/nvkm: clear use.enabled when subdev init fails

Suraj Kandpal (1):
      drm/i915/display: Limit NVL TRANS_VTOTAL.Vtotal skip to A-step

Tvrtko Ursulin (2):
      drm/sched: Fix out of bounds entity priority check
      drm/sched: Adjust run-queue when changing priority at runtime

Vidya Srinivas (2):
      drm/i915/display: Single scaler per pipe on WCL
      drm/i915/display: Disable pipe joiner on WCL

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915/vrr: Fix intel_vrr_dcb_vmin_vblank_start()

Vladimir Zapolskiy (2):
      drm/panel: visionox-r66451: Send the brightness value MSB first
      drm/panel: visionox-r66451: Wait longer after the panel reset

Wayne Lin (1):
      drm/amd/display: add missing CRC engine 1 registers

Werner Sembach (1):
      drm/i915/display: Add quirk to force backlight type on some TUXEDO de=
vices

Yili Zhang (1):
      dma-buf: Fix IOVA offset when linking phys vecs to sgt

luyuantao (1):
      drm/panic: Fix the loop that causes kmsg to not display correctly

renpanpan (1):
      drm/amdgpu: Only enable HDMI audio if display supports it

 .mailmap                                           |  2 +
 MAINTAINERS                                        |  6 +-
 drivers/dma-buf/dma-buf-mapping.c                  |  8 +-
 drivers/dma-buf/dma-buf.c                          |  4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   | 17 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             | 21 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 41 ++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      | 44 +++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |  5 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           | 25 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          | 19 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            | 11 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |  5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            | 36 +++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             | 16 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |  1 -
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |  5 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |  5 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |  5 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  2 +
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               | 13 ++-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             | 27 +++---
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             | 28 +++----
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             | 27 +++---
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             | 28 +++----
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           | 27 +++---
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           | 27 +++---
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           | 27 +++---
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c           | 28 +++----
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_2.c           | 28 +++----
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_3_0.c           | 27 +++---
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  4 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  4 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             | 41 ++++++++-
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |  4 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c              |  4 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |  4 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |  4 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |  4 +-
 drivers/gpu/drm/amd/amdgpu/vce_v1_0.c              |  6 +-
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |  6 +-
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |  6 +-
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |  6 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              | 15 +++-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              | 13 ++-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              | 16 +++-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              | 17 +++-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              | 15 +++-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            | 15 +++-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            | 15 +++-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            | 15 +++-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            | 16 +++-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_2.c            | 16 +++-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  3 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c | 11 +--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_freesync.c | 27 +++++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  6 ++
 .../amdgpu_dm/tests/amdgpu_dm_helpers_test.c       | 30 +++++++
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |  3 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  6 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  | 31 +++++++
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |  3 +
 .../display/dc/link/protocols/link_dp_capability.c |  6 +-
 .../gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c |  7 ++
 .../gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.h | 18 ++++
 .../gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.h | 22 ++++-
 .../drm/amd/display/dc/optc/dcn314/dcn314_optc.h   | 18 ++++
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h | 11 +++
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.h | 11 ---
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.h   | 12 +++
 .../gpu/drm/amd/display/dc/optc/dcn42/dcn42_optc.h |  2 +
 .../gpu/drm/amd/display/dc/optc/dcn60/dcn60_optc.h |  2 +
 .../amd/display/dc/resource/dcn32/dcn32_resource.c | 15 +++-
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |  6 ++
 .../display/dc/resource/dcn401/dcn401_resource.h   |  6 ++
 .../drm/amd/display/modules/freesync/freesync.c    |  6 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     | 20 ++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   | 20 +++++
 drivers/gpu/drm/bridge/nwl-dsi.c                   | 17 ++--
 drivers/gpu/drm/display/drm_dp_helper.c            |  3 +-
 drivers/gpu/drm/drm_crtc.c                         | 18 ++--
 drivers/gpu/drm/drm_edid.c                         | 12 +++
 drivers/gpu/drm/drm_panic.c                        |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c           | 40 ++++-----
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |  6 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  2 +-
 drivers/gpu/drm/i915/display/intel_display.c       | 19 +++--
 .../gpu/drm/i915/display/intel_display_device.c    |  5 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  4 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  | 22 ++++-
 drivers/gpu/drm/i915/display/intel_plane.c         | 11 +++
 drivers/gpu/drm/i915/display/intel_psr.c           | 96 ++++++++++--------=
----
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |  4 +-
 drivers/gpu/drm/i915/display/intel_quirks.c        | 24 ++++++
 drivers/gpu/drm/i915/display/intel_quirks.h        |  1 +
 drivers/gpu/drm/i915/display/intel_vrr.c           | 12 ++-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  2 +-
 drivers/gpu/drm/imagination/pvr_rogue_fwif.h       |  2 +-
 drivers/gpu/drm/loongson/lsdc_gem.c                | 14 ++--
 drivers/gpu/drm/loongson/lsdc_plane.c              |  2 +-
 drivers/gpu/drm/loongson/lsdc_ttm.c                | 14 ++--
 drivers/gpu/drm/loongson/lsdc_ttm.h                |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  7 +-
 drivers/gpu/drm/nouveau/nvkm/core/subdev.c         |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c   | 13 +++
 .../gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c    | 20 +++++
 drivers/gpu/drm/panel/panel-visionox-r66451.c      |  4 +-
 drivers/gpu/drm/scheduler/sched_entity.c           | 29 ++++---
 drivers/gpu/drm/v3d/v3d_gem.c                      |  5 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |  2 +
 drivers/gpu/drm/vc4/vc4_gem.c                      | 14 +++-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 10 +--
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c                 |  5 ++
 122 files changed, 1123 insertions(+), 470 deletions(-)
