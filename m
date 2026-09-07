Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2956640D590
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765938; cv=none; b=ly61mKJ01EsK8ZZvrAGB7CUjAswp3yyZoIlEbKYpBTX5J3+i9gL+cb6TUqAMB9ABMj/t39JrGrFLQUXN1lqapUfMIPRu3vEcmOSXwlE7hQ/RIKLdA2hV9jhYffgK7Cj7JctHqoOMBURZhR+anaqzhbFdNQy9HRjAe3sSVdrIWEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765938; c=relaxed/simple;
	bh=qGm9/k2YvMVOKJOPynAryr6jVpNXSjaNDfIYGW/N2hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FgO3q/DcJo3vT309gAcFJ6kEcZ3UWMbwONU0cCgST+cRCbnIpPG7Kt1TZhMtJtVjqgGLjr4xpfrKzwcvrInFeKKp1tyEeVTdOd7TVHCroC8ZwD/4vSC2eCnFjxncjI55v+VtEFq1R47EUq/elkSlJOva5APKGKrnNNKmt2njqsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jqOJOpRf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ftNuUqwH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqOJOpRf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ftNuUqwH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777Vms3269624
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 07:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wfd5nezvGf9mauGvIJpUuO5lH9veKf85XIhzfR3VGn4=; b=jqOJOpRffab901ZX
	ceeEm2NN3IALe1CqZCKbI6W3UWar3JqcN4KZKV9OZNE3lqxOODnLFg0wpeR1gRjd
	dbsXcDeMvnxQ0+FOphIOKhl+mcQ6U9dncLhQ6aaFPL9m81/A8d9QCjTNWjNhfzo/
	40ZbilE5HanXaL8QLcRr9azzkQ1h189huu1sWsf7zsdu+TQ2W3P7R7aQVyVHaBXU
	Xq18dwTmmU7enxDyX1i04RA0yKTJL1NbBvalmHwXvieRIn3vceMdK3XKIo8g1caR
	0CKjAU6gu9vwQxXtRyeJh/Rq0pVMTnfiFsHorX73MZ1vxMQM7vQdBTPPfqoYo9oJ
	k69+nQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggadhnpdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:25:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so3713560a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788765902; x=1789370702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wfd5nezvGf9mauGvIJpUuO5lH9veKf85XIhzfR3VGn4=;
        b=ftNuUqwHQ6AzzcJ0U4ZWx1dR8nDFh8vPjQY4iObRqWl55hxrouSTx/nj1t7H5NTamJ
         npoGNsKEqyNTVhN5B1qjGfN4AlJSH+Eu9jJwpIu9ni8VI+0DjavhiBsKdWgB8dOEQv2D
         u3qbKoWIReaJHgbrbYF1mjNwOo7cxLPO88nq2WCw2eU7yP+Vbe8orsz6VXuGMiIJYDea
         vKJKB11xLWVrtp7bAzBIX/2VTGq85GRwF0RLZr1zZv0UidmMJwpQLRJ/9oACL6pGeBhY
         bMLY2zkKOAH7okf79MJQFZuxk321HoIO0togwJqxPDVIz0UCK69bS/XNW4Q2JgOTaaES
         lBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788765902; x=1789370702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wfd5nezvGf9mauGvIJpUuO5lH9veKf85XIhzfR3VGn4=;
        b=jOZjJEZPGFEpkbgSFBCMiJBy9opYpvs1+C/VncyAigkw4sUZpLQXt7LBdGGRbT4adk
         eythinqzJlBS2G6d43nmnZtsa6sihb8C6opN70TGhbolfy+aDeM/6llJ+FTJwtiBubW4
         8MMxvYPYmYdm1qwIF+CMplLO7+bcF2o43kOYCqpqih8dRwnJ335rSGb9EXXsH2CNFcT+
         7EXrLP6NIWyVG64h0XzVeWnAhaK85o1teXpSh+26f34K0qUhbkgniFqDZx19F3yXtXob
         JUS5k4cJTqAXzt/EfefOIkqzl6LtXMOgjy1NHCOtQLu8fsHBYzfiqR++0pUuiBFD4hme
         f1dw==
X-Forwarded-Encrypted: i=1; AKwUvBzdBSODYD/Pctk9RrUfT92X5i4Rm9y0WjMSW6avc2uOwZNgYjKX2mfmYNI1nFOCCdy7Yfuql4A0L3J8Yys=@vger.kernel.org
X-Gm-Message-State: AFuF++kGAL7SBgY0OT9NtcP2LgW0R2H+NLwXl8BsRhMQxWlWWyJfcytM
	+GW+h9InMymJYYeCb0PSYIVtENLLSPYC6mmMcOFeuu6VBXUNveDkWBIJrEP5kGgGpVf/RElimPl
	S4Vsqqu2qX8OkUBQh+JE84ONMUZGmfLp7ELEFzEnOXmVyNTsL+GZzL4Zyd/rQGYuSJhQ=
