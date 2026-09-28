Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FE44EF130
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613426; cv=none; b=r172azL4Urqu29Fmse7kveW34IfpHBJHbWy7nZ8dONKV83K+1ZIWQLpnivMSjZRYddqFATef95k84dHHfpoYlsmGbAtdkOI6NhvZnRGPTzS73ORDe2qSSLxdkLjSq7xq8cYdVocztdFjL7LIfN6WErTeJvBtfwnvUmBRoyVD63A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613426; c=relaxed/simple;
	bh=onQd7vt+ZvzyO39InvHDbhZR5IXe9nvf2jIlkWOy5Bc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Nw8qiuQ5gmSSWRpLPhF9kBQ5QzVkI3wjn8Ivj2GaaKG6pW2ldrSWa9EOGe2n0zwiuGULEMZexYgfKpQ/umA0+f+xhd4H5dJFuuYpk4yvxUooO9Vy6c9xnDjlD8zT03iKyWvRIi0DoXLgjHtLlVWxPFqtIM0Q+whqpWa830m5gEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aWhCLi04; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fysz9RuP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWhCLi04";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fysz9RuP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEeJji2298783
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rJtGhW3GHOUPrv+N3MDi/L
	0W5Oo91hZrntAMDMlybcQ=; b=aWhCLi04NA5YHANSD+l23HnjD4bM7+4hn2czN5
	uyAJ+WVjoigJyivfNwuitnjbjKTRlt94oC7pghbxEDaHOd/rHzMyEYwxg3UG6Z4h
	sD/shA65FeZ9nkVJmN17RYXyCFtzgQRSFr0uYobCfUXUQYP9M/YbMuJJzeElAu1u
	dfJ4dGxVxvOQERimFXUuHPMcrMUdODvPoRuW+1XYMiIyOYMwplhzu4/R1TZgO6fW
	TDqjQlY8dSpF8QpnHkvF3u9G8elFT/ptFTt7IAkFQFlCbrVQLXwF5JK0LJYlwOQ+
	Ap2E+GMK5FeicjrwdqLfUQ+stMyKvpI6ZDyLhDPn688ISwXA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynb6hskg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:37:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a183a0e93so711500385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790613423; x=1791218223; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rJtGhW3GHOUPrv+N3MDi/L0W5Oo91hZrntAMDMlybcQ=;
        b=fysz9RuPtkUXu2c26ZitrtGtp1WVeqyuavieHl5WZSL6sR1XzSXukoFbqqf0Tr3zL/
         kxfA26Gxz/PUtd6ixWL3VP4QDCl0qrUTTUMZNtsoMm1povxJ0yQ0DOadb3fhUBnuf7fh
         a4w6dt35i2g6jXd5k1KfzjSs/hLTB7FenNIuR30Sabz7ER80dbYJkqpXiZqyG6QyzYsT
         kaXSucnI1TPqkSpp8dsucIo2g7yzL4WFZcDfRRjSn59tbEjvZ3SQVvovV9Qgk0gPb90O
         c+SKA/Z2yNFY7cjVtJLlUkHD8XU0ZpPtPkl9o++iPLN6/cfvAFT6UnEuLWSQgNwBouPA
         DCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613423; x=1791218223;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rJtGhW3GHOUPrv+N3MDi/L0W5Oo91hZrntAMDMlybcQ=;
        b=FxQSXf/ga3lU/sTO2pRd0LFtJXIxjIUFjrSfZNJ0mIDBW8AeKZoGgl3t9ve4mekkK7
         cVKgPcqX/s8EiluDuJpe1eC+peiWZ7BWn0c3UrakrUw272eHuUdbH8qpxE0o60OE4riT
         qteYaSnCcqny/cVy9QG+d4fzhTYjHI7j1Lz7x3p8OcdXRAQqOs6wh/FmOuSBi5pMLhO7
         j8jSK5a3JL2zZqf4AqBfzOkOkqhqRJN35M+xo9vmT4tQVdGtO9MnKm3jWVMl6yCAwCC+
         By550gl3iQFO1Ht2yYsIhgSgHxK2dAE1NCMq4GCwj8OfuBBozalUfgVafwWYbGnGl1xJ
         +K7A==
X-Forwarded-Encrypted: i=1; AKwUvByPYYfPfdr06pNNFC5/KvuvXaaeAhiXVqJexSRMEbfBWCwtj4S9nPRQXeSLbsIo/KKmmunMvVqpOSEH7k4=@vger.kernel.org
X-Gm-Message-State: AFuF++kmeryx9N1D7ZTyOVpTdQopBrowjcpd8TuFeTxB0LQuhzRrLASN
	nW82MdZ4jPzTTZ6EN7890E8BhJmasCIYaQlp9VX90qGjhmOO23BsTTHcifEP0kqOEGKwT5NDc2n
	RjnmiktAyJTP9u+eHt4nxYbGFJNgbuQwRiMWoBD/xpRBCX/UHpiQ6NI8f7dje0tSdu7yb7/pZWo
	Q=
