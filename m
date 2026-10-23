Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792783911;
	b=dn7HYm/I63i65SepjWQcplePpd7mJZOWznr238uT+WdO79VNK8iOydFwhkZZ4+G0ZZ6E
	 TpyhBrJzD+SeCtSjtMCzU0vkSKZFnoncRTmZVX0wOlk4Id7jXrHFUCi7AN99TSjh7OUfz
	 11oG6Sn9RtaL6OVtTn/lzxxJmSTFPL1E58gy+IeHPC/JbcHApvcy4tsj6JZYeeMAhsKNc
	 vc8ww+KjpEzpEnPJZbS3sEGCugT4oX9bSzdzGDaK9VI4ktdxar3bYulwrT8UIxJ88GeaY
	 zp+Hrl7trJPipgtowtg+rg6C90Kc3lysWTnTOocWUXh9fWHvicNktGqVmsTMXqNl+Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792783911;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=eildQREft99H7v88HxbeXxFVawAYtvAnxQSW518LNL0=;
	b=N03CrXMSH7GZBn5cy4mt82TOaJF4H12xJY9q3KDV15G2xB4/FY4wYtPCnjqWm3U1dmiP
	 I6y0dzWNafo7ZT6R9JFwQ3yFJB0mbt9Z5LMtNDdH7/0P2y/UNWfSoN0v6YtKCJ7tQ+2du
	 nNyBc5mZ1bM7CDQupAjjcEKNCw4J73p5FCbO7PKvlI3Kz64MQcQ1W0BOP9c3LPuaPp2PJ
	 fml+aPfNGIXXwHO1ptgstBaF2EnCvM80Dxj0+pKJJH/yMIx7TvWk6rPz1CtjGqWpQRRam
	 tfHB93d7jwyLPV4BYO4n70zEQfdjyARRRHujXkyufafMfR/lUMlXS7AxTPqRxHH09yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GAYSLIdx;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=p+35AeLl;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7E4606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD7E4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GAYSLIdx;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=p+35AeLl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792783909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eildQREft99H7v88HxbeXxFVawAYtvAnxQSW518LNL0=;
	b=GAYSLIdxoGvHpj373NZwI1t07H8cNAYhcRIBSiFq8VAZcb18BXx2WwIbElFaSV/uRLqBxx
	d7o/VuC8o9UR6IzUDl4Qypxp/tv5TdUxZH6D/Uz5ltDIgT8xOmK0lWdM7PvbrNUNRoP4eA
	oD48u80EWGR9veIx/xrkay5w8ajPBsY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-0joiRUZbNe-bWW-e2nZUUw-1; Fri, 23 Oct 2026 15:31:48 -0400
X-MC-Unique: 0joiRUZbNe-bWW-e2nZUUw-1
X-Mimecast-MFC-AGG-ID: 0joiRUZbNe-bWW-e2nZUUw_1792783908
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91bb074ed1aso4025126d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792783908; x=1793388708; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eildQREft99H7v88HxbeXxFVawAYtvAnxQSW518LNL0=;
        b=p+35AeLlgNAqNi9x+18F0tAyNAmiiGttF9rnI2Y3NVonjF+xfMwhAzFyDOpqgZzJNi
         FcuoWP4kTW7QYRoIOEpsJWWAuOYebvgsn8C4SJx+/fkC643+rMnRenTcILyQtq0ocDaE
         JO85iY+NVdQ7cYT0CnnmXvedS9/pOvZM10LZg+dfEoBj9SMSI9tE8Cv4IixdumPm/xE5
         yVyDzY/R5dYq2Bp5+wtf5QJXA6E9DtAHg8K9OLqDEy3Si7tIMpaAoWDr8RGuSNDC+wxx
         HuQdJMGstemtgNy7j/9ljWYU3WewYnIimqElDJ6fI0cxm9dvGsI53kt5Xe7/NXP/qF3M
         IOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792783908; x=1793388708;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eildQREft99H7v88HxbeXxFVawAYtvAnxQSW518LNL0=;
        b=PhKEnedYJGS3VWJYrogprJinr4sUUhFmnKIUbncXELDWYNzF285KIflrZ1fpDElYBW
         /L1yBp23CCB61P/hSmBRFogR2z55lI77myXv0NWLE0V0EqeoCqGYeLtusE0lfwhbKxGP
         yRLwbKsfuPaW4fSdYG9A9vHpKt5ziY9akvplSWN+ysokfqjgKMdOQC2w3p1ffFzD5BfV
         0ebHpFttbXo+LQO4pgT9A5K5I0NzQppmZ2Ye7TH2njw0VGg6ZigI/WAFiTRM4YWaPg03
         bB3xch/0tYkJrs5bt7coJJklPhV8oBS2p6qKxi0D7KCIb24g0VUVfg1/RnN8XeQaSXpA
         UxDw==
