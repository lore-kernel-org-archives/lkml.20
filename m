Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956883;
	b=I3EUrdNB2/w9XuII9HzPIc2mJOM8VOycD2ptIxOLEdX7nWL2AXu0s6eZ+9epkRdrXB30
	 LBmHz1roqLhmh6p6r9tM3XBPj+FMcrIDpxPCJhLAAEvWXDxsNY7lsUbVpuM7gDC3ZXn1Y
	 dgG0ZVJfY6MJna23rtZu4EB5pBXULzGjyvWqM9S6v5Tf7/HPCKU6fBMyR+A6lueo+ctak
	 nz4mHKwebZK9iRQFMplm5zJO+ISf1/dX2/lSCcREzcLhKYseE2NDLBJiSXXDYqdvT9lYm
	 axjkvpRTZZkJaWgdgrz1qAP/6xWciCln7M0GQV5KQ1aolm/WEdNIFTYZKPlNZsu9NjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956883;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0neYuYn6liO33W8kTLukzzDPvYtIX3nBweNL+dyUNRY=;
	b=4wLttH/ZK0nHnPFxM10UGKTPNcpVk4Pne9ES+HdR169zsbHEP8Ou7k1SLITQqZEtMz7a
	 zRZ9ninext3+6X+Vmo4If/rvRzNg+09+cZwWMdZn46mNpml+mB8AhU76ycbvoYMX6HUnr
	 e1XMxFIMzngGg9y5XYUq5RDDBfm3G0SiIFLR0pomjOJrRukLLVKvZhOvKuI/KWcOOvoHM
	 lIKN01GPIHdWHDAbmZ2R7rfKa78/s2C2BZmXWIrNdK4Cd/IZbaVbAFvuaCN/In3oJM8hT
	 uI+yS5U6E86ElAIEvof8gQ1KsbOMP4vk+QqPBonTjZeK2ySsTIWeqQ7dA26hCalHehg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SIDxxuy1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="FTui1p/1";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C700606D807
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C700606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SIDxxuy1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FTui1p/1
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R3Z9129026
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0neYuYn6liO33W8kTLukzzDPvYtIX3nBweNL+dyUNRY=; b=SIDxxuy13FZYbzji
	+YxenOAaOCb7YN6xsnaHpvksuhiEYlbP88QmtmfLZ3a9vqHWSL8NOXclYyMHIOb4
	ozd+t+qOLiF1eRS1sja9jrX8tDxYF3CV6KhoMUzE4wju2L9uLQ8uR2H6flvBGLme
	pkvAm4Gb9Q71lPbp6GeQz7CtA+kiGfOa5AkzfAKuZOsc0HVAiSMMv0SAu5AYcwfe
	qsowclgi0yUGAR0SYmGmvx/wZ91pA/kcMduthRqzYkbzHKb271wN6hgIjASFJkkk
	Ouuezl8g+VbVNWTE1VxXrYOlHLzjaRZx8CSpN0wwCYb6QXIbdng6U+gaGooi52lb
	7fWvoA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9t3e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:21:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso857966eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956882; x=1794561682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0neYuYn6liO33W8kTLukzzDPvYtIX3nBweNL+dyUNRY=;
        b=FTui1p/1ii+lPFo/xxC6Uvg3T87+ci6XXZ+bCDjBCkPdPxW2pCEVuUNky9fYNRAK35
         gT71zFHRKEp6SzHBmGsPqOCzQiTpg8hneaG9vxNZh6b4cd9io9N+W4ozJw4j4dexyE04
         mczKLcMgLOdR4pY/Ve1gujYA10HNs5Z6/hZxgonjYFbY5z0VNxcvjAcsD9avEu8ePUAx
         SLijbg/wLpUf+zLKZBDIq4+i2e5XVFFWiIsrpq9IAZS/AvgenFNdH61mrloh67ozlhhk
         iJydBKRnQ61F3cxWcw1R2qM3Z/QJiV8OmHwtxTw5Ah09uUICnAo7tQi2mmzzgQm90wTC
         Z+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956882; x=1794561682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0neYuYn6liO33W8kTLukzzDPvYtIX3nBweNL+dyUNRY=;
        b=Q7Z26umGIIdyWNeH/XZDh6Gx+pMRWqrKp65w5Lx3sKgGGFMOid+Hnloh83IeTP2Xbp
         CSUo/g809GhildJZLtxrABpsRy4rNeZ15Oz1nmfy7ilsQfBYj2wlCaqfrqunIsp+sCvc
         YPl8A9fZvAtCImGkyUnElAp+SV/dFMBwyxjjmZCweuXRqrs6Ut9K3Ahdtxkb8/byKSmk
         VRkA2rqEu2A6Z/bOoLpEoK3QJVP1RtHjP/iN8UNf0qzr0XqvhTeVjHi5/1TjSGuPPPNy
         SXFYvn3qXUCmuIXHJtAGn5AWfmUGIkDVpEs5izKHdmqmEGquXLWjjF2d5zuswJlb3Mcy
         1I4w==
