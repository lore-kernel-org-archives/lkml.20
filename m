Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794171697;
	b=y9f6CwXZL6MGex9XpKmyOrW9VirkPrwJqUL9c4jOxNM7PsjjH8jHAP4FX+1KYO8dX0yH
	 T6gyQkyuHCmhD9DA32/TC4/OYjj36dzDJ6nyIuY6CkYLPnueCdWk0o7nAscuT0yZPK5oj
	 TKaAyC1D697Zj3Wg80o3ZymENUqhEZTH69tMfe8gYZhODBS6obcnDLlO/inLPJhiAUIwF
	 NjLzpI4X2k+8oycZthi/a5hRaANsWrlsgmeudQonUR9b9LtksolG0NhWqqHwROogYys8T
	 Soj/aLHG+LVZIIcC4DDlFYBTJxt0WBnTaHQ3PtGTZ1JJBosB7PpjlDzPCrA65waxn6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794171697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fjWQ9SIkuGbMHe9AutqeADfZ8JpsqaOjJ5BHz57lk2o=;
	b=MBNuHkhh13vSoKtw9hTVrxDuRzvXOQ97YY6lFdbLdRmD/x2e75uFQozT2m+q9dx4X9GT
	 KugO5RCd+6C3KAwQChM4KkDDQ5GuInHO3X9ByNahvscA+Uvaaxi/beH3wV8H67rwRdb+U
	 rBBVpWspvfWF52c/ObYxM78E3AT0bL6AfliM3OVMXRL4NmrtCbv5c9M+Zes+HXQMeW9Yk
	 ErSmZe4mDKvaq+yah6fjwdtmD7un0OXPHt0vt7hPqWGxaQjT10qNq72hE+RLRBBhr2jM+
	 aP7lZpvHC7WUdvKj7WonIypI5BhiqxWksn7GK1ik/ERi3nWqyLnv3TR9LebwJY4bFdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=jacXIEDu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FFA606A323
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15FFA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=jacXIEDu
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-679aeeddc6bso220527d50.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:01:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794171696; cv=none;
        d=google.com; s=arc-20260327;
        b=SdxZOBXnTBOK7KxXbMYFv0Bira4np66SP48tSG6rU14CD3jW4xCB5NL3Y1ACZN5p08
         k9jBwVbSD+GgugH70t37lw/Ox/1hkugZXOS8uS1um5qRuu03Hp+OkEI+DeFZksk6mzm1
         sKXQUuHus7jXEnKUo5aR6SiANw8TVewgW2oZwxNnsyXXsxA0GtctXEmlmUtgnDCEkt1f
         tk1qEWnujwZ/lnTOTXA7vCPEGB0hDZbn4E3hqhLDBchDMjpz4srT+MLpjNWsSuHt9NJK
         IPTfcOBl8Za8AZ7hqukFmMgWuzomFRCGj04hoRUA7WWvQi2s7Dd/K/7TqI8tHjrkD4oQ
         UMuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fjWQ9SIkuGbMHe9AutqeADfZ8JpsqaOjJ5BHz57lk2o=;
        fh=rQcYY43PCuW5AFOtx9JTU0w7MvTD3VyhADWFBRfYUfc=;
        b=N3chD6hcMZTkqM+AsSEc+66KDqA6JsR6zr5o8pqinuLMrCUyblQoxpTPAOX1t2Go0z
         Km9B0RCbuT9og5gnZiM38iIyMMYHPUrQ6916uGn707dPq7qPDNq3Ef54e9bIXeppIUvo
         aRiBTsGmtkQsNDH+WYTb0QkXbjypTb0zqrcBpADRqjEMb4U+WENjRhiM+SSUcVhT5Tan
         d5Za8xXD2RBH47VsZafJ7oqhWQ6xeZGQxo9lyBKCJSQbRi27AKc+0+w4BNqxcc1Pg8+J
         4JV6Wcx0Xbudi69r8mAngst9fGjRQqf3JUcRvawTytji3w6pFVlOyCw4DCKxDY7S+psr
         iW1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794171696; x=1794776496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fjWQ9SIkuGbMHe9AutqeADfZ8JpsqaOjJ5BHz57lk2o=;
        b=jacXIEDuZzVUrzyX8cuLOulQDg+ZTA8XlNhUJhpJtVrm4sW1l89oB8eBsnkcjZjIh/
         6loC3b5E3rPsGCYvCKD9bgP+zGVv4sKULWcb41nki+XuAHS+iqSIzpz23Vf7qf3zlCZc
         eOGbruocWIIc4+jXb3oFhTO99XQ0/wYDms4AwmwuEUwIUs2F7byoY1Ml1pHZBUtO4d3+
         zbT38VyqlKSvR3xj330yDkqlp6VjOajmjfIQxcG2YOLSr3q4fYfy2vpkdYWINobyBc41
         mh+yQJvM9RxIaxTg7MVsZE6yErF5TqmOB0vJV3g6wrVIvrl5dt0frN3dVf1qYfYgsfRG
         AKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794171696; x=1794776496;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fjWQ9SIkuGbMHe9AutqeADfZ8JpsqaOjJ5BHz57lk2o=;
        b=jl4qgFPaqNFPhhAaIrA2R5OUCkf0LsQgVK6DFYCPHSln5XbaDllZozPVhB5hNea1wV
         Sis+RWGRmi0G7hzjXxIW84E9LREZJfC0AWYw4WIFFIpqvN5TDqP/EUSLCB9U7MwMR0iH
         1/UMI0PUIIh6HLWJnnPGbD+lojKoCjfY3SulSLfYBLfrg8OCdB6Z4aOHE3NbIlpiayx7
         6oo0zLa2ioRUQEnYRbO5kShgJDIUzbriGB/KDF/ianoWI2kuTCb+ba0I81CmKW5QD6ji
         EUyBQoCJyJa/wJ8xQRyuuGgpfY9AVDo+C2bLYJ4Vk6CoCnBLc554YJ++ri4QOf3Ig6kV
         2Lsw==
