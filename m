Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208BC3E0C4A;
	Sun,  6 Sep 2026 04:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788670022; cv=none; b=i8z9sQci9gcx7dqYpXJFaq7EuogavHdsuteHgVi0h+sOSEbQSlWssbC75xIzOITFY+LrYE2CdqKhTuPnhAuRsA6I9x9Ldvl58hkwKH+n7IBG8NqwaqZPfbt9LjcRD+ScKHP44aDnZNJpM6FdgVAha+x2OUTao04OsbAN3i1mzNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788670022; c=relaxed/simple;
	bh=XU/WWn6wXEnjfkMrNJ55MXZyduZW1YwOpLbOtLkSfNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AkimYJPSwZaUbnZcHbJnu9+82B+ejEm2y9qx94/qTu4z+a505NTYtxxekipnKzxjF4Y8BM1EeYmca6i+clA85RdtiQ/kasWeWDl/Tf6HciYplEmR/ktoVh/xIb/2Vs52Gu7Q0S83U+PWit2B0CSfUZeQu/a7jeAy3AIMw8B0HAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GAe7iQE1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAe7iQE1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3121EC4AF17;
	Sun,  6 Sep 2026 04:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788670021;
	bh=XU/WWn6wXEnjfkMrNJ55MXZyduZW1YwOpLbOtLkSfNA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GAe7iQE1d7oTIQiwJCFVxCXSbnFFy0bSvk3wy38U+TY40oVOxiOLQejCXMENlnMww
	 R62+fSfVwHUsIddAOlk2SKy7bISLRuANSda9fW7T033aoOipYEPXTRUiwFYGWRfvU4
	 VRQBI2oMsTrayBKhV8AqvxT7tgBpIrWrxrU46cpvDQuR/Biz/6xO7asG1WX8Fh+pjV
	 zhIaq6bDVOKm+sHmvfYlUDYM5PBYPQidOgNnCHpgji6vl8jLDK3KPEQv1h861HqDK4
	 nNAmT7P9iY8KcoFmF2iOrhTjU/iaTpoL1IH3BPdYCznLgdYLToS51rM1yzhC5P9En2
	 xdpg35vMTBVgw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D43EC79FA1;
	Sun,  6 Sep 2026 04:47:01 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Sun, 06 Sep 2026 08:46:45 +0400
Subject: [PATCH v3 06/10] arm64: dts: qcom: ipq6018: move DR mode to board
 DTS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-ipq-flatten-usb-v3-6-13e4e0f63123@outlook.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
In-Reply-To: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788670018; l=1428;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=aGVdbmVqvLfMC/B1qmTc6oe5SvSsjf2fzGsuzsOSZC8=;
 b=Xv2RysEOavWlN109J2KyxKnXlte5xkgurtiQ4I3ztOapEV+QDc5uarxRYihwjWXkv/i/CW5r3
 DzRsdah5FrCB22aODabCVtMkpI4+wkISdQ7DuXKMleVpPuDwXa3Nsoi
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

The controller is DRD capable, but it's currently set to host mode in
the SoC dtsi. Unset it in the SoC dtsi and set it as host mode in the
cp01-c1 board DTS file.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts | 4 ++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 2 --
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
index 9c69d3027b43..a366be17c251 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
+++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
@@ -48,6 +48,10 @@ flash@0 {
 	};
 };
 
+&dwc_1 {
+	dr_mode = "host";
+};
+
 &tlmm {
 	i2c_1_pins: i2c-1-state {
 		pins = "gpio42", "gpio43";
diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 0701517275d4..c02110ad9cb0 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -460,7 +460,6 @@ dwc_1: usb@7000000 {
 				snps,hird-threshold = /bits/ 8 <0x0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_u3_susphy_quirk;
-				dr_mode = "host";
 			};
 		};
 
@@ -716,7 +715,6 @@ dwc_0: usb@8a00000 {
 				snps,hird-threshold = /bits/ 8 <0x0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_u3_susphy_quirk;
-				dr_mode = "host";
 			};
 		};
 

-- 
2.53.0


