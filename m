Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D67C43F8DE;
	Tue, 15 Sep 2026 07:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789458370; cv=none; b=Zah4MN7tbwh8UumK8zt21Sb0sp9U/rer4Ac0BkzOFrFAh1AftyK77krmji5aBHfDNJ1YsHR/1JNMoUjLx+dWVq4JX13DFKiueQlg8SnC1VyQ8oBQjb6ugJojxNevETidPbmW7JLiDWK4vj+3JxwpuV9Z7nqYW/aAKKvhK/8KHwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789458370; c=relaxed/simple;
	bh=R2xJrxl6upO9LEZweJ/1XyeQgzkDVimk0RD2c0Xhaos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XnlVYLLxGABqtt61iw+iKoZzb0R2Mza9B1wzefoHzPoSwOagkkWn1nREMRi4UKPjAc1ys5wbjN8tMi9vuab2xhVolNx2bDitwxUmz+sjC7Bn0VeYhJAwry3Lf6TSZZNSlSHOpoWTpa+Gn9Ql4Pjooa4fVuyhyKu75mrSNmp+zV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RuHpU7fE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RuHpU7fE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789458366;
	bh=R2xJrxl6upO9LEZweJ/1XyeQgzkDVimk0RD2c0Xhaos=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RuHpU7fE5Z3XY4d1RQw7AynI1G6BDoB5xPNNPepviV3HvXt+ms0L31xc6+SHCLzxK
	 3iRHWRkSFYEfTowlf3WpUsYCHq943JD2sONUO1hchsQvSRXeRQOLwyeaRjXmmcwKeK
	 lvKFHWIqsyWUAEMvz0NjGq0oTNlLts5iy/XigFtwbrt/jhfrWIH/lP/zuskE79bnAG
	 hW7dKYFXKbQjRIIr1WoJkGK6o9MeiSO5wrdanTLQ7QT0171MdWICbAN5KtAVQkvRw2
	 azvGzRVR3aLd6f1gYWkrhED0LRtpdOb8Al3muwKT1CBvuc7+BAkaNlAkNttyau6+1K
	 cx1vOKlGON/6A==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 80C3417E007B;
	Tue, 15 Sep 2026 09:46:05 +0200 (CEST)
Message-ID: <a465210b-cd9c-4c5b-a54d-54d4b62b0706@collabora.com>
Date: Tue, 15 Sep 2026 09:46:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: mediatek: mt7988a-bananapi-bpi-r4: add
 ramoops region
To: Martino Dell'Ambrogio <tillo@tillo.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org,
 tony.luck@intel.com, gpiccoli@igalia.com
References: <20260915064254.1594808-1-tillo@tillo.ch>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260915064254.1594808-1-tillo@tillo.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 06:42, Martino Dell'Ambrogio wrote:
> Reserve 1 MiB of RAM just below the ARM Trusted Firmware secmon region
> (0x42f00000-0x43000000) for persistent kernel log storage via pstore/ramoops,
> allowing post-panic console output and oops dumps to be recovered after a
> reboot. Without it, kernel crash logs on this board are lost when the SoC
> warm-resets and the on-chip console buffer is reinitialised.
> 
> With record-size=128 KiB, console-size=256 KiB, ftrace-size=64 KiB and
> pmsg-size=64 KiB, ramoops_probe() carves the post-console remainder
> (640 KiB) into five 128 KiB kmsg records, with the requested ecc-size=16
> reserving a small Reed-Solomon parity block from each zone's own
> allocation (per persistent_ram_new()). The ECC lets pstore recover dumps
> even when the panic path truncates writes mid-record.
> 
> The no-map property is required so the reserved region is kept out of the
> kernel linear map. ramoops remaps the carve-out write-combine via
> ioremap_wc(); on arm64, leaving the same physical RAM mapped cacheable in
> the linear map at the same time is an attribute-mismatch and risks losing
> panic data to dirty cache evictions from the linear alias.
> 
> The carve-out sits immediately below the ATF region already declared at
> 0x43000000 in mt7988a.dtsi, so no other reserved-memory child is moved or
> resized. BPI-R4 ships with at least 4 GiB of DRAM starting at 0x40000000,
> so the region is well within installed memory on every variant.
> 
> For the carve-out to actually preserve content across a reset, the boot
> loader must also avoid touching this region on warm reset; on standard
> BPI-R4 boards with the stock OpenWrt U-Boot fork this already holds.
> 
> Signed-off-by: Martino Dell'Ambrogio <tillo@tillo.ch>
> ---
> Changes in v3:
>   - Resend; no functional change. Rebased on v7.3-rc3, where the v2 diff
>     still applies unmodified.
>   - v2 drew no review comments. It was also sent, in error, as a reply to
>     the BPI-R3 patch's thread rather than its own, so it is likely to have
>     been read as a duplicate of that board's patch. This version starts a
>     fresh thread to avoid repeating that.
> 
> The matching BPI-R3 (mt7986a) patch is being resent as v3 at the same time.
> 
> v2: https://lore.kernel.org/all/20260528123645.2650085-1-tillo@tillo.ch/
> v1: https://lore.kernel.org/all/20260528092807.1936177-1-tillo@tillo.ch/
> 
>   .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi  | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
> index 0ff69da..6a8dc89 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
> @@ -80,6 +80,19 @@
>   	};
>   };
>   
> +&{/reserved-memory} {

It's just

	reserved-memory {

Sorry about missing your patch for all this time; the comment applies to both btw.

Cheers,
Angelo

> +	ramoops@42f00000 {
> +		compatible = "ramoops";
> +		reg = <0 0x42f00000 0 0x100000>;
> +		no-map;
> +		record-size = <0x20000>;
> +		console-size = <0x40000>;
> +		ftrace-size = <0x10000>;
> +		pmsg-size = <0x10000>;
> +		ecc-size = <16>;
> +	};
> +};
> +
>   &cci {
>   	proc-supply = <&rt5190_buck3>;
>   };
