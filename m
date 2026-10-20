Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.79.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489183;
	b=YTKIyT+3sYct9Pzp7i2lvaMK8+n3BbB/jmL/RTsB20TKJ77vujDbb0bHjgKmNRIPHDIm
	 dGakdIq321wMY7agl2BYGbkBOrEFrzaLQY+pzpeI41q/sInWVrP6v2jIOYzggDEDwlZAX
	 kJxgVIHxNCyAyG/5/TkoD8VyVLWMhQt0qJurr1m4YxiRJesulRjZvxV1DBxbZGDK8Odkx
	 bwyvhcdDYIOKKufcPBIuaFfpDA1QbgWbKw1OzBNYUDj4eoLdiAJdqY91pMLLdY/Uyw8Vs
	 H3sB7XZv25Zz825/w91tKkEzAUmSWftz6OdMJGSsPiITpNLMe1wxj9KvyggVSvsxy7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489183;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Info-Out:X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=Bkux5bPnU3OJ4YUraJ56uYgVEyNDQbOeqaxmHP4yOc0=;
	b=gUOCquGue+nJV41enpIzOy2u4q2bsa4SqqVMw88srIuaXuFH5bTY+KeR94cUPRb9smtF
	 CKpYk7q5IAVP/2jvjua1q9pb5wHhQKPih21ghcgKUtT7BDxAYqV7qkaPUOzWvgBnW8kF5
	 TVLquGpmpI0hJ/v+D8ClCyDUkdQlrNOWzTDHhOYtVygLdJeC/RUFTEETBkfshKqNLPeOS
	 IXkKqmPnvXbwsVYNzH5rFGBJYjlH95zCr1hpWWIIAcmTC3HiasdxywuMJXO8rcnMX/SSB
	 GnBVxlRvtlSYZiBKdK/3R3pHTqYH30jvzivtsrRP0agDoX7tyrljXMKCDgxTXrSUOWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=DDPOnfMV;
	arc=none smtp.remote-ip=57.103.79.48
