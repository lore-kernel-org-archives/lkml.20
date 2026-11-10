Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342620;
	b=Mc60h+VmuTtmyNS/9cJpRZ4I34CO6vETdYEZuhugc+AOkAFL/jgLkGNaUIiF1vx8pVxI
	 3hXHZ201OLQ7/5pUXvGXsOJdyNKx2opb8VZCHk8monpQvg/g5uFwfqOmD5/gVjAIfYgXV
	 Z1/d8GcJCfVISNK1iajaHvHUjRUbKBz6wK+Ndl+tqH8tVOrfgXzAmSqVio4PHzxjHzaJ6
	 3Wkn0VFzq4ht64idNExAVdiX6Uy6MJSP8g6udKu0L6tAUVps70C0VvR0XKu6btnLmLTqs
	 hTvyEuXjSYCV5GbsLFR0yAclRFawEwqmiAyhZYstPwdPoA1mryDGUIrSRm9YQ7Fj0rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342620;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=J0WLu7wmArV15qyHz5DzC+2etJLNPUzKObKdQu5Dz+U=;
	b=dIKwnvZAQkxPBfIjYEKyK8dDjw5euwWQ/YPX9GbD40RCKZ8RpGIotUJnaJFflaaPN3Zh
	 U8ZNxufWtGkoWyIVgI8RdNHNdsR8aSSjfIaw1/CxJagq2D2FqjcjzrvmDLQrNRLmQchuH
	 Nvp9KRf/ZjPHASP5gomNojOdt5iMEPsvHbGG8k/oMGH33CudmQVdJXlsLMqCjJAuzaqIp
	 QSFNM1bNWkHg3OqCll6l1xjSDO9c+Id401cM+fGNrEPpprQ1CzuI2f+EFxvW21PUDZN5e
	 WZPV+3g2aBJ+AeEN8sTqSDeeeXO9iCnsheFkroWI7103vPZzDrDvEtP2EHQ/gBdpNsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XbxOSsI8;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48605606BA6E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48605606BA6E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XbxOSsI8
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so1423419a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:30:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342620; x=1794947420;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J0WLu7wmArV15qyHz5DzC+2etJLNPUzKObKdQu5Dz+U=;
        b=bY7+2SRSlOYH+irZe7gQH+Z2HfwhQnHKlH5/hFTyCGqrFpOXxhh+VSPHVx6lmi94wR
         uzxVlvnbio0vEmb1c8HthpOUFvxg6mPFR9MdmYvD2FokE/iop2a4VyWG5MHFTTc/MY0n
         E9wjTnk42447Ja79wCzYnhhKRQGk4uF1GNGU+2voG/bxEyOXOKLeDAuyfxm3aAmMY7W+
         mzn+juSv5hInNArvmz/Gsa6P8hbDGPQp5xqxDFp3aOBpMnus5i3A7Xe4OpmhJ4EYEvqn
         V9p5ZxFi+Bq62tQti3MO4W+s3kyV53cAejSryGCcbO2BhTa7PL9zIaeY7rMSXSCqP53G
         xApg==
X-Forwarded-Encrypted: i=1; AL+hErGR/SJmiWF0kN0FLbbcLVsZlTKSW8t40aqQRf3WNHQGtrh0/146Q0Aoy/773R9hv/yyo7NyeXDGaNxJ7CE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LEEwagglC7XzuzCBeS3v8gdSf1qBRajjV5KSFo1uHmzSCj1Va
	z8fx5FaN/nk6nt4PJ79cgIYUVlcKeLTt+hr5Ec95GsXlqDD1d8Iop4w3y3g/JV1YUnEogSplUBk
	jh2ASk1GfCQaSRY9qU+AxOE1GbThTmsraV6sKJsRW37ObPOB9pLteSH3GG43qfgF+fYA6gCYZxa
	yL5cqVHIFBlVdRCI5K5O93R6eXgd/qBMPYISDfJQPOZPG3yS9KIAcYU8CkGXxgGY57CwatgrgfL
	IU92St4TXo6vb+DJXa8
X-Gm-Gg: AYBFou0xQOJh4wSC2xWbXgG7ETUE+A2+k/VY+18UbHwnmVubXbraYO3JX4PpExta5Rv
	3+PYjC5l+peZiKcOE9flWxIYdJnq3p3dAJx9AgAk6qqGgwQeGP1Ra3hGDT9BoP2h6DNI9Rj80Pi
	oDIDpyu80YBynjJfQlhjvaM3eguEypmqYo38hbry2jhMuLsPvmFZNOW4vRjwuresMAEErr3IFGg
	jTL4VmFvu75natwW/BhZm/spGwPklwXzj0gSbDod1XLfQJsUhQBJh/vEgT8O/rqc3IPqY3Nndkx
	dz2EypHIyD2m9bjRSun8TdOEHjwFgBU1UH9dWLAMl8Y+RgVy0ISoEBG0y9V1fXLhqT9QD8EaD4x
	lmThmaDf/UtT1P9S7ENNmy1CkZnYOTXp282UImix/nrb4tngYVcn8DtxIe6YpgGkgZt4VtE4duo
	iXQqlQ+oF7Pf0KXRLuQkeHxDFR5lfnTtotN9ja
