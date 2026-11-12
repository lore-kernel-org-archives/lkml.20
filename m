Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469963;
	b=kPCREzSu/KfapOreMe6a3TzT5OKEquPWbRuq/XbbWVzKZHCcFSurOs64qFVirWSB1PBn
	 Y7fQKNCd1tc0LCx4AM53mGud+DdvUoCvc6HzcQH6mxJcKRUXxm0dnLyvzVVBDKGIV0vSQ
	 xzygZqxRE7QsXNlAeD3ukbsi5QQRLWji4R48sPVeDt0pIwNIfKo+VKpmDyWDzFrlHLfax
	 ezUtXnZ+EGytifpXvmvAUITRXS+OeMZzXQHuB/odSjqGor257508ZfJVcxCeyk/4ffilP
	 W+RM8bNhDTWxHrLcGJd2ZGF2F9D8Wi6SqHAXrEGgwM2RvT9smzYhhrqLd2y6rG+8whw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=MfIiMtH3vcQ8rnl3Mz2iz7HrvbyC+ZkC2w1Z98pOQoE=;
	b=noILv+xddSfUdLRWOfLdVR1sTj6dkkJAy31msteNTDFXwD10imM+fxq4gTGhMbhHb6ex
	 N/mQFP+HqDtkNhUc9awCDGd4ShYo4KZlo9+M9HRsTvF7+uTpjp1zaQyS5pN0YduMc5+F6
	 ux7uW0J3lS6F2+sFj4Agzr2ZadNhVV3DWxwu9yGFj5CoNSmy5oQS+nxasUUwYr7eSXz7h
	 1glZvfxOPAq2hT8ZXxYLGHd9s78+JdMbOoY5kJ2qeZk/rPfEU6vrvfqdIEfdSUcgihWCA
	 pAFHl0h+2DbSP+4VQkvE23OM79QB0NQI7JVxrCFau+cxhJ4U+YU8uz+RzyLmAtuNP3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FBvRObHc;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79053606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79053606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FBvRObHc
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so350179b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794469962; x=1795074762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfIiMtH3vcQ8rnl3Mz2iz7HrvbyC+ZkC2w1Z98pOQoE=;
        b=FBvRObHcaGUTLBOh5MpYX4l3YsH/d9FuewJxp3uPDj5v4U6Riz/gxXk9PLIUIZcM6j
         c55xYENrxWMXDVY4q1Gfs8bf6tnZQ5vg4gh+/sePoFnfiyMH0iad1S9vYjiIYj0Y6Fe2
         E/LYIpkDkwOqFaTvfeCngK23KdmGs8RIXLUF61TwZ/1Bu1UIvK8ok4vMQh0HWdde+Ojp
         TkPORE7m3x5J1nz2liUAFVJHs4yoGc1Yyh//5j/lMojaaBp2KFVE03etrfEJcqS+zlBP
         3NLXlfVBNq46i0WtGzlxrkHCtTDzyVFirWuAA77hX2e3/FN2+pefslW1DEx/wwYXWVtO
         yBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469962; x=1795074762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MfIiMtH3vcQ8rnl3Mz2iz7HrvbyC+ZkC2w1Z98pOQoE=;
        b=TCBQEmCXxGtoiJv9ZfqOZBMAHSOkyfmvHowIcw4wzvHCOCteQ0Jf/4rZA/gUr7uPh1
         fnlaWC0izVIUw0tuVOFzsI7aCQ5XJY7EOB4/kfGao2RStLxLTTlnY086im/yjEUZz2Ej
         6+Y4UkSJM5LBl9WxgkKP+i0tXbmJGzFXRMHLpDA9czT/5iYa9Avu3LolUx9Lug4OD9yb
         BI5NqanJeAu4X2yAKZ8r0giEf2sADE99iQlgKgYYoeD6hAiPQfx2UaDivSqML/d1PrWS
         vJdckQ1+TWtMLG4ESC9nF0Xslgfqen8MVpaL/NnlYKIfhOCvtOb9PBNBwtz9GBAZDxhC
         S5FQ==
