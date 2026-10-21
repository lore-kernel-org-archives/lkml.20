Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582920;
	b=CgBbu41yEKM/yFZIg6cdb7mTL1BbPGdv+pnhwOyplxXX7GHfGZ+22FBcOfVHC4ytpa3W
	 bQBDLZVjTU3uFJtYisjmjTa2v5y8LDMu7IOYM5mpPIeuxxts+nDeeIXVuxRnogxg97f9Y
	 oitWUnv+Y5XaaWZ28HbHWhpnPwWVke+P6hrA543zPryY7f9oHs9RVdOBdKHqVMCnLiKx/
	 u3SmDJ7jjoguw/Bk3cMjNCWyT5zF6QChjAn3QaHtmLcXot85/wWind+sD9T8c1c05gs6B
	 st45E2QudhVc0aumJJH4SKRqOHu3n67YY+IZmdpfSnPYMYnI1bbHWPZYuqjDnEEem+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BIPpbckw4KCv3KnM8UNOMNM81SAc/Xr6FmEH7qH71N8=;
	b=uZF1eZje9wOZYkmoyERSdNbCpYRbweD2tr0YvbSsq3FEYS3+d73YVt9fouz30I/jka8i
	 zr/Mi7U4PooQlmg140tF8bar2T4PrVNvtETNPGkP6ixz8EU5IvNacsPX/wT+MAsut/mfu
	 C1y07MnQY9fS85Ozqtm6KBgJrxo93G8Ystkw5OunwOQMEyNY4F8tmNIEH9nDmzVz6SXCR
	 2v2ByPPcMclNnGi2BNhspN/F0XoHvasE/akPqOz4aKEWI45qguas2XunTWOQaYzVYrHJ7
	 7jZCTcbi/fq9JxhqqiCZ56WtZrjClAkl+b5NRy1wZMyui0saHvGKxxhkUs/iCw657fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NWuQout5;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C306B606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C306B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NWuQout5
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9906c85122cso150412241.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792582919; x=1793187719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIPpbckw4KCv3KnM8UNOMNM81SAc/Xr6FmEH7qH71N8=;
        b=NWuQout5knoJJ3/j1ZJi+fVImcrZF8QxsL9BtY5PQ7hhca9S5LC0Sk54uostwyU6Aw
         Iwo1tR6fVtvzUhwOg2gLCRYeK+nLV4d/JYOJMDs8xCgbo7jgYR8zgr7wakuLpJiUUlct
         YKQ1E6W4JWT6tf4PGhmwgQMoOgVkErhNPDUyiU4FetzU6SVgCB6/QfuYc70uO1LnzR+C
         IJYbIByEbGRTAXsfQoL3bsH6y1N7SsGlQRKijYoC5wSjpvaruP9svL6GsZPaui1JPfGK
         Bl3KWqMub83hGdqfqTPK5JuTdzilwrHH6wcXR3qvwq+g5YV72NIp/B/ImH+06D82zylL
         VrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582919; x=1793187719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BIPpbckw4KCv3KnM8UNOMNM81SAc/Xr6FmEH7qH71N8=;
        b=QCrF/dyrUNHJ1gTStAvqDdy8KOCam16rcnG72+ir1yD3YdfmmzO+wGPy7O0dAOUG81
         61p0Cu5GN5XyKpqKfCmUfXoSWA1TveLY+BnTFKaCPEROQUQGTvtfOmnZNRw8x66TiMIs
         wV7z5ewu+f2qKS1ITXg9gaxyqZDL+/OJrJB5rQEKfXn4mZdx7MSwU3nssxC/PLsvXZY5
         cYhrHB/a0vdabGRdjFCsc/epaIUNzqL5YoG7lIdis7XRX3IsipVDQCViJqfM9hmd8mRP
         93AOsFv3gix67sBsgbn66OmwgEri1wRWqkDLDyN/ZFweKnsuUZXUbUAf5RIIhoy/RjvP
         usxQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/zjCMI1WE/yN6WP1hswUTHKsx1QXPjHymXp8pXuV3tnRFeQngCZJhi2AFxVAn7F4JktcduZn6+3cvoBc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZd+N27XQWGPC3YSOOIX7D2fAmhxYcCT38Ijp8Oup6w7W8RIKF
	3BYuPH5I3cjLpvExaHncfbKP64BtB1AwmI0D6pYHA9bxSMO/YHQ5toj0
