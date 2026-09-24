Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85537411FA4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790276596; cv=pass; b=b+UyqXokQlxsQ1oag2p90g7zBa4GAGqwYBsjZeTE3/GfGhle5YVSCumSd/SijeDbbKtCYPWnfbN2yjCRoa/P53Tj7vOsNkaZuGOMSlgkHoFnWYyHsvw2J5OOpFLYzIrKV0sT9s/Komn9mzTujvMdY7y2n4kw5r5zTJxFHcY2Gg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790276596; c=relaxed/simple;
	bh=FyJSk2EQr9jIUBsLW3d+Qp2TNqU0yBEdip2Oe35nzRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jvI/mIMGABZMyVnKf2XCs8W7V6Ntr8KmV4kDb5eRVUZc0CBw9ou9DUMrp+ykjbRRhrt7lLavF/j0tgMpT802GV7b8F7V3h3WQU49xrvh7MqhStoIOyS5IEZpCB5uiTt0HFQgPemVgEbJ4VJlMUSFACdoRH5ppuFIeRoxG1dPkZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl; spf=fail smtp.mailfrom=wermuth.pl; dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b=eMnhG4ZU; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b="eMnhG4ZU"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a30521ef15so748461fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:03:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790276592; cv=none;
        d=google.com; s=arc-20260327;
        b=pCsoiUYtdS0zJZa1CyzNZlp7htQCynYa+SaVy/oIcHdkkBDDdMGOdsq7sM2SqLIh3Y
         87ZirA3gLGzrZLfUYM+GmhCRUi24ieRi0pnz85MJMLfdLEGdGkhWKlYamg7ntZw6Z828
         /EvtaBHW0jaPuv9dVVkVW8l291y5x0wfLmG2F1bxDdvN8lSQFHcDeWf+9SIIREgTVcbG
         oArlaDqCBkQQ8oQ3QiEOlTSaz37PlVU126T+5E/998D6mI/LZ25cF3CLzREbI1KAWGve
         J7KgxI1J7jESBW4Dcf7ZCNe4CbPCz1AhX8T21SfkXsjU6PIdrpXWilT/CAmX9BPZ7et4
         wU2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EJ1c4rHsHJGZ/tEYJFAlykm9/fk5FPrkQdOE5F+Bc3A=;
        fh=F3G4i+FnFQ3rgHtImpKVWQ3iHyM/Hnacez8C4zKzhO0=;
        b=oKwOxon39gLD0QatZzmfvxTDlyUBANPf5W6gvnaRfboEnuhyy0ug1C5ifheVl8mi/3
         8B78X5Q2AzySAtFgiSYfP/uUq7no8nRamuzV6BgscQeIPERJozF3M/rI6uz0+wuAEtuz
         VdTmAgZy6Njd+jcy4uBuNYLVRUPN3SuPtDUKP4/paXwkVOAfwpeO4SlrRW2n0L9g01Hi
         hc7AFvnmXml/BtRMilDFjLIecfhbrxooLrjiMB0AY0xWdcs5cPf70QJp65Ekx75OQSmv
         t8KfHTZcyLmHgpmsSkKCrSxxc6zDtdOCTjBn3owiKN/p5Co/7htC0WiTZv+dOVaJp2A9
         T18Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790276592; x=1790881392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EJ1c4rHsHJGZ/tEYJFAlykm9/fk5FPrkQdOE5F+Bc3A=;
        b=eMnhG4ZUQHGNTYLIKbnqZzGH4cdC77mLfcHTUQA4EJNrM1CDjG8CjxszKYNbgWIKEh
         Vi1XPEgB670mxJthc5ZjqV8zmM/qm0dnQkLlnZR0omm9X3SK3kgH9ryLM8dift7v8qUE
         XbnYDqNS58eKkVP41iF7iionX7XRNolHh8GilYrpTuEqYL1nrb4dxqfkgM41e+41cI8x
         oI6Oq4SVS/IfJ9wZ9mBhuPnuQDLJIH7Kg6JrUsalQ8CMUUAc51+YOBYGC1J82XWQIC+E
         G6ahkEmThDTPHToUXCAyaDUl3XOLs7EM/xwHOhcpakY1vjgYlaz+gM46/5zrgPG7jWLc
         anIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790276592; x=1790881392;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJ1c4rHsHJGZ/tEYJFAlykm9/fk5FPrkQdOE5F+Bc3A=;
        b=JzMaZJn1Y8cXS/Tr5LTKf+OY6sUxgZNUGG84/qyvCy8o+yN69Penl6Ytf1nYlwJXof
         GJ0tzqKucXubOflKHlCbC0EuDSgxhlOqVu+IVY9xPRsYFjefWoNguh/TB30uy0XVq+i+
         y4zG8Fzze8t4Sj8pToc78zYJTxoh4Ed+yg24GSde9WqPjtSsJ8RfRlIcdbAjbPzBe/SP
         YUlnHs5qKA2LyUdND1jEPTW/e+H6TyPfMhoI/XVdZ1XnBC06mCm6hqBlMZcTutxWJbte
         D/Ay5XTnjcug3aMntkg0DCrY8FcrCqpqvpsQ3UFQ/1ccnLbeR1Ydpos4PCJ/F6AHkUTT
         MnJw==