X-Gm-Gg: AYBFou21Ak/yAQunXjDiuDlDT3eafTkSXWOEb88yVRX5G8FgWpiUaJl3IhsZmD0VNnF
	zF9LosE/TuJQ8Ml8DjNwPMV67byJPcE8UySfwwJ45QKKk2RWdLNGQAQYNtsDn9Y29kUUn59RVbU
	BWZgScjLyLT7KedjyUb8tpzAeyabcqKDepazYUujwtR7neM2lORi0Wo4eSXxjHFGz5LO5tEN9jh
	+/JwB2V3Uw4dG2UDLsMwkDNRkQ1iDFsWXtwGzSXWpMBluB/uofEceSLvV6qpYKwvoVmtl8M/w4q
	/jVleQyMHYqC14jjemIkqhvWXOYvUbFHG7Xu5RYlYWk694ZxmYAmVVjpdCDLfad46tsA9nivpvN
	U54PBSc9X
X-Received: by 2002:a05:620a:8083:b0:93b:d7a3:45d7 with SMTP id af79cd13be357-93c43d77757mr2085634785a.64.1790613422710;
        Mon, 28 Sep 2026 09:37:02 -0700 (PDT)
X-Received: by 2002:a05:620a:8083:b0:93b:d7a3:45d7 with SMTP id af79cd13be357-93c43d77757mr2085612485a.64.1790613420188;
        Mon, 28 Sep 2026 09:37:00 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6456f8sm28442084f8f.26.2026.09.28.09.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:36:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 0/5] arm64: dts: qcom: eliza-cqs-evk: Support eMMC and
 UFS SoMs
Date: Mon, 28 Sep 2026 19:36:49 +0300
Message-Id: <20260928-dts-qcom-eliza-add-ufs-variant-v3-0-9a2fdbf6baf2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKGXumoC/42Oyw6CMBBFf8V07RgolYcr/8O4GNpBa3hIBxqV8
 O8W3bgw0c0kJ7n33JkEk7PEYreahCNv2XZtgGS9EvqM7YnAmsBCRjKNiliBGRh63TVAtX0goDE
 wVgwencV2gExFhdSpTraoRJBcHVX29ho4HN/MY3khPSzWJXG2PHTu/vrAx0vu7zEfQwRZXiZSF
 YSUxvuOedOPWIdOswlHLJteflq3P60yWPPUZBIl5pXKvljneX4CwimsEjsBAAA=
X-Change-ID: 20260914-dts-qcom-eliza-add-ufs-variant-74092c6c35a4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2958;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=onQd7vt+ZvzyO39InvHDbhZR5IXe9nvf2jIlkWOy5Bc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqupekNZnX6PDqGx3yK89Ty8aJuUTYzicLzfQFt
 VDrY2ln23uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarqXpAAKCRAbX0TJAJUV
 VpriD/wJVw9mnbKBfbFEA9YMQIElnpnqenc3U7G8n8Gg4/tjapZz3YnhB1FwNRr8BBLrHiLXVB0
 TNe+pHBOIu6h/Hb/ubidNtnDgDmplX/nFz3tgi3FjdD/CE5dxeDMWDqsZW6WBMTQ4NCx9wLvYwb
 E2wmyLDdU47gLNmXa9wQVirp9J/0/meDo7YQ68wvmYnjMjckSs6nhlRE3xqciEVQB2dp62U2djR
 +EoZAG513pBIfP9KwmCe1E8qdbWKD5CopOyrpvXprSW2UjgXdEXyXUKQqutUQNVZe17+JP+gppc
 e8dsUhKn2E9h4le1xfJ4U6IAP8RlnvEJq5TSkZNJ6eluyKrgtrw3JyVnHFQtT/XWthUJP8WdDxR
 1lWvzic+GZsY+D7YSXFGVEwr2UqKHwKcLWY//WfM4WkF9/78AKpaAPHfdOPZSQp/ywyXfncy6nl
 TIBtB2Lgil9kZrP7GhoBhVfhlbJOU8elel5LCf/IiVkkpW4AWicvgzHsS7WWsQJfAguwITHQZEI
 49FQmcu80DNMQaPdmA+DOXng3lE4ACDpQfFTAjrgejCvAhHR+Q1xZvp7G55zd3gUtdNF6M65dlG
 tEJqkNgKUvz7VwTlrLUB+TqbewdHhREjaD+30npFIEtMXyZc8VST8+uOiL6ICNUOKptI8yUGaEN
 sZfLeTD46S7vbaA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfXzgne9oSxrFJl
 /Oc5BZXPiMu9NXhzJe6T2v2mlfxU4r48MtdUFrLwY5ta4lQ0I2Vv7OMOOykGNrbnCB8Mcvf7RyZ
 6Un6HC6KpKQgtNPfkOXd5A8m7RZnu50orPAzFhfBAvRwRCPEWQfL3b2QbMbOyiwcqBJuilmDFLh
 4eL5n/yHJQXrnmPDNkSIdImEqrW3A84Zjz37+MbfCbgTyWXfLx7vI37NBpwHwDyIyUXtWG7/Fpz
 RbO79ri42LfkuVcAbqeFX8f9CrK27hwGmb5Yp6T0MmeV5XKoP4ibI9E8IBxDHgOWbMTPoK9pMLu
 SWQjQQ/hpeq4hWChSPA6aT6fbh0VQops88+MKzLJvNCY6RKxAEO8xU4k88wixoavcUXemjGEuCl
 irCn8d0wFUOx3IXU+NmYnBj03Njyio83GYDlgx+HbLz5NMdmoaVSqmFZbwbfrvIb1t7RS0S3/UX
 Khyhy7Dt5TYCgkMB6Ug==
