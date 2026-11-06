Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793950351;
	b=ftkrXgpHaekXyJNmquqYBSLZtKK4LzFIETzdZPXD1GSuSY7CQv1oRYFiaZrlNQa6mxAD
	 mEkF/620oGZfHlqHkIFTWcDuAcMyKu7Usgqr880xEqODgbeLmt2wbT/Z5/BbzfaZRDlwm
	 sAIYW5CRuKOiXd6Uf5oRPMdp3otY45CGi7IxUFfT1Bqv3X+r+2p2mH3lNq10wRNWVkIHf
	 dFZ2z7Tc5AW7C+i24LA7fhjE7BAopjUaia7EeivxBYdm0IfQd6LE66PSukaLHbLMD2Wke
	 dOQaPA3IjzPZaCcVunqzcgviB5kGs2Aa5st3FRbMTaX0ecSYHX7i/6tS7GIaP2PCZBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950351;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8OWq4nrNh9pGQOaeGEaLvyJtUrGq9ldLwsWQSLax044=;
	b=VRnKZ/Xq6yvWwS8N6Qza51MVCEr/ThTuXcRWks+Nnd/qje8EzR6crSziFOq3PVHzDekw
	 1j16wJbS2emHL5CssNZK/osU7CeJIH2k7BF78OMFpS9hfkp28w25RSjgViQ/x4KQPhnTa
	 6JXY1X2e/qEhkLGT24svK4S+WEy1cVkyG/qiuRH6H6x6SMdtCAnhtH3N+OPqS+9vLAUg+
	 +oWHoa4JSadyJ1uJtkPf2OiGDIMbhV3zl8Q1YTiFMbrheqir/t3RVE26YBUnQnmA+wTuX
	 5Xu2qXXoU0MW0NDpqIaHwT2fcvEXkwb9rmXZL9PZejtxM8aq3aT/QXyliilcXO47Zxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p7rgPCqY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ih9++FCZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CA2606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56CA2606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p7rgPCqY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ih9++FCZ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RkTQ3883396
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 07:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8OWq4nrNh9pGQOaeGEaLvyJtUrGq9ldLwsW
	QSLax044=; b=p7rgPCqYB+odh+avUO4albsGPZy6z/7BfbD6Kteey/ab9VcrANm
	5+CRN75zF5/ejoRfGvjAjmXTieKue1+9B6y55QJmgFOMnUzEQ8pyEU6Qv1auAjCJ
	KiZxI0/gwrHEMwyuOj9vtpXXxdqKeB65C6ApdtFssJbEPvw0bnVnQ4uxScj7/zVh
	r4fVa2M2uplH5IPaTeUz9MB/wtPmPiH8dwNdx+w7DTRVknfy6cUwFOpmD8fJg4DM
	h8It700mwRdQVB8Pnym8XjfDleYNsYQcJsUjh3jBawqDbNq0PI/Qp2gMjqwBDsGP
	QQMpgXk7RtRnBFLO7WqyMD9w29HHBf3ZjGQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pb1mwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:32:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f26dd2165so127072585a.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793950349; x=1794555149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8OWq4nrNh9pGQOaeGEaLvyJtUrGq9ldLwsWQSLax044=;
        b=ih9++FCZxaFaxuxWsDX7zmGOzP0FZl5enoQiiSjgpXI8Z2JaET8rc1Dalx0Qf627m2
         GNJl2kOJBz60lrKhzOxpEA1Z5kRvxPWOe1ozWE2EbB8rUq9gGasDEDa1Yva/VAPlQk8c
         5Btl320Oh4sMTInOqQuD950ciit9Ikd1G2q3XOpWC5M+tpFl+JGLzKTh19/ZVwfK+l2k
         ZAuXVSRm/dKO4IkdzWWrpnuBSOn/FJtOQn7AEJ+eST56S5MKkCxO3uTJelagJ4Vp3ZgJ
         y/SyGHbwHj1kV0YBSZb53VhUDqrGoyXwu6KHLUB3YLhx+oAk2/6TYdgOEY4imsjFxcC5
         EPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793950349; x=1794555149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8OWq4nrNh9pGQOaeGEaLvyJtUrGq9ldLwsWQSLax044=;
        b=JW9w1DGcKfj1LCRUuCmN4WISCmnB5gpcUvjgfCfBmJBUVLwmT+wFReL8EkIVf3InYr
         XVPentA3UQreY9K4xJmzghOQ6d2osSipPUzuwTPdLJfFQB+pdh4PvIChSqDj2a4IjY+i
         nnGFPN5PgDhx170DmMvV1BoYQGguBSuAYaH87crjpPWysysdtmvWI7ZK2DAxcpSoOP51
         miu21/mxhVzYAyiiHASMIXBLjTwns6Lk6Ld0dGAisnpL3vuPBc5Cke94TmYBHi98iw5j
         SuGVQzBGsvsxg7yPf+gcSC/7Qf6szWkHRxCkXvuvwIeV4uzCDIvJjzwNCOFglySBqRJJ
         WnaA==
