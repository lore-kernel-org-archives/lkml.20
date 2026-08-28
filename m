Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3F222FE0E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923756; cv=pass; b=b2wW+KNoDvZJImOMkxgUyhfBAX8avCT26Z36RWActTZ1h6BQZABirgqd0hWqbQDw3px6yYkReaWknbmRjAsbgFQGq2cDzHzDi+KejqKDylD2w0AirwAj8By+dgorEy/WzOFior5JMj3p0SPcB142+Ln7VZiAKE3AW9UJsn9S5cI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923756; c=relaxed/simple;
	bh=mCI7iklNQ0TyrRJOgh0VD2sQcekczqwciDl8A/HfUlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3A607dRWk885RIHi1TmkTacBKhW43M6Ihv4xEm24ZHtT/2k/lyeiDDs+57ezrWXTRX7L3nTorgU0SRcPyoxoBzDtY46Td5qAq/TwigwANcdn10fs6agSqOTIYrjJnA/t23hoSx+KDsKke3gPK4Vgw8fLbGyAH1yVMwAUhpv2Fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AebBzkS4; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AebBzkS4"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b4afb31f42so158785e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:29:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787923753; cv=none;
        d=google.com; s=arc-20260327;
        b=BgqByu3yCF9hRSarVj21JAVDkUH5egAcKU9HC28qm5kPrrbJDmKsENB/yYxkWpJnqI
         ZgCkPFyPKSLjfUal+5pj6xbUWwG8+JVP6n/O30f9+qPO74iesAldaBWpanAHmR0OoqIm
         hjclkhCOrY7Hl2seVxLCoknA8coe9KUa9rZLJGTu8Rr2GhE9xPYrSJToOOIWWbAGj5Pp
         mRXVGKnFv3Hut2HSzY0yJ6rrmcGTZjXEgluVQyM/ksbcerVJGZ5Hc8m88ts2lLQw6hEB
         AybRPkYleLrWxNt2UUdWmrhbcGquNjRgsGMKy25EMGiOFsCCK0+6aPaCTcBs4fG9dJF/
         3AOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oJ8E3vVRgDRYUctGG9mDCTffEyrWTB3jUW17WO1h8J8=;
        fh=rT5T7knDZQOownHfXI8aT1lNj7+ET6yUkJblmVTqlo4=;
        b=TUjRM62PksSBfXFd7YtnLgN9EFSPjsgeI7XdbaEgIaPSYlltW34R/WElTl9vUQ9Gwp
         yQ7Ur0ApGCsvhbYvKgrjIawj2qWSCQKi8KDSe9ZXecsVi6L5oCrEaQPRNR2LbtH/h2V+
         k3tCokmC59Sx22gXOTKplsJ7BWOAeXOrBYdvkIA+6TiIkH5wCz2CcdcHY+Ehzor+CC/V
         PRB4UVhl0qrdh5Aegb1t2i/7/5m3u+piWgFU+cMJgR/cORWDgM9qLcgy1bi5LDbbz6o2
         J4ug7ICWomXSUR3N5qjTJiyfEsKWa1687qV9oPShM50owZOzxhWBnLT2GAaG/yNsje5H
         WBGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787923753; x=1788528553; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oJ8E3vVRgDRYUctGG9mDCTffEyrWTB3jUW17WO1h8J8=;
        b=AebBzkS4rYgR9X0FoMUC7ED91PR/a6w8iYrOPvObedeWI175HXoPgOqboqVLE1Y0E5
         KDdlPvcjJKXxvEUQaS8euJ84sma7IcMtf499nGg03KOYlvEIjtXT3LjNPao9Ee+6YsJY
         Qt5yua2s7yoo7nv+FoMmbR/wYyZsU0phJQJM+yHa8EVcLSfm7ZWSGCkZZJcsNFrtEHbl
         C846aU4VDIK5VsIxQUxVebZqyYOjJwTCPu9IG4fvEj8HLobleNBTF/tAR2XbYAEysW2y
         vKDElRGgqAHVHjH5NOLOlpOVGBXPD4+EKvqLFA9en0fEoH9CaP1YkdyT5OUxhWYOD7Lv
         zR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787923753; x=1788528553;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oJ8E3vVRgDRYUctGG9mDCTffEyrWTB3jUW17WO1h8J8=;
        b=OlygxnTHbH3cQDiTBEPqCCtOYCxRbHRLR4gu/1ACJJhl+584UEW1tRbkI5KaG2ccAu
         ul03Tu+TURiM/yoGIN1mD5paH07es+sOJL2okw7qWsVsIrVkSd59LHFBFlHioBOKCUqL
         xuHROhLyhE7VjHbA2tgMhTl6mkxOp5lKgigojkFjtpdxu2mkt8TntVtu3L6byIsU+1Ed
         zx9octMQ6KUlvTtLfZJxiwuwK1AFpvWLF7k7N4HWaX50ukvgHaau15Wy2jTkvR//w5rq
         N8OAra1K5EuQkpZKWWOxuW/DiJAZVO55OLH415Gs3m38eupgqVIsIbsFfxyacOWdo6es
         2zog==
