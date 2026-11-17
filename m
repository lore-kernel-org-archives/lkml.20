Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920771;
	b=Gjhfdqvrk35iXw6W0tVDqCQQ6ESGCV17vAr89oI+PA3amWAUZPYE3uWvmQdZyEsWcg1q
	 LkcnBAHHMrULkMHnFHmMLHXCCdKJqn/b99eP1lxuPKHA9K3aSP8iJ3pyo1iId0ZXRZPu8
	 /ndeozihfKkPbUHVD3Nbu7qRaHWLOMWhFUb0is5+6u6Whpu7u0EtcV1YVbZbIaU5k+s1y
	 CUlv/d0oQTlTEFO/erzridw/2fGlMu077M2ogoVLF2xaxCXUj5g6AsPNGXmRueSlqj3+6
	 lTw9GMcxEUk1wYaReM7AM1KrwqVvHeKhayuDYFR/d9qZFJ7nUzw2uzl3XuI/GXDTeGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920771;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=werp+leniNoWoVq75RHzy2154GOYJfG48JzVEy4bJ6A=;
	b=gKNqR/rTivHuMOj4pHQXVZ4YJLQy80KEgXIC4F+rt0XxestG1Wj8c3BUag8DMcFb0l2T
	 rauihSo6mMbxAWTOizKzvF8MBMeM5MTnDiReRQ1SKH5ztmCbsoY8DNttktjOxLe9E3gT4
	 XxvwkRoECrKNvLLuVvuKv5nDLmnsHzCSvti1o1XwzwX+tXdqycVd1fpZ9a+Ctg3jERCa6
	 Y5IY0AgKlklwhWT6kQsJnnId7M9V+eqrsogiwTtPOvqYcdl7/AzlCwPJXa26tZPsVohBK
	 E2pfthx2RqzL5sYc02cRLoRM34iVy7f54K+Zq/CBYyF98d5//nW0UHO0NAc+tZxHGeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oUJogxAM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EmbuStbG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7498B606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7498B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oUJogxAM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EmbuStbG
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC0niQ1457352
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=werp+leniNoWoVq75RHzy2154GOYJfG48Jz
	VEy4bJ6A=; b=oUJogxAMZln83g9iN2+29I1+sQ7inyqOcEuTtGiTvTofZfuXzfj
	kHfQQ30DSMBwH7QfbCU3+UP43rJdjF9wPEnT6uZrwREWeJeqVvlicBEr0tXoy4zt
	MTacoo47z8b7AXPVgR5rxCO4Jorfpm6Wp0WKI0sOyvmoGIBcLDSvuMVvZeJcOs9a
	GDcUveMK+NtE2BBLr5pVRrYmzTxEFo2ZPW7PwkiuCETYex2XfyKay3fxh0faGzTD
	7Vj+e0E+jDHpFZ7BlALcw91Wbb/pg4yOTEZisaafA+bFIzbJfywvQ5PU1DIFwbBd
	oJIw7hAoZYk8+mFIfYJf4HF2tbVgxK45lvg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0nc80j4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:06:09 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99082f450bfso2226708241.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920768; x=1795525568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=werp+leniNoWoVq75RHzy2154GOYJfG48JzVEy4bJ6A=;
        b=EmbuStbGcF8XaCSRdPdxLWxguRTE5qFHmp7rQIplNcm+Yfh5IlbSO70NoLbFACGH4e
         jDVAlIMywBR9W2khQABDEaW6B/C+RdUy1voq0Pn5IObFMnVM8ukxzfBYoI+5PaLFtsHg
         BPQY3JwMTR9gfquQXkJifCapdtjS5TfFyh2ZpynhHbdPP0Nnp2NBezmIlRpZVgR3yW5r
         ZjpuMQ69Fx/RJpwzyBLBhps44sK3VUSCgxkk+eipW6aRPkrtEFOs+3BVCAgf1nexkZmI
         rh+7cC/1cQqgpy07Mz635QQtzZ3DZKMGseqrqHPYxYSW4vdsCq3rtRmJQhe/GfdIqczw
         tZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920768; x=1795525568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=werp+leniNoWoVq75RHzy2154GOYJfG48JzVEy4bJ6A=;
        b=LP3GX7UJP10knIdt+uRzKon5hBN1yVvQBGrcmXAqCRAHTAcfm9/zI+un++1xqAlFRJ
         Ctr+EW4aZMXFJNLdi+sjOm3ZTs4SRFAlPoGiZHWkEke35uoe7LOxvGioK1w0SclIgb3U
         Q8YTq7RsJJfbhao1r6a94yhHlb1xTQtVJrDSSnG/ZobG+9GSPAIcQPh3diyOO0qRweFx
         jUQY2kjYwesxXk1MkefITOb37Ogi2lFUdqwKc482LPrtLv7MnTiKjK5jCPOL1PM+gfx2
         rW9ZjbeQC/m5roTaoLOWtPz7Srso5Mle6TlDwJE5wOJfqSxQU94qESASc1k1hlBd+ZiY
         yf4w==
