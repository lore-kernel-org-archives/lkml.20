Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595986;
	b=vSC86zvMi6JSqs5vCPaGBhfTcIUKD3bvN2pRHXAz6RWC85QwvNQ/F9VuJZDbMP9g7gqV
	 XcctCBkYF/W0EFdGVGxSR+OVgzBJ5RGNmrV/rxCWmNZCJTCmVb7n7C/wNnxAjfUkcqTCP
	 cIZdJUm0rE2uNHMPKlU8rZqIvPTq8Em0ftEyo6UgzO2SoZoy+LU6xkLVYSxqHDzV4aGpk
	 6Ojx/jU3HuXaUSPBNw+d35dZYuP9ifemm6/xlnLwM5ZLtK3bUf2YBTsUezmvCow2StcaK
	 7VvNWl/7ueIJrTYRpXaNQKZtFjx5ccX+IhgXqvfu1pQSQVV2VNJx9QC4gTsxjBouFjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595986;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oCg3H0K8/dT5+DN6QiZD15kJMTnaUpl2kbViJr9j8Gc=;
	b=xRa/uTxIWo0MYeL/E3Fb+OpiVrOHAofQ98RTLNRrX0JQ+KQf4LdGJXsprUaB+uRzE8ZQ
	 YSOzFHGdQtahd+Io/GhWjlEyzb1If2C6u25JXxUzCyCQluqnCijyXCoGdjP41BI8tV7UB
	 Ri75zamhag/nXbQhrG8agkXLV4AZvE5AJhthDXYj5EHU43iPHkw8B7xiI+ts9Ou1qyd7A
	 6Cl8EQW8efeo/TDWJc9UDn5F5PDYybq4NP13gMYA1Xw0AZoLJ1SxQ1c0fkRID2udtSLUZ
	 qyVi2Evlwj+pWixV6/dMPP/jh8VMPwf/4EXk08tjgIR4N3aKRbY3OZJdncoGnrYQcSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Lm/6J2bS";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aPFMUfSa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705B5606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 705B5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lm/6J2bS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aPFMUfSa
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRS2o3296068
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oCg3H0K8/dT5+DN6QiZD15kJMTnaUpl2kbV
	iJr9j8Gc=; b=Lm/6J2bS39mi/8jY2nPG2dm3lnkbva2OlyFU5v5htN7Z+k1UFWq
	+SMZzkYnIBHErHV+xx9G6r7BwGbGaQ3k8veI5kUPN7Y0wWaEMSl58K8GNb89kkJl
	HdjlH9WRysOTCUGt0U7kqFPsV3W7n7T7ENO51W+v5e2UhU7rPC5CG0u3ilCTzduN
	tSV09vVpzYf6IuhhrhyLLTl3vqmdsiJF1NPJOUzZkEdYxhkVCaF1gF87pUVZNnY7
	147r2RaElUoiprfO1tUyxfd2G8J33KocaS0Svp0bB38k4zPSqtbCs5adH5M1WUco
	NwAvy34cS1cCEq999jwla1M2bXLPnRwjz/g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6tph9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:53:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-943e8ff02d0so141922785a.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794595979; x=1795200779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oCg3H0K8/dT5+DN6QiZD15kJMTnaUpl2kbViJr9j8Gc=;
        b=aPFMUfSaUhR6enKJ+sT2F6JqEXzN3dRPOE5Ymza8IOXtRZcWGeXSZGbfrpoVEXoKjK
         DxKnQEE18e1TvYn93RRx80s+KJlGEx7Fxhh8tKuysCMOO2e1AoPMMgrieGHgSGfqeGI7
         Mnm113JOP6LnTXITejumcmyO/IeTpUsBEwD8ujtAqiIS7bm446WlLB8b3KegR2YrkGuC
         KnpbR/ijEdh4qGLbdRS4L3byEIZi1MpzOs1HrcXHQTwS1A13VWwDPuwiMIYrZ90FPWV6
         ce4Wyrptx5zy9qtJxJmXejtZqMvv+UkjHL1LHmyUki0dW5fZVMKGkTSNE/unZlgpuU50
         oYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595979; x=1795200779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCg3H0K8/dT5+DN6QiZD15kJMTnaUpl2kbViJr9j8Gc=;
        b=ZFDFnawa8fVuifO3Hrgwe+e0m+HzZ01CGSCc0mr3vqkX8WyYcAmPLgLUa5qO/MHUmN
         5xEN3oebMhpGkaec774hykIjjKF1YhArXTce3X4AyaCkTgleoGRKwVhQwm5GiyUz3sT6
         ziK9cqXlabrjktNvkw1sH1Oadfy+GmJVXv8qYRxt8KcvH4rLXX5Yal5RHVptk0ObGgak
         4M7OgOWpagvOAs3PtpNJWJqj0eaU8230libhbXd7NnQri0iXlskEUNIZQz6swp+KlYKp
         25FBlNwkv5N3083oFO5z51a9ij+IwJAXuuHnwsEsCCZ5tUhZinAe5/8Udo96q63ZIG7V
         ey8Q==
