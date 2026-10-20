Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.79.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489182;
	b=mL3mwQn7EnDfyY7KG39nSjVkOPGqJy3qEs4U0WhvsSFdGcUMeHyw9GC9Fzqfok85g64n
	 AwDTkqq2HdwkLcrOM+x+/fDadbOSQ6NHmdVnqVuaqDA7Z26Eja38x9TunLQn+SZ00WG70
	 HQ4oYtgiEMNw4zokhuIjDdo62QbXNTo7AxaiVCgeYDCcbvlmJOudoO7I5Kc7BXP2KlI2D
	 JxBIlo0Xb6QobSJjvv5yWlR3gzavJRm76HBve9i4HnFWWu9B9CPHgBgCiSl9tsLXTdQTo
	 mno9M8YHK2NFBr2uuAoFffjbuEfIpm02UBOKn4J+ELMbdUYjgFc9AiYdaoj7u+MaHXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489182;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Info-Out:X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=ygnBIUKRlm5yRY5vxRJ/fCPpjI5aCy7883sKLZwwlj0=;
	b=hOlzhKVpof9MouTZ2WdAlVy7QGV1Fc1OD9iEgXvelFOmNVcEsyVVs9PNE4fz4IuAA7oV
	 vWrGGMbl0P1CwjrkizN3X8exMO8CVD73oysNMLzc5YvnbivBZ40GgM5EKIi9m102kDxIq
	 AnX9Gha6BKDbQ3fw2NGQd8NIaBdCcYuTWEz9+q6OfZ2WfCQ5+mFap9u78bFmCDHNmR23D
	 Pu1fo0KQ2ECTDbq2PoXVGThAv9Os2TI/Ni8c0sBTtODIcKYFu8+bWKoZEAa4Wt6WXko/w
	 z3dqLl2XqKj+KQPowPOzZEzLh8VZO686+KydbqBKYa9ms090GyyGgbfG/wdc8Molnhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=BsQ23G+q;
	arc=none smtp.remote-ip=57.103.79.123
