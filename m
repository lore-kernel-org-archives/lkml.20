Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B454559CAF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959266; cv=none; b=DXvzpBjzXLJ8GQsu7OmT2ppZxNed5XGbwTiNNMqal41ktY+7KR0hH3Q3+FnDxHZpHbdmlQcdWZ6ebnE+XlG+6HaLRT/0ign8xzgvYRtMFljcTpGsY5oU1yB9XWvBW28ldidWaPvv7OF7JAtv4E3JQ+Q1f+M4tSmj3+J0woLjeQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959266; c=relaxed/simple;
	bh=F9UtKl4B6t8wbkHKbIW9J3bu7weHA8+ItYSrU6pYN94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TQN9UzJ67a1R3dqkRNNYIY8M9d/sureo3XS9jPFJzF18KDUmTIbruaEFnphSi4JsZSaAgPQPr9g2V2AL6XV3qk5bxWswCREihwcNds7Sce9sIialjNmL8raWQDw+62+JIv2KO2kJuwzUwv4LXs+Kj7T/M1GcmvBMbpniwXMCCaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EfR/VxvL; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EfR/VxvL"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so4316532f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788959262; x=1789564062; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sf3kDe6vLMOFTu1A3Jzs1A3L0YjE2Jrq1HnW9/y61N0=;
        b=EfR/VxvLvORVzx3CQFn1gMWVNu/fXjCGd+u36+4FAemU/s6vbzUo+RbLeqO4J5be62
         d9C1/3fc6O/H5B2ujjZ1GZ9H2S2628TKTamawG1rLcUWzqTshOFKlD3Gpx/jhbRMWK5S
         v03WGmIsVvSP9OeOUdooO98v4BPD6sgt1Mi131ZXGsv2rCT/wQsGojTu6Hhp8Q2SiX89
         5gNiR4VHgeA0wZpsjYpfwYZ0tNq5ki7ixWXyEmOTA1A3dN+lzUaV+giYNGWM/W94v15L
         xpGSWsjT3T4Jd+7DYsu65eqWhZEumJaEFdNAUWslsROt0GQh5waIj0KTsYqFlCZttZLy
         iFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959262; x=1789564062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sf3kDe6vLMOFTu1A3Jzs1A3L0YjE2Jrq1HnW9/y61N0=;
        b=RXqGoQX9RbuYv05dhOIORUp/xc6yr2zEZRr6Wz1vdt5E83AK95IrhC0yB+LvD9TyyK
         FXM8J3kMGTEPw8pOY/TjNWJnQgs5ygcuEjartGYdL5uDuv4kYU9dzeJr9HWN8qJDwdp6
         4/HjeR39pn05nZ5HyIekZozMMLXngyxF7Srs2lorRNNXAZFyX93tibnF5F7ruWiE9WoU
         EoWR3q3a3sn+Wu/eTi37pPZFtypHw/l6WHPtz9+Q4gxYb5AbF2byjW8jo4KM66r9T/VI
         XHbzTUgqIkAY+MtEMxJ/lCrJbO+X1UyXRHAQetqZzVZPeg1Z5Ki8FJupMvjbmRolL/By
         I8lg==
X-Forwarded-Encrypted: i=1; AKwUvBxeXJ5Vb5dImeJoGSc7UqYpHq/+U78fHDdse9e7865/JfZ0XgmQzxA9agtS2DNS3uwlA/MkQmbTVcdOsTA=@vger.kernel.org
X-Gm-Message-State: AFuF++mbELgVlrwSDliB+uzwIn27aTEMhGY/Z0eklMWQPVtRRU1fHcxU
	lW285tBbh84JMkAmaqcSm375uYCRbX9xshUiwvpHzJMX5ieJkGx14ruJhSuJuNp44Ls=
X-Gm-Gg: AYBFou1qPGx95UAW11jaZ50sE+KGp9vbvR2U2n76IH6KS0xwxZgn8L6wUSaENlbUkkU
	MvLFdle+DC6BSVuw5ayGf7iLDG3HgK6jZL7VWshgkm3rTVAxSY/kKtVvM/3Rv+SKyPxBxPwrKwx
	pwU5+ONH9A/jSjh2l634xa7PgfBbuNQoKiuvnOm+bPq7Hacqqk/uIEGbuJgIkf2twwazH4eTAiu
	NlJ/0x3HoMFDX93doiV25eVVF8sznafT7b/Y9wrhNBu4qr90sjUcu3Uowlgtdv+Ih2qAIziFcoI
	dv9QJAmDFEhakdX9sQBQ8zFZD2Yl8H7TQEB3ZUV8fzth1ncRqtyBPjjDszA/do8hl/+ruyoZDnu
	txtAdBdmnjvRhSWjy6omIPnySxun2g2dJHtGWkbYzPHijYUascDHfZnq03mT98daAc7OsBJvtpG
	72g8bFz8s4n5ty4FymLQ9GWTZIwjIhD05oRR+NVF9ciL8/WnwSsgUAqgYQL0C3Zy5wHBafZSXVe
	XktTnVgT37bBIqcYqM=
