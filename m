Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793648449;
	b=eXyGFcFLJMSFfTPHLZkxE8CbQSGbuVcqA8PRN+ShI0QbKhM83j5Eou+l+4fwVhIJpEnC
	 O6q8xJl+d9tq2zRUbAnqeDCYvvYtShOAVwA6z6PhNawQ7e9mCvR7pqw3dFmFRnIUTPAXs
	 nZ/ukDEsSWngzsMRVkgNsuFk608+Sy40KT1czIPBIjiXFwOmdzd8yxE0DFh2J5fQ7c6Ym
	 aWNQRW+KIwWNM1LFALMs5+IMgKZ8bPh4Q5j3s9JRcU/Hl7hhBPaznyFd/8Rj7UodE+c7M
	 71GHO6pet0r7ejLwcgGAN/qkn68ShuJRoKFvR3t1zheyait8+tLwLt6XR5kSRURKKWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GbkRke0LXaFu4tmREaLxpbbtBeI6hhfwyv7mLLKRRFc=;
	b=nayQAbzgI+IxH0stW3pXzYaRCWgJQUVsvLQY8r81qJm0z+xluxEOjj478hKpofLzj914
	 bPZfUALpsxP9hvV99Cljo1CLqf+tmQozxzuaN9K9TzRfZIdpPs+zkMY5wPRIPjFIH6ST9
	 /edzSyNFeYnDRB2bwSN94+cj7Mbn/At+cEyivMVg1MrpDULQpZH7Rn8fV2QrXCS93d133
	 qfSLH1WVRv4f7RnB/VEh44GK2eFt/qvzfCQPbEy0JbiukOTdnpsN9Ym5qb039WbYcdefy
	 lOqzngPdbNmlpY4WCTcd/5b9YyKAG5kM8IUE4J9nbgeS4g2MCeXvUE4eOVFZPECwtcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OKi4Se9/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC19608509C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBC19608509C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OKi4Se9/
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-917a707f37eso38357506d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:40:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793648448; cv=none;
        d=google.com; s=arc-20260327;
        b=IZEQtJB27scejV3IBIJ6njA7paGMfJ5TdSE66SC+PfhZ00k9CiAiU+Rpsv8vd2fbcU
         miNGast+bIuIHUMTDbLUu0vJ/daIvoBk71gDarQK0w4JENRch/X/zfUZ4C23CRerur2r
         CUmwEL1KQtRw07nLpEdSklz3s03UB3DBmSu68hOkqPruN/Czu95DKmFbF09/1e9S6sCO
         9JvJzlHsMMG0scdWZG7FcZrUbgyfMJwIUFF9NJyl99ZUkfcBteH9KDF5jwGwBvEkIlPK
         oMb5GdSyszfvJ08GQA8zwCfgC9jJLA0OCL0EsazP0iHO3KeRC5YPhScgZ/N2AxQsGsY/
         Ryfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GbkRke0LXaFu4tmREaLxpbbtBeI6hhfwyv7mLLKRRFc=;
        fh=3hpVmjquF2Xu+ossneyMPD0Qtlqfq3lWgQN0dlIvM0I=;
        b=Qrd3dV1owB7qFQh7U4LWNLOrqiqn+4tlrEb+w4Mav5l6LHHAaScoKsrPrVZcICYpeW
         OAawd7Eog0Nthe9FYNSkOp/5uGre8NXxViTJbrDgx5QdZRar+NnN4/ZbSVsuck9IZ+0h
         vSlTpySANzKG73E9nqw+I4l/Lw97JEytmcYOCtsHjlISx8C1LgNBFP0enz62e2XuI3qe
         dIIfG5o8R2y6LgKwHqXgvffFe4QuLEJkPTb3kGzvsKqg4A8v4+EJbowpkd8Vg9n2Lnbg
         l9tFsvfyg1im036N/eV7ITVSZjWjA0GmycvCdV47JX/CYZGrrHIdpU9rAZEPd2rSgb+m
         KDag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648448; x=1794253248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GbkRke0LXaFu4tmREaLxpbbtBeI6hhfwyv7mLLKRRFc=;
        b=OKi4Se9/+Bx+TX9sYdgg2EQzP1iPTUoPsr9TgA++Rc9P3UfNMq28jEouD5yNb6uO02
         K+DlENi+agCGov4smmLO0wnQk7Uv4/hUurpTswNu+1/M0lkpq+iYnErjwnfIOelDegim
         sGK4DVI29eWk5ygBDrLzPa9lxzl8T4EY6ChkQ6o/bbb0hSVYOT+jCVr9qn8R5uM1eYZX
         nnF0WKhJyqt2dSxSY2KXSXoBRnfPYEacKzN+lPg4jBxYBcoIfVdx2UskcD9pBFNd7puk
         nGByI1+Lrszq4Bbvrk6cpiKmoKoBnHf017SPeDOWjAVO7Jdnp5HgGfHzFcBQyIgc5YHN
         PXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648448; x=1794253248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GbkRke0LXaFu4tmREaLxpbbtBeI6hhfwyv7mLLKRRFc=;
        b=SaQ9ZlRSkVZdsXWTY2cs86XZB/ZmzGHBf0XAP1lWxiKLIK297CMWKgKWqi68GsHKzD
         /ebEzh1s+sALxFJEBB5iaGXOB9Uw1qGiAduZroi8nU89mek+1pM+s9PZre+9XgpzVpne
         DnwEJaNeYaHtkF94XgnqnuTIsh6PCVOrQQ3QZT/cyxtk96oeehmJaPw2uwdXc+hNWxhV
         KkXZCAANQpsdeuqFDpDk9iewpkq6WNoL7hFI5/j2SFXsh6sjbstu+VjQXI4RwsVd/lZo
         sjfpPo3maFw/ROR/cOMDV9nv7qneTM+gAAUtLyu3Ule3j8V3a6oVq0vZBKRONv8ddX01
         MV3g==
