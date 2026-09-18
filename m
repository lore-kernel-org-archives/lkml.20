Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7553B14C2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700507; cv=none; b=nCbB5y0cGES94rl5JW+r4I9WT1Msw1vi5J3eIDP+s2UpPrumKr+f8U9lL7LabAPkb5z8dtbJSmUHYWCJ1w9mwlJju0LWLndZFl2fkpzaNxiXiZgVxXQY65gYiMvTrchrw2OHp7+qYXh7d/WBLkFY6rdL4x5rZdiv7tP5DETbwhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700507; c=relaxed/simple;
	bh=tt2RAWD+bHSPy7yGLlzDmpcso5w9hUHauQQE1wwIZqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y8L4liThnDh5v636dU/90QyEKw697IFAk5Ucaa+InX/SpLIOMuBnMdbTZVzy/niRzLBFeE4Buz1WoUi86K8v35BNWJdAhii7JgfGXt7+yOS4hmwPaTG9B2gbPD24Y9K2wWo1HIgyat6u2WvAQVgL4ugaVi1WlqrxPs5qvWHy100=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RW2i19bb; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RW2i19bb"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so192628a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789700501; x=1790305301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1MvCbfjotTiPMU9xzuQx8OmetQMTdloo3vQR2iBJfs=;
        b=RW2i19bbc3XA3SyMJNQ2sF6TOlcsS81n22E0HIixpBmbrMYqb9YGSUwcberJjDW43d
         IIj20C19M9GYzr5Rn8p6e/cgjZHHfBTW+H7jO9KPwFeK9wG1LeiSUzDaXnyKyiIFflDf
         eCPA2kCpLB/H3+Ip0rYlyub8nxNgOqwM5uhF/0XjTYJ77T+xRpY3XyzEfreQFevc3AaH
         90o2L5+609wdXfIJa+50Fun6Xg6pm2G/EoyfDOytNA9XNfjFJbtc/n7a5yBjsN+tliiC
         pvgK30lpl35Lypkzn/CAsNWr1AeMAzFekPrRmTL+Vmc010+61mvIMlCskyfetrjTfLnk
         jlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700501; x=1790305301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1MvCbfjotTiPMU9xzuQx8OmetQMTdloo3vQR2iBJfs=;
        b=pHI4GsmLPvyxSHBTQW8DvdBKjwb5hIQPel4pE5WgJPrM4q4BMSqzCrYsHdNjURbxCU
         8ftzbwhUz0IiFzuyy1ViKI4EGYPLdpLximlJKgrBz7OVk9eQvme/6hMqCYKTvMVQ7Q77
         pkhM7Freo7OwX4kvrwV5Ak1n2lfYTF9A71wVM29s8VFOFAVK9/Wnhh83X2oqkoosDL2r
         lepwSc39AWwuCi9bMMVIpXUyTa9zv70u8e/slOwVPfMXL91TFWGiopXaQWU+qKdmRXbh
         qt6QiR0o2mlt8eBvqq1k5mUmYXQR2h0TzLCsq5kM2l81LvWP3ue5ho8gq48jobgSp5P3
         qR4Q==
X-Forwarded-Encrypted: i=1; AKwUvBx3VObkMIHt11/GqJ/JW0TfbNYA+V6Om6KFq9Jvd8Em6XEXb1N2Mn7w3uxMuTuC6mV+x9X86Owxz8ETxYU=@vger.kernel.org
X-Gm-Message-State: AFuF++k8ALmcrbcHIQdemqyjAApXE+NPm91n5MRIb86wNBZ3sBsvcFIF
	pMuBRjhnwEsPjtmtlInnGgWb3bQzRhB5Je6QaIzrAovtQEoR5JolyYJZ
X-Gm-Gg: AYBFou3ZicEUHY0AdPA7sC46PTi0pk0roADG8fi/6Qff7/rkhU4Hm8tU7bB+5cvnzA4
	geqoaQqrC8IHl/KocE9C8Lp20Rm2n4kn5k5wDRryrXn6BlxXIrYXeDJ8SFPj6LoXPimiDkoyaOq
	mIsjX1RfeMiss/iq+M/XBV9RNgjkuJ5i8ClDifQsvYu8c+PO1lnPGU9BJt0+Cxy+5SKtHeyE+6R
	b/icQPmWUJHitLLU2FDNeJbS2C7mRhthhhgVSiApqeyf1daFUYK4PNlhnPIuQfsPe+RiQ/dMxOG
	YvJsO1Lpf0rNGuwjY9ZdOtPtszMW7xwzii49C5Acd5ey7+Uar5eJowNGapDpg2zpLTYKwH5rtLz
	N5ltGhUnjGgQih2rrweYOYkw8/bh1Aa6exlkfC7GC1SR/NN+/MMd4cdSqefx4BMir27jsrfANiI
	48apL7onUwUK1E8mRbvEMn0w9ezufRAl0oH1L5qktyKBfTinyfeUyJH8Rtzp5Qx81GNCLuwjZVF
	LKLsNE3KY1+ogGbkTeEnVVFV9NtiCRUoU7OF7HJpX+p9N3N/xaAtqYsc3GjY/E=
X-Received: by 2002:a17:90b:17c1:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-39e54e3f526mr2301890a91.20.1789700501279;
        Thu, 17 Sep 2026 20:01:41 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362e9402sm7969141a91.15.2026.09.17.20.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:01:40 -0700 (PDT)
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
Subject: [PATCH v7 2/7] drm/verisilicon: add register-level macros for DC8000
Date: Fri, 18 Sep 2026 11:01:20 +0800
Message-ID: <20260918030125.315978-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918030125.315978-1-a0987203069@gmail.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
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

