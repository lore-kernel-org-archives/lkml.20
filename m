Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A154D475348
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984666; cv=none; b=GT/bjKIoATw9X7+Ed6diHBDwjv8tS7hczaMyheUCcYfxlG3o0Cl1phoU/CJ3lLEBeC6Dk8u/NH2VAEKMhZeTLgPLME7pxZ+6bnOs7Ej6V3uchvHrIWgHoI+sTsqjTG8ulcfYTUDc4wK9ucQ9FCvrMgIVsamf2O9iRFdhVWFFaAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984666; c=relaxed/simple;
	bh=g8ArJ/OKChRPzb8qhim0ptPdcxny/b3SFpmVWrXASoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PI/QFmOo6dIPCG+rElWkxXPnz13jmM3HNkNRldIYWWkaBA0TCn25gPUN/VtR6YzOJiD9X6YEFHVQAFpOZYOyXLXfNe+VR2XDaJnk1QT9fyu/8nTwSnPYcqt4Wlzyf20Mo9QH4ccNaFzMLlVoMPDsjKl38oMKdIZC7MB2LfUU9zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YeUTcEz2; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YeUTcEz2"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885d4825adso218807f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789984663; x=1790589463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A2xc+qsQafrugpGNmAo+OH/htlYRtASP8SBfEBu5jl0=;
        b=YeUTcEz262X9EI3l9mDT6eFJDByN867N2jOA87YrPcZqaIgMIOcDfmOQAHThSTzJ/K
         OS6B7qSBmEhhL2FEU54jTJOnoEztk2FPbx0wVHfHRAqAxCMOh8Ichuh9Uo0YDDto5lQ7
         tsLEjinNaazDR1LsE3niGw8EhJ9MbtjXHcoIKXtXkEL0eYOD/2CxijHPjw5xQNSH++Yq
         N22VzEvRt+QjQOtwipKZWBxEjo0UaZOZUWm3Qj6BM3D5QB6A6jR96a71mzlnqkXXOoQr
         +92lHPp9YRE4ZD26kTKKSvbMk7/JlX1v1xEr3UQJpcQjJvmkLukhavoSYAlilPvcGA5w
         zREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984663; x=1790589463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A2xc+qsQafrugpGNmAo+OH/htlYRtASP8SBfEBu5jl0=;
        b=hc5ocuZWgrqlzasxmlhvT1V/FCaZ1bUmesotWygZkZ+ASiCWyEOrDBpdwOF+OcuHyP
         jOQcajtvUmXpDpaS+Rpq/bAixbm0rdgMGWzrkW3p8CH17BcavUdkZIrZhHGfga9Fx6Vm
         fvunv2CPoqVfPIERgnRJJOGoUh3XPYoUKP6QkukkrIOfjQsg1uIhLIKasXChzdzvqJEJ
         FST3IeCup6Hj8fPLUmiShvHRQWmTvihQS5RR9BAmUzDB+SAL1/XSbEYpDh6uHBgYnRQ9
         VNn9NsGxamoYMdM7OK6incEpz+5gV14Wr95TO7cR2gK9F57WH4UKGAS/MqkefD2+CPRt
         wpUA==
X-Forwarded-Encrypted: i=1; AKwUvByuoYVb3pRziy55wGIuyDhUD84dZ5KpD1wnwxvnx7fwxBEzCo4dBJg/+AUOf9EtTJAc8Gi0tnz5jD2jk9w=@vger.kernel.org
X-Gm-Message-State: AFuF++nGgApd3eRFJkrW47BZz8aNt3WLwJXzcIXaRupgYLO4Ke05H9wF
	oJGe+EdeGupJnITgXYfz2OZS0oZHjjlpFp+RThypkolpQSn2RII49LA3SXKWdoREeX0=
