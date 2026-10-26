Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023471;
	b=cPH0daPzP8KiYtSbfAnBedOxGHVv7EibtZHztuzl/HKJSLAcnUObxs9iiVIXPIeo05ye
	 ahWa7isoycg20J3ISg1ZHeqyVQJs2dptnkn/FOgd/FP+YrJOCTzZaupErMhyj13KqMzt0
	 qmonnP9SNZLCLi969c5ntu05toFVPYwkUazQO/AEFxqraOPucd72CDGrpPLtw8iNqt1ql
	 NwaU9D80HaNjod0FnLIgdO1GFJiPFFfh+AEG/35m/qvmS+Tl+3+qPsMX0GNUvmklyIc5Q
	 itnY5G0/fOcyXG5lHksmMUHT67BTSCxgD87rxldyRV2z0mW+uBtaJHKqeuhE35CZcBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023471;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=4e61ZPJ/VaKm8jta7uyflFaTjlybKJSM5/XzhXlIwHU=;
	b=mXEHDLTI9ZlRoKGa3nrmMDqqgJaLFrDVyAuP5Rf8VckToHfhpG37j+SopN0+DG+SCCJ4
	 YDmHt3173F5JDcZATobjPhrpT457MlbG4nxPPXL/lRoe0lDuq3/+xUoddU7ZzBPgn3M20
	 HalTOOuCkxloZRNP/I91nXy/q4WE7MhpQWiOpT5VBUnQ4njq/Ho4aEBsX7fP4TfQdmSUo
	 S2dK9yckmfuxKMXf8I7Qk9Buq15cWRZ14dOw3w36ju7jqm5rB/sNqP0z4Ek+9MZNJwPrK
	 zXyQYW+T/snjbFMLTwI/htTVBAVFjNTlWojtIJBgNAqiGkhR9HM/tm33943cByEiROQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bo9M/E/R";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0B2606A31E;
	Mon, 26 Oct 2026 14:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bo9M/E/R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3DB01F01828;
	Mon, 26 Oct 2026 14:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793023471;
	bh=4e61ZPJ/VaKm8jta7uyflFaTjlybKJSM5/XzhXlIwHU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=bo9M/E/R8/9BwByc1QsS00ASWjFDJ5FqjjPUVjFkusP8ycGZoEbo26Wpf/TdzIxVI
	 XxTVr2dHnfKtgccYWGfMj4VWmkuV4lAzU+8yUJxo7Oj/9Q+AdDIKHGlO/EUaH9U3N3
	 mWbW8coHn+HjPG7Iesa5Q4IlpyJLNBeCx1XQUQUXEaDBxaWgFsfMcPrFJ5toEh7c0A
	 /t2p0RVC7VzErzelfxkYQ+vcPEqCXS+fmCFDDydkm2EEuy5vc2ctiM5wIamjPIrQLh
	 syoAd7BihBeOftw0hgwvDs4VumfT1x+h12hznZi14m1eLA40eBnoURMsdZ/RMKJ8Yb
	 nX+hhyaWtJw3Q==
Message-ID: <34e52feb-10bc-4fcf-9f42-b2cdf50eb32a@kernel.org>
Date: Mon, 26 Oct 2026 09:04:29 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] arm64: dts: socfpga: agilex: add SoCDK multi-QSPI
 board
To: genevieve.chan@altera.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261012074845.18039-1-genevieve.chan@altera.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20261012074845.18039-1-genevieve.chan@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/12/26 02:48, genevieve.chan@altera.com wrote:
> From: Genevieve Chan <genevieve.chan@altera.com>
> 
> The Agilex SoCDK is populated with a single QSPI flash by default. A
> multi-QSPI daughter board can be fitted in its place. That board connects
> four Micron MT25QU02G devices (256 MiB each, 1 GiB total) to the HPS
> QSPI controller on chip selects 0-3. Each device carries one partition
> covering the whole flash, and is described in quad mode at 25 MHz, as
> the four devices share the clock and data lines.
> 
> This is a board-level population difference, in the same way the
> existing SoCDK eMMC and NAND variants differ from the default SoCDK.
> The HPS is the Agilex SoC, later marketed as Agilex 7 F-Series. The
> programming model is unchanged, so the board falls back to
> "intel,socfpga-agilex" and does not add an F-Series SoC compatible.
> Agilex 7 M-Series is a different device and already has its own
> fallback.
> 
> Patch 1 documents that compatible next to the other Agilex SoCDK
> boards. Patch 2 adds socfpga_agilex_socdk_multiqspi.dts. UART,
> Ethernet, USB, SDMMC, LEDs and the watchdog match the SoCDK; the QSPI
> node is the difference.
> 
> Changes in v4:
> - Give the partitions on flash@1-3 unique labels so that they do not
>    share an MTD name with flash@0 (Dinh, Sashiko). flash@0 keeps
>    "Boot and fpga data", which U-Boot's RSU code looks up by name.
> - Explain in the patch 2 commit message why the flashes run at 25 MHz
>    rather than the 100 MHz used on the SoCDK (Dinh).
> 
> Changes in v3:
> - Rebase onto the socfpga for-next branch, which moved the SoCFPGA
>    device trees to arch/arm64/boot/dts/altera/. The new DTS is added
>    there.
> - Reword the subject of patch 2 to avoid repeating "Agilex" (Dinh).
> - Add Conor's Acked-by to patch 1.
> 
> Changes in v2:
> - Rename the compatible, DTS filename and model, dropping "agilex7f".
> - State in the binding patch why the fallback is "intel,socfpga-agilex".
> - Describe the daughter card instead of restating the diff.
> 
> Genevieve Chan (2):
>    dt-bindings: arm: altera: add Agilex SoCDK multi-QSPI board
>    arm64: dts: socfpga: agilex: add SoCDK multi-QSPI board
> 
>   .../devicetree/bindings/arm/altera.yaml       |   1 +
>   arch/arm64/boot/dts/altera/Makefile           |   1 +
>   .../altera/socfpga_agilex_socdk_multiqspi.dts | 213 ++++++++++++++++++
>   3 files changed, 215 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/altera/socfpga_agilex_socdk_multiqspi.dts
> 

Applied!

Thanks,
Dinh

