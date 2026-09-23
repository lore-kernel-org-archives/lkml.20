Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFC051DDF9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170931; cv=pass; b=EyNmqGmTvWS2NSPaZ4ROmMRVokJ1rba4j+INttXGuqoXIQStFINFfpd+AEL/gaHN4rr3Eg5z85Gz4PjUDPMwc4DKhGSdtSGI7vBIDnXCBQHahgGMeSOcmuJD9OajQCCLeqJu3Z2Oh1VSOwIxRdt6hHe0nVTnrUmrCJlSNyj44UU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170931; c=relaxed/simple;
	bh=xv9ucU4YRdbUBDfAYkIA3JSvD5XSlmVKrP6os4daOsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8ohVTVqjlsMX27lKP9cDN0mbvmG28kAFOVuB/j+v7NFLOidhfc2umoZAv4TcOAmuJ4+jc4CFd0gelyZ0Nx6sA6ZT6bCSg6IQhW72O/bsX9e+LoZ4Et1aathMka5fzbbe+yNFERQs9KOtDf9L0IE2u9T8oL+Mbf4wFNqKvAVPHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rwyQbJq+; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwyQbJq+"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-895353e9051so12107007b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:42:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790170928; cv=none;
        d=google.com; s=arc-20260327;
        b=ppM7tKjHS2Je7NrhelvuyLzm8cVJjI7mBgXmEO922k9B0M1lSFSW+RXjW6LcBZIGLa
         tLNbR98aENFhnVihJZk/HJimFX4hHs63xHcFP+naHPaLv8M06q8Ho+XD48Gy39rg4IAN
         MEDKM9CLjHPGsMOcR0kp2eUtL/T0q21O4rzrgh8Thbb3AHKZUz01nxZbAWuESOqHFVqm
         E6J4eZcdJGAKCB6+0FurlWbQ1BeTg+xnh1Bq7bQFP0PQlwX6ykGb/z1yzr6IQrdAI6HE
         4bV6Sdr6ZgM7mUqAwSdSNfHl1/9vuxfeQboESD9ncNjcmEXlD9zYW9Jy7qUkCfdR5EsV
         3n4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gUppNMSnE+FI5UWVFsCQivlVTUZFB5M60mvANc0iVpM=;
        fh=3RUwiZc5cuQpvnTpZoyu2p9jd+Roc0PPl3GuwdD1/dI=;
        b=E5pdIGhA3N+KmQwjWL0NmnZFKk5x5L9yJhzKf2ldkj8ChFDZ48a0lFmEMGGuNHoSjk
         Tcv6KKSI8yAQnuauyylpMdpk8jweaOPEwy7p+GjeEuLrp2XfzTzJMN6QGsyeAR9uulmD
         cIBFUiUMqvkYlJDlWsNBC+CtI/eFnndXWPvM0yFUIja3WL6ii1g/lDQrEejsu5/KkQ0P
         bCLepD3eoGZWTixaowP4sEvjl1Sddk+1Sb0JKmBZR/x/hqr3sju+FXaZhLJ3R5wNO3AT
         6e8Zzp9EOxCsC/CSoeGKqHHPmE8fYEEUQM9dL9aUXmhNsTO9ro5M0nrddGwH3WaoWlox
         RvVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790170928; x=1790775728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gUppNMSnE+FI5UWVFsCQivlVTUZFB5M60mvANc0iVpM=;
        b=rwyQbJq+l0tkyofv5rlLPNrnOjNUjjW667r206Et/FFqa13865pNrxufVuK/OV02YS
         UeheoNa/oa+arMeXvNcHskBqBjAOfemc/QY3d5qSuB/aatD1DMJLF/hAuWO7fjbHJfOp
         hrcdB5LPvI4zAoaQWhN9hzrEBB1F08a7jJPhPpPdDmpZq4FaoAtfA2MROe5uMfahBYSq
         sncW89ys5jVHhOB2FaIdRJZDqvtKzFzin51Nx7Qo+qox8UxhcstSebk9PXROzVKm/N6y
         dkiOYNEEAY5rgc2hB/v/poU944iM1ADHgMAJWkfs/sbx04AifNuwLB4SGPYUKdjFQ3D8
         IgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790170928; x=1790775728;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gUppNMSnE+FI5UWVFsCQivlVTUZFB5M60mvANc0iVpM=;
        b=iIOlrWh6iWuuLkPjCPcEk5hdK+Y7R/aMdv5A2vxC4NwCRRGKzMeosVrTwzhwbpTjaw
         +nBQ5CuYNH1xwySscFyMtyBF1ItuVIsvfhrj34L+zczdCG3Ubn57Few4n5R/ezNvuiUA
         M1/UoGyHe9nSFqHHbjOGIPC2wZX+XotbITIBKOH2MdEVfGY3UXRgX6Tu7mpAqljMnSOV
         ScmKHUqV/Kdc8tdMkXTqSdi3WT3cw3ASh6hLUiA8dOkGXKxrJQz1BflQOEe8rfwty3BH
         ctU3T97DoRlnbuKJZ5HweWAPR4tm6KdOpUYeOz57jyylRvgFGsOI2t7T9vNkUMsE6avO
         uCxg==
