Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793697834;
	b=XmUJCK69jgbkJ9gAq6D2h8b3yaY3SMmZeOUszJmwQXgibKfJwUKtdj5hQDzoQRPhgUjh
	 DRWv9ktrC0BTbnvHyhDCA4FM2JFSkQCHkxRVaG45QPL+wwt19+gZwkoMrxM+S4eNfLIaQ
	 /KSwM0X8DBvQlAyCxCnDzMcaYlGXFEsMaTARQou6Flkfr4gENvK1DSxLLPH3MIg4nD2Qu
	 0lrmjTY+dLTie90btXPfG4yPEU4zH5vBXN12XhyLwoYVg+LO0Sqzp8djjUtWvLIjIII0H
	 yj+ydBM1Ti2dZQroaDjnh1dtexZbNLbVn4pw8jL/Malcpn6cahYSNB/rS72DRzIRtOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793697834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Disposition-Notification-To:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=tpCaZ3gvIQBzjv1rcZJeDml96AKnPdsrDz4opTSfiHs=;
	b=cDzJEKRkbkq5rBU3UcATRqzGehWKCbAeAn8Ak0Hmn6/bPle6MDNvXe8t2JUc/rZ964GQ
	 AzsrY3Fwo7A4YPgYrFWLvZevL/kYfrTH/5N90k6WGM9akRIsjd74m3+gtrFhU/uxVf8Wg
	 9f1y5lxe1ynD1cUhqb5G21F6ixL/MQqUj7EoULBH5uilhsa4aCDOScUWOQqwM4wnOT6jh
	 a9qo3i4gi6MbeiqfPuI7fB3z4cEnpdGwMBTEyrDHIEn1RdIsvy5nrvb9AH6yUxSsTK0yA
	 UPKImYWNTIZtalTx1V+5gTF8kCHT/teJ8NNpoAwxWRYgUUaCP7x8imn5xbYuOzV57SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cbeKc2NB;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB06D606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB06D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cbeKc2NB
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c499e0e43a9so75068466b.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793697832; x=1794302632; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpCaZ3gvIQBzjv1rcZJeDml96AKnPdsrDz4opTSfiHs=;
        b=cbeKc2NBkGygMQ4SUsJf6NBV80GKqKLRZyQOx3gFMEtqZMwNAUO84uXHJCgDw57rkF
         hQq1QXnMxV0DlfUzw4mVgkE3bo2nouQOToZzwLXPNTYIzHvU0nbo4dcfbUMgcISn2ufy
         ooFEKXhzM5ch8L9aPaZowPRHgrvPmdqYd8GqW7KmffvCChXaUQRm95lOsQXvVWMrxzNl
         7OyJveqprTG2fG8FOxQJta32jnleYtbkc+eoc7bRAbplTaRamvUbB2ivDV8S09c71oYd
         NfboXvjWUaVpxWda3wjBAMym0CXlvq+E0+/p+8xtt2qyoAk4pn5LuGacvgjtN+glacbu
         8+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793697832; x=1794302632;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tpCaZ3gvIQBzjv1rcZJeDml96AKnPdsrDz4opTSfiHs=;
        b=s62x14xQ65aDZ213vA35YTp31ZTpZ1WZ4IQS8vJhoZI4RsZKB3EiAYr5VgwccYekXC
         Y2O0l0skB0VyAAZ8sN77/BziGiRb+TgdZyb+vQyBvJjzXp/q8U4sVz4ww8sWoTF+GGdm
         XlXW3Dqlhb5HdYSui4thXWs+VoqoqqKpnS/w4s9GQdKokG+LWzDlJaSkCps2nl57JOz/
         j5kaYfCQpwI1grCiSlEjiSRN5XcYSCIq4qzPGPX+YuCcdw2da7TDKJ1VAIIHvQgMkQYU
         trZmVsaevhmFHyO/wG1RXniaeuSQFHx5p5MDpHeBZNS1XEyCvwa32a5PlrfWTbuM76+9
         a+Pw==
X-Forwarded-Encrypted: i=1; AKwUvBznsOtZb1RgIWC2y4VXQeoRH+7xOlGimFr3Yj9TosgZxp5XovwZU58rGftm/P4xsst3iHaMaSs0kz386hg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lMd3AEPmiG6vz+ex7ESroEMdsxNRU9HRlQei+HDeKuJBt1tQQ
	27hJjupNFPXxIXYZFQx+fz+eAoTaSmQ0svkRy4TgTKYYoE0OiWoO8DZ5
