Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794779887;
	b=fnRzoasst2yTji9Ch1YpPUkCO69Q9aZSwkwDr4INgI/0t6IzzpfLVcpTCir3VINqyStw
	 m/rUQ+0VEOwni//ly0RHjMdm75Z5/ev3Eoh7D6hctz4POAh26J31wKoXozrVkkiCdlbU4
	 CqDqDVeyBa9tG7TdPA8tjU2oxCHGMzufhva74ThE7zBQHvH4GUsHaoDy0eObPvbrFnNjk
	 USAhSc7yAVUz+9V2/nHJynsk72aCC21+V4Q/kfoW+vbYK4MSiwiTl92/cKS5rkE+R9TVf
	 LHaA2Tp72/WCzVU9H5a/TfnLHDltpOYrkSZ0Fxk4vOj5WKWbFWV+uXN9wmfE41SlSGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zC0jEKFFiQwJqwDfM8bkisZ+K2Ui8bcK+/e64jpjSfk=;
	b=MU9L4YOKtR9dULAq3T2n9jZsTTo7re+4jbkIgZ/9FKLsz164fOMf7cPVOtz7Mqyqjz6O
	 a+R5J0Ans+Pz1IefmnNFkEQnbr3AM/+k6yEvjXVso+1BkUP+Vr6JYeBYd2V9NoCOYDpmk
	 OjaNntCDrI0wWjicfZO4F8Lc9bZP4zPJByNr+Dji9ojxGBWvSDyQiyejQ4FRx42+awqdk
	 c5SJn8G1pVfn4igHx5PK33mFgVXXFcjCojSmk6M8L1Z1hQ17494D0pNwrskgZAFkjpxBi
	 SuP3RlWg4uBBc29dA/VeFnwm3iL7N2CWrLmBM0W4YNLf4+ZPlKBSGdrHZZW//oUdCGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g0DgfEqj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD5B606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CD5B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g0DgfEqj
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c40f29667e6so499353066b.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:58:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794779885; cv=none;
        d=google.com; s=arc-20260327;
        b=KAspPzoLJxuVtxNdpXeMdXancaQU3kPt4LExyo5flnhPYgU7hj682MEwH0/q5bw/6X
         W1Qd0OOLGpiOjVbZGv5DJP9oIobCV1CIMlSwfpGBAAp0wA4KfecMY+ds6dE3mDV9gqlR
         P6IvvIgZMbVD3Fw+1ZXbtycd9AjlfJRCtAW7RCuGyBl7SkXvSvJSrNz3Zg0SRHga8ib6
         qfAzgE884BUy+7XK1SCFEYCD9X70/5u3XPIUJI0SNi2+cx/qZOFqrGMzSz2CktLS8QZA
         iSFfj5FSl0T/1PQ5cHsjXyBg/oZjfkY9qaQeQZsFaD+l6tU3eejM1CWmA1de/EstGWY7
         aFnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zC0jEKFFiQwJqwDfM8bkisZ+K2Ui8bcK+/e64jpjSfk=;
        fh=QqAPDXajx8thCNPZituBXONfX3fLzx60rty+q/KwKVk=;
        b=A+gGWyJNt+VGwb3m1sec5DG03hrrvyvm4+qF60FoKMgmYjVX7+vpe592Bjp/7G/vSD
         eLJGrXkuzwM0JbbAp73BZp39iOToOTa5ygQCPDnu6vJ1MVlnXMZwQFlI/K0tON9fefcr
         MbxHyUahftyynCYVRUwBOdH6VZieheebxwLOvmCDSe33rFMriWqzDEND5zcWDuVUBv81
         o9vk88rTOKAv1IW2BGES4h2QW8ioOQxgewjaNSES4Hd/dGtx1vHYGPdc7Sc1HNTSwctH
         y76AmI1eD0Sv8ovgcz2G5pXYYH5xfb9v27wz/HyACgS+90ILMRVdGtjKAXlHnbLaSO/e
         +VJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794779885; x=1795384685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zC0jEKFFiQwJqwDfM8bkisZ+K2Ui8bcK+/e64jpjSfk=;
        b=g0DgfEqjzMWXsftR44d0Dy0SYVoCd3xi8wR53WRE9xCsmnNa/C6jG4xVvyvuVJh8oo
         rcsHhhbRuZeOCqYpanhOnj9it6mtQo2GkZB4sNAC50q3+0KpIucc7z9OTSCspoG+qM9F
         LO+BNUvgFSlXHhgUBfufMFIgLCaqp8yGPtdIf29nKt5vgsgZBNg6L95A5RCo+VPOrhD4
         Ku774WyX9m63aOIv6RvPjPketj+JGD6VJ7vG/MmkJABEpZMv4O0EDiHQtawBKzMIPT+G
         i5sCfye4mrzHTC0xQ1zVpIjn9F/bCIHWkvcOxgha1pv1SPIk7uf/YlZ8WiPxxVCswJLK
         CwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794779885; x=1795384685;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zC0jEKFFiQwJqwDfM8bkisZ+K2Ui8bcK+/e64jpjSfk=;
        b=ldOxd2jNSsj+Zh74EdVWWHapNIoPscAbcUdsB7FjpnuYnZbQsbRpSfNN8HY2ypC7Po
         J1IRdwbQm2xyoifaGfgKuy4LWa3eHGt3z1VvQzdYtGilDHo2ircJMN6lnEAuSfav+tZQ
         7EBiavN1iCkxk2RFYszFJrzmCBoP2av1sxRFcKK6aaEew7uOWrPcysP6s52CU2PZOplI
         p71aLPK2yFi5BBUZverI1q7T+PcaV3lyWM1/CoXV4aMrYt6fLRi/YYhQ2kde5Jhf2Lq9
         pQim6LTGD9+lT2H/bJLTAoR/nCJXQfdiGKFut9PzpkotaIHZt2kMbMKZQbn59tYXtuYs
         2+5A==
