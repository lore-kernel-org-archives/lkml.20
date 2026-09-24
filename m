Received: from mail-vs2-f31.google.com (mail-vs2-f31.google.com [74.125.227.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC90488239
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256614; cv=none; b=nrXCThH2EVM9Y94aKLifngnyuhs5QTfAMH9XjzVZoPz8Xedx7M16dIq0lx1mgyP8K9dgUy0PcOOQBofpj6jsELKzACnBTfhHcF7f1pdsC/Czw5cc0/HdDUCKYDdBGi5j/3BlFBS91ghwmH1lrSTgcVXdW+sEMjOYEBrT6FwHVMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256614; c=relaxed/simple;
	bh=T1+8r+R3nHu/Al24puz6vhaJe8tsqdWndxe5F2O3GGo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PvuXZRzjTjq03cTkr3TybD5GePm6ZApemtVhdjRGC61tes3gWpFrMJk9OvdcbufS5ojr3/agu3VgqQf3JLoxrvine6vvPKEqZ5TeJxYEuleh+EEqxUI/wGpzH4iPUzjxOj7n4N+ra0h2UQ0ydhXEbdD7y0Fb+m7DVSqUUNI2cg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdMk5NNi; arc=none smtp.client-ip=74.125.227.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdMk5NNi"
Received: by mail-vs2-f31.google.com with SMTP id 71dfb90a1353d-5c67e512ee5so786809e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790256605; x=1790861405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GafHdzyK4yGVm8vNQl3Rr48yBibIJneXjnAJvLweW2w=;
        b=hdMk5NNi0aqqQrLN8mGA0uw9z2SHZ149S7KWXQ0UWS6b1nqRsfMoPDLRzNLDW0BtjF
         +Vj+K6ZlUa7tJgCCB9spOH4GZ9oY2Ks7EeAkw0ukavBu2k9YUqlU3GLjtMqFDYvTeCLC
         +nmhjpZ6Zi6Wc1gkEfK27jdfb/tU/APn+5cLd/Ny0327HI2DJ9t0Kk93Azj9wRotgpGw
         +i/0o7Xa47zz4EcKKuFGCAYU3XrY+iLIOMYX797rN0oKl7aLYiDpfNby4+F6L+m9HOic
         08vJKcTPf+FA6ye9blNSA1zJ28QCM+Hw15ShAkddlENAgWHQbZY7JotRKU9xwk8k9rVp
         LMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256605; x=1790861405;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GafHdzyK4yGVm8vNQl3Rr48yBibIJneXjnAJvLweW2w=;
        b=npwzqWJgccZwJvDG1rbIlmMC62Fi/iwe9kJiqcXoIc/E6Mvp3QTbOuH6YfcPQ5Ja7h
         vQCkAKAxJNiWBkLFK2T5z5oOONAUbXH6efAfMTbIXb4tJwxBQSzfV14YgfRIzHYLAffD
         A9KzSAWML3gXxjO0v9xETKM/XMXphve1fQqIIllOe411xOpo1to2WiAgp6Zkxwu5Ybu7
         drlqLPWlGnc8dPucW/TmcgqHdoHXajO0dwL8V0Ce90Mvc7RUb8hJCqHr4GEtix2r9Nk+
         tCDzoq18nKcqY/r/CvQ4iZIdA1g3TDLUUs5WmYL00IH7gplK8shObiXwwrGZfLHU9q0U
         AjtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNVIKUBbUYYdfEi3LrVoMf1eqoBZtZFXBWBHPMmFvRRFh8sHQq2lpPwb+e/31qLffJBYkleIphbUK6rGw=@vger.kernel.org
X-Gm-Message-State: AFuF++kUaFQBAlkr8gQj+NczMyC18Mh1La3hRxV0CQ8RFYeOGkyZat6H
	iCcFanOgwtLO2ErMyLV/goyireAOS4Rl32KuGHPCeJ1RQpwuisth2GZ9
X-Gm-Gg: AYBFou29KtBPSp0IGz8uq0huHo0hzA8Zp5g4Zp016szf89InSoWtBvrzHeLXnev7e1w
	KkzhpOKHCyk5M3c/EtD9yfG8v0dGP6RfJOyr4q4UGIQUSXJvag4Twl3LaOMAabZZEIPsp+co/yn
	UGa4fOJIxiIuKkbeE6k5yhq8BsfI+Q60b0wcwXrTGpdJJNTHfV8D6MyQfoz6jfPf6eGwapYl6Bi
	A3Lhw0U4cJMuFoltz6ZrXmy6SRVPYpDXLk/OjTyf0/BAPLycZloNMB+0oxyqq7hrI4MpNbtuQ09
	5EhXkNwA+kV7lY6sVMF5Xn9cZ9fbFwi7TX6rDs5U9+X45LBjdvPFo0joFEgD3Mo1QcgdgdScL+Z
	JvGn7/7Anm1wgjKGsmKkerP/Jr9w3ttWfn26xkgiJi3O6/akh8QoCBUxLKaThU2jDSSyaisgJq4
	NiOduV5h03ePRIcKXALkZ7jMOMlQTwDJuGjYm4oFuyfusVEiFyPd0pcb3KsCgd4IfZzSljTZeG5
	iHQ58yzljDoVL6FYSTJ
X-Received: by 2002:a05:6122:3d0e:b0:5c9:c60a:e9b6 with SMTP id 71dfb90a1353d-5cb0c149318mr1312750e0c.22.1790256605213;
        Thu, 24 Sep 2026 06:30:05 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:43a9:9b8b:ebdc:6411])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f0582b6bsm7050251e0c.18.2026.09.24.06.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:30:04 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	amd-gfx@lists.freedesktop.org
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu/gmc_v8_0: restore the FB location after a re-POST
Date: Thu, 24 Sep 2026 10:29:52 -0300
Message-ID: <20260924132952.25054-1-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On a MacBookPro14,3 (Radeon Pro 560, POLARIS11) amdgpu has never recovered
from an ASIC reset: five attempts recorded, zero successes.  Since suspend
to RAM goes through a reset, S3 fails the same way, and as the internal
panel hangs off the AMD GPU the machine comes back blind.

