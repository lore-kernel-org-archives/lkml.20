Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792768381;
	b=F8AhO+PMwz6Q5Zy9Wez0wLA7pZ4GOwofcLHHo0lESZ0rH6fORlmj4LytGoIiDTL1jLH5
	 9siMMep0qh30AAl++QRofrwMYaqJ86aM6dmhrVtHWt8YcYozE2BX4mQLod/2j3w0LVZOs
	 DCyMvEge4amiCKVvRiPWMG0PkvmSgf9Tm7BwwFr9jXkyh3cnCCIrNDopOvRinfSCNGUce
	 /Ik75cgoDF4Dy/BZIos8qPZzkp/nLIU4c/Kzi1rtoe6NIj8tI1PnXC8T8PRMfuY8RD3ZI
	 RLL6pmemdZVrUbiOrTNVTbTjjERKMLuL9JQC0aFQ2tutYomd/K8mv9iOWc4bj0XTKHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qg7iB6bscMTGZD77CGgbdOimAao7FC1LowqN4FOrg2M=;
	b=eyatZylOn2jZBMP0NUnBUukF72EXru5u/ypWSmwu7gjTMJEH305OqvfmYcUDUfo9rvMv
	 xibyPusbzx6g5ApYEjPxea0Z5/WfbCmMSGLJOyx+flIGq2M2wMuDYA4T27pvLjzUBMbz7
	 yOxK0KSQxHTviRpfqb/93yy+svuRaHssERdUuh//aLTDN8K/u9XBrCz1GYPcv4YA2iRHR
	 R/SnMNWu5rRuvGFm1k7qEBaq7B60FWG5ANBSclFNzthv+t+L2KXGlA7XS6PMn6FpeK5ib
	 EM2fW9Fxe9rMWuoesJpSIDIqfwJLG3Hj26wzBYT3ffE9YjTJfSyeNqmEZrbW8B+d0lQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EWGG0AQy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE74606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDE74606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EWGG0AQy
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c34bff61551so138978366b.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792768374; cv=none;
        d=google.com; s=arc-20260327;
        b=GI814vxj00tSOtsJXUd8he/jgTZq4cX/KqAHvMeoASqwSq8RmwyxAnidOfqOhix4Ez
         FyA+Mmq5btNV9ivIvJW8GEx6T8XXFlcp0eAs+iSta80ZKTnj6V+jg/mzJU7rhz09N/yv
         X9Z3VKtyO11WdFbW/BztZaaBREBdJpTkbuVYlvRZTS5WRSnL2RvXleHqTJtcPJ4Jz4nN
         F4FTONJhT1jqafLl3WGovu0WXpUIMTnCssfTQopIegISxlwz/xMqWwnbQsicqdkaN7wr
         9EjldkOhgH/sTeHez6GUVvZRerhEvkGyDT/MJRt57d5y+PaaZIpvbfQQT8B7ZYI/5/Oe
         IBIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qg7iB6bscMTGZD77CGgbdOimAao7FC1LowqN4FOrg2M=;
        fh=9WqqNt/yNjrSO//kSFIM9qZDOChCZ/RacSYP7qCb2NA=;
        b=g6y7QdRHM/vgEucuyucEqLrl887pdfrPgUbya0eHHA3xfGCXAKB8RStZnxvxCMdc2X
         HWJ7k/y51OlRc7W52I8i3CNWoG3wBCioUOE0PbxccGp4Yt+sjA+rDWkEbeKNbMgSTVcq
         DRxxeNzYXdDj1dkIQWswoKeG/ocHHSZ4wBnHsVNP8Evc6ftlIUZyNrwRuuJphLS1ClNe
         YzIG+qGyGwM7QVsvyjOhKrUfs1mpLOclhwL7DA0d5m6zxkalMB4oKyMo18i2HLts9JRU
         wMoVC5r81GQ2pHYY4PzTTaUewW0VB4Feo/L6IlDU0X60TYKiJBe79gNLLZW0XzT/JakX
         c3uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792768374; x=1793373174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qg7iB6bscMTGZD77CGgbdOimAao7FC1LowqN4FOrg2M=;
        b=EWGG0AQy2mGqncgCdvHiz4YaQrECiIJLSYoSBJ5NHSMunVaPrfVvlknF0DuKclSyUu
         qCI+SC31yn2BoepSszw36L8zEOeJf3mj1C+D4RWWBxJtXYB2LTHf6W93JTSrrS2tbVzs
         /SQReJc0ZT5f5ckNvF9/2aGpl92C17PlbkNdMVJA5oXvMmF+vXB88XDBSUj9y7ltGHUP
         BTYzibNxNnm+toKAgpaXdQcTZofbUnRLAei86WuXqw/qCERy4xLDn/4N2yb15w5YuWpR
         tTItHoUSIzfZpdy67qzB/9sXgsSl6pFGsuiTQZ/aoJmzMu5gZzNPmNFlS4+8RELQzJB4
         YcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768374; x=1793373174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qg7iB6bscMTGZD77CGgbdOimAao7FC1LowqN4FOrg2M=;
        b=1Uim8ljS49bvv12XPwARCeWafgZb34QoxLzd7crtrgsGVs82IsycUc3ymyYWNooPWU
         OYeOZiEIzsCjinc8CXsu/Acq1hMVjqBG9BdBRNYPw2IeZWFd/vJLohPXWwUIpP6XF4k+
         Je9MfIs6QvthMqqyoPjQGY7wWn0yJDeteF6+jp+i6HJWh5ta2OWEO9oPLeXIB6KB0SU6
         SLM6HytQpiYZai8R9zP6AZq4zp0uaWzhjno5BYwv1EWBNQU2whfsjj00J+hUTo54GbO9
         IcGYFU0+I/x6L4T7bPDRFf3U3LFpn5ShMnEnj5oSJm/lDp33xxZGqpJF0zif7iHab9NA
         dDXQ==