X-Authority-Analysis: v=2.4 cv=K+e3jCWI c=1 sm=1 tr=0 ts=6aba97af cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=QCpmOYMUsa-Jg5FFpWoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX90a00n6o7JlO
 Yu63Se/aP80rWUGhrp1qDyXakXP6n8TvccaYnEqYs9Xjt0WSu14WkG7TiUSCCxWu5coE9lJ3B+8
 73BpenZ6hKxdVxNbnVuboTD4JkF6AfY=
X-Proofpoint-ORIG-GUID: MAT-uHTpEUWM7jxRyRGrQIRNkPVFl6xY
X-Proofpoint-GUID: MAT-uHTpEUWM7jxRyRGrQIRNkPVFl6xY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280066

The Eliza CQS SoM is available with either eMMC or UFS storage. Both
variants connect to the same Eliza EVK carrier board, but the existing
device tree describes only the eMMC-equipped SoM and uses storage-neutral
names for the SoM and the assembled EVK.

Give each SoM variant and its EVK assembly storage-specific compatibles
and filenames. Keep the shared SoM hardware in eliza-cqs-som.dtsi and
describe only the storage controller and its variant-specific supply
voltage in the eMMC and UFS includes. Neither variant is derived from
the other; the carrier-board description is shared by both assemblies.

The existing boards have not been made publicly available, so renaming
the eMMC DTB and replacing its compatible strings does not affect users.

Move the sound card support into the shared Eliza EVK description so it
can also be reused by the UFS assembly and the Eliza CQM EVK later on.
Keep the existing sound card model name for both CQS assemblies.

Changes in v3:
- Extract the common SoM hardware into eliza-cqs-som.dtsi and keep only
  storage-specific configuration in the eMMC and UFS includes.
- Clarify that eMMC and UFS are SoM variants using the same EVK carrier
  and explain the problem addressed by each patch.
- Collect Konrad's Reviewed-by tag for the sound card move.
- Link to v2: https://patch.msgid.link/20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com

Changes in v2:
- Actually replace (and remove) eliza-cqs-evk.dts when
  eliza-cqs-evk-emmc.dts is added.
- Collect Krzysztof's Reviewed-by tag.
- Link to v1: https://patch.msgid.link/20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (5):
      dt-bindings: arm: qcom: Describe Eliza CQS eMMC and UFS variants
      arm64: dts: qcom: eliza-cqs-evk: Move sound card support to Eliza EVK generic
      arm64: dts: qcom: eliza: Separate common CQS SoM and eMMC configuration
      arm64: dts: qcom: eliza: Add CQS SoM UFS variant
      arm64: dts: qcom: eliza: Add CQS EVK UFS variant

 Documentation/devicetree/bindings/arm/qcom.yaml  |   9 ++
 arch/arm64/boot/dts/qcom/Makefile                |   3 +-
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts  |  18 +++
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts   |  18 +++
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts       | 155 -----------------------
 arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi |  27 ++++
 arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi  |  29 +++++
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi      |  18 ---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi          | 139 ++++++++++++++++++++
 9 files changed, 242 insertions(+), 174 deletions(-)
---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260914-dts-qcom-eliza-add-ufs-variant-74092c6c35a4

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