X-Received: by 2002:a05:6000:40c9:b0:485:b0a2:6e0e with SMTP id ffacd0b85a97d-485b0a26ffcmr3240438f8f.24.1788959262300;
        Wed, 09 Sep 2026 06:07:42 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883927a3sm34031175f8f.11.2026.09.09.06.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:07:41 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 09 Sep 2026 15:07:37 +0200
Subject: [PATCH v2 1/2] drm/msm/a6xx: Add CX AO Counter registers used for
 a750 GPUs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-topic-sm8650-gmu-a750-timestamp-reg-v2-1-091d74958951@linaro.org>
References: <20260909-topic-sm8650-gmu-a750-timestamp-reg-v2-0-091d74958951@linaro.org>
In-Reply-To: <20260909-topic-sm8650-gmu-a750-timestamp-reg-v2-0-091d74958951@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1220;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=F9UtKl4B6t8wbkHKbIW9J3bu7weHA8+ItYSrU6pYN94=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqoVobyq26GnIpkdy6FzKAuEhbx9QR7aKpHnSmPRKH
 ZinVqHaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaqFaGwAKCRB33NvayMhJ0V5nD/
 0eM0YwQTU29l+Cb7wkg9KONqEkXNSerFYyomOk1Ei/FYnvg0Sg25LM96S6UX0iOADZ+xQ5jjEevn3b
 Bn5ZHvWwKTNA2BS0GiLZvkrihtzql2KaKpekViV6IV6cjb9CU+f+AL1q7ho1TuwX1ZvGnB5p4sGfWM
 unzFyHyEoCD4o+xwLkKfB0Y6xsRnwHtg3ulEodDFOTXPy0+fIotoLLo0c2nOXjtuY4Yh5ppI+aV7yX
 NKqge6DZEg6dTyELZXchyy23uqYpVzz1rZ0/POkgTCMCUmFZgsYcgX/nquHJuvrfVtvyWdAEmo9PSl
 qE/tL9CCOqpNrD12B02e5mvVWuz708IBVV5stqr9ERhI/iDMxT5Vw6HNUCAqkreWhTaF/qVcUcn6l6
 fgBLreutoP1mQk7eUgXJxVttd4jSCvp+Q68C610TsV5fUTG8n4ynwmzcjQ+ZdmhbY1GFkD3UqVulii
 1CCqIZbErl64jwcrrgph6bR13NtiEEGRicy75zWFahqxifo3rE2d3bMVY/107zTqfqAljKyklBi0XI
 8JoC9ZON7ESbaQ6DfoRT166ze9U3OOdDsLpJDi7H8Y21cmtLZrRfLnydVJFAl3F/PTbdSw8DjlE+WI
 k/hbukm+4jSYwmJXCuSh7tAR9T2F8xoJ45FsfsAkbNAyvcJY14AODjrNhMrw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The a750 uses the CX AO Counters instead of the GMU_ALWAYS_ON_COUNTER
register on A6xx and other A7xx GPUs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
index 33404eb18fd0..b3082738c99d 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
@@ -141,6 +141,8 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x1f9f0" name="GMU_BOOT_KMD_LM_HANDSHAKE"/>
 	<reg32 offset="0x1f957" name="GMU_LLM_GLM_SLEEP_CTRL"/>
 	<reg32 offset="0x1f958" name="GMU_LLM_GLM_SLEEP_STATUS"/>
+	<reg32 offset="0x1f880" name="GMU_CX_AO_COUNTER_L" variants="A7XX"/>
+	<reg32 offset="0x1f881" name="GMU_CX_AO_COUNTER_H" variants="A7XX"/>
 	<reg32 offset="0x1f888" name="GMU_ALWAYS_ON_COUNTER_L" variants="A6XX-A7XX"/>
 	<reg32 offset="0x1f840" name="GMU_ALWAYS_ON_COUNTER_L" variants="A8XX-"/>
 	<reg32 offset="0x1f889" name="GMU_ALWAYS_ON_COUNTER_H" variants="A6XX-A7XX"/>

-- 
2.34.1

