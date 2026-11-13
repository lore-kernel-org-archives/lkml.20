Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596078;
	b=cfsdlK35R73sM/f+W48YwDkPzJK135/lBmVMGTLbmwNaoN3xgfVtKcfp/g1/FB75os7T
	 xhcgXvDBicluTCs4+hYyvJ7nq11gNScB2+NSsYYJv+jB2zMZJ9zelFF9mOuKzZlwGrkpV
	 7kpoot06stJk1ghKYICgFx4wYwIHR0LMosz99ImpdOPJdJlK58+ZimeZY7iQVn/eNtTtC
	 Ls2pGckSLEgDEyKdQcUoxQlxTf1mmYMOTxypxWbQ50l7lehBuFOq9mu4qb8DlVPFmGTDV
	 IM4Ij9B13BndqB6Vc+NCoTYUPzZ5pKearg/TUh+15Q89tgceQCJ2SNhNwVhhyXIDF8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596078;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3CA3jmwPFjAFVUqbXgVLGcQiC/Zhr5vktmJBynIdqWU=;
	b=NGSQagV9ttzwHetLise3S434vVKzSJdQ1IGoCyAq9RntwxxCNdIKVz0rxBOli3vR530R
	 O0IwDNstsjPcY6ZmatFAzL/Jl3pY+w2rW3CTBSxYBQn7bci/jg67RBo3ZdrK4mT6KP0QV
	 RRbxe3EAf1WUrY7l14hXXMXAwr73aqCRiRrlAjdylH4EwCtxl72IxUm9dTrT3pYAw4Mqo
	 ieBNwOFPxHNTUeLUh9UH0YPEkFjzOO3M6XkO09Sx2s1Y7qZ80feLRe7UJSCaS86tb+EYX
	 D2w/NTGXiCjLvLk5H6xWW/tee761MHoPdV6xQGGWdHRBgeEFp9KC8jZsowY+YdbKTkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zbi8dN1J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKImZ0ee;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E607F6071070
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E607F6071070
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zbi8dN1J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKImZ0ee
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFQrug2022374
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3CA3jmwPFjA
	FVUqbXgVLGcQiC/Zhr5vktmJBynIdqWU=; b=Zbi8dN1JZj9nRxiM+9o3pmIhp0B
	C8kah64F2uNHdUjGRYZcDRXVs0sOcaxyXPCR46xkVwloxI0aqY7Kp3Lvv2IRMLO2
	jEiXIiaIfRWUfuxCkaC/Nk+k1ade0Uo/22xXOIuivCP5aLlXBZ0YLa6+t5SX2Sbo
	uwOxkmpeuM19wHN6Bs9pK6QW0Qt9rg4GfL8Q2bcBkcXCuJ56Z9NL35CIQxyOiys+
	f0jH/6IZxVAqhLKqPuBDyib4ZT+WupydjFwdlWfThA2Qrm7cljnIwT4+bjLm1LhF
	trrE59R+xlC4OWF3nCUXHBFmmLs5IUuMT+5q2MCw7Rh0Me9GYIudSCxuSsQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx0g21vu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:54:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91ebc622dc8so19816386d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596076; x=1795200876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3CA3jmwPFjAFVUqbXgVLGcQiC/Zhr5vktmJBynIdqWU=;
        b=kKImZ0ee7SJIq49diXsrYgaBdVAII8tr7Ycu6oRVg/2FtrgB775H17rsbnzgmJfAKj
         D3j7vlsDRQuG1GcU4zJoapU1+W5EIZfJxzrQOO7uOqO1uy/q9dqFsAfGcTC74oOj/xhc
         GiBHsuYGwX+/sq3Se83JZ3oHBLa1zFOfKl+9KqdfNuHUAXEReRKq9fM/X1ByTNDA88W0
         kcsVLMe4LJisB6GC9KCsgOJKzZPwjcSP8bmPbRkbMNTcg227P47cFkL4GZGJ38/Uhwa5
         IQsvH+zOyTfUBJZr865LJrehl5ONkri67gpgv2um9DkmU1LRckYB9K6gP8wAjP/tAjp2
         GIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596076; x=1795200876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3CA3jmwPFjAFVUqbXgVLGcQiC/Zhr5vktmJBynIdqWU=;
        b=wusg81iBGGO88hohbaSoA9usoqkXoi756AxWQIeBFF+BUdujDseMQ7lhVnt0P9xHGh
         PHO1NFi0A+TIzYEybROjfuoppLFmiaAavVbBAx8FvvXjaf+fSFjZ//YUI8XMg20Gshur
         pKXmPlQJ54Z/PU6w0YbGVUPUtudTXrKmgTqhCybfX64NjBwDossOCggesRHp/SxIh1PF
         ehLGCfA9i4EYM9F0/WTezutvhD9Fcw1wTr/GfybhlXyckfwuOEFBPCxu5rEudVeulmXr
         kfdM5BmEtvq6pfRPMSJPEKiBEPrqNRt+Jd0PnYmt1UDiyljqYLYePs+n6vOc/tzeLUM2
         n6wQ==
