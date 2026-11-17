Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908415;
	b=qt1h3v9zb+dzcvxrBZQDmDACzXJC1Vi5gw23z2mdcmb1DztQw9jeofit6S16Xd4GFqXd
	 P0d2nzHBfHV4iI6bFgzvkNt0DBjXEhMuu8yTH2FVtn7hbfHK+9rX0XawPsRFrEffN7W1z
	 ghzQC5OdEMwctka3ZTqeupAJu49lUQGV8SJk/bPUr47Eu44DHs2dDdBfUK93EfxCLdsnP
	 9ywfHLXw+cyY3KqPkp6kBsWS8j+jdQxOlH9KDK7nqGCTFxzpP1NqpNBMMYn6mBx1csKqH
	 fuPSl0C4EgJNgx1TngmveE5hzdal4qFlc7/awf0ikCrv37S94nKkybZGA9v35x6hCvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908415;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=y0zlRMJNOStWz5trUd7/tfb0kv4utMHpqM2nmh7nLPc=;
	b=ILTavOk4z5EnR50ZS4LXifpg8U5n9muXD0+giwTb966zfFJqBF/DgfC/9PKrlSPuI36M
	 KI8dw2/0/SfP8kOLwe/XjvnjmfyW0iQn3qwq8ffO93EIyAIE7j1l1sy1+2ZOxJMYOGuzM
	 FP6vGZdK/H0SfOZMJxVeQayShkJgKcBMxKcfaKGXn+gRddFFre39hz1VitYSKzI4KCVKV
	 0PC8o9GKTLXZJ/vgar46F/kgRXg6FkEvg//icz5QUgTIpnVIo//1u1Y7a4jUy/gKmsW0l
	 ZDK36WqPOSRsfsEPzPWqhETbW7XzrM/6PKgj7DaPgyK5wbYbBUs/XL3UQg3S3w4HOHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970EB606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 970EB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-78fb1fb9508so530123137.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:40:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908414; x=1795513214;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y0zlRMJNOStWz5trUd7/tfb0kv4utMHpqM2nmh7nLPc=;
        b=08Tb5S8JJCs94aGDDXL+5G2itDujh7aLiab5HYjskARusip0S2ifQjXxYxkHlhh3X3
         bTcK+BbJ8qvA6ZR7mDcawgpY1o/QuDkK5pVlL0NuUYEoB/b/DL+JXgBEg8ti4CLz/vZS
         FmO4HivjJ4FkgDXM9cJ342USjuq7S821MMynmsETJD/kGu01be0X7hjf5I+rKFx7W33L
         /6Rb+BN4xMD8J2jeO9p14l7u2/Jy77QFg6IcE2Z8wg2gR3uX6uIr22Sd/hI7X+74l9jI
         3sToUGFHETx0QbBMh7AzfdlQIIzPyVrmeo30N4AKomIULpW3cOP7IZGh28B7EEXF3A+z
         Bziw==
X-Forwarded-Encrypted: i=1; AL+hErEDY2QFSA01AqRDqD9RmM/+pGijHwnTF2HYiHCvf1M3TLoAmoHRjQJ4zaKIHrwqvw21d5KZpxwrL/PL/DE=@vger.kernel.org
X-Gm-Message-State: APuU4Z//NSbgU/FAB+u3py46MjLVVHVnkaXgqebDzFCE98mpYbfvVyjM
	IE3fiOfKLNw+4XbxZmdE1X8kiK3fg2ytbeQX6/6ClvDD142/vLW4YwpRz5Yrm+Hd