X-Forwarded-Encrypted: i=1; AL+hErGvMwjZofhfMAdjIP5/3dibHP6DJ9BBv8Nkz5SzX0TvIrRjMxJIYV7wtVACWQXy+O6UlwKeeJ/ir8qxw7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AssNxMDTK5kifzpK09dWTXHdpBYDQKMw/Edf7sikOhAQRk1h9
	fKyQrCz+0Y9ZfpSREzKxf0lKh2q7x7YZ7ZSB2vPoJE8jyI8gfFscdl4U6MeUicMW3as=
X-Gm-Gg: AYBFou2SK/06NPNJgv+kLwXGQnXHy4B8Da3ZRH4K/H3cPyk8pwJAVwYhvjwCiho2e9/
	wL0HldUp+xXU7P2OipJPIpUCYbuoIyWKjzaIKALOyB8xEmUBsbDbFRvhIekSMyfEfgD0uUNPZkH
	CwBdXUqAFqLfw4GJTuQVvWYVprjt0+b0kjfHRMk/k2rDVGIdnKLnthR7XjTnJwso330sU1yQTW1
	UNWlOXYL28xyZ1gwvJ5WiHD+AFOsye84s6pcFIf4evGQ6rsJ60ZHPg+zNA0EbEycj8NivdqVyc6
	rgaSTirRnfy15u9klO8fQHJKwn9oH2Rgs/+EJtoVqiotYZpUc4JMZaeQUJgY7DIb6Z7PXQPnxaz
	H570hGHSuiAlD/o9puRzLNm+LwJf9uEJRTn3LwWobe4Z980gOurxPa119h+KYCFVPs9zpNPeF6T
	yJHx37CyuYrpAaFhTlTBzAyEbkTImI6491XC7kDvzxcdAzyMB6BLx2kBVVirnQwetJ2N6wTPIb2
	EKCTvfdQ/6P5025TbN7JlKktLQZ4aqu/zTJ85KcY7yPqdaFe9k2hOEXTaNeB5BqW3zSH8Qn0j18
	pxQKNUlhqWuIf5ohR+8ltm04XzEdMn9jhqT2Ubg/2KruvE7vieg=
X-Received: by 2002:a05:6a00:b41:b0:8a0:3617:b53a with SMTP id d2e1a72fcca58-8bd5cc7ffddmr1156441b3a.18.1794469961776;
        Wed, 11 Nov 2026 23:52:41 -0800 (PST)
Received: from [127.0.1.1] ([116.237.168.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab5f3f99sm3131256b3a.51.2026.11.11.23.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:52:41 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 12 Nov 2026 15:52:06 +0800
Subject: [PATCH 5/8] drm/msm/dpu1: Support wider writeback width in dual-WB
 case
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
Message-Id: <20261112-cwb-upstream-v1-5-a6a88d928aa4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794469928; l=1480;
 i=jun.nie@linaro.org; h=from:subject:message-id;
 bh=b9gZBtsMHkv6i4rFUNaaYmsibNAluP0D+iRz7WdouOA=;
 b=nriIuNstQpH6u1NeHbBWbbt/EWyGeA/Ja61WQashquCcYkdMxW4+ytxZE/H0TKh/NUh1w3eVV
 VZeK6dZRQ9mC9DpmXS95dnr/dImCWX4Ploqmh5peeRVL9BqlJ2sbVRP
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=O9aRQ3+xXWihQiRRgStCET+eFXx1EZs43Fh0Xh+8Bu4=

Current width limit is 2560 with single WB interface. 2 WB interfaces
can double the limit in quad-pipe topology case.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index e7b09013ae4c..b1177e4bd16e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -14,15 +14,11 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
 	struct drm_device *dev = connector->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
+	/* we support dual-WB at most so far */
+	int wb_count = min(2, dpu_kms->catalog->wb_count);
 
-	/*
-	 * We should ideally be limiting the modes only to the maxlinewidth but
-	 * on some chipsets this will allow even 4k modes to be added which will
-	 * fail the per SSPP bandwidth checks. So, till we have dual-SSPP support
-	 * and source split support added lets limit the modes based on max_mixer_width
-	 * as 4K modes can then be supported.
-	 */
-	return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_mixer_width,
+	return drm_add_modes_noedid(connector,
+			wb_count * dpu_kms->catalog->wb->maxlinewidth,
 			dev->mode_config.max_height);
 }
 

-- 
2.53.0

