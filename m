Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794742520;
	b=fihQvDUsrV+1xOH3Mydzf7fVGkfb0XoHYH0Jnu6MdnTwZWmK+e38jwqIk751sEywljVJ
	 YjAsSrsG3+AjFrDUMmZ70Vs/Sv8mJmlA3ztjIn4vSFrxpCxTzeTAx2hpmBFeB42PPHWIA
	 l9FD/IGOV2GmZrF6t0qBsbYNeX65EsKgewLCOrTnfgaUQGIPu8OfEojew4BWXFBaRUJs+
	 wOuLSX9z+KDbBkb2nI6a2ZZVhYcbbUWyKbV3xv7fd41dXqW4LOR3I7QBLrKt9vFxNp+a0
	 pPywV4clCvP9Yj59WoAR8kWIg7NkeF5lR5B8vPX/rmWqHMHiH7kjS1jxQxlK6tlFvqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794742520;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=iWdxDiJUr7CTWsA2A0qYDKSIE+nDlkJJ+cPmF9OEvPc=;
	b=kAEZaa021R92XLPkgIBYr+Uvb0GKnUtgwn0zDyu6uDj3y3QPaIn7D+NzMaFUbJKtcq3A
	 0pVvlO3L6cyilDNx66+gNLRJ/Cwl+kxfT+2xL3ew007gzYbbShANqkeH3BKw7d/CSVSd7
	 /NuCXnmXeM/80DisbMkAY9Zo7DUCQRrwGm3AZP0m109KkJaOU8r4PtDOe6drLp76BxZKl
	 R7LiCVFg14b6TRITEG3Y6YfdYfByiouzN3zjczaqVDupZKag8q4KLnHW8bYcu4G1Z5Dft
	 mR6/IdMzj3XjTVGWF9gdu+rLhHDq54XvLjwn1mH+OqLiKJldbxkJOvxwZ38vQpROWpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jmf2HchH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB40606A882;
	Sun, 15 Nov 2026 11:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jmf2HchH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952521F000C4;
	Sun, 15 Nov 2026 11:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794742520;
	bh=iWdxDiJUr7CTWsA2A0qYDKSIE+nDlkJJ+cPmF9OEvPc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Jmf2HchHYm01YYvRuEsUjJo+sAqhtH3cmNR21NKDC9hw3x3yt5cuGcdyybklO2mr+
	 cimNkkXyyFe+NzrmxoQ7k7IjyVHARiV4kwQY4rkpqhNVog9hB3jk63kUIykuJCHz3J
	 bDLFZAnEV1A8jYlg2644ZfYtmfrHqrXTvYhT2vGQHiVp/m0uivRHnS/z4B6XrEE7MY
	 q3PWKmo8UTbvfZDvSj95e/ia1IRKEGwdR3Rrn6vP31g7XJn1ofV7QUyR3muNvNvviY
	 0ieREEmB7lQxcgCD0irNSi5nCTNV4sWGFGFmHACscitLdw0OMQiBv8NJQEpYo+5SPD
	 IPtvfOZh4T0YQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com>
References: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com>
Subject: Re: (subset) [PATCH v3 0/7] arm64: dts: allwinner: h616: Orange Pi
 Zero2 fixes, GPU DVFS and GPU cooling
Message-Id: <179474251838.3095306.1558008986056795967.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 19:35:18 +0800
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
X-Mailer: b4 0.14.2

On Thu, 12 Nov 2026 09:22:30 +0000, Arun Iyengar wrote:
> This series collects the device tree changes we carry for the Orange
> Pi Zero2 (H616):
> 
> - Patch 1 makes the H616 codec node cover the DAC RAMP register that
>   the driver uses (it currently works only because ioremap() rounds up).
> - Patch 2 fixes intermittent dead-RX boots of the Zero2's Ethernet by
>   letting the RTL8211F add the RX delay ("rgmii-rxid"), as the Zero3
>   already does.
> - Patches 3 and 4 add an H616 GPU OPP table and make the Mali-G31 a
>   cooling device of the GPU thermal zone, with a passive trip point.
> - Patches 5 and 6 enable GPU DVFS on the Zero2. Patch 5 first raises the
>   floor of the GPU supply to 900 mV, because on this board the rail is
>   shared with VDD-SYS and the video engine corrupts decoded frames at
>   810 mV.
> - Patch 7 describes the SPI NOR supply.
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/7] arm64: dts: allwinner: h616: Cover the codec RAMP register
      https://git.kernel.org/sunxi/linux/c/7d86907c33fb
[2/7] arm64: dts: allwinner: orangepi-zero2: Let the PHY add the RX delay
      https://git.kernel.org/sunxi/linux/c/05006ae70803
[3/7] arm64: dts: allwinner: h616: Add GPU OPP table
      https://git.kernel.org/sunxi/linux/c/e39ccc7f7493
[4/7] arm64: dts: allwinner: h616: Throttle the GPU from the GPU thermal zone
      https://git.kernel.org/sunxi/linux/c/ce0fd2bf5732
[7/7] arm64: dts: allwinner: orangepi-zero2: Describe the SPI NOR supply
      https://git.kernel.org/sunxi/linux/c/e51eaff703b1

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

