Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595947;
	b=GYt0zA7RkgHOD9dARK4dwFClIhXctBKzsPI1fYWfFeCztTHl7m4W9nL68xBzn/zLocHo
	 Jvj/LvYfHpKkAt0PZOVpO9YDkfORmPr5x0O3wAmIu/ibsksPVig2Pr25LagthOjJrCxKT
	 KhQvDHh4Ww5STZoJmEf06Qh8JfPPoC9uvjgTFBA8D7j2CDIQn8hog4wcxAw/mU0gdbmPs
	 cvbSeHO43J64h9SbYRspKJKyy31DeeGI/4Ugei4+1CQOjSQco8Ed37unC136vMOhlAwCy
	 2VQkC05BizP6nt66xUb7fsOrq7qMfhp2z0EoQUWwlnad6m6me/Dq9kCsnUK5UEf7GVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595947;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Po55cXrE16BxqMC3zVUb3WIMlK8AUcbgD7z5RXqz2B8=;
	b=VE3nMru0tTDko5ccOHmUvT6O3rJcyu3mdVTFGHQpK+4yE4LHBd/9shMVlq1WkA3/bp65
	 Pj14uDKEBvzFg6ikLuVq2ZBm1vl8P1rLSt2/Njx1R9kQ7H3MdL/qdkkcdlPya0iPea1gT
	 P/BhHnmZ9bBggmU+cTGmUkD++Gd2gy/r9f2nFKA1/vPGuh9mYyomoUij4BtPU7omRrLt+
	 lFBVfkFne78+hfXDSsaxCmkPLlkBNJ3M8Gold4uCvcOjlhFjcQaK3MMrugZMNrVDCQXMa
	 DbnsiIRXYTH8C6fbhLbLPpLZ2UuqCPhwtTCmPaQThtS3mAXf6KTUg1YPzALCaC5nTrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nNi9CPyh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="W5vZX0/y";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A385606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A385606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nNi9CPyh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W5vZX0/y
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR7ea552097
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Po55cXrE16BxqMC3zVUb3WIMlK8AUcbgD7z
	5RXqz2B8=; b=nNi9CPyhsHyyazKxfw6F45z9vlk6Y4jA7tuFgEKyxQyxsMVXfzo
	fp7+wMC8OSZFsT7SEkPpDFD9r+Fj1VXMsBM2zxeXOv2VepfzMAjL1f273Vj5Ns5w
	L2VTAmYvroUdfE50aqs80CWgW1oAnWjQuTOapeUDW42jO8+FS5pUOgMLgdJObRnu
	Ydr/nI/7boqTAYHJmCLHek53WNUNNuusvUPmsY50FJdY2CwWwZKOx3K6mjkSctOd
	dpYYRxqWcaT+XNISqD6AcWdknfc5h5YLq6LeC/AKM+VrYrDBHps2AsZ8jnH2UqOM
	pfgUgBGa1jcYlVNIsf2D3GjiEgyjLsY41pQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwcbvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:52:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944138ed63fso219835685a.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794595946; x=1795200746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Po55cXrE16BxqMC3zVUb3WIMlK8AUcbgD7z5RXqz2B8=;
        b=W5vZX0/yFRJwHeu76NFq09Ouz4jyxgWp0/D44gQJH6iwd4iCKuSsBcSIQhitbDIfV8
         DTpo8lw68/CRODHT7RFH0aqYaL/xA8Bh5uo0LTvwAmf8hFuuV8vog/GzM7LQUlVARhM9
         yMJn7DUXaQgfmyl+vLocM08eaouNu5OFlIh6kkbDId7lmT//dYRLXFrlc5KjsXwxJ1AP
         qWltJeGmCIesT6zYnmF2uzmYdZZ+E01r8pgSrrNi8JyE/r/KVko80SySnGOhzBqUmXS7
         8NUAzydQC6YjGLH77we/afZVdPCjGBWsMYtgg+EdV9jMdD4An0nyRxPxGHfX1hfKCKtd
         SJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595946; x=1795200746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Po55cXrE16BxqMC3zVUb3WIMlK8AUcbgD7z5RXqz2B8=;
        b=x9bjJmXYjHdTc4jh1IQo0Wvx4kKpH3LmVjbCo/QPERIT98RJwq8/TwK9wauO8sRXbP
         xpe2LDsNzR2nlIpSn9pZ/at/fy0UfJysrNg82tk46pLOVzms5y01o77qfWl3xB7KofsV
         3X/pLDYPnzQHdlaqmbL5BQfUglWks+Z+zX1LsKRqC0pCadE+XX2QFRDl6fuFv15uOpPX
         4qWsC635EUMXYOafW4igl+1NAmr+AuMHUtkRrLj2aeFR6hqWmSTwq5NZfk6nSAEyzv8l
         ZA4ffD+hNO+hASoD5sXx95gI4SkvAmLKBEtqVu9X2sfLVg9nf2UQNRV7YE5+xfCHniYl
         HzSg==