X-Forwarded-Encrypted: i=1; AHgh+Roy65JPhLUN8WxTR4wAc7zEYSL08MqQe7tIALurTy3XugRNJQMHZFQYg4zx2k0JAGbwY/pv5ngE4A8umco=@vger.kernel.org
X-Gm-Message-State: AFuF++myxImi5+4u06lemOHau5meTTelU4zL9KTXwBlRSkUsu2vo6yp7
	Q4AG5tzOqJVUdRcTs5uuMLhQmi+3CfWpUCNh1nbzvxd83NZwgCH+etiMYuUYrDtbxQHPpHUJFY8
	tjn89IBtw68Pe+CEAHBN4Thh30FOx1m8=
X-Gm-Gg: AR+sD13OhB9bRIGcs9sJMkGxU4IpQ1TNKDEa/SgFfRa6vIGioG8P1TCkVpz+COlULSw
	x4rE3gREC+e/2KNOWb713PE4MR+E8kkKhq5GW0zwlwuw0ju1uvmICcqC2pYfuUTEWXcvvl6EtIo
	3outninALMJhgo7fT2Mt575j7F4GuXXLDmjijYO2Duh1Ipi52J3+GE2GDVCaJmASl6b51urI15b
	GYx9U+C9Vuq+Xn/iAgx2qct2mKIqQ2Kt7Yo9npETgtElknTk+KD68VYS4Kh+wrQTFW7BETchZJf
	UA+Ko1jE2HFE9YXBRp78Jqoe6Yjof/Fz3NYzz9rUumtaygqp7nr2Gx+6ouRJ0whAoVCwXWPV0H9
	jlz0A3s7J5MROPhxhH/5RYY+Z0LM=
X-Received: by 2002:a05:6512:2350:b0:5b5:e0e9:78c7 with SMTP id
 2adb3069b0e04-5b5e6b2d23amr860942e87.3.1787923752502; Fri, 28 Aug 2026
 06:29:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803163323.74414-1-chenyou910331@gmail.com> <aokFbP7wArV58T9E@inochi.infowork>
In-Reply-To: <aokFbP7wArV58T9E@inochi.infowork>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 28 Aug 2026 21:29:00 +0800
X-Gm-Features: AcwNN1Vyq3bOlIovVS7iwVPmCuDz9-szJAlLvnMYLT0vFzTw2H-zmqYHijMwS14
Message-ID: <CAKspUhJ-xxkptgSJMQUCNv4ADBJrSLOW4CzpKm8OoVy1ukT9qw@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Enable ethernet for Milk-V Duo 256M
To: Inochi Amaoto <inochiama@gmail.com>
Cc: chen.wang@linux.dev, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 22, 2026 at 10:15:XX +0800, Inochi Amaoto wrote:
> This is not acceptable, I agree with something like DT overlay for
> support external IO board to enable this. But you should not enable
> this by default. As other may want to use this as GPIO.

You are right, and I should have caught this myself -- the signals only
go to the RJ45 on the optional IO board, so enabling them in the board
DTS takes the pins away from anyone who wants them as GPIO. Thanks for
stopping it.

I will rework this as a DT overlay for v2: the board DTS keeps the GMAC
and MDIO mux disabled, and a separate .dtso enables them for the USB &
Ethernet IO board [1].

One thing before I send it: I do not have the IO board yet, which is why
v1 said link-up was unverified. I have ordered one, so v2 will come with
an actual link-up and iperf3 result rather than just "the PHY is
detected". I would rather send it tested than send it soon.

[1] https://milkv.io/docs/duo/io-board/usb-ethernet-iob

Chen-Yu

Inochi Amaoto <inochiama@gmail.com> =E6=96=BC 2026=E5=B9=B48=E6=9C=8822=E6=
=97=A5=E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=8810:13=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Aug 04, 2026 at 12:33:18AM +0800, Chen-Yu Yeh wrote:
> > The SG2002 has an internal ethernet PHY, but on the Milk-V Duo 256M the
> > ethernet signals are only routed to the RJ45 connector of the optional
> > IO board.
> >
> > Enable the GMAC and the MDIO multiplexer so that the interface is usabl=
e
> > when such a board is attached.
> >
> > Tested on actual Milk-V Duo 256M hardware: the GMAC probes, the MDIO
> > multiplexer selects the internal bus and the internal EPHY is detected
> > at address 1:
> >
> >   eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY]
> >
>
> > Link-up was not verified for lack of the IO board.
> >
>
> This is not acceptable, I agree with something like DT overlay for
> support external IO board to enable this. But you should not enable
> this by default. As other may want to use this as GPIO.
>
> Regards,
> Inochi
>
> > Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch=
/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> > index a2797c0bd767..1462a96a1c12 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> > +++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> > @@ -49,6 +49,14 @@ coprocessor_rtos: region@8fe00000 {
> >       };
> >  };
> >
> > +&gmac0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&mdio {
> > +     status =3D "okay";
> > +};
> > +
> >  &osc {
> >       clock-frequency =3D <25000000>;
> >  };
> >
> > base-commit: 11881041b745b444e4f6c87a2748f1951cf02742
> > --
> > 2.43.0
> >