The failure looks like VRAM going write-only-dead: writes are silently
dropped while reads still work, the driver reports success at every step,
and then it hands the SMU a pointer to a table that was never written:

  amdgpu_device_asic_init()  -> 0          (reports success)
  gmc_v8_0_hw_init()         -> 0          (reports success)
  memcpy_toio()                             (write silently discarded)
  send_msg(0x251, ...)                      (SMU parses garbage)
  smu7_check_fw_load_finish() -> -EINVAL -> black screen

It is not VRAM dying.  It is the framebuffer moving.

On this machine the Apple firmware places VRAM at MC address 0 on a cold
boot, and gmc_v8_0_vram_gtt_location() reads MC_VM_FB_LOCATION once, at
init, to derive vram_start.  A re-POST -- which is what an ASIC reset and
an S3 resume both trigger -- lets the VBIOS put the framebuffer back at
its own default instead, 0xf400_0000 here:

  cold boot:   MC_VM_FB_LOCATION = 0x007f0000
  after reset: MC_VM_FB_LOCATION = 0xf47ff400

gmc_v8_0_mc_program() programs the system aperture from the stale
vram_start, but only writes MC_VM_FB_LOCATION and HDP_NONSURFACE_BASE
under SR-IOV; on bare metal it trusts whatever the VBIOS left behind.
While the MC is still in pass-through everything appears to work, so the
mismatch goes unnoticed.  Then gmc_v8_0_gart_enable() sets ENABLE_L1_TLB,
SYSTEM_ACCESS_MODE=3 and ENABLE_ADVANCED_DRIVER_MODEL, the MC starts
checking the system aperture, and every access lands outside it -- which
is why reads return data written before the reset, from a different
physical place than the writes are going to.