X-Received: by 2002:a17:90b:1804:b0:3ac:b6eb:e0de with SMTP id 98e67ed59e1d1-3b182e0c2a8mr104442a91.4.1794342619444;
        Tue, 10 Nov 2026 12:30:19 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b182e51adbsm31054a91.4.2026.11.10.12.30.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 12:30:19 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ab260600easo3574892b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794342618; x=1794947418; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0WLu7wmArV15qyHz5DzC+2etJLNPUzKObKdQu5Dz+U=;
        b=XbxOSsI8MQDL/Q5TyZHysuv9RmLPm/IZnk/LfBN0Ussg8b6Pk3qMpokhvgTh09ydbA
         XXDEwkt0vFyOJQ969ntiIon6JUFCsRzwBKIqxiF46ZyzPIlikd6i4GZLbhNT+lZxV75k
         mlg4uBvDpw1B25Gwv2I1ZPlNgs9xZB+saFYXU=
X-Forwarded-Encrypted: i=1; AL+hErG1s96kltrFL4GMYowO+AD6LHSqu1JnLMOwwdNrK6njsEu2hgLCEQFPlV5ptlv5Ypzk0mlw4jVnxBigW84=@vger.kernel.org
X-Received: by 2002:a05:6808:1b25:b0:495:f8a5:8797 with SMTP id 5614622812f47-56866c26ee0mr1910143b6e.0.1794342618070;
        Tue, 10 Nov 2026 12:30:18 -0800 (PST)
X-Received: by 2002:a05:6808:1b25:b0:495:f8a5:8797 with SMTP id
 5614622812f47-56866c26ee0mr1910115b6e.0.1794342617599; Tue, 10 Nov 2026
 12:30:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110233450305Smji446Uhvoxa7r8SHEgl@zte.com.cn> <20261110233459277eFsXn1VXUPZl1EA9CCa5Q@zte.com.cn>
In-Reply-To: <20261110233459277eFsXn1VXUPZl1EA9CCa5Q@zte.com.cn>
From: William Zhang <william.zhang@broadcom.com>
Date: Tue, 10 Nov 2026 12:30:05 -0800
X-Gm-Features: AclHuK_JleX22zVRIqA91EWx7AC2g9xfD0FqItQwFTVyAjuP5RyQh16KDzAl-TY
Message-ID: <CAHi4H7GHGO27Q=O8Upfds8jk-ujSHU5h91hCZw6qjftNX7a2Ng@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] spi: bcmbca-hsspi: fix division by zero for
 devices without a max speed
To: shao.mingyin@zte.com.cn
Cc: broonie@kernel.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, pjw@kernel.org, 
	samuel.holland@sifive.com, kursad.oney@broadcom.com, jonas.gorski@gmail.com, 
	bcm-kernel-feedback-list@broadcom.com, anand.gore@broadcom.com, 
	florian.fainelli@broadcom.com, rafal@milecki.pl, 
	linux-arm-kernel@lists.infradead.org, sven@kernel.org, j@jannau.net, 
	neal@gompa.dev, asahi@lists.linux.dev, ryan.wanner@microchip.com, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000005ffb80065ff1f2f4"

--0000000000005ffb80065ff1f2f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mingyin,

