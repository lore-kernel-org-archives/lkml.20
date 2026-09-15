Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CBD3C9EF3;
	Tue, 15 Sep 2026 13:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478877; cv=none; b=VQJ1qq9HAe/pHwlIfn38w5Xxj0ueJUm2bqhBOJ2Oiqr0xzUX4FPVHe9lu+a8nDvDct31vTlMZ6zDWc0OGUyxOmKCM6xOldENYMz/BRUSCq2WyhpuYgzrxQlf1G4mXFn0/U/5sH1MIzX+UBWN8gRX2V1H5s0u5xOYHz2Jaka0tOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478877; c=relaxed/simple;
	bh=lohGgxfltMTEidmM0lOlsFdBrhEdgnJZYESmU16vlmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PHfJWMFct5uxulTjIElYsCZ4SkC9eXuVzhX486O8kk9raR+KDjkEVCzy2Fh2UCplmRlk+WsF6raKf153ZgJaM4JTBUI0iPxlj21UEV4ZobZ1KeDhMk2PzyjfHYg3OJKt1zYGx4nBolBQ8Ef4iEeawCzMapiBfHJK6MyYi6txX4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TWPA9Rt4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TWPA9Rt4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789478873;
	bh=lohGgxfltMTEidmM0lOlsFdBrhEdgnJZYESmU16vlmQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TWPA9Rt4P0ApNG8s1YVbxCYTY5s61WEx7UKrZaXAR7c4TsiqDLmjSAg/YM3x9/v8o
	 0xYKW2eshg4cNIBhUilWWQ1GxzkzOcbhKYh1UAXoz8OS+2vj4cnkErjHyD37FiRd0R
	 0Z7al0tPohX2G08Pnijxkrb5wIP0I4oepwnx+Fff8cobci6V4UuWQvhHHQ85aGUJDZ
	 7kkVDmVgT6/vaWcArKv2Du/KGbSg4GmE1T4eZlM4CoqwDVWtBsHxkfiX1T6bukXZLP
	 VRXY3KSOJj2Bv5f6bOj7D229WMZ8043D+BhLZM642ZK+3r1EkJfPl3tDf2icaIVm2N
	 f28gFzgSQV+Vg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 621B317E0082;
	Tue, 15 Sep 2026 15:27:53 +0200 (CEST)
Message-ID: <a463a9fd-dddd-4b78-8408-2be683f80f13@collabora.com>
Date: Tue, 15 Sep 2026 15:27:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add
 ramoops region
To: Martino Dell'Ambrogio <tillo@tillo.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org,
 tony.luck@intel.com, gpiccoli@igalia.com
References: <20260915141226.600486-1-tillo@tillo.ch>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260915141226.600486-1-tillo@tillo.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 14:12, Martino Dell'Ambrogio wrote:
> Reserve 64 KiB of RAM just below the ARM Trusted Firmware secmon region
> (0x42ff0000-0x43000000) for persistent kernel log storage via pstore/ramoops,
> allowing post-panic console output and oops dumps to be recovered after a
> warm reset. Without it, kernel crash logs on this board are lost when the
> SoC reboots.
> 
> The zone sizes (record-size=8 KiB, console-size=32 KiB, ftrace-size=8 KiB,
> pmsg-size=8 KiB) consume the full 64 KiB carve-out. The requested ecc-size=16
> reserves a small Reed-Solomon parity block from each zone's own allocation
> in persistent_ram_new(), which lets pstore recover dumps even when the panic
> path truncates writes mid-record.
> 
> The no-map property is required so the reserved region is kept out of the
> kernel linear map. ramoops remaps the carve-out write-combine via
> ioremap_wc(); on arm64, leaving the same physical RAM mapped cacheable in
> the linear map at the same time is an attribute-mismatch and risks losing
> panic data to dirty cache evictions from the linear alias.
> 
> The region sits immediately below the ATF block already declared at
> 0x43000000 in mt7986a.dtsi, so no other reserved-memory child is moved or
> resized. BPI-R3 ships with 2 GiB of DRAM starting at 0x40000000, well above
> 0x43000000, so the region is always within installed memory.
> 
> For the carve-out to actually preserve content across a reset, the boot
> loader must avoid touching this region on warm reset; on standard BPI-R3
> boards with the stock OpenWrt U-Boot fork this already holds.
> 
> Signed-off-by: Martino Dell'Ambrogio <tillo@tillo.ch>
> ---
> Changes in v5:
>   - Restore this board's own carve-out. v4 carried the BPI-R4 values by
>     mistake - 1 MiB at 0x42f00000 with 128/256/64/64 KiB zones - while the
>     commit message still described the BPI-R3 layout. That would have reserved
>     1 MiB instead of 64 KiB on a 2 GiB board and contradicted its own message.
>     Back to 64 KiB at 0x42ff0000 with 8/32/8/8 KiB, as in v3. Thanks to the
>     Sashiko review for catching it; entirely my error in regenerating the patch.
>   - No other change: the plain reserved-memory node from v4 is kept.
> 
> The BPI-R4 patch is unaffected - its values were correct in v4 and it needs no
> resend:
> https://lore.kernel.org/all/20260915135722.566918-1-tillo@tillo.ch/

You forgot to send the 7988a bpi-r4 patch :-)

Cheers,
Angelo