Received: from outbound.st.icloud.com (st-2005c-snip4-5.eps.apple.com [57.103.79.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A42E60A5BDA
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A42E60A5BDA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=DDPOnfMV
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPS id 2BC1A1800115;
	Tue, 20 Oct 2026 09:39:37 +0000 (UTC)
X-ICL-RepId: 01a158ae-43cb-7d38-b53a-52607d41508b
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGRhGXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOAl0FWx8RTxweGwRGA0UUQAYOVQpTQghKBgkPK1sTVRdGCRkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1792489182; x=1824025182; bh=Bkux5bPnU3OJ4YUraJ56uYgVEyNDQbOeqaxmHP4yOc0=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=DDPOnfMVhZUGRXhtDd+KPFiJ+HTor+7AkMpQHWwOfvqx5Dw9Zj+4Ng40QMJP07lkEHQRKn/GU8ANQApxjjeOSPHmUliFcuOvqQTzsEUX26NQGz405hH8Ckkx8OOCXlwYCefmIVYXnh1ChGNBaJ44575I4+Sk1LX86L8hmCSF8IZ98yc3QugPDDsgqHcycKllTBOV9vDH5ST0NBnGkErUMjuJT33eDKFyrjbFua2cdduwJt8BK9YKO9aw0CrS0fOQS7L7B6GpjWitUnhlC0wkksvfuhDFKP/nMpOk6kwKfPfm4pm23NNM7VzFRKsewX+5+YGbUn8dMRCrq1Or6xxvMA==
Received: from [127.0.0.1] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPSA id 5651A180020D;
	Tue, 20 Oct 2026 09:39:35 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Tue, 20 Oct 2026 11:37:56 +0200
Subject: [PATCH v3 15/17] arm64: dts: apple: t602x: add avd nodes
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
Message-Id: <20261020-avd-v3-15-85cbaa2125d8@icloud.com>
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
X-Proofpoint-GUID: c93O7CmNBPfi0OaKYFmAEGdjk0GI-ao6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOCBTYWx0ZWRfXzNq7xTVn5WYJ
 TnKIf+7UrzUOAgz6njli7VSIUOwCze38R+sP88dXMU/leeb0xFpvRrMkoilR5WToGPQCB/BhwVJ
 CJS0sXFGgDrLHEazhw/kwNuukWsYv5W/1HZjfPtZr1olvl1NMGSm7L+WFWnIM6dBB++wZ6kSpQ5
 iDCggIl4jfLjgeKxPhIxAmd8O5/rWX9Q1QTU5nk1z60f9/LK00M3nflZ8JWCjzGX81hnrRkFzxH
 ThhLL2plai7LTsjcD1SKldUEbF0qVr74iiZw/aJKOC4O0wZGzlalCVKPfRe50ooxZMDoZBXzX6q
 9MNrgfGwLgMSFVNDngKkUbxFKBoClmiscnI2NSiMAewkbZjLxs0RmwuKVvv7qA=
X-Authority-Info-Out: v=2.4 cv=Ea7FgfmC c=1 sm=1 tr=0 ts=6ad736dc
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=oI5ehSekA3XTy-s6cLkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: c93O7CmNBPfi0OaKYFmAEGdjk0GI-ao6
X-JNJ: AAAAAAABuLbEP6pnjHKwxxMfZagAbRi1lwvWy1FyresDKpR2y1CqP43dEgNVjD9Fh1fMTcPKQkJ9FnEVqqd3chp1qlkZOglddBiVPVL0s3R52MgIsmeSRbCLXorDeZe4CTQ93EHz22mVNKKGd7JFxTA2qwU193lF4Visl7Vbni9v8GRe4YPFqge/rOLsHi7uRLDXNuLvZYwrp+fOc+lM6opc3QNCxFcWyjHLJb2YfTLMyWinC10LntLAFzyyMiH11+A7Bf+ZwKFqX1IRqPmXJjZME7t3bnmQs7GdL6HD3jgOwGiuNyOL94upe0uif1ofEzbqhiVfqWpRc5wW59YXsHRdKXkdZxFSytuT1RRK26PoavRRGiVhsVNeQpQizw+I9ytMIThL/cJTCyEfdeJ7i5PTS1+Qxm4HgY6Ljx5Cg5lyDtAme8Lhl78LWGFnvCngjF4n4BwR5+Z+IvLGwL5fU6fDFoXuKGJEN5c7Y4rC/p9snb35OFhDp1h/jfz18U5dHgk+0YYNmnFAJgkeNzdzYPjwbwKWv+linJ8iA4jhrowCWa8uKBflamWXcAl02ocNayOFcpDIA4osDXJDnVlYcV6Ndd6QGhNhtr6FhMZKawOthTdTmcv4G5gxWzPQ7ZTiCZKdL4EgB1r5yfwbFUhz1Lhx6q+6YIuvu8JDnQisb+LQ4cqIoHT5NaAVya6j/5FcfAgb28e4AbllLr+h57qATyMrqgFIl1C1YSlXfyLC1iHKgRT59HfEc51w+ZZfJFrR9dkUZIFvEXz4h66hZhr29n8rHqKwyDMY47e/RXPCnke/vV2w8NTxlH1D/0wsXchPkZyWpy7zgnsZbvER1Rh0HrumUxX3RBD+wDgBVCRAYa3YxK1biegf9twmzRzZyfJa2uNcbJOE+yb10wKSUJUnxElrcyE=

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t602x-dieX.dtsi b/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
index ae3d535c5acb..5f744308a6c5 100644
--- a/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
@@ -23,6 +23,38 @@ DIE_NODE(cpufreq_p1): cpufreq@212e20000 {
 		#performance-domain-cells = <0>;
 	};
 
+	DIE_NODE(avd_dart): iommu@287010000 {
+		compatible = "apple,t6020-dart", "apple,t8110-dart";
+		reg = <0x2 0x87010000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1095 IRQ_TYPE_LEVEL_HIGH>;
+		#iommu-cells = <1>;
+		power-domains = <&DIE_NODE(ps_avd_sys)>;
+	};
+
+	video-codec@287070000 {
+		compatible = "apple,t6020-avd";
+		reg = <0x2 0x87070000 0x0 0x4000>,
+		      <0x2 0x87080000 0x0 0x10000>,
+		      <0x2 0x87090000 0x0 0x10000>,
+		      <0x2 0x870a0000 0x0 0x4000>,
+		      <0x2 0x87100000 0x0 0x10000>;
+		reg-names = "piodma", "code", "sram", "mbox", "ctrl";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1088 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1089 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1090 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1091 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1092 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1093 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1094 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "mbox0", "mbox1", "mbox2", "mbox3",
+				  "flag0", "flag1", "piodma";
+		iommus = <&DIE_NODE(avd_dart) 0>, <&DIE_NODE(avd_dart) 1>;
+		power-domains = <&DIE_NODE(ps_avd_sys)>;
+		resets = <&DIE_NODE(ps_avd_sys)>;
+	};
+
 	DIE_NODE(pmgr): power-management@28e080000 {
 		compatible = "apple,t6020-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
 		#address-cells = <1>;

-- 
2.55.0

