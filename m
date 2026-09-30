Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D34D3750CF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790787865; cv=pass; b=Ju2VXDkqyl3Bl6qYy7zGmCuYWi8g39xtrmMvbXzjlfb4fmP87URC+djkoUsdORXGUPmrCXH+B7idsSX05GyQxTv5+b3Dv0a+EXYZxhSRtosOk4iLRa0Q6K80IQKty4UnfjLAKZP38Hrw1aogBAm4R+nYMZ147+ybl9qWSzedFJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790787865; c=relaxed/simple;
	bh=YPB0OuzgSu6bYeqdbKJsDvFZ0QIOxvCezfQ72jpnedE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K3B+OBGP7vUx8bzZ8ZCBApX30cr4QMB7XxofbVb+VS5u30nwZSjAc5ewZhp6QWvJiAzr5BQkR++kUjQEqpUSkkm0mnpNPBBSLr/6ClWwMKI+mkUg3lqIvJOFF+mSWO59VyarQiEUbxk2xfc3IZ71DZRuWvX20wvNWpYleiK81Ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivTyT5JU; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivTyT5JU"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so3458455f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790787863; cv=none;
        d=google.com; s=arc-20260327;
        b=f8oc+MNruG8SFKvcXltxCxxbdR/JmKI7dnp7GM0hpms77ZSfxI2i/dLY9D45P+NCLh
         UdPmkcN1AN0rL6zRj4mQQ6QlJHHMJs3vTQxaUumTorvJvBxNzpHxPpG/iT8ZD/VkoYIG
         dwvrqbEklWwMVuN7QH1kupWSQoxEOjnojtPOGU/SsiPPpCt3B1vvJXH3FWvix4HTvVZb
         uoH8nouwuIAEjgvR/PtojTCjjA0PI1FvbWgTXnPZrUW4P8JLs88pE1Ihkdtj9NsBNiOQ
         1E9UBAGYWprYwr4dkVaGoBl5FzGHztfL7e99M8pZlSxxho9PBq6zcaJ7ByUjUSwVnuAd
         qWYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zbCTMDLKH8sxYxpZqqOg0zEN33xQKgj6205FhZee8H4=;
        fh=41t64nVPa7jhJ2Pj7MWmweSoQvxudIF9UXxtHIO9nvM=;
        b=X6L9nHW9lFMTbMyT/HLCU6mqA/nUsVicWLe8S66ZEgxMkQXMVGvPDo9fVR8A3SoX+e
         dLS87/nkbqTVJturCZ2AI7qwAA4L7rA5x4TEJLDkSemttC6dRAehJvShPbYsWl4txcDW
         NJTQDoi8sSAwD05IKVgSqSxXuljEn2ivjqQXejG1eqbu+tWgdmQHrQKB7G8cK8+jLXyx
         UPXVlvyBbCF+lm3dmgAh9IxPBlh1DyR/TwTEevFm/9hsQQonPNrlF+T6WkDDUuZCuEVR
         YXFkBPwUos6XwGr2k2Gp4gCLwaZjSIzfvIko9uHZ730GjRfhwkyTHZXzKzf4+j2D9krQ
         lgsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790787863; x=1791392663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zbCTMDLKH8sxYxpZqqOg0zEN33xQKgj6205FhZee8H4=;
        b=ivTyT5JUHKeGqQuEuNbfdAGYblvHXNS4/cO+fgAoTGcyxuty/wgF03oAUMwj1lM80i
         lp0f/IBpZKvT2slcDmaOsfl6LAoSc19DgvJlOJRXn+OQukYfFWu1BlJ5BVCNd3ImmpPc
         eBKqB95iAqIn7eWFOAoQxmZG7v4Y3fvy7vllRxa7mfnOORdW6rbHcVmuI0qVx96C5efk
         HvrKNEKcYn9yTYyFKSgMWj/sf0T2+Cf8L0WFXC7pYWmf85Hu3ttNEybGwuxhu1q4nDFm
         Z4JJskBc9pGj38DTriJuzMWfv1K2RkxK8kfCthViHRDvkGP3q8iODb4iJ0Y5XAco1fcX
         QfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790787863; x=1791392663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zbCTMDLKH8sxYxpZqqOg0zEN33xQKgj6205FhZee8H4=;
        b=ivyAnLTShWVDVXa5EIM8moKBWxyFw7pjk6ymRD8ej6DAsD1svgk8xlduUR1jD+g6VP
         2JoS8G5FqrlRWhifUX7oS2qX4uK5pcZKYSyVRKoBLRTOjUZznY4p5cayzZg2kfONt7gQ
         7WfXoU7wghN/NLQVPuIlnhEzfvhvfjaPsBwFs8FeTd+Z8tuFxpR85Kgcs1xQD8DKAZNe
         WgvEK27cIaXsWVbd058pCNvfMfRTcgsWKwBst2hJjbk8n+5ooWJK65ndYOUqfpzgzH2l
         3f6+BPfmi+jkrLwfTeKqz4Vf5QQaPkmZtdZfx2PTE1ehMzbffPWDdkPXa1Z5jmfgCjkV
         ChTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEptbcHuWgxC6WesZf1RSfC65qlHJAyw2wllHysPpAx/D1STAc99pyZgNT4476OGMuxb7+I7F8AVWjo/w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIK4Lq387P/zsYM9fl7Zh2jCFu6yTcLlTnLf6L/B/jPyjcYwSYX
	1wQVJvliMeRX6GF29bCFGzRqCzofGyLMsglk0i4ZQgbjyJm+2kU59flJ5CFhUgOBjYxWhNQtQOQ
	vI1RinUpwmOgftrodmfZvbt6hn8BDNGk=
