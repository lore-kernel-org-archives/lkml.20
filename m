Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC985592F5
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873873; cv=none; b=n/EUcTGkyBgvW9NGPpQ89klwNBvPu0IRvxgkCFr+Oz9TSASjufP9/ciF8n6Ew8bYAYrp2C3XYw/P81kvxpdjdCCjadvxmN8tT2mvoLwmBDVNiO/wNyQloIFRh0EM4wUUdGkKIXP4fRCG0wsQH6rRmgXwxZi39U7YvxJblXF281A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873873; c=relaxed/simple;
	bh=5i9UIVCMxH7Rf1YAYLFze1m/DXMlN3h6KBiETNgPf/0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AAi/uk48r7TB+2AyUkYYpgBVQnYLAbFU1CBmmR7uo9etF4VKal+6krhXb4iArZmNtx5gOFfXM1+XJE7XHzdJaC6rAptt2cTd3LDXnyDjz66NEUkF7SgeiCR1g20FbPwhWaOqjguxPleTA2cNJV9MNfF1zZjLCDNCNpsb2gxqT8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZjOsaYKJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZjOsaYKJ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso39065795e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788873861; x=1789478661; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6G1+mRZXQkoxNNx9BRw+gGVfxUdpfs+D6xhoh1wgQ4M=;
        b=ZjOsaYKJsrVRfzNO5iIex3JdMUD9GeADsl1VobPuVM3F+ROYuTHpyO2XFFTgXPEtdM
         fvA0YMAOZ3RSkFHuRyviQun5zZJmHA6Y4TpQbr1S9or2PiVf7Hi9oHKz6kFBxmn2Yj5c
         44NHIhiIGRvWzo5ouvyETGlkPhFBFWp88LbzxufEdi5BjVC4PqAbQZV0UBfXEuitMI/k
         DD/ypJh6AkLeGKojrYMWomotNUNV8aUbBUA7EjTZjRUSWQeRDVrrd74DINHOztn4aSwn
         BCz5sySil4r/0e2WJf+q4LppRYYHhd13I5Fu0Z6G0rjByWIoMHCVBy8VYY4qZZM9ELsm
         8QvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873861; x=1789478661;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6G1+mRZXQkoxNNx9BRw+gGVfxUdpfs+D6xhoh1wgQ4M=;
        b=GsChNuZzUdZeIowpG9FNZ61h7zzHpKDTDXhvy7FeDvOLs/qSkkcQOeIOVPvJ6aQa2q
         w6out4x4c10THXbiANTLkFH+vqBiKqRHs+ZAgcDIplmxfnx8lt35kDPDXgdqwCZsYOBR
         eT5ZjMc/F//mIK+OESD/o5U1NxNOn6Urhmc0EWegipKezm1pufDzwvH2s0vRZtXEQTUv
         frithEZReaR40mIcnVFZlkRfKdXRwdx9/AvBtQll3KV5a1xjvUQUQ/dKgQhLpZei4R4v
         lqL8UW7/uw7d1TfNFBCjbVgpY9ycBcZgWjLzkvVQB8qCLgKB81xHmmaBbNlcyihXXInj
         AH8A==
X-Forwarded-Encrypted: i=1; AKwUvBw6u0nNkPsMbtgq2rfEOlU3paikKwsubbkozyv1uZpaP5yQF4U3VHCjpYOVqOLkiUgcwIqoits3AiEH2Hw=@vger.kernel.org
X-Gm-Message-State: AFuF++mxQTfNXWX36tXX7nBGJiGF4aFfIeApxLmEmEj/M2UDBW2qlFX3
	wP4WSBEwArB5Heyhul556JjHoXFHGTQswioWrMPj+Y3aKycHnUr4jZ62DDVNIlASQF8=
X-Gm-Gg: AYBFou3xKTYLI7pxtajPmEIjwTnfO+zdOiykeCKovqpgUFc2/+q3KH6rkx08ag6+RK0
	PIPd2Pb3ZLs/QHypKyn7DpTOjWOitSSL3FCzSGYezujSgCVzuAO0m//9PmRUJlDFLvpSq3mNQ0Q
	e38PwEsA8+uCXYEvjW6ItdTlTMQPIXlv7EjL7rZ7hUwmmNv1T8WRbDOaG2Cia+y3ceDliCPdw04
	RVk3PYbNWTQoR8nECTgWrfvsT4boOgAjcMHWM/Eqw5+eHoRzbTnJjwElaygmQBhuBM0T1sRfu0z
	C3Cf6DResSjCao7eU783+lPUi6d5bnRZvRMxHiJ7qxOu4yxEVJfjkHIM3M6TBFm8UyuPFzGHpOL
	Io0qmWWSyG6UAsMnaLwph4DGzEIej5W6v3HpGtH/iTGzmg/bfGIo2JQbIDPVlS0kEMmzUtvp8qF
	PFM9xsuxVB/sFrBOEnTULIs/zQ83C/Bg9QEdB6jdWPa1v6GZXSBXhQbEN5fx01t8QNpJH/xzN3W
	jH8feDTTNuGY8kY+6w=
