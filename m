Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794289019;
	b=eAmPrJcom3z4O5YMdNtz3LkOyzfgk7+gVqDUcvoSv/dCf8Eml9AwvWGJPIqWMr/1t+c4
	 qV1GNjpllp/0wO0AMhEGuxlH5K1yT4dcaU6RrPlDlCtRUn+hhZ5uyAp9qmkESAUJrXvHs
	 W68xVpSSFgfyia86OjR4imTKX9yPBXqq/j6A3KzK7oZOCF/jqT+q0E6gdCe/FFbsVVwzW
	 xVJtIf/t66MyPQtaD2jB21DJZn8x3DOqgDWieBs7c+aRIcMGZ2iOMr92o77s73pHmXbXQ
	 cCk6WX3Q9YMJkUfBIX1DjSn3V/QhV9TqYOLlQ1vqpuATOwYU1FJLKANjmsH71Kt8Egw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289019;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OSpKYXI3x3Ecj0mIg6ainswFmOqXcHcy2xxyXft9chA=;
	b=PmYGe64IztzlceqQBEcnHt/jvm9d3EP84yoGfusFwJMO7MFhgSSjHYXjO6L7YTV2uzP2
	 PVjwXkZLj0lJARuS/XJ0wJX9oBMPg15ojmJ0S8iN7JtxIPuu2udf53IkPLIu3xuL7rYlu
	 rw9lhDUT+qleBLiZjuWB8rtblXd+8ADFXj3ucNT5vxkZ4ukF/Q9YmhoFqdmQ+xDucF1c7
	 r+4EuiBDKfNP5Iz35LwOkNvNDDZNav+XJqQ+hIP9yUmX5WYZ13SKvePlJ2k8u+Uwk2KOQ
	 HfrXqcvkpltV+PV2CxFVe/H1BqQMjIajHPy7o8zJrfTF1xyJm2SZAwqA8a2hh+3p3eA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VJjp+DdD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C31606A330;
	Tue, 10 Nov 2026 05:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VJjp+DdD
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794289018;
	b=dt8w4RNUTqN3t9DnCvLVUZ1bRegJye3/A736OfGO5E260Tg+sxyiv3irZyTa4IRlnaMA
	 /e6O/zT/OoisIaHuUSHpmyXAT84Gs3xQYDWVDD498G/eM/LQyogAHe5Ax3eJsZYqI35/s
	 4LdivQmnN2HO1ZZ42FIFOfrbEGmUI12LSG7fFPDFHbXZ07fs2ZVM3mtAn+CfgB7EExX2Z
	 4VMhJg0rtp4mXG4lxpvWMH4j+vUPfZ5m/2vnrCXFlmy4v4ptKdU/HqGolDNOzqeuqBzdQ
	 SpZGn/QkRJGBHFFjMc57jQ27GRxw/g13gJ928Rz82TxUQ64jGxCltJFXJFEqyqVlK9g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794289018;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OSpKYXI3x3Ecj0mIg6ainswFmOqXcHcy2xxyXft9chA=;
	b=zLLF4M7jP6ubtDeEvIZo7Zm9nUJIpHNymhdltwQTRlg/BnOyUQwaJqMhpaT/BcOkXGB8
	 5zfGxZhlft0uZQkWbriZUpYF8u9RNFSRmsNWxaMcta+Pb9/fQvypaLNy90vErDxm5bxIV
	 YF2Af90iWCZPU3ZvL/gtlT7kF/p4pwC6kECRrG6/7zyFXnD3J94Q34P28XmE8p2EpXvkB
	 BEt5ST9eIlYfO1kTF6Bw5nJJFuQrFKAjc95pxCjMEVYHIj0iNgzL8BxNNf4cqHkynmEnz
	 qInqHRKByu/0ntBEx9P5zIwyg3Axf1lEFU3Fj5bCqQerZnh+f/E7GLoLkwlIgjaPAuQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 367431F008A3;
	Tue, 10 Nov 2026 05:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794289018;
	bh=OSpKYXI3x3Ecj0mIg6ainswFmOqXcHcy2xxyXft9chA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VJjp+DdDu/Pu6+JPiauzdq1uEksOgP/72B2Ir6+ze7MBnjNa2ozzdlAdw9rLfeven
	 fCVEq1lcYuZFAVkilirGUEu4SYanAA0hpdOY/FbmF7xdzphmtHLsMfA8qSB3d3GgbP
	 4r4wH0eqv/qHODS5LC4FyNrV4QBDnnEI5/TybGKC2dRDvwKIsjqC3qry8SPTF4sFBX
	 uBNYr48Ltnet8mop8cFTBKxmCuqpwbCfscq68YNDVZKyY0X16Tm9r/bPmqbBzmNWg1
	 +TshdqiUq3w3sVPp87oftmkXuO2iDErqWWco5pA+vN/LU21vbwlEgBkANxVIt5+CQJ
	 NMZE/CqnkpsZA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B5D9B488A7;
	Tue, 10 Nov 2026 05:36:56 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 05:36:57 +0000
