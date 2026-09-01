Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933B31F94F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788242678; cv=none; b=UCnZ3/jqarrFXxBfxdwKmZ1FQ7N4yKEilHg+27iePcz2jPhuy5TbU+4aexHq7MliBfBirRmnezEaTmvA6BAsOEOhZvxmW7T6i7FccSI8ts8yB6Zg1twTpFf1cQ71/i6j9C9YiGT/Efyc0K6UlYvJcwwSXJFDMqjPoy27VNvS/xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788242678; c=relaxed/simple;
	bh=sdAD9UnwXQYZoYPI30j40I5aeiFnombqJ59n0J+3aU8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=otcxfjB6tD0zVQEvuMv1dngZLoISIdQQyhvd40wv6lKrSIMHcwELbupv5XgrX3tctXs17oqec9eB1NXBwWBUcmALUkGOEu+Jq+8FJizPGXLUc1zE3beHjCQdT3/Oe1z1RD2vNu+mRtjH/HLN9FCVpuvQjVjeQ4Bv+3ncWWkerMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DfMzcn60; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCe0MdKx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DfMzcn60";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCe0MdKx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810p0Ll1487674
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 06:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Kp/nji48OQnOcUeMn8Jqrf
	83t8bcwfGSAcwU6h8CLw4=; b=DfMzcn60Mz8fHAz2tGfx9jhsvVNy2oJ5GAczvS
	uoORFzNEjoR8h5EYmZ+U7XeSewKXMLkGRyrYZAq41E7w4tRQf/Xjuz8/+M8s98c1
	Wewct8hCBjmT5o0zYOkF5x9Ask5f/mjy8FZnbg9sa992Oh6PnLUZXHydww87AQfG
	bZW5l/es2CV7rB8+OCguMESqnCDCgKk1voEYuv58DRFwwKEC/w+utqh+GO5kakmZ
	xfVet1hTij3+jCb9M/lqfxE5a/EelBJYhGbDDx2G3PFI6rBzwFJudW3A8dBvKqpk
	JM/6y3dGcegbEsd5UWhr9ivP5b+QcLdlkUiF3j/d2P5ovOqg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchaa9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:04:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d02df2bf09so42336365ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788242673; x=1788847473; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kp/nji48OQnOcUeMn8Jqrf83t8bcwfGSAcwU6h8CLw4=;
        b=eCe0MdKxQMD9pEzDKdpHi/oJlBZbsFuR93KhTl0lK8Quy7Me6JY2KXTu9GLxv38SG3
         xDQJJLi7SzctT8iauxJlFxkkAYs693cMWRAzBNWpJ27uC2Q+zztXfQhF5icNKk60DkOX
         4EfwVOaUpfwPG/JlO+fdaQDKLYsem6bbTfrirql0cR9hD10ME3fPOxPVJrbxHr2AwPl6
         2QTJ0GFC5A5uzFN4bQcqHkQv6pEDcoKZk2FKzaLfZ3busbcwSGt/jFkjp2GVF0p0A6oL
         j+ogwafAH+oTQw7NoAOn4kamEBLWD1ZIyLXH0fZt2EQmr1SVs/tA1sLDjmhvK88ELPWJ
         I4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788242673; x=1788847473;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kp/nji48OQnOcUeMn8Jqrf83t8bcwfGSAcwU6h8CLw4=;
        b=Nop+stht4G7qaZ1FE8++NbXKTi0cZPlkU3pGMAnIs6n6pg8XkOmq8rcca7ii/l+fsC
         5s7gseGMYSDbo8Q6DueE6M5lFmj3LxybHSqsJcbwfQdme0A7vze0nQoxNz/9UMnyoES1
         fePoC31Tdy1VPJH0/7KCyz45R3INLS/BLFiWBU4UO19PSzttt5f700B0P2/viEFE5/1b
         kk0AhtTfU/83Xc/AKxgiwLnL+/AYJkjFW/ZnephgpraUFWVcaI4l4KdnfqmpK25sjEQH
         +HCPuOxcGcgKawHHAFbg+uoZmV95XvJeqAOdehpX7jj+Gl9KOrKTdsAxZUV1zZ51fGyy
         QF/w==
X-Forwarded-Encrypted: i=1; AHgh+Rpq8jPV6/F5B3ofdt1wK/IoQq/398Xkyj2DRR+XPk9NMY/98JJlfRXebNp3dwOYCmczFSd9kaqNxUGKFWc=@vger.kernel.org
X-Gm-Message-State: AFuF++l2p3Eycuou8A3agpyiFgpkgSkfdLM4oKZOGq05U2GDUvVSU8H6
	o3iACjeSQuarjIKcfdqhRgoJ1Kz0XYZqWvMP0gjtqjToZzwvS+cGF/Pafz/R8rRdHnMioE78PEv
	UKRkn/zst00QFjx23d9PINcMbSqwzBJMteEMUhhRNdHAr8+YLazzXLoJXycpmO3wszxo=
