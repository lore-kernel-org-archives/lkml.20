Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F46344162A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984664; cv=none; b=Jx7iuRWEJfFU9cmIPiDP6pptt3ciDSG5mWzB91ZZ8c1863oB/LNo4OPvgmiachsWA3UKpEiY1gXzEI/ZIw8FhbSWbfrF8vTwJID0V5m1JwTK9HvoZTH+tNilBAa5dQhBfwECSYh2AN68kX/O/O/APVT4OJiF0fb1Tq9ojKoGKuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984664; c=relaxed/simple;
	bh=lJi3ptJcwYb4AYGE3khyoRyB84fxryi+QCmc+xoNuww=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gMPBY+DSshRMnNi/ylK5Tfl4wyvmF5v/FieHAViGppcvN8SXrBfA5qIremze0eoSNIJZoV9Nfqd9suMDigJ2UUIbCVbZLrR05LhOnLbeH27VLQLRJerr9uLwnOdYC/DmQBPghFO2c51b43XF4tSfqsrBQr6OgZBC3HmRyF6b37c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ea+eWzK9; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ea+eWzK9"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48434392b02so2065766f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789984660; x=1790589460; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qLURyJ5usDrCoS6jxkKDSurJA5Rl92FpG16gshoRTV8=;
        b=ea+eWzK9vHQxiip9b6W3yZyvNvRbFJ3NZKwwS60JY3YUlQxrI29uHXJaHoR+YV16uh
         j8z699TSV4YCaE7UkkwcsmNtWrJaYQLQ+hqmCUhdKshZ9gJ2ZgNGzEY6cyrBorDim2TK
         VAckAJaY/inXppVYNq3uyEFDZWU6oNFyMtnC5GlYOcVJomCbCBnQGuDjzE87/GhlBXME
         61g4YuBVPSi1sIhJJWF9DUS8wSKmjRJxy6AygVEfEThoWRQI+2Nx2M5KlALRmTPc4qvY
         CsykamCiCdQUWz5PsKUnXmg9bxofDL3+YsVjtfnHF7iqFyJXsvhR9hlAM3prwohrDwL8
         aEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984660; x=1790589460;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qLURyJ5usDrCoS6jxkKDSurJA5Rl92FpG16gshoRTV8=;
        b=uoFUiPIw9ZKlF+ufvNeXH68BTSL1t2enck8JhrusQqmtsnYvQ4X0S59ovfZBUoFVBQ
         9Re8pz8q10fY5Ykv4uuQD6IU5HqlxgwSgWRUcqKrfQlciu2XB7NeXFCLn0a7XPTFQNiV
         etzPkJOTQIQy+ABdwDqMsppxm0a1Fhje3Q8dM+GaSpWW9qmZZy6KFOmI4dgRpub5kaqQ
         ORqHXm4QsZf/a4rhUPC7972NHoQqqCnQMRoedsE8EGFCyUaqP1XhJFOdFUaSBQU6S+MR
         DaCe0X9OfmNd9+70hDnA9dyCBQcWN1at54p0UV0CSEbrw7K/92Lb3GIGHqw4qNxmc9QW
         SWAw==
X-Forwarded-Encrypted: i=1; AKwUvBzgjgZE4qW/tOCBRA41lfYG691wvbTFhVKStRPAgk7w3UvRrUynnvUBFX2pBxt1+D/HfuIIjeq7CuAKR08=@vger.kernel.org
X-Gm-Message-State: AFuF++nze2osq7FAG4Ks8WOznbwi98Ui9U6qXOtQpJ6Gsp/O6z752lpc
	dtjcYjD1yiTwE67sI1yYMufoW+VLONpBmykpIXeDTv3MezfyVGC8bJvbgQnSGMugwcY=