X-Forwarded-Encrypted: i=1; AL+hErFjxPlFQ/Fr2SFwhhsAzfRMGNVDgG7Q/VZSRo9uEmsWWCCpMKTEyebybVJAHKhetN/LX7eY/ex5CkGEvUg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gP55ea3yBBLsqBtEu8k2PjXRmiZ2h2GzVAfQBjIZkRMXHqDHH
	yaz4SKscWKIJnpJ41M4n+tiWLOzg/3ShoW+xbkU1pDfCjJeKunSWwpsSs7Woeta1CvfGjZE5xod
	1j6D1H1ThX/JeJ2RVEoqaLE3nFwRyqHrZLzO7vjERwmcr/X4U2vjwpbhGfokNDmTi87M=
X-Gm-Gg: AYBFou30QxtTxFzDdd2rofTEgOCsrrL5FFRJLyZEmJWQjD/BkV01XDjQ9brxkXvgJ/T
	QjUsNm3lOgKZU35ty5/cGqpEP8gHKVv29w7MKQhQsgv8Q+hVQG0WUPSjSDpMkbx03/8BNI4r8Fy
	A04/DamTFiM1ihxH7Siia8UUakr8OXPaXAOxb8wACgl71As/VJMXGKqha+q9vCRrZL1SHgJdymL
	0W2SYdJWichN7OYYrw9cvaFZ07ZQIBq9/fR2Inqy4hU2LTT/KAgfnV/kp52rPDjZB2iR3JIl/Qj
	31rtG+L4Qb3w6kpAFGnPbmNQ7KRZnd/SGHv1RuUwBLjoJWhkCUcX3IgD/r8WuhD98IGuUkuXZVW
	mSN50SGm9QrWHhqep9pILuW1qHCUV6s/DXcXLuQTP0E4y4y+A/AWL19FfOCR1Ag==
X-Received: by 2002:a05:620a:3725:b0:93c:8e3f:3036 with SMTP id af79cd13be357-9494b9c7b34mr606887485a.4.1794596076344;
        Fri, 13 Nov 2026 10:54:36 -0800 (PST)
X-Received: by 2002:a05:620a:3725:b0:93c:8e3f:3036 with SMTP id af79cd13be357-9494b9c7b34mr606882685a.4.1794596075877;
        Fri, 13 Nov 2026 10:54:35 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c888b90d4sm5762454f8f.9.2026.11.13.10.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:54:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: qcs8550-ayntec: Use hyphens for nodenames