X-Gm-Message-State: AFq9FYJURayHEwOXFe+3PmhFV5e5LPDEOjdYMdjZth3lhQT2vaZSGLnQ
	DujlvCIsxZUjxQkgCIEbVA9L4RkCtYRa/IdbFvqTqahaRBt0vPmQganrz8vvN38XWfTaOhNMA4I
	tZdW7h7pT3qi0Jor2BnJAOKZYcb8FlFZEJWk8fLZdJP91YqxHT/qNZHU5sj95p5m57ozHIWFOq0
	6ZyxtJeNMq33Dkn9dqysVbAGfZLLBXoeTYuiEqkAo3wvfKUA==
X-Gm-Gg: AYBFou2FPmfpgHSSuqCZQctabEaP0iZCZMarp3CZeL6HL/3h2ArJw4Xe+sIPito+qud
	v/R5EsDyT+TIWpr1OxeDtKDntPV0RuKfNoW1VAsxRJZkptfjtpeqGkXY2r4LiZ87IlGMy+dF2SX
	LqSjXqhXU+gkHxvbjCUNWE28/wK6jwFRp0tl9ow/pBIVGtpgzW+S/yBfUvQLT2amqIu5hdhcMwl
	kteDb0LZh/7GjGNd28RsPx8cVkuWmnm58rH3KaET4+xuIc9bsyTQpHgG2EM3zQkAoQAjpZQrx7O
	UU6TnupmmzD7nwcgu6uIusxkygXjU0rtKT+a6XVm9Efo5+35d336y2kRoKt9CKWnYqBw5dY=
X-Received: by 2002:a05:620a:2909:b0:93c:3d7e:6e90 with SMTP id af79cd13be357-940ef8d90admr5920785a.32.1792783907574;
        Fri, 23 Oct 2026 12:31:47 -0700 (PDT)
X-Received: by 2002:a05:620a:2909:b0:93c:3d7e:6e90 with SMTP id af79cd13be357-940ef8d90admr5914485a.32.1792783906961;
        Fri, 23 Oct 2026 12:31:46 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94047b12ed6sm95633485a.25.2026.10.23.12.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:31:46 -0700 (PDT)
Message-ID: <8b131d2c06adfaf9ce1d6e8cf6c09c749d0e4d1c.camel@redhat.com>
Subject: Re: [PATCH v2] usb: core: Add quirk for Gigabyte Aorus Waterforce X
 II AIO coolers
From: lyude@redhat.com
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc: A1RM4X <dev@a1rm4x.com>, Alan Stern <stern@rowland.harvard.edu>, 
 Christoffer Sandberg	 <cs@tuxedo.de>, Kees Cook <kees@kernel.org>, Rodrigo
 Lugathe da =?ISO-8859-1?Q?Concei=E7=E3o?= Alves	 <lugathe2@gmail.com>, Jie
 Deng <dengjie03@kylinos.cn>, Werner Sembach	 <wse@tuxedocomputers.com>,
 "Stephen J. Fuhry" <fuhrysteve@gmail.com>, Nikhil Solanke
 <nikhilsolanke5@gmail.com>, Vyacheslav Vahnenko <vahnenko2003@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 23 Oct 2026 15:31:45 -0400
