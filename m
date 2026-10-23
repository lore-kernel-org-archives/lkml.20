Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792745344;
	b=K0drYxpvA6Gxa368c70bYrF08RJkvx5wvQV9Vly7kIDe05JkH6rPbuSd97ay/f1Jl+/i
	 0Z+SUB5uM7U4yRDZqG90BFkn/EVFNjFtM8qzPPWDpVc9PKlPLSkg0PsDcmCZkbdIrM/N8
	 d6J89yuYXexgoZ6J8Gcp8Ia1ei7WMdJMA/ZGcHq6adTrz94MDlBodfA1MkCDPSkSp1/Um
	 TB+KhrTx8OMTv5HPo9WBQfWisf3oXnzTJkFOj+JiLsuf6m17GRRcdWyqU17BTG5Hc6Yg9
	 01zqCaTeUhcxKTmb34lS58qHfF4T3VIYcX2RMTVqU8UDj6e8Xayb5hxlRf7qnr4DEMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792745344;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=W+RT6HxR5If0G7m8IPAN9OQgNQrkSvvUbrqPtxghAd4=;
	b=Lm81bPYdLKNFHLNORiT7v207VVqVk+FCxO5LVrvjl3wK1pgZQAtOt17ggwkhedK/eEGS
	 MUvi4mKBFc/ZR2lmsckf/Ff/vagr7OlF4zl0QSMgSCw8F13xN34GBiCivklWF3CnwWbQm
	 k/aSDbnPNmBQ0pN3GAEp4C723f8zQWqHZ5xT+A/uapaKduScM3m/aVdtoM3oVHAlFGQb6
	 MPSXUTn48qoi+iyVvFLZvGRYL3Hp8PrNQlvtb4m2TOomj2Hqm6m3pDARWAw6ZKMxkztuu
	 t/q9i5PpNFMdHV540oNk3A9bMlqGx1I3jKMxzW8fA1Rx6ElXPfYWOeYSJTeS+zqmhhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lvi6wnqi;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61094606A321;
	Fri, 23 Oct 2026 08:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lvi6wnqi
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792745344;
	b=BESV0W5vW5pO4QEOwDCfTh25yRNCj1by1aNdjylAVNn7H6eCTaMoOin8J2Hw8NkEaRhB
	 mReUxq2bjX7p9VlqpEq0Q09LLxiDJXoE8bT54PhlNl533QKWYqRkt9tD4WD+u771ZKZGK
	 KiTJaGM08GtOE/0k58OK8qIJB8cTKyqFzOyL99SS4oWaJ+Jh8g52dh2mKPbnTDq0B0Pto
	 oI92MD/2412sKt2St6JDiddcBXwnmCxI2M1p0SvPlkKwv+TUa3TMUuVS7i8Or0okTZDWP
	 mmV48Dsm0bVguDpDj0aaLXe/V/3g098ESfcSauD6COXMNp9Q5dOYKU683MoWH5mRS4Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792745344;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=W+RT6HxR5If0G7m8IPAN9OQgNQrkSvvUbrqPtxghAd4=;
	b=VZSRU/rz4XV38PR6M0DzSyIy+xwpXOqRfkaELYhkGr2iSFwUJ2R2l2MueiLQMLO5Lgwo
	 aYPSUqknfkOY/MCrQEpfsUgPEzw8LORoJYpzZ8yRhZc2fdo1Cw0FINwMJJcIwfMy8FoBa
	 pdZvZ5B3Wtqs7mCJZFh0NDEDwTTRWbkOTSBTnd529U0frkJR1OEqBDATnOk0+bVK9E+Jv
	 7W/bh5d2ep8KYaJvwb19++tkzOLi568JCHrI8rpDfVyBD2ip27McmNalxT0eUGAlaVN4E
	 wkebKtba+INdiD41GORQ9A3CO24EL5bTQ3D+D2ZkfpFY5Na6tDtjEXn3QFmQjxhb4Xw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD6471F01825;
	Fri, 23 Oct 2026 08:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792745344;
	bh=W+RT6HxR5If0G7m8IPAN9OQgNQrkSvvUbrqPtxghAd4=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Lvi6wnqiDjSvkqZoInc6X/QDfUkYJVrYq7wUfuMeYJs9l4srhU/jkSSd3lXMbcuCM
	 Uj8ohrMEIvyzHjeKqGa10Kmyr+LgbXXWPMBLQv95iq4NxeJS5ydSmLhQT8tkO3UVIb
	 sfwzLI0SCDCbA3sWT+dNpFmlvP/TF4ny9z3VVq5piQXF/jZi4ILd4nc60ye1hN3Hb2
	 WaHdlY0ymn30qbjX++dpZ5kIwq6tGoZkyt6+1U21th+p70I04hEr/Fr1Ahkus7gYlG
	 N11ZZGMAC22mQ/8ONBpzsSZNbyr3L622NFuegj0tycSZWZLUS9sXVWZTASXKh3G6Pn
	 Km8dM+DwxTdDw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5C51B44439;
	Fri, 23 Oct 2026 08:49:02 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Subject: [PATCH v2 0/4] drm/msm/adreno: Add Adreno 620