X-Forwarded-Encrypted: i=1; AL+hErHiHx70fhZW3QE9fjXUVthZu8ruixxeyko0lDFeJVfUgfHPC8P5dXV9k9EWr4YOZy0r3T1nSnr0QSjFAoQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7ojvX/KdUb2s+7bmzfYQRYdCQSann+swgXBLA4hrkq3fwVQpp
	RCs6SaRdYn1uf8XWAwc173IgbcFiBlxMVTGFsH77pfk+ZDVntuqjCpL8kVNWpm4bcwtbOdJ3wr7
	XsrPUhZZfSsEu6fyWdhum2hkhV1k//0PV0oCIOdAHFzaCZRk6E4D7fXnL8hUrJhGAj+NQghIaPk
	k=
X-Gm-Gg: AYBFou0saEXUtuCoB8z7GUYUYdfWWvjVLcwAApkcfgcefN80AqEsvRpop309y+9WHsw
	9Obb2YJpGMRlU54n3G5p17uhORYwpX2H/7ZOPxmL+kNjxQtznin1qtTxGYjr93KA2COsg782p8P
	iUw2lB+ti6EX55iWe0Zrv38ry09Y8lG79OmsbqQolnTgCYkqK5bvI/P+qKnJaiIYgIJGya2yfaL
	ijjf7Ur0l6/ogiBCSi9AcE/CTQjCMaVrlTIKgFcMjbszztqL7Rnp9Rd/5QUGb9khtIzG3dZBA6f
	c2QJGzIyuEMKp7FPAAh1oOXM+SsT2S3agyePFHLXUId73tqGHsDJr4XFY+E+S5+2Eh4DN0hP9Gx
	plxJVhj9GQhIC3jT5Ljoo4wQrEHIrH+irmBafZ4f8KiPj5TnfRlIeI2WS2Sox1w==
X-Received: by 2002:a05:620a:6845:b0:93a:11a4:223c with SMTP id af79cd13be357-9494ba5f250mr568069485a.9.1794595945266;
        Fri, 13 Nov 2026 10:52:25 -0800 (PST)
X-Received: by 2002:a05:620a:6845:b0:93a:11a4:223c with SMTP id af79cd13be357-9494ba5f250mr568065585a.9.1794595944804;
        Fri, 13 Nov 2026 10:52:24 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm7366316f8f.45.2026.11.13.10.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:52:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Conor Dooley <conor.dooley@microchip.com>,
        Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Yixun Lan <dlan@kernel.org>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] riscv: dts: microchip: Correct missing space
