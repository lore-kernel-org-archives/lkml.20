Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590694;
	b=UTfxEHhgwmgPC9s062RM+FX3Cv8q5e4ZC6GcN/MeHoSF+4sRpNBz/xGvM1MXfsJG1+X7
	 JV+9SHco6vwd+OZYp1byJqxzA+Hk0PYCseHlPD9aSLRvvdxEAN7kSEZS4Vqv/XCiMpSk6
	 Yw8jMArhJsYqb+ThfrZ1GdCckLZAUEajAZJY1C7InntU5eYaeI2TXbv9tqX35Yei0NkTY
	 TtLf7r3m8eqtZ57VG0UQqpgroyeB1vqNxCxIIsuMtaI3/Jq+Yk1sj2fCwHXq3z/17lUsn
	 1fBLI25/rxXzpdyOE9AIX/MSh8Q+B36AL5RNqU1U4ItYOpx4dizuv0Hq8C+SGMUo00w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6ic9YLfgNTNC8LbkgAOfvr1E7rxhwKyo7fVG4O6cpK8=;
	b=s2kX/Vo7zqA2lPKalOluBqPQUVEQWrakPMjT+7GTuXnGlQYgJq8aDlW1iBnQs70AWvRI
	 W91sOpYqUMiVB2qBuGCY8cjmu/4e6a00eLc6wMPkKSjLrn9YU6OI8t02X5nrOOZ99HgVU
	 qEqWvFQsA1U+v2Qcy5oV2GOkus+29wYfNx2LmrlLoUoIkarSqb/VAGJXKKUj6L7Rhe5Lf
	 7qdDQnzUjJYfm9um3PnRRVvKnH6EilUqx40R+AZ3ZXZ5s1hWgq+prN6ffZ2OG5PbEyK5m
	 ShtUW6qsbKB1hA+fXl5I/TWvTVpjZAP5HRvOSTHy2ckbbi/HF6G0t81xD0uH6FieoGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xkws2U00;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UNEfIIJs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA46A606A327
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA46A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xkws2U00;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UNEfIIJs
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgDNu1568463
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6ic9YLfgNTNC8LbkgAOfvr
	1E7rxhwKyo7fVG4O6cpK8=; b=Xkws2U00vMsA1S3OJf+Kw6noOrg8AI/CvYPANc
	Sg666KXvUcVP+7qkx5tMz1s7O5nH052OysjUeUuAZJaa2bC+aSOEnTEvn12XVcXB
	HBw3mrJQLkStrg9YO4fjzdphRMJ+ZmJ7+XzOTeU4sb1I/yHZ1Oj76rE6gnXj5D5u
	P5FsgZTvzzDXBHu3mmah2LBznuvNXLGPGiWfA64eY9NiP+LzBpLEj2R2v4qErKgm
	R18rFPtJLX95IPycmcNBo5UFDutfxwBTn8GnLNlwH6elY5Ys9HExEpl3m9Dk6Z9P
	t4FRo/q3uzReAdm85y9F5MqH+MPdosxVOkbCvelxBDoNxmgw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4v7a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:51:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a04491c56so818715eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792590692; x=1793195492; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6ic9YLfgNTNC8LbkgAOfvr1E7rxhwKyo7fVG4O6cpK8=;
        b=UNEfIIJs4Ycd3woFQgfVGa04dQ1czRhid+p7gU531tuGOXSSe9JJ+72UaqU1ncr1YS
         J/CN3CCTvRHsN6VFhFrNDzM74VXnTjNyTiKYekuD06TKqMSfEzlec7kXwEFofpp80FCW
         rPK5ybdPVIaR9xJEwTFCFc1YdyBbDnm4YBRmBCDzagT6+vYGHcCGwpHMTefaHAmf0R7p
         8JYYfmEHkNAwD2OZChpoWylEQlnN4EHPqsp5zeP3mnkxvPnciR/r1jRkXDP3GGp5ljao
         1oxyO3r/a4R9nyZ6TanC7BzTvxfhG1DmTX8HjXKudDv6/YA/c6QjNpyjNO6dRF1N2r3J
         HWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590692; x=1793195492;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6ic9YLfgNTNC8LbkgAOfvr1E7rxhwKyo7fVG4O6cpK8=;
        b=OJhWdf4LZtFZwFqn5tJ9Ip7mJBXqJEQzVie8FHJJuPkYuQ3rxw5rKQL1/HFaht0FA1
         v6MAgtk74i6nC6m4VAXfiiZrnhSNDBr0+d4kvMSMfmcdmu/aTzyvHJLmgS12srmWIziN
         rdLjWI7DRWdgxRWLCShIZkPIGoRhCNVrxlF2lKztsudHOZ2+tK9J5wWkW0KWsnSicwwG
         q2kVIrSxhsTEfTuyR8CGILrJ/b0IAtrz8lHtPmmgJio60miZbVz6YpCzaSN5Xkj7qhnm
         EEHPfgt1aojevkuUyMtT3INUHt7+WhVv8nw+LGTZ1lOIiATw/ZTDbjo5ljINVTmAxVEY
         8CFw==
