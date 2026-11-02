Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793625135;
	b=Rv5QD19eCmRhDRkFkZ+VC6HZBvEjM4K9v9L3ohKlT+2AqDnFBIYMv4iUTp44xRs3Zk6k
	 UKB/OjbZVOJ9s+Q/BgrgXxSsyymmZPcOHPmcf9Puax3ArHnXSBFsvCrkUbMWEf2GyB20P
	 qzyummeCG4ZCSJ6ZZw60+ryTD4yaPBIYSOHrzYGVcyyxvlSfNOvshdIE1F34Ru4pJp7Ia
	 BkznWB1raWmYKsw58/eNEMY5apV9zp/4u7mQyqY3nDh4Zwlgji2rxvexJYmozWcPR/qci
	 3PxoafH6d89bATQ8DIvxjsS07Gls659BLJ/ZFBesuJ6B5NS5uJoV2zCmB0ncb4zhwEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8uTFR1xxFFaOIPhvz5LXO6GWBsqM7yzNUjcEoLyeYHk=;
	b=s0ZtfZ0Pw5bXJeWJVrr0zJsEKBZyng1iw6mIgAT/zCUtHRo4ionA9JS0pFtE9tmwQvoh
	 FbPy1k417q5bpGmxCbTTM33ZTMJg9T42aaH6TeogXVzLXIB7+Rvcn3LG+8oUouiDY+nOo
	 yvoNiG+dC6+4BfFY4mj9elHEx2eStamCsd4Aa1BvJGyDqbevrhxfArJpX9UZ0I9lmo0zs
	 4NJX1XKYbE+3LHwZAC9MDSOVlDcIBvYcN9/v9GvXNNV695pSt4iCvLx6HoRJ3EmT49GuF
	 pnSGP0iSJuIeHSLs5hzxHJs6kAnV9U7HQvWQ879kwxvdWi8DYDWqUDywBcNUXeifbIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=rQzJ9g5c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7170A606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7170A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=rQzJ9g5c
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso4074577a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:12:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793625134; cv=none;
        d=google.com; s=arc-20260327;
        b=nVCxMwEGYQ0Tfyo91A/r8TcCk+daHZ0bf6CX02+7D9XvCwiO3eSb8sSJGUNqBAGNIp
         XGwvIElM+1CwgfQhLMyfo7bxZgWTTGu2wxkOk5BclvxnprhGXgUGWuUSLBGxTAwWidUP
         Svr9WIkVIAzVgAxBoeoG2fG1GI63dH+VQnA5Wxi+VatBLiNyGWSamf++Vi8hcXqKCsyj
         UGn/E7XeweNvQatAanRkP4NbnBq8c3fyQmhesBWTSuRvBUuuUbmk962QTHf5vx6s7wIF
         E97hM7tZ/hW2raRKiDtwx9nBvGNFYQL9FdMgoGvKIlkwbOaOkS87HmHzRAhBgwAuv4Hk
         jh9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8uTFR1xxFFaOIPhvz5LXO6GWBsqM7yzNUjcEoLyeYHk=;
        fh=rbNhmA9SoG0YxaVdoZThEXNI/EsMih/gLX0PtO35YQc=;
        b=S85fcyVKlzv9y9AypMk8sWFU2IaG6QksSkSKvgKXPZY9SDLlfLT4EulLOsrg++Z4SC
         5OocOvyxnvneOINNmZR8pND9ij4ClR9Vktzy2jGBho4ddcBYSbimqlNVDfMEtg+JvNvv
         ArmBdJaxs/MZULOgO8FdVWreIOUWADKHdxfS/aC5z0qvDjYqAvrFSOCsNC2SsUdbLdwc
         Bmuxi2hJDEecnkpAF4VB6jDWCnFW4DJ+EZpRKvz45OSbTTNzKP3jx+9QS4/SxAQ1aqAT
         +tqec/50dzbDtaNmzsQFLxhl+sbGyIIszDpTaaMBqZTn8Uiic8/VQZrqskzAATAAhCyw
         Gx8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793625134; x=1794229934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8uTFR1xxFFaOIPhvz5LXO6GWBsqM7yzNUjcEoLyeYHk=;
        b=rQzJ9g5cgBdpF+KQPJnjKlGwYc/+33GKdSr+8mxsKAVIBmCacr2B1Z2FRjHYAD2q5I
         snSe0dGxq1y8zkQ9z4XS2IwbINAVwnWLJqpzpShs48VdjIAyXs5kh8QkGrBsAeA/GNGs
         WEJDe2BUgid4fYP4N9llZO6lTXPtfM6DZ3Xacjf2ANm5O5bME/gcrYih8bI8Fyh0VP16
         9OSq4p4KkgnQkSJXF033LUtKSGjaiUHiNWKm8NmfnaiWYW+qpFkM59qRbqqr6ec34nUt
         irpCD5/BOa9L7Muvqn8fesaRDeTMe/EkvhciDZ8NQzOOf7YbG4mCC+xr5W0yxOBj/jut
         z2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625134; x=1794229934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8uTFR1xxFFaOIPhvz5LXO6GWBsqM7yzNUjcEoLyeYHk=;
        b=p0R6rTykDYEmz5hTe3BI9j6cqHSzRLah0Llg6RayetDjFP4cvJefoznm7Rkdc0NOAp
         bkmmTc4yYqAtCJhRGOEEa+JovHZyStpLVdwKP8kESi69JaC/yqyYvOiC5xyWc3opd9fV
         1u0aKSuYDs/Y6bd0Dp3bHC0sVzk9Ah1qZhMMiifPSCiwZFlm9DPchKR6DQsEZwLBJYRQ
         BjvLCGSXVvmTJsrBOYxKhbFxiJRfzdVLeLBdyf8DCLPX+q4TNe37tpPPmxCzGpd22si/
         sHeMBf6fZKEraA3VKkO85o6NEUHOXINZvjcj9aC5vEeTX7EVGwcAcY6Zvo3SEh03KnQY
         0D/A==
