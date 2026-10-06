Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6796F38B12A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 05:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791264569; cv=none; b=SXGGvyuxot0v4fNM9o5l7y/tXgNn9VRkbaBOXPv6Ts8LH+Bv6+OQXLrD+6d1jYxWdoFMlMae4SXIPL6AqAhb2mcaqoETR72XEBbvDXIoWMrSX+kcZoMcY+ExU0K3wLz1k42GenMKlwvNwEhJqxMT3s4lmgYJFO8qOrZRHAdee/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791264569; c=relaxed/simple;
	bh=NKpyav4GVat89f/6MO9Q6dZ+LXNTfCOB7JUaIKBrtPo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A7vRI5ZUx/OmXRsfNozvlOKEph3q69Lu1lODliV7DJRVN2YjbXQ7XGNbvK+JGnMmPmRZ9B89GExorW5OK2893zCzgpCnLwEZzrDdptJ3vPoxkc0TAL3rbGIePZ0+RXon+h8VRqyLj5qWqqdJk/7BDu91zmtuc19AAfFvymF/GyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JONSaldz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uby3UerO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JONSaldz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uby3UerO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6963Ag4C3450761
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 05:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=spJCwhc3nrhlO7KaDiqqjv
	9tbKa8IKU0ftE5pgGnaGE=; b=JONSaldzT3qXsN7vPhCN9xz740pmwhF8k75m5i
	0HwMGAoEZ9XY2iTx+nsFyhCTv59bVWa9Xf6ytgw36iw/MnYnYGDMKUvCUEpo/SXR
	EYUombNTK3LJQrwR0F40xB4yN+0U2ZMV6M4fBXYYmUamIYf9FvBn+5hsYXX02as1
	N1bSF27UV3+zZMRAif5unxbS927AwGrsRvgg4BbVIDFTTrSTnj0YtE3ZXYoyGKS4
	UXZysCORViFgzXUqbGUsTglk8bTKAU8OwetJq82dy2Llylx2Jg/LjndsbieMfqzw
	mW54tZMOuPC8rrJIZnY5BKDSejFz8JHR96MLHEp9mba99e1g==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4a7durdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 05:29:27 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-151ba226e1bso2444269c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 22:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791264566; x=1791869366; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=spJCwhc3nrhlO7KaDiqqjv9tbKa8IKU0ftE5pgGnaGE=;
        b=Uby3UerOT7tMjZppGpBD0kH9hWkJHDskYzSvT5Fz3sNfXnc6kkP2dKu+S/2tlF0MvF
         vD2gNxJ9XrE7GL/divlYF5TIjjbKGkWBlYOqBtWr7r3s92WZyxerWSKvjf+ToVKBpg+l
         0FgUrwNb8dwFdrnwdfZJvxuyCl6bUx4HjOhLGHs5EJa7RvNPM66SW29oxE2X+y9DyFt7
         0kXD/vxuqvNQEa083j+KJaEUhzzzi21jONS9VORRPCg2jtKj+LaUhRl+rN3QPy0X6C0X
         pHcEmvKkhLwvQowXmq3SIql7Pwlad8RL1p7QQoXoP7UWTjSUij5Msy/7NKb4Ca4Zclbp
         m7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791264566; x=1791869366;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=spJCwhc3nrhlO7KaDiqqjv9tbKa8IKU0ftE5pgGnaGE=;
        b=JQ9ySEx4Ke2r0NfLIHVHTXns4g2ITwRO/aOzji4/OGNAyJ/HQH/DgP1PeC3U8x26ea
         Z8DeX5dc8iRQIz5UvAcuvi1Q8kB8HcHU17BdP2+RQKuYpCp6wRGsX9KyGnNZLo8QT7uS
         G43Ly6nlm2r0X7bVHBuIjvwfk4MU0fSpjTt8y9ie00f1O8IVtq52LiV5IoFM1WGW+4RC
         mIP0WQ2j97BCH+3wImAVL8/H+4LjaEeg88vO6MrCbXpsDtmZ+EtPpv4yaS9wASNQtKK1
         sSUtmgaBb7JeftaVKJ+N4OtRwarCpOTjRCDYsfdgU3hWfPIdGWdpPLgjk2zLgP03aFwA
         wZzw==
X-Forwarded-Encrypted: i=1; AKwUvByBpMt7U05SEL9FT9aYgSz/ULvyApqFmOI8fBhP31NAxQBR7TbRwthoV5xzwDNFlDAoWBc5967XBO63UfA=@vger.kernel.org
X-Gm-Message-State: AFuF++kytDtjvqTPHcnfZektL4Bm6GO7q7YkQMohNrMO210qy+zjmCAI
	MUVi5dSkre1HMtrKTkrPlANeVdDYwC8nE9BuV2iLP8geDIJ//K2LBI/vTKnbnuIzXZamYE2jhoy
	+J5bU2PSqDRSk5IBkousZJQei7aRnYDDKCOLSYnk5X1UJWgxYvxSf6dIsn+zEADpN0mA=
X-Gm-Gg: AYBFou0QhVHUyyrrxmJf77kFRUPL0HLXRmP27FxN3zwcRjkyTuHyX5AZ644UWpR4kao
	PMMyKyU0a+OzrYyo0al89asB2fPjDJphFlIaTcRGmvBgONHuB/tHfL17GQ+QOBZ+Ap1saf8X6Ah
	ruEFEflMQZupUE5HK24ygFGprG91rr6kqW9oAFepQi/+LobokeNGuNNK2+gBZi6iMCTQoG/lAYs
	udfaCtYP9Xvnoh5lyopMSXvbNz4oBlPdBW5Y92kRNxjUYmNf3bnVhq4uKeCJ0AsSGkkfr1mpNVN
	prQEz2dn9GeD68NOazEZYRfoJj2z8GzDEzrMVN+I1TDceIYMoIZTk4jhj8XT9c/1f4MN+dipWoK
	PrVAA4hDcuxD5A5L1Mvc4GJqXJ9x60o5NZGgj9HeTpVLMeLJdIF74zS66LyYyuSQFKNR0hokS8P
	xdjBI9V4b9bed+FKYtyF5fUhsPfp/Q
