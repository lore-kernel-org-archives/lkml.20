Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794475354;
	b=wCm2JiKsZl4qy5N2tpdWdzdmU4np2+C4lNBSX/4C+I+7Saf0Jt9g4gU4g5KVXGI2yDDu
	 hBGJlG6+SPBWjNN7mfIeDw/M90uVxFGNtSuWWK2AQhhNPkmgssigPnTGkuCqErtB8BKUs
	 SYqtjbiG4bzdAhUUh2J4b8BUSdISsj67nYynSupER0+PWihcJ3AU2nN+n54KUsh4ClndQ
	 Mlr6gncLs14w29WeRPx1xk9ZXYxEowD06J2bMRB/f99Vs7GxcHnUV5+wLfpRgPPD/bb99
	 ioU+EZe4lqu9+ffG2FfXXRfnqWFlmXS/VVCsP3ADiUB79eSFWojEIy1XXEDx4kkcoJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475354;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=P8OVAdFrpiHpa2Y5YjbvLphez/MlgFPtGIr9JlXAz3I=;
	b=iuw39zbOpMuqm1NW7Vd17k1KMf0Lz9KZTGwsP/T9qM9LuxemnqlkSBiEoNZMQ3LWkpHm
	 pWzP4wvQ2l5rUX4EwvcxpRFqS1ImzI1iUBZFKiTXuUBLDmqCcyH/GYcNogo91YefuWX6f
	 zG6Vday2Rs6lQ+DEfkJzslZS7NtJleC9ASpgu72uDT7Qw5c6GXn0qGMFpSKIb9z8Njol8
	 cIPHmJiwQ+M6yT7dksY7ztRyuw8jei/t2DYY5yVr4UZTTod2Wxyi7WYyb/ZIG9FTDmtkt
	 E3N+Ftvt3T8twz0TCRJC69vmaUZnLMV1WWohsidn3jMzTvNCKyBMhbUpf6Ctdd6oRBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oD5tsBPN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C746F606A8BC;
	Thu, 12 Nov 2026 09:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oD5tsBPN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794475354;
	b=q4s/3zFFkJfwJPFbqw0lvsovXR0L6aU7+yNt5N1+7iT5X1BMM0d9i+bDUsD+1588rt0d
	 YQ7iQ72CCeo/dO6BPIm4nFDAQ8ykdcFTNxwZx8ZGv1H/kX56ZqQQQRS/7Ajr2+dhBXgUp
	 BoetVm16KFqXaFdVTlFj85kHzeVO3QC6mbVQCJYJCFF5ma7TYsbd7PMZmDnzucEiqSjJj
	 0NKGF6zYIurNFQV4eZCuHCI5u5U8XZzzECCaIqCBp8ZIAdNynWDZ3gVJZ8Mb3TRrw7KoT
	 jWdfq6Bqk+tiYdC+JFBdxCZtKS3dDBG4LZzE7mHQei9kukgrDzt9+QgOMuStvgq344Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794475354;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=P8OVAdFrpiHpa2Y5YjbvLphez/MlgFPtGIr9JlXAz3I=;
	b=2ibF2xlC4MYscjWzFEOl49ZzCfPsZR7xKS7IYH+Sl6DjZ1kke0di+eiO7l3/7bDzZ/9W
	 Q/SMMqstFaMqN1n2FhQCbYSadPgqoZNsMCiRAEKxfSUT2anQixVwX/vg/H13KXWmv+x/j
	 E1zTBVtlGi411YtvlEMmBfBamFtq7Zyk5F591acRfE6gcgiqosp1F6Cpjn0v+9nUVrgNu
	 vP0vI7kVSdOpR0uuiuYD0lCRjZ56qaBPfJ2uFYuoYuews+XmIvJKQYN0m67mTgoWrMb1h
	 r9CC6dpj0n3Cm7J3sVDOXQlpFffxjX6HPQwlSoQzUvtYLZeOEoY0Jb0PvlMJZrtC0vw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 308351F00A0A;
	Thu, 12 Nov 2026 09:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475354;
	bh=P8OVAdFrpiHpa2Y5YjbvLphez/MlgFPtGIr9JlXAz3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=oD5tsBPN8VaamaktB7HWAVcYsohYAr8vN95/UEXSKUWscM/xg2kQAanbVpnCC4iq+
	 xx0takeoZB45EOJy8hZzO6qdb+egGSic5V6WHFtVSBXyCCR6a0FvPusjSB99pSMZmX
	 +vR0R3Hl1pP9Is2sHixesxJII2jDuJRichxq/Mqf9R2n59JPqDn9lTI7jXY17TGWWo
	 PHuh4MsWFkIC7cz6bAI8phyUCiGCtmVLUyy980nVh+zOwEHeWyWbG8g5AklZQAgRTj
	 vnuiLEvadOnE63subgjOMN9OmXIIh8p/zy254sbNTKLQatPANTsmgpl3AeHRsZqPEV
	 252/Ybvly4y5Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C746C4943C;
	Thu, 12 Nov 2026 09:22:31 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 09:22:35 +0000
Subject: [PATCH v3 5/7] arm64: dts: allwinner: orangepi-zero2: Keep VDD-SYS
 at or above 900 mV
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
Message-Id: <20261112-h616-zero2-dt-v3-5-1cd2664230c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794475350; l=1740;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=7dRmuEnXweiSK3ig6SjcXECMwYZqvp9fut5LB8gZugM=;
 b=98ac72ARLU5U2lw54mPr586i+KWJChBKw09jN/P2hwx20Vf63T2SW6wmzhcqmazmxsEG76KrS
 s3VJu9ivSHyBqMFIiKg830a1w0NfmhKE2uUwZzVh3b89p49Ha4Dvpx7
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

On the Orange Pi Zero2 the AXP305 DCDCC "vdd-gpu-sys" rail feeds both
the Mali-G31 and the SoC's VDD-SYS domain, which includes the video
engine. Its regulator range starts at 810 mV, the lowest GPU operating
point, so once GPU DVFS is enabled the rail drops to 810 mV whenever
the GPU is idle. The video engine does not tolerate that: with the VE
at 600 MHz, 4K H.265 decodes intermittently produce a few corrupted
CTBs, without any kernel message. Only 6 of 13 runs were bit-exact at
810 mV, against 3 of 3 at 890 mV, 3 of 3 at 950 mV, and 3 of 3 at
810 mV with the VE clocked down to 432 MHz. The vendor BSP runs every
GPU operating point at 950 mV, so it never lowers this rail.

Raise the regulator minimum to 900 mV before GPU DVFS is enabled. The
H616 GPU operating points use <target min max> triplets with a 990 mV
maximum, so the regulator core clamps the low-frequency requests into
[900, 990] mV and devfreq still scales the GPU clock.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index 1fdf2d3c1a87..719d6dadf7bf 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -114,7 +114,7 @@ reg_dcdca: dcdca {
 
 			reg_dcdcc: dcdcc {
 				regulator-always-on;
-				regulator-min-microvolt = <810000>;
+				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <990000>;
 				regulator-name = "vdd-gpu-sys";
 			};

-- 
2.55.0