Subject: [PATCH 3/8] arm64: dts: allwinner: h616: Add GPU OPP table
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
Message-Id: <20261110-h616-zero2-dt-v1-3-05506d760f21@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794289015; l=2428;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=23p6G19W/X5hVV956J5zGWaQGs0tQIUlVjJ9HWVYKfQ=;
 b=8apyikkzCyhldeAVIUTaFmRzkEFvnGO4kw+znwYqqhpT0t68S1QDbKycHAhn6MN99cULwYknH
 13GJTHHPRArCdEYI5rpOElmLJMgxPZzdknOrSbhz7MeuPThdomkxYCV
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Add the operating points of the H616/H618 Mali-G31, so that boards can
enable GPU DVFS through panfrost devfreq: 306 to 600 MHz at 810 to
950 mV. The table is the one of the vendor images (as recovered from a
KickPi K2B image, also carried by Armbian), and follows the H6 GPU OPP
table in using <target min max> voltage triplets with a common 990 mV
maximum, so a board can raise the minimum of the GPU supply without
losing operating points.

Like sun50i-h616-cpu-opp.dtsi, the table is in a separate file that
boards include once their GPU supply is described.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi    | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi
new file mode 100644
index 000000000000..511174eee271
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (C) 2026 Arun Iyengar <aiyengar1990@gmail.com>
+
+/ {
+	gpu_opp_table: opp-table-gpu {
+		compatible = "operating-points-v2";
+
+		opp-306000000 {
+			opp-hz = /bits/ 64 <306000000>;
+			opp-microvolt = <810000 810000 990000>;
+		};
+
+		opp-336000000 {
+			opp-hz = /bits/ 64 <336000000>;
+			opp-microvolt = <810000 810000 990000>;
+		};
+
+		opp-360000000 {
+			opp-hz = /bits/ 64 <360000000>;
+			opp-microvolt = <820000 810000 990000>;
+		};
+
+		opp-384000000 {
+			opp-hz = /bits/ 64 <384000000>;
+			opp-microvolt = <830000 810000 990000>;
+		};
+
+		opp-420000000 {
+			opp-hz = /bits/ 64 <420000000>;
+			opp-microvolt = <850000 810000 990000>;
+		};
+
+		opp-456000000 {
+			opp-hz = /bits/ 64 <456000000>;
+			opp-microvolt = <870000 810000 990000>;
+		};
+
+		opp-504000000 {
+			opp-hz = /bits/ 64 <504000000>;
+			opp-microvolt = <890000 810000 990000>;
+		};
+
+		opp-540000000 {
+			opp-hz = /bits/ 64 <540000000>;
+			opp-microvolt = <910000 810000 990000>;
+		};
+
+		opp-576000000 {
+			opp-hz = /bits/ 64 <576000000>;
+			opp-microvolt = <930000 810000 990000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <950000 810000 990000>;
+		};
+	};
+};
+
+&gpu {
+	operating-points-v2 = <&gpu_opp_table>;
+};

-- 
2.55.0