Received: from outbound.st.icloud.com (st-2005j-snip4-11.eps.apple.com [57.103.79.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10491606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10491606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=BsQ23G+q
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPS id F149618006A6;
	Tue, 20 Oct 2026 09:39:35 +0000 (UTC)
X-ICL-RepId: 01a158ae-3b39-711f-85b3-31c53e2131d4
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGRhGXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOAl0FWx8RTxweGwRGA0QUQAYOVQpTQghKBgkPK1sTVRdGCRkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1792489180; x=1824025180; bh=ygnBIUKRlm5yRY5vxRJ/fCPpjI5aCy7883sKLZwwlj0=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=BsQ23G+qjm+ZWFE3CMqeLd3ELKtk5oKCS+KbJv9Gyube2iJQB+i4KxoXhZf+Stwi7xlV4ecQVN/JobXvfyI8gNCImUpchtNdzDVvDBNn9nzfQ/+E/4gIhAlVwZlwz6/FbSiY8NSvt4IVaSJWG5lQL/y4PrXigRkx61qNkBfA4IlG39Hs2VbpBHKQNXkG/RfoueNZCA7oEdAA5Hq997l2wXq89ShiND3S0AwZQ7+YY/fCpEghIUPmoXSEKnHb/LbqOUiipQB/+wEee9ULBFAv8XCMlZK5mIJz2sdUEJCaVOuhKBz46VLc3JGGGbqf+6SEnlsYqlwCtpjvXVKxIc8SvA==
Received: from [127.0.0.1] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPSA id 237C5180020A;
	Tue, 20 Oct 2026 09:39:33 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Tue, 20 Oct 2026 11:37:55 +0200
Subject: [PATCH v3 14/17] arm64: dts: apple: t600x: add avd nodes
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
Message-Id: <20261020-avd-v3-14-85cbaa2125d8@icloud.com>
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
X-Proofpoint-GUID: i1Gf6_3v-IAEPoDKlZTAKYfNLyaGlCjj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOCBTYWx0ZWRfXxGXfbAGwomti
 Z8OQe3s4texfLoKJBNDhZkYbiUUdkaCkfE6KVH9cX5lqBfvVySPkGi56faOxFq86Bo+BBBE+mfU
 b5lUX84xo1tlRTdPYQasUV/gs04Ral80F9os/1SVU91XfYeA6Vfnnu8n0pzfUxr1mYdX7wX8kiC
 FQ65l3MMkUhtwzQv+lTkrjwjceBENoxZIl8oSInu/8yeRxGHPgy9IhAOG6EmRGwqnPd8D+JoIMA
 7gQO2uefWBNA1mIrvPga3Wlcj/rMFt7z8aVUum0I1O4ODygn1f8i3mewlsj4MqnLWuOHBoUJscs
 MqHx9CHLsuKfge9tLZHnS0M3I+XFx8kr5qGy8Sq5e+o1t2+OKLUPsPcqCCm1os=
X-Authority-Info-Out: v=2.4 cv=Ea7FgfmC c=1 sm=1 tr=0 ts=6ad736da
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=oI5ehSekA3XTy-s6cLkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: i1Gf6_3v-IAEPoDKlZTAKYfNLyaGlCjj
X-JNJ: AAAAAAABgzvRWa3cmWnaY2aKKsCSBj8lS/73xG2PpC7XFRtx/qtRvcrz1noEE0Tb5P8vSNkumIDDoCgo2LFTEXVgkeSaaEnPzZdcrDwUhCKrurvoqpI+/DwvEl/6fyLx+hI2H3fYn2iGlXcyflYju7EArmfYeSy5S2xv+b0lSqFgG7RyJyFNK/NiHQaOP62y+fyEt3iGsw0V2wvbVh9fGnUZ24Lj6O3nkRfdZz7UD9wGFmRqmqWHe52shegd3xJOWvQppKF0dKZZjmn+42fc3hw2n2OvCWInH+4I9NnWez4aaKWG/mjhaa0QTIbjfuHOCJcI9logKQ5VUJnaFmaJVDU/22j4aJUPIbeIgVQoWqabqfvuQKNq+9l+KEAoOGZgAF72SMse0mFTGoI0fu4OmB4wNk6qPA5U37e4FxgJIWhEbhw1IXQk5Cl1CJpUqza0PFexZk6I4PKAT9MHpLzFXrirJb6UZgUEe00XDlsuzZhw5JqBiwOFcAJlPXEgsLPxDKTJ91TvDIHWho1sOMGDHaNIILwyeaQd+6DcY/9hU3ibbhnzJgbJRoUQSxHxBVcfysU7KFCaoYAbnT2zuPQAlCfsFCv7rHLaFJJKbO9pEAv57MqpUS65hIp8bmUPJEEzAv6V1DfAHY5gwUFGq4I6FS687l8+eahjQ3EZaiAvScgVDtZOHvojRT2XmCXuPJ5kbNQhNt5bJ025obthHrGbRatAe4h/Rhb9jO0FvgqYxuKnOTJneeXCoOVKidQGGrCxzwQThHBtQDJcHL/bpG3iQ0+C78aIdDm6ZVW24pMzIuCFj5uGm0baoRPkASEJGt2Psu1gBTg0vVp0Jz/ION1eYivR2p9HJCL72/OkLP7ZsPgkPpGsWLz17MCf3pA6qTEEhOsLNy8aiVKhPxJA/ZYcCfjktus=

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-dieX.dtsi b/arch/arm64/boot/dts/apple/t600x-dieX.dtsi
index 9676d5127039..c3edcb78d016 100644
--- a/arch/arm64/boot/dts/apple/t600x-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-dieX.dtsi
@@ -24,6 +24,38 @@ DIE_NODE(cpufreq_p1): cpufreq@212e20000 {
 		#performance-domain-cells = <0>;
 	};
 
+	DIE_NODE(avd_dart): iommu@287010000 {
+		compatible = "apple,t8110-dart";
+		reg = <0x2 0x87010000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1018 IRQ_TYPE_LEVEL_HIGH>;
+		#iommu-cells = <1>;
+		power-domains = <&DIE_NODE(ps_avd_sys)>;
+	};
+
+	video-codec@287070000 {
+		compatible = "apple,t6000-avd";
+		reg = <0x2 0x87070000 0x0 0x4000>,
+		      <0x2 0x87080000 0x0 0x10000>,
+		      <0x2 0x87090000 0x0 0x10000>,
+		      <0x2 0x870a0000 0x0 0x4000>,
+		      <0x2 0x87100000 0x0 0x10000>;
+		reg-names = "piodma", "code", "sram", "mbox", "ctrl";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1011 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1012 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1013 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1014 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1015 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1016 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1017 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "mbox0", "mbox1", "mbox2", "mbox3",
+				  "flag0", "flag1", "piodma";
+		iommus = <&DIE_NODE(avd_dart) 0>, <&DIE_NODE(avd_dart) 1>;
+		power-domains = <&DIE_NODE(ps_avd_sys)>;
+		resets = <&DIE_NODE(ps_avd_sys)>;
+	};
+
 	DIE_NODE(pmgr): power-management@28e080000 {
 		compatible = "apple,t6000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 		#address-cells = <1>;

-- 
2.55.0

