Received: from outbound.mr.icloud.com (mr-2004j-snip4-3.eps.apple.com [57.103.69.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7BF45038
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.69.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737368; cv=none; b=aSYBHwmyF3tBYMlNAS1aGNaxrz0joKG+qU1vz7s4nbjXxDj1ZH87mtkxTh+lulyuJ6mzRT9i95aY7wrdElM9ZPvbS+43f/7ASRms8YuL/gtiWH2M4JCrmdLdo/reJflbkm8OArv0GW+8dBB3d/gaOn9C3isQr7mpQLd6kiACBf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737368; c=relaxed/simple;
	bh=jP9ZDFR60NYit6ABiOmH/Lavx+uTPK7QVaW+Odq3LLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/cE6oBEr4KWlLpv3ow1pYy7yR54nimW/Mw2V3hmpjZfMv2be94ext0FyodZx3OUrjPffdK3cqVpgEU1k46RThnipUPx+Oon6ex/aFqoME4w194Bb1Xh38+9H2Upo5XlFAbYsZjz1xmM7+ep+4aZgJ+BI0Bg6fCRpltBiBoh8uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=GIiL3brA; arc=none smtp.client-ip=57.103.69.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="GIiL3brA"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPS id A7B2A180184D;
	Fri, 18 Sep 2026 13:16:01 +0000 (UTC)
X-ICL-RepId: 01a0b4a8-e08a-7f5e-b2b1-a2a54bf71b25
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QGUx8RTxweGwZGBF0NQQpaAFIBQV9MBlh3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789737366; x=1792329366; bh=b9Z1EKPmlShwMpGII7yPqkTPSlj73nxLAi7CYJVWTWc=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=GIiL3brAoY8rszKm4jZuNunQK4ypLPz37Odrb0XAy9VbNchHj3TnrRwTAfOMMLhWPQwdCiAetLwDiddPc68Gg7wH3j6FlkUVqll3v+vx278/6z+l/ZRVCN6c1KZc48IlQpjKJrw1T0IKZ1IOy90DAKeWq0K0+DvKxIYxtb0tSDLDfERtYxfflCmQK0ipiGMJeo2qeSuVLDa32vSDJJR5M80lDKtZiuctfk3s1btmGNpqYIHnGL5BO+02a+Eoh93N5ol+ILStgk4qA7LOJ8Y64OOWys/8ACxac9jRBYM8+FsjRXJu7LBA8seQfyk04CJYU8uLPBsxDB/TA7ZqzJwoog==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPSA id B35BC1801861;
	Fri, 18 Sep 2026 13:15:57 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Fri, 18 Sep 2026 15:15:11 +0200
Subject: [PATCH 06/14] arm64: dts: apple: t600x: add avd nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-avd-v1-6-49977931f455@icloud.com>
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
X-Proofpoint-GUID: dxqq8Td401BZYLD8vAdB0753CS8L1II5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OCBTYWx0ZWRfX3zMN15ueUXU2
 WtYW9qciOtIrgHndQjuj6GH2OhAbwqTOQpil85ZgmGc4bcvTt+NS9sB0lchGA+3sDfUrHf9W7p8
 KL1oYXw3N789Tl45XBktF/1TC9jCrumM4/5yimqGyCs8SSQz09WngnAOph3uQGHTuo/9YqvWl1S
 9m9v8FlE7WhGKwgZNPO5EIXMt92e+oqk2N33P6u9MY6rQ5q5IW7gmaHvRbjifQj11aG+/z+3tba
 ctjzPh4VhpGHEZPoZ4dLmwTJHas5tlkC2bmrLfHrj1vZSWmAjck5OatCKUW5Gr+HujkYVm7TKsh
 LG6VWWy6C+Jn7QiGpWjHARIQfVBEv/9wycwAd9lMRCi8eSd7l+IFSQbHDdjVPc=
X-Authority-Info-Out: v=2.4 cv=Wvcm8Nfv c=1 sm=1 tr=0 ts=6aad3994
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=UcMGxPN7aOZqZ3wHYxQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: dxqq8Td401BZYLD8vAdB0753CS8L1II5
X-JNJ: AAAAAAABc3K2uFbQPqz/4nTc68/UZMZM2qQCMsp+ELc8Aq59fbysW/ufwwDjVyE+YHzXRdHOUxhO9g44NgiT/Inxis5EwmqzzxZEZ1SC05fM9qC2m/jddL/m5LKVYEV7+ztDsIOzc9z8rynI7k/nUAlJAAB7AiDDrUCSqmVN6QfmacPwWykeH/RdPNb4w34S62N7qTqBQnBeZho/RK1jmf9NfGA6xtrYOyNiXjkd/hTtFJ4PaUFbEfI5tVl6E303ia1LHgtMZZnggREdN5Um/h8daJk9EasRcFd5fFxY9pNdkk+3PuTRPtJg1JmA8DWAY7x0aC5iMfvF3uLe1r2w8i/SE34Y/8J/173xaj4ZiR/JLIwKP2DlOi62usRrII/bcIDA8DUhoI2G+Nf86yLCmEvI8a/QNhS/LYPfBvlUt48vdpoK/pkqKt6Vt8wXw7XijhrMARlcQo9M7svKAF6VFc8PIZfrVf82Nu0VBsc4Qki5trzHVUjPEHl0w23bDlbA+/wMv9N1q8PP5COHAO/9O/oC5/HNv+1qua3UeBMriEboqtCv2sEVMvYVPkrO0J2spdcb+Vh7MJneEpPDJWYaTQ2abVt2DaSC9fzSIOuxHfE6BamZLOZ88uGMTP6WHthlZvNaK97yqhl3vWurUFgAMBqBVJMR362zXEQ4EGfo+XBHhHO9F9e4gHUlDaQxhIWLR4cOof7UG4Erjp9Xj1cBqQs566MTzenraFE4A6EcWWd0AYBBCu/0wICyOGlfrjSI24mf5G32Xhj/ywtffaXPxEmWUyb/iluQA8cbEz1mjW756Hp/ZTdh7CWBqR8iMdSyZLR5ecMR2YDbCK31OU6XCf2nwiRCnSPchnb8FbPz9xj2NZ+blotVL5qXmi8i3xAm6ed5P/bm

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-dieX.dtsi b/arch/arm64/boot/dts/apple/t600x-dieX.dtsi
index 9676d5127039..14363789ed2e 100644
--- a/arch/arm64/boot/dts/apple/t600x-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-dieX.dtsi
@@ -24,6 +24,30 @@ DIE_NODE(cpufreq_p1): cpufreq@212e20000 {
 		#performance-domain-cells = <0>;
 	};
 
+	DIE_NODE(avd): avd@287080000 {
+		compatible = "apple,t6000-avd";
+		reg = <0x2 0x87080000 0x0 0x10000>,
+		      <0x2 0x87090000 0x0 0x10000>,
+		      <0x2 0x870a0000 0x0 0x4000>,
+		      <0x2 0x87100000 0x0 0x10000>;
+		reg-names = "code", "sram", "mbox", "ctrl";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1011 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1012 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_avd_sys)>;
+		resets = <&DIE_NODE(ps_avd_sys)>;
+		iommus = <&DIE_NODE(avd_dart) 0>;
+	};
+
+	DIE_NODE(avd_dart): iommu@287010000 {
+		compatible = "apple,t8110-dart";
+		reg = <0x2 0x87010000 0x0 0x4000>;
+		#iommu-cells = <1>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1018 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_avd_sys)>;
+	};
+
 	DIE_NODE(pmgr): power-management@28e080000 {
 		compatible = "apple,t6000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 		#address-cells = <1>;

-- 
2.55.0