X-Gm-Gg: AYBFou1nghcVEUwiz0temxbE43eYpsQWHPyX20kQYljkDHZttJTnFJmr1u6QEi0SpHd
	iI3uyCydj2FigOkpKYR6PaBU6w3/sm3nTJdWyZAJcXW+avbtimGX7LtbXWpomY7b0UtxZpv/wzc
	YRrtEUJshybHzBKrl1yT8DF+MH294srLlnqjTBiuevaTU3QYH/MwFk4tymchbDmNa/MEkNiUlDM
	fQLp0WoRDwW5lMXniKFmWfyGIe5OPZscwvA+GNxSMnx195kIEhzWKpIvWuxGaXG8iYSUKl4LgAf
	k8JKVaWhUbJZ9rjB4aKOPn+Cu3GU7Ye3+w+UI+v345kv5nUX+5k3lXfxqSpS4jwBRGg8o6d4FE7
	HJUzYrrhgwxRjtBC6wwLdCLkMFlHc9zJYOl858HSQbFyY/zewh0i2QRtlWeW2gAmrkBnltVe9qm
	fBL77oZgFFYi7bS2E8Xvkgms4EofkpaPxHUfDXdS4NWCjsoJtEG5mz0tGyKDlBJkJk70higihZj
	85IXBcgYP5y4JF8tbE+j4CSlM2XCYlRk40K4DZEuMcswlKI0e9mKBzpS+yGqNn5Vbh95izIdYUO
	nV+MBGxZRCGS2cZE4QW66u70ZqJdxAdYo+aooPjx2rDOGvve0maw221C7MKP1yue/tTknt7/p5Q
	s9kYEhXW9wTeVJ2w9bEJdR5Oc+2IdbcJGBz0=
X-Received: by 2002:a17:906:f15:b0:c43:f1ab:167c with SMTP id a640c23a62f3a-c4ca7970666mr995749566b.1.1793697832181;
        Tue, 03 Nov 2026 01:23:52 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebebff55sm67442166b.29.2026.11.03.01.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:23:51 -0800 (PST)
Message-ID: <8f4bdf112918e848fa236877b41f8142194db69e.camel@gmail.com>
Subject: Re: [PATCH] HID: pidff: validate effect type usage indexes
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: Yifan Zhang <yfzhang23@stu.pku.edu.cn>, Oleg Makarenko
 <oleg@makarenk.ooo>,  Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
 <bentiss@kernel.org>, linux-input@vger.kernel.org
Cc: Dmitry Torokhov <dtor@mail.ru>, Anssi Hannula <anssi.hannula@gmail.com>,
 	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 03 Nov 2026 10:23:48 +0100
In-Reply-To: <179362071771.29269.11607321878213733518@stu.pku.edu.cn>
References: <179362071771.29269.11607321878213733518@stu.pku.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-02 at 19:58 +0800, Yifan Zhang wrote:
> pidff_find_special_keys() records usage positions as one-based values, bu=
t
> pidff_find_effects() uses those values directly as array indexes.  The
> Create New Effect and Set Effect fields are independently allocated and
> need not have the same number of usages, so a malformed descriptor can
> make the lookup leave the Set Effect usage array.
>=20
> KASAN reports:
>=20
>   BUG: KASAN: slab-out-of-bounds in hid_pidff_init_with_quirks
>   Read of size 4
>   hid_pidff_init_with_quirks
>   universal_pidff_probe
>   hid_device_probe
>   uhid_device_add_worker
>=20
> Convert the stored position back to a zero-based index and validate it
> against both fields before comparing the usages.
>=20
> The reproducer is rejected without a KASAN report with this change.
>=20
> Fixes: 224ee88fe395 ("Input: add force feedback driver for PID devices")
> Signed-off-by: Yifan Zhang <yfzhang23@stu.pku.edu.cn>
> ---
>  drivers/hid/usbhid/hid-pidff.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidf=
f.c
> index 22951b7ecd174..5e4a937237d55 100644
> --- a/drivers/hid/usbhid/hid-pidff.c
> +++ b/drivers/hid/usbhid/hid-pidff.c
> @@ -1373,9 +1373,16 @@ static int pidff_find_effects(struct pidff_device =
*pidff,
> =20
>  =09for (i =3D 0; i < ARRAY_SIZE(pidff_effect_types); i++) {
>  =09=09int pidff_type =3D pidff->type_id[i];
> +=09=09int usage_index;
> =20
> -=09=09if (pidff->set_effect_type->usage[pidff_type].hid !=3D
> -=09=09    pidff->create_new_effect_type->usage[pidff_type].hid) {
> +=09=09if (!pidff_type)
> +=09=09=09continue;
> +
> +=09=09usage_index =3D pidff_type - 1;
> +=09=09if (usage_index >=3D pidff->set_effect_type->maxusage ||
> +=09=09    usage_index >=3D pidff->create_new_effect_type->maxusage ||
> +=09=09    pidff->set_effect_type->usage[usage_index].hid !=3D
> +=09=09    pidff->create_new_effect_type->usage[usage_index].hid) {
>  =09=09=09hid_err(pidff->hid,
>  =09=09=09=09"effect type number %d is invalid\n", i);
>  =09=09=09return -1;

Thanks very much! Now that I look at it, find_effects was never
overhauled and I don't quite like how it does things here so I'll redo
the function + include a fix for this issue.