X-Forwarded-Encrypted: i=1; AKwUvBxJmFr0IlO4jT5edhDdMHrWG3ZgfWmmxtJ9Fhb+dcSRsXMagzWw6Og9DGAjCyLvQB3kdx6eeNU85iQjytM=@vger.kernel.org
X-Gm-Message-State: AFuF++nlAW9tqYDXv+RyMEXlOqmBfL5kyK82wgfG4a+rn/V/Ha6vOpPr
	QLomBY8YTHrfK4ZJOLl9oXdzbKFbDSrkdA/tdKOX86/pUwQ2cxBMTZWW5cavimHIHzNHeFqg95P
	nnAwhoIMnGGMbY3m2No+qdagks9OZH4o=
X-Gm-Gg: AYBFou1N3Ca3tvNRNRqyUFzMO1m8Ht4n2A4xwhAz2j6lGOe7e5Zpvm4cS9lKkHeVMlQ
	hNc+Msqucnkt4ZqFiqfZauWAqR4B6KRhOs7wWDvq4uQQx9vUHp548eRPEPpgzcXfTr9zzyNQ1Wj
	XpIHcp0nIoFDmO5pwnLSmsc0ZG0XRib8dadkXNnWL6SNps25/QWHP1kPuniy83gkZWrCvbhYg+S
	09e9b6+HlJDld6v1JyUWh09jrXZw9p11SiGB39JgTmWdb3zXRtMLVkt3yE2+wFg7GhdBLyAsKNL
	WhTz1NXPJh0B9cyoCuXwdN2+M7fBJHhAsrcNlvYVdqIEodXsZ0jh7m3HqRYL71CqCNBdPmpdUh1
	v2clr2UsSNQ93txgP8k6+tMk7rLbVt4v0Ynr8gl44NH4=
X-Received: by 2002:a05:690c:c3e4:b0:872:1e2e:b496 with SMTP id
 00721157ae682-8a45b0a1042mr11972247b3.31.1790170928179; Wed, 23 Sep 2026
 06:42:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907173000.1254045-1-nithibert@gmail.com> <2026092308-stinger-number-5fe7@gregkh>
In-Reply-To: <2026092308-stinger-number-5fe7@gregkh>
From: Nicolas Thibert <nithibert@gmail.com>
Date: Wed, 23 Sep 2026 15:41:55 +0200
X-Gm-Features: AcwNN1WBTtTV6R4K2fgHwGlqy86R2x4Y5knHaNxQ49lSd0hs6xEZ-pIfBOpA5nM
Message-ID: <CAKA8V_8vpizeoH+FNY+tK2c6=mdPGV_1VBN9C3d_+Gibe_dS0Q@mail.gmail.com>
Subject: Re: [PATCH] serial: 8250_of: set UART_CAP_NOTEMT for rts-gpios RS485 direction
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jirislaby@kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Comment was just to understand the modification done. I think the
double submission is because I first try in standard mail but then
with git-email
I tested it on my QCA4531 (QCA953x base) board with an RS485 converter
(CA-IS2092A). The converter use a standard GPIO to drive the bus
between input and output. When declaring such device in dts, the GPIO
was not used remaining in a steady state and preventing from receiving
RS485 answers
Mod neede for such a dts :
&uart {
    pinctrl-names =3D "default";
    rts-gpios =3D <&gpio 3 GPIO_ACTIVE_HIGH>;
    linux,rs485-enabled-at-boot-time;
    status =3D "okay";
};

Regards

Nicolas