X-Received: by 2002:a05:7022:7e0b:b0:14c:96a4:b631 with SMTP id a92af1059eb24-15ec878073cmr551420c88.30.1791264565821;
        Mon, 05 Oct 2026 22:29:25 -0700 (PDT)
X-Received: by 2002:a05:7022:7e0b:b0:14c:96a4:b631 with SMTP id a92af1059eb24-15ec878073cmr551380c88.30.1791264565191;
        Mon, 05 Oct 2026 22:29:25 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d85781d49sm4017403c88.16.2026.10.05.22.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 22:29:24 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v5 0/6] Add support for USB phys in IPQ9650
Date: Tue, 06 Oct 2026 10:59:14 +0530
Message-Id: <20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACqHxGoC/3XPz46DIBAG8FcxnJdmGNBqT32PpgfAcSXZagvWa
 BrfvYjdP4fthWQIv+8bHiyQdxTYIXswT6MLru/ikH9kzLa6+yTu6jgzBCygRODXduZFoajOyQJ
 WyOLLq6fGTSnldN5mT7d7DBu2S2Z0IG77y8UNh6yjaeBroADI2QpaF4bez2mLUSTxKlSpcBQcO
 Ob7uii1RAHm2Iewu93115q5i0eKGfGXViA2ipFaW8kaG2mEad5Q+Yd+t8pIoSxpbwhso/Ubqn7
 o+qGNqkgNKKsESrJG/kOXZXkCKK72Y38BAAA=
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfX2u4BRg3sBzAw
 l2GbboM5LFzpXDpRS0zSXvxkUgyiDqkKBAqY1QP2FxwWYWnbt3Z0F6iVRRlgXh3WJeYuV2FuSQ9
 +RJbr1LL1qsaWoWA/2CeYp77p3cNadI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfX9QulKEtWoz3Q
 a+lz++PogucBO+TMoRwQbAJDNkhR9oCTcH24Xf2AR2mUftNiZ4mjMVxL2s98THbnGlIowzd3GCc
 PXmr8Z2rwG/w+MC6GMVk6Oeo1jSVzbbYnZG6e6pskuqRbY+kEbFisnLwa534x8eaax7vklLWALV
 D+Yo2p/aF7Vzei4uooNSuzywObDLr7oqAef0vjhHQ9jGW8hLVcx1A7g9G7a+SZ4qK9aTb7S8GKC
 HkocM8GdQdSi5fky1JQ1naG5KheWtj3UiKY0EAfD48t7FGmmBYeQbbjLstwn2s9ETCciQiG4Gp0
 i+TTROB+Gel+flaCysocp/TZlgFzFUqRa8We+Dm8muUIcbpQJSIc4Gnkqdi1HT66ZcnXVWii6nG
 gmAZqAnchUnC3N9bpry+/gN8rXcxUcii18MT+kOrovosDfrX5Puf8DrO2bZ6MN4YCcsZJsNniA2
 ClicpLcK0tXHEFblzzw==
X-Proofpoint-GUID: oEN9SEklep10iHtLdYn2LvBJ6Z_EZ1en
X-Authority-Analysis: v=2.4 cv=SvwFe/O0 c=1 sm=1 tr=0 ts=6ac48737 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tpprtx7nRKxrkFoMJnUA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: oEN9SEklep10iHtLdYn2LvBJ6Z_EZ1en
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_01,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060021

This series
 - Adds dt-bindings and driver changes for the high speed and super speed
   phys in IPQ9650.
 - IPQ9650 specific init tables to QMP super speed phy driver.
 - The Femto high speed phy driver is refactored to accomodate differences
   in the init sequences between SoCs first and then support for IPQ9650 is
   included.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v5:
- Use FIELD_PREP_CONST to define FSEL_24MHZ
- Change commit subject to 'Fix order of arguments to qcom_snps_hsphy_write_mask'
- Use data->{pre,post}_tuning in qcom_snps_hsphy_init() instead of a temporary
  local variable
- Pick R-b from Dmitry for two patches
- Link to v4: https://lore.kernel.org/r/20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com

Changes in v4:
- Rebase to top of tree
- Split 4th patch 'phy: qcom: snps-femto-v2: Move PHY init registers to config tables'
  as follows:
	phy: qcom: snps-femto-v2: Fix qcom_snps_hsphy_write_mask argument mixup
	phy: qcom: snps-femto-v2: Move PHY init registers to config tables
- Link to v3: https://lore.kernel.org/r/20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com

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
Varadarajan Narayanan (6):
      dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3 PHY
      dt-bindings: phy: qcom,usb-snps-femto-v2: Add IPQ9650 compatible
      phy: qcom: qmp-usb: Add IPQ9650 USB3 PHY configuration
      phy: qcom: snps-femto-v2: Fix order of arguments to qcom_snps_hsphy_write_mask
      phy: qcom: snps-femto-v2: Move PHY init registers to config tables
      phy: qcom: snps-femto-v2: Add IPQ9650 support

 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |   2 +
 .../bindings/phy/qcom,usb-snps-femto-v2.yaml       |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            | 118 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c      | 193 ++++++++++++++++-----
 4 files changed, 268 insertions(+), 47 deletions(-)
---
base-commit: 15551282e82db772bfc862f96a8abf14a60f4ea5
change-id: 20260820-phy-664ed5ec0292

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