X-Gm-Gg: AYBFou0x68Ubkxqg2QhoXmyda9qeDra3JbeGmFsK33G2H/zKxS3fQ1Mw5ekg87D6joy
	8dLBCK906ZSa2E5+M5GWGz8IpuRAVxfaJ0KH39IxSzwyLMKzx1JKA8ilRLmI0eW9lHwR9T55dYD
	XcwsyQZQxLWr474Kr8t5DG/1+Pppo15vp2EbOe0ryNp2esgzoi5YsQUOz1bB92Gb+jSUCohvFca
	qjGSErGlU0qPpg0Ljl4m7pJK65rTvqMqjSn0cm8F922ZWaLgy7uZPNkVX/XHUAvb6kajN9pN8SV
	+JfqXj7VIRp0ZSG/LZeW31qBg/gOqw0KhKmFVBwQDAylrsH4nPWcX77JBPKqCFJ1uKvwrvjsNON
	NLlHqiM6PCWcJuVf8RGgfoIcaqQUjyjaRi6SNDNcRmO9jgPkELppJGPoMvVO9DTHd69zJcUXiLb
	ZzZq1Vj67YHWYErgt83Kp2dg06g/uUfJCzryvfOz6YmAOJ0c/Ol4PpbtJMl6VFtM8B+C28f/1nH
	uDOwYpCwdVEWv4W7PM=
X-Received: by 2002:a5d:5f4f:0:b0:486:f4ae:72a2 with SMTP id ffacd0b85a97d-4871e2131a7mr14971582f8f.1.1789984662478;
        Mon, 21 Sep 2026 02:57:42 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487243cede9sm23826513f8f.0.2026.09.21.02.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:57:41 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 21 Sep 2026 11:57:34 +0200
Subject: [PATCH v3 2/2] drm/msm/a6xx: Use CX AO Counter register for
 timestamp on a750 GPUs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-topic-sm8650-gmu-a750-timestamp-reg-v3-2-2b9015106553@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1799;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=g8ArJ/OKChRPzb8qhim0ptPdcxny/b3SFpmVWrXASoA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqsP+Sfg9qJ/ZVvzGxGlJdiPX0JbGHW7fcR4nvmEuR
 oOVvyweJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCarD/kgAKCRB33NvayMhJ0Z/pD/
 0bggloxuYi0GcmMUXzlQAMYt0+k4/uwsup8W0CncampfsIwDSTPe4CLw54pq5pYeh/95EW4S7OfZfi
 HZoqM5zuA6pdxsc1TIlSvnvyyhTe1jFPlzYLMR08tMbFjtn8AoQ+3FWPGRbbpGzUoCHE8mg8FB9bD9
 rzC6D6Y/ikMh54rurR/UWqWdXjLTNGNuzLMxfEQ3YxwmKFOTPIQ56YTv3Zzb1FS2CSUsYa/z2uiM18
 B7DmYa+yz8PNgPR26+EfITAJyPFZsgME+gI2Ne9h+SXS4RyJgZWKu5WRsYb75xl9R4uY5DXv7Pziy1
 HPLz+kiedtOcn2VraI4sKhN70aUoV5vAWquaFEbgZhelRCiDMzf+LztSoXXh3yKHhHbO0SZGd00FKa
 +FFuNtWxT5TyLErGH35QmIr1/HsimWsVFnrgQmvXbPlSmop5elxOb/3Nzt043h6mO4G8+WAzfyyr/B
 heeKChS9GvWg7SOJeR/gnMeEBhmMhjMxtvY8Tyg+l5xbMt/fFiP7eBCMKQnSpYu69ho+EmYu5HhP3X
 qkbjc32OXOeobIo/iqZP2UURjpxX8uZk5G4s3UfBSxvbP5gTs+20BSythfEojbKh69ghMEDf1HUOyI
 yf5xIzxmEARPOPGbIsVGW0V7ztHsUDlqRdkdLdsuMwdWqP452Ni4XNDf1ZSA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The a750 uses the GMU CX AO Counters instead of the GMU_ALWAYS_ON_COUNTER
register on A6xx and other A7xx GPUs, use it when running a A750 GPU.

The GMU_ALWAYS_ON_COUNTER at offset 0x1f888 doesn't seem to exist
on the SM8650 A750 GMU and returns 0, but the CX AO counter at offset
0x1f880 returns some proper timestamp data.

Fixes: cfc8b48649e1 ("drm/msm/a8xx: Fix the ticks used in submit traces")
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
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