X-Gm-Gg: AYBFou16QQN8bmc5miLvlgI0PzM7dg81lPTkizu3o1VfNobCB8otFQyGgvfJZcd8vXJ
	x+4NgcbTMX9EoeS8yfVnUmAH4rE9LWDN0xXBBaW7P3NGgD9dqqii6oXbJfl8+nrk4JgbflQSqjm
	Zp1R2tHTLyYPKreeUA33OhNtewcOfhMYUV7zIZwd0nx75e2Bz52txjPPW5dVMTXUi/Q4zsKKaSo
	o3XzoJV06u0y3yYJmdSSfODreBf8XkQf7VKA0Z2jJTUBV2vGDh9YmqMx5yiff3v/P5MeCX5WqrJ
	vz2Bt/udVGf7PGDbtmqWtO3YmgjwFm3mCAzMSrB4ciNvtv9LcT+9jSFYIjKDlxNG0AUSVySgu08
	TRk9CQNhcGM4w/7ifhX8PP2ZPM5la+NQHgi8cQfIKJpmIYyR74N0T1D3K4Dg2TRlM6W6NkiQQb6
	A=
X-Received: by 2002:a05:6000:4283:b0:487:106f:ee31 with SMTP id
 ffacd0b85a97d-48b02524089mr4421323f8f.27.1790787862365; Wed, 30 Sep 2026
 10:04:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929124248.237032-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <arzWMViKacekCSdS@ashevche-desk.local>
In-Reply-To: <arzWMViKacekCSdS@ashevche-desk.local>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 30 Sep 2026 18:03:56 +0100
X-Gm-Features: AclHuK9LOI7GwX6WVy-CRezdreahkEzOs_5YWlyyazInLnkw8984BuD6XWEzDWY
Message-ID: <CA+V-a8swr65n3hnGA_a2L-uGfLbzAKeQ3TqddjcyC+iWF52Vgg@mail.gmail.com>
Subject: Re: [PATCH 7/8] iio: adc: rzt2h: Use scan type for ADC scale
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for the review.

On Wed, Sep 30, 2026 at 10:28=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 29, 2026 at 01:42:47PM +0100, Prabhakar wrote:
>
> > Prepare the driver for RZ/V2H(P) support, where the ADC supports both
> > 12-bit and 8-bit conversion resolutions.
> >
> > Use the current IIO scan type to determine the ADC resolution when
> > reporting the scale instead of assuming a fixed 12-bit resolution.
>
> ...
>
> > +#define RZT2H_ADC_VREF_MV            1800
>
> _mV (yes, as it's called officially for millivolts).
>
Ok, I will rename the macro.

Cheers,
Prabhakar
