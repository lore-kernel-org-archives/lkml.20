Received: from outbound.mr.icloud.com (mr-2006l-snip4-2.eps.apple.com [57.103.70.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B57845038
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.70.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737362; cv=none; b=iEd8A+fSxE80+BkDSkPKM0ASUhlHny+2aEQ+JPq1Z+u4zNQelCldtormYDZj6NeYevFFXiTnoQQ64bwRnl4+3GPd2UZ9rKQV0QoS3zIhsw6VfeTW1uFithAGQRj36WUk9I2gptrrnkxCmdlX66msRPd0Qlu3mYbtqZa8vRt8B6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737362; c=relaxed/simple;
	bh=HgqVyIvyYs2ZAJGC1ym1ERQxQ4TaTlWuRR4CjkYwTCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dzg8Sih4pqecUuvrzBXpSFTrFfMQ3I7XBePzvBTHiQujsH7yZd5Z7DJaQsvrErcR2tlPYW0+ZxaCHsKMxtF4qqf2o0vGCYoMG28MSE52dfbMUscriz+Tmg48T5iaBm7ODUnVADiJbasZKCu2tVz0qiTrpBt8l7f4srgIaCqRy8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=TkjhlDzs; arc=none smtp.client-ip=57.103.70.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="TkjhlDzs"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPS id 0FF2F1800097;
	Fri, 18 Sep 2026 13:15:54 +0000 (UTC)
X-ICL-RepId: 01a0b4a8-c6b8-78b0-8674-63efad00d692
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QGUx8RTxweGwZGBl0NQQpaAFIBQV9MBlh3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789737360; x=1792329360; bh=4QoH0tIGAZoy458UC1aKy8+60rV74RRaJ88zRaksxQs=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=TkjhlDzsljxLyQgFh+1dvffg7YZXQC15fGgKjmzgPYAJaNx3/gZ07d46PLL2m24TuthVFzE8exB0HEZf2/BepnlmZU4R7oeumg1UoMH+aPwsp1TVsA4I9CVBEyCR0gawQO1aryXlVVWWCv6Hy2rJZBhhFZodPNl6dQNPRDVb8i+24uHQrp38RICmmkYHQivtG3pjabgnBp7/I6+Um+ihSq0Sp4ut7pfKOGNKF9jT/diJ6lbBBxnJ51ApNrU3UKD8qZDdNuUcIRiifjrk07zJXEaSeXC3Dpxxr91gGgD9UuhG/btAZJf+IGhuX0WhBNV/f7sdvFgMRgl53KQQtZyUqg==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPSA id 334C81801868;
	Fri, 18 Sep 2026 13:15:51 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Fri, 18 Sep 2026 15:15:09 +0200
Subject: [PATCH 04/14] arm64: dts: apple: t8112: add avd nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-avd-v1-4-49977931f455@icloud.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OCBTYWx0ZWRfX/6hqvSDNOEFW
 AQEC/64wOzbSZS0kZWa1QXf3JxZxCODXhIsmi7rjgEBf7Oq+cDsfeQtZ/2NXyzIWTzwpSHZzZeQ
 Zj0pt3yw6exZ4+ONqPBS8sS+fVQV4J5t7RjXIO0tejom2YyZztJAs1YLVtYUL4Rwm/Ts41DVFoa
 XCPsZ8gz2ZaLlFNzSTBfpoBCvVL0SoADZmMTQHgQH3fgoIa7llbilcaCYpvQzbynMcBU+mIKAnG
 kR3LHn9eJV/B+yojoj7l+Jam3PcG++HrLHbeZJ0JFLZnc0Qmk918vHQwNkmqDlR+dMW8aR5xsvA
 iMK2fgr2IqOUC5sUI7CZ2P8X7l2SHL/3E9DUK9DQX4wthwt/cemyLGeW/QwEok=
X-Authority-Info-Out: v=2.4 cv=YsAChoYX c=1 sm=1 tr=0 ts=6aad398e
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=i4oxPFHrzJf6BXMseXkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: v62l5HK5i1OfFYVImCLldcRTIkEegq7C
X-Proofpoint-ORIG-GUID: v62l5HK5i1OfFYVImCLldcRTIkEegq7C
X-JNJ: AAAAAAABWAgaL1HfdqKGlhoXK4fE8xcVMWmUQsM7yS1K+PUywCbSaqpKl9o6gfBrK3p/u7jr9T0GIRYNeogxFoYFHBQnoZAcsSRRN/Tw2CBetlCCl+tCh1IaFHuW8Gnkn1/+XmdHTZI7do55vM5/uJ9zjDwPVE6SSFt5UGo/2NfFJx4LZUfdKLnllYsA3SRDb2AcVB7Pyc5+oUp7hOOAnXqzC7k42eeXcj5TbAG8JcaIMVwXm4TMG32k6WRq09dtOvBZ+OHbpp2m82DvUm3CgDQ2gQovJu3n2grown0Y0ZdKugVy+OEdP1uRRWK4Hh3vY1Dl9pvOhczGrbJ6qXamVaRIP4s8G6frMrXWr8vsWpxyqXvuwPcjuHpkh9n579qpGcPiDAxClDtpjDi2/lG842aKHqB1/STEbH+/aOu46Mnt9eSHMg0qlIGwvpfVp8sHlw277lLl1O4gN/a/iewJs6DDNPWIZyV8+QUaROgZBH6Su/Bvbj4+MOGHo79KZckHzpU0Tkrj8nuNpteComMNh7uDnvNcBsattuB93vRiDPshIw8PWHluFA8cpix7rrEKQBZjVTLJJJMHy9FaptPiCEpsx+l9KbUnpNpFEcKLcvwPmXtwq+2K9TH5YzCYOyS/3bg+yCyoxiUrSooBq/ecTnmTL8eUk2LhlJO1togjsc/rwOHYhNpJ1PvfjAXtDmWHt8a5e333tjybL6rCwQUGixtDELSpzjv0FXi/nKG6w0PGuNOyYsb16on6mb6zAFufIZNtGwrmRmRxufDVaNZgLefBxE6D2hGTd9G1nWzvBU2Spf2qis7eyPVNU+6ntXkLpREm4CEKCVX4O4Eu19b5KKxP1Y4Mvdc44XDHbsdMeXQDYsFMZ6RuHpmN3zdj4JU6sINNOLk=

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 arch/arm64/boot/dts/apple/t8112.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index ec248ca052cb..83b1bc27dad7 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -987,6 +987,30 @@ pinctrl_aop: pinctrl@24a820000 {
 				     <AIC_IRQ 307 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		avd: avd@269080000 {
+			compatible = "apple,t8112-avd";
+			reg = <0x2 0x69080000 0x0 0x10000>,
+			      <0x2 0x69090000 0x0 0x10000>,
+			      <0x2 0x690a0000 0x0 0x4000>,
+			      <0x2 0x69100000 0x0 0x10000>;
+			reg-names = "code", "sram", "mbox", "ctrl";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 667 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 668 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&ps_avd_sys>;
+			resets = <&ps_avd_sys>;
+			iommus = <&avd_dart 0>;
+		};
+
+		avd_dart: iommu@269010000 {
+			compatible = "apple,t8110-dart";
+			reg = <0x2 0x69010000 0x0 0x4000>;
+			#iommu-cells = <1>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 674 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&ps_avd_sys>;
+		};
+
 		ans_mbox: mbox@277408000 {
 			compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
 			reg = <0x2 0x77408000 0x0 0x4000>;

-- 
2.55.0

