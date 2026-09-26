Received: from outbound.mr.icloud.com (mr-2001i-snip4-11.eps.apple.com [57.103.68.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AF54457AF
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790428608; cv=none; b=PXZ7wgLmnM3Uqytba80tX9VH9PDOI6JQg5Wt8QQkpIAgpejC7DNBHh91yiU4H/oX12xBum9flTnUOJKAre7NoihRM9BHPNuI/Fk9tMPAfjLG6Vhvo/kbRAgJczbocFLZIpwDt+NkcbzYnJjRFGb2MTcs3sQuKUWGA5N5LyrALNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790428608; c=relaxed/simple;
	bh=t3Hi94aD115RD/unRJGPInfiKj3ehkJhiT7rRir5QXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cjx3lyhC5qKPqEUSGZ0cC/JftszPs970PPoPRAhRsgBmZHz0fiMDm+NTI9E+pD6N39RKGyLUuBCweif1u/XtrDC0FEIosYDyAfZzUugVrfaT1CFD13EQOheDsWxC5LJslCuFbrpZEWyNVnxfw2LWt3D2PepzdAoJCf5Sltt7Oc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=xA0wvA66; arc=none smtp.client-ip=57.103.68.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="xA0wvA66"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPS id 9E341180056D;
	Sat, 26 Sep 2026 13:16:40 +0000 (UTC)
X-ICL-RepId: 01a0dddc-58ff-7a80-b634-1c4c7f20929a
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QFXR8RTxweGwVGA0MUHVAIVQ4EEQpOB1VSK1sTVRdGCRkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1790428604; x=1793020604; bh=uM8lK9QHZOmgqHcjsGjt4gycxhVr4FZYZfCwcTDATwM=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=xA0wvA66wNeaHqEsM5Vr9kOWyfCTbhWnLrWGT/sTj86O2a+6wpkA0bBE38MlRnV3QQIgqGnuQEXEnKe9YYAEuWW/UlozqLzDXhYIlS+cBg3yQkZj20fI0G+TSOuh11PfZHyfkbuSlijJbuSU78ubRZk6a3rhydDvHT4ZLBLrV0nbKOVtKky1licG+OP8EHyJ9SUHAdAUe/BCOMbt0yKvh4+H5xV48pshT96BoeRhe98VieF67/heK91cXc5KB8ryXZpJUL/mhwgM0ho3pLjMZaacDYgbpEb0dTiFM0Jf8Lo2jjkwrQ+yrht26LNuxi54ANNlaYTTeBrywDIAndAAAg==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPSA id 642A118019D0;
	Sat, 26 Sep 2026 13:16:37 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Sat, 26 Sep 2026 15:14:52 +0200
Subject: [PATCH v2 13/17] arm64: dts: apple: t8122: add avd nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-avd-v2-13-ecebe6a3648e@icloud.com>
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
X-Proofpoint-ORIG-GUID: wchUSShTQnpjCCMzhMpkRvNmOXTMa2dp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfX0PSdUmlQNOqh
 aTb6nzoOtpuM1ErnbSH6Y7Ppprkkgz0BaxW832qgiyxVEgnnTpjiV4PnIwduK+/AGDq+GxF33jY
 4UaW8zk59dhlt58OVGLS/dGMa7pOA06ei5WmYhMMw3J51r8LKBe4dtww0HWrUpryY+gfNB15URC
 8ATPklWOBQpjlq/0Rxp/75ZRq80iqrutI6NUcjsZ4i2nM46Il+En9mJVYh25nM+iLCD30jNbjEV
 zog1dDZFBtzzlnpUtm5+NLYtaJ6jQhSrU7StVFpfVmJcC3KQokWHD4laVtiTflYobfWAZKVIhJy
 erGwqmqlx4PEYpfES+LnalN+trWHiy0VntI9WzBfWSBmmKKspaRJs6z7nN/2Po=
X-Proofpoint-GUID: wchUSShTQnpjCCMzhMpkRvNmOXTMa2dp
X-Authority-Info-Out: v=2.4 cv=Vbn6/Vp9 c=1 sm=1 tr=0 ts=6ab7c5b9
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=rETEL0j7aIRCupOTUFwA:9 a=QEXdDO2ut3YA:10
X-JNJ: AAAAAAABqRY8QLEStsnc7Ub1A5R1K2q2/7rJnaA9otZnvtjtszo6EtsjUx28wiZ4BodV+t6LABY74VSpnf2g5YoHDJhkkhzpWHp8bT9/WRoXrztff9XL3bPGWeX/Vyu55Me0PnrUAG8UWq4lTmy2ANNj2kaLdfMgkilxrHrtTnVP7cN95pyJfga5eBQ7Rmd+VI57d9VXWw+qKfD/hRt9zKYoNIuju6XVX8p9ov+NqSgfwRUbLeoBw/3CvnYCCFCDVnJ1ltCC0uz4A7RfCSmJ4Ea930DZ1C8QTsujvFP6maKK8Ya9y0hBgIG8SKhTu+UmezzHqaynufgNf6IK0Wc4+AIASulg+FQoiEaCrIbPGQBoqYDJ55ngWfhDRn5m8ZAQMkR3hA54LQNVpjVX3pJwZWUIMi6/f2qkEEvA//E1J80EAKOaP1EYym40ZdWTvtPrbL97nmGsr2rcnwDY1L6wHl1tQ6HsSfoCQmfHw4xT3LOfnp1tElvZwajYSvJO6yMXj58nk/Og5Zsq0DE1d0XAbVcgbq1HTGCVClHlbDE2uRyto3bRkQ8RdZMlF6UcNGQzj2Qum6jVb1erJBmJI2rK/+SWzKcOAJccgIsHrsT1SS160cI3J1cVwPuZNmu/ZFR6WheUqAXs2d0/Ny080AlArWGcF+faynfHzccKZIxdls45nssV0s7A5nPGgt2oDXkKYOBFyPcG02PKC25dk+xJRl5s6rPwYfMHtmVXM92aPDBJ0XzfHrMmvyYy2voH2BQ+odUfV2JturrUlTatbAfGoolX8hmAGOY9XZM1xbOEhq43aRvrGvM6xMCV4Dp8368bQle8Pjy3CHbeWUWlGbS8fVvzm9Cpx5ASCmZdq6XehvLjYCbeqLVHG82iAKiPISwSHo+i

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 arch/arm64/boot/dts/apple/t8122.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index 1ee61c5b3409..25e47755e095 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -186,6 +186,38 @@ soc {
 		/* Required to get >32-bit DMA via DARTs */
 		dma-ranges = <0 0 0 0 0xffffffff 0xffffc000>;
 
+		avd_dart: iommu@289010000 {
+			compatible = "apple,t8122-dart", "apple,t8110-dart";
+			reg = <0x2 0x89010000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 686 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_avd_sys>;
+		};
+
+		video-codec@289070000 {
+			compatible = "apple,t8122-avd";
+			reg = <0x2 0x89070000 0x0 0x4000>,
+			      <0x2 0x89080000 0x0 0x10000>,
+			      <0x2 0x89090000 0x0 0x14000>,
+			      <0x2 0x890a4000 0x0 0x4000>,
+			      <0x2 0x89100000 0x0 0x10000>;
+			reg-names = "piodma", "code", "sram", "mbox", "ctrl";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 685 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mbox0", "mbox1", "mbox2", "mbox3",
+					  "flag0", "flag1", "piodma";
+			iommus = <&avd_dart 0>, <&avd_dart 1>;
+			power-domains = <&ps_avd_sys>;
+			resets = <&ps_avd_sys>;
+		};
+
 		i2c0: i2c@2a1010000 {
 			compatible = "apple,t8122-i2c", "apple,t8103-i2c";
 			reg = <0x2 0xa1010000 0x0 0x4000>;

-- 
2.55.0

