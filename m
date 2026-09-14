Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650D743E07D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382724; cv=none; b=fnHHz3k4XB2rEkZ5xFdb9dROGrISCQNcbSgSWprIOv6Np52DI3E7nUqIFijx7CnAWgM6cxzb/D1H2/EjRNl/WfYk5DmBr3VoJxV7ggV1V4/qLBtvhCVEzMvJc+E8XlBX77XqoPVp8IKcHulc9I1n2fusJo4WUtwOgs4yjFnFif0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382724; c=relaxed/simple;
	bh=E0xPp8WGq/6zxWJIIsZb9X9a831XpeM8ZX+0nCt0yEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rj+8FQlXcS1AGszptw7GWq0T5fKt2p3ASok3wcrmwLe2Jdqkkx/HsFBRk3GDYdF561yiTFdl+hti6wYLpp0rtTnt7su0F1GftjI6Zp7ZxHfOi0F7DXcRQweS2JN8+3IgEEYxkBSmC49Qe9yMxMDBQVesdu+MZQRjuL6ef4qptNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GvTH6iqV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikBVh0OZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GvTH6iqV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ikBVh0OZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nQZ7773129
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qPh1SMiOMKo0W/ilqiPBH+vJik16ZZ29h2F4mujk8Qs=; b=GvTH6iqVFfzybYg0
	YA8ocY1Jcy5XFn9qUYyKCPlQmesEbfnZGuTYw9EKDy/rYvFC6+ItGyi+t1PxCsB0
	mxXJdoyDFHUGUaBKSR9zgGaDGU51uahF8H1hUWM8zE5ZMmR5Vikd7sV9/CCGDWOu
	bhHOpdn+Z5+y9kBvamU+aXdoxoryLqzGp2OS8MpNPLWAWsJJ13R5mI5HREdQ1W7w
	gnO+NHBNobGNqRQMiF1k/8FxU6qRPF3MJpMicxwkUVj5/HJ55zvSeKDTE6ZTYHMS
	pz6UDf1PEQBb3GbvTpV9L9UqMWBOX3kaNJ5C26cVYgrHEW6Dy6H5g7ScpD+mjUJc
	JZaomA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevrejb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9393ac4961fso346371285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789382716; x=1789987516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPh1SMiOMKo0W/ilqiPBH+vJik16ZZ29h2F4mujk8Qs=;
        b=ikBVh0OZ1GaIbURr36yznp1TmJ50mcJZnYblLGjMT7uIeBcK82DGqI2ASzLnI5xOEp
         ZnI2sljEWVEO8zC6V7MhIx/3gqWslZ12FBOIAsPu59Eyz57KaWt54tPMgSXFnzgoR4rF
         bU7lJ8u4WZLFTeyVXcw1DQwekEcqV4SXwHghfJ8tjLJZQ17mV4CG3VFeKxmAtAvsvlt3
         7MzHVkd+0XDqTOmh8o38PEUR/j1JGLGbVhjT8LQCRtQjaR9sSvpQXCQkqF7kn7Ny/JE0
         PsLQAvR0q1Zc+39fPmWi8mS+FvwiFAVHTvtB19LnFxKjKKKsPgZi8ykF1KNVfpmdnyum
         1ReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382716; x=1789987516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPh1SMiOMKo0W/ilqiPBH+vJik16ZZ29h2F4mujk8Qs=;
        b=PToFhXfA+Uc8VH5WhtrXsH4HDDIlV1MPxcDf1k/y3N9nWv93jY30HXM4Z6Ad2TRgma
         57DyB1AUHkPw5ZytrQKiiRInCMmE/m7rwZtrh61dfLBPF/+aIaZDhDwjvzde5YrZhICZ
         gxaRsavFrCBRDxgW8McOH8c6uJecPanoaglSoRP9l4LrirjDBT7H5XJj/pqxUrtW8J6K
         ySN+5N9yJOftz4N9qy1PUVlC8f5qUAkVQFfkDDXj0nJlKqMEeKVPsGG00UOaU0y5DiVz
         lDV4bfJaoHdGsgxOoLld2VsVlCYATutZqPyF626BKgaSRW1DQVAngSN8QYLvkqycembm
         l/HA==
X-Forwarded-Encrypted: i=1; AKwUvBxWP7kjz3j+74w6dBo88rFmwnaHhKC4ZeZjmsGhz8or44PnXj6DlKwxJqrmk96BPBUqC1oZ7CRCYK0SEcc=@vger.kernel.org
X-Gm-Message-State: AFuF++kWJ9olRM+0k4Hs8reejLhUYgcemqkA1KxyNgTaKcArtOkcKHEL
	UtZB8rEUuR6KbUpmKOC0Q8UfLBA42cYH1Enco/0EwHvg+E2qEcmL9z5efRs2ILSXLElJ/W9O9LD
	fzWQlv2T4y8ZwYQ8BeQqCWNkmn+ijGcGHexyCbPxYjpW2chHGkY1cYrOPUNnAxYP73UTHEbgRaH
	0=
X-Gm-Gg: AYBFou28Zltz9MTs3NehkM9wydPbwTyF7nlJtZNtxUEaAaEE759EbUlsDQi+n6GT3ih
	TvJ33NJNZs7FgKVRpxABKJ2zwDwbgLpo3zY5vVkeeo6ILvpssTGOHFzhHM8IY2Y/C8yrpiPd0uI
	FOojpXTAy8vq8jX+1QEVMcJbQHJeCCAZLYYrZzigsvDMduXFgnRDhTm3oIahTnOqz6M1bOX/BnF
	Zs9JIfncoAjZYJUkSmb3Uqj9tPsLEqGaX+vEoxDlcJKw0KGp16+ksfKnI6LoZwkuJKBJEOcLVrO
	4W5kI/gtmSNJKX/TtxkPYYKxHZfMcquwOAMaKB0KFIBmBJmHvSLAG2x0hsO3482Z9Y5xw40oVjB
	6cj3hn67U
