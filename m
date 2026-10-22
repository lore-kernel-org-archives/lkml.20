Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792669701;
	b=xyUr9+QS888SECRkGxYw0/GXGjX4nRyXlOzqJc9ycFcqI02fAtU+g/5Yn+MmKR10YnD0
	 a5sZtdRxiB2Pfg/QehpZcwhNOukM7OMZP6YgVjhNwua26cNnOXH6119xRwBmGzMrB6a0T
	 3oNHwv4J30VwD7eyggSqD7M4Yh1welOXwKlKPRaT530BVqvL1AfM731LwWD+1EZkRBarj
	 vaY/4kcPEv1Yy16R7v0a94YMVzLtdaPPxHQHWGdEAv3LcYf35DNt4enc9dEMCsLuiRFPd
	 iDTmwpqEGgjtx/8xMuE4DqI3KCXDri5icw12rcUK+KtsI6EujWx5+LpxwkzLWj7mtGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792669701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cG+5kIyh0kWAXD1Yf0rWfPRytbtZEq2h4IvreLdn/S4=;
	b=kKgfHib6s3oews7tvitJ7Y0PxGLUaZIPBJMJKPeIDK8o/niqj5oLwenm3H4/KqbCzbE2
	 7ZPXgHHV2vB5lD0NQ0KPThDNxd3q7pYNEz2CMtuTuCo5ynhE4N89A8HrEeTW5KTK9xVwV
	 Z08IZXzEoT/hkSZq/aYmzLkONtFaVAVd/W8w0NZvvERW7Lsb7+NSB2a2Np8dRlpM96Llm
	 NytJHdrTEPFWNCnynPlFCcx05cqLty/AhOlKScimdBuUNzm7+92CSEpWVb6GLtN/BGMs3
	 qddwCls7hIFJoGFNVWI5ZcAGZtrkOsjjkHOlPvs7nQebafOCv+wphBcIRzHJ+HO14Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LGxpqEOu;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B07606A322
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B07606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LGxpqEOu
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7c2f48f3a96so622300137.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792669700; x=1793274500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cG+5kIyh0kWAXD1Yf0rWfPRytbtZEq2h4IvreLdn/S4=;
        b=LGxpqEOuAmkZlpocFvsQTJtd+FR9s5tfWejfmmGzq9ZOXZGHOiOOlP9/lW8zxWNz0k
         WKHiULgmgOoWYovWQbhqoJJXV/HJ7uR+jLcFrl3XLIoQtsuxXx1MrTLjxPeCJd7dicxs
         m31oMkBt4zh5/dGQ1v8tt/s28k7MTwOcmDcr5vxbHeNkp6SkjRGXqYU4uHu/Wdwv8FlM
         dQmZrkjIglo1V1Tc8giMMAH+BUhtNcg/Repzy82oOjXcqDHtGX8HD0D6gKdYhiZc18eQ
         9upiXVuH3Stgl1EdseDESwXv82E4E4cFz/Eg1q9yruSXO0XqJNj2Nu+Jhu/o0EvnEUFQ
         Z7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792669700; x=1793274500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cG+5kIyh0kWAXD1Yf0rWfPRytbtZEq2h4IvreLdn/S4=;
        b=ESsZ620tzICF1BHSo1Pqwttz1jO3T/P6E0Mqi8hWXw+M99dI23RoA0G/ETc0cs6edd
         KFauhlWFQFQpTasKd/a0R7mg/IdJloP6Uv0VSTHRxWBuk2w0owNkp6AnXjy1aVBSlYZP
         zmEzSxiSfBnSgINf1IUwILj+MapGkAVkWPigJxPMbziyk6ySxbONDaflytZJD9MyYi+n
         t6oM+zvwSuvYIUYqAZkVx92CYu6DO8eHeUQjLVOkjZbPEqZZAQHdIFXngIqTpK2bpKeh
         zI+PrHoorNDPxjcNn22ji/u09tD9xMFCH2hRTLjzCiunA0Sdkvfk0BnwJ+Dg2AT4Qkek
         AvZQ==
X-Forwarded-Encrypted: i=1; AKwUvByL1bem4bdIS907zNqXWJQ18tj9AyrJbtG5OWnu/RsSSUVk9sBSQ6a4PDAXnn+LxnnSY48TG38zL8vOtMk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+rvVO99Ii2ksNuHUPZFF5EV1XIhEgaugMWmsyD0TSxvg1BahD
	P1dNWx5SxJZO+tPWfPDNfep5SezoW9hPVvieFPM1yourZoiZAc3Xw4i/
X-Gm-Gg: AYBFou3z32/GZAIOlPh7REHzeMwro6UGxEfN/eVOB8gZJJs/X/WzlfsrFMKXND36GTc
	JdNZbwxS171L96Zj0UMVYVkawwphL1W2BNqPxddsXlaVLPGC9N96o0zozNNtBSa+JGtSjloQDbc
	yvZBwe98IAdF5O1FrLxxDUSCLWkMxRXn030iWXcz8ZhmhfvdNnf0pI8m1zeiBTNnoG0eBQyamk3
	rgRQ3ZN+j3rNvcQkFH1SJxNYYW6SkInZIxtpaleHNxhipDB6EkpsPubO73AhwXGLQUWwCjeF8TQ
	DGujgGsSaehS2RKEAjRBjW7oC+dHjcdY6aD1Davcs+PD/Ar4yjCzJTlKkcvRQgQnhL0rKWMipXm
	0coc+gWam0dO6h5/X+P2epgkLczB1ZAchH2H0nr9h6AJDM9L8IVKLBAQZBaj9Zzkpbp26ItuwAy
	mNxfPRA2KRyvfnYlKgScXkRDoDMUS2Cw98MAQXTVP+lBiTpBqFcD+7bB8fKwcf0qK2xht4ROpVb
	HGg2hgbW9m62wLPr+/IzUBa1As17qAW226DVAMgtqfzFIAfD/s50hp1wHNH38VNmMvut+E=