X-Forwarded-Encrypted: i=1; AL+hErFYudJPZKH9Svr+cd+JxQaTlAC7p8riZhQ6BGFMB56eqtzzgC+jzp++gp2UP0uWQdjUFp1AStCqkekM9Lk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TSPervY9qvFlMg5pLydGQi6c43v0OP2QZRVK/Rise42YShgaY
	lBXfXJBuZvHjcf6ovCgdsl7aNVyWAsLnSM1pgZG7/QVAq7Z3lobVrUtEH2JzkvtCijcj3NQJ3cC
	rrjfOasryMDiLI0uT6mg1DKmc0u58kv3vh8JXjEu6bacJxkJ4oUw9EvJSoIqCOdJ0qrU=
X-Gm-Gg: AYBFou1aCPM3HjLlki/YDUn47XvkSlWV6BARTeewG9HwrbWD7wZGcTcf5ck6wvDqc6o
	8uh7Zcf9uNhVwA4XnGdnyGpIiSuqXIp3sRkUMio9K5vCm9+5I5mU3s/Ph/Bo3ISid0DAsS5oDSZ
	Ofvs9rRXzlWzzsGKQtTKN7KHk0L3fLMwb0VYsAjRyyvPLoK4bBOBms3UwWWIGdGptUFAV1RKUiR
	1BSSpS2XnbwY0IwC/jtfCLnoIEjP41xT5T5avBIuvO0QGUGeFBFiMdlpBr+YMwgHDuBaJ5sdr4t
	ALkalYInHF87W2lZUcjfTuHjXt+PXJh6m7HQWFVcKz90Y4OjPWZTl4TsbEwULU4gkXkFYfBWx5O
	UuHtKxa50oSyOtjpv7o7pvt29RkImQfwvyP0ECpJpeRp4xF6YsE7qKpG+jrWOMw==
X-Received: by 2002:a05:620a:1b9a:b0:945:e46b:15a2 with SMTP id af79cd13be357-9494bc1c1e0mr538295285a.49.1794595978756;
        Fri, 13 Nov 2026 10:52:58 -0800 (PST)
X-Received: by 2002:a05:620a:1b9a:b0:945:e46b:15a2 with SMTP id af79cd13be357-9494bc1c1e0mr538292385a.49.1794595978290;
        Fri, 13 Nov 2026 10:52:58 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8c248sm6535092f8f.58.2026.11.13.10.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:52:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: ti: k3-am625-var-som: Correct missing space