Write the framebuffer location back when it does not match the one the
driver is working with, which is what the SR-IOV path already does.  The
comparison keeps this a no-op on machines where the VBIOS restores the
same location, so nothing changes for them.

This runs after the VGA aperture has been locked out and with the display
suspended, so the MC does not need to be stopped; only CPU access through
the BAR could land while the FB and HDP bases disagree, so BIF_FB_EN is
cleared around the update and re-enabled below.

With this the GPU survives resets and S3: the machine has since completed
twelve suspend/resume cycles in a single boot without a failure, and the
restore is visible on each resume:

  amdgpu 0000:01:00.0: amdgpu: FB location 0xf47ff400 does not match
  vram_start, restoring 0x007f0000

To be precise about what those cycles prove: the kernel they were run on
also carries unrelated local patches for this machine's Thunderbolt
controller, which fails separately.  This patch is the one that brings the
display back -- without it the GPU never recovered from a reset at all.

Tested on 6.18.49 on a MacBookPro14,3.  I have no other smu7 hardware, so
this is only known to matter on machines whose firmware boots the GPU at a
different framebuffer location than the VBIOS default; elsewhere the new
branch does nothing.

Signed-off-by: Francisco Beltrán Millalén <fbeltranmillalen@gmail.com>
---
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -472,14 +472,42 @@
 	WREG32(mmMC_VM_SYSTEM_APERTURE_DEFAULT_ADDR,
 	       adev->mem_scratch.gpu_addr >> 12);
 
+	tmp = ((adev->gmc.vram_end >> 24) & 0xFFFF) << 16;
+	tmp |= ((adev->gmc.vram_start >> 24) & 0xFFFF);
+
 	if (amdgpu_sriov_vf(adev)) {
-		tmp = ((adev->gmc.vram_end >> 24) & 0xFFFF) << 16;
-		tmp |= ((adev->gmc.vram_start >> 24) & 0xFFFF);
 		WREG32(mmMC_VM_FB_LOCATION, tmp);
 		/* XXX double check these! */
 		WREG32(mmHDP_NONSURFACE_BASE, (adev->gmc.vram_start >> 8));
 		WREG32(mmHDP_NONSURFACE_INFO, (2 << 7) | (1 << 30));
 		WREG32(mmHDP_NONSURFACE_SIZE, 0x3FFFFFFF);
+	} else {
+		u32 fb_loc = RREG32(mmMC_VM_FB_LOCATION);
+
+		/*
+		 * On bare metal vram_start is the FB base found at init (see
+		 * gmc_v8_0_vram_gtt_location()).  Normally the VBIOS put it
+		 * there and a later re-POST puts it back in the same place.
+		 * On MacBookPros with switchable graphics VRAM is at 0 at boot
+		 * instead, and a re-POST (S3 resume, ASIC reset) moves it to
+		 * the VBIOS default, away from the addresses the driver
+		 * already uses.  Move it back.
+		 *
+		 * This only happens after a re-POST: the display is suspended
+		 * and the VGA aperture has been locked out above, so there is
+		 * no need to stop the MC.  Only CPU access through the BAR
+		 * could land while the FB and HDP bases disagree, so block it
+		 * here; BIF_FB_EN is enabled again below.
+		 */
+		if (REG_GET_FIELD(fb_loc, MC_VM_FB_LOCATION, FB_BASE) !=
+		    REG_GET_FIELD(tmp, MC_VM_FB_LOCATION, FB_BASE)) {
+			dev_info(adev->dev,
+				 "FB location 0x%08x does not match vram_start, restoring 0x%08x\n",
+				 fb_loc, tmp);
+			WREG32(mmBIF_FB_EN, 0);
+			WREG32(mmMC_VM_FB_LOCATION, tmp);
+			WREG32(mmHDP_NONSURFACE_BASE, (adev->gmc.vram_start >> 8));
+		}
 	}
 
 	WREG32(mmMC_VM_AGP_BASE, 0);
