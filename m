Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469983;
	b=wh+xXU8nmQ/gqdFykl2B3FRRsUFEnavBn2S9aljltmP9YWrUmdojk7uDfyfQxtLjzgpR
	 GbFCTbPvs13gchEnYtwqZKeS0TDc7LiYpjBz17PsgHvWpJ5naIVom/3ocFzpNoKkhOQbr
	 H/0888WYHrJ7JOFi+HqGG1t+agBWy7txcPhf8CFJCAPjOZgLr6yD4zh23cJqOTwFH4AEv
	 myRVudMEE0Zl4z98zTu1417NSKHyM4tlNcETBbCawXEMEORiPY3nJKwY04yNVbrJ9OLx4
	 bwONC0BFVJ0tIvayATZxVOZDBWEbcJSJoM58yEmM0WQrry2bvC6ldtA+ByJmD3QCArg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=M7aNgwut6Pkc4vihJRTUegbGMo517hIzijJR1eDiHBI=;
	b=4Izw+hKJzCrKsHC0pBC1Mmd18algctaa7uXIAn4cCC4AafBUdW67zL2B4h3c+0/bb/x8
	 FoGtAaGpZ8iwYdOZqLrNf8ewPmhYv/RqhWPFpo4OwneurNkyTGKA1jd/JDA4miPyxUELX
	 jHd09tNGOmb2jSxXO1/BDN4gv0jDy54T0BaVoS8qhexK5jFFXEXbuiBvVlPdXF1WQrCci
	 u8SYrLurT083JwqBLy3o44KFnBFXyfyeB38j5UI73NvqayExlx9GNKFfmNur5hqM0dTLz
	 0LNb/L9o66riZ46Kc141xEccODzx5PzjxOsuYpaLay1wA0kTO56BA5NSOl8r0JjTxMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Rb+EikeY;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27383606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27383606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Rb+EikeY
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc147d86bebso344576a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794469982; x=1795074782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7aNgwut6Pkc4vihJRTUegbGMo517hIzijJR1eDiHBI=;
        b=Rb+EikeYH2msmOML0IpVzbXgegGDdmInjPT2PLcH5pP/5NJzRihQHXU0qHOBbfZOrE
         Uh40KsIecUD5th33vwzerwQGtZ6AQzjuNMXfeWCbQt0ktOfTZRP6Qwpa8tcu3ML0rSs7
         2byz0PAxSekGfTSx6DqWGErXe9bTRmV/uIKZGQH08+xGxVW7WoD1cw6Q9rusHWDOo6wn
         EFA18kU0YilYCyx2ks7KBg6zidjRdJV5frg60zTnw+NDIyuFcE7OcGxkml63tP6OXdAF
         X/o0iW34mEwuqhjFk+Q42AH2S1sLrBf/A1wH0tlMlIwK/v5NVe0rVNhyp++0arVYR0XB
         uiBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469982; x=1795074782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7aNgwut6Pkc4vihJRTUegbGMo517hIzijJR1eDiHBI=;
        b=I301GbUAsXoFYZE7sefjAcAs9IfjuKYq7Oh3pEsnfv9K1kF45kAGZ5+iwYKnLJ4RKG
         koMfORIVT5jcLn69uMEkYT62h+p0rxftGA5FWakvFW0aLPh/lIU7iaB5GPpGl3r7YD8O
         rwqtPt+douZBj6lcZBIwjTP8Uc3vW4qRyjpgaanHd2rZ5Q5CNtKgp69Tbdlbj/5ZcTfQ
         nlNZoKDda5tO27pmKFYqM3IoYktaNwce9UCEqagug1hlPp8CBHPuSnSBaPA4IehzoGFW
         YLD+3uW8niY0I8IpX1RheCtTlg413rBVt6IPJ9HO3Sv4753DjYmo2uUSQzQjlfYIbb1D
         cjpQ==