Date: Fri, 13 Nov 2026 19:52:15 +0100
Message-ID: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1361; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JnAoEWfmUCHyEt5xBJBkALlBOEpkhVPyvMi6si/XwBc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91xedNFYif3mvamZgoOwZEhiwp70kx3USlRYe
 epfxvKUHIaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdcXgAKCRDBN2bmhouD
 16XaD/4iNP91Vbd1U/v0zXTsKKKPppFD4Yojr2ttV/+VCgvjy56F7/doRdhxru6CqGUnox/adzc
 l4zf1GOa5rMH+SkUe6+KQOwOhgLEASSlWI5biKzt3pc/VSuxEL/RRCirBjASFiPJc8aSIYf1zb5
 CNzvhfzG7q+B578o57SkzG3UomSp1JHNA2Ndf2br9XzPYvu/raH0QWHIVNirgekaIGV2BkE+DGB
 UQd87Kxgk8ix4Ub0FZYQ655dgh09Y+IV7lwIyTc/UFW4YpdXlHAdNFL7dLJsO/UDmA/peYmEK/y
 7DN5YCfylN+xC++Vdh8HCYEAtnQvKqzLDItVg/uf8DTOQZr9NP5ZAWdI6HN/x6S6yatZNvOw+TN
 ad7+yrq5HilDyAzuOQQJVDMXKn6Lh21djfFh+kxlkTMuCm9kF+3f/EF/aAtRGeOsM2CVJx8tgQE
 gxqd5ksxYe8j2qlJKTJjqN6EaYanTXdIbSdm1C6GLuihQ19hOtSs6gfzTYRKJkFLuEtC0A1Gtim
 OTAX1iYhDhaFbZAnkRRnt3Tye8olTdmIavvHVcLcVIZoe7nqzQh21DYVQJybCWVG5obnAzJGeuS
 zlKW6nkI6QulWBfDik34wXQCV9sI7AwYPS8jKEANul/sUqykne9VXHRqTiE/lpWjxwJE39+i5fr hjD/NmwhyeXmi9Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af75c6a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=d8qWwIobHd16qk65SKQA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: eQ-dsGTdZO1fjiy7aGVE-T0gAbZ3kIdt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX65KayW2OVlY3
 r9WDUB99dYGlB109MvfZsqJKsNZYllrLhJ369TxLjmMvfgHs0U2PK/92WJ32CCzXQswxz2jagaw
 bXV0zejhYKvSTR7QczIMknB2pYJ0rl297Qyc3cY7/x2WfGyh/qvk7o05SRLihhHIjb6tEZ/p8t7
 +Bge2MvQWBsM5hZ2l5q1lQCn8nqp1DdI+6L6Wjv9xTsFNdHLgIBZmHTetwrwC7JPETy1kWzX4Mk
 1TGsUxipqQnZSZIUBIQUmPLVQicn+4QvQk1aeb78oir3D6x7rA3VrdRlfGoZELTWcHbrN3kDkwh
 Qh9Wi1+zVKkd+droZvtBrkFIhjeoNllrirlnZ5iAthhtq7p286GK8J8b0BpLKatXog7GaUNLv8H
 HKdYpXc55nu8fb7GRsbPBVVw9yXssnan5BEehqrn4Upo1C5ASds5rn1qhC2j7TDAnzditlREsfA
 F6MvFeppYwgJAhrgFFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX6irtZ422V3fo
 iRacsUxMcG+/lIaRQy9AOa2/UOG60Kj+RfoUZqgFYm6ac2g2MvbSqhWPiBAVJsx2lbpf7EPr9Pq
 keF+4fJfbL1cQKqha+16CTsPNLR5we8=
X-Proofpoint-GUID: eQ-dsGTdZO1fjiy7aGVE-T0gAbZ3kIdt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

Correct minor style issue around white-space - missing space.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts b/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
index 180fd8891903..2324d567de45 100644
--- a/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
+++ b/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
@@ -63,14 +63,14 @@ hss: hss-buffer@bfc00000 {
 };
 
 &gpio0 {
-	status ="okay";
+	status = "okay";
 	gpio-line-names =
 		"", "", "", "", "", "", "", "",
 		"", "", "", "", "MIPI_CAM_RESET", "MIPI_CAM_STANDBY";
 };
 
 &gpio1 {
-	status ="okay";
+	status = "okay";
 	gpio-line-names =
 		"", "", "LED1", "LED2", "LED3", "LED4", "LED5", "LED6",
 		"LED7", "LED8", "", "", "", "", "", "",
@@ -81,7 +81,7 @@ &gpio2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mdio1_gpio>, <&spi0_gpio>, <&can0_gpio>, <&pcie_gpio>,
 		    <&qspi_gpio>, <&uart3_gpio>, <&uart4_gpio>, <&can1_gpio>;
-	status ="okay";
+	status = "okay";
 	gpio-line-names =
 		"", "", "", "", "", "", "SWITCH2", "USR_IO12",
 		"DIP1", "DIP2", "", "DIP3", "USR_IO1", "USR_IO2", "USR_IO7", "USR_IO8",
-- 
2.53.0

