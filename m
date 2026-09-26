Received: from outbound.mr.icloud.com (mr-2001k-snip4-2.eps.apple.com [57.103.68.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C5C44470C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790428599; cv=none; b=PhPXMUjVz5u5pnlj4LeOSulfetL+bZ8BDL4mQxqNCCwesxsPU4RN/mal1pSCl24JGR/siIIsCYMsxqZBioLEWoZkNe3DXuA15BkDIbTgdBPHJ3PF6zMlQGmvKM6srJELDftuljkUZ/8T1U7UwO6EJkqGTwQUtIb30brduCpbt+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790428599; c=relaxed/simple;
	bh=dNs5DworclKs4tIQmzWIclqkyR+tmq554SRFz1smRbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B04ImgFA6IAS1hnYnKyOtPAFwA+Tk/PEiIGfmwfRZJtoJ077A26gVP0NA2cWmoJ7F1ygacpZ5jvXno3dHRsUXMhsc8mjqVCUi92cFjjujvP1u16Spc/QIkJU7LhDLLvf7VJmCvYlsXQT61ouMAtqrYNYW83itgXQXo9b9OySDiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=o6Gjqvt/; arc=none smtp.client-ip=57.103.68.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="o6Gjqvt/"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPS id 828FF18019E6;
	Sat, 26 Sep 2026 13:16:34 +0000 (UTC)
X-ICL-RepId: 01a0dddc-4129-7377-9e69-da81231ccbda
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QFXR8RTxweGwVGA0EUHVAIVQ4EEQpOB1VSK1sTVRdGCRkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1790428597; x=1793020597; bh=JV8B0CPr7wbFeRoA/6ARwiIQnWr2b1Bbuq34RlbELYI=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=o6Gjqvt/akhL0M66FbqbXPhQzyTBFwobNlVsC3Y7eGrsdshnUPFUwifQSuJDGISeyuPTWYz8kizEU2qA+DqYev3X3e9qSjOUGAMtygHzaJyFgT2B+BNEzmfk6zoFo9Z9DancKxeAYdKO1QaGcy8oI3JAqWR9efgjqBn1MAondamBMRZFxCnUDLqKd09IyHS9ofOHZHMWPq8UkRyiTdq47Fm4qXwQKuBWGc1KyagIQqzJ+i89NPcFMFT8UMDo2Zun8MiT4lMGodcE9o1+2X7Z+wPhKBBbe/GfRHGp3ljkYIHtv+R+/00Z5vGofY+FSF5M2UIR5c9pwk+ksK7g2iC8Bw==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPSA id 69782180012C;
	Sat, 26 Sep 2026 13:16:31 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Sat, 26 Sep 2026 15:14:50 +0200
Subject: [PATCH v2 11/17] arm64: dts: apple: t8103: add avd nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-avd-v2-11-ecebe6a3648e@icloud.com>
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
X-Authority-Info-Out: v=2.4 cv=S9HUAYsP c=1 sm=1 tr=0 ts=6ab7c5b3
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=X6JhwUuqzQq2NhyfIN4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: mO6MiRlJHmTd1kpQQK2LKY-FLFf-r_37
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfX2g3J8pV5mLoj
 OvuaBWjuuZUwgIL7U6bxWets0izWtn5O0VkuB7R7tqyQV0/tMaPiINhHOguODEC7y3tmW5m2Jix
 hUdVJnJNcbw8pG4jKeSQpVA9DSxL1g/EM2iA9rhpVw+5TDO5d4wqwQzolWuP0UmlmwmwEZ9RBy6
 zxCyHMOFkzatv5u5RHJ8lXVQBvriUhZUJI/B86Sqn25bR93mW4iip2co3oKl0zxclgsEmeFuo4l
 K9DLUHsxu2JoYcuGvb+w78hmHOBSn6t1WirQk1zp0WTuQ/xq9irAveeDH1N9eXBcOeoxf2/sK2a
 ai4x4eg13ZUcL3Nois4MeFcCfHm00Nhr0fUzFtoBtmikQCTJAmNhxZ+8YtMplQ=
X-Proofpoint-ORIG-GUID: mO6MiRlJHmTd1kpQQK2LKY-FLFf-r_37
X-JNJ: AAAAAAABH+y6fqGWa0RwJitmcOZ2/h3X3u4Wl7baSgi7SklHNEXnqT4PApDppp+rK4H8mHyNIbjvGHIumCzb1iKaf2dBu99T1YLqq/WpRBhnVDHM86ibAxT9l8beS6yRG4+u0ZGxZkVRPd9C7ZRXM821FPm8yjIsKa3fK13lRDHQZWWvx8bjaOzSHOVmVrMq6hI8aVuMCMHIEzaknsau9yGELNj+sLTQAKzUe8IfJS8l6BWPvTzxsCN6zeVbX4bQQ8iChy4dhuPGLJXzJhdVRVr9sHWiOPnzdBWTyWoXFvZso72KRjwQtUYC1cxAH2kxwj+gfWcvNloJbkxz2AVg/67qeQVIgGK5aATVHiiBIv98l0dFkcWTgfOolJR1hcDLocGPky2yn/W28Tq9esNWnu85cr4jev5faFOUPS+CWG6rINtSyRmpSzKTQYsxQ+q7v6wPbgTc9ORNv6PDybZhunZbqkzxC6jwgW7SFveaj1Vcp+LMdJrz1YKXSV6zCyYq653BiBuNRrBhkyGkeU7arHNlEm1tI5euobFUt+jHnjTw+xzsgS4oswlzU6ZlMD6ZZmY6xZlhXrkzJg2CZ8v4AjsEVoxzw1ffSfCxfdGVk27YAEWXi7fkAYXYp+wtewG4sWt176+29xl0W6Fbk6P5D0TE6+FCXFJ8LD3pSup3hcI3tArFuD8oZ7P1mciNUD+CO7JpC05K9pmGn4moSVGsp0wfYpJ8fuYVBHa0kwYYKFMQ/J9BKPtJ/BzZT7reUU/EFVJVxmRMdeNFuvKefgD4e7GnV+muiRAGlqYnlIvjpKALtA5dtrCpVOv0d6aWCwef/KtPeSHv/mdSEd0S+ywuikJMpFfq1o8W0nI3iitKLbAt7g6WVrUMH7zB+n7+Qrc83HE=

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 arch/arm64/boot/dts/apple/t8103.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 5b68bf0df4e6..530290e7cb32 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -984,6 +984,38 @@ pinctrl_aop: pinctrl@24a820000 {
 				     <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		avd_dart: iommu@269010000 {
+			compatible = "apple,t8103-dart";
+			reg = <0x2 0x69010000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 547 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_avd_sys>;
+		};
+
+		video-codec@269070000 {
+			compatible = "apple,t8103-avd";
+			reg = <0x2 0x69070000 0x0 0x4000>,
+			      <0x2 0x69080000 0x0 0xc000>,
+			      <0x2 0x6908c000 0x0 0xc000>,
+			      <0x2 0x69098000 0x0 0x4000>,
+			      <0x2 0x69100000 0x0 0x10000>;
+			reg-names = "piodma", "code", "sram", "mbox", "ctrl";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 540 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 541 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 542 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 543 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 544 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 545 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 546 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mbox0", "mbox1", "mbox2", "mbox3",
+					  "flag0", "flag1", "piodma";
+			iommus = <&avd_dart 0>, <&avd_dart 1>;
+			power-domains = <&ps_avd_sys>;
+			resets = <&ps_avd_sys>;
+		};
+
 		ans_mbox: mbox@277408000 {
 			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
 			reg = <0x2 0x77408000 0x0 0x4000>;

-- 
2.55.0

