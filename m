Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E046C4A1E1A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946573; cv=none; b=dlpK17603/jck0XwglUZX2NDKlKo5f8qH8MOOUUhLCZgS2iCoSz0paDmdm8ycunjVGrUz6iFp2WvbgYQaqtSGZTxIPhT18IZPyRdRnHV6ejOUBuFA/B8Hx8zSaZ7SnSRqm1YQ7ZGY+u9t0Cz6PhG1Fe9ozbgIvZViypGFAYg0QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946573; c=relaxed/simple;
	bh=FKY+rQrM7Z18mX3wbyKDLfHo7zNYWHKgod4sRdzAurk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZrOa0PxtNTUU1y/+gU303Yt4HEAR5sQtGAn/bQTRY1nHtTOWMTNKJUr2qOEBBS6KjEEHGKdSPLlo+MaOi/vJCAQ5TKRy7lSv+wqzlH9pt6U9VsKHCO3FmIXx7jgYqDEYi4VWqrTYBOlzlBj0xwNxtDWlVBrWIJ3MbMG9c7zysdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=RpXcwATK; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="RpXcwATK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=KZjE+aJ4X+OqBxNEC4kYnyi3sOPxXey2hjWtTIRy3TE=; b=RpXcwATKgD3GA4eeikau6CnLBO
	LdPpjqfIww+7LsNxanj8VUZB2FMcGjB4rARfcJQkjXWsPTEiSIOrm/3YOZ3+Qh6RsK9xIIpcQSt/+
	H14XV958hnXmFOXE8863UqZRTEVM90dgQKX0D86ZcgZN1eL19Ik7Y6VxRMnw8qdf/2mUnz4vfo+zZ
	uQNlGT+vrbDkruJaH1x7hs/FBHmVGcz+V6GBFbEpDAQCcSBeKGmL2/GtpPExqLkslJanwA3FaZ2zl
	5RcHS9axOUEI9SdfAx/UEwaldv6TgsNpcR3/3JX2dOCX6trTZqpdkYqeIvQrADIKv4j3OOufIY6Hg
	SrGJwHlw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Russell King <linux@armlinux.org.uk>, Johan Jonker <jbx6244@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?B?SMO8c2V5aW4=?= BIYIK <boogiepop@gmx.com>
Subject: Re: [PATCH] ARM: rockchip: smp: enable CPU1 for rk3066a
Date: Fri, 02 Oct 2026 15:09:10 +0200
Message-ID: <7009090.MHq7AAxBmi@diego>
In-Reply-To: <545b78a0-159b-4ebd-9e2a-47d519c98bf9@gmail.com>
References:
 <20260829-cpu-v1-1-33dca576db92@gmail.com> <2667576.VLH7GnMWUR@diego>
 <545b78a0-159b-4ebd-9e2a-47d519c98bf9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Johan,

Am Sonntag, 30. August 2026, 13:17:15 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Johan Jonker:
> On 8/29/26 23:59, Heiko St=C3=BCbner wrote:
> > Am Samstag, 29. August 2026, 01:40:57 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Johan Jonker via B4 Relay:
> >> From: H=C3=BCseyin BIYIK <boogiepop@gmx.com>
> >>
> >> RK3066a CPU1 fails to come online. Fix by using
> >> a similar mailbox construction as in use with
> >> other Rockchip SoCs.
> >=20
>=20
> > "RK3066 CPU1 fails to come online with recent kernels....[rest]" or so
>=20
> Not recent..
>=20
> > and also please use the line length up a resonable length like around 7=
0> to 75 characters.
> >=20
> > Also, is it known, why that happens - i.e. what changed?
>=20
>=20
> What loader chain did you use then?
>=20
> This guessing!!!:
> From TRM: RK PX2/rk3066a supports to boot from internal bootrom or embedd=
ed SRAM
> Currently rk3066 U-boot doesn't remap, so we end up in ROM code waiting f=
or deadbeaf:
>=20
> void main(void)
> {
>         deadbeaf =3D 1;
>         if ( !(__mrc(15, 0, 0, 0, 5) & 0xF) )
>         {
>                 __set_CPSR(0xD2u);
>                 __set_CPSR(0xD3u);
>                 DELAY_write(24);
>                 CRU_CLKSEL();
>                 DELAY(10000);
>                 MAIN_LOOP1x4();
>                 DNL_LOOP();
>                 while ( 1 )
>                         ;
>         }
>         __set_CPSR(0xD3u);
>         while ( deadbeaf !=3D 0xDEADBEAF )
>                 __wfe();
>         secondary_startup();
> }
>=20
> Can't put a precise time tag on it since when.
> Let us lead by what current available open source loaders solutions can d=
o.
> Please advise here.
> How far does a fixes tag have to go back?

So ... found time to test a bit:
=2D Both my Marsboard (RK3066) and Radxa Rock (RK3188) currently have a
  u-boot that is really old ... 2017.09 / 2017.11 to be exact.
=2D Both boards can bring up the other cores just fine
=2D It seems there the remap was still enabled:
  https://git.u-boot-project.org/u-boot/u-boot/-/blob/v2017.11/arch/arm/mac=
h-rockchip/rk3188-board.c?ref_type=3Dtags#L31
=2D You cannot require people to update their bootloader, only work around
  old versions.

Right now you end up with a meshup of different parts.
In the old codepath, sram_addr+4 contains the kernel-start-address, which
now gets overwritten, breaking older loaders.

So the way forward would be:
=2D add code that disables remap on both rk3066+rk3188, hopefully resulting
  in the same behaviour indepent of the loader used
=2D change to use the bootrom path for all socs in rockchip_boot_secondary()
  so just remove the conditional around it
=2D drop the rockchip_smp_prepare_sram() part, as it's not needed anymore


Heiko


