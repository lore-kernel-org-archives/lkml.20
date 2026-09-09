Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEC3242D65
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959268; cv=none; b=RdMhbgUuJntKXTM1jTYE2XEdjeN923kV8mMuxkilVCVxUV2vVkDjZOj1YFXNfBQ+7lHrLYKChY0RrY2Vv3qZ74Xaih+/5UWzcqCmzsh3fgD3wCcBpRS1M3gT2QS708eMB1fSdBXPhcUnU3Pr+6GlA/T6sGBDccuCHjynKGVc1Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959268; c=relaxed/simple;
	bh=E/My9ncjedyj86RSIW4IqQNhl5mZctXdRI+O7IRN0Xg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t+9pzUCf+PPv2E6Xxde7hIi+4nH1Owm7lD9DDonPk3zthd8yvpchWw87LBOmVniP6m04NZ6C18vURSR45LUW/ulqjNvigxJnVsbJwbTcRZnfPvYYtItgFyToCaIoET1K6FaTiYPx2epSOYUpAV7+64oU6o3VpQl99damC2KduGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=glOVeoF+; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="glOVeoF+"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48434392b02so177294f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788959263; x=1789564063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vhQ8dnMMSXYBO5z0OmAAA57hjGRa0PP2+u3YEd9RJZE=;
        b=glOVeoF+Do9INs0Bh5wRgoEoLThg7VvB9q5V1DCGf1TXftcmg5fmiOgZrw6+eBIvZD
         c8PhsmEl42lFWW++d9i+c0R9aoTAFyxC2AMmMuhao+DqZ4eaVYzR8O/+kLqe+UhJv0y6
         nIA5CDbwlvxTZHiwqkKicpsBFwwEqZwE1xgYUtgWjKNWJMQr1ymtyj5NeLNFDlyy85zU
         vP57XIjgCpPd31tVFb8e1Cxbf9wFBfvrMmHzOJE+xVQzVu5EUILF54WkS+H/l5h2XSHt
         7Ss88wJX2J4NBj7U3/HlqaBuycp0KbzuZUup/PNdoxMHW/xsMFrg1Gv0fjwjsXOrrrz3
         0d+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959263; x=1789564063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhQ8dnMMSXYBO5z0OmAAA57hjGRa0PP2+u3YEd9RJZE=;
        b=ggdHAWdZLHdJUuBB1EhGgUx29MBQelOKdK4O3CeqVAbqlw4KKNfRGCezc+w8lUf0bn
         LtV+wlb2qQ4CP7EZwa+x8MbZj6rr2USJ+qMsaIJ+RgE5TfKcVIhKoyns2KwcjCU/5+1B
         6GymFtU+LQbskuu7ffLAvt+0a6Kuq4+t2MdJeBn7mpIMjX7E5lgAco09vN3vbReh3nV0
         OiJKzs24rmOqdozDsWBxQV71+USBzEpzC2z+FihBk4wbTk8GCdsnvRk8JG4JQGPQnOdJ
         A9dstNmNuvshtpY9ou0PKoTwX6kEpw6Xhn582zQYRklWL7kZYMvsllUnN9IIvxVopaB3
         1CdA==
X-Forwarded-Encrypted: i=1; AKwUvByyibYlHgUg4z5XKq+LiZHWIWnz6h69LkMUv2ehJ/aoYCWmlDNVDWXXjEhdDkMtsCeVDm3aEN091iqclN4=@vger.kernel.org
X-Gm-Message-State: AFuF++nC+k6OQkQ+je/8OO3G0n+jsofShhJqnYWKf8QjZ3ikpeKO8ee3
	D8qA0GShMCTFDZ0K7mejXzL2PfRFbJ17xChPT+lR0By8nMbj0JEGl3YqFsKrw8TbakM=