X-Forwarded-Encrypted: i=1; AKwUvBysIsz64e/zBthfE1k+7o3hqiykZNEwC8n8SLQdvcAtpe6sD0tDtsLSNKda3oYbp/zNpFGXwW6dcQyKqZk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NTWb+xQXU1TjtnlLj5sqaIvGfg9uZOwuT/6n5q9JRb1NQGfBq
	jrEr7VN0nTO/VROWG85H0H5lijI1en9f2ffjNj5Cj2uRwJS5ogAMykKGr1B8cpwWl5Wh14An2J6
	DuvTsoJDzyM5JfrcEytnvUc0Y0DiFQZakefzZhkp9I//EiQ46G7hrQPTQ7wHtG9Ea7YU=
X-Gm-Gg: AYBFou0rkuo73wd9Cr1tdn7eb8oM2w7tvcsc/pe40nrrJMh6aP+Ln3giyekelNaglz2
	km8Z3juDlBgGEMHtmojkypckhbqVGmd2tOUXc59kKPHuf9jD9hUBDn/Jh8SwinVLnJo7MRyoF4s
	5FUwtrp2GRsiFknnpHM6sVggEnO/Fr6jV/LcyG/+QVDcocqRtrMUgqdzzYKpVokgtf2B/zuIBhz
	fDhamKM7x6dgboZl4B3Xn6DjWV6O6y0dubGOkxgyhGQW4IYuwR6+lkjj8ahtP6JBOFwGzHglOVi
	Ket8/Wc1RVkp9051PZ/aeOlsV95VivIgJS5/zgd6//Z8PnAWGkuZKYDKx9TBbJVetoQYNfpX0Wm
	h3mgJZpZTccg6+1SBlVD2n7aqkC4D60Euc2uJWd+mRlQcCC6LbWSIbA5XlDHNig==
X-Received: by 2002:a05:620a:63c7:b0:93b:ef24:bc8c with SMTP id af79cd13be357-945f3556183mr233350085a.47.1793950348482;
        Thu, 05 Nov 2026 23:32:28 -0800 (PST)
X-Received: by 2002:a05:620a:63c7:b0:93b:ef24:bc8c with SMTP id af79cd13be357-945f3556183mr233347985a.47.1793950347960;
        Thu, 05 Nov 2026 23:32:27 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b73b97d62bsm17070775e9.0.2026.11.05.23.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:32:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mithil Bavishi <bavishimithil@gmail.com>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH] ARM: dts: ti: omap: espresso-common: Fix magnetometer interrupts