X-Gm-Gg: AYBFou3IVNSgWQaZHdR/Nq5Kx3VnhfDc2P5AGxsH6E8owQYbnk5IVV3VKCzxTlbuh3a
	81U7ODWHpk+1FKpvn3bVpkY9ikuM0iIw2si5uVcAE2SR9YCT4AtMF/Xszg42UxVcyX5z1p6wKNR
	U4o0sWpaQFxQ2BF0WJ6F8EJGU2cyq6OXPKWn7bfOeAv78yL6ohx84W5DSytK2v9Vu3fknyylqvV
	Q6i+vfMN/snPpOyrUzk6YZuFxQXMJ6hHNT9s6mnzML0Ez6myqB1kGOOrsGbfO6A2o6o4ArXrdfe
	m4GsrFLEyKu6jKT93KOe3+5mrq1ELLoVHGdOmIYV1SD0jVwCq6B2cQ4JgTR/CW554zPTJn6qVsa
	PUcCMODexeINHv/EtnK1RqmV3ZDA9HvQkbnst7thFRD5LBsh+DrTeQdbFPG80bn5Csh/hFXAJGE
	X1d1RODWlVbGxSVDTrYsRgcl3HiVQLFA==
X-Received: by 2002:a05:6a21:828c:b0:3d1:39e9:b267 with SMTP id adf61e73a8af0-3da39b721f7mr32129855637.3.1788765902501;
        Mon, 07 Sep 2026 00:25:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:828c:b0:3d1:39e9:b267 with SMTP id adf61e73a8af0-3da39b721f7mr32129802637.3.1788765902101;
        Mon, 07 Sep 2026 00:25:02 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm26161861eec.27.2026.09.07.00.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:25:01 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:54:39 +0530
Subject: [PATCH v5 3/3] arm64: dts: qcom: ipq5210: Introduce RDP504 NAND
 variant DT file
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-08-dts-v5-3-584e5ab50b40@oss.qualcomm.com>
References: <20260907-08-dts-v5-0-584e5ab50b40@oss.qualcomm.com>
In-Reply-To: <20260907-08-dts-v5-0-584e5ab50b40@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: d-8oOwxyF6BS44fRQPf8iRU1pR0Gxjd2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA3OCBTYWx0ZWRfXyEpD9CNtpDEe
 SoaLG9G0jYM2XeJJrD3Q3A7noYMcDumyts0Rg74Mjgr/PLFDVfHQyN+dsQLzSyyNnqzi4XXutyc
 o4x+Ss4Tfinxg5dVPqNMT7B0+dJvwPBY6WAltL8/nCpyqeHRRnatkp6nmnR45l1Xgs+Ho19Jmis
 fkfXEVzb7bKwQg+iVCWAdrb5W8WzeMwU2zCRDWFkJN7CzQu76zEssf19oAmB/FL3PQNYTgRYfCd
 MSGdg8S2bzFqYjThQHFXGM9PuSHoJ4hsVgSTg1P+XWOsHS/HiDYuUGKbZU1Iz/vQVoOzj4JZKp8
 fOdJGcrMXPS+OKRvIZmSX78v+8un5Wpu/o8DBzzgtpX6P2IjDYagDJHv4uEOm7ioKTquz2HWck9
 gocRytLh76XY1muTFHHhQjF90Cxts03+E3c4GtBZfWkDeyGVNez8zD/aAqd1UW9LEtjqehvleAN
 EVkCHkoOot9HC93iGPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA3OCBTYWx0ZWRfX0mEShvwT/Srh
 HWpCriPr9XHpExvAkz9fiNeJsa1w9glaKb3hpe8es850/hNTWaviJ2TXegvLRcfc87ds1I0fnJT
 Z88DMzx8DghJnOsUyo/IbogrNOQj2fk=
X-Authority-Analysis: v=2.4 cv=OceoyBTY c=1 sm=1 tr=0 ts=6a9e66ee cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=r5J3puGfL9QIZnCGJ14A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: d-8oOwxyF6BS44fRQPf8iRU1pR0Gxjd2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070078

Add DT file for the NAND variant and include it in the Makefile.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                |  2 +-
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6c2ac11133ca..89c1d41ba4a6 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -27,7 +27,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb ipq5210-rdp504-nand.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
new file mode 100644
index 000000000000..1145fcf0a302
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq5210-rdp504-common.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504 (NAND)";
+	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
+};
+
+&qpic_nand {
+	status = "okay";
+};

-- 
2.34.1

