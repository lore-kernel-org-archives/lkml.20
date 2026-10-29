Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.161.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793240368;
	b=QH177j48wy+cg6i74l3LnwivMlNb4q8JQpFRM3dtLVCDI/s0ptzDO4W0sNhY3JWNOAy9
	 woANfjLHU/kWZoPetz8n6VhwEb0aJKcKHG6h1GA7akr3XV03F6baimrGy7msdV6qzs0bC
	 kHi/roSkEKCzIxajBlDNuKraGXg5mP4fh9NZHLE2ITl1L8C07gpsgu/GGecuitRo7i/Rp
	 XE7SXQniLuHgAspZFvqizh3oz9sk/qvys45Js2JG0wlqO0JjogeqWkaHPCqrWHME82krN
	 i0657uvC+sYa6teJUw6Q1zpVziJcor4sy0s4fZptwjsBGLd77jhIMqXZsCsHt3ke2uQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793240368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/LiOfXWRHjUDgLhmT1WvxPVPa3QavCe7SpY0favJ9tc=;
	b=ahCzZYFfbJdShB0NCrOFfHjOQGnsNmxkw+07Wi7+QT5ycsl/zN9JmetNWlENKRB/EKJf
	 JQ+VlFAezH9c/FGKWwxqQHP/pEKzMv3mgGlci6TKiDX9B2FaUK3nLfT1DLxMLwaFyLcEF
	 +uUGY2yjk3481l9EEzf21Zd5K8MranwDDacDVj3ZV+TZ3RwGjdBm1FRtm6FP/doxb98As
	 vTpdFReIQ8gSe+mOp3fXHoTRpbNBMChkbGEEQCJFVLqNAQxlx8LOboHc1EtxezS0QHI9T
	 jnyPM2r7KQqkeld6FcKcdgRCWRhmEuTpmAUwhJXnu3Y1po67Yngkhw/yK2kPgegqPMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j84zXx65;
	arc=fail smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BCE606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9BCE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j84zXx65
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6dd7070699eso1329081eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:19:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793240366; cv=none;
        d=google.com; s=arc-20260327;
        b=bub2cQLIfQSz5vAy++9NicDXFQa7+m5er2Av9GaF6/GjzwClssRBrIBTqm0t2+JBmq
         FPOh2YygEJ3jnUBl9Ju2guflU8o6asEwWe26ZRItZlMSoI3UkgV79S33psF77f6iSx1b
         MpGLMeHqhAhlO5pbQilf5Du0KEp5MkKed6VNghYRovgQaUenzODL6JEIShkuHSrjwxW+
         hFGmN6dv/Kae9RI9LQ+gxPQwJPvEsOZfPKMCc2jKRn7uwU3IlOju30BbLQTw9ymI4zlH
         YUjkuvKjwiIuFhXYIrrEhLOuWRYOi6C8JVjn6+yuNOCqJv8xiT2k5Gp9/4auv72R4Tgr
         FhTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/LiOfXWRHjUDgLhmT1WvxPVPa3QavCe7SpY0favJ9tc=;
        fh=9DJKlP61AULQCXSOgUXSoeiGeuznaTckN5m0ybQToUI=;
        b=Z8UzugrPaUKnEwejmjOmt1V5uVEVNsfe6tIpPVbmarFzLTXuozcoXr3zCz2/nrtStX
         9R+qEULBjoXZtZAgn38Gr7wIrc+8dWavL0J5HgKM9vHewS0cheso8Rr50Gg9JZA+guMF
         VpaholzW5btR2TqmP1C4ErdGvsCIOnRH+oRGlEkiO2A9XNvdhNW+KLoIdXe6KS5l9xRc
         0sKP2PfJnE4KI140uy6ty/Nd8KP7lMlnacpvb7vY+LQdOUp61t0AjQageQxOG8iA+ZkX
         RjHd3gDezcVU2Gm3RcawgfmRZmERmzh9RNxkadUea5wCE42ljjehBx91QzBqDCgPLIEd
         3nKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793240366; x=1793845166; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LiOfXWRHjUDgLhmT1WvxPVPa3QavCe7SpY0favJ9tc=;
        b=j84zXx659Vk9rM2x6lrM1tdsePSk4pdpzHRtnrW1nXb4Nsb4f7ZH87bcfqhCY0I1Ne
         D5vfvn9+fFjEbF1mzik6+c67LlccrlaFqbNdBSpyBSYb2Lp0r1589MY6K3Qvdjqe6WHp
         m1nFcJnmYiEBGfFcilJAEiEf2A4iXA5tLq4jGeCTqGDQuyISFoshfXRIXc8R4Q7Fhd+4
         6zYo30I4UmDIOjjo2NWg6t5zYYPkQ7WMO7WG9cU5+0+qygmSOSiz6jrX5wzsPAMXeJc9
         Ikam7P+XLUbKSvg2ZS90r3yBhYe8G+O2Ythgs/fAmJ9uArlV4Pu7evCxpAAwkJBqElYu
         NHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793240366; x=1793845166;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/LiOfXWRHjUDgLhmT1WvxPVPa3QavCe7SpY0favJ9tc=;
        b=09iK5eV7/ZU388CvE7GtoUE3ZuHyU1N2F2wcOnbHxaBb51JE3QvW1WBnJAUg01iQ4g
         O3C9HuMg8iladtl7W4A26ZE9d31/YKA7x4cqqsNrbcWRP7oY6Z5pJ5urp5hGulleZwd5
         HNlYECXeUfcxnp8KXaY/eHqjvftQYkJU8w+Hc0hpHbNisG/ZCG56VEr+pT0e1KlCGP7T
         EIiKcfVhHM2bFcTCY3JXC8QPdsfa1rspZNVgFmWRS6T8znEFZBJSSK/DrRAEJHj2sCkj
         P58gZHcaSqoKeVFhRAwkVDkIymHaf5DN0eau98nqzFK96ukolqrGsNOxCH2kKQQQY3cu
         vjHQ==