Date: Fri, 23 Oct 2026 14:18:58 +0530
Message-Id: <20261023-adreno-a620-v2-0-1d654c3f52d5@brar.si>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ7CIBBFr9LMWgygodZV72G6oGWw4wLMUImm6
 d2FunX5kvffXyEhEya4NiswZkoUQwF9aGCabbijIFcYtNRGSWWEdYwhCmu0FN4imq4bTxftoSy
 ejJ7ee+02/Di9xgdOS01UY6a0RP7sd1lV7385KyHF2bbojFbSta4f2fIxEQzbtn0B0Y5YkLYAA
 AA=
X-Change-ID: 20261016-adreno-a620-faee699b382f
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792745340; l=4076;
 i=patches@brar.si; h=from:subject:message-id;
 bh=/beW+AELpxp6o1wu1hniusiXifJZlEukCyeC01/aOdM=;
 b=FQHQoc8nksHyFjwH9rtQud/6Sz7XiVo9yW+GxJLlCUUjw1Ls15rVTcsdPiz/S/b0//za1teSJ
 gD3SEC2o7apC+fT/I0o+6AihJHFhbUqZSi01k882SZIwpPELBzyZrqr
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si

This adds Adreno 620 GPU found in Qualcomm SM7250 (Snapdragon
765/765G/768G) to msm driver. It is A650 derivative using 
a650 SQE/GMU firmware and a620_zap.mbn. On top of catalog entry it
needs two A620 specific GMU changes:

 - A620 has no PDC setup from AOP, so PDC sequencer is
   programmed from driver (xo/mx/cx addresses from cmd-db). Without
   it RSC never acks second power-up and device hangs.
 - A bandwidth table with BCM addresses of this SoC. The generic
   A630 one does not exist on SM7250, so first GX performance vote
   times out.

Tested on OnePlus Nord (SM7250) running mainline: the GPU, GMU and
Vulkan work. This needs the SM7250 SMMU series [1] as well, otherwise
the device is reset when the first per-process pagetable is created.
The SoC devicetree nodes are not part of this series; they will be sent
separately once the SoC dtsi is accepted.

[1] https://lore.kernel.org/all/20261023-smmu-sm7250-v2-0-8bb881ce19f5@brar.si/

Signed-off-by: Ishu Brar <patches@brar.si>
---
Changes in v2:
- Patch 3: also program the VRM command (vrm.soc + 4) in TCS1 and TCS3
  when cmd-db has it, as the downstream driver does (Konrad).
- Patch 4: GMU clock gating mode is 0x00020202 as downstream (was
  0x00020200); add the SH0/MC0/ACV BCM list for the generic bandwidth
  table. The bus widths are the ones the other A6xx/A7xx parts use.
- Patch 2 is kept for now: the generic table is only used when the OPP
  table has bandwidth levels, which needs the SM7250 interconnect
  driver and DT that are not upstream yet. Without it the A620 would
  fall back to the A630 table.
- Testing: v2 was re-tested on the OnePlus Nord (these changes on top
  of my 7.3-rc7 port tree, not on msm-next), with the interconnect
  path and OPP bandwidth levels in the GPU node. Vulkan workloads ran
  across GPU power cycles and all four GPU frequencies; each frequency
  selected its own bandwidth level, the generated BCM votes scale
  linearly with the OPP bandwidth and the GMU accepted the table. I
  could not read back the resulting DDR frequency.
- Protect map (patch 4 follow-up suggested by Konrad): not included
  yet, waiting for the downstream reference of the 0x1c800 range.
- Link to v1: https://patch.msgid.link/20261016-adreno-a620-v1-0-4a7ed6210d7d@brar.si

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Ishu Brar (4):
      dt-bindings: display: msm: Document Adreno 620 and its GMU
      drm/msm/a6xx: Add a bandwidth table for the Adreno 620 GMU
      drm/msm/a6xx: Program the PDC sequencer on Adreno 620
      drm/msm/adreno: Add Adreno 620

 .../devicetree/bindings/display/msm/gmu.yaml       |  2 ++
 .../devicetree/bindings/display/msm/gpu.yaml       |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 35 ++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 35 ++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              | 34 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  5 ++++
 6 files changed, 106 insertions(+), 6 deletions(-)
---
base-commit: d024361c631b3f020a26c07d683e5103404b0fbf
change-id: 20261016-adreno-a620-faee699b382f

Best regards,
--  
Ishu Brar <patches@brar.si>


