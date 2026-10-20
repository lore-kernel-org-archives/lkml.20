Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.79.85
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489182;
	b=ApfiTf70XA9DdkFaeCZ0rLOSL/zQDuNF7idmUApT22LdugPwLc0JmAJ6gJk2h1wxYywz
	 qxSBZqjDWDa+AC9BnI6PT2Uok4LO6x794CtcV6Fyb7VU5rW/ETi/fcfJ46gve6gG0lL+b
	 1KFNTR4eusOYnDmMRZKIbtPgUoD5RZ1pz5534B/V6aGYjU1GD958e/bYd+7cvTZW/qdzb
	 cSc9toI4L4aLptiLOytX5gUmC1rf3lLPkp7klqzuftSpAp6qnK2OzuF4KVsr3nRJ3IpFp
	 wZi8gWXUQ9SWVtLFnCRYsDc3wGlbXLAV1WrvntrOXqzGIxKEvT8Q1fMRBu0QKk9aWxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489182;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Proofpoint-Spam-Details-Enc:X-Authority-Info-Out:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=pZto5RHnoIIXsMNucqBB32BHeVmq97VQN2xU7krx+gw=;
	b=CwjJB76YYyjp3Pd2FmrcBSgI/JGX8uUPlNg0E8n+Mz0fID9oOIH93zkoebWatYA4aFHJ
	 wmi2vEt7r4HRrC+N3W0vNP2LNSSBQZQ4dI9iyHY5vVviuTHRoOlE/wZU/frsrj2JV7A+t
	 Qwkev7szPW/CluNTncWUMuj0skdp8QfYfebMFkVqOSQy7Ub3LF6GRxmuTkg9CGvB0Yefi
	 PSBNycGJe6es07oEv+5XhCDGR7hjOxLW9qmQyH0hP4PkoTniINwMuyNB1lpabDEbaS384
	 1vMULJMl4mKuuvSLjuJRgFsKk+8dDNDuwKZ+6yWmCeT0u6NuWfO+jhxbYwmNUm9fE6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=nMMmrHRg;
	arc=none smtp.remote-ip=57.103.79.85
Received: from outbound.st.icloud.com (st-2005e-snip4-2.eps.apple.com [57.103.79.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C7860A261B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74C7860A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=nMMmrHRg
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPS id E427418006AB;
	Tue, 20 Oct 2026 09:39:39 +0000 (UTC)
X-ICL-RepId: 01a158ae-4aea-7922-afe6-f5582f243088
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGRhGXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOAl0FWx8RTxweGwRGA0YUQAYOVQpTQghKBgkPK1sTVRdGCRkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1792489181; x=1824025181; bh=pZto5RHnoIIXsMNucqBB32BHeVmq97VQN2xU7krx+gw=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=nMMmrHRgJyPtHPw3OT+Fc9Azj6tSlWcmdjaY4fPPFCE7yDrU/Xf15wRTMi/v1wfLPkHtZoFOM5HZr/hepJAhzPO4Nghrjg6kv7OT5o0MT1m5/vWGSyKqclJW3NLJErctCNsC4whikJguAcd1kX7RdsCylODqTMW/bXBdYKZxWbul8ffgJDFxyfgwwKnhnstsIC4XlcY43967opYeiG+gBthfIsEhTtRWdDCqPBVlviCccaLVmp7XD+UC82SsfjF6erWCQTKfHM7ASYs/b3BFHJ86aBOGFjabU9rsRNL123JXmfdnvzlHZNzEyjeBdS4DNNxbpbzrMW3h5IorlYoBbA==
Received: from [127.0.0.1] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPSA id 899121800111;
	Tue, 20 Oct 2026 09:39:37 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Tue, 20 Oct 2026 11:37:57 +0200
Subject: [PATCH v3 16/17] arm64: dts: apple: t6030: add avd nodes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-avd-v3-16-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
In-Reply-To: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sofus Forstreuter <sofus.c@icloud.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOCBTYWx0ZWRfXynguuy9MAq5b
 x2syupJn7gHsfFJcfDC6JiraZwXoIEsRN6F58CoYTcfgSYZ0CllQRhDHNces1VAlhnxv7HDG0YV
 jNGxASTZFOyujFC+n7oVRA6b23+lCJEF7vn0asbi7/+gJvIB+OhMMg2wjhPXXOiYEmKviJwU4vf
 kMUTo5tPET4whOPho5HAn4oja+KsbgAeOy41wdkKQ/vM7CbyzjkqTnF3xIIo87Z+6NYur/0N0h8
 6Kf5cQMP4nKlH9FYf0aaXuM0EuHAa57ed98eaofnzqY1s9RLTMB9j2hZ1TsZyzJD1oGHIDfqVC4
 Ip3y+YWq53GH9JyKR5VVj2KZS0ANx992JHmh7ouHLaSjd1LqJsKWrUW5rSPqRo=
X-Authority-Info-Out: v=2.4 cv=f5NFxeyM c=1 sm=1 tr=0 ts=6ad736dd
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=507KCcAgMSliuwDla_sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Ee18LwRM0CskmgwHdZA62QmWuE7CGLd9
X-Proofpoint-ORIG-GUID: Ee18LwRM0CskmgwHdZA62QmWuE7CGLd9
X-JNJ: AAAAAAABSf9T3H0VsbuThMpgBIZ/4n87gNJiV2OH4WqFj8AqKXmvSpW7oJFd2GBG+SMdkuJ/8Lb31vevmfV4wHbSO7sfgsku1izo1gd1d1KvFjNgr5s1e8BIMb2J/jfxh5hDJ0WacZA86ajgLl+in+y8YULhWigS9dj0Pts9rlQ6Jr8nNZyxffGc79z8Dy5JVSTSh4ImrBgPQaHQ4Ps52f3Wl08wgSQXTCQsEOoq5ymOM+iSLWIcKf/j87WpWcq6i11Zyc0NOZuwydYv/qRvUkhEWkmAGPJzy+pEW38MIIu3Kc7gPEP3iH6EV06NFf3xOHb6juwhCpXp72DoQYtBw99IIB6NXhqbekdueeZ8YgYM7q/jYBRcFTEKwcZen3BapvjK/s2yl+LtVGM96dLEeuoJYqeObJT37MXb1iUvTuTj3xBds7QO4O4vtcSpcbbdNZNFi0tqE+HYnkgXjtEZvEKJCCUQWrMZqwyULHNMIJVQzmPURvXQJ3yS6tKozJVFM+QNYlA/zUq+0kFpLfPQ0kqvH5q9dqiVx0MZqS6vKwl9dCslG0gsrM4BI/cdN3N0nuzoU1jCIZm4r8waDTqKulgqA8mZONbRymsH0tVducQD7BiPP64QUFeG2fBkcnrl16l72QCBuYHP11qmFExxJShPrLnx1oc6ZeQ6L6KqlXPLtVlFb2Xsfb/7DBsjpQYeIFt5ofJSu1CcaKsUvDAlKzMkTI9aoF52DQgTTOhDwBxpoOi559yiTF5rPDT7ctVHWv1PMynJoi+kClkNc5zer0JNpLpRd6ISNhSKaaiePuvMgLFLZPtoWHCe7WoxF5EatFyNH4ORlQtTJbEm4nLmlZEzZcItAhe+0k8ANQ92AgMJpk7HbTLV0dsPfRzET6ZP9iIVwMWK3J9b2n9L8jo+5ylNt5UcPqNIqw==

Reviewed-by: Neal Gompa <neal@gompa.dev>
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