X-Forwarded-Encrypted: i=1; AKwUvBwJv2JPXUIxTvOhss/ddrw0IT07KFQhY8GY3qUZGMj/t8QcI8ud7uzvv64Vvnx4kkeIm1Fu7+FaAtv0XG8=@vger.kernel.org
X-Gm-Message-State: AFuF++m8xNYXgN2X+vaulcSpzrwgZ7FvvJwcs9azwCfKxv0R70APVHnF
	tg8mbD0IDw8yv34bBHBth1tqIDb/2SadgDaw5VfkUiFWOp+IQLjNfheOpccgEaK3gfQ0hiUvyGv
	ElrjodG8KZ2TsXExTuM68nZhsd6QGdlAafCHIaK+OtTP1DtSHnK7VvgU=
X-Gm-Gg: AYBFou2kOfVI5lp6/R1hAb+thwFrO4Vlg1RwgT3WTAhpzBrra/7Iz8+xaIIk0Iw2yvl
	8IKwDBgczjaCbZktQ3hU3RV99cIrPHvb9S2/JlMk4BTfQcuQwOaeeesxVMEKzwVIDQL0mUV+ZJe
	hmcweWGPWv3SX6/GGjtjSbUZGOndZs8Wn/RNm5t1/5VqJmjPm6T5cWYiRj6lSSvQ6N7H5ngabjr
	3L8OtLsT6Al/iP6UokC8uZKh5sNyni0k6R0aGkIg2CeTUSFyzloEJsCNVBp3j1ScP9v/eH/lJ8f
	ZsTEmzO+pq6l7VrbsBO81dx/Z0cjdNjwjPFxE53bO8sGwB0Ahck3eGAxj5O2T9lBYl8=
X-Received: by 2002:a2e:bea8:0:b0:3a5:b507:dfb with SMTP id
 38308e7fff4ca-3a63c408eb4mr9542881fa.29.1790276591671; Thu, 24 Sep 2026
 12:03:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924071445.441822-1-adam@wermuth.pl> <20260924071445.441822-2-adam@wermuth.pl>
 <e03db2e9-085b-49ff-8d4a-bc112bc4ddd7@kwiboo.se>
In-Reply-To: <e03db2e9-085b-49ff-8d4a-bc112bc4ddd7@kwiboo.se>
From: Adam Wermuth <adam@wermuth.pl>
Date: Thu, 24 Sep 2026 21:03:00 +0200
X-Gm-Features: AclHuK9IKF3aAn5suDmSsCEFKxWsKS6ErHA9CID8WYyLrPR40kN4mqnvEj86JPs
Message-ID: <CABkrwJ6uvjS8bez6j0MZbp2Y+O9RhyU09YOLrUzHaeUEVC=Qkg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Enable USB 2.0 host1 on Radxa
 ROCK 3B
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonas,

On Thu, 24 Sep 2026 6:12 PM, Jonas Karlman wrote:
> This and next patch is likely best suited as an dt-overlay.

Thanks for the review. That makes sense, as the B-key slot is not
always populated.

For v2 I will move the host1 enablement and the WWAN power, RESET#
and W_DISABLE1# handling into a new rk3568-rock-3b-wwan.dtso overlay,
and keep only the fan patch in the base DT.

Adam


czw., 24 wrz 2026 o 18:12 Jonas Karlman <jonas@kwiboo.se> napisa=C5=82(a):
>
> Hi Adam,
>
> On 9/24/2026 9:14 AM, Adam Wermuth wrote:
> > The USB 2.0 data lines of the M.2 B-key slot are routed to USB2_HOST3,
> > which is served by usb_host1_ehci/ohci through the host port of
> > usb2phy1. Enable the controllers and the PHY port so that modules in
> > the B-key slot, such as LTE modems, can enumerate.
>
> This and next patch is likely best suited as an dt-overlay.
>
> Regards,
> Jonas
>
> >
> > Signed-off-by: Adam Wermuth <adam@wermuth.pl>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm=
64/boot/dts/rockchip/rk3568-rock-3b.dts
> > index 149a5306bb03..ad9a91c0d0d0 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> > @@ -758,6 +758,14 @@ &usb_host0_xhci {
> >       status =3D "okay";
> >  };
> >
> > +&usb_host1_ehci {
> > +     status =3D "okay";
> > +};
> > +
> > +&usb_host1_ohci {
> > +     status =3D "okay";
> > +};
> > +
> >  &usb_host1_xhci {
> >       status =3D "okay";
> >  };
> > @@ -780,6 +788,11 @@ &usb2phy1 {
> >       status =3D "okay";
> >  };
> >
> > +&usb2phy1_host {
> > +     phy-supply =3D <&vcc5v0_usb_host>;
> > +     status =3D "okay";
> > +};
> > +
> >  &usb2phy1_otg {
> >       phy-supply =3D <&vcc5v0_usb_host>;
> >       status =3D "okay";
>
