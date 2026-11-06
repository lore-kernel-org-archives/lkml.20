Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793930818;
	b=dMIupGOejTtE7LC51lxjrB2MFAXSUnkrVMjTOqghfVkD8wVsFnqI1tGV8NrLW7Dw4WXV
	 TtwMY4R7oNcV3fkDVMf7fJQcskuR90Q85WpIzQKKOXKIk10TdEbCqUOqPb/5b7SBF31d8
	 W8hPca6QFNp5CDEp0nZ8tgNH8xHPsUZyHQf1dh7nJ/HNK//TdME32KvUkhueP9m2YWm8x
	 YhSOEuvu0IJe92TowAc34+5rQNAACG1JqPmBvz5eZpGaTlmp8vq/GWEPCN+V+21McFy3a
	 ELrSnWkDjTvozBIhAUCrikzR0+7/BdOVw3aScloMLKdot969cVP9P82787yAv0JkXqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793930818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=l0gMFmdRWcZkGUi3skBiiP3zznOLqEeQ6/nyO8SA+pA=;
	b=CKLbRy0cToIuG5vfN8sNw1T2BQ9zWRshRpvyCuASnU+6Z/wxuA8AU8pN09URHUswA3xM
	 mwBWGzpGoyQ+5FH6v6V0SSY5oviEqB11k81w+fZI6VEtxA7+sxuJ6hvw1qAXS+tCQGp7L
	 xVxoJfR2fYrfAGqt5XgMDXCCU+RVeMm6x3bKLvkEyLItZt4nQMVgv09/Ob7KmdvFZTlcD
	 JU1InrxMtvuNh+bUKIC1RxGYEUveKqgodo6ptFmrGrF3Fi+bmQIjQlvyhwfOPltBcqza8
	 XhTAcgC7nZwrx39N8xe6yPcrMhvIVodd60lIA/Y+cGlJt7m6bWXoSaMc2XmVjuEX3vQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bTEwsWl8;
	arc=fail smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E1C606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89E1C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bTEwsWl8
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso162490e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 18:06:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793930817; cv=none;
        d=google.com; s=arc-20260327;
        b=DX0TdZstIZ5r4hoTbwxPjO2BswSirr9op1WiRH3qQuNdWEC1dSLj2pR60dLA9jCddS
         fd2agqFUMFnrMu4SY8e6xugOLF7/mI5kaLlOxhlonteHAVhXA1qbhQhd8HJW62whhth5
         Ggve216WQkb4h17zo3oaRcvvwVSBB9TbKiM76qmWlkSL6V+r69TQOvO5GJ0rDZBVWYqq
         uUE1VIPtWizKl0P8oX/v8t3l6zA3DyTwDExq+9XtkSfGznOoTBYDvXxap/GBO2/cK0qO
         H3+lFcLUzUeRkdhDCkL/Kr+p/TrBqKTt22NJFP4FG0+h3bMaGL3Pkc1LH0ZbWigb7kJW
         d/Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l0gMFmdRWcZkGUi3skBiiP3zznOLqEeQ6/nyO8SA+pA=;
        fh=0wVLdehfJCc0yVNWK5CWpguIhi6QRaLOw7ssua5mGG0=;
        b=IF5UL/eNQIQBzf3szwE61YjJpDS5bZbVaFGuB328cps3RLAEVXbqkrQOKhIVTsxC6S
         8D2y3kR1lu8zNKdyJo6MkOxRi3OoYbiHJ4dXaUb5TonvWm0sR5ZNNl9VL7DxFHto7mDJ
         h9sqqRXSQZK3Hd5qCCElOavNGE/o/j7V2WrQhyAVex8arIBQ1ybkUJcYZrpZv7Xs/gyC
         o/1Ee7LpYP25E1CDW9N561ayuL7z/wT+Emza39PoOx/fef+acUSnqKIlRoqtW5Ez++qh
         lqKqRWG/X+li3OVMYu2LJOLoJrmf5xa/XZpKxZTMbwXkIfjy15LqN6q7oXF/7CVvx2fR
         4rpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793930817; x=1794535617; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0gMFmdRWcZkGUi3skBiiP3zznOLqEeQ6/nyO8SA+pA=;
        b=bTEwsWl8rP2auRdtT4mOy0IVH5JLTqmiNuqmiS+MtYbshLaP8eA5geIvLJZ/gKR07K
         9tvKCJkc0m6slg/AiadE6ja+4Pim1USQNbVczaJIK31GIs6b19NAvck+7xUH47jpPT/7
         dGkS9JpQE5854/6z/jA7cDDUYbZiNo7bKV0RXIhJlajwKl9MCyHyfubu3khlbPVnZHQU
         fjkX1MXiJcTOeTZMrBNuYnc7sPcCNIK8JjMuWse6HYHxSbZjWYkzJaJFMg2W0y64PhrJ
         dIsyY6pr3AuOs4U5BRc6Ml6P0G1Q/ABZ27onhRJ+T/0GJ7LDD+t9Kz0hfbl9Xu57cEAE
         ekRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793930817; x=1794535617;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l0gMFmdRWcZkGUi3skBiiP3zznOLqEeQ6/nyO8SA+pA=;
        b=PdiwF9mHUYh17fH6KrQ+VWXPJcZl5xQSiChkaJGc4wkg8C0Dcyq1rn+gSUCUtJL1r8
         idhKgGIIawiXJScFnoG4dKvJDTYfR4PpxDI5/aAaLYqoF9vFWuImEoNGHfbUoTs7vlGM
         prtU0koTdVFJsK1kykCZpaqVMH2arF+f1UzqFo1eu6S5ru1Lqfe39ODzfO7StwqVQl9A
         mdZTyIj9hUflbLs0m5le7NFhhjzVpz4p2ijIBfqd5cvRuVRi/XDvaq2Ezeoxgzqw+jHj
         3OT2WG/z67eI5nQw/+l1QAC47Lx3OhYLMVMeaSd0sooQMRNwdSetlarx+wu/ilSSs9ev
         AUmA==
