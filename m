Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924885;
	b=r8dVchJ9OhWBzyP9wZLdVrxPlyoQYDQjOn1YouuXu8EN2B+CAAOj0PcsnFZh2PnbpW7y
	 4+Iz50SqU0+XYSa4TQRPDYEFv5OGWBzi7JOV8RgqmzQxWYP2Nbsz5EZNRxDpHLfBQxh08
	 hk30A/uASpMaNsRSZOBYBWKJsaLaViKV/lIv87g6GDhoBTbK0vFKVa7of0DKEEZfsBl8M
	 jRbcrcpyIwfK4Qw/BfiaGnWIG57ryix14sUxnaZuaK4/sKWd92f6jKqdyshWsYQNGFiRB
	 P1nW6xZYw9sWfMcc8L3uQ3gfBW2Ab3OtjCmddyEpdbiyW0miDATNvMjwClmGDMF5DsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=t9Z9GWOoq55CK62xauUtdSr28r0CBC3/vbxHlMVyCWM=;
	b=DrCoNH7m56IHyPFOurAKvpTrNZDmLpHyWSTQG7dVc25SZuV0E3yj0lgRNzSL/HuLKbIH
	 av+SokpcC8OFOSNwaeSgwTO7Nrx7K7ehquXWkbfzfRiyPZX6oFYN6UY38h5iw8KiVk5vE
	 buTm1L3rOmRXoFYwZj3MjmVuY2dZ6B8ddiIv9/+NNudR0axIRO/9AZB48x+cfCIZ+oCR1
	 cDGSmh2V+WVEdaDNzEiXomlsj/hIDhaEQisTP1/KVDb1++N58NUnBCcjklaOYBto0JfaB
	 6+fZQVwZcyEAuw97IL5HgbozQENAIJKI5YEc6gCwa64ShA22gtXEI6MBDfu6tf0Qx3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dcZZaDKP;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D8A606A89E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6D8A606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dcZZaDKP
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d21051042so300724066b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794924883; x=1795529683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9Z9GWOoq55CK62xauUtdSr28r0CBC3/vbxHlMVyCWM=;
        b=dcZZaDKPSOmq14t7/Sxy5dES2lKltU7p9ZYImMyJXndzGVnxM62Lr9CtLvuQd+kV87
         8Vp5pO2XmHTH9X9sKeXz/iwTarVuh5G7dkvg/WEZHMKwdjd9hLtx5UB5aY61mNW9l8ev
         NNUv/SuBc/GGKiwdgsYCEVI57KTN7Gpg7kULaKiehxpZla56sTHPvfVuWxHFXPYLANys
         dJBnmmi2topavK5o/PzoxlKV/sMHL71SUamapnnpK1h2wXNh+CstVlkKzGJdGt9zZ8yH
         WH1Pgqr/QIah1Z+06BYF0RPZ++2cW0TFoWEFM4Sp1jXy9Uy2qzx2qNik89oTzO4BTRMy
         rvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924883; x=1795529683;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9Z9GWOoq55CK62xauUtdSr28r0CBC3/vbxHlMVyCWM=;
        b=0B+NCiQdDhCtRCjnkkp3NcLfrdODRl67ZwQfmUdv9KtKE2h2/Tjj8eiNAGIBmaNsDP
         kP/VTMG4CeiR/SHj/JPHia028Tv7k71W905GKA6w0nqFDX9JtWV7HdM99TUCXgGEnd2k
         dkqrzcbW1fRsg/3fYRCIw7Phdzdr2Vz4I2VFe4db5pC7R+6w8Un4fqsd4XSxnZkfwQ7r
         omV+IlWDTNN4xdCucOyc681bPSynYwqX0cxTdgAg9JboXkO7nHTBfyVno/fMa6bUV1cp
         QuaRuFncjLLbHGuzG3KUzKdVU0hNQbh0DEdhV8/9JQkEgqKBAwGrBqvrcQKtUFiTCO+G
         pdzw==
X-Forwarded-Encrypted: i=1; AL+hErFEH0GElJxwY73bgcL7RVYxx8oR5q1xTq5A3+Ls6z70sQl3VACaX7nI6O1cO3HzrKUXNu6Ihffabn4c85Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hGtRoRC6BkRJz+LO1HrMxMRGKizu26Ro5u6PheBk8HxvfxPWs
	L10QGbRQAmaJmbMqSNeHW2BW2Au9KfMS6532VuXeQtsWYoqHGj2TaDZdPJboadh2sGg=
