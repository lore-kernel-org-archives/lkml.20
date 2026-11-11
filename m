Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426041;
	b=awqI8I+C1OskfpLLhVM22djQh61kv2Ehrcu2l0Qa4eBFaNE8rv5+Mx0z9f2OIbKTH6HT
	 K+Gwp1i+qM8lt0jLrparsUzp9UYxZgN4LUNhBpuiFQvow3tUkSUBF7KpGVRLZE2Jb4uHj
	 xFnXCLwgww9Y5EdrgyBeUqahOx7lrjNoInAmx/H0R+Tuu9a7b7Frb+Fal1pOwxxBJbXYe
	 Q2VNC8HLt/1I1wGIx5LpPhfHubk3t21S7E7VPsZFLKZd3nNnrCgSjYCo0kTQHxaj3QQKM
	 4Hfg1ShlkgemfXBoqhR7qbAqHHFKIxYyRbZBRYJVyo0UXXpOFDf1Dc3POTeaoRSMAcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426041;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=1zueIy4IpFVqmygoDdLCHo8BpwK2BqtoOiBnrgfJRao=;
	b=WmKQDkxW3UWKZ3IaSghhLEsdrMM/UL1Rpi0bQm0aXDxdQ20I4VEuJmeXWwtblus9WWRD
	 LfKWYSTiwL5S9UdiPWOhl3YEDy5QHKT1Ecyp8ZdeGgo/FRYyCul94ES8nUTh3PmNEZWF2
	 m2MORRR7SgyjBl9wXvrQPktpDFysvLYve7UCKyKEBs64iD/alVqkZAa2hxJ5j7owFLS4/
	 eRGfbr0xJwK7RJDSOEaYKsc2BCuP/gIGtdC29u5bRcSgZ4XaWhxm8F3BF/Xozg4U0DajB
	 0tKTUBp7L9nUTnKcBv/azxQPi+Ha+c6A8wkmijUEaosLZ1Xab0OCpom6mXBXZD8QMiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kKZ0Ghey;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692856070099;
	Wed, 11 Nov 2026 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kKZ0Ghey
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1CD41F00A11;
	Wed, 11 Nov 2026 19:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426041;
	bh=1zueIy4IpFVqmygoDdLCHo8BpwK2BqtoOiBnrgfJRao=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kKZ0Ghey3qJBAYXsVpyFj0ax/Cz2c2Y+3xFiVLwuAfjcolArrDGse7L5u40UTQIML
	 a4/DFOhm9FY/Rmp0BcFl0TUIc42JHgw5c1ea+jDu9WGY4Mi6U8opvI7qW7fvJaWq8X
	 HwNuUfmvLOv368Kz9cazcToFOdQ4B2olYz9YRx4MsdIPDZSUiEhNu9+XcyZVPAswI3
	 q7XMdjbg9289b8Tq6mMXO454YbjdiQ/9alFHkkqX3Q4j9U3LoqVdP4fiMgQAMW7qH/
	 1P+uAdsBA0hnY7+D8IFEhZQf5dovBG361JsVFzzbCzXOUcSH9wH3BzgN76uk/1NtSX
	 MDkFRKVfGuCfg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 13:40:20 -0600
Subject: [PATCH 10/12] arm64: dts: hisilicon: hi6220: Correct I2S channel
 ordering
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
Message-Id: <20261111-dtbs-hisi-v1-10-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
In-Reply-To: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

List the Hi6220 I2S transmit channel before receive, preserving the
channel-to-name association while matching the binding order.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 1cf552d02ecd..2d65d9b501ce 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -906,8 +906,8 @@ i2s0: i2s@f7118000 {
 			clocks = <&sys_ctrl HI6220_DACODEC_PCLK>,
 				 <&sys_ctrl HI6220_BBPPLL0_DIV>;
 			clock-names = "dacodec", "i2s-base";
-			dmas = <&dma0 15 &dma0 14>;
-			dma-names = "rx", "tx";
+			dmas = <&dma0 14>, <&dma0 15>;
+			dma-names = "tx", "rx";
 			hisilicon,sysctrl-syscon = <&sys_ctrl>;
 			#sound-dai-cells = <1>;
 		};

-- 
2.53.0