X-Received: by 2002:a67:e711:0:b0:7a1:fa0f:1106 with SMTP id ada2fe7eead31-7cc927ffae5mr1735239137.36.1792669699746;
        Thu, 22 Oct 2026 04:48:19 -0700 (PDT)
Received: from localhost.localdomain ([177.155.254.104])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d117c005sm6177793241.9.2026.10.22.04.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:48:19 -0700 (PDT)
From: Matheus Tagliari <mptagliari@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	=?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Cc: Matheus Tagliari <mptagliari@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/radeon/vce1: enable the VCE trap interrupt
Date: Thu, 22 Oct 2026 08:47:47 -0300
Message-ID: <20261022114754.865669-3-mptagliari@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022114754.865669-1-mptagliari@gmail.com>
References: <20261022114754.865669-1-mptagliari@gmail.com>
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

vce_v2_0 sets VCE_SYS_INT_TRAP_INTERRUPT_EN in VCE_SYS_INT_EN so that
the VCE_CMD_TRAP emitted after each fence raises an interrupt.  The
VCE1 code, used by SI and Trinity/Richland, never does, and amdgpu's
vce_v1_0 does (mmVCE_SYS_INT_EN, 0x8340, i.e. byte offset 0x20d00 on
SI).  VCE fences are therefore never processed from the interrupt
handler and are only noticed when a fence wait times out.

Enable the trap interrupt at the end of vce_v1_0_start().  CIK also
goes through vce_v1_0_start() (via vce_v1_0_init() and kv_dpm), but has
VCE_SYS_INT_EN at a different offset and already enables it in
vce_v2_0_resume(), so only do it for VCE1, i.e. before CHIP_BONAIRE.

Observed on a Radeon HD 8870M (Cape Verde, 1002:6821) with VCE firmware
50.0.1, Mesa 25.0.7 radeonsi and ffmpeg h264_vaapi on Debian 6.12.113:

 - Stock driver: the encode hangs after a few dozen frames ("ring 0
   stalled", "ring 3 stalled", "GPU lockup"), and the reset does not
   recover ("failed VCE resume (-22)", "ring 0 test failed").
 - With the hardware ring semaphores of the VCE ring disabled as a
   workaround, the hang is gone but encoding runs at 3.9 fps
   (~256 ms per frame), consistent with fences being noticed only by
   timeouts.
 - With this series: 640x360 for 1800 frames, 1280x720 for 900 frames
   and 1920x1080 for 600 frames, all in real time with no decode
   errors, and 191 fps at 720p / 91 fps at 1080p unthrottled.  Four
   runtime suspend/resume cycles with an encode in between also
   worked.  No lockup, reset, WARNING or error in the kernel log, with
   DPM and runtime PM enabled.

Trinity/Richland takes the same path and is covered by the previous
patch, but I have no such hardware to test.  CIK is not affected.

Fixes: a918efab631a ("drm/radeon: add VCE 1.0 support v4")
Cc: stable@vger.kernel.org
Signed-off-by: Matheus Tagliari <mptagliari@gmail.com>
---
 drivers/gpu/drm/radeon/sid.h      | 2 ++
 drivers/gpu/drm/radeon/vce_v1_0.c | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/radeon/sid.h b/drivers/gpu/drm/radeon/sid.h
index f9267b026..ba322de84 100644
--- a/drivers/gpu/drm/radeon/sid.h
+++ b/drivers/gpu/drm/radeon/sid.h
@@ -1878,6 +1878,8 @@
 #define	DMA_PACKET_NOP					  0xf
 
 #define VCE_STATUS					0x20004
+#define VCE_SYS_INT_EN					0x20d00
+#define		VCE_SYS_INT_TRAP_INTERRUPT_EN		(1 << 3)
 #define VCE_VCPU_CNTL					0x20014
 #define		VCE_CLK_EN				(1 << 0)
 #define VCE_VCPU_CACHE_OFFSET0				0x20024
diff --git a/drivers/gpu/drm/radeon/vce_v1_0.c b/drivers/gpu/drm/radeon/vce_v1_0.c
index bdfbcf14b..09fc1572a 100644
--- a/drivers/gpu/drm/radeon/vce_v1_0.c
+++ b/drivers/gpu/drm/radeon/vce_v1_0.c
@@ -350,6 +350,15 @@ int vce_v1_0_start(struct radeon_device *rdev)
 		return r;
 	}
 
+	/*
+	 * Enable the trap interrupt so that VCE fences are processed.
+	 * CIK also gets here but has VCE_SYS_INT_EN elsewhere and enables
+	 * it in vce_v2_0_resume().
+	 */
+	if (rdev->family < CHIP_BONAIRE)
+		WREG32_P(VCE_SYS_INT_EN, VCE_SYS_INT_TRAP_INTERRUPT_EN,
+			 ~VCE_SYS_INT_TRAP_INTERRUPT_EN);
+
 	return 0;
 }
 
-- 
2.47.3