Date: Fri,  6 Nov 2026 08:32:20 +0100
Message-ID: <20261106073219.59785-2-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=8RJTDipAJ01nFwlCTlBHgfjxxf2dxBYM6NOhCug9thE=;
 b=owEBbAKT/ZANAwAKAcE3ZuaGi4PXAcsmYgBq7YKEd7E3fFMNJDfyGX/aXcMtTxYLfHhdXD1Y0
 y1/6eXdqt+JAjIEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCau2ChAAKCRDBN2bmhouD
 18EOD/iu3p6fbMbT7YESIgQYYP3hQKINbqqvypfRaCCJqgJnC3WVinnFkZhCyks950A/hL/Yl4v
 tKNRfOBpKstUXzbhditzVtRNh6pdVtJCwqIpDgUly8DT5rnO5NkadxA412P/bf7E1USIHZddBHQ
 cUXeyFy8Mf+aucVD0h0p6kuENk1lq84r7MbcFHUDsXgTDiYYRuYpTruO8yjhp14KrRs3dhuzwiV
 EWBslFSG5quj8dF9fFmHF4PlcPe6llcW3Q8/IasqbV+8Dy6BNFO3gh+f+ReFPfKaMnRHXWtSRH5
 6ffD/WtTuwJ7ifXP2NEMeJotyZ7mrL9Da6PEssKENC6AP7PXqKUbU+ySnvEVVikNrAKGhaQKm+J
 1eH8ifvsTqtKaUNK9+kHd2PzDBnOSg/0lEv0gwrbhq8L7xfy8kdDuAh3MhTcVQZeJucbTfFLsvI
 1NyA4zq9FrbO+/Rx8ibjpm9jG5IL0Qj04Eah8VOsTfBaxNqL9N4PKs3/BiHeotJy7n+DkT/EpGp
 U558FKOL+nKyL7osnzMcgdqrqRKCtY5K8d6LHkjCB0T+1cQoX6FeSsxflAN3r1arHhuf9cMVN1v
 +8jD8EPIMP6sXordQOhN1zNiIgoGnJOe5eF/m75qidqN2PfnUdJ6SgHckC2KtGW8+0USYujIukO bwIzSNGNhnZ5y
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bsJ9iLkJ2ZkjeHNNbGmlB5OUycVhnwzs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyOSBTYWx0ZWRfXw0swGyCna5yD
 bXESx+ej/W03imR4cUla14ASF3ww0ghyNcTkxbkbcqNzcnoT011hp4cyjBSiSOtGoqfokxDqAt8
 BTuhu57ryzHWY4AcVTPKg5yXu99NRUE=
X-Authority-Analysis: v=2.4 cv=LIrz05W9 c=1 sm=1 tr=0 ts=6aed828d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lsuncF9k1chNw8iTKPUA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: bsJ9iLkJ2ZkjeHNNbGmlB5OUycVhnwzs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyOSBTYWx0ZWRfX9LS1vAWnbGeb
 e2V+2zvUTU16dvR2ncrwevvJQOhF+vAe0TtQeTTtJnSojY6nypGDvM+BPoLac/G8YVE+pNvXGCR
 KIm718ajnyweWi9+vhW3/k7kiApToFrzRDBfXEcrGdD/TDL+lBnyMG9OB/tpe3nUytw5UbfT4S3
 lJHYoG+QbY4/2/xIMjzrEASIW8kYWrD9wjNIMdAWaAa/FyPt8W1M+WaVEVTherR1fmRMRZyXh9G
 fAV2OezwA7+8hjHzdzuYTJ1VV0v3PbO5lRyoMZ/JQU9yFT8vYZlXefv4xvYLz1iQKjPtVSAiTsw
 8VK3FC+bmYkQ1UW2qr+1JrKv1D8CXphLIak8Tlxltb0qoqJQWPomtYgBIfMBubt4Acmp+bUbsCk
 H0ypa536I4706Ou+8qedxF9B9FHu40s70AK2OZlPN56hKXNE6Ly3Zzl8r805CvuWGMwiasKrBTD
 7rCZVqaoXuECRIiN3zA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060029

Interrupts property takes a number, not a phandle.  Passing the gpio
controller phandle made most likely the interrupt as broken, which could
affect magnetometer driver operation.

Cc: <stable@vger.kernel.org>
Fixes: f768d54723d1 ("ARM: dts: ti: omap: espresso-common: Add common device tree for Samsung Galaxy Tab 2 series")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
index 07c76a80cfff..881580eebf4b 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
@@ -632,7 +632,8 @@ magnetometer@2e {
 		vdd-supply = <&ldo4>;
 		iovdd-supply = <&ldo5>;
 		reset-gpios = <&gpio5 29 GPIO_ACTIVE_LOW>;
-		interrupts = <&gpio6 10 IRQ_TYPE_EDGE_RISING>;
+		interrupt-parent = <&gpio6>;
+		interrupts = <10 IRQ_TYPE_EDGE_RISING>;
 	};
 
 	light-sensor@44 {
-- 
2.53.0