X-Received: by 2002:a05:620a:4885:b0:939:b8d6:9b1c with SMTP id af79cd13be357-93a2985c04dmr252624085a.19.1789382715620;
        Mon, 14 Sep 2026 03:45:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4885:b0:939:b8d6:9b1c with SMTP id af79cd13be357-93a2985c04dmr252619985a.19.1789382715062;
        Mon, 14 Sep 2026 03:45:15 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm26335926f8f.15.2026.09.14.03.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:45:14 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:44:52 +0300
Subject: [PATCH 5/5] arm64: dts: qcom: eliza: Add CQS EVK UFS variant
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-dts-qcom-eliza-add-ufs-variant-v1-5-78b3249eae61@oss.qualcomm.com>
References: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
In-Reply-To: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=E0xPp8WGq/6zxWJIIsZb9X9a831XpeM8ZX+0nCt0yEY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp9AusjYM18x9IpNGdVAu7SKvvsa4gREWp9NZM
 9oypAYT4eKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfQLgAKCRAbX0TJAJUV
 VvYkD/9MJkph+VqvIwodkfb1IF1XmN3G2OXlE4S4jjJyIkup79J7wolt18llPtQgRmtSBAeZFUM
 c3o6wwiMLCOCHARzdW8W/r5HQNvy2fmPfiPwxn31dgxe9PcN2h6ToYBpCHjYAhmg/XfQCXKBmI1
 1clMuU0zekPx1NRFmj4ksyJs4RiCI4VvWGqI9T7F0kGfcvyqVXtbC4Mo9vRm3ERkD76iKb/oaDd
 jp1EK2HLkj2d4FKNRopKo+Srd+9ISoZ98yfzNLqJj2zZuz0kX3UIBK6JSwlig/mQWObEMFaiY3x
 9TyaxRe+8E7Z4RmHMktg2Q0FDPgsJUN7wVGe3bXATSHFvfSqOWA/REzPAguXRJmfBChNSrj53cJ
 POvsKuCQRWnMjaeuGwD80ulfF4vKOmnHGtTuniNAKUadi4caCDb4+IF5yYHep7NKZ2S28kTQzlA
 4iSp4WiyESzt/BFsYICbmHHIeFmQNulIquSQ5clYs7GOB9kvKe7ReUNg7YBR+rPTqZrFKiNOiqW
 KZeyq/MWi64Ho0hzjyQZk5zkuuMbsD8v3JHojNPpa58zQMdCpPNQl55r/UWL3JG6IvCd9OMUSma
 zGagBfJoC1IOBb65AP6mAtbL4VvK7Jr0hJ462XrxmlE6O8qRVGJxWWYK/6pC7yD8xs+lReJ7ftY
 PTT6xqJ/qWJ9jLQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 5Df1ucJX9gg59Oqze5sQGhAd3P0fLhQT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX2LwLtnY42ALn
 w1CvTgurFasgYJayHkgjw+p5wB5Vq2nSc19o2CU0oHvkJIj9Y+CTNngjDGe9ZjC7ZveG7zE6n6m
 P2kyKEtgqBR5WeTrQSnOvUDQItfRNt8=
X-Proofpoint-GUID: 5Df1ucJX9gg59Oqze5sQGhAd3P0fLhQT
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7d03c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=XdqwL9Qi1ApNGgobcvAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX3ULa60/2g6ZE
 G7XWXjgbeXL9/ZNZQObUOkLFVqr9tOsMww/MUrPllpXp/szU9MpI64di14mz/9RtNXTM8/m30X+
 xcSUtzo1XMzkNZbdwHfteMr36yRmovkR3Y6u3ptrIyXl/DZmTzOn0sty2AyZ6bpeE/NU/LHB+8q
 S6T06dDI58KlBF+uTZxkIf9thxIXFWrASjqR3C5sFAiPiwli7XAeBgP9Na+urx7vz0RMHO0q6Pc
 kj35evVy77hX7B3Ed8t47Yz0ou9E4Oud93RJvuBZY7Uhez63cvtsYWd6EubhyUo7LpOkcXY7fKE
 zqU5ivAVEg6k8VwBXoz0079Ipoi6U2U1NIlr4/5X0LyZi738Cg7f9+Bm68c1hfSObXuT5pp2Q1A
 C4kXD4XIe1GoqKhFkNPC3Wq385bxhv3UzmPi2+CJhUm/m4qbMDrEgasQxUYDNvxWPogAeLYm28I
 atavr2eGkc06O6JCsEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140154

Add new board dts for the Eliza CQS EVK that uses the UFS SoM.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile              |  1 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index ccaca98ad4c8..f44d7ec94216 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-ufs.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts
new file mode 100644
index 000000000000..f5bdb2526429
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "eliza-cqs-som-ufs.dtsi"
+#include "eliza-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
+	compatible = "qcom,eliza-cqs-evk-ufs",
+		     "qcom,eliza-cqs-evk",
+		     "qcom,eliza-cqs-som-ufs",
+		     "qcom,eliza-cqs-som",
+		     "qcom,eliza";
+};

-- 
2.54.0