X-Gm-Gg: AYBFou11OxawN/7H0J0f5+7OEMTiqs6W5MvTU0iCp2YkzOGAXaP6Vr6V+x62D16bEWu
	e2lMoCuOc1i1RbvjjXwiWydSxZTvCWYPiOCAuCk0/0pHuQcvuZ4yXhkAcVTXkoa89mJt6ETYJZe
	I2ykFFXywvsoca7dJBEs0iB+JYKrnwi0kON6B6oLh+FwfBkdOhE/R3zuTWB8wdNc9Bd5tZiXBNK
	L4bT4J1wxZdAd97UGwrWzL/ax7fgR1yNLEy9rsJVH+HQ/XeieQYBv0LXjQ61vhSrnM9P1+C+Zi6
	hhNUZ2sJsORC+3Cq4DsD8eVuCZQh5Dr9mGVoRsRcR4ESYz6T/d7cUfl/gqrWgH7gE2fw4RH0d5E
	Ss1iiuX0cPLTJGSfrx8ayCN0W/td/iAoRDhlzrg9kOkwP1uZRS68X8qbUpwV5gKh3Dsjf/4YSRF
	kQXmMEpxLg+EJCzUSZj8GrlZ+o3zSPNKg45JZC2Qja9U7EX7AGaEMZMiFPkjsWui1lKAI8aiGK3
	vyx2sIYH5LOVrUIpYq4Ff+fZFqeh8iBhVxpw5fKwpkBx48Z+GcX0j/v7nQ6Tjw0DPLi/0Y0GYXp
	wc9d0f1JD7Ynwpc9ttVjhTn+wksei5KRoab1pmRL0edIS/E2OSIwyJXwQItQo6nb9EY=
X-Received: by 2002:a67:e704:0:b0:7bf:8ec:4996 with SMTP id ada2fe7eead31-7d69f7b5684mr492274137.20.1794908414474;
        Tue, 17 Nov 2026 01:40:14 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e339155f7sm1762270241.8.2026.11.17.01.40.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 01:40:13 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7d2e43ff4b4so502533137.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:40:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGT95wJr/7VVX6OOKkYG5K1r4MDGRQ5mRUDUbwlO4uCY3Eu2RRnFO74MI9O4DbKgfGUXn89xF4/aibHxdY=@vger.kernel.org
X-Received: by 2002:a05:6102:4455:b0:7aa:d0a9:c5aa with SMTP id
 ada2fe7eead31-7d69f7b5db6mr367348137.18.1794908413358; Tue, 17 Nov 2026
 01:40:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <aunvPGXM2F_VOMzx@sirena.org.uk>
In-Reply-To: <aunvPGXM2F_VOMzx@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2026 10:40:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWjaqsXLUD6mT6PKDdozYew1wG30jp=ZtYGXtohiSFOxA@mail.gmail.com>
X-Gm-Features: Aa3M54qLzQogK-o6VgT_Lzi03rZSvOrS4193DJeETFJaFv9tSO3EDuIMtxMm7x8
Message-ID: <CAMuHMdWjaqsXLUD6mT6PKDdozYew1wG30jp=ZtYGXtohiSFOxA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the iio tree with the iio-fixes tree
To: Mark Brown <broonie@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Christopher Hoover <ch@murgatroid.com>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Sanjay Chitroda <sanjayembeddedse@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

On Tue, 3 Nov 2026 at 17:24, Mark Brown <broonie@kernel.org> wrote:
> Today's linux-next merge of the iio tree got a conflict in:
>
>   drivers/iio/humidity/hid-sensor-humidity.c
>
> between commit:
>
>   340d44bdf9db0 ("iio: humidity: hid-sensor-humidity: Use per-instance callbacks")
>
> from the iio-fixes tree and commit:
>
>   5ee5d306f1bd1 ("iio: humidity: hid-sensor-humidity: convert probe and teardown to devm-managed resources")
>
> from the iio tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for your resolution!

> --- a/drivers/iio/humidity/hid-sensor-humidity.c
> +++ b/drivers/iio/humidity/hid-sensor-humidity.c
> @@@ -236,39 -241,13 +237,17 @@@ static int hid_humidity_probe(struct pl
>
>         platform_set_drvdata(pdev, indio_dev);
>
>  -      humidity_callbacks.pdev = pdev;
>  +      humid_st->callbacks = (struct hid_sensor_hub_callbacks) {
>  +              .send_event = humidity_proc_event,
>  +              .capture_sample = humidity_capture_sample,
>  +              .pdev = pdev,
>  +      };
> -       ret = sensor_hub_register_callback(hsdev, HID_USAGE_SENSOR_HUMIDITY,
> +       ret = devm_sensor_hub_register_callback(dev, hsdev, HID_USAGE_SENSOR_HUMIDITY,
>  -                                              &humidity_callbacks);
>  +                                         &humid_st->callbacks);

The continuation is now misaligned.

>         if (ret)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
