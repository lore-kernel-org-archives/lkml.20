Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02DF55820C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873872; cv=none; b=TCNWkW31mshf8x+g/+qJ6cMVfJ/9cPlIQ4ejF2uQ/GCdTPCgHmfc6DbIU1hnZqEAH0/FsW0x0u/OXWEyHvReQo9yKRKEd6QgtdTZJ12AReIHLwJTwewygNlUc+tARIVvpAD6/Ti3eLwY81trVEI1JGrVjJ7Z2wM7grUFROjuXIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873872; c=relaxed/simple;
	bh=yYvWPIkjUnOSxNsW0N2YuVeYUdVZYIlPEps6riY11G0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lps5ReS7udsl2uBJzGFaXJPePicwIH1dCBVFKuaniuLYYgu3v2q35+yNdBqdOXdLuMU08VW/7r1AlY7bekUOPUZBANwF620+0ZqVbEhmGGFX4Pplnfk4W5kpEDkjCROqeIpOsMulwEeLzUfC9BDiuZ1T0oA0HagIQmVlG2VAI8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XjvBXIy3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XjvBXIy3"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so55779565e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788873863; x=1789478663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RUOCLyyP/3BZIr82/UOzgNVAzirKVjkOzIoxcnIj0kg=;
        b=XjvBXIy3nUzW/LD57qPZUkxprg9jvzCF8s1iFAf/iMimPncXyagvf+sIGPZt9hdkSM
         kNrpZ7a66QeruuRy0QCCvm2aJF4oJEjZa/6kpHTm7mJGlxAAM9v9jnVjh7zkZ3eF+WqT
         VodHCYCoNM3svrSECPBib+Of49gKiNXyC+FCXzCf+tux29nx8/oD2OnNHR9rMba+VmMB
         tvXe4DzLJfVagLBZma9TNxrhcCJn32PmK9/uwhVq4j19ez/+y7HY3tWVnk95THuj4KJt
         LOuTpwLxW0Zm16PrylF9+YJmHlbP0oYbVuT/xuIcEQLCXvbF6/mLqzkkiImYwluaETAC
         K+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873863; x=1789478663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUOCLyyP/3BZIr82/UOzgNVAzirKVjkOzIoxcnIj0kg=;
        b=IYgEaoKCEhq2OQ1iNxO1rUAoy0nNd+agHmlzgpcq+f7pLY/16+fnmt4sei7XHwJsLk
         u43xdH4QJNGCGLPeTq85M9xnZSvRczdbGaQml4ZOXqExBOo7NQOn1RWAnFHBcw8jvtiZ
         1zIofldp7eXP4168AMsXeQeiPL7+hk4zJIzJkEA3siATZNy9jKgOFclqe7g4kNuvoUJ3
         jAJ5qFikJr447WEo+JnPK3W90ojbjEIRdMcHYPfjeB6g32lemL9eXLZ8qrkZIOajPEo0
         OkFcxw6hTLMozltWdjmouB34onELEtNtNMCv/suhhEdwV6XfQqBe9RQKEFHM91zkCGsi
         5U/A==
X-Forwarded-Encrypted: i=1; AKwUvByt/RiPI8CpOcMnV9p6UAVYh5e+3wGgzKQE1C8hlxw2gSEhRHt9S+dVAPHN675Ap1bRghhwh5naopy64XU=@vger.kernel.org
X-Gm-Message-State: AFuF++lNN+/x09jr6W31TywLtZdcLWoSZUEbIcbIrX3mCOZrOBiczn74
	2Hqb82lgNYDA1yFLE6rL55EHWWhwQFCBmmjAgjnqa/H54xgYfIAhJIgs1a2YWbdrS5g=
X-Gm-Gg: AYBFou2Uhh1iBdU5j+8k1lsps5oaY+ObVC+CdgFrzD6z78dEZHaRu9tkZAFWRRg/gUI
	puACpgKv8Mgjq4uZXetLFebGFEnNOmn39eGVW5OtMAo1YMuV/PZR6ByFKFN3qfqRJdQkLFdhWUt
	S8bkhSWgHcE7MHFGQuSrgTom/5Iy8mPWS9hHN9QrkGXmQ1aVU+rm3nTBsk218qGEvWcd8fknLnj
	/z68vtbNFyAFrcZ/WbzfiSrt+9FH/LsQm9s/rLMUGNYCu7+QQDznfaNH1CxXZM2Yq98vz0Btu4H
	XXXccOm3F1cKzBZoRa+HtL/GQALrbMH+HNJSVxWfD2TPjnnNQb/niN3gFfMemql5LracznCIHaj
	sg0/NESpIdwwNdPsbTDtB2CvKd2mHBtYb6/jTT8ylutK5q8lughZW2hsqPDQV0HbTRIDwWcUHKs
	WeobypATApb3rKsyFIgGaoBkUs7Ou2h1j2du+1uNnbLu6zRjo5/RCqY1C9QH0H5qyU+g9Tr0yhf
	9nty3ro
