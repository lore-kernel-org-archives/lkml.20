Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8190E339386
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873882; cv=none; b=rgyyk+PVHluVSOxs+tYE/WWfiK/zbjnlna0BpowPqAdiRr0bkkxUmPXvwKoRXB7fYsnvSReB/o1fIf+fSmKsKivOY9c6jdpWU68lgXHXaRBpeEsuDRA22hlYt5Zh6hjWnOASnj9MWTxAcw0KdhsbLt/hqtGK2pqcmfydQ/j2AYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873882; c=relaxed/simple;
	bh=lTxs5IQG2/5Kmpd54ZU4s/260yixN2la81LhVDZBsks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YXqw2h6Hj/Otlta/F814NFr0JFHssuq7PcnrmiZjO3Y8V3IJIN48m565dznd3l1+vmyvYTYzTRElHaOYe+JopF5D3TogrD78uR+ocLVsExqySL9qV8AYeutTmif24ApqQU54pRgfYKAQUmp0eGa5H3cpnMqFk0sKQsvIGDnClR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FoQB2vL8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FoQB2vL8"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so36417705e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788873864; x=1789478664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0TR0sJR5elynErLxudc3GJkwyMUOKu74/0krFherX0=;
        b=FoQB2vL8409lc5TQwU1tuQj/LOYKQTb6u7XjHaaklTW/hI14XqbEm33F0YvGbaEkPu
         bbe+FcSZ0a3YVP65USjOui/eVQJPAntqBgpm43+N0XI02AgRQLYe0Rj7WZ4+Zl0u1fyq
         BjnbLJPAVpsnpc9hR+PfB1FNIHFZghkjk6BpxL+tUBMMRYOufrXWZ9l+7C0KpVlFrUEr
         yDnQcH9ykndGjaTnfoPrKXol4OafR2CH/o+tL6dwWL/+m/CyAOtRIr1I3M1Jh7ubSBIz
         ce+5p7m/cYj3uDcGUGJG2Du/Nqso6y3h/I/qSkALaSJFu3RhyOLQC/IDVoFqslFp5ATB
         6bMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873864; x=1789478664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0TR0sJR5elynErLxudc3GJkwyMUOKu74/0krFherX0=;
        b=qZvtSS+r9yYN5LSO/jhJK93aHKALhin2DBnIXqqqW7FPr79VGGsS/Gawll3aEd5gzn
         XLsZJvj7iViKAhMl3Y0G/1d1r40lpQQWFFXEcuiurie8BoX2w8Oik46B9kPUsOs4soZS
         anC0ITnFHGMtljN029gwsJ384t2TdlzNY+xzWT98h0JUNsUayXcjMBVLNSlu5Am1Vq7Z
         sMxsR6rx1w57kAFwBUmL+S5NtmnA4JxMEY68pkSwLM3U+je4PIXFmlR5JWDkL34CzxsN
         dU+tu1oR0gOpACoZMUddBkAayPE45wTkkVW8cBMVMw47JVszksWm6SQxEIjrhJsabD86
         uJyg==
X-Forwarded-Encrypted: i=1; AKwUvBz/6tCaNsZUWMQcovDI38y6mLaYKAB3wnNgtQ/S8BlAje0CdaxUbD+fIEkevSTokO8/L70sK22OlO4MzTk=@vger.kernel.org
X-Gm-Message-State: AFuF++kYh0I2XtB+bFUdMCTG/afnidj0LuIIdKQRCF2Vfg5/Uj9DxERS
	6/B3SxXlyYVtnXotttgi5bWBDqAte3HroZbHWVQcIA23h1b8Rs5WDqy3dHkbxwaJWv8=