X-Forwarded-Encrypted: i=1; AL+hErHlcW44MgEASY+zwJTjC8sD8lenIMlPUP6FDAsfwyciGj5M0k0eG7tq+UIDsD/iy7n1Hywp8qZ3gVmFq68=@vger.kernel.org
X-Gm-Message-State: APuU4Z9svJI72j9FNJ2P1h8b0IvQ+VLnyIYG79hyhzvCUHQnIra7EVdl
	TgxNBVXNDJs9p4/ri1SleOir2o44GV5wLueTOdkwCyA8UplsIihgIZ8BDKL528K4wkNU+2ZfXyg
	YQ3twANTy6Q0jK6bH1V2GzRUNKqy0dOM=
X-Gm-Gg: AYBFou0ZVZ8JUC6uKcu4j87vWpeCzt2rqbEZACEu3eRikIqslgPp12k+/Y3T7qIs9cx
	E58tz0Sj82GEmHUTNS0Jze6LumlcZCnTBYD6AV6zL81Kqg9yTDnYE++GnKHfZfWYfkGSDhSP+AK
	9Qy/OlbgDFYVyML8IFjCkuyW2U7bXUFQLFVBjwmRvhXkl0IpLgTx0SGL+wG6bCCV3DQPQo+AeGd
	SexQ9YxeyrCWwZS2yT6cr54EyAbImpcYU81BwWgGBgujw8cJJG6euuEduLEVtXyKtDtx7ZiA8hZ
	t/gbTBfuDOGVHAD7lSRv2GjBdUmDkeaf/NW57orgUzqhFnzl6aE+O6j139WP1HIEPjuCA+N7xVb
	bQt4XVhfkX5GG3N7aswzWod1t0apiF6yB4EY3QiqGrbSNNgOYH91Xtn6M/PuddxV9b/9xl7aEcr
	uoy66l868YgQQCOa8=
X-Received: by 2002:a05:690e:4386:b0:67a:3678:e323 with SMTP id
 956f58d0204a3-67c3d9d34aamr703099d50.38.1794171693858; Sun, 08 Nov 2026
 13:01:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com>
In-Reply-To: <20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Nov 2026 22:01:23 +0100
X-Gm-Features: AclHuK-YI1_ZLeM-O06Jf1zbjFaiV_faZLy9KmuFTZNRq2F63vw1avnq47JKnuI
Message-ID: <CAFBinCCV+rBnfSzY6LWfCU_D=BHmWi8CoZE0aza5BhvWXw3-8Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: meson: gx-formatter: change stream lock from mutex
 to spinlock
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Valerio,

On Wed, Oct 21, 2026 at 11:52=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
[...]
> @@ -85,9 +85,9 @@ static void gx_formatter_detach(struct gx_formatter *fo=
rmatter)
>         if (!ts)
>                 return;
>
> -       mutex_lock(&ts->lock);
> +       spin_lock_irq(&ts->lock);
>         list_del(&formatter->list);
> -       mutex_unlock(&ts->lock);
> +       spin_unlock_irq(&ts->lock);
>
>         gx_formatter_disable(formatter);
The documentation below states that ->ops->disable is called with the lock =
held.
gx_stream_stop() does call it with the locks held but
gx_formatter_detach here doesn't.

It doesn't seem to be problematic yet because aiu-formatter-i2s.c
doesn't register a ->disable callback.
Can you please still look into whether this is a problem?

Also for a future patch (not this bugfix anymore) it would be great to
have lockdep_assert_held validate that the lock has been taken (inside
->enable, ->disable and ->prepare).

[...]
>  struct gx_formatter_ops {
>         struct gx_stream *(*get_stream)(struct snd_soc_dapm_widget *w);
> +       /*
> +        * Following functions are called with gx_stream->lock held and l=
ocal
> +        * IRQs disabled so they must not sleep.
> +        */
>         void (*enable)(struct regmap *map);
>         void (*disable)(struct regmap *map);
>         int (*prepare)(struct regmap *map,


Thank you and best regards,
Martin