X-Forwarded-Encrypted: i=1; AKwUvBzZIPrV23mMCyfOBrTb63f7fLWB9jJzJr3jUBfMBCEe4QSHzNkS4sIYLYG+fu1GIaOhpcGU1ey6byeAk8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hR8qUl7LEYQZDnTcqfmsk+S0N2ykd1HrEDIz+YxIkZl4ehuMF
	p3bGi0mPFYrnfb/+YjxW0XzlEOT5Va+fs4iSTDDqT6MWpRkjfEXYw6uZlSF/WH1m676nQzJLI5R
	GQ2Z3IO9vMzht7Z+AmQ8jlGy86+l1GBUZlMr/x5m+zQ==
X-Gm-Gg: AYBFou2g7Vv41qHjmaMrsMoEaNpNvt3GiDRKYl4zgO8LfBYjoSvvBF2FYeSubc+Gp1A
	EgWiR7KhvrSosANI5uNg1m2n6erlXSLfgAik/EN0Axjul51UheefSt0bfvhBI4bfoUnoZisr6nj
	cRZtCTgO5I8+mnuLK4kBhWWNPulxmdYugqweWPSQp7OflEbdxXOud9MFrdBIqtdf36j8n5EkCeM
	ojbbZw+s/ZZY6bvfPJIudWJbAhizHCv/g+wff2h/ok66P8//Mp/yzUj8RrZztuhzGms34IsroX7
	k/TsJFhIniyJBg0NjHewuagmhX3EOhrFKdwpH8TPF2kqPSt1LRJbaZeJlnw/1zqVIAXo7IsLSL9
	admWxS02c7AC+FNcbi81CmIXp/AFw4lrOQdOI+i0mhwARWYwfkBSw8U7eykW4bJklgF/5Jw==
X-Received: by 2002:a17:907:7f90:b0:c29:f5d5:5a9c with SMTP id
 a640c23a62f3a-c4ca7b5f596mr875339166b.38.1793625133753; Mon, 02 Nov 2026
 05:12:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-fusb302-drain-rxfifo-v1-1-bd9b232ab345@flipper.net> <sashiko-outbox-193448@kernel.org>
