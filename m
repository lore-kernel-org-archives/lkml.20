Received: from outbound.mr.icloud.com (mr-2001i-snip4-11.eps.apple.com [57.103.68.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C6B45D5FC
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790428608; cv=none; b=iWCnG0ejoM89gTfu3GaU5Y7NhCk7srSkXddi3orVuFCbQVyb7pjmoW5BzTak/AJO3hPIcRdzT/caNpqBwFc2woid69H+Kj7JNiCj2Ut/KjrHfOd9LSrcSDtNusbiO8dx+jauccKJgQiBb6fgfXoqaTWsDmmUKdvz84cRIvg5Iio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790428608; c=relaxed/simple;
	bh=yHB5Q1buto+JboEDItrNz6NKsAlOfbjqAeZRmFoskWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KJvfmZjnLgEPRyEaevbls8XBWnPMgaTLrhCktkeyi/1I8F/ULSTk1gcz42KBPAYotPEI1VIJ+0ug+E9UW/zlKtXLggfJgOIA8N5/yUrRTSIsPto1+w3bQoCRAb98Tdtd39QnRt3IZd5PIX7hYnGpcB9SZEBubMIKFFKUXklLWgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=dvt6B6bq; arc=none smtp.client-ip=57.103.68.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="dvt6B6bq"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPS id 5B994180518A;
	Sat, 26 Sep 2026 13:16:43 +0000 (UTC)
X-ICL-RepId: 01a0dddc-63c9-70b0-a681-b744bbbef88c
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QFXR8RTxweGwVGA0QUHVAIVQ4EEQpOB1VSK1sTVRdGCRkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1790428604; x=1793020604; bh=p97d/ak4knXUz9e9YDiwpBHsYsTroBo3Vbcsow2RJEw=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=dvt6B6bqK/mmsQZ+jeO8V3JJcyUGNp6lIWjRyFxyq8dpH3iVXVV0PL5aMBhYQRcqbkVA35JxdN3+pQm+bJqQdB2FiJFGtZHHlkpv8uuFV2S9B03KVlWsgazddQt6m6n30knB5X+jt+iAtAKS/LCsmC/NHKo8KLXbK4Rq0fBdogySnLQZGn0N3kW0+iEDll06i4l55a1CsX8vntwJNBuiswLXp0l8jqNBAT2FwpCV4L9NmN/rnzYH0N0YpCAWLc1iCkR4aDoiJXgVJK0ssVg2nmmA4ht9KmvI6MyO/gfqUwJ3DFxS6q5ZnclYdFbWVw3j/DLLZX5ZJhQRMRQeYxb+Ag==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPSA id 5E0AC1800561;
	Sat, 26 Sep 2026 13:16:40 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Sat, 26 Sep 2026 15:14:53 +0200
Subject: [PATCH v2 14/17] arm64: dts: apple: t600x: add avd nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-avd-v2-14-ecebe6a3648e@icloud.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfX7JV4sfxmVciS
 UxR7GwGS39CEL+x7t5ILLIuUb6cb7WdL92KEo9GL154WovwEtTzreqFp6PYozjyCF8pUSmBW5Uu
 87IcEzPEnWaxUz1NAZogN7hruKkXup/gpDzrUPOWIErFf1bWMEZAwdvx8P6DPH/76hVqUg45+n2
 xQEyfHwDUTChgO2i3yTzS/2DuN99cxmYGZ5yR23/Vyy6RVbLSZhUZ58PegI8mv9IG4RS+3/P/rJ
 U8ZlhRgE6cw1kYAdV4tenTiWdwtA4+hNIQ65X9NmKsoe+D6vX3gIGFNwcOjhSDVsgINYXXXJ3cc
 AA/vh/mFTJi/CM3vnMqVOJLBchHvNmTXTfhInQtltNYqk9NuM7d8O3J9NRx0+8=
X-Proofpoint-GUID: 0FxR4sgThj92xGnUrP6eNSmi33PiYaQC
X-Proofpoint-ORIG-GUID: 0FxR4sgThj92xGnUrP6eNSmi33PiYaQC
X-Authority-Info-Out: v=2.4 cv=H+HWAuYi c=1 sm=1 tr=0 ts=6ab7c5bc
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=oI5ehSekA3XTy-s6cLkA:9 a=QEXdDO2ut3YA:10
X-JNJ: AAAAAAABkbk0oZ2rPnGKpCtOTpXm2G9m+sW9NgNdi9YBgSF9yXiZNjVBw2weRNpFJU5h1E4KNYFML4MRnD+w3SXvFUwG3cyporDs4A7SXINr2zqewmHcSeY6oYA9QN5x4oUcYP9mq0OZyn5UJzZPWw7eE7L0XKAeJoynrytNkuzkW6GaI01DYA42B9zzADUNvdmaHII8qWuvIvl2sK+3shdxzKJn8HHUblviSCum4MnHF0h2FB1OWxyd1UZETsPsv1ACwRncA/ly2PZlofrzQmxTdCgvMnLYH6kwskZ9zbIFTCD/z4FlE6+jlTR8STRLEVqF9NWJfGcrhTkxIzw8NKVgPzuToiSMRAPPkye93CoQ54dvgw9F21YQc5STm67jb7C8XjDVsU1j1zbmBk5YI3p4MXa8VG3+WezSYfnqq3peCuk1OStNWV/Hh8N83EJ5ezSA529uJsgUIPKF/qwa1Cc128vVt9l3w1pt+kiLqE++kZRC0kdRkxik9bVmnLQa3M8rJRyyza3SyxO+Yf+gCoh7JZI/lfgkf65icvc/QeE421uRSEO7n4qJPIGwLRK3ynj6f4j+FZ39f5V1F72ubx+zRJfCggyioD7VCqJPKqA/UnXeV/zIZ6roOA77UVq4obJxmereEbXCpvHgZ0zpC9oXE1zJH66yv3YAnXcrfzamOw3zXe2f7nene86hyGyQJrg+CC2QzpX0oudPVZHfhYpEgSUZUBDFQc6NNt+5CDOkFD6gkxp0/8P6/m6DWvyUIbMlGrYReerC0i5Ee5QmMjBIgV1+W61XeCu7mbigouDLxyUuCgcVuHETEzcJyQP/cKaTY/GEm/tk4LM+D+p6HCVScxmnrhObrXGvaelv5L+ixP8SF+ec9rk+E2LlykIHS1rry49iv6w=

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

