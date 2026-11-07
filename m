Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794095619;
	b=j1oiCvIMqWImZtFfTqJFVhXI2KnXCJPZpLcQiR05QebeIGv5+dKtB8MbNGu309USH4xN
	 E/CCkYHKcSwbFVv8qHwQdkP+S5m0Zo0Lvyfvc3rg//jRE0iCSZCu0NzD4JXwOv5P6YUsK
	 o3CiW066AfwJ+TTXPvvofyxb86rnHr3qvrPGo0cIxi7MKVQ3QKds8GUihdquIu2qT5IRu
	 TU3wd9EBMdzKnDHF6ngJlV6fL8vQnl+B8k5odPfZzM6u0cbvyw+mCtQ+AON95h27vj6ky
	 LISKnsu+CKHj+4DNVzaUpo4YkpHsoQLvVTuXROOFAYlKWhGiHYtaPbP70AewehPX3UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794095619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KHl7FjLAzlF40pqV1aBsWmS/0qukI7VrjXFs4bBB8lA=;
	b=XfYvlFh7zIx8O1D54zh1ArgF+ZUaT3h86CE3vzyFJRaPRlg3nl6NTzlq/wGp9bbaO50N
	 zm834YMxgF8FwVzIkyAcaoiqS0AGJ8Vn9ni26iLV4631ZkxT5kmOzgSuW+EZ9MU39CSS4
	 Pb96zTjGrslLZUFO06hZNb+/M/gwzMt7XLsBUHiydWPII0YrWRydvDxR0dQ7b6e4SF2By
	 +OvAG5BOiWaxfum9DND1s1riH/Sdj/p7BltDwU20tTu6qJ51SopGSXZtbtyhXJIiItI9+
	 0zcVz+VEdvh2F+DBp2jPHXRTFbrT0UUnm5LHku6vFcFgNq5rHyQHm6qIvwu6EJInKwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HMu0EXKl;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289B2606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 23:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 289B2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HMu0EXKl
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e9d7791b00so793635ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 15:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794095618; x=1794700418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KHl7FjLAzlF40pqV1aBsWmS/0qukI7VrjXFs4bBB8lA=;
        b=HMu0EXKl3AkHe2G5WW57J0UAthtyRuDWCwgQMIDulH8hT6pVxVx3fUoSA7RxMy2hCg
         oSqb+2Z5R5X/AVJ3E9+fNuFL9yjHeIhIq2CyUhRHc/WZoepDZvqNyDuK6gpl3YDDZwFL
         cngmZ8F0oSqa5FV/6a/ycrpTefPf3DC0xgfWGp7FUJvzHcXS+SHTrhBzbOnH2rueLuU7
         bRn0ieLddPKFeTfETtbbkH41UQ80PjR2mQCm1mh/yKywCXajWEXpm9vQZhRV7Es0e57g
         NcgonmwSV+12Q5Q5otUWByMVTLNAhQHpvDuIHlD0ni6g24Cy+3bwg8+FPZ5mfqXLStfd
         SrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794095618; x=1794700418;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KHl7FjLAzlF40pqV1aBsWmS/0qukI7VrjXFs4bBB8lA=;
        b=mf/NXgE4Gf15pkJeqLr8S97kw1w+FSrhpX5lsTGSNURQDUSA7b/cGxV51knqk1YAqj
         mBsEd/6wuGPRd6F9IbZbhkigaDnl3oFnX3adENw/bo5PAdU/8DenSMPMA1tB0RwqxIJz
         matEZQVcRu26ikvccbLede/VEUjDla1pgruiwG/RXJGVaVRgnehCXle+9tLguaDS+mHb
         t3iuxxotZLw17DKZNhAdQmMkOzHwm4c+0KffKZ3jrVZQTQM2JyVQkLtZG5rgen+OE/zI
         0BNJzaK8WXgih5KYmyJPhCUO4AYSqmMCFje+kvJktcSidPoc8QSZTUK0d5ns9FZ+xW8J
         /xeA==
X-Forwarded-Encrypted: i=1; AL+hErFKjaiPvt8l/gA/0q5QmIR2++QHOGsMQ/W0mkkIqeKn6ngwi8xrCBVSd+6+XqQaPQDG5dNeqmP2abxW128=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tWIIY6R+5MpRMbwAv4e460AuGfz2WkLUDHqd8cf7usR0W01vW
	m9FYPVQAfhDIWzZ+8vrF1bsaScrIaoHcLrDSI1IJN0IaT5gXu/sBWIdv75yUJXjAOQ==