X-Gm-Gg: AR+sD13q+ldtFVSaIyqJVcR5rPeewd3jUz0KH96eAqsQRysWGNtk+2w851QCOJGFBhS
	pxksv4bEtwItW2HSRa1vANoFdu6j1bgJaz3q2Irr+VaTtMDXegKMv9Vc+Nq/jmzskK1IGUw/xu2
	P8uBDTv7aTYz9rO7Yz0tjyvWfWeDWU4z9wzEVHNPVof58VW5KL2/hAXKzcVHsofcm5jCO00YlmM
	KPS4oOXK9mCpnHUhgGpDof+cKMcXv80+KG0m/Pam2yc7Q1FkcTlV95ow6v3BLvKvy7A053V+cp4
	CMtfrJbWef5fDJTzawmPWEavC4WPXXGvQPjTqKS6vOOu/eSzj2d6hOwv3gFxHcycVYS2R3IPl4S
	sU+kUv1lmSMhYFgJehSn2jzDmCUjpM3ORpX4+8S1PvnxVvPR/84xGAHxr1Zc6un4zVGin6Jtmb2
	fqGc8rulGXF6iLTdk5g5Q83300iqn2cA==
X-Received: by 2002:a17:902:ce91:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2d94a8e0e50mr65327435ad.13.1788242673136;
        Mon, 31 Aug 2026 23:04:33 -0700 (PDT)
X-Received: by 2002:a17:902:ce91:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2d94a8e0e50mr65326855ad.13.1788242672692;
        Mon, 31 Aug 2026 23:04:32 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa20e2fsm35855800eec.28.2026.08.31.23.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:04:32 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 0/5] Add support for USB phys in IPQ9650
Date: Tue, 01 Sep 2026 11:34:18 +0530
Message-Id: <20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOJqlmoC/y2OQQ6DMAwEv4J8blAwkFJO/UfFIYBbIhUCSUAgx
 N8bQi+WxvLOegdLRpGFMtrB0KKs0oMHvEXQdHL4EFOtZ0COghfI2dhtTIiM2pwajg8Efzkaeqs
 1WF7VxYam2cvctYRaWmKN7nvlymig1bFLmCZwBjplnTZb+GJJQuJfmIXCJWGcYX5vRSFTTHj91
 NbG0yy/pzP2A6rjOH4QiWfBzgAAAA==
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: jxxzakaPhRHoc8_w7XWbjxpNyKri8hTG
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a966af2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QVgSJ0PFQKcnxtkCEG0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: jxxzakaPhRHoc8_w7XWbjxpNyKri8hTG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA1MiBTYWx0ZWRfX/5woqwko7Vki
 96P0fTC6nqBj2rscYvZq8j2nIu3p+zQnqY3PwV8G/OnagLFVQS+h84Xd10+KJq3AfoOjXXZ8P1v
 vI+FeldR0SeY5JsEVhaKgFe4hSq+tKs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA1MiBTYWx0ZWRfXwONWUjNBAXiP
 4NHIGKpNlioECTUEcrfm0Jt80QgodYnOU8W0GpfDKazjePJSkHSbAnysU6YDLnIhtjjzx0MtJo4
 MIu8kQmPJ/UCBBwtiDP9JYxDrxsEhB3PqI1h1gqpHEvKVp1ktdOYevFgA02NnqNPFvaqCCplOr1
 TF/0Kij++fBJ4xRk04a3NiesqpoI8un0l1MvzcLJ3T1iJ9R38YhYPEPCsaxc6iWkJvRAAt8MMjm
 Z8FfX7R6ZVnMmHbwxZ2lREd44Kr69y0rEL6G94bV0aEQmPWrfbaOlHhz0iI1fGBH8gthMZpdwIc
 Z7BQ4XxdJuVIO21/2kaRBiqSuFerFPgu3RHtjnscYh6oyu6IPtvPQELutOhfayRbNzezExBgV1Y
 KiBWCIPrIlUktiXCzCAssSXCBeUdOwwcrOkTINnizPJgSG9rt4Uhfgjj0sd9bHUqiIz3JhAzWD1
 3jR44V+wZnNxkJFKj2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010052

This series
 - Adds dt-bindings and driver changes for the high speed and super speed
   phys in IPQ9650.
 - IPQ9650 specific init tables to QMP super speed phy driver.
 - The Femto high speed phy driver is refactored to accomodate differences
   in the init sequences between SoCs first and then support for IPQ9650 is
   included.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
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
base-commit: c7507e07687010738e5f16926078f78ac0d6509d
change-id: 20260820-phy-664ed5ec0292

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

