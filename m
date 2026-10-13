Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B190D3D5642
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881105; cv=none; b=pChHSZAmV646vC15hy3hq1FlibrZXCyVUeZNSV55fLfSBiHPBmEC0QNLa/vv00vSJDNO1qxHNudzAR+JIV6CBaZhX1EgP/s7SEOYQKvTjuLw5ziE8FxDCMx0FCsyohdA5+6L1R5kTSGvAj510WuSwHRoO73vGTIzTIS01hnCqOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881105; c=relaxed/simple;
	bh=dxKfeZhOUBfoOABK6avNg8yWkrNm3eKo5a6h24zOq/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JJNGaUQV5/un5OUFP+N/oz7YvCjrhwYcMaY7N3FiyjZdJSJtldtatkvfNva4KH1cczKO1AQcNI/wLLBtkHZdDssXP4rsi3kL67aPKJsquClk+eTWoC7Fz7A1oWlwhxHEehiMdNc3vlptA3hBnBg6L6DAQnniLhUdaINK9x/4Z9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=GDqUeDk+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="GDqUeDk+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so24768235e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791881102; x=1792485902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uy6ZTAPdrtna+roQ3ha5CHRS7kDT58kkQWnsjxlLZa4=;
        b=GDqUeDk+AndIxvEEdMCxwBWMMlD4q+YQ1qFje87u5qziNnRcyA2BTYuszow3cb84S7
         +D26tYiSan6svgPs2M6p181CMDIsyQmzAf7tCA7gC+VSjyP/IvTVvQT71+oMwJye31Zj
         NzqQGubBxnbBKWEnwOYvF8HjwGCS6/ocl6n7mJdmeevZf1+3uy2Dz/s4H8v5uJyVDSSc
         QSTz0OQMEbQPKJIe9cBQx0g4+JGu34/3TjLB0tS6ALkAkRj+Tfpr2rj9HDa9bbFBpmFf
         sMS7ystL8y1KcV3e357VNbPTIGdGYHVl8F1f2+1oGRQtcWPptm7+8Cz1LraDIPQnQQLa
         GozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881102; x=1792485902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uy6ZTAPdrtna+roQ3ha5CHRS7kDT58kkQWnsjxlLZa4=;
        b=G90CECE4S+r9vwjqKCVxXgyJxSzotQ1Q7NgUVzpZOoIv8m7kKVP+7+bLR+4Fjtlak/
         FogjsetXwGl/rAfMoVT2rNo5PHMZOTjChZT0NbdAIhEePvvzIoKsZur4nIpis5ywWQcH
         f3VOk4rUyW1fpA7qEmwpObkXfk5gVsQObdgPdE8Jn69WuIROCQWFwnDpOI43NU8q6UYS
         j2JVUGBTNjNCat7Nwr9NGDBFQRiGg799CBfbpmLD6FCZWZ2d4YGZUInUBkThRlTTRahK
         1yDRRaGLkOIbPMfA1CZ5DOlc+fC2l5NCCdpGiQFb1AkULa62uiDkF3/ctkwDDT51Ik54
         M/Wg==
X-Forwarded-Encrypted: i=1; AKwUvByt8EGCLDKvfjfnU5HYbAVh+3sHOfWXh5mH0Q8yk4Ham1ouTnd0wuJVeI4/3QVUfz2H6Feuw7Kq1bys5Z0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKr8I7ClYEpyBEGQSWZSIghQkF6HHqGw2Vw3ZpewfmbvUcM5IWA
	9b8Txi3GKSgy4Hvkzb/4cVMcxSAK41lqTUGpd5ba4dPCre8O4mtQZxuDreaGvIboDws36B6UkPs
	ztMosqUKDzQ==
