Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595999;
	b=K7L3Yq5ipoF+No4Y49YGCJdTeqXo7zOi51n/ETg3nUPYBWrJv62nLdSEIAqwgIVybTkd
	 g4EOtx+CzHZgKJqoIhwn4zrMmINSmGTs3C9tFlad5ZAF7okQzEPrDvrrYpyz8FztINtMn
	 2z1DFGpBveeQG0aB3MRjgaosu582BsN38GrJXFnB/Zf9oP/bgXDlJKGmpDaYIEDNTKfXS
	 Qj+eucwXbvPzlsX27Qo0vhlxC3twA6f/Xkqyw/PT8ukRUkD6cl+niBYgtVvIXP5ixIzKD
	 JU6Hsh4aUyL5u7DXADC/FhXiWCJgvbKhqMx3Xy0rJkkXl7iUZufasXGtTE2Pz5P3rnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595999;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cwxAI3XOBCEUSdqA7JlE7nLy5CSrUv3dWQsI3XESnAo=;
	b=2wFSUI1m+Rz3wGVeJ76ryCAzctH5Mnf9DS4ls9/xHh6ntkRj+Y6XI2VNNdyTEqE/Vh6N
	 DFWOQ7+HrNq7GWqFaNTNsDkMI3CCl+WESLMO1Z5oBBChiWwMdcd/2Tjr0wZTfJb78N7v3
	 2qC18X1v6fczXdhb/I07RoJnmMs1gqryh6ka+Cz08dTgaZMDGFIkcMeNZPCjQmR2+YGvV
	 pV/QYN/FIMgCNS8IueHLJ/TgzNIiwxjSzUlirIk146n409kOMu9y7vVkzDb1XuqmZFKNm
	 Pe0FeLTFFPTNX9KqQHZ0BjbA5wVfX/TpvMQgUEtBBNf7l1WIetZ8tbuy79/BZJ4B9QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9nM5+IS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=At1u3S08;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A8A606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12A8A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9nM5+IS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=At1u3S08
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFQxKL2022411
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cwxAI3XOBCEUSdqA7JlE7nLy5CSrUv3dWQs
	I3XESnAo=; b=I9nM5+ISNqJ+v7xR4xPn4lKqp+FdLYNKSvCrLgsn1d0OcenQ8mK
	VJG50aMPTY7Kqt2XsxQiv/pNXcCQS4Uomn5oOe4GB5KRwRBGQCsMXvl+csE1UFBm
	OsUr2g907A6KldtokdWkdKKrAhLdD5KPAj2YMvma4FszD9DRyoA3P5NMtwIpj7kO
	7rX1I257LOuBicMq/sXqunWqQ7oheOKb2VhpZgc1bbH1HpCYIhjQND0Y8R2jZgja
	yyEkO3BD0I+W33iDraik2L1AwSrCsum34vpxB5OAXmS24CewP4vc2Ite1UVZdTPB
	SzYsYz8toXsOK5iOpnnc3ccQDfj2bUkqQMA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx0g21vmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:53:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so435368685a.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794595997; x=1795200797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwxAI3XOBCEUSdqA7JlE7nLy5CSrUv3dWQsI3XESnAo=;
        b=At1u3S08HXTeWM9fmBcP1HjX4YqFseKGv+776ezlvOt8S2dm2F1G3+Xamf5kpYoc4m
         Sf96RrYwxxuLIDc2F9gHhPZOsZ/l6PUGUDEDx3Bz28dIwF4WlKxzofGRcUSV4j3zHP8N
         s7CcriF7T71/3JM6oCGPZTG2k9u23m38v1GHi9QTgFDOqFJ0ebbgCc3dizX9OXmUL7ub
         xBlTTw3JiWE66nkBiFqH54jlbnfbGy4x/j6dNGsuFHmqG/MyafT5HGi1A5IKL8+aJt2h
         tl/OJsKln1u9WUf+uW+tpnJ9i6I0IF2wXq+ViIEhys5vmbUiGJ9eq8iuW1zjCbL3k9hc
         nsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595997; x=1795200797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwxAI3XOBCEUSdqA7JlE7nLy5CSrUv3dWQsI3XESnAo=;
        b=DTk8zQFPX8X1bAzLGVKZxw1jQhnqvaFdeTOWMllTWs+mN6hyif9OMbyp0uM+msZOPT
         7Z8erefk+QDjUqI03x6+oMQIY7HIvswfGhx/B6/ppCvhO9qQVNgkrl89azgTfGx4xwTE
         iCqKujFBJ5OkRzym2mM+aEEvdKUM4vQugT3eAaGJmHdp+YWwuW2X+XCiRRYIMOh6dIOf
         NlJ7fK2rZea109zgCONiPrz/lyo+VrHjOClTGTdECB8tJRvD6KvH+uMmp5ZJDTyGHtCa
         Nycc736LkYSER4yjQenjVuwdGZWr/pjsbsEevx+jsywo5zQyfMswyyXxgc91W1euXZ45
         J88Q==
