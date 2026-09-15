Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE93A3D3D1D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499119; cv=none; b=eyBy29zx4QQnF9nHscrohXO3voryZrnnA1DAtmrmqvWq84/lphiuJ43gpjORxUutn8jcBEaWRDPwq6yR9OmEkzqpMtDlqfk64TuXcmlF0WkxtdGA8jCGoiNFo4SvWMewBB8PfpaRF6e9ibmuDuvrm5mh+g2X8A3gtrLgBiMCFzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499119; c=relaxed/simple;
	bh=zqFxS2lFyFp8vfpSA7TFoG5byAjCM/l/DWQWxfhZvBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=km5R5VMCyELaLGghhGDZNDY7CRhqrw5fXl4qJ5itV5i9KfKkplb0Xi05fkcDZxC5DDs0YRrUrrZgB5NGvfV4UWl3rrVLeHs7DeWxga1KtbyhM7mpUxiTkWPnA97XyAsIjm1TR47Ofxh0YEBoSPOxzqmDBjwsDi3BWxs8BDC+TjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzR509Qu; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzR509Qu"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351832so31398f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789499116; x=1790103916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Og9+Bqy3ZcQHrEQ2wufI4kg6uz2g9lj20dmnJoDV6rE=;
        b=ZzR509QuHxpazSfOrDtX/J0uYs/cnzA2G0c78i75+3OlZwe43/yIe4ANJMs5+Ih282
         xhkUZtoNHzxwq9rmsWf9qRbT24+4ul1KdhrfdZSdRul1zZtjw69Q8Dv09PoLha00WoSZ
         nxCvcgOL/bxu5WIGOHviJvmsCM0rr+3Zxie2i3GeVKZ9UmT+qTLdCHSqlGBwpV2L497l
         iF+uybO04jyo1EmN8iKenx6LlGEkrX1IGYnklyeIsM4Qyi23TevWMrrEqDmROmLQSlYL
         0GMploAB4KkT6FujNzT47o3Tgn/v+d6qEmRecRFcfwnwwnT3Jvqwz45Nt/e7qV4zh23O
         lQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499116; x=1790103916;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Og9+Bqy3ZcQHrEQ2wufI4kg6uz2g9lj20dmnJoDV6rE=;
        b=P9ZFTIsFNl0au/cEkzybiP5UcN8d1ctLLrbb1mqeMLQKHo95u4JcOa3xuiTQHTPdcF
         r0s5e7WABoXQD0lRvIByLjKM2Jn8imLRZstCkdJKVzEpf4q/Im1OVuBr26ZhnE9r3t1g
         WcssNrNntNxLViOYCzRwRz5dXIJ7r5+wQMAFQJadD7sylrSkhAPWj2Sy8UkHgI3h26Nq
         X3M4biiPitBNlQF9/6UnrPHFDqGP7Cy1ryxdwqXV/BDsiC3tDhtbnXLiOxvLPQmuKlEz
         SVMFd3nBNqhUluMcL4BJmDHRvvi5GIdWKpp+iYwDIJdWexcuu57HksZx+7xaIgImshPF
         mkJw==
X-Forwarded-Encrypted: i=1; AKwUvBwMVd2iYDGfbumLJl3MksDpEZVQUeBkvE0xSRYCa2CU7g0mhkzOxccMUNzavT6uMCXExeKAM9G02ztOdQY=@vger.kernel.org
X-Gm-Message-State: AFuF++lYpo+/BngFJyoeWaXYsGYbG9fKzqqYkoa/yl6iwvT3xeu7vLt7
	SrEg74UMTRT0HmrwbI4DYqRGE3qgFtXqzBpobTBfdSdB3xQ5jVNynp7t
X-Gm-Gg: AYBFou2Rf6QxNUExqdYN/uTv6DaVP40QfuUqgyDGcUf47TmLu2gIqz0j+6qDsEpEyr4
	NCfO2wOsVEk1JErVwojds/Nko4G1bg/OW9OiD3Awn08rOblIiqwW1NJcCu/sfDY0jjN4CEmqxPi
	PUzL6i35eL0azN4kiB1I3jEKxkhkgzMpuhVoMMxb/3lGl1b8dvhCbfVkxLAyUQawAgRD0gcUI2b
	7vSn1dUy3kAU9Ndw8LPgqu3m2MiqbJ9cx58MG0tvbyj46gDgcGXm6OiaimCxZmdgjqcFejBFdRE
	aeYCL8BhUhaSAjF6NolfMmR6Pz0Oom0N3Xd1hadKDzXfSZI1w/RQmoNCMmnebXGm1WvIwkk73Hv
	pEYFugt2rm8j+R/nBoBWLRUzLxKOvJbrD5JbkcnPem2wB5VFX+gpd4i3OaPZWdIc6Mbzy1L2h89
	thfD4FX/7AxgHYNL+tIBQRp8bXJFmX1W4fjTE3niciSA/WPhudZ9wTVFF/oHm+Qp7hPGGcWuPjq
	UrmeDYgGmaZOG/XGFUQndqlkb4qM6qqE7BjhY8yxkjk6I2mu6DWoZ1T0yEbP7ZGfrPuOZmGjCti
	QJLtMKISLRR3H65Djbs/Wy3mWySwHeXLCw==