X-Forwarded-Encrypted: i=1; AKwUvByiyWk3pDR6NIxxlWpQVYxJwTmQN8Cq8MRSibC4VEyvZ0EOVI1D2/7nrIBJjs5k92zuGcccq/lwY2BeMDE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKD4pPRpPvBD/VGluNBUctlUjWbBunfqDcZzB/o/5nkm0jZi97r
	dBnyVhP0a+dqNzxrstniIj6Z7T2fZ4jv8kBxwFHv+HuKOFmsm1qFvZ27sec5EiPpvcr1z1S5AV1
	5LHl30dapAf2dqVYB6rwBmnHFs1+bXgLZOoQMH27a99XLdjErfUaUxMXNzErk7t0siO8NSn0mM4
	A=
X-Gm-Gg: AYBFou10uIC5HQK9YTn0VYDJAoU016prHTQ5HGymyvpBbOC47pJ1kp71ypjYwQveujT
	6N+SJaYpMaeO1Dqdlx/x1Nf7Qbb0VRhukFMoBBSMU3Q446Ydhv7d25qsd/x9h9HQPjEIgvWSl0t
	szw9iR+VONbG+WdfdKOzZ/8zYaEfKVSHIIdyxCtWDtg3kpEbmDxdz/5rnAQHNvPe0sAnOkG3D61
	KQHmOthpBOqDlyMnVWKRGPq0Nz0gbyrkJ17yYc/IAms52ARof6OVMoqlf/53S87pho9kUSS+gM5
	jY2IpKCfx6adYNEv4ocpP4Mo9G73X+20Z21kRfN78BafUC40WZv329AQuIRx47aZmZT/6Vo/1kN
	AoQm+yeqpl5dOLgymwgbKp0pZnevlgDUkTw==
X-Received: by 2002:a05:693c:864e:10b0:361:8d0:6c7a with SMTP id 5a478bee46e88-365fbf86502mr7227549eec.26.1792590692181;
        Wed, 21 Oct 2026 06:51:32 -0700 (PDT)
X-Received: by 2002:a05:693c:864e:10b0:361:8d0:6c7a with SMTP id 5a478bee46e88-365fbf86502mr7227503eec.26.1792590691495;
        Wed, 21 Oct 2026 06:51:31 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc848fsm7534332eec.13.2026.10.21.06.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:51:30 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 0/3] power: sequencing: pcie-m2: Add PCIe M.2 Key B
 connector support
Date: Wed, 21 Oct 2026 19:21:21 +0530
Message-Id: <20261021-pcie6_fix-v1-0-ad37134c35a3@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFnD2GoC/yXMQQqAIBCF4avErBPSwqSrRETaWNPCQisC6e5ZL
 b/H448Q0BMGaLIIHk8KtLoEnmdg5sFNyGhMBlEIyQvB2WYIZW/pYsZKaSutdKlqSP/NY5q/Vtv
 9Dode0OxvAO77Aa7YGxJtAAAA