X-Forwarded-Encrypted: i=1; AKwUvBywVoTTPdsYWQ3hnmGST3XM3ZdIHfJ0O2befH0N7HEKn/TWV3F4oesP5+r00PDs3DVjfImOjciVfzjxEQM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8axeRp2Hv/cpeQhjU5wGrR04TiHnfNVuRlzmS6q3DW8uhbbc8A
	m4mNPzVbyUWEAVsiVx/owKqK6Mwxpa7Xx3+OQNylaIno3tTZOJjo76JbfWDvBfVggwbszkK/+gT
	zb6E6QGTdlLGTOj3eFTl6Ueqjv6HP9cEr/K+iTVNJ
X-Gm-Gg: AYBFou0a3l8bQHj/hizv4Zh3yJcW5OoHQRJMybqve7jlusKm6PUgqPR3iE7lzPP0tOd
	r/SB1bKjb0Yx2bz95ems6NP2VAYAprnIaUY1DkAHp0krojzh4bV8wm4jmGQED8HavviD3TSELVC
	LoYLjX1FkfdF08NfqjkNjkmkvNBUp1NM2Eg+GC1N5m/XnsdtKFiPt8AVzAU5DMsevCP27mOB6km
	FH3eOiomYf/lOQt5Twma/CEyMBmQgTSqWvg2oRZNGHSmf6rVlNoDFCiTHZYJl6tYHFalJ4F6v5F
	rO0NzT1LkfsKoHODPn1y3sbwcMzwl1cuHu/XO7/iXKqL9K3+4OR6puW7DrwonKnwUKf+OtRYIVX
	XS9buDOs26CjEH2HeOCpDR9pUW6VCyYNKhhRf
X-Received: by 2002:a05:6512:3c9d:b0:5bf:cab4:e497 with SMTP id
 2adb3069b0e04-5c003a90393mr288409e87.10.1793930816185; Thu, 05 Nov 2026
 18:06:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027061258.3900768-1-apusaka@google.com>
In-Reply-To: <20261027061258.3900768-1-apusaka@google.com>
From: Archie Pusaka <apusaka@google.com>
Date: Fri, 6 Nov 2026 10:06:43 +0800
X-Gm-Features: AclHuK8yfmSwjKMfM9dW57iuCWESviIJvILa2tdEOq46b5OhHOpNvCgyeKuucsM
Message-ID: <CAJQfnxFCMtr6AyGqRqAYQe461U0m1WBgzZ_psuTnU+1kS8-5Ag@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-hidpp: connect Bluetooth devices before
 HID++ handshake
To: linux-input@vger.kernel.org, jikos@kernel.org, bentiss@kernel.org
Cc: lains@riseup.net, hadess@hadess.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maintainers,

Please take a look. Thank you!


