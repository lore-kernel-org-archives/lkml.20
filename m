Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794475354;
	b=kSl4hfku9xXeTj6vSf8hiLwG9w58QEhNtZWX9+GRWxUn15O3CWYzT+HqM7yVtqVe2xt7
	 hbBx0QZ0iJxU5QXJ4w+1MpQ0ZaJZLLtefcTWkv65+BHipwIGFvhySt9Eo4hO6qxzJ1UQU
	 bdkBtAE9H8p7gVxKUb1WTt54OOeiNYvxBMjumOegKszF4awiil5u7ghrkv1dVLSq83VHI
	 E60F25o63Qd64sqyXMU1kWLlEDdvr7frs44u2wbDmQsyg9FKzHRRUe0+Fj4WFFAfN6aBV
	 fcUZ8Qw4vXr4xj9MfRAdJfuljGp27D/03sIHyJQdTw8W+P5i7j81+fJbkGCugEfA+NA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475354;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6mbZCUTv70VlpZsgPw+uhGGcoEUvKC9H4qZpsqc1/Xw=;
	b=gVLsczVdP8aBmlXJSDyyE+mrMLy6EAlENS/Jt0sqR7jkakt6dTq4JXxrM9eWoBNp3Qzr
	 M75cEPohJ7raO/G2Qr/2OGainmqwGaxkiUbo50feyWZ8yhBHm6MVtjrZ8Xtd96KKGjFMk
	 irbfOSF3k2lxGWUpDjXr40nXcmteXTCDcg5n9hxZDQj7KIotCMibQGECcGnVULngebMqT
	 x3/xpgfaBTIidjj3LJPBkvRuztvmo5friROmhICY9DXtcg9qYuGXLD41kMpvRqcKbSikd
	 6xoK6f/OtTre6+PpXtJbyVXUDpKqdpaTgIH6qy/32Pbt+jffa5ZGri8/gaqr4wi2Jfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IeYYg1Pa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B1E606A88C;
	Thu, 12 Nov 2026 09:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IeYYg1Pa
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794475353;
	b=uARa9LF0TUavjIGuoprsmOEf1sCp6ABq/JJAPELdP9fz36REiTMuKDcH5OJwaLbaNDkR
	 9bPXAMOHxK1jTH8/CQ5Uz57gQots6vX0lCbsBrAfwhf0HVsT8K2YKH6lg9bu8WsUd8z5d
	 SJgopYnPANCBNOnwkThAJDmDp/o3pgdjGlAlrMUEXxV4pa4lmCYuOVt71zFUfn5R9dhW1
	 dh+hX7Jyq1JYtDquSl7B3Z3xFVzAotujVABFWsPssnDJ1WJoGmkyMjnjq73L3CcS/YDoZ
	 AhBglD+o2WTSNh0jQVV2Igg8Vnj7+WjWp/YqsBUBzE4r4Ul9S37wEvltwN4ZXcMBIGw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794475353;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6mbZCUTv70VlpZsgPw+uhGGcoEUvKC9H4qZpsqc1/Xw=;
	b=y3asNfRofb3wFBxyjV0ejyhI0AAkjgUiUZXLQ8ubICwleDCxOYUUChad0EgMlJFK6ZtN
	 LB4oHyBb20tv+IKsZIH+FQrK8Bxhlt7XXRlUB4kWPcwXGrAhUcsCursJUjXZf7PUekjZk
	 BlFR38PtjcAbQZbl2rxcvNzKt9c+9v3RFWMV7EtzDfbsHEUpQ8ro+PSLuKA7cMIjJJSBd
	 VLz3cARwtcoDzGZ+exO8BxJxcu4hdivLqsffJbjEglG3ufSJx/yVBMUqRqazCZe2CiOCF
	 Ddj3jqEqFpEp1+sVmmNsFYZnenbghAuyFiPWcDqeByJIjxg+f/Lo4RcJPXy3iMfLQrw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3371A1F00A07;
	Thu, 12 Nov 2026 09:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475353;
	bh=6mbZCUTv70VlpZsgPw+uhGGcoEUvKC9H4qZpsqc1/Xw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=IeYYg1PaZx6xfFvUs886dG5pAJJp7j0YAoiRHZabETfnJa9RCkQ4hRu8qxkcKVYjD
	 RM9uwdsUS/dK/sGPbW54RV9Gl2ybZAdL/qppZTgISz4yD8mzOzpvML+PZlL4iAahO+
	 hxkY16uFcZxNlglYdchdawG+L0xHSxliDPuilzHzBcqp9ZOhIQ0y45jGLqI134eJxT
	 9r9MHQvjalFo4th1Zz2GUd1NW7AKJGqgXba0HUHsKNxazwuC2tNi0J2MfRVJEiN451
	 xmjk3UAJY36e5jjJaHdiWN+m9kC8yb4XLMrOKyD/XjxZgAVhOhA07J9WlUeKeayeds
	 oO9c5xMx1MTcw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DB8D049440;
	Thu, 12 Nov 2026 09:22:31 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 09:22:36 +0000
Subject: [PATCH v3 6/7] arm64: dts: allwinner: orangepi-zero2: Enable GPU
 DVFS
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
Message-Id: <20261112-h616-zero2-dt-v3-6-1cd2664230c8@gmail.com>
References: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com>
In-Reply-To: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794475350; l=990;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=5MPJQC1S+CHiR8Bt9vkp2Zk5ZwEghmC4r8Nx+9ugUME=;
 b=7bRl8nh/MjcKtdJeC1r1xldSZf6C3L0oVqhMOpymWCqFDrqH/sYB7YXDInY2TdLyyFl+izRdE
 v53GLcNLebLA5OoCIGqyWY7IoUJhAQaOm3duUr8u4Phe+e/979KJD7p
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The Mali-G31 on the Orange Pi Zero2 runs at a fixed clock. Include the
H616 GPU OPP table so that panfrost registers a devfreq device and
scales the GPU between 306 and 600 MHz with load. The voltage window
of every operating point overlaps the 900 to 990 mV range of the GPU
supply (AXP305 DCDCC, mali-supply).

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index 719d6dadf7bf..ca78d094c431 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -7,6 +7,7 @@
 
 #include "sun50i-h616-orangepi-zero.dtsi"
 #include "sun50i-h616-cpu-opp.dtsi"
+#include "sun50i-h616-gpu-opp.dtsi"
 
 / {
 	model = "OrangePi Zero2";

-- 
2.55.0