X-Received: by 2002:a05:600c:4e46:b0:49c:fc6e:8cb4 with SMTP id 5b1f17b1804b1-49cfc6e8e51mr249810395e9.24.1788873862925;
        Tue, 08 Sep 2026 06:24:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d07b371afsm298959475e9.9.2026.09.08.06.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:24:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 08 Sep 2026 15:24:13 +0200
Subject: [PATCH 1/2] drm/msm/a6xx: Add CX AO Counter registers used for
 a750 GPUs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-1-284880d6e68b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1220;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=yYvWPIkjUnOSxNsW0N2YuVeYUdVZYIlPEps6riY11G0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqoAyAvByARiXpF/WkqKGE4OSrNQy1qbMA0R+Bxpif
 6NCOXWWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaqAMgAAKCRB33NvayMhJ0bvwEA
 CtKuYZJw+MpFqDcZ/vp5yplaR9VEFBLXXkirgGqhNVptMv0sDDn1j/yRXTnGDhVIK5Bg+zP9C9eysJ
 T3n8rkEhg0/bz2wXTxHsOrK2xMr1Wuvg22XAJ5KQFI3Ba3+9/pRJU4jF4DM8x1puKpFt5u2I48CucI
 6G095COra/sqM/3Qq/FyTpE0qGsMN9XptEnla9MDq+VS6TqPy+t4xUB2fBVjlhNPITo+WzVblYN2w4
 6XeDENjqlENTlVdIYrMoAYbTZEtq2jvVJOik8g8RuMZaZZZHEo/Jp8RsSd1BmxwNP5fMwNtdXxZliB
 ytWq7FByzX6DytKetUWiy6NfjuoWv7Fa1NWbJE+ubLcd9apF/sO0avrZEnhgAbf4846JUoKROsPTDf
 QqER6w7io/mfIeFzoLyuwwQPzykcgTnWEcPm3sXy+3Qd0UkflAhgiKMzIgtVRdDrWIy6HJuAVDScVD
 TIku4croTpsNMhw5vrtYG4AFKjF2xZqy0x/QrD1zzdANlGBXlPPubaivOU3zcHQHj+pmMMijYRMuLL
 6Z7jaIJ1sqJbtHIeCcDqpePVuL//BC7aV5Kc51SwBFh1PvSUOjUC6cVYFQbaLn10S/PSp/xP5qHH3X
 zY80z89nnKkUUWYClwRa02wAmeU3DX+C521L6rkiZ+nVW2ps92FvS0NgMPRQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The a750 uses the CX AO Counters instead of the GMU_ALWAYS_ON_COUNTER
register on A6xx and other A7xx GPUs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
index 33404eb18fd0..3fe7bc3ea93d 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
@@ -141,6 +141,8 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x1f9f0" name="GMU_BOOT_KMD_LM_HANDSHAKE"/>
 	<reg32 offset="0x1f957" name="GMU_LLM_GLM_SLEEP_CTRL"/>
 	<reg32 offset="0x1f958" name="GMU_LLM_GLM_SLEEP_STATUS"/>
+	<reg32 offset="0x1f880" name="GMU_CX_AO_COUNTER_H" variants="A7XX"/>
+	<reg32 offset="0x1f881" name="GMU_CX_AO_COUNTER_L" variants="A7XX"/>
 	<reg32 offset="0x1f888" name="GMU_ALWAYS_ON_COUNTER_L" variants="A6XX-A7XX"/>
 	<reg32 offset="0x1f840" name="GMU_ALWAYS_ON_COUNTER_L" variants="A8XX-"/>
 	<reg32 offset="0x1f889" name="GMU_ALWAYS_ON_COUNTER_H" variants="A6XX-A7XX"/>

-- 
2.34.1