X-Forwarded-Encrypted: i=1; AKwUvBzBxMMQA2P4cNSViOawtazaKumgJTe2vViwBXbZTxnOJE1w+W5ALf9KUHe0P6/1zhqCueiCg1zY8valxZQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UqmIXieJvW3Cw6sr8KtusgJcsB3SEkBzo4YKlMMuz0yj7a+62
	Oq1rIXrbHSzQJylx4V8/q3O57HZLo4DHg3vsX3TVlcQT57xi6VriOOQdNZK9Ekn3C+Mg3/9VxO1
	dyoEuSPXXigrhRoB2QYo9pTzZsQQaBOKVnjm5
X-Gm-Gg: AYBFou2ApCTY/eRZjZT5o60s+GA/rTXMMZONEo6kn8aF9QRGXUN4daRzhGm4vofWQoS
	SlOWocv/9rKXgfFGiuoI8gt68GSshOFgaCGpIxShgJXWvGNMmqEYxX/71ifAGrpf3C9Y3T6NT0x
	QtvCY/UWXX1pQxt3+sgnUZLF+YxIr8FCgXBHLiKqcW4jRbpxQxTUFK6Q6pqNztRgcfWBDiBf6uj
	zqViQRQ7p4br/gGC1HimLWS17I7zqc/I4DoRu7+YAk5sZs48E21EQ2d4NjTaGv4/yEEiuxTC04l
	vU9V3I2DhTLgpevk5p5YpCO+67eJnDSocod1IgN2/d8s2cevWPtXSEpAXhJWCNXQ7vI5dKb8lce
	9j8bDjiT6Ce2lT7tjpqjKwT8gehyHKNWjIJNl
X-Received: by 2002:a05:6214:3198:b0:91c:81c4:e662 with SMTP id
 6a1803df08f44-91ca4a14f3dmr165578386d6.8.1793648447373; Mon, 02 Nov 2026
 11:40:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101054830.291749-1-nehuenlian.kernel@gmail.com> <20261101071818.529598-1-nehuenlian.kernel@gmail.com>
In-Reply-To: <20261101071818.529598-1-nehuenlian.kernel@gmail.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Mon, 2 Nov 2026 11:40:36 -0800
X-Gm-Features: AclHuK8oDm4gifU63gIrj6gclHFrmc3QapE0pRwdGP2PhXvL4poeX3QSq5R4Ap0
Message-ID: <CANRwn3SnB97Oeg4rKBiYX2DD9r51Km5Cf3kpnAn7s2xd42c0BA@mail.gmail.com>
Subject: Re: [PATCH v3] HID: wacom: replace sprintf calls with safer
 alternatives in wacom_sys.c
To: Nehuen Lian Bova <nehuenlian.kernel@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 12:18=E2=80=AFAM Nehuen Lian Bova
<nehuenlian.kernel@gmail.com> wrote:
>
>  Replace sprintf() calls with sysfs_emit() and snprintf() calls in
>  wacom_sys.c, which are safer and avoid buffer overflows.
>  Also include the header '<linux/sysfs.h>'
>
> Signed-off-by: Nehuen Lian Bova <nehuenlian.kernel@gmail.com>
> ---
> Changes in v2:
> - Use snprintf() instead of sysfs_emit() in __wacom_initialize_battery()
>   as suggested by Sashiko bot.
>
> Changes in v3:
> - Pass sizeof(battery->bat_name) to snprintf() as suggested by
>   Sashiko bot.
>  drivers/hid/wacom_sys.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> index 628372ab818a..7d9bbcb13ae0 100644
> --- a/drivers/hid/wacom_sys.c
> +++ b/drivers/hid/wacom_sys.c
> @@ -6,6 +6,7 @@
>  #include "wacom_wac.h"
>  #include "wacom.h"
>  #include <linux/input/mt.h>
> +#include <linux/sysfs.h>
>
>  #define WAC_MSG_RETRIES                5
>  #define WAC_CMD_RETRIES                10
> @@ -1838,7 +1839,7 @@ static int __wacom_initialize_battery(struct wacom =
*wacom,
>         bat_desc->properties =3D wacom_battery_props;
>         bat_desc->num_properties =3D ARRAY_SIZE(wacom_battery_props);
>         bat_desc->get_property =3D wacom_battery_get_property;
> -       sprintf(battery->bat_name, "wacom_battery_%ld", n);
> +       snprintf(battery->bat_name, sizeof(battery->bat_name), "wacom_bat=
tery_%ld", n);

If you're going through the effort to use snprintf the string, you
might as well also read its return value to check to check for
truncation (return value greater than or equal to size) and handle
such an error condition appropriately.

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....

>         bat_desc->name =3D battery->bat_name;
>         bat_desc->type =3D POWER_SUPPLY_TYPE_BATTERY;
>         bat_desc->use_for_apm =3D 0;
> @@ -1928,7 +1929,7 @@ static ssize_t wacom_show_remote_mode(struct kobjec=
t *kobj,
>         u8 mode;
>
>         mode =3D wacom->led.groups[index].select;
> -       return sprintf(buf, "%d\n", mode < 3 ? mode : -1);
> +       return sysfs_emit(buf, "%d\n", mode < 3 ? mode : -1);



>  }
>
>  #define DEVICE_EKR_ATTR_GROUP(SET_ID)                                  \
> --
> 2.43.0
>
>