On Tue, 27 Oct 2026 at 14:13, Archie Pusaka <apusaka@google.com> wrote:
>
> hidpp_probe() opens the device and runs the HID++ handshake before
> calling hid_connect(), so that the HID++ name can be stored in
> hdev->name before hid-input and hidraw expose it. Opening the device
> tells the transport that I/O may start (for uhid, UHID_OPEN), but any
> non-HID++ input report received before hid_connect() has no consumer
> and is dropped. Over BLE the handshake takes several hundred ms, thus a
> reconnecting keyboard might lose the first keystrokes.
>
> Bluetooth devices already get their name and serial from the transport,
> so connect hid-input and hidraw before opening the device, like
> hid-generic effectively does. hidpp_connect_event() still fetches the
> HID++ name into hidpp->name, so the battery model name is unchanged.
>
> As a consequence, the input and hidraw nodes of Bluetooth devices are
> named after the transport-provided name rather than the "Logitech "-
> prefixed HID++ name. Non-Bluetooth (USB, Unifying/DJ) and DELAYED_INIT
> devices keep the original ordering and naming.
>
> Signed-off-by: Archie Pusaka <apusaka@google.com>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 67 ++++++++++++++++++++++----------
>  1 file changed, 47 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index 27d83b8bb..b552f31f0 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -4673,6 +4673,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>         struct hidpp_device *hidpp;
>         int ret;
>         unsigned int connect_mask = HID_CONNECT_DEFAULT;
> +       bool early_connect;
>
>         /* report_fixup needs drvdata to be set before we call hid_parse */
>         hidpp = devm_kzalloc(&hdev->dev, sizeof(*hidpp), GFP_KERNEL);
> @@ -4734,12 +4735,31 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>                          hdev->name);
>
>         /*
> -        * First call hid_hw_start(hdev, 0) to allow IO without connecting any
> -        * hid subdrivers (hid-input, hidraw). This allows retrieving the dev's
> -        * name and serial number and store these in hdev->name and hdev->uniq,
> -        * before the hid-input and hidraw drivers expose these to userspace.
> +        * hid_hw_open() below tells the transport that I/O may start. However,
> +        * Any non-HID++ input report (e.g. regular keystrokes) received before
> +        * hid-input is connected will be dropped, and over BLE the HID++
> +        * handshake below takes several hundred milliseconds.
> +        *
> +        * Bluetooth devices already get their name and serial number from the
> +        * transport, so for them there is no need to delay exposing the input
> +        * and hidraw nodes until the handshake is done: connect them right
> +        * away, like hid-generic does. hidpp_connect_event() still fetches the
> +        * HID++ name into hidpp->name (used e.g. for the battery model name).
> +        *
> +        * DELAYED_INIT devices create their input device from
> +        * hidpp_connect_event() and keep the original ordering.
>          */
> -       ret = hid_hw_start(hdev, 0);
> +       early_connect = hdev->bus == BUS_BLUETOOTH &&
> +                       !(hidpp->quirks & HIDPP_QUIRK_DELAYED_INIT);
> +
> +       /*
> +        * Otherwise, first call hid_hw_start(hdev, 0) to allow IO without
> +        * connecting any hid subdrivers (hid-input, hidraw). This allows
> +        * retrieving the dev's name and serial number and store these in
> +        * hdev->name and hdev->uniq, before the hid-input and hidraw drivers
> +        * expose these to userspace.
> +        */
> +       ret = hid_hw_start(hdev, early_connect ? connect_mask : 0);
>         if (ret) {
>                 hid_err(hdev, "hw start failed\n");
>                 goto hid_hw_start_fail;
> @@ -4755,25 +4775,32 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>         /* Allow incoming packets */
>         hid_device_io_start(hdev);
>
> -       /* Get name + serial, store in hdev->name + hdev->uniq */
> -       if (id->group == HID_GROUP_LOGITECH_DJ_DEVICE)
> -               hidpp_unifying_init(hidpp);
> -       else
> -               hidpp_non_unifying_init(hidpp);
> +       if (!early_connect) {
> +               /* Get name + serial, store in hdev->name + hdev->uniq */
> +               if (id->group == HID_GROUP_LOGITECH_DJ_DEVICE)
> +                       hidpp_unifying_init(hidpp);
> +               else
> +                       hidpp_non_unifying_init(hidpp);
>
> -       if (hidpp->quirks & HIDPP_QUIRK_DELAYED_INIT)
> -               connect_mask &= ~HID_CONNECT_HIDINPUT;
> +               if (hidpp->quirks & HIDPP_QUIRK_DELAYED_INIT)
> +                       connect_mask &= ~HID_CONNECT_HIDINPUT;
>
> -       /* Now export the actual inputs and hidraw nodes to the world */
> -       hid_device_io_stop(hdev);
> -       ret = hid_connect(hdev, connect_mask);
> -       if (ret) {
> -               hid_err(hdev, "%s:hid_connect returned error %d\n", __func__, ret);
> -               goto hid_hw_init_fail;
> +               /* Now export the actual inputs and hidraw nodes to the world */
> +               hid_device_io_stop(hdev);
> +               ret = hid_connect(hdev, connect_mask);
> +               if (ret) {
> +                       hid_err(hdev, "%s:hid_connect returned error %d\n",
> +                               __func__, ret);
> +                       goto hid_hw_init_fail;
> +               }
> +
> +               /*
> +                * Check for connected devices now that incoming packets will
> +                * not be disabled again
> +                */
> +               hid_device_io_start(hdev);
>         }
>
> -       /* Check for connected devices now that incoming packets will not be disabled again */
> -       hid_device_io_start(hdev);
>         schedule_work(&hidpp->work);
>         flush_work(&hidpp->work);
>
>
> base-commit: 2c2fe95ab19b09bef7391e3e5cdf8146d09792b6
> --
> 2.56.0.307.g5fe7bd680c-goog
>
