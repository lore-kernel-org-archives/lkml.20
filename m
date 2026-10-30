Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355767;
	b=m8WEhWmfRGHdikCElOmaDQ3YgDVVWmc3kbe/cWQeiWhC3eoXi26NOnO3Gla852QGeCJQ
	 Xq228eH+PTrRaJmCul1TJGw47ZY1npkqOxQCZggv74SPJ9OMRrkK8Li3ZWUV+Xuyj3vf8
	 DKtAW/5H2Gt1432WZW/tzAINYAmdjCxZdHrjxVYaEA2hf7sTrPiXsi36W8i5HeqP5Hiw3
	 TcS6v3popdLfTdWh+l50UavvKjH7wiSrsQoTmklcvPXaX892dJJxc/dwnyUAknaS+E6h2
	 /GdsSO0pycRFRuDkY4iGp+CyMvo7BE7yg1Sq8DAw2dkM1DpKbbsfqINS3C8U40aKDwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355767;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=kpTyrdA1i+y2556zUDjgson9wJKQHizmCV0pLv7Ag1Y=;
	b=WquXVOEt1xnWN4k+iK7elICOrtQHkw/SUH4lVRvNk4gpDde7X5G6x9ZVPr6B0AhdGeQE
	 Bfg8z1l4cNXWFDXdOwfN8ZGPgCLS2TGIR9Jo+56yz2s/n9MzaMbZDsqw5xrVDiH7wN9Yc
	 VbxW1qn7b9wcGtM1x9qub2LsETmiMATqAbPVdAca0Ylq9OFBKjoyNruAJdCGgenRCzw1h
	 DEbdezkMMIhPi2FTrns71mR3V6AwX4Sjhdw87Qidp7NkOX7IuFe3wle5R3+IgMplZd67Z
	 poTflCjrJap2gSMa1qvbmQ21z48YS41XFDMckS5ldXV/T1+BKsDyZCNdIkaC4IrcXpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=A0gP2Okt;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D32606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74D32606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=A0gP2Okt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=kpTyrdA1i+y2556zUDjgson9wJKQHizmCV0pLv7Ag1Y=; b=A0gP2OktV3j0APACgbuDn/vfC2
	R3sA4Q36DZns9JdO1IT+O/9UkkNOBE62zjXIXx0UtsF9ctWF8OPUNfvIMifVFoGTOADx349TDwvTe
	MX+NdE5/T6osdEP7XHBhhDjyMU7vbQdcPF2ZzgjP82jvOuUAMwRDGddyf4Buf2KdKP2vvDOrtoYeP
	eiAnQHDiYnipbpt7KT/Su4XXhRawNLJbikqhYiRcj5/LTB+9wC+XWw+RUzACeWmbBAoyP2WxkmKk+
	6aZoSEfjFokA1E/1yUMhUH9n/wRtkCuagTsCw7gBbRnSJcYMH36v8/8WobtK4mmoREtsnY3KlJQMA
	utG7TZsA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: =?UTF-8?B?WWFsw6fEsW4=?= Can <ylcncn@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Johan Jonker <jbx6244@gmail.com>
Subject:
 Re: [PATCH] ARM: rockchip: rk3066: set soc_remap before starting secondary
 cores
Date: Fri, 30 Oct 2026 11:22:32 +0100
Message-ID: <1940718.QZUTf85G27@diego>
In-Reply-To: <20261030073647.164416-1-ylcncn@gmail.com>
References: <20261030073647.164416-1-ylcncn@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Freitag, 30. Oktober 2026, 08:36:47 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Yal=C3=A7=C4=B1n Can:
> A Cortex-A9 core on the rk3066 starts at address 0 when it is powered up.
> The SMP code copies a trampoline to the start of the internal sram and
> relies on GRF_SOC_CON0 soc_remap (bit 12) mapping the sram at address 0.
> The vendor loader sets that bit before starting the kernel, but a boot
> loader started directly by the bootrom leaves it cleared. The core then
> runs the bootrom instead, which parks it and also writes into the start of
> the sram, so the trampoline's target word is overwritten as well, and the
> boot logs "CPU1: failed to come online".
>=20
> Set soc_remap after the secondary cores have been powered down and before
> the trampoline is copied. The rk3188 shares these smp operations; its grf
> has a different compatible and is left alone.
>=20
> Tested on an RK3066a board (MK808B) with U-Boot started from the NAND ID
> blocks by the bootrom: before, CPU1 never came online (GRF_SOC_CON0 bit 12
> clear, sram+4 read 0x00000001 instead of the physical address of
> secondary_startup); with this patch both cores come up at boot, three
> offline/online cycles of cpu1 work, and the board restarts normally after
> a reboot and after a forced panic. Booting through the vendor loader, whi=
ch
> already sets the bit, is unchanged. Not tested on rk3188.
>=20
> Fixes: a7a2b3118b41 ("ARM: rockchip: add smp bringup code")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yal=C3=A7=C4=B1n Can <ylcncn@gmail.com>

there is another patch from Johan pending [0], which I plan to apply after
the merge-window, that moves all of the A9 cores over to booting via
the SoCs bootrom and gets rid of the whole trampoline code.


Heiko


[0] https://lore.kernel.org/linux-rockchip/20261017-cpu-v3-1-25d8f4b06362@g=
mail.com/