In-Reply-To: <20260824195419.234898-1-lyude@redhat.com>
References: <20260824195419.234898-1-lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Friendly poke

On Mon, 2026-08-24 at 15:53 -0400, Lyude Paul wrote:
> The "Aorus Waterforce" is one of those fancy gaming water coolers that
> comes with fun LEDs and an entire dedicated LCD screen. A minor issue I'v=
e
> noticed with this cooler on Linux, is that we fail to actually
> reset the device when coming out of standby, ish:
>=20
> =C2=A0 [=C2=A0 281.652184] usb 7-10.4: reset high-speed USB device number=
 7 using xhci_hcd
> =C2=A0 [=C2=A0 287.179843] usb 7-10.4: PM: dpm_run_callback(): usb_dev_re=
sume returns -5
> =C2=A0 [=C2=A0 287.179854] usb 7-10.4: PM: failed to resume async: error =
-5
>=20
> Generally this isn't fatal, as even when the water cooler doesn't resume =
it
> will still reconnect itself moments later:
>=20
> =C2=A0 15:48:12 GoldenWind kernel: usb 7-10.4: USB disconnect, device num=
ber 14
> =C2=A0 15:48:12 GoldenWind kernel: usb 7-10.4: new high-speed USB device =
number
> =C2=A0=C2=A0=C2=A0=C2=A0 15 using xhci_hcd
> =C2=A0 15:48:14 GoldenWind kernel: usb 7-10.4: New USB device found,
> =C2=A0=C2=A0=C2=A0=C2=A0 idVendor=3D0414, idProduct=3D7a5e, bcdDevice=3D =
2.00
> =C2=A0 15:48:14 GoldenWind kernel: usb 7-10.4: New USB device strings: Mf=
r=3D1,
> =C2=A0=C2=A0=C2=A0=C2=A0 Product=3D2, SerialNumber=3D0
> =C2=A0 15:48:14 GoldenWind kernel: usb 7-10.4: Product: Castor3
> =C2=A0 15:48:14 GoldenWind kernel: usb 7-10.4: Manufacturer: ITE Tech.
> =C2=A0 15:48:14 GoldenWind kernel: hid-generic 0003:0414:7A5E.000D:
> =C2=A0=C2=A0=C2=A0=C2=A0 hiddev98,hidraw2: USB HID v1.01 Device [ITE Tech=
. Castor3] on
> =C2=A0=C2=A0=C2=A0=C2=A0 usb-0000:74:00.0-10.4/input0
>=20
> My guess here is that the device simply doesn't support resets properly -
> since that seems to be the only quirk I've found that actually works. Not=
e
> that the device still ends up disconnecting and reconnecting after resume=
,
> but this seems to be normal behavior.
>=20
> So, let's fix this by adding the USB_QUIRK_RESET quirk for this USB devic=
e.
> This seems to work perfectly fine and prevents us from getting the
> aforementioned errors on resume.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
> Totally forgot about this patch until now :).
>=20
> Previous version:
> 	https://lore.kernel.org/all/20260203221452.198682-2-lyude@redhat.com/
>=20
> V2:
> * Don't forget to sort quirk by vendor ID
>=20
> =C2=A0drivers/usb/core/quirks.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index b5b577f0b931c..6c4a52a693c05 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -217,6 +217,9 @@ static const struct usb_device_id usb_quirk_list[] =
=3D {
> =C2=A0	{ USB_DEVICE(0x03f0, 0xa31d), .driver_info =3D
> =C2=A0			USB_QUIRK_DISCONNECT_SUSPEND },
> =C2=A0
> +	/* Gigabyte ITE Tech. Castor3 (Aorus Waterforce X II AIO coolers) */
> +	{ USB_DEVICE(0x0414, 0x7a5e), .driver_info =3D USB_QUIRK_RESET },
> +
> =C2=A0	/* Creative SB Audigy 2 NX */
> =C2=A0	{ USB_DEVICE(0x041e, 0x3020), .driver_info =3D USB_QUIRK_RESET_RES=
UME },
> =C2=A0
>=20
> base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91