X-Forwarded-Encrypted: i=1; AL+hErFxiW4ObVz87uFh32qPihj3vuwCNLZ92bF7tTEs9q6gn0RwGrcwweCAlSAMJEO5EY4PCNGmGOEAqZKlyps=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ve+Gi2Bb6HGlXjH/2YvXQ7Y8bcqlsVT/2iE0tlT5rGuq8WWNk
	TgkZNkvhIKAOi5K+Bm2ivijmuq70zfNfqn+/aq7mZppw67X7F5MMvJlqkKBcO1sTBy8YIGlDw57
	iRApoXG76KVkYGxHEZqofYaaNvAr+ipaXGRm3eue071sisEyo5/6Tr+GB1RJSZmOmIH4=
X-Gm-Gg: AZFdTZfJxiE5tmAuizOJDOOZWVnFoVahIXPZXjNMwFJ4M/CYYtKPfnV/VBZZuXxRmUl
	Qlm6usEI6OdCrDiuT0nUmyOm1Mpz+m3xa/aciI5Ax5bfKaSisoyUFnzrDEIPG/NAXl71VU+QTpf
	8k8jGuX3fMfm6n7UUVoau3nds537IfNi/GfnjN1fq8gWyZr1oMkY1ass2cmWVXNbzmle+09vfsD
	MbbdZYT6rbClYJ+xitCVG4fVLs2GQRoQauX0UjoeZJg0HK+X0448AF2366HnIfOxRE1BytQI9je
	nnOozmV1D2BV+D5nAUhKPAL6qlkoliQVKe3CJkWU3dAjEkFjtGdlihAJq55X7iuf1d7Fl1LPhnp
	v7jDPS2w1b+E2duhJAnW2iySvFjKblXZiA5e8AhxdS0vLN2o5iVkt0ag3HIlQlQ==
X-Received: by 2002:a05:6122:4f93:b0:5ec:20e8:45ff with SMTP id 71dfb90a1353d-5ee34ae3347mr4929149e0c.21.1794920767814;
        Tue, 17 Nov 2026 05:06:07 -0800 (PST)
X-Received: by 2002:a05:6122:4f93:b0:5ec:20e8:45ff with SMTP id 71dfb90a1353d-5ee34ae3347mr4929113e0c.21.1794920767336;
        Tue, 17 Nov 2026 05:06:07 -0800 (PST)
Received: from quoll ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b5b078sm534082166b.56.2026.11.17.05.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:06:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: mediatek: Remove undocumented, unapproved aliases
Date: Tue, 17 Nov 2026 14:05:57 +0100
Message-ID: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7918; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JhAQKSi0UHwGaRwXw9Ozbf6HX68wW/ZtNlGPzsJLQPY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq/FE05ytbYP2204OYIuT2UmPNOZgaD/fErFnqn
 Yehi09tgqeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavxRNAAKCRDBN2bmhouD
 12y+D/4/5qerQxe/BEAJkh8aESGtkmL0OcZVuM3sOQgqovDF88ovrnq67BZoRD+ZOenW68asV5t
 uLd5WnWNL/naLPXAwBgivabqWoY+CnkfnPkMbDAqhbXuvGV1xL5XNcGhMc0iElFhS94biszOgds
 NRQlYPKCYEZoEuEBbleG2vXdARzecRe4NSDQo7cjX85X0gSy5mcjqEGJuwa52CGOsflhtsFmE5Z
 vQZPFy0Ffqu0ZdjItDPr4u+b8HZfHu/u2AgxSPGw5l67u5D+Ir8MXPr42YvfpLkhSmlS30Y43RX
 PBW4cKZ8XMQfYEXVhU5PSZyEDgZF53u57IR7TO7jOXklQm2mMZu6hsM1G5J8Fv5O4bKL7QcmST3
 V3AiqRHZ9KRp8oPuPVclwIOxdK7cAA5w4xPNb6y7ZbGo0+JKsz0UeU+RopVx5UHyNusSSzY3Z82
 GIkj06gwBQPdWcOPdcpKr11R7QqrlLlXLZSuNcVZQMj6AMqfA/RBeyYz1+610GyNOQuJdgRre+a
 3VPqAJEZto9ASmnUs1Y7Q7hjiArQzim6ewz5vmb+URjaNboRswzapn37mJQLng0f0wNlhkvFYz2
 XWdDJTL343s+bS94gfF8Wi1ADmuR53MrjwysN18+Qz2y33wR2MDuYt2dpnw2reKJdmka/j5jckn sXVVx3Ey+/h4nVA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LaipeTfi c=1 sm=1 tr=0 ts=6afc5141 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=MmkPf4a8AFjUc3_LGQoA:9 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfXwdMmXE1knnjv
 9nVrhtH/qU6DuOICS7+p+FltCPzn3FO7H3pTsGttCiaTbE3GJM5FTxNCfPDPUeT8NYD8OfjALE0
 njZaRjyZDp+vjNYVtN6I2pW7JYpRA1E=