Le mer. 23 sept. 2026 =C3=A0 14:20, Greg KH <gregkh@linuxfoundation.org> a =
=C3=A9crit :
>
> On Mon, Sep 07, 2026 at 07:30:00PM +0200, Nicolas Thibert wrote:
> > __stop_tx() (8250_port.c) only calls the RS485 rs485_stop_tx() hook
> > (which de-asserts the direction GPIO/RTS line) once it has observed
> > both UART_LSR_THRE and UART_LSR_TEMT for the last byte. If TEMT is
> > never seen and the driver hasn't set UART_CAP_NOTEMT, the function
> > returns without scheduling any retry -- the direction line is left
> > asserted (driver enabled) forever, with nothing to un-stick it short
> > of another kernel-visible LSR event.
> >
> > of_platform_serial_setup()/of_platform_serial_probe() unconditionally
> > wire up the generic em485 GPIO-RTS RS485 support
> > (rs485_config/rs485_start_tx/rs485_stop_tx) for every port they
> > register, but never set UART_CAP_NOTEMT, so any board using this
> > driver whose 16550-compatible core doesn't reliably surface TEMT for
> > its shift register hits the stuck-direction-GPIO case above.
> >
> > Confirmed live on an ath79 QCA9531 board (SoC-internal ns16550a-
> > compatible UART, RS485 transceiver DE/RE tied together on a GPIO via
> > rts-gpios, linux,rs485-enabled-at-boot-time): the direction GPIO
> > correctly asserts for the duration of a transmit, but never
> > de-asserts afterwards -- confirmed by sampling the GPIO's debugfs
> > state through and after a multi-hundred-byte write, on both the first
> > transmit and repeated back-to-back transmits. Setting
> > UART_CAP_NOTEMT, which makes __stop_tx() fall back to a frame-time-
> > based timer instead of waiting indefinitely on TEMT, makes the
> > direction GPIO reliably return low right after each transmit
> > completes.
> >
> > Scope the fix to ports that declare a GPIO-controlled direction line
> > (rts-gpios), rather than setting it unconditionally for every port
> > this driver registers: this is the class of hardware actually
> > affected (RTS state has to be explicitly un-stuck by software, unlike
> > a UART's native RTS pin), and it avoids adding the extra frame-time
> > margin to ports relying on the native RTS pin, which this has not
> > been observed to need.
> >
> > Set it in of_platform_serial_probe(), after the existing
> > "if (port8250.port.fifosize) port8250.capabilities =3D UART_CAP_FIFO;"
> > assignment, rather than in of_platform_serial_setup(): that later
> > plain assignment (not "|=3D") unconditionally overwrites
> > port8250.capabilities on any port whose "fifo-size" DT property is
> > set, silently discarding a capability bit set earlier in setup(). Not
> > observed on the reporter's own board (it has no "fifo-size" property,
> > so port.fifosize stays 0 and that assignment is skipped), but a real
> > regression waiting to happen on any other of_platform_serial user
> > that does set "fifo-size" -- which is a common, documented property
> > for this binding.
>
> Please rewrite this to be in english and says things properly.
>
> >
> > Signed-off-by: Nicolas Thibert <nithibert@gmail.com>
> > Assisted-by: LLM (Claude Sonnet 5, Anthropic)
>
> signed-off-by goes last.
>
> > ---
> >  drivers/tty/serial/8250/8250_of.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > --- a/drivers/tty/serial/8250/8250_of.c
> > +++ b/drivers/tty/serial/8250/8250_of.c
> > @@ -233,6 +233,24 @@ static int of_platform_serial_probe(struct platfor=
m_device *ofdev)
> >                       &port8250.overrun_backoff_time_ms) !=3D 0)
> >               port8250.overrun_backoff_time_ms =3D 0;
> >
> > +     /*
> > +      * This generic driver never enables a dedicated line-status
> > +      * interrupt on TEMT, so for ports whose RS485 direction is
> > +      * controlled via a GPIO (rts-gpios) rather than the native RTS
> > +      * pin, __stop_tx() (8250_port.c) can see THRE without TEMT on th=
e
> > +      * last byte and bail out without ever retrying -- leaving the
> > +      * direction GPIO stuck asserted after the last byte sent, on
> > +      * hardware whose shift register doesn't reliably surface TEMT.
> > +      * UART_CAP_NOTEMT makes it fall back to a frame-time-based timer
> > +      * instead of waiting on that interrupt. Scoped to rts-gpios user=
s
> > +      * only, to avoid changing timing for ports relying on the native
> > +      * RTS pin, which this has not been observed to affect. Set here,
> > +      * after the fifosize-based capabilities assignment above, so it
> > +      * isn't clobbered by it.
> > +      */
>
> Is this comment really needed?
>
>
> > +     if (of_property_present(ofdev->dev.of_node, "rts-gpios"))
>
> What will change from this now on existing systems?
>
> How was this tested?
>
> And why was this sent twice?
>
> thanks,
>
> greg k-h