X-Gm-Gg: AYBFou3oJe69MsCanr/koOImpCH6z8nMBO+rDkLcIQHB6u0TAPf2h9FtU7so7HCbamh
	B9aW3G73RVy2hBGc4LIKKy89JRVNnjGgD89qD2lQR7h96geP84QcNJOSUmw27Ew9Xp7mJJq28tU
	htkhuX9Wlx9xcDwNu5stUiu7P+MlVCUemMvlANhzs+k+ONdicZmw27FmxeC4JD4HExHDS5jUMCV
	ahyZq7/VSClPacYmSWND9BJ4ITNmu8Ujud7lT5NjcQmZOubjv+TO/PQ/5GYyvcqPkIH9FPKJAh/
	qwEZiC/42oEnNenW/MmkdidAkxIWWPn7eYoThKDRbj3rnTzRvSBl0Kp04Adui3v+dDUXaZExZ8Z
	WeYyAsHArR14z/p4QHM1oPXhScK6dAi3IlnSCxUhuMeey5td6cQ4+wGRLtN28CQN27UD7lZVCG3
	87MKi8ODcfrZ0A1en45c/qqq22trtoZk1WBWxccMBx9xYDfgwK7EZuQRv+GpQqy5W+A/W6H4VvK
	MSuv4EGQqm6oO0H+WFBHELuX8D9dA==
X-Received: by 2002:a5d:64e6:0:b0:487:27f9:83b with SMTP id ffacd0b85a97d-48727f90bbfmr9655713f8f.48.1789984660253;
        Mon, 21 Sep 2026 02:57:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487243cede9sm23826513f8f.0.2026.09.21.02.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:57:39 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/2] drm/msm/a6xx: use correct timestamp counter on A750
 GPU
Date: Mon, 21 Sep 2026 11:57:32 +0200
Message-Id: <20260921-topic-sm8650-gmu-a750-timestamp-reg-v3-0-2b9015106553@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIz/sGoC/5WOzQ6CMBAGX8X07JpS6Z8n38N4QFhxjVDSFqIhv
 LutXvSmt53ky8zOLKAnDGy3mpnHiQK5PsF2vWL1pepbBGoSM8GF4pYbiG6gGkJnlOTQdiNUOh2
 ROgyx6gbw2IJALbVEJbRtWDINHs90f1UOxzeH8XTFOmZ1XlwoROcfrzemIu/+K04FcBCmNIY3C
 pU57W/UV95tnG9ZTk7iU2p/k4ok5bZodGmlsbL4ki7L8gQ9M1SzPgEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=lJi3ptJcwYb4AYGE3khyoRyB84fxryi+QCmc+xoNuww=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqsP+RPqsxzq9x/h5ZIEEm1w0zfHyzzXjC578AwXsF
 ZOgios2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCarD/kQAKCRB33NvayMhJ0Q0pEA
 CM0SWVIXyBSmbeiGNaf7GTH3LL+vHUgQJxAuvtFlxFDRpeoEwuZfKRJ4h9yrZk+OcfNzuZJuaTRGhs
 4nHLiLfuy0O2dL/L+irQAM9JVwmULu65WicX/JDqq8Uq83HvYC/Auy9GoAkQNjwifnwZhZ6idH+Ck+
 6PcxG8CfsLq48QNgq5+RS9YvscBEOOP7gZQHE1rJLC7aCbAena91LZBP2Ht40utERX6PW0dxG+ddmy
 3JRcU1mJaWQhoVkQmWcXYHn1NzL2J2z4OIvLHbSiXBFfHuo6w7hITZ7J0mDzZX2HxFB7dS2dI98Mnb
 uMkDf9HhOHzLxrLu9/iRp+OEveFJJ0YprbpF9H8Krf5NQ6P4WM9q5BH4xPQyO4QVCqFb9PbWGbnlaY
 llstq4oTu2gE3chWDF5A4SAta3PPlmM63XKSopihp+Z18S0CMhHm/DBVwuICI/jOG+xM7LtyyIUOjn
 k/cHyCg+IAqFVl7D5Qlus7lKW5zZePkMK6YfcSKUo9JnNL/UPeasnVHL3maY6CgCEpIXkH4XnHBhZ3
 gChCALY5IpZezitd/cp8KjWwWM5TsTCKwtcPvwFK6qL9svODWt9gNMcNkjlWRml5pnuBxJp3aeTq7U
 Ph7d96Y157biDmmDH9i3Fc+8xfLDgTNsu+LlsNJgO8/A4Vah7Mtxlgx6kPRA==
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
Changes in v3:
- Collected review tags and added Fixes tags
- Link to v2: https://patch.msgid.link/20260909-topic-sm8650-gmu-a750-timestamp-reg-v2-0-091d74958951@linaro.org

Changes in v2:
- Fix swapped H/L registers in XML
- Link to v1: https://patch.msgid.link/20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-0-284880d6e68b@linaro.org

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