X-Forwarded-Encrypted: i=1; AL+hErF0m1N104Baa85tST4jrOIy9KsPHM+9olcAx6Ry9nMUXSgELBOdD3M3I7e9ZDqfT4hUUg9NcBBefm+3m/A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RJovDw5vEUUA61ZIvr9nfVjkQQtoy9eSH2748mShH61kha/kB
	1n/kGc7aeAC+eQVfCPrydP2zZcnTczbFYJ57jUf12hs8kOz1nIAAGwDsUBxFH4pS7pD9rw0KjQM
	ULTNnfQDqFZd+aibW5ib5CNOxzZvPSB0tMiKpTTA=
X-Gm-Gg: AYBFou03Ld1ntoz3J48PtgbS12YgmY1nSEUHxEzoL0urbouglQTGRUnPTYr+utmo68H
	+wVrauzkQhxzcD8Yb+8Ny5ZXd3kwzHpC+SZJv0vX74GyLxbtSnJ/xJmlqrNiH0h6xceZ/VRI+Wq
	/LtDqt1fUiThytQQA1kNPUAeYm96A4nNpQ9LQPQbEseFxPLmyptj7l6tgn64E0yv2K90JblOxON
	DEtvgpMq7FT1ljEpF7daZjYerTwfus+9UmFCfzwpi8RuyFWpZLA83jUF44Lukv39I359tbE88K8
	5WA9zbf/bG/VZnL2xP4+0VL6OV+1neDh3PC/ROg05Lolj2FamuK6IgjxL9sTrmvYOXigJF7RIjV
	B03+0ZXxSFC0zNRLkuEnw3i851knepato98zC8CdEwu9Nc6wqu5kl2o2L2Lhrz5wI
X-Received: by 2002:a17:907:60d3:b0:c40:b59:f with SMTP id a640c23a62f3a-c5096645662mr739948166b.47.1794779885499;
 Sun, 15 Nov 2026 13:58:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115205408.99849-1-vitorhg20080@gmail.com> <e0b7871e-5dae-438a-bde1-327fe450dc8d@roeck-us.net>
In-Reply-To: <e0b7871e-5dae-438a-bde1-327fe450dc8d@roeck-us.net>
From: =?UTF-8?B?VsOtdG9yIFNpbHZh?= <vitorhg20080@gmail.com>
Date: Sun, 15 Nov 2026 21:57:54 +0000
X-Gm-Features: AclHuK_I07mNuDxkTMjytS5O01bXoYI6oBnxDcDLkarMnqDVv93PfhL_twBznYk
Message-ID: <CAOhXrFe3PQy9j1cJQni8+JFSx79ByhMdP-CAgbOBrpp7Nj2-tA@mail.gmail.com>
Subject: Re: [PATCH] watchdog: intel_oc_wdt: Add INTC109C ACPI ID
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Diogo Ivo <diogo.ivo@siemens.com>, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You are absolutely right. It made no sense to not test it.
I ran an expiry test and it worked:

I have set up a 60 seconds timeout, kept the watchdog
device open without sending keepalives.
It forced the reset right after it timed out.

Thanks for the quick reply,
V=C3=ADtor

Guenter Roeck <linux@roeck-us.net> escreveu (domingo, 15/11/2026 =C3=A0(s) =
21:29):
>
> On 11/15/26 12:54, V=C3=ADtor Hugo Silva wrote:
> > The Lenovo laptops with an Intel Core 7 240H (Raptor Lake)
> > exposes its OC watchdog as 'INTC109C', leaving the device
> > unbound, because this ID is not present from the driver's
> > ACPI intel_oc_wdt_match table.
> >
> > The firmware selects INTC109C or the already supported
> > INTC1099 from the same CWDT object's _HID method,
> > depending on the processor signature. Both paths share a
> > four-byte I/O resource at PMBS + 0x54.
> >
> > Add INTC109C to the match table to use the existing implementation.
> >
> > I have tested as a module on Fedora kernel 7.3.3-300.fc45.x86_64.
> > I did verify device binding, timeout configuration, start,
> > keepalive, explicit stop and magic close. Register reads
> > confirmed the enable and timeout fields. Expiry-triggered
> > reset was not tested.
> >
>
> Why not ? That means you don't know if the code actually works.
>
> Thanks,
> Guenter
>
> > AI assistance was used for development of the test harness
> > and 'peer-review' the patch.
> >
> > Signed-off-by: V=C3=ADtor Hugo Silva <vitorhg20080@gmail.com>
> > ---
> >   drivers/watchdog/intel_oc_wdt.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/watchdog/intel_oc_wdt.c b/drivers/watchdog/intel_o=
c_wdt.c
> > index 0b012aeb1..a78fe1e5f 100644
> > --- a/drivers/watchdog/intel_oc_wdt.c
> > +++ b/drivers/watchdog/intel_oc_wdt.c
> > @@ -215,6 +215,7 @@ static int intel_oc_wdt_probe(struct platform_devic=
e *pdev)
> >   static const struct acpi_device_id intel_oc_wdt_match[] =3D {
> >       { "INT3F0D" },
> >       { "INTC1099" },
> > +     { "INTC109C" },
> >       { },
> >   };
> >   MODULE_DEVICE_TABLE(acpi, intel_oc_wdt_match);
> >
> > base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
>
