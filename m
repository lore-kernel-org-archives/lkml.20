Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA489517BD1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859737; cv=none; b=jPdn1zyRk2WNd75yBW5530q1Ex4qwUozmIwNRZnaxxrFrZovDyPe9WtAtLcy8xt1zSKo/LQh/BUdGdLU5DUGpGtX15WO5/3nVJogYTdAYnYpRDHyEtEx3QvnxSlsNVo+ohXw1enfV/1ip39JhIle8e9mNxvmZGAADeTsYZYLmhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859737; c=relaxed/simple;
	bh=tt2RAWD+bHSPy7yGLlzDmpcso5w9hUHauQQE1wwIZqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nrxImABZjjCEzfq4ZSKqBubuMQPQ1nI3Q4cKTYFChpGdQv37J1Zpf0fP6rRgps9YNXECRKvTi7bukeNRJsyaozB87a1baLZn9jjTDXEWRDLbE1YHe5XlbkisQlfbgwLhOn7aOIEXN2ChtTVnbcmP6pYvREsI8zPae5a0XpIGGlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WK/xO0MK; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WK/xO0MK"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso5055454a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859735; x=1789464535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1MvCbfjotTiPMU9xzuQx8OmetQMTdloo3vQR2iBJfs=;
        b=WK/xO0MKeMAJgw/ZD7+DzFmmU+Xo5cxEa7ScCAF/Ff8a0yiG6Ms0Q4GtLeWrnnmhCi
         6miYzQda1ChoMlR0Xqd45xBOr7AeuBSUutuvhG07yqfFyGAvzErXfodwc983O5K7Khd9
         ZVMrN2M+qTj1hItHCYrCosLn5xRZ9w1wUN4sOc7Ay1MtoJ7D2WLIr8mmiBbqdw8g3UIj
         3r22D1tjsx8crfitD7WqTh9XFZtb04poq04KBBA6YudSN2DgYJHhR2juuGDREZ/y/5GS
         0eb/Zqfof0uOpmgecJ+aqDvjs79DkSKpNEBOPVjvN0k05q3lN/oZp8rycvEQpxDSLUMZ
         GSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859735; x=1789464535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1MvCbfjotTiPMU9xzuQx8OmetQMTdloo3vQR2iBJfs=;
        b=q9Xu/GjGzn7QWQMrzhFMLe2+hlwkQ02UL44DAqZumNVmWcTCzwCRVofU6eRveTjjgC
         4HVvHGWsmWn+0n8vz5KkP6o4ENqOdnvD7j2qxMKPYsd3CHg5DOacK++1ujR5EY+LKJon
         HnxyArlrHk2scLC7n8LQ4VwvuIPq2De4kLiJgPnk66Atk5+xJ0hoo2L5+3L9O7dWflUy
         lY/0ctv+QoUObK5ozTfsAiGZ14+3WlmaiwkV5QwPlNkWhCcji6gaGm8zKsrhWpQgjaOK
         WnpY4Cjdwl06MdRO1oJuSX7s7Cb7Ai44fxvRbfLkviyQAQVN3QOlVCeEvavvogCnDYOv
         hy2w==
X-Forwarded-Encrypted: i=1; AKwUvBx5EAmnGvC4RtWqBJt3D9C1KW7BfNFR2570hs2JuxwURX1wI3xPZnXTRSluDeCjbnZ/k1En7dg7ogCl9Jg=@vger.kernel.org
X-Gm-Message-State: AFuF++mT/ZeHYeVDGNeoH5Fs3smz+7Qt0SnOsP1gZioyIsnyVePuQK0X
	8vfdchBgr+5X+KTcskvwfgG95W9E/ue8YtxT4LYK9N5+NVCkRWet0g9k