X-Change-ID: 20261021-pcie6_fix-cf66f4b8b387
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792590686; l=1492;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=D/UvRdvBDBS/Rq/ST/CUi0Wd5LwynsMiqdDmEgI5bRI=;
 b=GA0GHTLmE/SalAfNw5rnP12qL+JshQsAM+buh9CGhLL9xvLCTlyCtqkJr/0RW7F1Si1RVcTQ0
 hf/aDeNqM2qA4j+XzATTEYLZePe/7mYoVq2kN6qI9GE4Y3mgCNdcKLS
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: SDugZu8pfcbyE4vH8wvGgr9zSnwetWqK
X-Proofpoint-GUID: SDugZu8pfcbyE4vH8wvGgr9zSnwetWqK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX3pM29x2B5Sox
 MDBPTc33Iwiu0H3QMsTyVoKcRRmS9/JSO1xitjipcPa9r5sb+wtMKyqlM4ZcF682TBjin0ImKRR
 isiV8QiLnwBi37czHq13Yn6D40O98zo=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad8c364 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KRKipztoQesxEaMeAmMA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX5GM+yROgsrP5
 prO5j95eZuNlXE2nRe/SnHb8FsnM06lEcAg98NOxcRiyoA8r2OiFWuAUsxx/xEYtvAD1rkWPbLV
 BygcRkjiDdqR9v3wvHJypgIGcmIF/k5CEg23VNPLceQaRdi6yrg0GaujiENCLV5IwE7tcIPDZHU
 I2WylUjBQ+TBaYGrO8bdomA+xIAnjDi3V7QD527wo+2SAiJ2A4ciUTHuzHs3sxa2I3WeaGfYWtp
 1iTVnbzdL25C1LVjPbeAQuPl6lp5x1SO6lb+laTWjGCAzbJiUCmRAYMyCUOoNbkRBvDcwOpL5GS
 TX8VYVrwpceJLTT/ofWnPcu4tnwCstqkhB7Kx6/lBSIZQswlis4EVwXz0hw6JQyB4GJ8lnWX2m3
 Cu2U88iafjm4FkxW2ahDtUd57kcVPxnsvAtOTlWL8lUxPz029tH2ajdpr28hoIBIB7nxvNxGlVI
 cpast9vx2XrUtfFDp8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210055

Add support for PCIe M.2 Mechanical Key B connectors, commonly used for
WWAN adapters.

The series introduces a DT binding for the M.2 Key B connector and
extends the PCIe M.2 power sequencing driver to handle the 3.3V/VBAT
supply and the FULL_CARD_POWER_OFF#, RESET#, and W_DISABLE1#/2# signals.

Finally, describe the WWAN M.2 Key B connector on the Glymur CRD and
move the WWAN supply from the PCIe6 controller to the connector. This
allows the PCI pwrctrl framework to manage the slot supply according to
PCI device power-management requirements instead of having the supply
follow the PCIe controller power state.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Krishna Chaitanya Chundru (3):
      dt-bindings: connector: Add PCIe M.2 Mechanical Key B connector
      power: sequencing: pcie-m2: Add support for PCIe M.2 Key B connectors
      arm64: dts: qcom: glymur-crd: Describe the PCIe M.2 Key B connector

 .../bindings/connector/pcie-m2-b-connector.yaml    | 146 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |  29 +++-
 drivers/power/sequencing/pwrseq-pcie-m2.c          |  82 ++++++++++++
 4 files changed, 256 insertions(+), 2 deletions(-)
---
base-commit: 2c455ddca7827ad8fa3a64fdbf5a60efb928b46a
change-id: 20261021-pcie6_fix-cf66f4b8b387

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

