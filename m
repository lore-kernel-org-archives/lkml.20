Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794293754;
	b=QwXJnjxV09prvWc3UBK9jRvjZg3Dnq2U4EG8TDgyg1iJN12F/MnaW+v0eRtQNzGGCSJ4
	 ACLv9LKd8UZ7uOsldjjMX68FOONFqodBzlesNwPMb/9dtE1R1maG56XRV5Zv9HQ60r5Jy
	 SleyUxIZdXK+3YfeCkfaT3ivY4bagqJMGcAl3B12ZBv7Zcp6YhcrYekSXKS4DVANuqfhu
	 FFOcaq5mH6Fk05sSb0bUTYqYVAP2R+C3VyXlECqUJhtblZy0V57Pabr3qgCk0jSjOhocp
	 MlAIF0qPIvBCdiJGL7WpxQhEFzoLdgTwM22riRxiV2qKZaIyIq4V5HDBSVbMRSRHsPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3aTmEw1cmKfvZxOC/KfyfgUg+Qvb/ZBdPdJ3Gf6JPiA=;
	b=yZaWuQSjoLX3l6UgmdzejsNhPBC9xAuuYZPsZCZJH9lpya3291zh4mEr/R8pmOVDMIoo
	 V5AZnb0b47msSrXcQNZztx3tkV1JOZL4M/ZVfmgfSaBex+AR6+MOwzBw1h9TDh3F52Iqj
	 ONkAZnue/UPWRFoAzuwvwggBgloCSTi0jUiyp/0VMK3pLuFU5T8wE35trgD2qHk8bkMg4
	 Zajj8bdfKg1Hg6JrkEDPpF7Dbt2JhTLKzXDm7c/vSFYLrzm704Y+oKQpyLD3s7BZZ5A3v
	 /MoY2TZgvmiV/2YWgeJqyCnidmmUbL3tpJmFcBgD3Hxe+igMlGWxdDoCHhmnPt6swGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nwIEfiq5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A01606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A01606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nwIEfiq5
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso1161376a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:55:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794293753; cv=none;
        d=google.com; s=arc-20260327;
        b=HGE+aoC6/nYClA6DMElw7Qk2BKd5PFpdzfBUhn0cl2Gpm/WGNFRElEw95IhYagNTZ5
         OOw7ISyme/inVy40UPIQces0iVdVco4QgztaWUj1g6PLWf0djtNRYi70/0hDcEJzM+5z
         rk4CF5sbwgvtRWTnqRXaDosxWpvOSn4ku97y5J2OXkWgmjq9I6eLR1W/NazBTR/kGP1X
         hXEVlehmBKR3HrDqrWdy2ifiR9oEgAEcp+OtcA9qVnpdj/L4/HgjMevkPnnXjgiBPevb
         xZPu1wSKyjcvCbD71ESrNQT8bDdIWyGryMRqML2NHJJRJcQwdcWndNBeKttNY9b5QMPp
         +E/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3aTmEw1cmKfvZxOC/KfyfgUg+Qvb/ZBdPdJ3Gf6JPiA=;
        fh=L/s9b1CKw98zr1eqkZ9UvmX4+zA8qLF8x1QBqmz24uE=;
        b=H/9vL+mPmZ8C0eWSiucxmT38Lgxi/iC9OL8hcjtO/+b+nnCLmzdIXV1RHOGatacYi0
         l+MAPPOPP+EbZnTmvEgZ1RQLvz6Lv/1mG9S6yR1PnGPyMAk3WNdqo8mH2CBYDMv0mYzZ
         71xuWzg/DXTW5Fe/baFYlxc7k1IDAQy+eFpVAh6cOavj6TR//D3j1gXm0uugQKaHflje
         TJRIeaxxZEjcQwHr3yjGMgVSekdfbD5dlnVGc0+FZfPNGbac2llxwozyxUJbb3A6EnaO
         Mo/O6HyHiCRkVJ/XwsqZzYDSbOJ4P+akvp7oFZ5Cd7Fkh9Uns5pMYsPcMOg18QGiatBN
         7QQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794293753; x=1794898553; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3aTmEw1cmKfvZxOC/KfyfgUg+Qvb/ZBdPdJ3Gf6JPiA=;
        b=nwIEfiq5SmYNbB/BtyPVYzVZpcpfKpqzwyDrpMhQb5Lw36MxfwSncZCBn3aZWyGPu7
         BbtlByHVjCSMr8SsAE+ozfLFF7UdHigLmHrsgHeeXFMRxolnLuIC1b/toZy1Z2o3LDgu
         Dw7VhQWwT6GqtpCOU8CoWoHVwmH5Co6Y7Wz8mFqTtbOyCmF7I7mL9C/7XBVXnM5PK6u8
         1FWHw+pBrIF9JyuCXNRcn1IOM/UYLIpx40yLDuClmWGIiNI9k4ZVfpSMOpXAcoHEJ9of
         2Cy7eZXqXz8E4Ksssh6ShRN0wGreKsuITQ8fEtvTWQLKWgsf9QLpNiU7AJY8m1hm4wV2
         NBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794293753; x=1794898553;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3aTmEw1cmKfvZxOC/KfyfgUg+Qvb/ZBdPdJ3Gf6JPiA=;
        b=DFLjAWnmW8SCSfpU8IvONYVi88SX9uaTczomCX+e2w3TpdQl69fSIkHhWkcDyWToGQ
         1AxODX4LWHIOy8ddIJA4CejXQCadSqmO7ifHYGJ1l1FPM5FfR3zn1OeNUPpD3h1IUCGM
         HHxqNe0nf9aUmdsLu0Bo+6pltNVxJIUPYPqJgVqCc2aoC50U9v+VXJvhGwOjSLagnzUE
         k8qlfzVhMhdA56kJlMEDyxZ3aZV7JBvX+A5lwXYPhfEkVflx/6MJJeYotp25RYCOklSH
         v+7BDq6pjKXf4uEWmYhA1SZkY3jePoK45fB0n8AGZ5Fh6SUv0XzRQR7QaZNchuYhAHEy
         X7kQ==