X-Gm-Gg: AYBFou2LNyfTQ2/MPL6SCidEyHjc8mQ6wYHsPdIAfX3MJlVWZr//chhS0v8Ws6raWDi
	7YmEKmBfuK8VQvi/h+br8AyAdGQ96PaKnkJwDq3ykdswGJpTqeyv3DPFQDOD3GkeW7O4pLMARTQ
	NkrkVmLZZ5ZylM6oTuzrxI6XXyfeuPJjfgUCXrAm3lxTcumDbKMsjVrWsRShS42Yv+vRn8cMQzu
	PN0v8IrOtKdLoDJetoTroTWpEzOpjbiVgWjKrreUbtovYMZz4rZjD+qFWU0dS1QoLZS4QnVBvIw
	NsSE/sVeHMFbjeUCydX6MdtEcCM3aJSWl38OKs/mu5NQbVrOISVfdzj4DL3a9IGfZU9UzZ7DnNa
	vq3Y/uxp4Jrxeem+paqC4hkMhLogLvNNclywnS/Ath8B5D5SHmHl0eB/zM+dWDnO6qxoj1NzH5X
	zU2SyzBUbQXOXHANT8kTViXiMCITbFF9CZ9FHAZntKq/kU6fJfWfmQGJMVRznk5Ys8U/fsCEw0L
	EcBXrIOzrFbxdUJggo=
X-Received: by 2002:a05:6000:4801:b0:482:f61c:7cdd with SMTP id ffacd0b85a97d-485ba5ac39bmr3264342f8f.4.1788959263366;
        Wed, 09 Sep 2026 06:07:43 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883927a3sm34031175f8f.11.2026.09.09.06.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:07:42 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 09 Sep 2026 15:07:38 +0200
Subject: [PATCH v2 2/2] drm/msm/a6xx: Use CX AO Counter register for
 timestamp on a750 GPUs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-topic-sm8650-gmu-a750-timestamp-reg-v2-2-091d74958951@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1668;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=E/My9ncjedyj86RSIW4IqQNhl5mZctXdRI+O7IRN0Xg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqoVobWagEdlOIJeGoAoJPEc+PsgA62XSekFt8u4+f
 NGykKkOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaqFaGwAKCRB33NvayMhJ0UCLD/
 9/68Amb6nPQBbNDUn9tZp6XTD/MFUbly5GKO4KLPe49oaJZW+c11rEhm1ovfjdxqDfpQJAlPlCwPmS
 Kmh9meLsu/ducAS2/94ZtoCdvB5+Mcoc1xj6vIn16ieX9NwWKXEYAMhmbW2om58IJDCBEjzxmNoHqQ
 5BWLqRWAKUOmD2xmyVml87hCBuQVD2esSDtvqdLHp97IaN8QwyFaH9edtkrvfjCEg4sQZ9MiHOSp8G
 qKTDYb5LLaxBRY3Njsj9AbLvaEe8aVJfOJWhAGhcsS7g+76oOVyPKUrgX5UD//WNcSLL10mKLpU2kG
 PZzyQGIMPbdAA5eqVUBdtMHwTvBcdcuh01t8PPOYtx3fIoUtsowBTgD5R8xOWerK5NbJX/de4tT4QB
 RCthPJqJnkTJJiL77e15WuBNsw/3jSHenieNdSHspCz2L/T3OdvJMR4iDkJlM/o/HyfbESFv8qHR2U
 O+igVfLnjGS/02pmHwPA3/QpwD8kSOH4/mv/Yr4vsvCoiS/+HpaxB4cK/VSRRTMeKWM2YfZFQ3Mvi2
 SISu9F+RSk4krwGgYk+unRMxsVypJRcFsHGAFpQYByz3lMeFTx66cgpjt+Wjm78U7fAyAmXk+xLaj7
 1bQM2lmU9+QPTZPgKPGqLL+/BN5ef4DyvRHgnnEyd15DS8eT5FdCWmuGn7dg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The a750 uses the GMU CX AO Counters instead of the GMU_ALWAYS_ON_COUNTER
register on A6xx and other A7xx GPUs, use it when running a A750 GPU.

The GMU_ALWAYS_ON_COUNTER at offset 0x1f888 doesn't seem to exist
on the SM8650 A750 GMU and returns 0, but the CX AO counter at offset
0x1f880 returns some proper timestamp data.

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