X-Gm-Gg: AYBFou3vgPNVxO2yDNywXxp6SzejTRFC754K735UNPgO2L3n0SybKleCVk2DEpViuiB
	5uPt/iS20+emCSnyu6Zte9C9wRGYc84d8ROZ+xiZ16v+jOPMMbx2J63xfqBJI0TOElnpTSgAp7o
	YWQwi1RS9UDSBFxYH/zRN3MT+XSLVkKRBXUyfnBrS5jTflgxEgzQs7/v4rmPhcMF/C9Ke3HTCuN
	DvFIIm6q5ZxxfW/wREMQRER8WuhVjJV2IhUuvnZ1t0cutkhw8JAOOjGTDooQCtrv9xRu6qQ8mof
	5Yc+F3/yDcn4yRJmB7pN3wDxf1I1X4rbSUUZgmymZNmw7MpuuGl3zngsP3D1OgDhxydJeWFq7d2
	z087SAgnwceen7aCfx32I+qYcRL6pKct4DueLslyx4hqk/SA+HWnkO+pZjoYBvUN38omggLdS5J
	QbrPx39QDTlr+3HlMz7VYXAkbSY05cBMDZ4hjxmDlXb1DgURpy0PJIBZZQVZ5qaVB9aIjX7qXlG
	1fEDffV
X-Received: by 2002:a05:600c:a49:b0:49c:fc6c:be0c with SMTP id 5b1f17b1804b1-49cffdc3823mr223604815e9.18.1788873864056;
        Tue, 08 Sep 2026 06:24:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d07b371afsm298959475e9.9.2026.09.08.06.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:24:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 08 Sep 2026 15:24:14 +0200
Subject: [PATCH 2/2] drm/msm/a6xx: Use CX AO Counter register for timestamp
 on a750 GPUs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-2-284880d6e68b@linaro.org>
References: <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-0-284880d6e68b@linaro.org>
In-Reply-To: <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-0-284880d6e68b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1479;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=lTxs5IQG2/5Kmpd54ZU4s/260yixN2la81LhVDZBsks=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqoAyA4vMrnOAdDDnXQLU8O6CGKN2a6I2XPJXTMela
 hNLPsbeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaqAMgAAKCRB33NvayMhJ0VSND/
 kBS12+xPAnWKPwxOBAPU+LYGk5mfWYdzc6F1rGMbrOGjUuZ1IdlN2lEaerEpIKZZyfmqoRal6xzkJo
 e3g1wv8EglBOGdLCYua952EMQof9eVztL9slS5TzmrMWroAVQt3DoPPTmCr3qpSJf7s95NbOnPsE2o
 8BgAWYsh+0KanTlDewh8SGKfOA8TVcwA/9GHdBjLdj4LkoYjBYUNrJfTWC1tSV+uvW7o9F2SWwONlh
 ncRA0BQA0D44aUtnfhBA66k+sVEU/Wpt9ng6Nft1DM+nJAMOcBdNIeYVAByHXvGYqSybmDw/aJmTd3
 Ys8K4dOMl6awY/FYuLKl1SMXed70tc2zHGjAXA7eFmMQ2b8Qrpl29ORO1AHRaLzsULYqt8TusXrTzh
 JHFVYGu0WrLe7XuPZuXKebgOPOxnGgLoJFBU0SmnzI7k8ZgsVY1fCfLtwdw3q/m1u9RREHTK8urfP7
 1S0VK6O5QJFUpMwgywYshFL9vwLcuy9JCoMNj4elA/uD05+aPLTqsRDCxIzibnNcUI1pDqtFOCYatY
 DDdvL/CCJjtpwNHH2BF8EsH58egBOsfYMJbR6ocfU8ubYaU2HRG6Km4M/IsfoZNVwyjDMjmoHX7/uc
 lmCrIaEGpHQqEgbmiBH1acXwplidq5roHDUpgS/YlbTlwWpNTe5V1HFamfAA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The a750 uses the CX AO Counters instead of the GMU_ALWAYS_ON_COUNTER
register on A6xx and other A7xx GPUs, use it when running a A750 GPU.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index f9de9329dee3..081e79ea4652 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -23,9 +23,15 @@ static u64 a6xx_gmu_get_timestamp(struct msm_gpu *gpu)
 	u64 count_hi, count_lo, temp;
 
 	do {
-		count_hi = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
-		count_lo = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_L);
-		temp = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
+		if (adreno_is_a750_family(adreno_gpu)) {
+			count_hi = gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_CX_AO_COUNTER_H);
+			count_lo = gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_CX_AO_COUNTER_L);
+			temp = gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_CX_AO_COUNTER_H);
+		} else {
+			count_hi = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
+			count_lo = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_L);
+			temp = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
+		}
 	} while (unlikely(count_hi != temp));
 
 	return (count_hi << 32) | count_lo;

-- 
2.34.1

