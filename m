Received: from outbound.mr.icloud.com (mr-2004k-snip4-2.eps.apple.com [57.103.69.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4B34EFFAA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.69.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737372; cv=none; b=Q8TcusvVgrM7LgCg5mQWBLioEpeQ01UzsIs5xZ/1ur0dN2Exlcj5nczn0Y/WYeNxQG6e2sCElNGVsn8+zOe7RmDY3nX6ceARRxBBeoCth2e66hZoDTgczd7t+Ev5dH8EUCc3BNGO+ApI+aFCacR3Jz2Vw6IT/ZARTH937RGK5OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737372; c=relaxed/simple;
	bh=RYjjAWhldRR12gUEAyfROW7R4rjrniv8kAmmtO92paE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QMT7OvoR/iT+/sZYKMUmPL1n0DgmAvbl2hWDgdYS9whbooSqFZj2iTn6jIu5RlTAaJye1N6aSSIEwhtGYdk3fJ3+kNfcVQ349md4tIDD2wtFWccxQ/6F4KynJDIHMLTEeoNO85pc1NjofrUigExaTggH7i5v8DZBJDiZxHMQJL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=049qh9FN; arc=none smtp.client-ip=57.103.69.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="049qh9FN"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPS id DBD1E180187D;
	Fri, 18 Sep 2026 13:16:04 +0000 (UTC)
X-ICL-RepId: 01a0b4a8-ed1b-7b2e-a36d-1946784ff1ec
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QGUx8RTxweGwZGBV0NQQpaAFIBQV9MBlh3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789737369; x=1792329369; bh=M6VefbtsHJ7I4h07saTtcrarG1Wa53XZiIB66Lz9ZuM=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=049qh9FNIufGO4G7gKITPeJTHKuvL0j6Xx5fUWMS/2tzTgH2Hpk3vego3oPBZ9lB2UJ94bgnfQLWFoKtpUAWBgvQM0rrmufduLaLjnL37CBbrxYUL84aQ0mnpVyldU+Y8AktgCDyLd+xBaHzfjQa1ppz7PTVOOFYsXfu3v/oIdk6NkWqkFWN2/KKY8yZZkQfLnDEc0L4P/qhNGudUqebC/GezIT2ICgSCPc+GrimlQ8XvMigoaBRxrETc0T7f07ikFrMJ5WwJInk01hkqB2+k/cUnRyQwYuhDS3agYuW10Hk2LRcOcn2ZDMlNpCH6HmlAEus7X/jtcnH7xD90h7nUQ==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPSA id F41F318003FF;
	Fri, 18 Sep 2026 13:16:00 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Fri, 18 Sep 2026 15:15:12 +0200
Subject: [PATCH 07/14] arm64: dts: apple: t602x: add avd nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-avd-v1-7-49977931f455@icloud.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OCBTYWx0ZWRfX588aZ3KYV6wg
 X8haV0Pcti2l5eSp8AD/8MJhXircof/+GasuOuCHzQIT+T+bOigU8ZD+6K3CFfMxRN824P5lBAR
 XhLv98VgP9upJS873i0ux1rkHdFjEX8m44Y9rrxpm8mnPjoVk5V8Q9282ylOgMl/JRTz2PBg9PR
 f+a9dwNKruVmMvfP1QVjqziXxsFxmq+UftF6bWQcYJG/85BEnACfFDpfU2S23Z7rm83nShT832m
 ysR+KsKTM0qd2hAFJ/6f8pbiiBfiDLmFgXTEu9ajj7Z46EtXpy1WhKyfoknIFd8qtooB3QBEX0m
 oEm6UxDP2j9Ew6NQHXw/aIFu1B27r1Q/TFsgfNSQXnFb6FBNWHcw0Zxsp2IR20=
X-Authority-Info-Out: v=2.4 cv=DIeCIiNb c=1 sm=1 tr=0 ts=6aad3997
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=UcMGxPN7aOZqZ3wHYxQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Yl4RZ3YIdaJBHUuIETWnsy915N6kVXIw
X-Proofpoint-ORIG-GUID: Yl4RZ3YIdaJBHUuIETWnsy915N6kVXIw
X-JNJ: AAAAAAABI/t4w5EZW1dmIGamvZ/3T9+UqM+bgZ2ODOl4KhrjM8JnwkfzrGG/3M+ek5JRgMnSCmpSTPdmH/Pwl/gibkr9QslF71IyVwFcBdVBrPEoi37OLRFq7GPlcpxaaNaOCCiOAKc291b22F/1zvt9qIZA+rFNhHEWD+Bt0riEziOI0RrDockHaQrgHtXjlP+a8/IW8dyR/Tg2h4Y7i6rmx7Z/A3Zl9hgXex0ukAEo+dcp2YTP0/sPKMHYljlZInOAj8ojdLLmYxJH+oXMbXRE+Vo7jdJhxcCnQa9zoTDMIpNScEMcmEM9QkmlzXvY1evHsL6/bRQDVygaCZ/cSNQa/Iz7peZ8F2jmWM2buRN9m9fZUuQJ+8XkEw+6eqRTbGCQEohltpRsAFsY8cCz4xQ4nc0S0xAz4lpvfqSI+znsWTB2z6L/LkBWPYEYklsoCPaeb0fue0KuklEWSPJIPrUeQVmRDNCd4JXdAN3xLBBHTz1etzGRAaL0ZEkDgZ+wzJtjKAlUTYRrnUidGxR3OSMs3RRThIRidd4aGPcF3BqXvlnTgCe+jFMyvFLvg9OxZp7uxYu9+8sGPspLYCzeAY608ES+celvE2U6TzDtwyFydRid33cRl8UPdEVd/KxvOmxaZKiy1RhGI6EphA/Y6nQQUQzhvW6cXXcbaYJ6PcjEMY8Hls5XF0dKQeTqo00CZaUPPcNMqp8eUoNkRtRM0kGyJcnztmok7hYWyY8fYxfc1oKWATevvuoyRLkrqa8pGeDcmkDsDfr8gYvfU6ESBSnAiMaWCsoM1GDD0emEs2l1TpjI9qVYEUVWSkilrraq6iJFB5MP281SgvCuUyC3jrOaHzfwDAvFa8qxEayrAHF+fChx6q0TbthQMc96CpXzljg=

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t602x-dieX.dtsi b/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
index ae3d535c5acb..4b169a2cb9c8 100644
--- a/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
@@ -23,6 +23,30 @@ DIE_NODE(cpufreq_p1): cpufreq@212e20000 {
 		#performance-domain-cells = <0>;
 	};
 
+	DIE_NODE(avd): avd@287080000 {
+		compatible = "apple,t6020-avd";
+		reg = <0x2 0x87080000 0x0 0x10000>,
+		      <0x2 0x87090000 0x0 0x10000>,
+		      <0x2 0x870a0000 0x0 0x4000>,
+		      <0x2 0x87100000 0x0 0x10000>;
+		reg-names = "code", "sram", "mbox", "ctrl";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1088 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1089 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_avd_sys)>;
+		resets = <&DIE_NODE(ps_avd_sys)>;
+		iommus = <&DIE_NODE(avd_dart) 0>;
+	};
+
+	DIE_NODE(avd_dart): iommu@287010000 {
+		compatible = "apple,t6020-dart", "apple,t8110-dart";
+		reg = <0x2 0x87010000 0x0 0x4000>;
+		#iommu-cells = <1>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1095 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_avd_sys)>;
+	};
+
 	DIE_NODE(pmgr): power-management@28e080000 {
 		compatible = "apple,t6020-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
 		#address-cells = <1>;

-- 
2.55.0