X-Received: by 2002:a05:600c:3b99:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49cf81fb72amr306665585e9.1.1788873861249;
        Tue, 08 Sep 2026 06:24:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d07b371afsm298959475e9.9.2026.09.08.06.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:24:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] drm/msm/a6xx: use correct timestamp counter on A750
 GPU
Date: Tue, 08 Sep 2026 15:24:12 +0200
Message-Id: <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-0-284880d6e68b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHwMoGoC/yXNQQrDIBCF4auEWXfACmrSq5QurJnaKZiIY0Ih5
 O6x6e59m/9tIFSYBG7dBoVWFp6nhuulg/D2UyTksRm00lYNqsc6Zw4oqbdGYUwLetdG5URSfcp
 YKKImZ5whq90wQivlQi/+ni/3x9+yPD8U6i8N+34A0GmWDYcAAAA=
X-Change-ID: 20260908-topic-sm8650-gmu-a750-timestamp-reg-2e7575e6279d
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1069;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=5i9UIVCMxH7Rf1YAYLFze1m/DXMlN3h6KBiETNgPf/0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqoAx/YenaoUcdB02S0+EiVQFN3+Cn5TVKagHczqri
 yd7HPweJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaqAMfwAKCRB33NvayMhJ0fFyEA
 CT6MZorhtSK+DxddSw8ZifeJms8srEumSB82m2rdioHDbaia2uNoBc9MNN6oGpwF7R0Fc4NPIORCrR
 6SRWedpN6l2BZsZerPeHkOc2x+pbfysSQ49Y2bLY87/VNl+jY1i+EmNvJ9OPrmbkzSdU/axL1BdaNX
 sF9seowpQEh8Kxp/6znKRtaGe32Cp/atWYGCWPlNSH4cAYMuleZXT2TVyTdlKzHeSKmgtAFg5oypEu
 vlpQDrGoxbbBP/hvLG3SFqkWKBSKw9hZfJw60Ps3zKXYTpCrihpn9yWsotfKZ3P/lRgmO8UAOXochr
 I2+6kEySMOJzT4MoUn5dxCTvYKFLohFtBDkp8zeZTwqPLE0gU8vW2y++euha8wka4raBj2w+ksFGpw
 ngE/g4CdlVH6uuW5rkQv8JN6GGoNzsxg6OhGK+fWJZBNxD/4irxJfqySKkI8JjDGHZXmZVQRrfdczh
 oPLU1gD4W0mOpO2yqr6tY1mF+FhyANHCkESqxfv1dUkl/PSIBEsF1zYU1qq7dlVMdhUwHxpQOAqhio
 QUG4Sy2qnksS0d0SqFr1CnnvGKAiQ/dKNFeL0lQU+RY32aXI+HfLQ0jhfypB431UX9fwRcqsyVmixw
 237oM1v96EF8VZ3JlS6uya6BgXtg3MRUoYejSVaB8tX/djNmgzAw9Y3d0jew==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The A750 uses a different counter register as used on the downstream
driver:

static u64 gen7_9_0_read_alwayson(struct adreno_device *adreno_dev)
{
...
	/* Always use the GMU AO counter when doing a AHB read */
	gmu_core_regread(device, GEN7_GMU_CX_AO_COUNTER_HI, &hi);
	gmu_core_regread(device, GEN7_GMU_CX_AO_COUNTER_LO, &lo);
...
}

gen7_reg.h:#define GEN7_GMU_CX_AO_COUNTER_LO		0x1f880
gen7_reg.h:#define GEN7_GMU_CX_AO_COUNTER_HI		0x1f881

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      drm/msm/a6xx: Add CX AO Counter registers used for a750 GPUs
      drm/msm/a6xx: Use CX AO Counter register for timestamp on a750 GPUs

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c             | 12 +++++++++---
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  2 ++
 2 files changed, 11 insertions(+), 3 deletions(-)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260908-topic-sm8650-gmu-a750-timestamp-reg-2e7575e6279d

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

