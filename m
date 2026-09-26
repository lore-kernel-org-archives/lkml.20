Received: from outbound.mr.icloud.com (mr-2001h-snip4-2.eps.apple.com [57.103.68.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A195A4582E4
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790428604; cv=none; b=k2UzdhhupM5qZOMLg0TwWJlrP156C5tyUKaZPFWVOmJEwODX053Lnpe0AQ475nM7qGd3yUGN0EQnDlMh3gEFGXHyEXUoKWVEPkw9Mg5XoJpAJqlzCkuT21aTr2WFQKy2RNh1ELnxnGGO8I3fl+p7yVqnl12HLIUR9+e8fApKGGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790428604; c=relaxed/simple;
	bh=LyHgrFsqLJUAgwROdguWlDFUQpCv4lu+5Tse/hPQwmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uYJqHFrY8pInqYkFGX3XJfwpdszIdokHKLl/5ULAqssqbXRiACBHyYKXHrGjNgIoIVnr3QOuCzS6IbY6hjRK3+Xcm0aOPZFiigzf7DLIEKqAuwCUqFKao/NM3ak96Pe2xXImYQ1x8HWOEqceMAuv288WFGdSpTcU82nlmF/WZig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=xczlLn3w; arc=none smtp.client-ip=57.103.68.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="xczlLn3w"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPS id B56A3180056A;
	Sat, 26 Sep 2026 13:16:37 +0000 (UTC)
X-ICL-RepId: 01a0dddc-4da7-7781-9f64-2fdebd52dd8f
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QFXR8RTxweGwVGA0IUHVAIVQ4EEQpOB1VSK1sTVRdGCRkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1790428601; x=1793020601; bh=T4HitPV9byriVQpWV7I/a//gQDngv084Woi9K9fV+DE=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=xczlLn3wpZtMQ9UWAkGtlQIIeFQrBCw3DEHPb2vbKS6OeyMw3nUxgSuHpvHEXPwqSt4pyuHQZ3VjuHgMl1tdCYN/SUJoQxbF0moJJ+QNOabkiKpwjpId8OwS5I/z2bk7DeeOR612SSaAR00V+dxKdHwb5yOvu/rBoO5PKAn+Xdtw7lc/M4tmM690v/C1uiz5FZGLT1Jm78po1mQ5a1MSpsvy/0W824qSp2Zc2HEXWBaT6LhQuRefLU+1NIGyJCpRGkcjW19KM0KP1LtRBcjUFeVCZExj4OrsntSBWc+OMFWfPOkUhJbCnlW2YLANusZ2WCS0c6X0tMtqPhXUbTPPxQ==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPSA id 69CD718019E3;
	Sat, 26 Sep 2026 13:16:34 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Sat, 26 Sep 2026 15:14:51 +0200
Subject: [PATCH v2 12/17] arm64: dts: apple: t8112: add avd nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-avd-v2-12-ecebe6a3648e@icloud.com>
References: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
In-Reply-To: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sofus Forstreuter <sofus.c@icloud.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: ynZyZHbWWrSsmysmbq-fu3Y5yIDHAr3u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfX98dmMm236Buz
 qA3cRSxzCXD5QdTPqrBN2MlPPNnYfM3mlW0o5lLHYcWuCYaUgiihzqHZ9z8fiUHDxMQtTNjAOOU
 LXAMRk5Z2bNV7ZWeCvDNKRuBFEIK8Zd9dYMo2cGy66qLhMninJ3sFNbtQR/yWb5J/sIqz9hX5Ii
 ivt6Z6WB5Q96FuT9ItMrjN2lO4eU3yyANrqeihObIytIcDExuQRbzqtWlNoBso2+ies/eBmkDdP
 Naxdh/9CpK+i/vIOGJECSFfALR1ue+JtJQwjOguGw5NjG0/55pEKD4ec3rVJv6WZXtLekWe5ZIH
 tusfSN0Ij5Zh8dOlnb4u+HE6KzghV54FN173h3oB78QGeap9AB0uWOJV8ouZVk=
X-Proofpoint-ORIG-GUID: ynZyZHbWWrSsmysmbq-fu3Y5yIDHAr3u
X-Authority-Info-Out: v=2.4 cv=JKE2csKb c=1 sm=1 tr=0 ts=6ab7c5b6
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=9kiG86roBcscNhQ-f0AA:9 a=QEXdDO2ut3YA:10
X-JNJ: AAAAAAAB/TZ2BuAN9zk3FepHir42TSRNJK+ozdw5mmu8GVmJQyLCfHGkqqrl+a+C6NUn6hV8YCzP9F3AS01FTC7Lyvd2K+rQ3z06WxDAnLGfZPkaA5M4ldXeR5h2BKcZDVldxIJfuyMH8W4Xs4znK8DqAHzw7GvSbrCrFcjo0n3sZV4N3nxIbmmuwnJqcXUPBhUi3Cr9RyZOchgwCyPAY6ctJJLPFr0UGhwtpBgon0H9dlMMYsfcTmrG5FeXAwCkQZmxVpZ7kWPGfp3LhOdxYHSc3GY46mquV7a6L3YJFiV72brmtrzf/mh6gn7MvIQkKE4Uqj3J6BNU2D13ASKewpOBeJ+MNI2OptH4A1woNi1+xf0IpijPsp0XMawszIg2olasACmqsvGOE1rGb3Pm8Qb4lzp3r/8yvaMplVu/LS6BpHWsD5Hl8pab2JJshHZTAwF703a2th2zYB8qIHifZrBkzGPQqLrpdbqCYD+tu7sevIQUxbbofYUpna3XF0c3cjHzicNQUzsvn870KaASC6EcSpJBkln4rkvUUT9fAScvKV0NI5SjmVHrLo5cMES2TyHMevCq/+Uux9DyBoSBrqWkzkygD+jt+dtHsPUZD5wImhrQ79Y42YidpKv/MV81jpvFsO4OznGizUfyy7OvX96W+6j/WMqV48xfZxWtHwjfEwM/KdkZQ5fZT+2YdDM2iHhsQxjw5ILKuT6j5tHreUVkDxeEaplfSx+kQmq0nFPttJvhJPcDMoX2sjzlWU/QHvbrMMFG3LA2hYRKt5f2rVH6CCMZNSvGjk9jNigoYahBl87Ze3FEqN2PYp3y3HC0eJ6TNRWm6y9S/h0zyoJJ6EWsuqClGAQsvgAfXKSfWdvB/TfO6ngzz0tIJbG81OHvCDMuXko=

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 arch/arm64/boot/dts/apple/t8112.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index ec248ca052cb..48ab71565eab 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -987,6 +987,38 @@ pinctrl_aop: pinctrl@24a820000 {
 				     <AIC_IRQ 307 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		avd_dart: iommu@269010000 {
+			compatible = "apple,t8110-dart";
+			reg = <0x2 0x69010000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 674 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_avd_sys>;
+		};
+
+		video-codec@269070000 {
+			compatible = "apple,t8112-avd";
+			reg = <0x2 0x69070000 0x0 0x4000>,
+			      <0x2 0x69080000 0x0 0x10000>,
+			      <0x2 0x69090000 0x0 0x10000>,
+			      <0x2 0x690a0000 0x0 0x4000>,
+			      <0x2 0x69100000 0x0 0x10000>;
+			reg-names = "piodma", "code", "sram", "mbox", "ctrl";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 667 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 668 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 670 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 671 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 672 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 673 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mbox0", "mbox1", "mbox2", "mbox3",
+					  "flag0", "flag1", "piodma";
+			iommus = <&avd_dart 0>, <&avd_dart 1>;
+			power-domains = <&ps_avd_sys>;
+			resets = <&ps_avd_sys>;
+		};
+
 		ans_mbox: mbox@277408000 {
 			compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
 			reg = <0x2 0x77408000 0x0 0x4000>;

-- 
2.55.0

