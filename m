Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87C73148DA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230219; cv=none; b=BRI2cstijGgYdR1luQa986tJcrwN5bOSOswdGyJ7nbfSsMhOjIrErQHWO9NSQjwOsXM0vVdWjNUm77JjL+QTyfAJBm2GMVLhBFvHwdOA1pJTsbjvpXqP2/IrAnSsKcADoLRMbo6Udo5e+DDw89k/1yA+t6NPgs3BR0/trYT09Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230219; c=relaxed/simple;
	bh=PqysGL9lT6ReuVULaftKFdrXfVhFqZ1wPgSG2ApYH/Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dTH0je2vzWxONfAxKdUe7aF5d4T/xZmkS3gdyFiUNruL9Zz7uXrMonoxRL9E1ofPFXFoAyoywYAT9wQDFiQt9ZwOAWQfM5TDBO4qGxXJw8lvBrrxsWHHR7rn/SN5JpyhfACBj+svuT+44iNA2U5sbF3Y9oQr/dLv+hIsjTN2z2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NONLHqm1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IL5LMZ9V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NONLHqm1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IL5LMZ9V"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eBG7772439
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e55LAaZRA3Zv3Hfwt2jNE+
	aprg9/OGrCXbdEqfdyl9Q=; b=NONLHqm1oIkq1wy9SwavJiPAu55HhdhQ3mK8Um
	PPbwsJMVbmTdJ6EYbctyz4gv5RezHON2OlS0kM7s+Mgd08KbdHeXjzguQNubLuhl
	Rux11PTwQEa8nBN8ZFS/70aqYTTEVm7PzcQ89auYpPq9+SRhur9C/cFdP8Fv+VR6
	Zh8PfNo1/Lrd8kdpUih4Ly5Uw0h+VMzXKZnTkv3Tx3pEorZdspALMlD8mKyicEEG
	8bQuAjUNNvekj9mmNo+5OjSVxbx7/yNgdb/qQa/wYDLFCsYk0n2qRYRYsLx4ENOe
	mS7g73A5DpdsOu78sAaznZD7TZLyQVbUOBWYM+LVCEuL/HRQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr9098h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:10:16 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2878120eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790230216; x=1790835016; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e55LAaZRA3Zv3Hfwt2jNE+aprg9/OGrCXbdEqfdyl9Q=;
        b=IL5LMZ9VKkj9dSPy6hTbTd3IptoGsdr4tYIcqVQJoLqTFQzfqvKav5iM2tYdvZVWGG
         Hy+SB4rdTOW+CO+uBdJqANF08townybH3c6BQDyZV2IQSEbLSalPzIl0XkWxan3GkemX
         vyM3w0gGWnjxtYZMf/LO8ThGCSuFGrEw6KSUHdVFXEJgfoubhpofmpCiuZzq3HAS43M+
         mFlLJRgmV7FREYIeX8BMmZ2UYE/3zA7tg8wTptIm0lSazfBOL6IschFMMUZ7S27DANMq
         2irXtM+EVNlKlF30SPrnVewUKXl6RgH0mqrIO7gIq6/AzEeWkqHUu1+v6t960/3W4r3y
         oh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790230216; x=1790835016;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e55LAaZRA3Zv3Hfwt2jNE+aprg9/OGrCXbdEqfdyl9Q=;
        b=lZziiP90FlOB0+sP0+LvrmeQME76A7cpt9M4pEoOnbHeLe97cLRUNJqs43iLZLq43h
         esxJ3UEoAiAwPm4my0q1sJeWGuAKAYsBdqtc4mn6hWw6Qq8G4oIDwakNJa+HZuDx+QGE
         HHifesEDQJpuIWUYeS2ZXXiVef4wqx8kSRRiBseBBmtkmSM/6e1RNmV/K5CztoRW92q9
         8I+UD+HbwioFQ3eIHgAq6pv4Rg+4sbvl6JSdfuVT1l7YlQf4nUdDlP0e8qisZjfvAU3m
         Hb0sflR9rflN34pIQLvjtm4T4URKesUq1JFiixaHGU1kmai9GboeLmUSF4QVgYXA9OFT
         v22g==
X-Forwarded-Encrypted: i=1; AKwUvBzQEYfyLnb9y3rJjlQQmxY4L5CNY8xxZzXia7fBFZGPoXsOvJlmM9cjaA6BnRwpy+g3SbgwZWBeGiNdqhI=@vger.kernel.org
X-Gm-Message-State: AFuF++mETWQd8lGYm1jWtrZ8IbHzbMIW+tOthBDQZc1qJrtVeq6aHOAS
	2BfZxRdj1hzjKCY0gs2P4gQUACe1WndAXBpN/JHS+qfJobOs2Nn0rb8GzwyynlMAl/1DwCZYpik
	x9s14EyAQN0TnRsNeiWVDR/DK5OT+kP1xEgGLlDSHEBjBgvh9Z7MXAE8VBzM3vKo0YFA=
