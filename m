Received: from outbound.mr.icloud.com (mr-2001j-snip4-11.eps.apple.com [57.103.68.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A32F3BD635
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790428615; cv=none; b=XN0kjwxG6f8c85VTK4qWSTlQrHuWi34MaM8I80dwmhSDR74Bx7JuGPAAcnw70fm5qzMMh7a/ZA04W4FWJ3wVLz0WJNIAVr/R1gyLTnowlnO7xSrCjoCaGs2geSojnwcEX3KRejxBh39IX8tBqRJYxa5KZa9xDYbqaB6fm2LEJdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790428615; c=relaxed/simple;
	bh=FX5RtLdqmdPLnay2lC093leoo7rgk6YFkIpZd1q3qjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cFz1B62GkMGI4cKaeoLmDId2lRz1Y2Rce1PW6FHps5Hpi1IyXDbpjmHlU6i5WrzmVs0U6d3uWPQ07iOw8miZGZ403wvkxaqvIPHm3Hmb6m7bqEIhmPogfbdaFYZ3Iy0vq9PFXK7M1GLPnbo4gz6+tTUWXuW4gswe7m7fEAL3ZxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=SJbJEinz; arc=none smtp.client-ip=57.103.68.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="SJbJEinz"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPS id 8B954180519E;
	Sat, 26 Sep 2026 13:16:49 +0000 (UTC)
X-ICL-RepId: 01a0dddc-7bd8-7974-94bc-7add4388f8e8
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QFXR8RTxweGwVGA0YUHVAIVQ4EEQpOB1VSK1sTVRdGCRkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1790428613; x=1793020613; bh=QI6kPeeonoawwALaFMGTqe+JAFSFYB5AbZKekxqPKcY=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=SJbJEinz1iSZfPLl7EvYat0B/bZ6YCOx2ofppEmyhMbEZ2/MgebfbLatzhmxDZjQ0Kd6NkV5MoipMPgmM5j4SjHbW1urzVKtDt8N6IJTGWRHttHNGxMjkfpZrksD1SunK39+JUft9qV4hrzfm1iMJSoj1BBFBudX3hhM1A/wsr2bIfrqZWYrAWlHeupH4TsLiHpRKnNEz6X6LnNZhxQLPSXQpGP+VCI7kOvdjdqiwXu1h5xkdxhWcdLX8cUoHeQjlZG9kikYUSoMVCVreCku5o6/3KZINOzn/VroL2VR80XLo+xi1uNAbf7j0hVihEBcjcdadve2Z5FawuSvXKeIVg==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPSA id 5CDF9180013D;
	Sat, 26 Sep 2026 13:16:46 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Sat, 26 Sep 2026 15:14:55 +0200
Subject: [PATCH v2 16/17] arm64: dts: apple: t6030: add avd nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-avd-v2-16-ecebe6a3648e@icloud.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfX749Gdv5TASMK
 Zhh6779qMB7YidzHmQLqB/d98rDWo6b/YDvFKdFpYiT9Kt6nZQ45VAKg6fMAAolprkiquipQjps
 4RBade+rkDqERybPE2iYxjujhdJi8SvhMb7aTlBjR5DOKMK3yuEc10czeTwqJdS/wc7/PK8UpbG
 UAoDBRwqGNPjKFR8lo2npuE7gs+e8rtuOaR5PAY+WxpUYDjowHzyCSweJwvg0K5SOGQp9VIupul
 omoZMg+Ur/ICNXbidfh+ewSdYLUSzojCJsQgHGhTAh8Maq5bz2jccbFJdbRRkpMnvwOvOGhaS8Y
 7Xx9aPg9mGVFiUTaS9MgaSLYZkEy5fON3b+e5EkiWHDX9OLZ2gRE1OQ87ohndY=
X-Authority-Info-Out: v=2.4 cv=IdeKmGqa c=1 sm=1 tr=0 ts=6ab7c5c2
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=507KCcAgMSliuwDla_sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Q0mDSP7_eq2Ozbf2-JxV_5UZwvGyfENj
X-Proofpoint-ORIG-GUID: Q0mDSP7_eq2Ozbf2-JxV_5UZwvGyfENj
X-JNJ: AAAAAAAB6mXXXKeRyPsxjtl+IP5yxewR6oeVR1ZH66GomMhxZ5uF2mf1vHO9CvPy3fP/ErB1VYlGpwzZRnfRuX6wxa6FP58XPaXrHU3mJHi1ynIgWJ0/Q3epO2HbnR2cOPw+R0mLWczmhT6AbMGFl6PBNwkJcfSCugWAgpC9DcjITpjGCnQmzcIyUO5GIlx2rW3ZjD3SPUmeWMdISsQadxIY+T2dycD3da2VyKOVuCnQLDSmwXpcSzxKfD2lB2PtP1xOvUGYC61eIPXs6qe31ILQhM00cxUWBoT83q6K8LpsHMzLWKZcAcQNpdP7r0qjFi4jZrmnyyuJwpTU7GEgoxAT1H9ed3ob/REudyaEL2r9hiyfE6InT356aD15EXeqKoeOEm5iAaoBgzR45gVr70HX369zSq/W3jVWjTvSB1U+i7c+VphWqIAec02f+69J7Rq73OsvmEZv3jq+TtOW8fy1a6qkLWqqxBGmlblAl8xEb3VIti8YsFZeEcqf5GDdt49/tVJ2QInyIvo3yj2eLxrxshme3rLuwnIpMc7HeOqWNbeJ9Q6PyhBS5v/E9ZvaPKrLECG+nSH96R7GSaNm6xQevpO8fHCLY29xRyACTOfJmLvu66xtts0g9KRAj+8QwHrqq77pEspEU3ViPoRl+kdljTTZG3MhEXCOazJj5JV+VtyCkfURlpKGvjpc2SATVUxkoAXVaV6AL8XDXUSEw0e2nWhcLN+/6j4XeCm3mxSsWc/k/+A9mXogCXBorp8LeR37V8Oju5VTfVv/dqMkEUHKPJXdjTKRQO+H6ZMv5foZPxFpw82I46QpaGzRq8miJ4K/wRkkFw9Sk2sjtYhbyD4RT+rYFUocbPrUp1KlaX7mPRqcUGCRG82KE70s9ut/GA==

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 arch/arm64/boot/dts/apple/t6030.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6030.dtsi b/arch/arm64/boot/dts/apple/t6030.dtsi
index dda9568af11f..805042bd9270 100644
--- a/arch/arm64/boot/dts/apple/t6030.dtsi
+++ b/arch/arm64/boot/dts/apple/t6030.dtsi
@@ -361,6 +361,38 @@ pmgr_gfx: power-management@290e80000 {
 			/* child nodes are added in t6030-pmgr.dtsi */
 		};
 
+		avd_dart: iommu@30b010000 {
+			compatible = "apple,t6030-dart", "apple,t8110-dart";
+			reg = <0x3 0x0b010000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 795 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_avd_sys>;
+		};
+
+		video-codec@30b070000 {
+			compatible = "apple,t6030-avd", "apple,t8122-avd";
+			reg = <0x3 0x0b070000 0x0 0x4000>,
+			      <0x3 0x0b080000 0x0 0x10000>,
+			      <0x3 0x0b090000 0x0 0x14000>,
+			      <0x3 0x0b0a4000 0x0 0x4000>,
+			      <0x3 0x0b100000 0x0 0x10000>;
+			reg-names = "piodma", "code", "sram", "mbox", "ctrl";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 788 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 789 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 790 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 791 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 792 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 793 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 794 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mbox0", "mbox1", "mbox2", "mbox3",
+					  "flag0", "flag1", "piodma";
+			iommus = <&avd_dart 0>, <&avd_dart 1>;
+			power-domains = <&ps_avd_sys>;
+			resets = <&ps_avd_sys>;
+		};
+
 		pinctrl_ap: pinctrl@347100000 {
 			compatible = "apple,t6030-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x3 0x47100000 0x0 0x4000>;

-- 
2.55.0