X-Forwarded-Encrypted: i=1; AKwUvByR7HoGBOvjMzeZvpJn/9wetwVR1y6ZkMDldENMYUg9mUnwvWpfGTkfJm012O+wmIosIScnNMGVlQpZ3pY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWTKZnqJVUJixI2ZUbMGjeGl5VVJu2q47D2EsNuBVxlCsaNQTY
	VGuFqOUE2OeygcjhIurPShbU8bdsKRjm+uJxXLygOonjVz7M/M5bk+TWZfSLA8kb6PysFWB6RMA
	TydRqGUtndYpmlAg7wif8IIEKBZBkAuJGiCTT
X-Gm-Gg: AYBFou3AeYR+fFzSCWAPwSjc3tcp+y3Eq2THxcTV7JdW33kIY9q8YdtcSSoVZxDprax
	mwNP96YkMW1BF6Kdh9HIPMeFBqnSGcjA40OO6SAa/i2j5UlVs9T0lDYMq7LQuAIlw1N5lRJVVzN
	MmCtnmZ3H4m7hyfwF/NLfj1UBKHy60+/tfoxfPUXsAsp666OZOElG0owu9VyWapfAYIdGxeakMs
	CsMg/hEq5eIGI2kYVb2GsafFbaX78b6Aq70S6FWshWS9SW98JvPqT18b9wJyh/TECWnp2vrufT5
	sWU7R6JgwK2bhwAAaYzFOcLpc2f1wspftX9gUkpnvakjSVBVcArFRIxlECwDM9w+8YPGmvZYk3v
	KiOPPDpshYBN1ihE1k/AZouor/vzhp65u1SS9hY7D6IpoKlqqJeMMy7bwMOW7jOeqE2AiaQsg8C
	fm0lTLbt4VvPriu+D+cq7jaIorajQ=
X-Received: by 2002:a05:6820:1501:b0:6df:2b6e:d57a with SMTP id
 006d021491bc7-713f04d5ab3mr2650404eaf.76.1793240366413; Wed, 28 Oct 2026
 19:19:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-tf-luna-v1-0-53a88f93db24@gmail.com> <20261020-tf-luna-v1-3-53a88f93db24@gmail.com>
 <20261020092316.00003339@gmail.com> <atcbe2O6REJqok2n@ashevche-desk.local>
In-Reply-To: <atcbe2O6REJqok2n@ashevche-desk.local>
From: Vidhu Sarwal <vidhu.linux@gmail.com>
Date: Thu, 29 Oct 2026 07:49:15 +0530
X-Gm-Features: AclHuK-sDGs78YBOmA5Mf81isBK3M5HnFRdgXc0AbERqvLh0UlNiIFbXRQ4I_GQ
Message-ID: <CAFqz8L+fCc19aaUhs6k0a47y=oxhiM9PSgjMgjY0JYH8HN5wKA@mail.gmail.com>
Subject: Re: [PATCH 3/3] iio: proximity: Add Benewake TF-Luna LiDAR driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Joshua Crofts <joshua.crofts1@gmail.com>, 
	Vidhu Sarwal via B4 Relay <devnull+vidhu.linux.gmail.com@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2026 at 10:42:51AM +0300, Andy Shevchenko wrote:
> > > +static const struct regmap_config tf_luna_regmap_config = {
> > > +       .reg_bits = 8,
> > > +       .val_bits = 8,
> > > +       .max_register = TF_LUNA_REG_SIGNATURE + 3,
>
> No cache?

Hi Andy,

The only configuration register the driver writes to is MODE, once
during probe. The other write is only a one shot trigger, and the
registers read afterwards contain measurement data that keeps
changing. also need to read MODE back from hardware since the sensor
can silently ignore writes that come too quickly. I was planning to
add caching later along with runtime PM to restore MODE , but I can
add it in v2 if you think its better added now.

I'll also address the other comments from you, Joshua and Jonathan
in v2.

Thanks,
Vidhu