X-Forwarded-Encrypted: i=1; AL+hErHHC6HHDgo1eRqbBQdkhrlrGWSIY+OVBCuX3IOcaYcWX6NJ+e8d5yl29gEyXa/ErsO0y+otVhgHeGxM1a0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8421+JJw8zi92s97KpJLHx4YU4tQDYHfs+/jhSrLKGdRU6v6vl
	OOs7d3upGml5WV1ip3YdOJqzmAnvUd1NDejhwDnhgAnVRcNVjjzKZArcdz5W6clEBKOqkYunezw
	nGqqLMn66+5s0hn89nLPzpKieMv37j9Cc045dBoZ73WNnjOcWlh2msg/w5u/1Jgf8naw=
X-Gm-Gg: AYBFou2GTMSCpMrPGdkz8FPzLVVszlNmddgKD7OxMAdnmoVqJp/dEwNoaoiyuYRZbc6
	N8JuDPgW/FvsY183xKdiCkUElPnxJCj2Vo7UOWJDOHxNNM88L6YEGdVpwLR3jN3gWP4wp4tCX9Y
	vkxu2W0Z9gqkXm3QPSkzvG3Me+WXOa9yQS8Ki7KvbCi64vXMUTO+NaAWFNyVQxzy81d1VlQf0aO
	zDpb0GJM+CniuVukVW6dKMiLADLnY81DYZ+2G3M6EtkiutSMC23ie4clZ+WFCuJaWkpPa1jq0m9
	wQbylF6slJXSUqZuvVTKgSXtkVl37ES3gML/CJqWU1SeyF7aLmTOHw99ClJ04TyAzpOMblqFGDJ
	1Vtb9H1D6j4slzU4pVsVid2kihs061Gn+P9EBFaCFkhGQj6GhFuCRDtuHlAlyLM6H72vwaraSXg
	YnMA1gPXjJ1ZrocWrwIS9purYsBNzqZSJeYfPiofd5Rw1ApyBnpPLtUyazkB5cDPhaSIT5ix1e3
	MiIYg==
X-Received: by 2002:a05:7301:182b:b0:36a:5126:a8aa with SMTP id 5a478bee46e88-36f7641e9aemr2477551eec.27.1793956881548;
        Fri, 06 Nov 2026 01:21:21 -0800 (PST)
X-Received: by 2002:a05:7301:182b:b0:36a:5126:a8aa with SMTP id 5a478bee46e88-36f7641e9aemr2477518eec.27.1793956880987;
        Fri, 06 Nov 2026 01:21:20 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:20 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:52 +0530
Subject: [PATCH v8 03/11] arm64: dts: qcom: ipq5210: Introduce RDP504 NAND
 variant DT file
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
Message-Id: <20261106-08-dts-v8-3-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX0v2rtW7Lu5YQ
 qaZ6wHf4ZBzjuKINF+RxFZzrOsQUbYSFNnuIM2bXzBVUXjnHKDWF4UNgSiV3HegozQQX2b16hki
 dSifVs5vz4ffBW7micnW0/NZAYIkpSA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX2gNiWTrBzqZD
 +aitvdK1i43CNVBgPNGBMQKnA9ryyKMuSQKB3geeR9gf+wQ8206HkxSLGWPqtmMPiI81ZP2/Ax1
 35juqGcbWK9c1inXJDfu1nrBq294nJJMhuyJe7NwMM3Q0ZMn08bVd8YY1g6pUEuZVAJvM841Yk5
 CijmxRz53xAIbreRcDjWBBpz9EfTmcSei94hwrqgLUVNU2D4qmJ4wlxAwSfHHOvlo9Ah8yys8gk
 OJaZB+Ipb3VJCQFACDgMvqSdB2Og8ww0pterO4cchvQffaOyiogktBjLdHbI5sAJLHeJvGr5lUf
 gQmDAR9eS2Xx3yjGC/hAsoVovBkT3nc8TEZQA6wXb7sPlOXZ4QN6Gz00GYi1l0YmDHyTmt0F5at
 sd5uCbLZ8q972K2v6Yly0F0wEO3JrRqtD5cHwDtZoL8mV6+MsHNAr6cDS7uvdfNLfzYBxdcRiEI
 DYFFzQcxQ5ReH75SEGg==
X-Proofpoint-ORIG-GUID: M8GgDoBAbnbF8c5gKjV86BMoFIqk5YYm
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aed9c12 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=vH_i_heqKRWij10IjioA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: M8GgDoBAbnbF8c5gKjV86BMoFIqk5YYm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Add a DT file for the RDP504 NAND variant and include it in the Makefile.
Enable QPIC NAND for the variant, and enable quad mode for it.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                   |  2 +-
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi |  2 ++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts    | 17 +++++++++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..94ab6355176f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -32,7 +32,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hawi-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb ipq5210-rdp504-nand.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 36702bac331c..cb0adca9a151 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -87,6 +87,8 @@ flash@0 {
 		nand-ecc-engine = <&qpic_nand>;
 		nand-ecc-strength = <4>;
 		nand-ecc-step-size = <512>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
 	};
 };
 
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