In-Reply-To: <sashiko-outbox-193448@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 2 Nov 2026 17:11:57 +0400
X-Gm-Features: AclHuK-n43QHaHcrbhfL_HnD3KJAXwokmTYqhfKuY4KazsGHX7cmxbgGZawV8B4
Message-ID: <CAKTNdwGSxPyuadpQPY5oDRHwC_HTX7BujSCM-bRiKgjnyicDvQ@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: fusb302: Drain the RX FIFO on each PD interrupt
To: sashiko-reviews@lists.linux.dev, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 4:54=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] usb: typec: fusb302: unacknowledged messages passed to tcpm_pd_r=
eceive()
> --
>
> commit c6b027a56fce877cc0a50df66b78e46a0dbd88cb
> Author: Alexey Charkov <alchark@flipper.net>
>
> usb: typec: fusb302: Drain the RX FIFO on each PD interrupt
>
> This commit adds fusb302_pd_read_messages() to drain all messages from th=
e
> 80-byte RX FIFO on each TX_SUCCESS or GCRCSENT interrupt until
> FUSB_REG_STATUS1_RX_EMPTY is set. This prevents the driver from falling o=
ne
> message behind when the hardware queues unacknowledged messages without
> raising an interrupt or when multiple messages arrive in quick succession=
.
>
> > diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/=
fusb302.c
> > index 3319f6a2b0c9b..6841db172e117 100644
> > --- a/drivers/usb/typec/tcpm/fusb302.c
> > +++ b/drivers/usb/typec/tcpm/fusb302.c
> > @@ -1481,6 +1481,36 @@ static int fusb302_pd_read_message(struct fusb30=
2_chip *chip,
> >       return ret;
> >  }
> >
> > +/* The 80-byte RX FIFO holds at most 11 messages without data objects =
*/
> > +#define FUSB302_RX_FIFO_MAX_MSGS     11
> > +
> > +static int fusb302_pd_read_messages(struct fusb302_chip *chip)
> > +{
> > +     struct pd_message pd_msg;
> > +     u8 status1;
> > +     int ret;
> > +     int i;
> > +
> > +     /*
> > +      * Drain the whole RX FIFO rather than one message per interrupt:
> > +      * messages the chip does not acknowledge raise no interrupt, and
> > +      * reading one message per event would then leave every later rea=
d
> > +      * returning the message queued before the one that raised it.
> > +      */
> > +     for (i =3D 0; i < FUSB302_RX_FIFO_MAX_MSGS; i++) {
> > +             ret =3D fusb302_i2c_read(chip, FUSB_REG_STATUS1, &status1=
);
> > +             if (ret < 0)
> > +                     return ret;
> > +             if (status1 & FUSB_REG_STATUS1_RX_EMPTY)
> > +                     return 0;
> > +             ret =3D fusb302_pd_read_message(chip, &pd_msg);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +
> > +     return 0;
> > +}
>
> [Severity: High]
> When a PD 3.0 partner sends PD_CTRL_GET_SOURCE_CAP_EXT (type 17, 0x11, wi=
th
> len =3D=3D 0), the FUSB302 hardware decodes only the low four bits of the=
 message
> type (0x11 & 0xf =3D=3D PD_CTRL_GOOD_CRC) and places the message and its =
retries
> into the RX FIFO without sending a GoodCRC on the CC line or raising an
> interrupt.
>
> After those retries time out, the partner sends PD_CTRL_SOFT_RESET, which=
 the
> FUSB302 acknowledges with GoodCRC, raising FUSB_REG_INTERRUPTB_GCRCSENT. =
When
> fusb302_irq_work() -> fusb302_pd_read_messages() drains the RX FIFO, it c=
alls
> fusb302_pd_read_message() for the unacknowledged PD_CTRL_GET_SOURCE_CAP_E=
XT
> queued ahead of PD_CTRL_SOFT_RESET:
>
> drivers/usb/typec/tcpm/fusb302.c:fusb302_pd_read_message() {
>     ...
>         if ((!len) && (pd_header_type_le(msg->header) =3D=3D PD_CTRL_GOOD=
_CRC))
>                 tcpm_pd_transmit_complete(chip->tcpm_port, TCPC_TX_SUCCES=
S);
>         else
>                 tcpm_pd_receive(chip->tcpm_port, msg, TCPC_TX_SOP);
>     ...
> }
>
> Because pd_header_type_le(msg->header) checks all five bits,
> fusb302_pd_read_message() forwards the unacknowledged
> PD_CTRL_GET_SOURCE_CAP_EXT to tcpm_pd_receive().
>
> In tcpm_pd_rx_handler() -> tcpm_pd_ctrl_request() -> tcpm_pd_handle_msg()=
 ->
> tcpm_queue_message(), TCPM updates port->rx_msgid and sets
> port->queued_message =3D PD_MSG_CTRL_NOT_SUPP:
>
> drivers/usb/typec/tcpm/tcpm.c:tcpm_pd_ctrl_request() {
>     ...
>         case PD_CTRL_GET_SOURCE_CAP_EXT:
>         case PD_CTRL_GET_STATUS:
>         case PD_CTRL_FR_SWAP:
>         case PD_CTRL_GET_PPS_STATUS:
>         case PD_CTRL_GET_COUNTRY_CODES:
>                 /* Currently not supported */
>                 tcpm_pd_handle_msg(port,
>                                    port->negotiated_rev < PD_REV30 ?
>                                    PD_MSG_CTRL_REJECT :
>                                    PD_MSG_CTRL_NOT_SUPP,
>                                    NONE_AMS);
>                 break;
>     ...
> }
>
> When the subsequent PD_CTRL_SOFT_RESET is processed, tcpm_pd_ctrl_request=
()
> calls tcpm_set_state(port, SOFT_RESET, 0) without clearing
> port->queued_message. Then, in tcpm_state_machine_work(), TCPM sends the
> queued PD_MSG_CTRL_NOT_SUPP before run_state_machine() runs the SOFT_RESE=
T
> state to send PD_CTRL_ACCEPT:
>
> drivers/usb/typec/tcpm/tcpm.c:tcpm_state_machine_work() {
>     ...
>         if (port->queued_message && tcpm_send_queued_message(port))
>                 goto done;
>     ...
> }
>
> Doesn't forwarding unacknowledged control messages (where !len and the lo=
w
> four bits of the type equal PD_CTRL_GOOD_CRC, but the full type is not
> PD_CTRL_GOOD_CRC) to tcpm_pd_receive() cause TCPM to transmit a spurious
> PD_CTRL_NOT_SUPP on the wire while the partner is waiting for PD_CTRL_ACC=
EPT
> in response to its Soft_Reset?

That is exactly the case, and I have just sent a patch [1] dropping
Get_Source_Cap_Extended from the queue separately, as they are only
tangentially related and can be applied in any order, and the current
broken behavior remains broken until both patches are applied.

[1] https://lore.kernel.org/all/20261102-fusb302-getsourcecap-v1-1-26b5bfea=
4b2b@flipper.net/

Best regards,
Alexey
