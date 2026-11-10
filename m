Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794289020;
	b=MKtRoakzgTAUSsAlhM/F2eOKSd3FjMQ5L1Fauxtx/4dUT+T0MzKozkKFBoCoxe8S6R6+
	 w+q6gPvP5VHkQlz/TCSBubPz57olz2owF4QwbLbeo38B4BgBk+XvYmQnZ5uREw3Su3LB5
	 WM7w3bdggYuFhJZm46XrBsN9EJ9gNG6dx5PDzSkEm1/J5JXRtlUjFrAc3lXdhnTkhmfus
	 7fl5aaiH33lF8wnQ6gMfIQEIg12Fl5XLfUxfoMpxlN5IG0vzC4fAsr9PvqqhIHNaY6GRY
	 HO/H68h3GCFlYYWFrHkV6zNT+sfTlbgV3rTs2lj7eRNvt5gI2Bp55Ppfdf+ouhgUMQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289020;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6mbZCUTv70VlpZsgPw+uhGGcoEUvKC9H4qZpsqc1/Xw=;
	b=jXZdyrJwUj+xeuolQE8NghHHJCQJs959qz1nvTgj4fySlze8qvNAg73NEWWw06fW8qD1
	 ZrU3gui6Lh+fruLHBPJcWTtth5MyfBKM1cVkLdJxwvegpK3pxhLbLzlg5/4M4TUs1kxRg
	 ZSI8fLa1vvmH77+8Z94W0q9kZithBbHkzMf5fGRmP406QVWA9d5tXqEw0mAZr2JSf7hHB
	 0frDcOIpbt0Ey/GRxb58l9gErpCVtXY7uiMKcVLCq1drTK4rAdHfG4nMwiH/ScYCcIeOg
	 cBdAcmAKUABnf49sAYrwTBfRvGLz9GBkLcNIA6eNnSmbBMgGHXmYFO+1v7uX8TAfAwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JAFOsqt4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BADE60A2634;
	Tue, 10 Nov 2026 05:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JAFOsqt4
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794289020;
	b=UXM3EKFCfzHumv5h23ND/bhgu4Y87AoTpmEPoq9w2Lw2Xh31zrmrIXtp40wjtbjtbOEF
	 lIaCFX2E4jflGHLYjK7rJVRa13owij55By6qX1zaZwNiAKmiBBqfL/rdkbGUuAzt08x2p
	 5Pc5mgJQLAy3NV+nPMiNDnAaohHRRdefO2wjPeFFM6/uPUpv4MxiuanTR04lBt5TYAgSe
	 Qr2uk/0hH8VUB7YPi131ANoqRywFHN0IZhEwk+QRkoOrYv1uF4yu7Y+ylwPmWJkS9FwYL
	 Gn9ivWqbG0VGbx/0L/soiHeZkrfugAYbPn1iiLAzN20W8a3jWLBYdrug8cXNcDCcLzA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794289020;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6mbZCUTv70VlpZsgPw+uhGGcoEUvKC9H4qZpsqc1/Xw=;
	b=bXymHt0ulRbgT55YzZVs2hefGdaNsgiK6kc88WocnZNN9jHeCfzC4JrM4nxpClALNwY4
	 b7yhP1zdI0m/ArRT3UK2gSbpk7fa2X+wQ++WRjuLml1T8E7NMPAEm5bPXURpw2xlvfzSt
	 lB405e1UT3bKzQKksrg8hSusvsXtEN05mB5I4E4K0jO3xoscALRyeYB8KxQMCsmnauvjX
	 cQpP5VRrpnMsLaaAI2Z6yhe7Z0NFzrZeN/aIF8VsCTXoFAre+xna5N0wr/51PmzxhFhhz
	 ltDU7EJhQ9IoRK6naVjMkysKOrNDv2dETAhMDDnr+zfmm050Oq5kh0PaFRVYCEvIrHg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 420E31F008BC;
	Tue, 10 Nov 2026 05:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794289020;
	bh=6mbZCUTv70VlpZsgPw+uhGGcoEUvKC9H4qZpsqc1/Xw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JAFOsqt4xB3Qs3mhAFaSJK4B0oavTNdgo7NkIgwDCpOrFFVvR/p5nZhv74fKZGw/+
	 0+hZRDgCTNbQc+Y/4rYa0QzaxLFN79rjEkT23cAVUcXmFOlyDfuCokTQ+JezwL8aD+
	 BVPiKjETL2SAtr3Je/k1nORKPZUOXyzkpRYQVfnEh/DPbwFnHtJy8XiXGxZjYoHmXs
	 bS29xzCN2FBEwiE6vxrEswc+VI0HsyFeEOOr8pmw2bLmxTjroW3Tlc3dSwlG4T0NOc
	 FchvjVRBq1wLYN1ZBIHXMZgpZxp5E4Naz5pe6kegS6ncWYZWqwv0NL++incmgJ1Qa5
	 TM6j0WvSwevOA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E952E488B3;
	Tue, 10 Nov 2026 05:36:56 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 05:37:00 +0000
Subject: [PATCH 6/8] arm64: dts: allwinner: orangepi-zero2: Enable GPU DVFS
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
Message-Id: <20261110-h616-zero2-dt-v1-6-05506d760f21@gmail.com>
References: <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
In-Reply-To: <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794289016; l=990;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=5MPJQC1S+CHiR8Bt9vkp2Zk5ZwEghmC4r8Nx+9ugUME=;
 b=8053UKYHfOqO54EdBf1xGwXwUhAAG8olofHNp/ByiYCdgJYl8axWDp8NLgo9hQQ0vnxphtsa5
 +6qHMIMauqzBvoMNEJJfhMcbKPmNY2m1kyACcEh3CGFcHxLyV/cESHG
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