X-Forwarded-Encrypted: i=1; AL+hErEO4iyBuAtPtSjeHXgpB42v+w5rlwlKKofvajtLNUqA4aKOIM29cRdpAULFQpQolNUGG6PBfUeZ+GQZdrA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ALWUdVM/8rbNPvxjauBIM0e5x77LEyjbg3qoTQ0EbiMcj+uwT
	l6+dZrUoyWFe/whaaxk8k3V6KjqqIViVojkdttbwsi7XoLII1/v6PiAgyZJgguHCrN+0VqxXLYm
	H1UYg5+w8B78Enifa7+tLLiYAAjuBvTMAkdDtLD2xqqi0FouwByinqJxbvf2BQOBKeLY=
X-Gm-Gg: AYBFou2fk2Sm/ZietzwiMPx2kaLpEy3axnckZH/rNFz0KvR3zgcMzi3rBgXFBnzkuCl
	qFSvgGTcxdkDu8xEfYqE7rv7Ay7a+VDPTM8kRAUwE/2OqCzpUaAhUb8Vnc/6pSQG8tzkXJH7f/z
	8N4mzMgLI7/Vzp8Fs2sugiY4RYa0o0SbW+8P3Zi0LaLn3MN4V58kUjTQ5dXATArfWlohPk229iz
	xAunxMz1URvnap6C5257aVxboHDxl/9r9U0BRikbcLeXQENL1eq54tZgvlbiUJk/my6+9uaTgDz
	RqCLRDaVn74CFAydXcI/RCuVMHF5pnhlaiR4uU4UqD5ujFzS5CRwDNvcr7rFpz691RMLS+WzJCU
	EK/Y1wsHMTVLw1UpsqdP+yGCxIeMSgA+QqbQOVg6sFI1KX9/1LHMaqWJBtN1TJg==
X-Received: by 2002:a05:620a:394b:b0:943:f31a:c0a8 with SMTP id af79cd13be357-9494bb76dc9mr579499585a.17.1794595996905;
        Fri, 13 Nov 2026 10:53:16 -0800 (PST)
X-Received: by 2002:a05:620a:394b:b0:943:f31a:c0a8 with SMTP id af79cd13be357-9494bb76dc9mr579494885a.17.1794595996364;
        Fri, 13 Nov 2026 10:53:16 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm7369881f8f.45.2026.11.13.10.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:53:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: rockchip: Correct double space in rk3576-anbernic-rg