X-Gm-Gg: AYBFou3KXXgTjbQ8uyxcaumlYaqBoDMVNWp7FogfQxg3rqqrriQWLN8Lhbs6Fqhe9Nw
	kPvL7dyViXnsGNktxCnoge1QMaM0JFe6vl6yYq2XkNDptQGzGTLfi9+gLBzfO4O8V+ADuqPgiy5
	Ken3e9sLKSsB1ThD05QZCfxx6IWdOY7/J+/YjJIZoGPUXBrxKE88FlZeqpow46jj+j/M7L8SjDH
	kmRsqDthg6Xt+L+V0oQXNnFDq1fpUXuDxFSjUN2YMyE6BuCvqZ4ZrwPQRqbz04EWeau24xDKgoY
	2kd11mhQlpl4AieJ9/J8D90CSEqWUsPQryNjs3SkBT3GwjGf1gpT5Em8+K5vtuyC2Cs9oUPX1BG
	FOdS3FrWByTnL5KjpbLPZnCiY/lDMmL+qldWcdt8tomhioXoKKz4umlu6ooW6p+x/3a25/gfTJq
	YGa6naLiE9gBKZwBy34m4Kqhl9qB2GYtb0cklvm83LPao6/fh1tsWgTMvtp4UuuwQFzrLBdE8W3
	7UCmkyFtRSdq1VaMc0Cd4h3ncaHUYyyj0t+Y+sBRuhdhUi15LcpydoMEqKJdi98
X-Received: by 2002:a17:90b:4c52:b0:396:d27b:89b9 with SMTP id 98e67ed59e1d1-39b2612ccddmr41681971a91.10.1788859735196;
        Tue, 08 Sep 2026 02:28:55 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39227sm32109846a91.9.2026.09.08.02.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:28:54 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v6 2/6] drm/verisilicon: add register-level macros for DC8000
Date: Tue,  8 Sep 2026 17:28:36 +0800
Message-ID: <20260908092840.225220-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908092840.225220-1-a0987203069@gmail.com>
References: <20260908092840.225220-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add register-level constants needed by the forthcoming DC8000 (DCUltraLite)
hardware ops:

  VSDC_DISP_IRQ_VSYNC(n) in vs_crtc_regs.h: bit mask for per-output
  VSYNC interrupt bits in DISP_IRQ_STA (0x147C) / DISP_IRQ_EN (0x1480),
  which are the IRQ registers used by DCUltraLite in place of the DC8200
  TOP_IRQ_ACK / TOP_IRQ_EN registers.

  VSDC_FB_CONFIG_ENABLE (bit 0), VSDC_FB_CONFIG_VALID (bit 3) and
  VSDC_FB_CONFIG_RESET (bit 4) in vs_primary_plane_regs.h: control bits
  in the FB_CONFIG register used by DCUltraLite for framebuffer enable
  and per-frame commit handshake.

No behaviour change for existing DC8200 platforms.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/vs_crtc_regs.h          | 1 +
 drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/verisilicon/vs_crtc_regs.h b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
index c7930e817635c..d4da22b08cd5c 100644
--- a/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
+++ b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
@@ -54,6 +54,7 @@
 #define VSDC_DISP_GAMMA_DATA(n)			(0x1460 + 0x4 * (n))
 
 #define VSDC_DISP_IRQ_STA			0x147C
+#define VSDC_DISP_IRQ_VSYNC(n)			BIT(n)
 
 #define VSDC_DISP_IRQ_EN			0x1480
 
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
index cbb125c46b390..67d4b00f294e2 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
@@ -16,6 +16,9 @@
 #define VSDC_FB_STRIDE(n)			(0x1408 + 0x4 * (n))
 
 #define VSDC_FB_CONFIG(n)			(0x1518 + 0x4 * (n))
+#define VSDC_FB_CONFIG_ENABLE			BIT(0)
+#define VSDC_FB_CONFIG_VALID			BIT(3)
+#define VSDC_FB_CONFIG_RESET			BIT(4)
 #define VSDC_FB_CONFIG_CLEAR_EN			BIT(8)
 #define VSDC_FB_CONFIG_ROT_MASK			GENMASK(13, 11)
 #define VSDC_FB_CONFIG_ROT(v)			((v) << 11)
-- 
2.43.0

