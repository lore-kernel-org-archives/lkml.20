Received: from outbound.mr.icloud.com (mr-2004h-snip4-11.eps.apple.com [57.103.69.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B058133F8B4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.69.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737375; cv=none; b=ShDQOyXF8G9PjKjmM+xEabM86oZGZR7jZ7z76LLfUuKP/Ydkg9rXc3yrbdojbXEBd3Ae9e4O+kPlpeWcEIqsXaN3u0jhhuZbqInr4M/6QOoF+UqNR+i6OxfH+u480sFBTRLgyiSSsF/2//aWiYPEHNS+kt6y3UF4Pent3aYlYcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737375; c=relaxed/simple;
	bh=q/zqiDVc2G2Ts4UQBhVlgEqKoOiWYkCaMBgrAaVuVAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i5boMmCjUKelA6grNmw//zTHumHSUqSiRL08TmLD9I/+/1p4Fd3rFA1kzGCCOrPhf4wBrjmAm0zCl8tTPxGdtcaMqqwPhGQ5Uaz83WU5cSlxnT9YBLr9aLoU01ejwxZ99W8+omxQiq9l9LRn32n+diy7dTNuRBQ9Kkg1bGN80Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=HPKQ+Cv/; arc=none smtp.client-ip=57.103.69.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="HPKQ+Cv/"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPS id 610AD18001A0;
	Fri, 18 Sep 2026 13:16:08 +0000 (UTC)
X-ICL-RepId: 01a0b4a8-fac5-72f2-ae97-f656921d7603
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QGUx8RTxweGwZGCl0NQQpaAFIBQV9MBlh3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789737373; x=1792329373; bh=47Y+abC84b0nPqFaobxwpwVZjGtGLmkZNObB8Q4+Sp8=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=HPKQ+Cv/mNjzH0NrxCcmd9V3GvSTAQV9bcJ38HuaTbK/a72Z2QP9RHRcteUWu+x2bbw2nUE3oizYmwqUrDHycjNu7z+/1nu2hMcZbixfzIudRxYCOAqOtaNOD0cnzFLDD8qMvsvIikf/XXN99dk73fvyOydF3EimsOrYDLurGDOeKT7EW00UvXqpMkS6rHV4KdkgwPQMnvfhiA+nqlMpcGqR46wNjGlUupzmNM2uW2vwsHI4QjobBXrAjJlFR8XMNQxHifnrk+i7nRRuFn6ISd/WW4hjZr5ZE/aG/aB2qzpUHcaGksFDr8AzB7KtBDSvhffygMKztdNkz+BdHFdmGQ==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPSA id 4015B1803F02;
	Fri, 18 Sep 2026 13:16:04 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Fri, 18 Sep 2026 15:15:13 +0200
Subject: [PATCH 08/14] arm64: dts: apple: t6030: add avd nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-avd-v1-8-49977931f455@icloud.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OCBTYWx0ZWRfXx8KcFuXOxts9
 6fLlhOqY0LqHg6fPxEqJo9bW6PfuH4vp3Bo9q/jNas0OUFRnDO/tu3owcrXGCbObtXBNTCPWgKv
 LaY0uOJBJDSv+9xNDwxYKSMWVbJaIOoPpZqCV5wy/Cr9XuECIFSlUH0bH02LBuAMWHjkb9VzzHD
 jslrhbyrS3jZ6GGvNqnAv5yBO/v2RGYp1vIYGbURJkWIgRmqj54FpkXqcPzhK1Djg2mZz8aDpHw
 OCU2/9l3IXGY4VZj89zCiK6aj+5OOgqsTtb8PjADYZfv+PhPEBCDgz+W5CXblPKAzO6NRoBnQvd
 GCDuR65cRvYVAwk6u8+JEUrefK/lPMby1rklbTrzdEnOwtIFsPwXQle/G+51dE=
X-Proofpoint-GUID: 8o3dDnOjxHtPpVbur2C2OjCvqz7clVvX
X-Proofpoint-ORIG-GUID: 8o3dDnOjxHtPpVbur2C2OjCvqz7clVvX
X-Authority-Info-Out: v=2.4 cv=J7anLQnS c=1 sm=1 tr=0 ts=6aad399b
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=cgTWQxKMTSei56T5cz0A:9 a=QEXdDO2ut3YA:10
X-JNJ: AAAAAAABYXN0v0JF1mxAMCDNkV7klo/JQZnw7K8sW1zzdqbOpKKIY51y/x0di1ueJrVib6bDJIV5cVymcYon/WcW19N0p55/ynmAdO81zYyjlQztIFmfymP4fGNxcc5cqLnB16tmQ3KTQgj36EeOBiKi4ZuijEMk2tJBLVrngRWgzevDSIEZKM7aZTOOR7yzzdd0acBiWAN59uS8gMTn8G9l47XhqPTU+j18QQzgFuMRPui6JEjhFT1y9k4LxIN44aUnUwwMvzN+2P1S96bv05rMIHnapAtt6tqkibSazABXf5AH+GsBoRKTmiMURsRAGId+m16XJyO07MGAjUPLgSHqo3CgNmgnhOGkpPg/sZprLcXfAchoRgo3q8GCc7lzbZ6jXtxqTCxe+zU59gr2h/vKYBtFVBxotx+fLnXSOsHFwjJer9c+PG0Huu36iErYo5y6D7NXhloj9CcmXc9muRgtLcOtbkxpeYODbxqomNIHUbq46OPFFRol9G96tZomz7xNOt2Pr30PLk39imxqQ7xLsq6HQyeJKve3oJhqBB0nKJ7AbYm0j/fyJjuXiO+EgEQ1nBu2vQdhsnBJfAL3GwWW8ifmQ8p/c/tyMcAJd+dkHySEgyIOwNxPUtUv89zlceLkSgqGoUowgvAaKq/9LLY1uENycLc//LhDw2T41xCeJb/oJgph0ermG8JVtg7V14Mbo0osQzyChxmVA5CwyfXdsnrGQBiu6HOQZdIsGLP85KvZKWet5X77p8E1KMYMEtz9l08kzcIW7vu3xhXRlpfQUQekYPUyZ5gpfBg/x/7UTod9LIbSR8QaLCQLxxzfkvx4N4pe9InVF9Y1+phuSdLSUi5PuwURfl2WJw2rJGwclzHPHJ7yaqydNPM+WpPssxpiZko=

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 arch/arm64/boot/dts/apple/t6030.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6030.dtsi b/arch/arm64/boot/dts/apple/t6030.dtsi
index dda9568af11f..802759a2352f 100644
--- a/arch/arm64/boot/dts/apple/t6030.dtsi
+++ b/arch/arm64/boot/dts/apple/t6030.dtsi
@@ -361,6 +361,30 @@ pmgr_gfx: power-management@290e80000 {
 			/* child nodes are added in t6030-pmgr.dtsi */
 		};
 
+		avd: avd@30b080000 {
+			compatible = "apple,t6030-avd", "apple,t8122-avd";
+			reg = <0x3 0x0b080000 0x0 0x12000>,
+			      <0x3 0x0b092000 0x0 0x12000>,
+			      <0x3 0x0b0a4000 0x0 0x4000>,
+			      <0x3 0x0b100000 0x0 0x10000>;
+			reg-names = "code", "sram", "mbox", "ctrl";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 788 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 789 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&ps_avd_sys>;
+			resets = <&ps_avd_sys>;
+			iommus = <&avd_dart 0>;
+		};
+
+		avd_dart: iommu@30b010000 {
+			compatible = "apple,t6030-dart", "apple,t8110-dart";
+			reg = <0x3 0x0b010000 0x0 0x4000>;
+			#iommu-cells = <1>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 795 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&ps_avd_sys>;
+		};
+
 		pinctrl_ap: pinctrl@347100000 {
 			compatible = "apple,t6030-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x3 0x47100000 0x0 0x4000>;

-- 
2.55.0

