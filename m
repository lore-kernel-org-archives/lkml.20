Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281981;
	b=afwD20FhVnaJ//v/fyAPK28CzB19TraAxVCcZnhrkRPtOTiEKZ2VHSj6XLs6ySOvupFZ
	 +onDqbYluSqSoIoD3LEY7jtzombnXmS4gTNTYPfmkJeYv0SpLeUAq9178rq8mWUxA2Wcb
	 Y4/j0clOsmZIdIwwOQn/57XQ+jxK3USDw4bIYeopifHJV/qAuv/OxquiVGPBmsCO+FxD+
	 zj8dpnx2tzPk7/0J7XV9lO7LRnSLz9MpRClQHZJbg9TqmRObI4tzS6Psf4B1l6A3MQQ2I
	 H/BjqR/GF5xfBwKLNPRWyvCjequTEjQDfiPjadVZ1mbTykYQuzRJ+o4zpfJrOCLUoaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=tQ4bsfIGp4xsebuBqH7Tc36g3dw1OgT8NV+OEdsp1MI=;
	b=v2J4OkcWmcGxMX6cHs6mNZPswm1so8NqasHnBg3tmpgLlehQOJdJdcwG39aCnbyZH17D
	 WTek5gVxOmNjnElqsvnljZzzo+GrCLEos9Y1Dw52J2qF84KTfKts0M0cd9VaEF3f9zMIS
	 Mr2H49Vr3FDMiW0SgA6vteofFOSqlbZjEDhnakKopSigx59H0LrQc+9WbIagbSxdMqECz
	 JklsvrbeGYMvjxsxSw17O2IqJ6I9h2nOfdnM7AaK+Sc9G0dG0Z3daVqXYs13nKecPyhVq
	 QFz7R1BbqJYGgZge6uHFqoAcRXG2X0y6TuT5rWSHSTmcgb9XwMpf4jxSrFNwFOOPzvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0kG2ZI7N;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63580606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63580606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0kG2ZI7N
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1692629f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281980; x=1793886780; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tQ4bsfIGp4xsebuBqH7Tc36g3dw1OgT8NV+OEdsp1MI=;
        b=0kG2ZI7Na/+fZqSMpTthoGDUVC44cSQmfT3MeHnnImjrXkhjCATpCYzi7Ukeo7gh+x
         YEFpmn6TqUeFs3SStpPMsfR2GrjW2LpW1EN4sREE+J5jf3BCmkN/TZ6ITMy03wjX3D4j
         +xP4LdIwoUjyuIvs/2JrAGXg4dizwH1hjYdMvjVEkC57Mpt9pQaq5tikbzCe6sWXAKJm
         tHw1IKp0abO+FezQhxD78UOGjWl1LyiFt3HM06k6vUVmH3sY0CIifrhb9tmLZwV/mByW
         Axj6sfLCQVTp8g1WVK0bs376riYobVEpPRVxyOkDHi5n0UZRmzo8uCZY3WJgn+IayqZ+
         U1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281980; x=1793886780;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tQ4bsfIGp4xsebuBqH7Tc36g3dw1OgT8NV+OEdsp1MI=;
        b=C3gCbGxaHIB77lwpxVxIEvj5LxToGWIXF9c8B1tx6Srq3eWFa4ynSTx/LST+T47KWV
         UMGob3YP5DHKbZBx8+QT5sUufq5jz58zLBBkjmlpfY/KOxwKv9sNjTlSRmvjNytYY/AC
         1jRbY+nNfZT3Q5fGqK0gfJOq+1fTzdEW8DYdZJYA9CnW2B/u3FMeZKosSRMItGeAhF+9
         Vpqx70iwsVNtejPufcFxle78iaMNOyqziP4L9XOTJcB80+NVaYArMdWByIXl8LNKH4n7
         dV4qx6vT71WSUyuFXDzvX0XbXTxIX09IfkA2UBtTaptUA1qmt1JYQ5lK9aukEoq+/4wC
         XU4Q==
X-Forwarded-Encrypted: i=1; AKwUvByWRtIKiZYydJS/B7gsALGaa4hCeS1Qbej2etU0H4QKTiTPQKjU/xwvz9jmXMEJ0T15nHCgejS/9PUSiSo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJa62M7uAEenV+GDhcmoIkPqgTfu5A4j2/9NdtwxF3eAHBxevlG
	/6KoN/S2yFS2ykvXJO/dOI0KZ/cvjNH0rpfJU0QxudD5a6WbE3US3wHIwEZi
X-Gm-Gg: AYBFou1Bdy7EfjidqGTdutecRMxYXgwIFCio0UHcPbWQpPmrHe5g6pwvg30fE4EP0G2
	wU0Oa1wXfWW2hszTNCjGNxHCBaVVjdONPGCYFZCqlesmRson++Q34VDfNZ/CSaDjOZN56G1FzAQ
	vvZpSaHKmc8RffOEe2yLhEkyFeYqwNUULOfn7R7pGCNX1RB3YHYBIDxfcLDzS0A/b/DvOhvfku3
	zitQUy0wwpY2epJHOuxEuedI2HOUhc4HDSx2lehPBPq43IwOIBworvV7AwDoYg2Jk3z2lkJlfW3
	dTCBDPT1P2/MW9qftTX1OgCCVH3854wm9M/WvE8JMzmIv1CWYCfIBeDwjjrldcu7Q5GTbO/4BOQ
	Kz/m340xzlX91knCe5ljcFjutwxvppCupR6k2jd1HJOPEBOHEtXNWBCRsW2RKxKBUWHoqQKCctZ
	7lLVCAuJA0GxCF9GjNHKM0/t6r8m3y5gt0gs6h9+DdyneiOC0Cmoz3JMpSlSUegKu3AUtLWLEOJ
	al2N0lIF4zF0Xvm61PFkCZSF/U3NpC64vtkDKwC7C2oXz6aLD9sowVTFvBWU0UO0ICi8a3MP12D
	15m4SgFxj5OOFtuWq1H//rbqjcshAyWsnOPBRK1NLjhjGw==