On Tue, Nov 10, 2026 at 7:35=E2=80=AFAM <shao.mingyin@zte.com.cn> wrote:
>
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> A SPI device whose max_speed_hz is zero (no spi-max-frequency property,
> or created through the spidev sysfs new_device interface without a
> speed) leaves the transfer speed at zero.  spi_setup() would only clamp
> it if host->max_speed_hz was set, which this driver does not do, so
> bcmbca_hsspi_set_clk() divides by zero in DIV_ROUND_UP().
>
> On arm64 the division returns zero instead of trapping: the inner
> DIV_ROUND_UP() yields zero, which is then used as the divisor of the
> outer one, so the clock control register is programmed with a
> meaningless value.
>
> Clamp the requested rate to 1 Hz before computing the divider.
>
> Fixes: a38a2233f23b ("spi: bcmbca-hsspi: Add driver for newer HSSPI contr=
oller")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> ---
>
> diff --git a/drivers/spi/spi-bcmbca-hsspi.c b/drivers/spi/spi-bcmbca-hssp=
i.c
> index 8c01475886e8..84015110557a 100644
> --- a/drivers/spi/spi-bcmbca-hsspi.c
> +++ b/drivers/spi/spi-bcmbca-hsspi.c
> @@ -196,6 +196,9 @@ static void bcmbca_hsspi_set_clk(struct bcmbca_hsspi =
*bs,
>         unsigned int profile =3D spi_get_chipselect(spi, 0);
>         u32 reg;
>
> +       /* A device with max_speed_hz =3D=3D 0 must not divide by zero */
> +       hz =3D max_t(int, hz, 1);
> +
>         reg =3D DIV_ROUND_UP(2048, DIV_ROUND_UP(bs->speed_hz, hz));
The bs->speed_hz is typcially 200MHz,  reg(Frequency Control Word)
will be zero when hz clamp to 1.  It is not a valid reg setting.  FCW
must be 1 or larger.
The same applies to bcm63xx-hsspi driver.

However IMHO the upper layer should fail the new SPI device request
when its max_speed_hz is set to zero or maybe the spi core should set
it the max clock that the spi conroller can support rather than having
the controller driver to override with a risky 1Hz clock.

>         __raw_writel(CLK_CTRL_ACCUM_RST_ON_LOOP | reg,
>                      bs->regs + HSSPI_PROFILE_CLK_CTRL_REG(profile));

--0000000000005ffb80065ff1f2f4
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
PRi27wH/XHTDMdyL0Org+kxniXue6MSNJvcQwaLO/UQrmgTygBlVGa+Qg9ZFfS00xvuqeYH7tImO
48WiXeu9rgn5KTH0IWP1+R74KIgxJQ+65la+caZvxwC9V3ik5p/LOGA2qS4GEjGuaYF8QKhRTR4h
/QBSktqZLbzVxpjJXrqFTA2BLlYRp9hPhqNxbn46WuLufpMWhFtjUoQi/8fRRWRsMAY0o1J0f+kB
6EI8FoxPTOpvuLRonqHIWMHk5YRnDdqJ3G5Oc8zmV+UCAwEAAaOCAd4wggHaMA4GA1UdDwEB/wQE
AwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDov
L3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5Bggr
BgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUG
A1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUF
BwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDag
NKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJQYD
VR0RBB4wHIEad2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQw
HwYDVR0jBBgwFoAUACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFHjI7pbQZurVKsSRE/a9
7gUEyVCkMA0GCSqGSIb3DQEBCwUAA4ICAQCFA4fU1GnG8sY7kyUXp5tle+VeWveoWb272jPauU5R
w+udkhVXmnR0Kg7RgkCD00PLTKHNRyegXXDMArs3N9NhO3s9eSp9KjDh+h3WuQWCJH3QBHLGW0qE
fyV87wUtBIy/QsHwO4S8OlOZiXECR7V1EGIF6t3s0W+3UzgYeHL+Ttuhda+2wIVY0EbS0eNH9Vob
4YG17VTBBe7hyobXFpd9d1JGENFzIWncPUshOE0Wv7KlkrRc6aBOpL4p5xO1pHi9h9w8utyHkMoV
nefXixkn5YVHnuV/jbSF/IM4Mlqt0E+n/TRp2c0eR+1AauZKENV2syNBo4aMa0BkmikBjLSnDjt/
TYQdwHNWdV495n71idvueWwTFUhUsnudYcnh42eZENopBOYjVu2WhsffyrNz0hsuR85LriqSuBbf
drd9DMo3DgtfJ7hh4sEAhSw/x/Br86rfLBftZMU02htlnkOI9Tp1QuDsr9+MsqY6AjKeXAy67m7H
TVAZ9uyO9N20yU0p7igESOWKR1ccL1TPA1jrSHK18Y75ot5199FNWeE/UKoDKSML39iPZho9XPh/
/RlsfRFiVOPrI5Gwi4YfIfi0jjEWf310/CYEmA5jrp5gUQSdo/+FgfXLKDFiEHCf5b3B1l70r6bR
WkDCNNacYJWZtSp87i6jmw+l5xx7OkEJ9DGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAX
BgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1F
IENBIDIwMjMCDD2ooFIye/WiO3KgZTANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg
tXjb5BYFZKNuMImlxmOlyD3AkKTSJRueJMdv5b3HJxswGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYxMTEwMjAzMDE4WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAUp5BS0Y7+m5dxAIkx44eESSHl2P1Upqj4zQM
lL3kE1eq+Cx0SmOPOxyUI4pyyXj92mqsA044dI/StZU6lfdIiwiD6KYLWkFthPxKO0Trmq4FVImK
o58QitCfUyyIDDIUdbJqxaNR6IuCRar+qAZNwh/5ghFmYYDInEW40aMWQULfCkA8djWsljbJWq/c
No3X+E9NTO2wMKtsJrLHLwljZsVPz6nCBKj12Hr2EhKWK2y/QVWNvrsXY8HWMKcdJvxhLcYFsg+H
gNpMu2LHh/vzwy9+xjI/QvuE6iPAhT6KqmWYa0Vjtt8RL+5/9w17ZQudpuuHySyNWC8p0MxpVnmV
ug==
--0000000000005ffb80065ff1f2f4--