X-Forwarded-Encrypted: i=1; AKwUvByqO4dik12DE+xMwVcq+YwEniJhMai3N6uHjNtzJb2PHO6vp5RiOCU6ro0gt8IOV27HDEoMwoBUjA+u+0c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhOM5NornLQV5xHlYUz/Jsm6PT4Zd1pAaVRl93Pbr+qQYv4fnk
	AwtWXWdKmctl0NyJC9NxKDDgqeoqB/3sQdm80bDYATN7EaODNFWp17zOUwCrQDfIGzfwsGs7yEn
	P/e54yorEJLMv36448mcg7rf+4v0bglU=
X-Gm-Gg: AYBFou2OrFEXpjp8E4lzA6Oi5g/oP8QbN96bBzYfxKwp4rYciBh5y1dDhGUReQmt1G0
	xI6yMv58LjKACq3+uvvZRJoYGv7MVmpxaRFqOrCtOMc6yXs+L/w8pulSFtSWJhFjAsR9udxNM7t
	WxMWZSTzT72zOffrHyr60lOYCEEfgIsWYXJCONLLl04+bla39jl58mHb0f7zuFUPuADSJgXrph5
	Ipa9Gc8WRjRmAnodmZ0FKnQqzzgRr5tCM3G+cRy4TialiaLp58/uHsBKzsQ17n8Ej2BeBEHwh5o
	9QLs04507fvpVVRH1kL6uBMEcmIpW58fNF1gm//lEVp9rerT6CnqeUK4MI1mOGbbkG3e0JUgzFB
	ZPJAs5JgEpGOOOmHjmevnwQJq378a320N/p49Ig/z0F1ErNvgCvNUvUSR//LxgkQBU70oKEZxR1
	vqbwWlkY6wwwACqw58QmCzFjWO4v0DbG8v1h9yMaUdwXHfO9voIFaqWGVHs2Ro+YUN50THMdWde
	pk3SA/MMrjAMSUR/lDm6YKZiiLfCg==