X-Gm-Gg: AYBFou0OJM5aDH5SLy1k+P7nayrQzhboJ0rYiHnR22dHRSoKlk4/akhkrDTw8XyEbNM
	Gua1S6g4vVwQY+5QAiwxOyPFwIBBxzrSeHvJ6nMK/LCD9ZGSNAl0uhP7H1FzlEB68OEKzK66pyP
	peYRIZvV7hHjtXU7b8FLONJ1jj96ZNUYeXERVE7AyUeXQvLvrhIzhFbXt6ga1LxifG5G9WQoFcU
	2rFluq3Yxe6Ey4GhPNa5xfWqefkWarn9/zhca+e0eeTYAI2MYRtTTYXPQdpQ4p63z5oFe0Dbwjg
	5/QNVvYPl1gCa+9BGvcm/vrqMKWbnqfDVKAwRyAfqI80bhrk3iqA+tjh8a6RHFVUOiXXqJ4GdWs
	wYoVXhiCq2hORsHEWoocNoj5IVEmH/HnCFAfZ4DOOViW7YmQ6t+AfgXUTS69gOeAZuYhxMto/a3
	e5iLg8KE5YMtUuL6YIGpn42EaG/+9annGU6lfr1fYheC27ZY4UQm20RicNnaQ/s2rg3idDZW4ya
	0ngylMNxaukSPvQPTIZTraztM+KduZsDVkiP8YRny2Mg4N78Bv60jcpvLJvV/nqOuCbwBKD71yy
	PPuuXXNVWyjREBBbakVIWdan/9Xsp3AE/l/ExNLb6wOEX4HNTgreNSmfNCH7jf/AV1T+DBHE7l6
	3CRgWFx9H6elVWdMWkds/KhWN/3FCONVqeAzrnbIp6Iqq0r6ObiX9fVNDTA65xYLPyko0RJ7xC6
	KmROSImpMr
X-Received: by 2002:a17:90a:df0d:b0:3ac:a203:e092 with SMTP id 98e67ed59e1d1-3b12d0e72e1mr64263a91.1.1794095617777;
        Sat, 07 Nov 2026 15:53:37 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127712bd7sm678574a91.2.2026.11.07.15.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 15:53:36 -0800 (PST)
Date: Sat, 7 Nov 2026 23:53:33 +0000
From: Benson Leung <bleung@google.com>
To: Daniel Balint <dbalint@google.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>,
	Lee Jones <lee@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] platform/chrome: cros_ec: fix alignment of
 ec_params_pwrmon
Message-ID: <au-5_dDwdf0j7kDi@google.com>
References: <20261106193129.43493-1-dbalint@google.com>
 <20261106193129.43493-2-dbalint@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SVqnLzRLk3+00m3z"
Content-Disposition: inline
In-Reply-To: <20261106193129.43493-2-dbalint@google.com>


--SVqnLzRLk3+00m3z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 07:31:15PM +0000, Daniel Balint wrote:
> Sync EC_CMD_PWRMON structure padding with ChromeOS EC firmware by adding
> explicit reserved padding to struct ec_params_pwrmon (2-byte union
> alignment) and struct pwrmon_dump_info (4-byte struct size alignment),
> as __ec_align2 and __ec_align4 expand to __packed in Linux.
>=20
> Fixes: b57af7f8d194 ("platform/chrome: cros_ec: Sync host command header =
with EC")
> Signed-off-by: Daniel Balint <dbalint@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  include/linux/platform_data/cros_ec_commands.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/lin=
ux/platform_data/cros_ec_commands.h
> index a7bd69d83522..6d74371c7074 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -6635,6 +6635,7 @@ enum ec_pwrmon_cmd {
> =20
>  struct ec_params_pwrmon {
>  	uint8_t cmd;
> +	uint8_t reserved;
>  	union {
>  		uint16_t set_rate;
>  		uint8_t channel_id;
> @@ -6651,6 +6652,7 @@ struct ec_params_pwrmon {
>  struct pwrmon_dump_info {
>  	uint8_t channel_id;
>  	char channel_name[32];
> +	uint8_t reserved[3];
>  } __ec_align4;
> =20
>  struct ec_response_pwrmon {
> --=20
> 2.56.0.455.g6c5a503b38-goog
>=20

--SVqnLzRLk3+00m3z
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCau+58gAKCRBzbaomhzOw
wupqAQD31+MHMT2GMHa+8gZvTeOGQWK/Ucg+s4hL5AvoDdccuAD9GxQ4UPJP/cxM
xa6kW3kvabTLe+wjpkqkA9kC7jHj2Ao=
=kCAn
-----END PGP SIGNATURE-----

--SVqnLzRLk3+00m3z--
