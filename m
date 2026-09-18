Received: from outbound.mr.icloud.com (mr-2004g-snip4-11.eps.apple.com [57.103.69.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94924F3EAA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.69.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737365; cv=none; b=kctnMMvYPJgA3omU+8TUxZ/ibVPDJyHPfQL6xVKMFVB+qA/6TaHTrEvdx7QT9m2OTX6jZ1Me2lVYDJwi0zpV5qGgAD9LbbHrwHjB8zNcts2p4M2NPQiWCt8jZA4XydI14Bq4w1HrSA+xfZOW6VBk8rnsXizb/IUnRB8ApV5F16w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737365; c=relaxed/simple;
	bh=STZeiuLpxXikoyiJ+Dj31oaGX4y4PfScw6CAI0lohzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GLQQdVCBolQJlJDFUhuaNaxB/TmTEH58wDMZq1YwnF0xLgNWRMdyFfF4/hBcFqRN/Nwk69QBYLaE9TALDS4jSSsrbtM9y0M0MRa+FafrQBfnsnjWNDSKIU31an69ePdZdaYWr4/nZDdGrmMevvS737q1pbbp2YbZg2bVrqfw4Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=ZPr/3x8H; arc=none smtp.client-ip=57.103.69.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="ZPr/3x8H"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPS id 50F5E1803F05;
	Fri, 18 Sep 2026 13:15:58 +0000 (UTC)
X-ICL-RepId: 01a0b4a8-d36f-7c02-8bb2-5f5c8bc3b9cd
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QGUx8RTxweGwZGB10NQQpaAFIBQV9MBlh3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789737363; x=1792329363; bh=bb7gjNY1TJh0L+7hwacGVwUms0sg5mEpeHuTP2VeTuw=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=ZPr/3x8HNNAr6BdpXrgioqsHdKx2cRRH2W9CpVPNDAWRYHj3SimsY8sxE85NwPoHpxiDPtuAVPC+r1ZjlzSSV87723McKOzoVLFt8Elo/FCHbswIekob3Wj4/iG20Tnqg+RP8xG2HnwpaNcNj3D8hE+XchLKvpiu/PDowblBAK+LzbP2vtP4G4HeLVgs43LjRIIsbczLaVbhMDuE1nPH+gvSvnHW/o72w9g/YETDkkZc3oUD5SyjIj0RwTW4Kvu9bsxGXX/CQ4EPpaeXWwIBBA37llr2R6ze+0/ee0gem4FpaXl9QgHwrye4LUdgm/yxnaeLG2jeyQ2pJ/kDKsddZA==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPSA id 726C9180087C;
	Fri, 18 Sep 2026 13:15:54 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Fri, 18 Sep 2026 15:15:10 +0200
Subject: [PATCH 05/14] arm64: dts: apple: t8122: add avd nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-avd-v1-5-49977931f455@icloud.com>
References: <20260918-avd-v1-0-49977931f455@icloud.com>
In-Reply-To: <20260918-avd-v1-0-49977931f455@icloud.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Sofus Forstreuter <sofus.c@icloud.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OCBTYWx0ZWRfX6upwgzlQtwco
 9d2Srpjs8EpL8ljzePNCXgL9ixbkI0N6WWjDndOETJ/RcAtV/7suFct3QfaFIdbqretGWxNLQ5N
 ufnH0DZfwi/a8LOwN9yuP/bJtzWGLtNvvvRajLNeoQA/7H4lXRGqkZ9sZy6GaQb2wSAVL+cA+lp
 fxMpN6y4nOMQo21W0+BzFAL2l5+2YWHLxuX8X/Ug9zHIvQ5yuRy3+dKWvE/JBWVweJ1IpmP8tTd
 LXKa3YuFomof9ZgNuY2j16pjUusLQaJVI8pAWauk8KLRjK8NRxbmsgm053uvKVNxs/jQK1WX4u3
 3E3xM4JsfYoUG/cNkB9rS3QqkaK61RNL+NRpC8AuHNWkwtNld+OmN+cAD1y8Ww=
X-Proofpoint-GUID: Qdtbt0fNZL1EnArAXy4qUHl9Ua-Xo8K-
X-Proofpoint-ORIG-GUID: Qdtbt0fNZL1EnArAXy4qUHl9Ua-Xo8K-
X-Authority-Info-Out: v=2.4 cv=J7anLQnS c=1 sm=1 tr=0 ts=6aad3990
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=i4oxPFHrzJf6BXMseXkA:9 a=QEXdDO2ut3YA:10
X-JNJ: AAAAAAABud3k+e5G6r8lXO4MGcYM5/49xSzXdwI8rLn213BFMkAi3zhbOfw6EZD4Vd+DyRJO3HYNzTCuLwKauCrijomMva4DYuWCJZnBF9vZIDICOdOd6t1s5QaO3k+n8lge0H4C7t43Nd51zWpTmQktyLY+8A/LeJ6GcfpZKHPqvqlIuS8GFloL1MM+m/K7Hg0acyXPI/emtm0sJ2bXe/VTXqJ1sjiQYBlyWiRGSrn8kS7YkMA192zA0cNTdIhMxocjf0sGt8Zl1WqS7RoB4E4HtgQTPlCfIJ53oHQNcm6YMTczS8wX/exuNuys8jUGyAlEfY8so90K0GJfaeNcxMDt0C7M/OJt1nCVDse2woTXMQs+/45Y94JwVogypIA01KMPC1rGQEwqT8ee+kITmzd6HWLVo66pTML0VGValk5IcOp9zGmuReKB+EJ1PfOSCuyDUOB/1dghLHRJSKciwH3qdnFgfyj8zIO+odgxVguGo3rkhLHitvwe4Bs9qtNMVX3EPglQPC+mTB52M1bXT3YAXulpT8qZWjxVqPBkEBdSdrBRV8qFl6HmVNFEXjoOd62eG6HoD7SJmYNZSD/tLis80dfO16sPl2I+kiLzs2FopwpbMAPpip3rDJHaLvPSPdK2grOzvoie5nq8pu8XW1+5UD/DyxMQYBFinBTpmv4v2WFpgZaG5mSj6Jm1dOFbR+e2eVozEAkRMjsLHsPJHtd5Td1jDsRxQNyE4DuinHmPG8c3F0dVrhOGZmT2Sl8WN5aVo6Tw8kBlpPbHznCi+KY5uu8UnLAblPiYhGNohHJJ98vRlYtHTUaiONC8OtCwWD/M3P/Ys5KU5Cj8CDPJcmObYV7tdzTlg37/p7yfYzo5yL8pdFjNx39YdoygGTC4BtvQ6QxiIQ==

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 arch/arm64/boot/dts/apple/t8122.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index 1ee61c5b3409..992a7216b2ed 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -256,6 +256,30 @@ i2c4: i2c@2a1020000 {
 			status = "disabled";
 		};
 
+		avd: avd@289080000 {
+			compatible = "apple,t8122-avd";
+			reg = <0x2 0x89080000 0x0 0x12000>,
+			      <0x2 0x89092000 0x0 0x12000>,
+			      <0x2 0x890a4000 0x0 0x4000>,
+			      <0x2 0x89100000 0x0 0x10000>;
+			reg-names = "code", "sram", "mbox", "ctrl";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 680 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&ps_avd_sys>;
+			resets = <&ps_avd_sys>;
+			iommus = <&avd_dart 0>;
+		};
+
+		avd_dart: iommu@289010000 {
+			compatible = "apple,t8122-dart", "apple,t8110-dart";
+			reg = <0x2 0x89010000 0x0 0x4000>;
+			#iommu-cells = <1>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 686 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&ps_avd_sys>;
+		};
+
 		fpwm1: pwm@2a1044000 {
 			compatible = "apple,t8122-fpwm", "apple,s5l-fpwm";
 			reg = <0x2 0xa1044000 0x0 0x4000>;

-- 
2.55.0