X-Received: by 2002:a17:907:3e12:b0:c29:22cf:b0f5 with SMTP id
 a640c23a62f3a-c46a922dee5mr411130066b.33.1792768373956; Fri, 23 Oct 2026
 08:12:53 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
 <20261023-submit-h616-uart-fifo-v1-v1-2-e4a3bae2eba8@gmail.com> <atseYvQUYvpMFEIM@ashevche-desk.local>
In-Reply-To: <atseYvQUYvpMFEIM@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 09:12:40 -0600
X-Gm-Features: AclHuK8N0aoS8N5_iVP1byTsJlqPWe2cGv2Z_GYIPJWKyo5TvqjUOKI8du6YHIo
Message-ID: <CADvTj4pRW9q6VyQ=nLi8q0mMF8LgccfO4eqAeqgzzgOkDno1dw@mail.gmail.com>
Subject: Re: [PATCH 2/3] serial: 8250_dw: configure the Allwinner H616 UART
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 2:44=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Oct 23, 2026 at 01:33:50AM -0600, James Hilliard wrote:
> > H616 has 256-byte transmit and receive FIFOs, but its optional DesignWa=
re
> > component parameter register reads as zero. Generic 16550 probing leave=
s
> > the port using the 16-byte FIFO configuration and its trigger-level tab=
le.
> > DMA attachment also depends on a FIFO size being available during probe=
,
> > so these ports do not reach the existing 8250 DMA path.
> >
> > Use a fixed port configuration for the H616 compatible, with a 256-byte
> > transmit load and the documented receive thresholds of 1, 64, 128 and 2=
54
> > bytes. Select the quarter-full receive trigger by default.
> >
> > Skip optional-register probing for this fixed configuration. H616 has
> > debug-divisor and RS485 control registers at the offsets used to detect
> > DesignWare hardware RS485 and fractional-divisor support. Probing these
> > offsets writes unrelated registers and can select incompatible callback=
s.
> > Keep the BUSY-safe integer divisor hook and software RS485 handling.
> >
> > Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled dur=
ing
> > termios changes. Its clock is a gate on the shared APB2 source, rather =
than
> > an independent baud-rate generator.
> >
> > Attach DMA from the fixed configuration before registering the port. Th=
e
> > 8250 core installs its FIFO defaults during registration, after the pro=
be's
> > FIFO-size test. Configure single-byte RX and TX bursts because the
> > peripheral request can correspond to just one character. The existing
> > startup path requests the firmware-described channels and falls back to
> > PIO when they are unavailable or the port is a kernel console.
>
> ...
>
> >       /* Internal 8250 only */
> >       UART_PORT_AIROHA                =3D 124,
> >       UART_PORT_AIROHA_HS             =3D 125,
> > +     UART_PORT_DW_APB_256    =3D 126,
>
> Why? Besides the poorly chosen name, what prevents us from modifying the
> corresponding parameters at probe time by leaving the one of the existing
> types?

The new type was primarily a way to reuse the core's FIFO configuration
table, including the RX trigger mapping. H616 uses thresholds of 1, 64,
128 and 254 bytes, whereas PORT_16550A maps the same FCR bits to 1, 4, 8
and 14 bytes. Overriding only fifosize and tx_loadsz would leave
rx_trig_bytes reporting and selecting the wrong thresholds.

The core already has get_rxtrig/set_rxtrig callbacks, though. I'll rework
this to retain PORT_16550A, supply the H616 FIFO parameters during setup,
and use those callbacks for the correct trigger mapping.

>
> ...
>
> >  struct dw8250_platform_data {
> >       u8 usr_reg;
> >       u32 cpr_value;
> > +     /* Use a fixed configuration instead of probing optional register=
s. */
> > +     unsigned int type;
> > +     unsigned int dma_maxburst;
>
> This sounds like a hack.  Why do we need type here? The address of platfo=
rm
> data is enough, no?

The type member selected the new table entry and also identified the
fixed-configuration path. The matched platform-data pointer can select
the H616 setup directly, including bypassing the incompatible optional
register probes. I'll remove the type member and use that instead.

>
> >       unsigned int quirks;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