X-Forwarded-Encrypted: i=1; AL+hErFWuQG/t7f30UH32/uWJVSdrrws7TI9H9KGlp1b5FfbOvabwd2sNY4aGsYgYHDVui6KlxWyF6/owL4sNEc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+i546Dr/ueS72olnVv/KA8TDXda58Pv/y5juTxezaDvHxopsWQ
	RQJSXLNSO3jSjZX2Tw4QtNyWbqC097jjTGjg6T2kdCRl59r7u8N2mzjI5L49uj185NU4SrY21hy
	3ThfJjZ+45KVMmpE8Ydi1h5aq4QnE8Zs=
X-Gm-Gg: AYBFou2VaVLetb5eYh906rTjeR33Gl5S6TDpseAJKN7EA8WixEjuhlTZelFYTqMrrdw
	crFXY78kDBSpC80z2FmGklfyq4OQM+8tRmjjSTjobJDgVLk3alx7fBX4YYBgALck5cpuwFeTka4
	jQXc+Jv/0zooGJVCV6AJ/R2mtAN9NdszbFzfNqE8h449dYaNAGtNqOd17twNR31B/sjUNgNUH1P
	0gN8nnoqTcNZ3U8dtTPCzewCJWNPvhj+aUTxEKyQEJSQDzIQfGW4IrHrlCTXhy0ctwvd4FioWZ5
	jUqj/w6zWL1Hr+/CYxYE771beqpjiGkhAfI4lzrmZD9eA1d1p2BLMJaf/FT6bJJXODQi9qNwaiu
	gCJjfhSDZJtX43M0OQgunENjBRoYdS3L2F/PdQ67zhlFByR4HvV0rQMI+saPQw/MqxxcTx/InmI
	7KHQg23s/797KzHTa1422xKgDKYLb9iKtLFRT+1/t+T//62z3TvA==
X-Received: by 2002:a17:90b:2810:b0:3ad:eb4c:26fb with SMTP id
 98e67ed59e1d1-3b166c84fccmr2048262a91.23.1794293753109; Mon, 09 Nov 2026
 22:55:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106112940.53550-1-phucduc.bui@gmail.com> <20261106112940.53550-3-phucduc.bui@gmail.com>
 <3be09e84-f36b-4718-aa83-176bce5752c1@inbox.ru>
In-Reply-To: <3be09e84-f36b-4718-aa83-176bce5752c1@inbox.ru>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 10 Nov 2026 13:55:42 +0700
X-Gm-Features: AclHuK8Idky8GO8hJSzXW1aBKXpxIRe-zJ31F5xwaXf6ppIwq9lG0SK6KiOcHBQ
Message-ID: <CAABR9nH6WbA+XzubhqS5=1KkRxhq2aqV7R9iJ6-j0S3OCYZ0gg@mail.gmail.com>
Subject: Re: [PATCH 2/5] ASoC: dwc: Fix error handling in dw_i2s_set_fmt()
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Andrew Jackson <Andrew.Jackson@arm.com>, Mark Brown <broonie@kernel.org>, 
	Xingyu Wu <xingyu.wu@starfivetech.com>, Tim Bird <tim.bird@sony.com>, 
	Yuri Zaporozhets <yuriz@vodafonemail.de>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maxim,

Thank you for your review.

> > -             dev_err(dev->dev, "DAI format unsupported");
> > +             dev_err(dev->dev, "DAI format unsupported\n");
>
>
> Should the typo be fixed in a separate commit?
>

OK, I'll move the typo fix into a separate commit as well.

Best regards,
Phuc
