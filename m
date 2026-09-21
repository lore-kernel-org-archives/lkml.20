Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC07F475339
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984666; cv=none; b=uGKZ38jYsRAtARjmRDvZLxIT0fIPXIX2DD4/yFIlQ5FTrpF6wch2moZv5uGHpVYYsQwwW2r6LjhHH13C7velxGwZjNLhXgK8NgtUzfnaUMNwE8jJU9hWk1VEqbhOJBCx8Gql8CtbGJgaSwhqtbVWiNBoG00Ukl7e09bF325eFIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984666; c=relaxed/simple;
	bh=i875AYKR7692m6TI+q1mLN0BoE/Exug7bMQ6K0PhV68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KRiGJS1PcHsq/RFGkM6H68RuCtEeqRZYpAv7C9na/tpuiygbx0cn40Km0fUjV0P8N2xX+LJrW3unya7MNhLCnUTLdZ/YUFJUZ9OSP6VPfsDMl+gQ2rbV7PvGpgRvM9SPGDGvhxnWbp4RXIa3yj354t2cXNFDCIvDv6mmeRccYuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aOcQApyy; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aOcQApyy"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f635552aso2284686f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789984661; x=1790589461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmVqhVDjsbCPitoyrJad06jlhftAP1UlcN5QiFNDWgg=;
        b=aOcQApyyDPCrCDVIgoD1sIPtyaAl2ofqBKdFN+x+Z1O2OMzI/PhPgi8fuDAuH6xdW6
         xiEBfHQMLBhDz0o84UzioY7m61NqPM49rV6buU/l87eYbtoHwf1JLxCLzG3LAnC4HTpa
         6aLj7dr7+xUIfCHByWeXupL/60pZNz7f3Ulq4KGp3IKI9f3nCYnWazRVEssxkcWbOAp8
         FbdBYcaBUBBcSTvXZKeUdExln5C4f8h57QkPvuTjH5vubZnJlYb+ICuJCN3np5nIyLv4
         ytb3/T63yAr73KMbPlT10evt7LRE8qdpsIAIsjqOoqDsv4TQ8fEotefvDa24BN54ReM+
         G55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984661; x=1790589461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmVqhVDjsbCPitoyrJad06jlhftAP1UlcN5QiFNDWgg=;
        b=N+itStgnz+KPuVLOxIw95qyDsUTypi5rTdXaKpTNYaP1G+w4VztPlN4sbZFVU0aHPQ
         7LoFBUS3a/yWBJV/h6MNKIPGYD/4l+16SrNX2lIolOzynuApuvNkObyFCDCooLCPaYCZ
         Xka+bp3txLIPh+RWpW0inlpfEZjAXNQK7Rcaq7oAGNoUlPG+6qbvL2zRIekKH65iJpaA
         zpd2CWYVpdeUm3YXLQ71xTKfvYYCQjrK8YCN/9FgdMhg9LDrl/3btOiCUzO63FpI5kCm
         piQ64ieKiiG5Sgz4zLQ7Sbs+RBq5P6GI9//tMizeJMS1x1TX9uk9+aNwowT3+1OQESDm
         uoHg==
X-Forwarded-Encrypted: i=1; AKwUvByg26evOBEqwA6Tp1MU0ADx+tJ91VPADRU2O2F+98VgKstXMZbG7GUL8tFKrBfVVvMVB1Ewvt1nDKNm1ug=@vger.kernel.org
X-Gm-Message-State: AFuF++nGsbIp4gXlVG5ihxdyxqjK8ftqK2ZGLEtiLocpD9s5DTbczAsS
	Ycbnuzr4yBqxJn9pEyEVCizjklULvtxkwP73iPF+R0Z/i+sYoTw4HEtjxzkABR9TSNg=
