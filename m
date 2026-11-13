Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794564528;
	b=M9A7RU9kAptpmN0g93Z5hFAJ33h74lDsxNz1WeZ7juHp+HqXzUZSSYpBPceQcBI9DNYC
	 u1tePvyD3AUUtjipSDEBjQywmpLN0eNnuVRg9EuXrUGmTllSOGQ1DWe2lmU0yx4Vw2ozq
	 PN2uo6hSL1vzQA2cbt4OpPfqEtCrydaMSFQ5OR+3oFrYFN9hkJAcl0078XMKCwLqYsICn
	 6NYoZQUR/3wzSK2SqcBaY9fJMFm6lK0JuZcY3qvOPgsfUKZbtBNULkR9xRV6rMho58k6v
	 lxDvEj9y7J7ByvXDj70YYwQGhyPRXyP+KhcRqh6dWZHrOAwXfIY/d5rsVoQdq/0rjlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rKWOW9+LLEImVEGgv+UL91WRNiS03i6s+m/NnnyTegE=;
	b=wQauPfE3vHS+0JerfisFINYuW6RvDHUbbQ98taiMWQWIOhXBYWYfLjk1K3rWDSW21HFC
	 dktSS3ECOVUy5geGAwehWnS4/z8+hbKS/DrtPxcCNZwaYHL8xjFth3HyCVhEtsnvWTM+j
	 UU/B4DsQvG0bK3ZFedWVESXCK+0HvOSaVHQb7pMI1pz9PmRIY1qPSm+0jKL0TbzHLofNS
	 gpBNbzH0OZUTCkC2tqvNOh68Gy2HVizSAd0iwrdTGhJ8f20NLa0HqsG57bQy9MYXa6A1z
	 +VLj0NouqQoQhdB1VPE3gEQA5LN5xXCGQk1DUcbaYxLZn8JNBBAyC6Bp1oW9km8hl7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOHjHrKw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024D5606A887
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 024D5606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOHjHrKw
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b31448caccso6569567b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:08:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794564527; cv=none;
        d=google.com; s=arc-20260327;
        b=bXZaJiELAZytHlCfsXW8esp+wCWa4ryQTBZh1jO6O7bjrvQw1OevLjJtkLFyAr6H7d
         upQBqp0pZLoLqsafcVRBv0Qc7l0XK6tOr2sNzUE+bZ5xXTnCqILBJCF238XP/1rj75x/
         gFP17dfqmwUp/PIT6dOu/mmHUFBkPgRsElxC2sV0BkrYZIt/HVjblT4FIF1ZXw3QD4RG
         G9sIde98kZDIOAj7KqLNP3HjKLevTxFEpJJFmML5Eh1WGeYCCMPB1GtERUYNDyXQamb3
         xijFOihjcCjkwaV7ktBbNvMys9UV8xo6n/2l94D4row83DXH7fVXNU382vuZ0B4A2C6B
         GYuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rKWOW9+LLEImVEGgv+UL91WRNiS03i6s+m/NnnyTegE=;
        fh=UgfUMWao6LaCMeeOLdvaftXdxMNU7FS2RrXHyYIGzjA=;
        b=Q3rsO2IuHO9esdTCtfX6E10B6NJKWsZr5hn+oMcsMLL2AAEv8aMqlM5bDXz63oP/7S
         uedOsfgzOBMloEbdlTm4DiZOfQlcqJ+8eJGmTZmsrl2IHYsyngU6knpNL+ReH17lWV+a
         sIkBEVNxnLd58aRt41bo7OE22/LnSgAXu0j13lkIdma011f0YHTzD8pG6Y3quGHhYHXj
         vbHe4K8eGbIruXDYFM7puynXDThNM4S01kRjDbhQqmg5fKXZOnNMMNe2KyhKUKU0MUsF
         Vua+OVYaICO97QW5C24ATdUHK1/j4xl0KYV+zbG5pPAULK7MpSEXRwCDs7nk9CtWLoJ9
         Wk6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794564527; x=1795169327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rKWOW9+LLEImVEGgv+UL91WRNiS03i6s+m/NnnyTegE=;
        b=JOHjHrKwW0jJI5tHFSRlGlzX8vgF5h90RovdHP10mbXC0f3qrowCJW//O8BBklbmGZ
         ytneDq6zTIO6t8z+Dd/cTaDui27l4VySHAZ0TtoxlOq1lY3/hl9tqfQWADCUvyzj8Y9O
         jtyrS7CgL9VoJxXQFlMRXX2TA3qm5CV40l8rLoBq5NcrhVN5F9HYfoaTwS+RP8eylsDh
         lynaOrt1ud2snOnot19Br7JRxY7AZY+6RsOqxTokjJhvaLT0MfQsl/quo7ylCeHy86cy
         39xtGdWxCEmiBq0Gdf/CfuKXncUOs1wF7goPDv+aIZ9cdto1sjoklpl2E2a3d9Tur28Y
         QTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564527; x=1795169327;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rKWOW9+LLEImVEGgv+UL91WRNiS03i6s+m/NnnyTegE=;
        b=RWav3rzrjlZ5AsSiI65hkac+z/Rhzn0yVXb0mlfq+lWZUEEq1aEAwKoVqFqs5m7DdM
         W4c4kB2GIDiTbjHrflowBqg5K2y1m48wFfbYwDOF8Gznh/Nh9nWcGcxfNGLij65APEwt
         els2L77al7ij8kIrdJIkJ0h3HSIKsasu8iNvcEFf9k0icPUv5rJ0Lu7THkmQFcoJoSil
         Rnz13eS6VbEwIUoXHFQ52Bar2jmyQzZJ08sXCaX3+e6ed7bdDw4Ht9u4zjTHO7dMgcb7
         euWINXVcWb/37YwNJDm6SKGRluNuLavRUqFAqW6bACFzkgE0NCZJ+bA2vbtKpz1EknY4
         BJNw==
