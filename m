Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.79.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489177;
	b=41hd6e0x7U+/0SVkW4YgGg1pcVBcHpNuqU5UjLaD5j1qANlzbrrdBySnNJdOfgGJsS51
	 l3pkqhjQBbjNA9Csehh0OhTG/BJUop8ywgEt08DNQQkWc0uqP/9w8eWdCJ1bRD4rofEFG
	 w2BAvbMt14n8dUqQXSfReqtO1iTZVDtDPLbrfS664LB7rCV1tBdKwhccckm7aIa2vcstV
	 7JcMHlYIpg2AVNc7XQObl8gVYKJZpUt1Q7sRxAVvxAd6c5BnII3K/DtYQSLPwD9UrV61Y
	 x8aN42ZGDNWSbX49WnhMr83X5JMJmvd575FIer/xLOW9/dIMixnG2ArziZH45PV5GJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489177;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Info-Out:X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=ufyclrrNEFVPe5UqXVHJPM7BccxPs++75Xe3Gdng820=;
	b=S1sAskK4yDqqwnLZZeDqNg3uUF7TbV/N2Pwm5ndZ7UEv4eTssz65/m9OywoPkdLl1KCB
	 6D/5BZ3Q5SZBdAeDDiv+/XC9IZWH1eI11LiMHBUdcpctCDwt5LtX8tgjRabUx5HlpTwZJ
	 OrE/vDprBkCknULEoaOnY6bC/eFDL7MD2QuDlSwQA1GEJtaPjqWJxS2j6zEDuFeBctfr1
	 oZ6OBdXrs3MXtlzlQfqNvRXTDlS7TzE+wxu72HNZHwvjcl4fSciITh0REaoIHK6cD4Q7h
	 sgLflZzcRxmfIGqaNxMKjOnLHXw/SAwA5MfLHhfc4ANxkOQixG2Kui8LmYEa4ftKJ7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b="mN/l/5bi";
	arc=none smtp.remote-ip=57.103.79.45
Received: from outbound.st.icloud.com (st-2005c-snip4-2.eps.apple.com [57.103.79.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959DE60A5BC4
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 959DE60A5BC4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=mN/l/5bi
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPS id 881DE1800698;
	Tue, 20 Oct 2026 09:39:31 +0000 (UTC)
X-ICL-RepId: 01a158ae-29ed-7088-8a8a-9c079c969768
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGRhGXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOAl0FWx8RTxweGwRGA0IUQAYOVQpTQghKBgkPK1sTVRdGCRkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1792489175; x=1824025175; bh=ufyclrrNEFVPe5UqXVHJPM7BccxPs++75Xe3Gdng820=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=mN/l/5biHnRzRCViXbtveWUsE0y5k0grm2FCj0caiUi6AjJaeq/aZXwlUruaYJoNy44oAnP8vkKvgqwpMamJ/MUsY8m4CCu8CB8/mD5KF6gFLbZoNZkbX7WnX8taPw8vtYfmB93zBfvdgIXlwJL6V5J5sfnZbk+T3nL+vzckAsJ6+RzlFEcPb48y+Paji8/Q42txFr+Bce1hFjFn/MlBwDgVSrTEPjDcpXPLujvrJu4cf+G/7L8vMrfwhnhrFqnepdTYliCQGC+6GAXMbzbjTLnjtRfT1OZdUnzsSe5eVD1Ug8hKet/II5aYIrqviyP1wLkrIpOjpJotUt6SFLrtjg==
Received: from [127.0.0.1] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPSA id A89E318006A6;
	Tue, 20 Oct 2026 09:39:28 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Tue, 20 Oct 2026 11:37:53 +0200
Subject: [PATCH v3 12/17] arm64: dts: apple: t8112: add avd nodes
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
Message-Id: <20261020-avd-v3-12-85cbaa2125d8@icloud.com>
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
X-Proofpoint-GUID: PA4K7IGO3pTFFQtK9sZGy-RKotvAY5CY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOCBTYWx0ZWRfX9ZrWJcl+odAi
 2g/PmeKDx+GO80KFJxGApDpOUwRxa15tDt+I0uRzMSfjaPanfn0McOce6Okt4rysnanIz66wqCy
 WkPFf0jSyMCs6kkgXAnxmps0QsMLiaeWm8P1jdnJozDIJjV7WWTlrGT6M44o0YHfTfx/umV0Frx
 jLAQGr6UI8+KyL4fsmHK9ApD8wOF5sXRo0lBtgaa+yj8qoRIZLbbsDAI3D+BRSskY6nQnL0wiZl
 zsjld+E3q+/cf0HbW29/8EnHLZkpFQFEwOd3zeoZBGQhmuDH8kbCJPhUyNTeN0npo9LiUiKgyoD
 uKMUOKebAZdaB7XjpLTUoKQdOhpo2QI1JAp0kBi/dRz10bE15FK8KSX3Bf57kg=
X-Authority-Info-Out: v=2.4 cv=Ea7FgfmC c=1 sm=1 tr=0 ts=6ad736d5
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=9kiG86roBcscNhQ-f0AA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: PA4K7IGO3pTFFQtK9sZGy-RKotvAY5CY
X-JNJ: AAAAAAABiShmO3I8cdLbjDyBUmevHryOVuL8h2ZlKv3tKlKuy6nCD1Odnv8EjgiFlo6NIIF3YF5tfOAE++Ot8K45B1011Fc3QAw/laCMHhDJVvEoFd3j3wwDYPfw+nxewhX2Bu/RB5N43Qwp2CqmoD3VjTBaur2GXNqzFeZnT79jNQ1MLXdao4CBvHHGt8ZQhEZoPcl0OSLsR3h0SmpCEEjRb6mU2x1U24l2npwT3OUJi/mDEkJ1CF5N+zNof9I0kOrPr6uRWQeUGazs/jSw7zagcJRWTdW7SFN0zpWwk4gBQCFQPDyMMcmMvgwIxvYC2B5UfjN5YxLhgclMLR6Fea1L9Tu85K81kqr92ZbcZBVRh2W0+OGZS80crFlu620BK9e8mXnDECmSbD9K8kCJeEW/mEznD1qqSKk2umFiBX9y8hMbfk5P2jj773oH+b4Seg+v5TvSeix5kGG9kHj5Kd00+gSXFFrJPbUIlBUZLJ5rlUsySocWpu74sv73UJzg8NkwgM6USMt2BodKfOPfjinfL653ytmIFOlk2Ugz9eL2z0ms9M97BBZ2wrueTmeT8lFc3cGgQY2Xo1ZktQLJIgn37sF6KjthMDaTR2A0dlffuiZKg1NoTQxO5JwSXRLU3uTG1GMboEtVJRC2U99qAa15Re6mwyavV5hlFMIY2Epn0nMMC2Wj2sOYpVx++v6ZLgIJgF2g+RAiSRIzZIYPYKO/1erXIWALRILXCJY6VyXQlqiHOtZ54AWUfczLxX4dO4oWmPoF7l6b8GYD7aBYeIzK6dBGarr6Lt4dBqBPI22QITWDyTHivQ5xmXD4KLM9h5Hi5b21jMAMPsGX4BtvVDgUDgQJHC8g1D7cTQ6LijlK/MwztqqZRtWGjWQyaOpmPXFb0oLHyX+YVwWuvAc4fAcHbLAn

Reviewed-by: Neal Gompa <neal@gompa.dev>
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