X-Gm-Gg: AYBFou1QTuQeS0InF9gb/7csAR8X8vG5iZ9k60Hq2J9Tze3VQC3VJ2ApYYcMVIGE1Nw
	QEldAZpa0VCboBwEobhLwCxkExDBqO7p2vKmaCm4ZUUjtz931KaTmDNAb0970XqPSPif3Whv2A6
	VlAALRbiNiUYfE4CZfiW6imGB4HD7M/GSuEaOoAg00hqkBw2LRk2qKWhptNR1lCbheLXMgfsMBt
	Uqdr+4fnx2g5Shlohzd4ScNw65f0rVwPyHpmqefKmE61oE9ecDHVhkIuCwQDO/nFCESEEiUla7/
	PdHYLNctLH8mtSOriBG4Fta+4MYdoY1cmtctgN6ndyKDyt4DPG6+6MHYOrPQfnfW7O2ycl4CFLh
	cUciSFQXGmp+mDafdDf4+WmGQAnIreiHbE5BJQMWAUOhmozVFAyJw13+O0FYGwiat43ofmO/dUu
	WdzVZWMI+/M39gBAJdK8LujIUOG6qs
X-Received: by 2002:a05:701b:418a:10b0:143:26ed:2dd5 with SMTP id a92af1059eb24-145040b8b30mr1040763c88.31.1790230216190;
        Wed, 23 Sep 2026 23:10:16 -0700 (PDT)
X-Received: by 2002:a05:701b:418a:10b0:143:26ed:2dd5 with SMTP id a92af1059eb24-145040b8b30mr1040749c88.31.1790230215660;
        Wed, 23 Sep 2026 23:10:15 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9895c1asm10197680c88.12.2026.09.23.23.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:10:15 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v3 0/5] Add support for USB phys in IPQ9650
Date: Thu, 24 Sep 2026 11:40:01 +0530
Message-Id: <20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALm+tGoC/22Oyw6DIBBFf8WwLgYGteqq/9F0AThWktYHqNEY/
 72ITbrpZpI7mXPubMShNehIGW3E4myc6VofxCUiupHtE6mpfCbAIGM5MNo3K82yBKsUNYMCiL/
 sLdZmCZb748wWh8nLxnNJlHRIdfd+m7GMWlxGGoQFCHIAjXFjZ9fwxcwD8S1MQuHMKaOQXqssl
 wI4U7fOuXiY5Otwxn4EzQw/tGD8RMGjWheiglooruo/6L7vH9Y6sz4JAQAA
X-Change-ID: 20260820-phy-664ed5ec0292
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyNiBTYWx0ZWRfXxjU2SbBSRqgX
 yUmWHY3ecb0J+vO/vArgA7u6LLYRX7EhctcX7tnwfOFT/eTs/4UHL0f/tyHb14qqEVMz4YgdUsg
 Sn3O8d0SxfFK6Uh5XCy50wWj7xsb/o4=
X-Proofpoint-GUID: 77i5sk7NYJJkJkkS9AQ_ZaOV54n1JOdx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyNiBTYWx0ZWRfXzIq6S4QVwjGJ
 v01g6SYQovSTkS9U38pXCTnurbaGkqXCdA/a6DEme1gfF8P8Y+NPK6n+4fjvBFJMwNd9aEZgZWw
 7VgLMH52v7u9Q8SVYYguW9az2oMqroAqUJ/A8Cyqq4onldWDRUMDW7IjK4+65LdRQRi+l19X4Fk
 Wnt8GZgSukxrFoMHwKFYeI4PoAdVHA9Xi4+fyT6ruDVvOQ7KoELefh/dlTAZrkOIZuw61PPnajW
 9MhjcNj6kXU+dJsaQDLYw+tEDyRlN7/aeq6BHrgkcrKgsi+OgAxhsxvCQaUHtMIHMhw4dAakfcI
 NfaTTsXWhxs1q/EXASGfYbVpV1OZK2SSqZcgmhgTo3US1CsZMomKK5C2AwdqMGk67vg/+W3YTSI
 Se30LnEDXdlc9g87JDctAxvzzRATQBSJesbTvBFjNRgryxmXZTzKkEz4KAA9w5U9kZEJpZDOw8t
 VhtNwXyGgPcsS/NbI6A==
X-Proofpoint-ORIG-GUID: 77i5sk7NYJJkJkkS9AQ_ZaOV54n1JOdx
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab4bec8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QVgSJ0PFQKcnxtkCEG0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240026

This series
 - Adds dt-bindings and driver changes for the high speed and super speed
   phys in IPQ9650.
 - IPQ9650 specific init tables to QMP super speed phy driver.
 - The Femto high speed phy driver is refactored to accomodate differences
   in the init sequences between SoCs first and then support for IPQ9650 is
   included.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v3:
- No code changes
- Rebase to top of tree
- Pick two R-b tags
- Link to v2: https://lore.kernel.org/r/20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com

Changes in v2:
- Pick one R-b from Krzysztof
- Use qcom,ipq9650-usb-hs-phy directly instead of adding a 6nm compatible
  and falling back to it
- Change pre/post to pre_tuning/post_tuning
- Use array count instead of terminating entries
- Fix value/mask mixup in 2 places
- Link to v1: https://lore.kernel.org/r/20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com

---
Varadarajan Narayanan (5):
      dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3 PHY
      dt-bindings: phy: qcom,usb-snps-femto-v2: Add IPQ9650 compatible
      phy: qcom: qmp-usb: Add IPQ9650 USB3 PHY configuration
      phy: qcom: snps-femto-v2: Move PHY init registers to config tables
      phy: qcom: snps-femto-v2: Add IPQ9650 support

 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |   2 +
 .../bindings/phy/qcom,usb-snps-femto-v2.yaml       |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            | 118 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c      | 188 +++++++++++++++------
 4 files changed, 263 insertions(+), 47 deletions(-)
---
base-commit: 4d7e75152b01862a4ec598435d79a81c4b254dd6
change-id: 20260820-phy-664ed5ec0292

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