X-Forwarded-Encrypted: i=1; AL+hErFZKpcmI6oKe4S5KZMjd3pd4xwG8rCAku+XBGLUYgHwnicWXIT2hXglZTjtLkJU/7MF7JYyXyRorCXH3nM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9t4RKybNuYouKEK2z2Zn+fAB2yiLKG5MI+JFBY1c5e/LmhSWQ5
	BoCQJ6ZaXgO4U8NrfjyUBD6TMXxi3+5y2q2V4CrXrRY/wrtQqOQJpsUKYZvHQVW1pZo5aN02YKd
	30O8mfe0IEWKkHdlWOsn6FCOAGcKoWDs=
X-Gm-Gg: AYBFou3zLJjQoSRmXt7mhip8TISoyuyKcSy6NN1KvB9FkpRjAUXqNKscAZJyIPDx6uG
	1OdlMyabFepLEu65sChFX2B7lxTWscAmk3tNpc4ofAgC1Qy+ale9CRCgaB7qT1XFe0lSblsTLIA
	JAj1a/3lJUIdkDiPyJNo32dSIPcFTRhekDadU/b9CvSqR0KVNFGyb9QOpE1xjzVpgUJnZ+rFYVW
	jsMyNjxwyId1cF3U9zqtApz1iXiSQoJn+uecSX9cnTbONCEzhbZSi8K+iRoPVDOJsgWY6VFlqEa
	4UNnYWqI5YPqILnuZBX6V1g3dfm0sSY7nabl+rbE3gceHUZKwgmar5DyyAtWcO+Tx216dtLrF2h
	ZQGj8LDBo+9levjbMILVB5crpFKUC5JqLcJ0j0D45f8KNwCvHi4ggiNAriSTRNIvH3slAkjedQd
	v19+rP/X3h0QrQWKiImuzWONfwDqTl6zW5IJC0oZd/Drbj4sznbOJLoqSOgsI/mqtiv4gwrT4HJ
	O0j4AiRRTUFuDtdIOpUK8Bjckj+F0rDDWzBeDVo+b12/6OeF4mGdS8KAub22g==
X-Received: by 2002:a05:690c:e1d3:20b0:8b3:4f53:91c4 with SMTP id
 00721157ae682-8b4aa326b49mr10197467b3.29.1794564526979; Fri, 13 Nov 2026
 02:08:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112065037.1800467-1-dmitry.torokhov@gmail.com> <20261112065037.1800467-5-dmitry.torokhov@gmail.com>
In-Reply-To: <20261112065037.1800467-5-dmitry.torokhov@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 13 Nov 2026 12:08:09 +0200
X-Gm-Features: AclHuK8Y20CK-uRfjZMkziALZSmbzxcenVC4HU4NYiah5SSa7aVtNNizdoU07Uc
Message-ID: <CAHp75Vcta1YuUfLkxh96NoeOVGjn=paTHXw8ive=+kS9pvBoDw@mail.gmail.com>
Subject: Re: [PATCH 4/5] Input: tsc2007 - do not register input device without IRQ
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, "H . Nikolaus Schaller" <hns@goldelico.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, Andreas Kemnade <andreas@kemnade.info>, 
	Johannes Kirchmair <johannes.kirchmair@skidata.com>, Yuki Horii <yuuki198708@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-input@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 8:56=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> The driver has no polled input mode and only reports touchscreen input
> events from its threaded interrupt handler. When no interrupt is wired,
> the device is used solely as an IIO ADC, so registering an input device
> serves no purpose and creates a non-functional input node.
>
> Only allocate, configure, and register the input device when an
> interrupt is present. This also allows removing the unnecessary
> ts->irq checks in the open and stop callbacks.

...

>         ts->stopped =3D false;
> -
> -       if (ts->irq)
> -               enable_irq(ts->irq);
> +       enable_irq(ts->irq);


Looking at this makes me think that if "stopped" is tightened to IRQ
enablement, the IRQ framework already has an API which may be used
instead of having a local flag. This can be achieved with
irqd_irq_disabled(irq_get_irq_data(ts->irq)), but this is most likely
for the other day.

...

> -       snprintf(ts->phys, sizeof(ts->phys),
> -                "%s/input0", dev_name(&client->dev));
> +       snprintf(ts->phys, sizeof(ts->phys), "%s/input0", dev_name(dev));

Perhaps scnprintf() to avoid compiler warnings?

...

> +       err =3D devm_request_threaded_irq(dev, ts->irq,
> +                                       NULL, tsc2007_soft_irq,
> +                                       IRQF_ONESHOT,
> +                                       dev->driver->name, ts);
> +       if (err) {

> +               dev_err(dev, "Failed to request irq %d: %d\n", ts->irq, e=
rr);

This has to be dropped in a separate patch as dup. The above API
prints the very similar message on error.

> +               return err;
> +       }

--=20
With Best Regards,
Andy Shevchenko