X-Gm-Gg: AYBFou3F6xj86V41Cw+PX8wBg3pQU/oR5uFpbzF1228hClX1hUdnRSq0jW/zFcnQEoV
	pBSS4gKDjovXazPA5I0YIKuhm3cBGEcLXJleDW1c/xQft7IZ+KpxAM9VcDfSY7OMGGoMpv4Z1W9
	Zs+iDRzuKLGRopBdzd3B8yOKZPvYuYLqmXHgo9XtbW8k32Ntg6eruZs8lfeFxKzvOngcUJi2lGu
	DBVv7zPkDJdAjoGQEBOEpoaFI/Eew6vzporunmqhYSEddzA8eDGuXHSBND9NQ/u5GA0cNIXRoqO
	tL2A0S87ca5VNB0PS7CFhIjalsog0JV5NRCqEqPnfQeG+I+N1FLsHQ7tvBN5xt3rupo9Fz+wMrF
	F5JW3ejN82EmmIp1EneCEjg6qxZEL0JpHfpiOtEpwLahxsHnVsYvxNBF4Q2hp4iNIsDB23gxBKc
	MeItvnM8xPRuNfUady0P4UviEtRsXT1cUUbMy0NV+NAbHaPEul0t6i7g5yhGt/eBg+gLTgesHla
	LjZyos+am53KeifybuFEfJZlQm6JFPme2cJFLQJmJW9/dvMM5zVDerYRSxY+70JYNkQzRc=
X-Received: by 2002:a05:6102:508f:b0:7cc:1ace:fd0b with SMTP id ada2fe7eead31-7cc925e41e6mr560431137.8.1792582918645;
        Wed, 21 Oct 2026 04:41:58 -0700 (PDT)
Received: from localhost.localdomain ([177.155.254.119])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc91f9c7f1sm2365006137.0.2026.10.21.04.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:41:58 -0700 (PDT)
From: Matheus Tagliari <mptagliari@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Matheus Tagliari <mptagliari@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/radeon/vce1: enable the VCE trap interrupt
Date: Wed, 21 Oct 2026 08:41:18 -0300
Message-ID: <20261021114122.94008-3-mptagliari@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021114122.94008-1-mptagliari@gmail.com>
References: <20261021114122.94008-1-mptagliari@gmail.com>
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

Enable the trap interrupt at the end of vce_v1_0_start().

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

Trinity/Richland shares this code and is covered by the previous
patch, but I have no such hardware to test.

Fixes: a918efab631a ("drm/radeon: add VCE 1.0 support v4")
Cc: stable@vger.kernel.org
Signed-off-by: Matheus Tagliari <mptagliari@gmail.com>
---
 drivers/gpu/drm/radeon/sid.h      | 2 ++
 drivers/gpu/drm/radeon/vce_v1_0.c | 4 ++++
 2 files changed, 6 insertions(+)

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
index bdfbcf14b..0866e7fb0 100644
--- a/drivers/gpu/drm/radeon/vce_v1_0.c
+++ b/drivers/gpu/drm/radeon/vce_v1_0.c
@@ -350,6 +350,10 @@ int vce_v1_0_start(struct radeon_device *rdev)
 		return r;
 	}
 
+	/* enable the trap interrupt so that VCE fences are processed */
+	WREG32_P(VCE_SYS_INT_EN, VCE_SYS_INT_TRAP_INTERRUPT_EN,
+		 ~VCE_SYS_INT_TRAP_INTERRUPT_EN);
+
 	return 0;
 }
 
-- 
2.47.3