X-Gm-Gg: AYBFou3Cu3Cygq3trt3u2cdBhjwrofMSSKypZaOLaXtuCj+Oc1/dJNg8te07JxR9xBW
	aOdX94IYo0RiQejsUN4Wr4OJM1L/o6+7Cb+AGjsNap/V3IXi/4zCJM0M6fcpGCseGb1650f8l17
	Xartgw21g52YHbsw0VXwft9SPfzST8oTC2egUvjNc6x9OWHp1Yg7rGL2CbgjIgqdJY+Y5nlLglX
	rb3Gi5Uct84Z/1IwwU+lJhSmPldGgcON4tdNZsN8OsAk+h8lWh26jsH6/hD8no+R0l9TA2PiHjK
	9iQPTGbkujDk34ASCQVY2jsrLzILsA0LSyCNqdt/4XSOSSzYNAusKe8OO0LhhMgcv4Geu3WZWWo
	8gSmiG9rqMAQycbHQyhyER4Qa6Qk0jS03QvGmA/+YjJ5V4dIKSMvAS2hCLyOM7CRxPP1YbRhL47
	ElC+TXWuakCN0jelRAlVp7q9iL4H6CXEy+DSjTnQ+TvqrBNhoyUbHthIIEbUSEZpqME+85cdLdr
	98dB4ntqXy2iFI2nu0=
X-Received: by 2002:a5d:64c8:0:b0:487:1084:10fb with SMTP id ffacd0b85a97d-4871e395fcemr16963002f8f.36.1789984661019;
        Mon, 21 Sep 2026 02:57:41 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487243cede9sm23826513f8f.0.2026.09.21.02.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:57:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 21 Sep 2026 11:57:33 +0200
Subject: [PATCH v3 1/2] drm/msm/a6xx: Add CX AO Counter registers used for
 a750 GPUs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-topic-sm8650-gmu-a750-timestamp-reg-v3-1-2b9015106553@linaro.org>
References: <20260921-topic-sm8650-gmu-a750-timestamp-reg-v3-0-2b9015106553@linaro.org>
In-Reply-To: <20260921-topic-sm8650-gmu-a750-timestamp-reg-v3-0-2b9015106553@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1351;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=i875AYKR7692m6TI+q1mLN0BoE/Exug7bMQ6K0PhV68=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqsP+SOtbr427hIA28m16l5eRxKm765jfvOuKSOQ+2
 Hx6CT3uJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCarD/kgAKCRB33NvayMhJ0X9ZEA
 CwwKNoquZHNnBZpJimRM6Wjqa16TTIo3ZNhMAdoNrYuUPt9gjpn8iSyHgWMCLB695TOFjhwdP3L0e3
 m1QKQubVkEMAE5XsAJl7VGUyiUcShU06i7XrEsJyGJSrZ2XqyOh41Y0tDNcP1GMfVptDEzssNkMIwl
 GakpOJ9UhQWow8Rl4TCtblz50wI0HKLXTWCp1PIy2xY7JWHAGwd6kr+Z1JZjwRGqtFcMxiceSSokpY
 rvz6tFca6JN299Czy4aeEUJs4MAn8bMf4VI38cQPeGvaBxist71xXkIZWTxlnQHozB2Uimh9IWe4FE
 QAH0oxlQ8u6gKpysAu7BZM/V+KICXihXetyDsHmf/SIxa2lcG5h/WT5ZaY/Gv4otdBHj9JDJMdw054
 tDpDWyCvG6CoHkn5d2kvjhOBRXWxRIVZ9tQLEVc6cVJN1CtAv7WAlisGXI1/U5n8xCBXzy4gHjPnfw
 s62yQmPmcWuuD1Gs+zK9x1pC4qtJP/bEw6t0c7u+AB2JQ+bAsFCgUak/tPpMDXwNwa8PHh1hMnQC6n
 oCj/ybUyG6B5IP+Q5UkS/gAz4fAaxT8jrKuESFDti2GKQJ5G+CgGOBTy/wEVB1r/55arB+YynQm6WO
 aHqhDfAxlH38wjkpTIjHj/Qp2RJ2bKpO6BF9+8KY0mjRaL5Qn0a1ohhPflYg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The a750 uses the CX AO Counters instead of the GMU_ALWAYS_ON_COUNTER
register on A6xx and other A7xx GPUs.

Fixes: cfc8b48649e1 ("drm/msm/a8xx: Fix the ticks used in submit traces")
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
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