Date: Fri, 13 Nov 2026 19:53:12 +0100
Message-ID: <20261113185311.183045-2-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=899; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=li5zaRLbjcgdl53eNiBCGywQR7ZOj81A+LBTsS7dipg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91yXeHEGZqRT6/RVGrwwPfQidox76rH+LTSJp
 7nYEKNA3gmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdclwAKCRDBN2bmhouD
 17r5D/0d40vumkoOXhkSDodf9sh1qigBkr/vyOW5jnYQZmdDU92dDDMuDxKoqEQnsdJmCHkTubI
 ixM4r0eunLEaDcfq2ke9GUdKE10iii0T0R/BWNkO2YCJKEvXo37YTD9xBkjnONSdzB18rowoSoq
 mlxP/N3Lp96xX9DMGcdLAl/C9HAnrYjGbXt4O4NxEZI1769sBMWT1k97/1zZy42FEedaIxsTxpJ
 puFFCtfhQ2mh1r1C6Fwy5u6BOvoaVO2het2gOqJHiGWuK15yhOAl+GThjLPdMgJPh+7ViFJg2Q0
 BTJtHm3b0al+LHPOUsCWaZBTpO+3XjFqClpl89rFyPVhN276sUF3Gh+yBjmGUHIxCsX+/wCCzrQ
 oMhICNCLxOuo2BUZvPNj3GeQTkhCftafV0s1ny/NLWfe5M8fLA2YNIbWDzbe6dq/gJV9IBxQxb2
 d+eDBV9fJtZ04ix+gcVq+X4V9NjF16M8sxIoDWHJIvLv9rFjWSjdDe2PUQKMKXuQwy9GDpl4RXI
 p4sMpjjN9Twyop3VdnwOn265Rlq3+aBrg+Z0OQc6wvZVVld3DVnBmuPQUgx3FKBuZGI+gmHvGA2
 rRE/R7qV4IYZ1aouUSHPCxoGMf0Pa5KykdMXRxvE3Q+P7wry6C95zFVa689zPV31WUKqLI/H2Sq TXH3KsVXke0FtVw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX8G8869aK7nsN
 /6Y/v12kayaqzNyksMKbnphvH9kzk0swfoDK/iY8N3f4Y34P9NRZA8EbSGcFnkZV6C8rDC4eNv8
 X/kpRhOTLSNfYaVB/iabfMah9b02Pc0mUYt+qL2RIX5k92nsUH8Yu0eYpallgDGvlsUfqwLDonj
 K6ZVy1FjtWZrKLUm9Ed317XfGS6l4ZVwfuVkmcWSL8ZSDDP93pasPr2eYSgSeNfF+4fa430P6PZ
 858zPJnR7pdtSm3Nb23xz9QZi1WQEMTVfg3X5+VBKsdLObWm7Ky4xmLNI+o+Dha/xhPzWk8AYK9
 aXUUDuEAlf2LWwZ5PGgBNVre5GOUEcL4iM3ZExcsJjcdbnMefT7wBU3BfDlt7+BVSdUjcZpvoxw
 ijnR+oQsxbA6DtrhqMoNNwVnocW/yTj6PB4Y5bGq9QPgiFWvjjOD7iXx9t4d9t/CjnM7ZjkkT/m
 opjXvcAsRfsj0yQsmQw==
X-Proofpoint-ORIG-GUID: pdM1LEpG9rtzt6FTrxf4LUsfXINWjoen
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXzP8Y/jR5HJ/P
 91JO7uWveJHG495SJZj6xrIWyA03fc1dRZekm/YVBe9Nm9YO2YIJ9WWm5R/Kthu/IUXfYIlwLFU
 oLe4UeBOLwVhfhKbo+8VjVYK4R2jBQM=
X-Proofpoint-GUID: pdM1LEpG9rtzt6FTrxf4LUsfXINWjoen
X-Authority-Analysis: v=2.4 cv=SpIFe/O0 c=1 sm=1 tr=0 ts=6af75c9e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=JQ9b2t5kTtvAtS6z_5gA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130075

Correct minor style issue around white-space: double space before '='.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
index 62585397b01d..4ac849329ea1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
@@ -913,7 +913,7 @@ connector {
 			label = "USB-C";
 			op-sink-microwatt = <10000000>;
 			power-role = "dual";
-			try-power-role  = "sink";
+			try-power-role = "sink";
 
 			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
 				     PDO_FIXED(9000, 2000, PDO_FIXED_USB_COMM)>;
-- 
2.53.0