Date: Fri, 13 Nov 2026 19:52:50 +0100
Message-ID: <20261113185249.182956-2-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=678; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=1VcRjShmzCQ/6Cz2ewufNPyK79L8y/bvbj5XBbIuRWQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91yB9mfjVxuCnjLFqn/EQtVvQdrxrUog+SeF6
 LpX4Zt2kqSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdcgQAKCRDBN2bmhouD
 1/noD/9qIfUIFf2Jy0gYgD3G0FQh6Gfhyes/OIXK6GH3K00hUzaCnLx2sOdcB7X/eGaE/DGCI2Q
 ueVPJjh0aeW9e0b39t28To19w6h91BMmWQs7QXdMw57eHoblL5XuiZhWdpEArk8T1OwtpPi7UBd
 G65yi9OxENzJFD/39n7uQuT5yyEh/iImHT+Lb3KRe4IWYG50OSTWaTif4kVHZpIbt6GPU/ZVzeV
 O0crC6INkqL/sM9yRb7R1se7XGfL1hkWb0Xgm6vDPK89gYS2BdFpuf/SB1pF1xz6ktjlsNCQYl7
 UZbL1dIxe+4ClpdqY2iSnWl58QTQ8Lqr1ouRe9BpJYtoN+G3DMGkyOACfwPTHBqbBq/FK28QUEh
 6pMwA1I6tvmcuoSEgoxIckg3EZSSrGhDliEsP3SEHl/W90CqLAIjkpkW5Fa3ejODyktRqMR4XMb
 5pBqZSC5+ZB1GRYH5b30jgsed606JXrhzm9OjDsx+UFIdzk0BvlwBwPpqdCJ8RqN8jGo+uvhZ6M
 nreKwd/rUcAmfcMSgAgrOiqyIwiRfEUSOAe6Eon4VpU4yz5tjB13o41xZ0NOgvgAGqKLN8HFPWP
 CSf9GbQGFrFYTBl6bGDh26G3j+qxef5UN2eVOPvcoBpsSRoqYmnUPazZFk/JZBG06FqaXu01VEf mK8gKp76XYPsL5w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX4moKqdI3oocp
 Tl5g3tLTQsE7kDDPPkX+gWc60Scubo7AO50fzyACqv4C97zIlLDrywhCE/zyV47J+1umyziNUNd
 F6Ov+sTak6ckaLae/zVXlz9XRpqMyAVztyUiweNmw+DXRA9+K+sWQFsMG8LIqBL4XCehzB46jel
 zKfqaZ6WGmpRFjEpfuMIG2xGjgBDcMkWZ8TY4MRgNd5bzMQcd4Orucjg9gfvaMbSYsRQzqSVjae
 kACM57vWsuVYFTaVxwkfEIvCLsOHavr5h+wv1PsgFFCBX/nnWEYpPFb1ZkeEo0IAXqvxpIsA8wa
 DvcF4gzVSCJ6JKfOIP7MuitMv9vKqLq/CRmPjQFGn/VH4Lb5UwKLDivIB51b7YqwxkHZN15UFgD
 uHZI2tEvK4X4Wfr+6YmPfviwC8JkS4sEhyNB5+tedmHygPHHF9foJLnBFT+45Xy+bI6d1QHyPXG
 hZhnnk4HGSvqVBI2vLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX9QwC9Jd6Nvio
 5L5mHwIRqwTH+t2uywod2euPQbxa2DQTAnuwj4+ubuexwBc98rZxCp88BxDIZ/8YknV0vcAl/nu
 K7lXQ0wRfp92QzGCBzRfqmbNWjkUjFQ=
X-Proofpoint-GUID: s5vPKsluKP5DJcBLlu-HL8gGFB2iVEDs
X-Proofpoint-ORIG-GUID: s5vPKsluKP5DJcBLlu-HL8gGFB2iVEDs
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af75c90 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=qLckm0-AbUOrYe2-mA8A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

Correct minor style issue around white-space - missing space.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi
index c23b6a90b8b1..373188911e8e 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi
@@ -421,7 +421,7 @@ &sdhci0 {
 	disable-wp;
 	mmc-pwrseq = <&mmc_pwrseq>;
 	non-removable;
-	status="okay";
+	status = "okay";
 };
 
 /* On-module Wi-Fi */
-- 
2.53.0

