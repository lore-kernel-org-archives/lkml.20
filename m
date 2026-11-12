Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794475353;
	b=PcFaUNVzdxqtPUt5dfxkDBtkhZhvk68pZ84MxdWfct60Lmplqo/HKshadaEgeSSok7MH
	 gFE0BltppkMgvU+b3R89XbUtnyYR/XtNR96sMzmweCkhmG7fKXfe+ir4xOeENM9EaTjLh
	 KWzdQVWZlK1cJ85GxUziCC7KpoBFjfGD3xyGdlkOoQrStfxcu+u1/t5fjhN1Wg82M5p1/
	 24UEzv93pJGH+UvCxtlV/h8gNV20b4XpZaUcjj8abA0AGrEYlXEc77Qh7nyGIJJtF7K3v
	 2IJGiFPEUtI43gCrzTUN+Q94cd5ZqUJwQ4asEW28vf6k0scNSSlgjj1M+lr82EtikUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475353;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GJA0oJzXunV8vsMdooEnIiNstpwLJzqlzvQY0n1w7Qs=;
	b=CFd6W7gdfLoqOBt91892fxY1fXY5P1qYltIjucm8UB4kCtiFrPoX0Vi7tmCVZ8hotbQX
	 GKv9V2pfMo6QwEWaxcMpfvx/hvFicHiLZG1aMi2S13bpLm7QpqokJMJe1RprAc6MGAuXW
	 IPq6EREe3xFXx4h45t7QY9LuVtN9+0Y+Ki21SVXWIIPsCPvvMAQhlu5Ezb0I2ZwNVlRQc
	 0lQ+bjcOlafOg/4oO1UhgNrgdOkdbn2k2r/SNAcxQCvbs2CwgT5ZpPJmRu+NQdWYYtUMt
	 +k0eYyfIUwdqTcf6mKVE2hHyAQ/dqlj/f3sMMrZsFfIREIOyfqkKSdmpwwO98ZDz7Cg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rwsv+JMu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864AE606A338;
	Thu, 12 Nov 2026 09:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rwsv+JMu
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794475353;
	b=bFx7dYLxjlNc6xIzWItCl0Mw28M53TR1zVd6rWXyHL3pJAIex/YMNU7wqJk2iqBRH3Ro
	 FEqKsN0lgLbDgfV+uVLfhiHFvWk3HhW9GteLkHZnSjMXpxNVk1LxRXDU/aKzGofHuQraa
	 Bn+JUxDhZ8MwpWP7xFdveo/PsfXRghvjSFSoDrHN2FBsVeM1GjPyHnVsbVE76gwauZ/8t
	 k3+i7ANPAq2YktTADHfsz6m9ryFPrvXV/PnaxeKKqOTKCQwzbj0bemYUhGo1Y9QB4JY/P
	 trs8tdgQv/Sev16kpukrclfQLT6jIno6I1NXUFip2bTg553zNiXnih+5Ug7oji+dAYQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794475353;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GJA0oJzXunV8vsMdooEnIiNstpwLJzqlzvQY0n1w7Qs=;
	b=QjJ/76c8P0xAvIWqK0H+2LgHsq7ORsW6W9d9Ua3V+/0v2mRnCUwigZbaUHWxCbOojWS4
	 q6u6g/vxkNvVvzSGUggBwo34N3sadFd99tQScKPKk6ra/Pdoz/MKIcNOepwsNMLUgKfdm
	 7wSJkCSIH4k2EMQLTMfdkGTZUK7EeTXV3IQvzebVDcF2qFyMnd/zhgBFwf1FIH1dykPlr
	 /9fULdxvCgZQANV3mIaaZTtApXMHg+lUgmUAJIsiIgl9GxLT6IC2x74TGxB6tmpc4Pzxl
	 FN7S/oeZasvCb8jyTh5qiUOw8CgazM3N8mMcncuC3wpaShulEF0nR/TFPDPSBmRT5nw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1F0BB1F00A08;
	Thu, 12 Nov 2026 09:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475353;
	bh=GJA0oJzXunV8vsMdooEnIiNstpwLJzqlzvQY0n1w7Qs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Rwsv+JMuvYT/unP1PZcXSRBBP6ToTODsH7u4r8BQR2CRbfk1PsB1vl1Mcgh9g3IHH
	 GbY6eEE0Z/p2dn8cQ3cUWetzQXw7ucIskXEkF99uSTWO16rK03vNY2QIrorOhnebui
	 c0BrU2qMWpkvYEQUm0iWlIY3ybgMsj8zKpl+6vOW9VtP3GfXc946ct2aJXPH0RWP3w
	 RZ2DFugiaPUTLut/XGkSXMWmFSakRWGZe0Bsh5oDxOlmzHIwVKV3an4U+DW9dUk4G1
	 wLQbGaVjEtmK9aQQdMOZS2PxlV56WzVffCmjvhD0ixWo0y/zM0egz1XTC5kopGxt+h
	 5H1+lmqQrY/lQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9E5D349434;
	Thu, 12 Nov 2026 09:22:31 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 09:22:33 +0000
Subject: [PATCH v3 3/7] arm64: dts: allwinner: h616: Add GPU OPP table
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
Message-Id: <20261112-h616-zero2-dt-v3-3-1cd2664230c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794475350; l=2569;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=lGUm88hkiiCwsS06lh6tLUaHZIc5LqI3MybFyqamLeE=;
 b=NNHfUxaBp6U38XVr62s7katLARU3VInN0NB/LtDM+gBcF1BJaDXPS6YDshlF6a0LUOtGY13VG
 PZBwBqZkhduCinkjvQU9wBng+dEFstW+mLL7uCCD/D+KqN62rqJFJwT
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
KickPi K2B image, also carried by Armbian). Like the H6 GPU OPP table,
it uses <target target max> voltage triplets with a common 990 mV
maximum: a board whose GPU supply cannot reach an OPP's target voltage
loses that OPP, while a board whose supply minimum is above the target
of the lower OPPs keeps them, as their [target, max] range still
overlaps the supply's range.

Like sun50i-h616-cpu-opp.dtsi, the table is in a separate file that
boards include once their GPU supply is described.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi    | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi
new file mode 100644
index 000000000000..18989d11c832
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
+			opp-microvolt = <820000 820000 990000>;
+		};
+
+		opp-384000000 {
+			opp-hz = /bits/ 64 <384000000>;
+			opp-microvolt = <830000 830000 990000>;
+		};
+
+		opp-420000000 {
+			opp-hz = /bits/ 64 <420000000>;
+			opp-microvolt = <850000 850000 990000>;
+		};
+
+		opp-456000000 {
+			opp-hz = /bits/ 64 <456000000>;
+			opp-microvolt = <870000 870000 990000>;
+		};
+
+		opp-504000000 {
+			opp-hz = /bits/ 64 <504000000>;
+			opp-microvolt = <890000 890000 990000>;
+		};
+
+		opp-540000000 {
+			opp-hz = /bits/ 64 <540000000>;
+			opp-microvolt = <910000 910000 990000>;
+		};
+
+		opp-576000000 {
+			opp-hz = /bits/ 64 <576000000>;
+			opp-microvolt = <930000 930000 990000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <950000 950000 990000>;
+		};
+	};
+};
+
+&gpu {
+	operating-points-v2 = <&gpu_opp_table>;
+};

-- 
2.55.0


