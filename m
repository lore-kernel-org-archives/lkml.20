Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217D240F75B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405679; cv=none; b=jTZgowhU3q2Wn/pc5k3u3KV81RpVtbC+wnZrMLZeWjvBQJiszzsAUP//+kC9hPoTzLkGCilLgu45Fs1S59anDlYCXoMrsdwhxXZMjEfisV0+G13M1TOb+m/bUR6kXnYsbEsikzW52RflY4fAUizo5O/1E7udjrrNPAb/dKXf+AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405679; c=relaxed/simple;
	bh=pztw+wbmd8BAbSF+vV7kN1W1rEZLakCRs75ARmv5RVQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QtknhAA3pnM9VqkMxrHnz1m+qohZPjSr+Ovw53YC1cGH6YaI7OkCm1D5YcxW90I7bDQZCd5LEdfK9gk5BrK7+B4BedQK46sA2LVyQSWnLVJm47rIvH//Cy1fPTPh92/k5feqSnu84EElSPPp0bVqNt3Dce6zG+sEPi3Wp9ImiuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ig0SEfDa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HarA94s6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ig0SEfDa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HarA94s6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OtOT2752271
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u5N2c5B+B4pIb+IOGWjZBR
	afdvBFwqjooyQXJ0RsHFY=; b=Ig0SEfDacqXEV7sb4JTZOPyQ+x8LWyU7umNexJ
	5p4Wem+br+5V/8xZCIV6+7bOzHDeMU8wqYYNP3NsQCwg9B+cmxPyV/qo9+0O/W6W
	gxnVBS1yueelQ55WZi74fKelFZcuPTB7SOj3e32HhqBd8QX2mHqWedYtF20Ze7sJ
	VzDJRsayQLE5mFNfVBZIBniEYWmsA+Y+XLN66B/+um4JFP/1hkw7ZKOPDEdYAaiN
	Om3j/vpd0Bcuel/Ur6mzsu8IYazcIcl3H+IDbfo307MKRnK2T3tXSPKRKUBu5J3f
	v9BPxrG3g4q0GeSHhe2qjE95dQq/6Z85SMTAQm9tHcSLHFiA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48gkv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:27:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e617b5e9b3so11576115ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405675; x=1793010475; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u5N2c5B+B4pIb+IOGWjZBRafdvBFwqjooyQXJ0RsHFY=;
        b=HarA94s65qOlVpmCGmL6XBKkr4IVpkcPiMvXz3+hezIEnIDi/BfVKI3e+WKc64gXmf
         Kbl4do4zrRArtYsBvkR/3m7rdT0UrvKxY0DciuYHxneAmku00UZK3FttgrOLG+hyPWD7
         UESlcUTUpu29nszXdaAvjX5GmLEInwLIsIICdPXdxVDOLZmQY6nUS4Fx6AmPXEi/BmYp
         gY4KBKelP+/8hSXgUctv32oxXusSZa/pLnYDiHY77q7naMgW5k0G8yQmcUxO9oAFWeQC
         kNo7L8r0kiV+dN/92bRFZ8Opl0D1pJ3yPdyROyzXQ/YpdwmVSB7PxTKVeaDkM1lNu+aO
         BOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405675; x=1793010475;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u5N2c5B+B4pIb+IOGWjZBRafdvBFwqjooyQXJ0RsHFY=;
        b=VCprOLSRZUU2bprKeXn/f7KUE4MKkRrVlTMXbCe6fighO5lgjGaUrLnWPPJwXCKjt0
         2MCCttqU4GmDmnTNuJb6OgQDCfqqMJB9mKhHkCzNie7hFWmHpqnPGenlg3axLaDJdLU/
         CJpAius3d+GgL5Ry3bKf/1yG6BwQJH+3Yu5mtCoaL766cyH0w3yY4Km3IJpBpTB5Bhqb
         y0I8yZuC1IoKxtfsRKbdm0I+J9dzLunR9ACgI68yb4wI5knVIVKcnz8fPu21czqLRu0V
         PTBlmA5+5SdAV5QPwKht1uHokwZlKiHDj8ZDucH3pskuVNmE1OmbZXwge2X6wmdkRW4j
         3cLg==
X-Forwarded-Encrypted: i=1; AKwUvBzbqjFGizro4S9L+nRDfnc8y7V4sDLSH+KW+yzNa3pTtAWihPsEE30fCL+9bbIypM8CVr+S4dIYkyKuGAs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRb2MU2VopEoZZkE+7p1SIVf0kCXxQbtTQYjOalZLgST7Mwk+c
	+vYA4Ko4e2taRR9CPIJpCLU2oDLPfizTUSAa9bNDxubwU+WqlqjCU8jitDuUNc9QP+64S7LSnmU
	ZLgk4bhRakWipINuXjhv/ItOZhxZhuqbqLmd/X762Vz0Ynlm7NsH25YPsaDWY67OvKQIrtOg132
	E=
X-Gm-Gg: AYBFou0ecT1UhpG0ONm95jGbFQuAnLNpVqNdznUcVlfNFmNn3q8yNJjk1q8M8fmAtBw
	/Aml1fycynAGqYVxMAjWtYYGwtK1osZLk2cu4iQV6rRyOLASodf/SZjjJiYqpnIjxNbEEnS9+Sj
	tLssREwLVeRy/MyPdhdrQP1nyGcv8+StrFuwgDaVS7G6ITr5nMNZdve1Wj8S4csiIAL+YNyfxaK
	GbAJje4FbOKl6xXHHE3HTS0v+eN7cz4ve+IqPsE4E/KlLfuy7SvskAfIkthiFG+9i5agPTgZenM
	BLh8N9zvqr60CzkiYO9m4CLR3QXAf1VBMS1RwJL1dyBXuhLDwEkf2ON9x757AtN1MLeO2Nk/EZF
	tjTq8UYSzZEiazYvHWpvf7glzk03xcrPkFnDrAw==