Date: Fri, 13 Nov 2026 19:54:28 +0100
Message-ID: <20261113185426.183501-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113185426.183501-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261113185426.183501-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1064; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=V/f7MLrGSretAykVIUBtQxm8vmwlDZtYfbg7haKORd0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91zjO+W0w+a3FQlt9AX4aoDplJF2i3TZ44v7x
 fZcgM6OQmSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdc4wAKCRDBN2bmhouD
 13c7D/9uMWDv366bIsma6BKHisAvSMndaN6hcYcfWkPnuWMT3gMpr2dbMNEJU5bXHoaHrsmt3Sw
 0DHk9Un6YlcB/G3Enz7Q28rVQ4Nd3oLwW2Dk7XeFnjXGG6wlaoNl9MrcvXL4zCqsuTaCT88kutr
 bguMCuIRcjyPL/l7KiHmldYreOo8jmziRAnKqDRYCmUevVCRYuNzvBL348wYHdDH8qW1QZCfyJ1
 aw5cSex95Nbzi4pZhzfTL6V+mM1ilWdd8xFRN7yAU/gF9XgUOPtRjxswhJpVSs50fphDWdcNjAe
 83GS1NZZ7uaEHpkzM1qZPYh3WMdMHkIs0Gj+HCF8h98eZglXdj7V51d1XEvxlSXVNZMtFQcXPES
 XEBs3mKchJ4ElIPR1f5GdO1PQsjv/Z97vkxk5nJl8NLpwe7f7FBNdvXKaESQ5qjfDX0LaUYxdkG
 4783piR3c8FVa0sksZh/wf9TlIL2Tlz7KnlIdVkSL0WsuYY29mwZXhWwHO/nY/hZMGPQHAxVRkc
 y9+/9Z4KvhPet1SXJS0/gvIYZ45nk3baFTb8b/7QiDFTrHDeycWrI1ff4lcVfwXW/nYnSFtgn63
 I4gHtZt6la20u8LhQmCrGWdeG1t5NvyeGtwJdhd5hddLa3y2w4yPgS2azY43UgRS+/ziQDtcoGI 2LQ1G2btwz0DLdA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX+yNmjDu3QFHA
 wqGvL3FNxUukG6UIYdLsyZ3bZhgQ37NcHaPiYf+Ej4l+fPyFxE7AtwkHrxE6b3VNQ6WOD86lZQh
 zFpyBC9TTxUh98Ayyd4FN1TprrJXCLijzEJSWwQ2CgLMKBOVbaEfKKO0wvtquWT/gKumeefPxQG
 bwKfGAD4gFixTahI1E1/oylUR11sfktySytQPfR4Uf8f1dh3lJsvv2YjXw/NCYxqzyl94N+A+jC
 yrSzE17FjduFiC7yg/qKutGX/ViRucO+SmWgF0KiRrZhk6mAPsIPPHkmAON70/5CWQQO4LcgTlq
 W+yM01XBt7ztmxJITFD8AS7qOCXH5wNs29IJxaoo6q4I+P9arMuuJy+RWhXsMdreKaOFcxNZBV/
 sDo3aPWElFS+ZNrT6zA5VfaaDYJRqYQvqhLS83ISnTNuSDjH+bZYpqJqoJRJtTJM/6jlqIkvrfN
 dzSh9CvyJmqbrJ8gwgg==
X-Proofpoint-ORIG-GUID: QZ1dzaFbU2afO18Iz_6kTkk_faoXoEnS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX43xXOR3Dqfb7
 /ENRlfwwc1txee4uExLRYx/WL5MIFywu1xlgtaOSCXo+bd4XAB88kQ67MfGvXUpwWG6IWO0msrp
 m9rn1ynt0HYUgIbcL48JQCg4kiNUEIw=
X-Proofpoint-GUID: QZ1dzaFbU2afO18Iz_6kTkk_faoXoEnS
X-Authority-Analysis: v=2.4 cv=SpIFe/O0 c=1 sm=1 tr=0 ts=6af75ced cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=RUKCDZl-UO03dcoJ5hwA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130075

Correct minor style issue: use hyphens for nodenames.  Drivers do not
use these node names, so no practical impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi b/arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi
index d567708f1024..e84a7154c688 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi
@@ -183,7 +183,7 @@ hyp_ext_reserved_mem: hyp-ext-reserved-region@ff700000 {
 			no-map;
 		};
 
-		llcc_lpi_mem: llcc_lpi_region@ff800000 {
+		llcc_lpi_mem: llcc-lpi-region@ff800000 {
 			reg = <0 0xff800000 0 0x600000>;
 			no-map;
 		};
@@ -1239,7 +1239,7 @@ &iris {
 };
 
 &lpass_tlmm {
-	lpi_i2s3_active: lpi_i2s3-active-state {
+	lpi_i2s3_active: lpi-i2s3-active-state {
 		sck-pins {
 			pins = "gpio12";
 			function = "i2s3_clk";
-- 
2.53.0

