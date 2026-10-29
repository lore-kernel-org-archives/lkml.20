Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793314959;
	b=ZJvWGI6Fao6PhWj0Q2NswODYr+x29wluupFZKKNSPNRFvp3WZAym/+YEfSUkFQxms5gl
	 eimSnKtnkwklDea/yJASUw0SaQKVQq1Cl+xreG6t95csfRHWkSWHanBOd3bgl/m931oRC
	 AStFB5J7Gv59I58SS0jvgM3wusBRCrzuL+qtwscsk903s7/calzKc/7j2mwGtz/cZnS69
	 rT9v1vIMfordzL30RxHhAXC8YnER5FAESNm0FKwDAH/eCNtsWBb0ecS5rul0gNc9HrzT8
	 DFr1OXUghlHbeMZspLEi5hEzuqJAYu8l1RafGTvb3/aMV8Rl4uuAkD0GDQc4S0/p79g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793314959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=pdQPJwzRJN+nwSRrKcHiePRwRlhix19hahTM/4bzC3U=;
	b=3FH6E+OPTmYtA7SpSJmV76jqBOe7Ri4KwOtlkPltm1WRsck5OtMvr8lYmvANFSo/9J6K
	 k3j+vUrxa6J+3pFWVsnFGqmsMhPU1WbtwweMtObEkaPYCCSpPr0FxI+RKlXRkGj2YtJvl
	 s9bV1udfav469XZePoE+Ja56ocIveKNa7+qP66tG1Nyk521zL2buRzgledKlImhxj7Dn0
	 /KcydCmxExavcg+AfgSauLlMGlmXYl3Ig48FDcjqr0GSVO9COHvv9v8A4O0Yj82dLZs8N
	 OsuHC7yhTxDaJPPbzRclmLXReqSsK/DY8po1ZpdGCMakDu2BMg/rEJt6SNGTdFbYyWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NAzLNtKm;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF18C606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF18C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NAzLNtKm
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93f1f8f59a1so1146585a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793314958; x=1793919758; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pdQPJwzRJN+nwSRrKcHiePRwRlhix19hahTM/4bzC3U=;
        b=NAzLNtKmCsF0IKPMBCGp4+IcOcKUbrxqzpMPhSHot9YZrrD7fDW6aqmudJfyu7IG8R
         qQX63gDLg/ORm7+PWOUwW4IwEAHpUFmtBk91+smAEsZ0qYgNPdXt5gYR29qeJjQUmN0/
         +jVX4RcZNIdKE1QYKjcSsgZCK2/TeGyu5zP0WT3EmwxLdvzsFUEnMhxJbOS/75BZq6X2
         rwUbWV64rufl8eJJDGOx0kYyikuipmgTHXz6HDjVcG7lQKbZzlpM9+zNivbIxJJ8+rdB
         K/6dJSbREdsozfMcdC4ADmD/sIPtrnoF4Yd3cZFXOnRrzwGiNEUMkKc8D+gj4FV5jkPK
         jsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793314958; x=1793919758;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pdQPJwzRJN+nwSRrKcHiePRwRlhix19hahTM/4bzC3U=;
        b=ZFYU5xvwWdTf3dps6yQjgwpjGrs44UEUJcjqUGSzeIZmr3IJFp4rOWfuK0fR7KuRv4
         jq6gGZQiac/5FgRCtg/eSopkpzGk8xfcXO8y1NBLAK9/4SseHUzjJo6DtHVms9v5C434
         9r5dSntqW3WYC5hKqYV/7Y+5MrsKAQDcG0U7JgmAVg6EszxpZ5gAlwAm/OwKawlz+8dA
         CvQT+F6g82E0IQXrlXi/kn7rI4JO4s6BQVZQygRdSHtMqfpsGfoC8jQXj4afk7oTUePi
         GwjQMj/mWmxhXU5CiKlWJMeNyFZ9AWLbk0WmT1j+6+T1Fk8uOmXkh12Q1mmZJ5JqI7Ii
         OhVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJO612GmRbjG0J2zQxYvIlXrMd9jSmCjQxkXrhd0ydRkY6n2fOlu/uhPIV6OLct7zKLM1uVuSk0p0RYGI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsKSiC7wrAw/9RnLFjmSza8Go8Xv2qTbFQPLvCkXWt2WSbj7xA
	tjmHFtXDMj9edlgTozvL+7aBDxNTR3wlX2kmMrcnTEPmOMdOOpqGj1lB