X-Proofpoint-GUID: 6Gd4BnFyWz3EQhEHzgHD_X4AP5imnYb_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfX1Y5n63pnoA9n
 24cQm/bVxMaCNqk0Xr+ll9uEwfeCA3TL39IH9WUFOJ1/UNoo8a7mgQi7tHQi7y5rnzPZkrbal+U
 waTZi1u/d1ewR/Ck36UsmIEvPnN9SvAW45jVaAj6p7u4vS/RSEqz9lyK/VH/H2k0XwFEAuvt5VD
 uQDTKg2unsyOAPGjnm7eROAJPR4kYLADjptI1UA5+hbJstOuIM7BnA3/Nkte04GxYtZCx6RsvmU
 EP09+2bVfpN/6mCUBLsr4bVudG1OGvfsq1r9qcZT6igxMyFaN+zTnRtoj2jwozyYubtVwyEkp1e
 LM9ElUB9E1KX/7aJYfSP9jBDszt07yq1FQ1+jl+SSNdFaRB0RCx9OkmtSxFybYjwt+9T1iweQsA
 gfCBAVUmdJE/23aFfhMUdneYdKBkRJGz3/CM2kq/yGyxm7rpkjNmrAu1ynzuS8jwqlJRUXR9MKJ
 gjPAYQxeYFpDuaGJf5g==
X-Proofpoint-ORIG-GUID: 6Gd4BnFyWz3EQhEHzgHD_X4AP5imnYb_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170052

The ovl, aal, color, dsi, gce, rdma, split and other aliases were never
approved by Devicetree maintainers, because they were never documented
as actual ABI.  Drop them, because no new custom aliases are allowed for
years now.

This might break users of this undocumented ABI, so these should be
updated to use only documented and approved ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi      | 17 ----------
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      | 16 ---------
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  5 ---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  7 ----
 .../boot/dts/mediatek/mt8188-geralt.dtsi      |  1 -
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 33 -------------------
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  8 -----
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 24 --------------
 arch/arm64/boot/dts/mediatek/mt8365.dtsi      | 13 --------
 .../dts/mediatek/mt8390-genio-common.dtsi     |  1 -
 .../dts/mediatek/mt8390-tungsten-smarc.dtsi   |  1 -
 11 files changed, 126 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 6dd706b27830..971fb19e95df 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -21,23 +21,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		ovl0 = &ovl0;