X-Gm-Gg: AYBFou3BwbJD6Yh8WcaTM06DWnjV17KlYvt9EX+Ivq8mKir3GHqIvtHRy0XHejdHsyF
	RpVQPHeflN4Pw44548zqPQH5MVK46jWeJ+rpSb9hdxOnZKhZl0DiLb0Grz3woOg1raorrpC26CJ
	k68KUdCFBFf3gLgnr9VmZnbL2Lja2sXoGvP0cdW5ljAjvzikLdBsc5o7NKlLcT43gP/st2HBS+s
	e1RUmdyWK+qtxhCKxswPu0X1L5dGR8sRe+PgUo8XUadsgHiWhfaqfiMLvqGGNM+DXhuWpT8Dp0f
	utvn9jFN1S+oq3QbdqCazT/ZkJLfPMnsYUXcdEFWhJrkPb5HoqY049e00yC/jvF9GcTNH00t6Hr
	/gNfyxtJHtSNqHauNBg3NK3yvlQj9H68RLVG7MqCVXWUoQffuaLfUCLQqq97o0T0jOP+YFOFlRr
	GsYKkefETrwKgeepieWleRsMnHxUNVCLclPPJcQe1+8eHrGaHdG0orCJZF1ORXo7ewFnj44kzes
	0ffVLdd9HRX2HHoGCHfcwtxll13zueFF99Mz3wsUW5H2Yave8jKXL6TJnpxGE/osIBl2QNq37c7
	ay1BKg9fAjXzKJDWsf6IZULgXtyIK343ZkLACrjPcwmjKsy9/8rNIcVEmeylmnvy/oIU76aEJKV
	2be6xpNgJ/9EQSGTA1aP8digGATf6KoBvTTzt
X-Received: by 2002:a17:907:3f8f:b0:c41:4964:90b6 with SMTP id a640c23a62f3a-c50963bda5dmr1256478766b.36.1794924883104;
        Tue, 17 Nov 2026 06:14:43 -0800 (PST)
Received: from localhost (p200300f65f19a904a5ac91f50e61369e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:a5ac:91f5:e61:369e])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c5095b23afdsm552084666b.13.2026.11.17.06.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:14:42 -0800 (PST)
Date: Tue, 17 Nov 2026 15:14:40 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Volodymyr Chapman <volodymyrchapman@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Griffin Kroah-Hartman <griffin@kroah.com>, Hans de Goede <hansg@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: flash: Add driver for the TI LM3554
Message-ID: <avxg_XjFo88nIzU3@monoceros>
References: <20261116180809.26946-1-volodymyrchapman@gmail.com>
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
	protocol="application/pgp-signature"; boundary="z3hfkeb7q3mzmblc"
Content-Disposition: inline
In-Reply-To: <20261116180809.26946-1-volodymyrchapman@gmail.com>


--z3hfkeb7q3mzmblc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] leds: flash: Add driver for the TI LM3554
MIME-Version: 1.0

On Mon, Nov 16, 2026 at 06:08:09PM +0000, Volodymyr Chapman wrote:
> +#include <linux/i2c.h>
> [..]
> +#include <linux/mod_devicetable.h>

Don't include <linux/mod_devicetable.h>. <linux/i2c.h> already provides
acpi_device_id, so you can just drop <linux/mod_devicetable.h>.

> [...]
> +static const struct acpi_device_id lm3554_acpi_match[] = {
> +	{ "INTCF1C" },

Please make this:

	{ .id = "INTCF1C" },

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, lm3554_acpi_match);

Best regards
Uwe

--z3hfkeb7q3mzmblc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr8YUwACgkQj4D7WH0S
/k4Q5gf+MQ8N0OnagqRh5xzbEfeJF5RFpOVmouxins1dOoDKt79ab3SBiUej/V/V
1wCFOE+4jS2Q00/oLgVxF2yfYQaat4Kwbm4/EeXFAvwSsNJ8kIftlzcu6oVcbmK8
tUW1lD2a2mge2rbchIfe0iqdSsvGDANWa7Bq6TcWjHox0t+4IkHTq3XLmwOKP+pI
/Y32GaGbDtR2tSp2DDNU7PFMxnmVHHfgccQi+vcONmNTSO2RlF06Mw8ZDmU9YP8o
xiLD2c/GqVIoCboQqrnWSsTno8GGO2o7DeSI8In0kJ/vqpI9dWzoTwqDaaBJjrif
bHRY3BS4Z3jSet96NJgHWYlmzT6tTA==
=2wSg
-----END PGP SIGNATURE-----

--z3hfkeb7q3mzmblc--