X-Forwarded-Encrypted: i=1; AL+hErHMPPRxw6GJmAMz91EZYEu6FFlV/UgFFYvyo7ufHDfvXcx+mSAS/ebEF7L4b+j36ZL0s6bYXiNUT0+M4i4=@vger.kernel.org
X-Gm-Message-State: APuU4Z929OI3xrekFi7OgKaxvFtkuiqAyuhfbWkBWEmS6KdDgs75C+Tj
	iNrD2zJLKcYLLB2ow7fh8U+/m4xltcEQF7RgVWT89cWiLqgAcHvPXiUbAeOaHsjcvsA=
X-Gm-Gg: AYBFou3h6vRH3iK6vknApURmjtQcsLjIoXr/+FmDpLwa7xDM1dOfXQRycMvmC+zYtaE
	yiTr50eZKHDrimFffQaXOyENY5vuS1mVitLH2xDJKn00LDWWSX4uCyfygLpwkmKqClRgMjKpMTv
	JLizDsgSr5QLS/iUEni1bP3PtD7H8xwQoUq0H9i7XUN39/KuJRMiRFguGvfuDDM0fCqY+BQorOV
	lQV6NfDP5fqVUb73lu9fuosm1oAMYqXxyReDlvVUG0tZfFfvq/dg2ZFk9mB/FFLggcXY+8WxT/0
	z6NodQM7b/kzinyrnZfB4vXb76ZsR2nMgWLhhG65adIL8eNsPuAbuehU1wcQNYHPcTRovaQWJOs
	gKbG24a0e0YnxhhY/eD2+OBBqhuE9cVrPiLaFIgaEsK9nW6ns1q8SluJA6dgV76FCdpBq+nKhgq
	5Sj1Qu+pNgseZiAs9CisAP89Bef2i/i9kqjaUiTW+1EyspyYDm+CkB9SX0ETD6sHWcqwrF6IQpQ
	JUTsdSGm1KKYXoqnm63SjilD2Ca3Eq5xk8wCoGcjmL+0H33Xwd8Jkd/qRTYXZ76siUv4qnqEzkJ
	AW4pA73oirLb2Y5yrHNOp0/r1HRF1tXciL3wjglPtDB7yxfDCiE=
X-Received: by 2002:a05:6a21:3e0b:b0:3de:57da:7fa6 with SMTP id adf61e73a8af0-3f631b8bac5mr1129232637.39.1794469982178;
        Wed, 11 Nov 2026 23:53:02 -0800 (PST)
Received: from [127.0.1.1] ([116.237.168.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab5f3f99sm3131256b3a.51.2026.11.11.23.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:53:01 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 12 Nov 2026 15:52:09 +0800
Subject: [PATCH 8/8] drm/msm/dpu: Add the all WB interfaces for sm8650
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-cwb-upstream-v1-8-a6a88d928aa4@linaro.org>
References: <20261112-cwb-upstream-v1-0-a6a88d928aa4@linaro.org>
In-Reply-To: <20261112-cwb-upstream-v1-0-a6a88d928aa4@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794469928; l=1060;
 i=jun.nie@linaro.org; h=from:subject:message-id;
 bh=b7WDt00uQDDX1aGwCR8y+UiMnK66w5MHAcAsR5IgoCY=;
 b=JFbfRJDpW8UqYouqr6SrrMmcYZaVK8J9uqILmonXoCX21jGi5cYcWkFvkU7POyec+KG+7HOU0
 HPjiFBu634wAJqeSBX2CGYMriG/EIPVgTAnM6RKH6qIDj+heWRXaub2
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=O9aRQ3+xXWihQiRRgStCET+eFXx1EZs43Fh0Xh+8Bu4=

There are 2 WB interfaces in sm8650. Add all of them to support
quad-pipe topology.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 2eef5f69832f..e9fcb402a34c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -315,6 +315,16 @@ static const struct dpu_dsc_cfg sm8650_dsc[] = {
 };
 
 static const struct dpu_wb_cfg sm8650_wb[] = {
+	{
+		.name = "wb_1", .id = WB_1,
+		.base = 0x64000, .len = 0x2c8,
+		.features = WB_SDM845_MASK,
+		.format_list = wb2_formats_rgb_yuv,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
+		.xin_id = 2,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 1),
+	},
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,

-- 
2.53.0