X-Received: by 2002:a17:902:eccd:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2e9a6c1b983mr54103545ad.16.1792405675247;
        Mon, 19 Oct 2026 03:27:55 -0700 (PDT)
X-Received: by 2002:a17:902:eccd:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2e9a6c1b983mr54103405ad.16.1792405674775;
        Mon, 19 Oct 2026 03:27:54 -0700 (PDT)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5d7ef1sm36359785ad.3.2026.10.19.03.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:27:54 -0700 (PDT)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Subject: [PATCH 0/3] Add support for LeMans Draco EVK board
Date: Mon, 19 Oct 2026 15:57:31 +0530
Message-Id: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJTw1WoC/42OwQ6CMBBEf8X07BJaCKIn/8Nw2JZFaqDVrhCN4
 d9tJR68ednk7c7OzEswBUssDpuXCDRbtt5FkNuNMD26M4FtIwuVq0rmsoCBRnQMbUDjobMOB1i
 FDDpYd56uIPVO76qu1ooKEY2ugTr7+IScmpV50hcy9+ScFBqZ4js606fVT0a6JU1v+e7D89N0l
 snrW6r6p9QsIYd9XRaqxK6tC3X0zNltwsH4ccziEM2yLG9nbzxoEQEAAA==
X-Change-ID: 20261013-lemans-draco-final-changes-bringup-1b7b76f8b2e3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Kishor Buchi <kbuchi@qti.qualcomm.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792405669; l=2043;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=pztw+wbmd8BAbSF+vV7kN1W1rEZLakCRs75ARmv5RVQ=;
 b=FjESd+AfN+LE5R6X/DUI3Zz009jZyXb36hRotVAgGNcfPTleQ3d1c5J6R6eDitD3690CoH4b7
 SSGeKxEeWozDDTask1CxtvbRT6+O+5mQINIUPhThdL/K3VetfCaJj1k
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX1HnG3xiRWWbL
 OLK3LVppPMcmH5S0N4v2j4sy6paN4opxbmVzYi/D8fCyEaU88u+hCa/aRGNAY8YZbSqPj3HW23W
 3oBkqz8TGBM/br8/BT4PeqVSJn1M1/QPsCVVTzMuDem3p1JjVvrTjtGszgFuvcifjg2BjRd8zQd
 Oswf7k6lJ4LawQ1yb178H7tZrmVo0Zbvmu8cNHYx2YeUtCcOczlQBNFw6D18Q6Fwdyugd9hNi0Z
 +HVO47VSu7rXHH5+ZwadCIRyDT4oa0nw2vA1Z5/lw+PFeTy3DOTMPebkt0q1nczpgJKbcxzvCwS
 K2axMpBKDsyriJOalBLvaS8Ncow3XHisiAPePpQihrL8QhhIOsezqy78Bg8vThqkB4hSJp9+yxF
 Iti+6xNmAeUUA4mVErW34lKkwDyaNqM0U8CPUnwKLQZdGtFaIvzGwuj+REDB+j5uMQEAQ7aHqm/
 9+2N1bVtuV7DJwFWZZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfXw84TkcRU7OXR
 of8WTnf9aFXQ55aZEvR0XI62xfh0w5LZYStcIbv1yzAqksZtKMsor9sKXIVVKktGny6Qn3z2lzB
 T5iN3QhSI7+gIgr5RJ800H3vTdFfXUs=
X-Proofpoint-ORIG-GUID: 7nFXMWY-4VvSZF7bAjJy0ZmQTQIUUfBN
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad5f0ac cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=FK4VXM-tmRh7d4tgyhoA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 7nFXMWY-4VvSZF7bAjJy0ZmQTQIUUfBN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190041

This series adds device tree support for the LeMans Draco EVK,
an SA8775P/QCS9100-based evaluation kit consisting of a System on
Module (SoM) paired with the Draco carrier board.

The LeMans Draco SoM is a compact compute module integrating the
SA8775P/QCS9100 SoC, three PMM8654AU PMICs, UFS storage, USB 0/1/2,
GPU (Adreno 663), and essential connectivity for automotive and
industrial use cases. It is designed to be paired with carrier boards
to support different application scenarios.

The Draco carrier board provides board-specific peripherals:
- Native DisplayPort output (DP0-DP3)
- I2C GPIO expanders (TCA6416/PCA9534) and EEPROM-based MAC address
  storage on i2c18
- Dual Ethernet (ethernet0/ethernet1) with HSGMII PHY over SerDes
- ST33HTPM TPM over SPI16
- AMC6821 fan controller on i2c4

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>

---
Gopikishan Thawre (3):
      dt-bindings: arm: qcom: Add LeMans Draco EVK board
      arm64: dts: qcom: lemans: Add Draco EVK SoM platform
      arm64: dts: qcom: lemans: Add Draco EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   5 +
 arch/arm64/boot/dts/qcom/lemans-draco-evk-som.dtsi | 401 +++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts      | 543 +++++++++++++++++++++
 4 files changed, 950 insertions(+)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20261013-lemans-draco-final-changes-bringup-1b7b76f8b2e3

Best regards,
--  
Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>