X-Gm-Gg: AYBFou2HJTKTWXfFJDa+B8CG8MlSkwIALErO0LaxxOLle1CE75EjK2Ql30CuXNuwPTk
	xo5HRwifPcvjtCDBYMIwoOzZfae9Ft1Ny57Nv2H+18P0g3y18vw4Gl4ONzmsy48ovBGLvtIv3gf
	5/vYRePTc1oRN0iesKy2kasBbmgCuJ64D4KZ7/Q1XSaO4LRDawRS1mAfshRCEbdiOG/nV15Edyh
	9WXhMVoQYMFW+I35+IAk+KE9ZKrsIdSif6MOy9nrHYPeggxvXwyWiFBQCqQu7vorWdZwNZc7+Wt
	5xjWevgwnfVXlzgO+p8hnbUujpZjM4BEr62bDeXJxz88UfaMynYJo6t1n+2EiIfR3NtQMr5Ozqp
	LyLiAxKQ5UBo4yvi+ZJRrhhDFkgboJo0+wQPA+d4tfPREhbSpyxVbXOIsygjLTW9ciNWJkghVsJ
	2qXIexD/GY+YtR06SH7URSXnCVkak6n6Oj3yIgoaX625S0CuOkwo1Z1foZFtwouNh/WmOWrliXN
	IIewLCMnt+mWAWRKtUSt4QdD4u4OkaSB1faTJjEIx08S84yKyWfrXeaA0Tj5Ejb031xnXRp/m0N
	+rck+iGr3INp+SypCVKujWfMbIlmwIW3zPDTzSK7HFLDbuzU0UCetmrJ20pYUIFAdg==
X-Received: by 2002:a05:620a:870e:10b0:940:f21a:eb64 with SMTP id af79cd13be357-944216f3e4amr127183785a.5.1793314957732;
        Thu, 29 Oct 2026 16:02:37 -0700 (PDT)
Received: from [192.168.50.231] ([142.255.23.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94424133d61sm2791485a.3.2026.10.29.16.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:02:37 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 29 Oct 2026 19:02:30 -0400
Subject: [PATCH v2] drm/msm: Fix GMEM_BASE on a8xx
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
Message-Id: <20261029-drm-msm-gmem-base-fix-v2-1-26b338471b46@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7Zi21oKuvIdhUcpYJnGAtIZoC
 He3cgGX7yX//RUyJaYM12qFRAtnnsYC5lBBGPwYCbkvDEYZp5W5YJ8EJQtGIcHOZ8IHv5F0Z5T
 VjSfXQNnOiYreu/e28MD5NaXPfrPon/1XXDRqPNnaWRPOrlbhFsXz8xgmgXbbti/Yy28iugAAA
 A==
X-Change-ID: 20261029-drm-msm-gmem-base-fix-e1b20418ae68
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.3

This was missed during initial bringup because GMEM_BASE is not used
anymore for textures on a8xx. However other things such as mesh shading
still use the GMEM aperture. Fix it to match the value programmed into
the registers.

Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
Changes in v2:
- Fix enum name
- Link to v1: https://lore.kernel.org/r/20261029-drm-msm-gmem-base-fix-v1-1-347642c5670c@gmail.com
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 5832dc25d6bf..5b05386ecffe 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -382,7 +382,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = adreno_gpu->info->gmem;
 		return 0;
 	case MSM_PARAM_GMEM_BASE:
-		if (adreno_gpu->info->family >= ADRENO_6XX_GEN3)
+		if (adreno_gpu->info->family >= ADRENO_8XX_GEN1)
+			*value = SZ_64M;
+		else if (adreno_gpu->info->family >= ADRENO_6XX_GEN3)
 			*value = 0;
 		else
 			*value = 0x100000;

---
base-commit: 9c31496a57579d0a46e1eabb8f53ec735b72d180
change-id: 20261029-drm-msm-gmem-base-fix-e1b20418ae68

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>

