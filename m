Received: from outbound.mr.icloud.com (mr-2006a-snip4-11.eps.apple.com [57.103.70.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0B14F3905
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.70.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737358; cv=none; b=d7t1GqJG+XgNcSVdyjYm5JrSDD4iQrWcZ2ZMv2L8dl1FFA8ZcoMGjqbL83ara30SJShpL365h7HQ8QTy3IEHg7lqfaDnziFFZ53GvTAsaD59rdJqfIF/ieVosl0cdoyogFdDE8ZJBbHNWN6YkWrLfCkvcqVyWK8pZvFwYZzMwAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737358; c=relaxed/simple;
	bh=BVwhsuMglJR/FluauVgSg/aS4HnkMcpex1R+tk1cdis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bh7+7OXWecjaz4WLZwviFplLgVqNXetGVBQ1A0fLqgthab6rGvwNzwLsLVsLMBtBw272k2MEFsjmL4YsBsCD+OCekZbXmAZScCRjgr4dBxNcZtmRGeaKxbnoXIXMqtB5y2B2C2BuD76ClzK8K1fouqfKkaxl7W2KovKswbB7hIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=IrBSkdce; arc=none smtp.client-ip=57.103.70.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="IrBSkdce"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPS id BF997180016F;
	Fri, 18 Sep 2026 13:15:51 +0000 (UTC)
X-ICL-RepId: 01a0b4a8-b9e7-755e-b35f-6d2e1f55cc9f
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QGUx8RTxweGwZGAV0NQQpaAFIBQV9MBlh3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789737356; x=1792329356; bh=P2T+L9FFZVjNlUBDt+jAAlkIamQV58T46DjwU9aVz58=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=IrBSkdcetNZBxCHj/wLEYNKoZWT8qp0YYez2FXBFCBf5C9bWDPH/bwDAyF9Xahjk3zBzLkdESyYmgXShimfIXw+PFfHpUg8ZKgAQvDLgPTKBpDcCDGOwI99XXisNdSAnNJh/ThKsWoYG8uMwSEpt9tkU+Z4qUvxY9hqFvbi0V0IVecAzJpgZv4sIxDQYHcpx4MI1dbIjI7eYq0OM3y5NAF4XDjE7l9JHEg5cATVp9dfY3uYt5ZxDCg0ijuSPp325pQzp1JpcFr8zesrN1AJ0d/kgQW/ij0yq5TaJcsASwkz90ZkGlWoEwTo7FAAYD3qW3Ikw1UPodcdeAqGhZlIrAg==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPSA id E80511803F12;
	Fri, 18 Sep 2026 13:15:47 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Fri, 18 Sep 2026 15:15:08 +0200
Subject: [PATCH 03/14] arm64: dts: apple: t8103: add avd nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-avd-v1-3-49977931f455@icloud.com>
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
X-Proofpoint-ORIG-GUID: WjqEFYMt-ZFkE9ik0K09RdSSgdJBvyWG
X-Authority-Info-Out: v=2.4 cv=VaD6/Vp9 c=1 sm=1 tr=0 ts=6aad398a
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=i4oxPFHrzJf6BXMseXkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: WjqEFYMt-ZFkE9ik0K09RdSSgdJBvyWG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4NyBTYWx0ZWRfX/eT+kJAGs7q9
 Rjs83a9m2dHM5/d7x1kOyqkswAubhBXQXHm1cxNwQysX2dsfGsHRqAmWVypOmSyGR0JS9FCfgel
 lb+tGVB5RGVhcSNYpdqxpD6foX2kQr6puq0ZXfHN/tBiUfZZFuhnDWlNcsInpZdmHg1FuHm11Sf
 6d1V9EoXwFEWwV0MWLDaMB55AfnS2nHTWquHibgnjIhPe+tuEN+9SGuirxImi41Qxeg2ENuZjhI
 7LvI+3sAb+qsoogjZ4LrgleTl/91jv0qZ1rgxjDNojz7m6mk28ZceCXvc3u0G3Gdlb7nXvhK9nD
 CRyLK2Tu4BR8mCoK9DxR5bh4a/lWiappv4+HJBm8zZoAZnDxKNA1VhuJH7TYhk=
X-JNJ: AAAAAAAB7EMYztKo3uka50gZfVvwf37zZ6K+nPSApk06otRG6s1wD2IYFULVByAunS4JOarvXBzfkmVw0RMylaOJ+Mm3enH++juKasLkIYh9YHJ+4yVyDeQ1/2SdB1DEvi+Hv+AULqA/oR9+bz3zV8dUp5LE/qUzBWDKyTnUke/b+DFKo3fWo5PigUhqHoxoPPz3IvyREjpkVF8wMxVFzKOzM/G7JXeGxuWvlBOvR1eq5E47V/mpGJjgQi3RPAr+s40v10enkCrYOHVcobFOZChNA9OwbJcBs7IoyhrVBjxihwzT+1BX/nUmpZLMZoTlmw35ZGozodIPXAakjpuAdw3/k0Q3PnvNDWX2ni4PhIHggyS+v+8wWcL7xz0dhMhnr3ZhHXGnkuR/6yZnnhCl5GO4/FoC63G0EbQ3XKEQVNiVuC3Dncme6xwpzMnJexRMNkVfatGf9eCET2MXoD/eRzb0ncvp0pd16y/oWNNxwCRQ8Xu/uSV4VdU5qtD4PXu8fT04S8TufaHIxGZG0BQ70rJkDnUmgjcT8rJ8ZiaoIFtMVbH8/WUwL2ROEw0CZmUb+Dr8uXKzBlpPcxT0qqA//MC1GxGuRLlA80LJF8eNoBJEltNvViQ0+j8GmeKGzholhUx6YEFyGt5KMCwI12TP1R1aaGh6gWadj3/iGacLmqNJfBKh1P2GkknUNEmEXS+MpHeJNe9EdGltYucf8mpIoQjNVrxpDOmp8ftbt/eR4dy8GUnWmGi5jNtrzk3RBN6sAMpjpa1/T3IJMv6OSzmOr/tTIZ+ud+/pOEkRurkRUNVvJOWc9eZl4nHpvK3ClTPbpMX7F2nG55OmQC1LdZDIwEw1vDn9aJ6Hq8prYA1gHE5w7ahXC2r+rbgXGPOz6iKOeVD6Sz0ZeA==

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 arch/arm64/boot/dts/apple/t8103.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 5b68bf0df4e6..667992bed0bc 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -984,6 +984,30 @@ pinctrl_aop: pinctrl@24a820000 {
 				     <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		avd: avd@269080000 {
+			compatible = "apple,t8103-avd";
+			reg = <0x2 0x69080000 0x0 0xc000>,
+			      <0x2 0x6908c000 0x0 0xc000>,
+			      <0x2 0x69098000 0x0 0x4000>,
+			      <0x2 0x69100000 0x0 0x10000>;
+			reg-names = "code", "sram", "mbox", "ctrl";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 540 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 541 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&ps_avd_sys>;
+			resets = <&ps_avd_sys>;
+			iommus = <&avd_dart 0>;
+		};
+
+		avd_dart: iommu@269010000 {
+			compatible = "apple,t8103-dart";
+			reg = <0x2 0x69010000 0x0 0x4000>;
+			#iommu-cells = <1>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 547 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&ps_avd_sys>;
+		};
+
 		ans_mbox: mbox@277408000 {
 			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
 			reg = <0x2 0x77408000 0x0 0x4000>;

-- 
2.55.0