-		ovl1 = &ovl1;
-		rdma0 = &rdma0;
-		rdma1 = &rdma1;
-		rdma2 = &rdma2;
-		wdma0 = &wdma0;
-		wdma1 = &wdma1;
-		color0 = &color0;
-		color1 = &color1;
-		split0 = &split0;
-		split1 = &split1;
-		dpi0 = &dpi0;
-		dsi0 = &dsi0;
-		dsi1 = &dsi1;
-	};
-
 	psci {
 		compatible = "arm,psci-0.2";
 		method = "smc";
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 6ec50125cea0..868b0fb84449 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -22,22 +22,6 @@ / {
 	#size-cells = <2>;
 
 	aliases {
-		ovl0 = &ovl0;
-		ovl1 = &ovl1;
-		rdma0 = &rdma0;
-		rdma1 = &rdma1;
-		rdma2 = &rdma2;
-		wdma0 = &wdma0;
-		wdma1 = &wdma1;
-		color0 = &color0;
-		color1 = &color1;
-		split0 = &split0;
-		split1 = &split1;
-		dpi0 = &dpi0;
-		dsi0 = &dsi0;
-		dsi1 = &dsi1;
-		mdp-rdma0 = &mdp_rdma0;
-		mdp-rdma1 = &mdp_rdma1;
 		mdp-rsz0 = &mdp_rsz0;
 		mdp-rsz1 = &mdp_rsz1;
 		mdp-rsz2 = &mdp_rsz2;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 7414c10ee664..2c3836555e55 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -35,11 +35,6 @@ aliases {
 		i2c9 = &i2c9;
 		i2c10 = &i2c10;
 		i2c11 = &i2c11;
-		ovl0 = &ovl0;
-		ovl-2l0 = &ovl_2l0;
-		ovl-2l1 = &ovl_2l1;
-		rdma0 = &rdma0;
-		rdma1 = &rdma1;
 	};
 
 	cluster0_opp: opp-table-cluster0 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 621408439ffa..2f82eb532f30 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -22,13 +22,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		ovl0 = &ovl0;
-		ovl-2l0 = &ovl_2l0;
-		rdma0 = &rdma0;
-		rdma1 = &rdma1;
-	};
-
 	fhctl: fhctl@1000ce00 {
 		compatible = "mediatek,mt8186-fhctl";
 		clocks = <&apmixedsys CLK_APMIXED_TVDPLL>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 801eee735afe..883141d8a6d5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -9,7 +9,6 @@
 
 / {
 	aliases {
-		dsi0 = &disp_dsi0;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 14a320f0c70c..f14b23dd57aa 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -23,39 +23,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		dp-intf0 = &dp_intf0;
-		dp-intf1 = &dp_intf1;
-		dpi1 = &dpi1;
-		dsc0 = &dsc0;
-		ethdr0 = &ethdr0;
-		gce0 = &gce0;
-		gce1 = &gce1;
-		merge0 = &merge0;
-		merge1 = &merge1;
-		merge2 = &merge2;
-		merge3 = &merge3;
-		merge4 = &merge4;
-		merge5 = &merge5;
-		mutex0 = &mutex0;
-		mutex1 = &mutex1;
-		padding0 = &padding0;
-		padding1 = &padding1;
-		padding2 = &padding2;
-		padding3 = &padding3;
-		padding4 = &padding4;
-		padding5 = &padding5;
-		padding6 = &padding6;
-		padding7 = &padding7;
-		vdo1-rdma0 = &vdo1_rdma0;
-		vdo1-rdma1 = &vdo1_rdma1;
-		vdo1-rdma2 = &vdo1_rdma2;
-		vdo1-rdma3 = &vdo1_rdma3;
-		vdo1-rdma4 = &vdo1_rdma4;
-		vdo1-rdma5 = &vdo1_rdma5;
-		vdo1-rdma6 = &vdo1_rdma6;
-		vdo1-rdma7 = &vdo1_rdma7;
-	};
 
 	cpus {
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 898953acdb61..bf5893e3002b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -23,14 +23,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		ovl0 = &ovl0;
-		ovl-2l0 = &ovl_2l0;
-		ovl-2l2 = &ovl_2l2;
-		rdma0 = &rdma0;
-		rdma4 = &rdma4;
-	};
-
 	clk13m: fixed-factor-clock-13m {
 		compatible = "fixed-factor-clock";
 		#clock-cells = <0>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 9aaf8b6edcb5..389fb9d7ea89 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -23,30 +23,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		dp-intf0 = &dp_intf0;
-		dp-intf1 = &dp_intf1;
-		dpi1 = &dpi1;
-		gce0 = &gce0;
-		gce1 = &gce1;
-		hdmi0 = &hdmi;
-		ethdr0 = &ethdr0;
-		mutex0 = &mutex;
-		mutex1 = &mutex1;
-		merge1 = &merge1;
-		merge2 = &merge2;
-		merge3 = &merge3;
-		merge4 = &merge4;
-		merge5 = &merge5;
-		vdo1-rdma0 = &vdo1_rdma0;
-		vdo1-rdma1 = &vdo1_rdma1;
-		vdo1-rdma2 = &vdo1_rdma2;
-		vdo1-rdma3 = &vdo1_rdma3;
-		vdo1-rdma4 = &vdo1_rdma4;
-		vdo1-rdma5 = &vdo1_rdma5;
-		vdo1-rdma6 = &vdo1_rdma6;
-		vdo1-rdma7 = &vdo1_rdma7;
-	};
 
 	cpus {
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 2e782558fb77..4b05f6a864d4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -20,19 +20,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		aal0 = &aal0;
-		ccorr0 = &ccorr0;
-		color0 = &color0;
-		dither0 = &dither0;
-		dpi0 = &dpi0;
-		dsi0 = &dsi0;
-		gamma0 = &gamma0;
-		ovl0 = &ovl0;
-		rdma0 = &rdma0;
-		rdma1 = &rdma1;
-	};
-
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 669eaec662f3..a938539c92b8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -21,7 +21,6 @@
 
 / {
 	aliases {
-		dsi0 = &disp_dsi0;
 		ethernet0 = &eth;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
index f2ad9265be31..d70bed80274b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
@@ -16,7 +16,6 @@
 
 / {
 	aliases {
-		dsi0 = &disp_dsi0;
 		ethernet0 = &eth;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
-- 
2.53.0

