Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794376811;
	b=YW0iXRsjqblsgAXpK/oah64wSzd2ym2Oq4SXS83Cd+9jhcqL3huVuKjr3uhzSwnMCy/6
	 iCNewt8Gt4TFpEFoIvjq/iumU65Dn3s3XuzFt0IziMgLczfUe4qas1z48ZNXx2jLsGw4G
	 KJ0ea3D9Fg3ZLzGghDprO9QuuSoj/fM5SYGaWX/Jdz/B3WNYKAM1IIW/1RNtTN2glxUJh
	 4qNB8ufTHGtWWBziQg8VHAQbzFw55StzCE6yTKPj8CudD/WTTX0jzlkLEADmce2n5Yaid
	 41epEIY22HW6jX8DZxR6r8H2Ky/ZhdP/xElgC0wNHWgYyUSzH6GTR+9MFFDi2zxIYcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376811;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GJA0oJzXunV8vsMdooEnIiNstpwLJzqlzvQY0n1w7Qs=;
	b=KPQ4B0RWfJkVV1aR4SMo+gcPf6gucObWpRSoFL2L+UH5+WvlmqPgeq95v8olSpFg5qOj
	 1uENWSPZ8twHb3WN1ZAhxlcJtxwddvkN7tIkfazFafGzWqmBI8Pzvak/+hDybBdcOMF2a
	 MuNgCTQPrXr+0ANr1N1yec/Bma1tolb+mUBqKcDkEBIdmuYkWP2VT7Q6LbUhTKYW9OToR
	 rdH0pmm8UJmoFlkK9fttAgg6oOgKI1ZFunNSISUIvE/aIPCRa1Y7n5gRTQX20Stcv862H
	 UlbcIrBDznBndUV5W/N1jowR60gzCmKAwdWWdedDMfS1vUZj0ypaenP1s0atOR99iqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jVdUetIP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B84960A2620;
	Wed, 11 Nov 2026 06:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jVdUetIP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794376811;
	b=JExD8vrHyAeABQvsNNWzApJ0FaqO43y6CFl00nx99KAEuLDLEggSNqS4WVIIIdxxC+fl
	 M0aZjp7S4luZ9u+BjZZem8pXjYH5lcpEFaWYS2EqaXdyZ4/ck9NDNb75pfQe2qL02p9lX
	 CkUHZVQ0FRtjKvJIPbBp5EtfMGO04asAERusTFAgkcd8IUyRwchP68Bes2lg+aaWtivXC
	 ZNgL/5Ua/xe/RpujUX0B9mlSOJsGcgMh01bn9lhYft7epk9gmINH3PvMbGcGgjtl9nHrd
	 gmiMR2BbQc5efIaUtxH5+qckaLnN8DRqTf5FrEAYdRM9Ss7+DsFr7VCSSS3La/UvBjw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794376811;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GJA0oJzXunV8vsMdooEnIiNstpwLJzqlzvQY0n1w7Qs=;
	b=bxObUZjZhH8ALlT2lsBdzDIRE5ohZy6YD1mJpt7FsK31MRT3TmQyqUSqrfrOnoDhBwVa
	 IyE2ZVsk6IHGOVMxwpfqLivmvZAGlQ+P/OrcAefRP3lXaO5WfdqiKp03zMxstrqX6cpXM
	 2xOV8lhFLN6Te3ydMlrhom9SUsPBBDLJKFZ7VWFs4ITBUQkzAW21EHKLeVb4MIKmB+Kjf
	 N0MOCcAagI3cFUTUaAGA2YLvpQZxS7XWZf2SWE3Au9OTP08OSNkfDfQrfMUQauEKM+LIT
	 pa7F6Zp2xmUGGUJM9JiG446CR5yoEc++Ju2H2bw+DqF+xReqa7u6EjV461NJrJom8jA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E07B1F00A09;
	Wed, 11 Nov 2026 06:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794376811;
	bh=GJA0oJzXunV8vsMdooEnIiNstpwLJzqlzvQY0n1w7Qs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jVdUetIP/savyPraFV3uYjtXAhj9ATEKgTc3cekFAQOK0RBzMDzRgermNgFYcIxDa
	 T3qTxgQoNgELJrSNtzvs7IQQj+mlloxmGTyV2RELQMWlX1s76ImgwamBIm4IGdKuiy
	 bwa859gXF8qtJ1sOrbmXIHpaqdI59Ut4YaskvE/Ss4xizfVmuuN0pgJS7mV7xyDV7n
	 IBxpeywMw1xEOL9Uugt2RPHS/+WNO7gRQFzpmQ33Nt8e0Zm6Q5yDGKtm2y6WnE+6hY
	 1Z/Pdq0LF73yVjbZop3ssShC2m3IC4i/bP+uDnwSyxPXCeG+wUDbfxkYtI9ik8MTXI
	 BlfFbM/LyX1fg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C845E48DE2;
	Wed, 11 Nov 2026 06:00:07 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 06:00:09 +0000
Subject: [PATCH v2 3/8] arm64: dts: allwinner: h616: Add GPU OPP table
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
Message-Id: <20261111-h616-zero2-dt-v2-3-88d8030fc975@gmail.com>
References: <20261111-h616-zero2-dt-v2-0-88d8030fc975@gmail.com>
In-Reply-To: <20261111-h616-zero2-dt-v2-0-88d8030fc975@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794376807; l=2569;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=lGUm88hkiiCwsS06lh6tLUaHZIc5LqI3MybFyqamLeE=;
 b=xEKB4Lxds9YjAC84e9tRqBGpiqU7fynFWhfPxxDTvlTwyA7O7OdVtCL01VJKXissGbeXUJ8Hx
 WplS3IBcC8oD0wT1neISMHPFnTS+AwDztx0a0fuouYNDKwxfkYqZHPF
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


