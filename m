Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C6A489FC8;
	Mon,  5 Oct 2026 17:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791223193; cv=none; b=ocPNppY9tjNezwVD6pW6R6iktdlU/qz9vOH0ttatKK49X+HmWlMlGAb4bUcwV+c3O90DqoDNHhL69YWVrXm1Av7YGeRq3dkdsrnPVMQfsFbCt89wyNP2qJtLEfu+XyJc6kMG1SQZppQtlr33aTHoyECEoFSA8C/oRpVuZmAfGhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791223193; c=relaxed/simple;
	bh=cRiCIWvgrOFVHHfKVQ0qn93tLHDE7Dwo5Noh1dy8EtA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DCjaO6aZHInc8qjRJ0UWYx07hhb6OFXTrYWv8VKx04UX2PGkxO6e4tyIl2Gpqy0bVUGQUpvzzxhCU3PPfg+nkGryjZnfd6RjyKPKOhMMASBuLhQ/7/n/RgVA5i3njzBIhBDo2JsavxtAkTAiSpq79XDHqfG+i3O1P0iKH2tOOy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AwnX6RbW; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AwnX6RbW"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC63E152B;
	Mon,  5 Oct 2026 10:59:38 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8945B3F86F;
	Mon,  5 Oct 2026 10:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791223182; bh=cRiCIWvgrOFVHHfKVQ0qn93tLHDE7Dwo5Noh1dy8EtA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AwnX6RbWnAxHYsHmazTdgBo+b1/m6pn5xh6PtT9gyzU7SeYlXRBbbFZx9KP1nXjfv
	 dBlFOJCVlBelU38PvNQAeT5rP+2h+3FyFAxUT4kOcHpYC0qkjqqYOAcbTPloyfNR1q
	 GsnoQhY/6jlIlq+7O9QMMAVU/IcfIBBvya3fEAk0=
Date: Mon, 5 Oct 2026 19:54:38 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>, Chen-Yu Tsai
 <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Srinivas Kandagatla <srini@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: sun8i-r40: Add SID node and THS
 calibration
Message-ID: <20261005195438.6368d092@ryzen.lan>
In-Reply-To: <CAP9ODKr2FQ2xeg-u_UQ-krUGsaU3mcWjWYfPAPd7V=ks2=GwzQ@mail.gmail.com>
References: <20261003012534.418820-3-otavio@ossystems.com.br>
	<20261003012534.418820-5-otavio@ossystems.com.br>
	<2c75983e-5e63-4613-a9a8-055015d04bbf@arm.com>
	<CAP9ODKr2FQ2xeg-u_UQ-krUGsaU3mcWjWYfPAPd7V=ks2=GwzQ@mail.gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 5 Oct 2026 12:49:57 -0300
Otavio Salvador <otavio.salvador@ossystems.com.br> wrote:

Hi Otavio,

> Thanks for the review.
>=20
> Em seg., 5 de out. de 2026 =C3=A0s 06:02, Andre Przywara
> <andre.przywara@arm.com> escreveu:
> >
> > Hi Otavio,
> >
> > thanks for sending the patch!
> >
> > On 10/3/26 03:25, Otavio Salvador wrote:
> > > Without the calibration cell, the THS driver leaves the sensor
> > > calibration registers at their reset value (0x800) and the reported
> > > temperatures drift from the real die temperature by a chip-dependent
> > > offset.
> > >
> > > Add the SID node at 0x01c1b000 and wire the thermal sensor to its
> > > factory calibration at eFuse offset 0x40, one 16-bit word for each of
> > > the two sensors.
> > >
> > > The R40 user manual gives the size of the thermal sensor key (32 bits)
> > > but not its offset. The vendor SDK key map names 0x48 "thermal_sensor=
",
> > > but that word is zero on all the boards checked. On an A40i running t=
he
> > > Boardcon vendor kernel, the THS_0_1_CDATA register holds exactly the
> > > eFuse word at 0x40 (0x08780875), which confirms the location.
> >
> > So in some U-Boot BSP sources on github I see
> > arch/arm/include/asm/arch-sun8iw11p1/sid.h putting the sensor at 0x34
> > (like the H3 or A64).
> > Can you check the values there? I see that Tina-Linux puts them at 0x40,
> > as you reported, and it's probably more reliable there than in the
> > U-Boot sources, but it's worth double checking.
> >
> > The rest looks alright (checked the manual and how the compatible string
> > is handled in the driver), so if you can confirm that it's 0x40:
> >
> > Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>=20
> Yes, I checked 0x34. The BPI U-Boot sid.h for sun8iw11p1 puts the
> thermal key there, but that word is zero on every A40i I dumped: three
> boards on mainline with this patch, and the Boardcon board on its
> vendor kernel. 0x48 is zero too. Only 0x40 holds two plausible 12-bit
> values:

Yes, I found my BananaPi-M2 Berry, and can confirm that 0x34 holds 0,
and 0x40 reads 0x085a0857.

So all fine, 0x40 it is.

Thanks for checking, and my tag of course stands.

>=20
>   board 1: 0x08780875 (vendor kernel, THS_0_1_CDATA =3D 0x08780875)
>   board 2: 0x082d0822
>   board 3: 0x083d0838
>=20
> The value differs per board, and on the vendor kernel THS_0_1_CDATA
> holds exactly the word at 0x40. With this patch, CDATA on boards 2 and
> 3 also matches their word at 0x40. So 0x40 it is, matching Tina Linux.
>=20
> I also compared the MMIO window at SID + 0x200 with the register-based
> readout (the H3 method) across several boots. All 64 words matched, so
> the R40 doesn't seem to have the H3 readout problem.

Yes, we have never seen this issue again, it seems to have been a
one-off bug.

Cheers,
Andre