X-Gm-Gg: AYBFou2e4hbELKrtQMLhcCTHIVlftN4JIFXJpcrY4/EU1L80bLLWb40/mK7K/+y0TOY
	8m88Ttx3XEyNL8EcTGgJrEnP35HQWak2iEO7fSxMIL6igCAeg1Vpe5jNovLrO8UP0UpUaFP8b7Q
	8MSASxwbWBwyCI2bGRCQnvD5a7NUhdQ3dT6Mw7XZl4YqxaU5VOdgHP4LqnqIlcU4y1u4IP0XasN
	lF9SoBRE3POHNHwcdndN4mSamap8A90kPVhy6INbHjOYGb7gjD2/NfW2RKYxvUBsQR4BMn9Fawm
	DQncix6+AAPM9X4axxsOgIqXYY9KXyxr4oca4PCJBInW6XGohQ5vG9MHYUGs3FNrJo1k+CBDBi+
	aHo1cRp06lQT9megeQf2aqXJ7eVC6GkBwuaIcDXzxvP23WbOGGhbQ3j26vSqcI4pnVMsXP1bkhZ
	JihOoUa4gF7wh3itOtaI5owXS2dqoaMkvsWzbrsWhMfl4q69tlz0tD+qH+oZsENgmw4CQhH1kWO
	8aiuOi/46MK6jJEqvkif9m36+PhxP1Cj04xYQBqXCbI+pEdSuhL0vGVWsH7nT3djA+Sa6nWCOzG
	gMahGTSiKhyJCwuQ4tAkXwAmURs=
X-Received: by 2002:a05:600c:3111:b0:4a0:159b:d2a2 with SMTP id 5b1f17b1804b1-4a18e4e14e8mr216701755e9.29.1791881101852;
        Tue, 13 Oct 2026 01:45:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:273c:cd01:6dd2:be4f:50f7:7ed8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c85009csm271888055e9.2.2026.10.13.01.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:45:01 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Tue, 13 Oct 2026 09:44:47 +0100
Subject: [PATCH RFC 4/4] media: qcom: camss: vfe: Add the IFE 780 pixel
 pipe description
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-sm8550-camss-ife-v1-4-d50de00077b7@imd-tec.com>
References: <20261013-sm8550-camss-ife-v1-0-d50de00077b7@imd-tec.com>
In-Reply-To: <20261013-sm8550-camss-ife-v1-0-d50de00077b7@imd-tec.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

The IFE 780 WB gain registers only take bits 31:17. A Q10 gain there
reaches full scale at 1.0, while the 0x1000 used on the IFE 880 reads
back as zero and every frame comes out black.

Its demosaic also leaks red and blue into green whenever green sits on
a black level pedestal. With AR1335 colour bars magenta comes out white
and red and blue pick up half scale green. Subtracting the black level
in demux + BLS fixes it.

Describe both and use the description on SM8550.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-780.c    | 3 +++
 drivers/media/platform/qcom/camss/camss-vfe-880-pp.c | 6 ++++++
 drivers/media/platform/qcom/camss/camss-vfe-880-pp.h | 1 +
 3 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
index 032786c4ed74..63fee6ab64fe 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
@@ -238,6 +238,9 @@ static inline void vfe_reg_update_clear(struct vfe_device *vfe,
  */
 static const struct vfe_pp_desc *vfe_pp_desc(struct vfe_device *vfe)
 {
+	if (vfe->camss->res->version == CAMSS_8550)
+		return &vfe_pp_desc_780;
+
 	return &vfe_pp_desc_880;
 }
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
index 87e6a241ec05..2d58d31fddec 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
@@ -374,6 +374,12 @@ static void vfe_setup_demux_bls(struct vfe_device *vfe, u32 code)
 	writel_relaxed(IFE_DEMUX_BLS_PERIOD(1) | 1, vfe->base + IFE_DEMUX_BLS_MODULE_CFG);
 }
 
+/* IFE 780: Q10 gain held in bits 31:17, its demosaic needs the black level gone */
+const struct vfe_pp_desc vfe_pp_desc_780 = {
+	.wb_gain = 0x400 << 17,
+	.demux_bls = true,
+};
+
 /* IFE 880: Q10 gain of 4.0 */
 const struct vfe_pp_desc vfe_pp_desc_880 = {
 	.wb_gain = 0x00001000,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.h b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.h
index 0a5ee6d85312..90e118fa5bde 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.h
@@ -12,6 +12,7 @@ struct vfe_pp_desc {
 	bool demux_bls;	/* subtract the black level in demux + BLS */
 };
 
+extern const struct vfe_pp_desc vfe_pp_desc_780;
 extern const struct vfe_pp_desc vfe_pp_desc_880;
 
 void vfe_880_setup_pixel_pipe(struct vfe_device *vfe, const struct vfe_pp_desc *desc,

-- 
2.43.0