X-Received: by 2002:a05:6000:5ca:b0:487:999:7117 with SMTP id ffacd0b85a97d-4870999726fmr4107788f8f.16.1789499115875;
        Tue, 15 Sep 2026 12:05:15 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f03:a400:b1cd:6e89:b357:c27? (p200300ea8f03a400b1cd6e89b3570c27.dip0.t-ipconnect.de. [2003:ea:8f03:a400:b1cd:6e89:b357:c27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf37e69sm1044478f8f.29.2026.09.15.12.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 12:05:15 -0700 (PDT)
Message-ID: <29341dad-f1a1-41c0-83a5-3f7190a42d95@gmail.com>
Date: Tue, 15 Sep 2026 21:05:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4] r8169: don't enable chip LTR when the platform has
 not enabled LTR
To: Yogesh Gaur <yogeshgaur.83@gmail.com>, nic_swsd@realtek.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Javen Xu <javen_xu@realsil.com.cn>
References: <20260911131352.2036-1-yogeshgaur.83@gmail.com>
 <20260914130050.304-1-yogeshgaur.83@gmail.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20260914130050.304-1-yogeshgaur.83@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.09.2026 15:00, Yogesh Gaur wrote:
> rtl_enable_ltr() programs the MAC to generate LTR messages - ALDPS_LTR_EN,
> LTR_SNOOP_EN, LTR_OBFF_LOCK_EN, plus LINK_SPEED_CHANGE_EN on
> RTL8125/RTL8126/RTL8127 - and rtl_hw_aspm_clkreq_enable() calls it on
> every ASPM enable, then goes on to let the chip trigger L1.2.
> 
> The only gate is tp->aspm_manageable, which records that the OS is allowed
> to control ASPM. It says nothing about LTR. LTR is a separate PCIe
> capability that only works if every device on the path to the root port
> supports it. The PCI core works that out in pci_configure_ltr() and
> records the result in pci_dev->ltr_path; per PCIe r6.0 sec 7.5.3.16 a
> function must not issue LTR messages while LTR Mechanism Enable is clear.
> 
> So on a platform whose hierarchy has no LTR path, the driver tells the
> chip to start sending LTR messages nothing will honour, and ties ALDPS -
> the PHY's link-down power saving - to them. A report against RTL8125B
> (rev 05, firmware rtl8125b-2_0.0.2) in a mini PC shows the effect: 291
> link down/up transitions in one eight-hour boot, with repeated downshifts
> to 100Mbps, against four transitions at boot and then a stable link on
> the kernel before the LTR change.
> 
> Gate the chip's LTR programming on pci_dev->ltr_path. That field exists
> only when CONFIG_PCIEASPM is enabled, so the test needs a preprocessor
> guard rather than IS_ENABLED(). With CONFIG_PCIEASPM=n the PCI core's
> pci_configure_ltr() is a stub and LTR is enabled nowhere, so the chip
> must not issue LTR messages in that configuration either.
> 
> Note this does change CONFIG_PCIEASPM=n builds, which used to program
> chip LTR unconditionally: pci_disable_link_state() is a stub that returns
> success there, so tp->aspm_manageable ends up set.
> 
> Fixes: 9ab94a32af70 ("r8169: enable LTR support")
> Assisted-by: LLM
> Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
> ---
> v4:
>  - Drop closes line.
> v3: https://lore.kernel.org/all/20260911131352.2036-1-yogeshgaur.83@gmail.com/
> v2: https://lore.kernel.org/all/20260910130140.910-1-yogeshgaur.83@gmail.com/
> v1: https://lore.kernel.org/all/20260909110554.1977-1-yogeshgaur.83@gmail.com/
> 
> NOT VERIFIED ON HARDWARE. The causal claim above is
> reasoned from the register writes.
> 
> Compile-tested only: drivers/net/ethernet/realtek/r8169_main.o, x86_64
> defconfig + R8169=m, built W=1 clean with both CONFIG_PCIEASPM=y and
> CONFIG_PCIEASPM=n.
> 
>  drivers/net/ethernet/realtek/r8169_main.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
> index ec4fc21fa21f..c305a8f19551 100644
> --- a/drivers/net/ethernet/realtek/r8169_main.c
> +++ b/drivers/net/ethernet/realtek/r8169_main.c
> @@ -3037,6 +3037,18 @@ static void rtl_disable_exit_l1(struct rtl8169_private *tp)
>  
>  static void rtl_enable_ltr(struct rtl8169_private *tp)
>  {
> +	/* The chip must not issue LTR messages unless LTR is enabled for the
> +	 * whole path up to the root port. pci_configure_ltr() works that out
> +	 * and records the result in pci_dev->ltr_path, which exists only with
> +	 * CONFIG_PCIEASPM; without it the PCI core never enables LTR anywhere.
> +	 */
> +#ifdef CONFIG_PCIEASPM
> +	if (!tp->pci_dev->ltr_path)
> +		return;
> +#else
> +	return;
> +#endif
> +
>  	switch (tp->mac_version) {
>  	case RTL_GIGA_MAC_VER_80:
>  		r8168_mac_ocp_write(tp, 0xcdd0, 0x9003);

Reviewed-by: Heiner Kallweit <hkallweit1@gmail.com>