X-Received: by 2002:a05:6000:2c09:b0:48d:db77:d124 with SMTP id ffacd0b85a97d-48e5d288b00mr13734288f8f.6.1793281979476;
        Thu, 29 Oct 2026 06:52:59 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:52:59 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Subject: [RFC PATCH v2 00/14] Enable LPAC on a7xx series GPUs
Date: Thu, 29 Oct 2026 14:52:37 +0100
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOTQ6CMBBGr0K6dswUBIIr72FYlDLCGApNWxoN4
 e7ycwCXL3n53rcIT47Ji3uyCEeRPU/jBuklEbpXY0fA7cYixbTAAjNoyWvHNnAkGJUhGKzSMFs
 fHCkDZYZKFrdGYt6IbcQ6evHnCDzrk/3cvEmHfXU3evZhct/jQZS7d8ZKzP/FogQElG2OOiPUV
 fXojOLhqicj6nVdf8W7Nf/eAAAA
X-Change-ID: 20260603-descriptive-name-lpac-upstream-730a164b105b
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=4469;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=p6wqA/jwxyIqcSTHnApGsgfvU2BLpE1567g9tFtfsQQ=;
 b=feq6ZOfAR+NU3cENzB30VH3PhCH4eAA7DfIpVH/eWChVnne9uIyAN6JEvD07bFsgYP9cOKFAZ
 rU7bVnDf59TAXD5riamSTbzdqszxnBeimsLpJilDn62PRDbkRrODEfs
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

This series enables LPAC (Low Priority Async Compute) on a7xx GPUs.

This allows to expose a separate queue to userspace that only supports
compute operations, in turn this can be exposed as a vulakn compute
queue by turnip https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39889

Currently hangcheck and recovery are broken as the patches to make them
work depend on https://lore.kernel.org/linux-arm-msm/20250911-preemption_aware_hangcheck-v1-0-974819876819@gmail.com/

The series also depends on https://lore.kernel.org/linux-arm-msm/177919116291.814652.1720687887970998122.b4-ty@kernel.org/
to work correctly.

It is still an RFC as something needs to be done about hang detection
with multiple rings first.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
Changes in v2:
- Made LPAC register writes conditional on lpac being supported and
  enabled
- Made LPAC a child node in dts
- Added a quirk to flag GPUs that have LPAC
- Hide LPAC behind modparam
- Several bug fixes (including addressing sashiko's reports)
- Link to v1: https://patch.msgid.link/20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
To: Joerg Roedel <joro@8bytes.org>
To: Sean Paul <sean@poorly.run>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: devicetree@vger.kernel.org

---
Anna Maniscalco (14):
      iommu: arm-smmu-qcom: Configure lpac device with split address space
      drm/msm: add support for lpac_domain in msm_mmu
      drm/msm: look for lpac from dts
      arm64: dts: qcom: sm8650: move smmu sid 1 to new lpac device
      firmware: qcom: scm: Configure LPAC aperture
      DEBUGGING: print contextbank and other ttbrs on fault
      iommu: arm-smmu-qcom: Fixed mapping between sid and cb for gpu and lpac
      temp: add LPAC regs
      drm/msm: initialize LPAC ring
      drm/msm: Add LPAC submitqueue
      drm/msm: set ctxbank and asid based on ring
      drm/msm: add lpac ring to devcoredump
      drm/msm: gate lpac behind modparam
      drm/msm: enable LPAC on gen70900

 arch/arm64/boot/dts/qcom/sm8650.dtsi          |   9 +-
 drivers/firmware/qcom/qcom_scm.c              |  18 +++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 200 +++++++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |  20 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  99 +++++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   1 +
 drivers/gpu/drm/msm/msm_gem_submit.c          |   6 +-
 drivers/gpu/drm/msm/msm_gpu.c                 |  62 ++++++--
 drivers/gpu/drm/msm/msm_gpu.h                 |  18 ++-
 drivers/gpu/drm/msm/msm_iommu.c               | 170 +++++++++++++++++++---
 drivers/gpu/drm/msm/msm_mmu.h                 |   7 +-
 drivers/gpu/drm/msm/msm_submitqueue.c         |  14 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |  14 ++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    |  38 ++++-
 include/linux/adreno-smmu-priv.h              |   2 +
 include/linux/firmware/qcom/qcom_scm.h        |   1 +
 include/uapi/drm/msm_drm.h                    |   2 +
 20 files changed, 575 insertions(+), 114 deletions(-)
---
base-commit: 9a967125427e03c7ebc24d7ad26e9307e8403d4e
change-id: 20260603-descriptive-name-lpac-upstream-730a164b105b

Best regards,
--  
Anna Maniscalco <anna.maniscalco2000@gmail.com>

