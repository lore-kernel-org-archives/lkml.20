Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637014;
	b=CTaLLTefanZrf0gWx6WLFs5JxBrrl6AKITWdX6VywemmgBwZ0Tud4yd8W0F7Lm4KtmRI
	 uj61Ez5VrVnvXoA3zHfqp5Sv8fwpW6eVOyrnpJ2V4AIeY73b7cEEp/2KueRrFzMF+I1xf
	 7qGHLJO1FDfok6K4D0TNW4hWo4gN2x9N0t+ryZaWL02dBO/6By1+r9dYlG70MuIaz5rCY
	 atS8j/l8Q9Xd7YDK4tnnXe/biUgarUCcimXAcZkopH0RUkRp//0zr9PCSHoE6ctc+CXEm
	 khd0dAJ7LeVWgL65ZuijtVnEzrkCq1rSFF2CjMPZSpBagQJ/qXzXUHwAAeWEt2eC9Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637014;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=tQ/DNk7a1iTmjw2NtKHat2WmkFC7lCI9EiNUytx5K+U=;
	b=coyCo+MpbNJ1Ctv/VauClpS/2xHVgIKo2AOxG1MgcZI0olD+VBR3QKucPmRWGjl3hLHa
	 44UbVK3xx6AXseiPGKSb+DTkcaEDklqXVnrVPzkXahVNSDrQGbs3EDyiR1VlEjNeLct0Y
	 l/kQI1Qjvg4+U1/VMq5AEiKDhGV2e55KAEZZuMqXzJ0RTMCnrAfphxDTvAlBiZbcOWaoY
	 D+WIPHZJb98MLrQg+MXtn+z4qM7ELlNK06qz++R3hi2uieVGgzgEdOlS49H1cxmwK21iH
	 px3Oyau9R6BJZDekxfr/3+QqLDn6ETmjl5flCkLsQsKFaWEBB4U/Wq5roDlt2bhwPUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4902606B0CF
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4902606B0CF
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7cc365db987so2226559137.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793637013; x=1794241813;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tQ/DNk7a1iTmjw2NtKHat2WmkFC7lCI9EiNUytx5K+U=;
        b=YsQNCCNMUKIgo47KicSpgw7mhpj+KPdNjJRSr94BHlJZFAbo79lItKR5u5oUkX9URL
         YWeuOGG0Ze4GVjLNNIauUz2rqaerLjeQPTB0fNwTV/qZnD2YQb+/sQpfCTlJdwr7n0Ne
         ZT7JG+x0czorP0GXB6N1ZDgATtroNn+ma6tmQQrJifucC8r6y/TlnwkFFr1q3H3x1SVU
         gbgMQAHnhgH48Acherz+IkdsagHGmidHM8FO5yh2/7P3Em8QSLSJjP7+rPnuIQH1btKr
         Ok8IiqvyYCGGXR7PFH/1EItH4y1g/3Tl1OafgRaKQ0A1Cr+V5KYtJljBfT6PMuKT5Wfq
         dQQQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+B37HymeTTFHkv9wBnxlNO0yPEtqFVdxoCd/+aDhyLL+wcSj3JJtO688gVlPq2S9pu8NZs4f/gUVTo2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nvekyaKaD5pnn8XKgNxoO1rsmrpRI53UC71d2Q+JGIe4FcMnW
	sSsm8nrki1R0cGfnzK37W7bvMEYBgW4FmIWAymDOIRt8Uuv0IG/SgGPwSHv3iGJmZyc=
X-Gm-Gg: AYBFou3s63ugF7adiSpWzKp3FRPYAphcJQh5vpQH7siQh+KzidvMRC05YmM/Lj53Tnf
	qH3qfZqxjwtej1QZkRoFfStJxf//4mcrczkycw8MOOjxgjenr3zr4ht916++z5EOPz3WqHZMmAh
	eLSEXquv9yg48BQFZDs3fGjOgiq5tJO791hKEGoIhFLiHnGHwfcmoX627O9WgRO3zWB8COPhjAG
	XpfV5J5ofSYl+BHNLcbLHI0hr3EwcKzdCneUyMsFCfrhGvLvujY4HtWP2SyaJYwX/m+ESlfmbi1
	2AeUGKWlcJt+Oq1g7F64pjwQAgnnbc3c5gvqdyxFeIbUOjxo8S28P8DZFvu3dXKJveZLLGfKQbc
	hKXiL9UpSzfq4XBe/h92Y09TRSLv4UFbzaj5oc9GWgpe5YeTE3aQAckTe+UIMW0WgZeZRT9uEqk
	j2T/VphmCUFUpFxA1V/OZZ4KDehQw0ABCkmZLCW6PhteCwHXnGjq4IPIDEzYOxDCO9lTJ3LJcM+
	rzsHKECmNDhcytTeKVan0Gi7a8pHJmZiI+ygnXOpDoNbAoWlLHK0P+H5pldu6W9eyL6hW06CCwl
	9GPt0ByLe3FS1UZqzaQEMRn5arHEWYcqhg4nHag95z3UD5Wp/dtUTwiOtQEJo3h4MKg2MLtiB/s
	3ETxl9HlgDsHH
X-Received: by 2002:a05:6102:604b:b0:7cc:25bc:3b27 with SMTP id ada2fe7eead31-7d07226d973mr3598108137.5.1793637012548;
        Mon, 02 Nov 2026 08:30:12 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d077393404sm10274623137.2.2026.11.02.08.30.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:30:12 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-996eeadfbeaso232346241.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:30:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy8cMB4BZ1tgm/BCPjtpQXWvRaYSASzTxFe7k/NZ1Fl8LSiLHa6UHj2m54ebLAqWostUgyaLIV11fFUFzY=@vger.kernel.org
X-Received: by 2002:a05:6102:15a2:b0:7cc:776:6c5c with SMTP id
 ada2fe7eead31-7d07261533cmr4465421137.7.1793636702714; Mon, 02 Nov 2026
 08:25:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
 <20261102093206.50b6c9ad@pumpkin> <20261102-smiling-binturong-of-gaiety-f64c1f@meerkat>
 <CAJZ5v0iOJ1r1OvYhV_KJSnHOJL+oVUrbOXizLk0kbGNiep7a6w@mail.gmail.com>
 <87a4nrfgjm.fsf@trenco.lwn.net> <20261102150535.6c5689f6@pumpkin>
In-Reply-To: <20261102150535.6c5689f6@pumpkin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 17:24:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXe1xxk2ZFJ=yr=7z1DUs3oRNfzHw1Ls1hftcGnmoNwrA@mail.gmail.com>
X-Gm-Features: AclHuK-8i5UubVSnw4SQFIo1lFtZYZ1lQPWaRR8ZSWJrkN6Qpqf7rWpkXGAuxvE
Message-ID: <CAMuHMdXe1xxk2ZFJ=yr=7z1DUs3oRNfzHw1Ls1hftcGnmoNwrA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
To: David Laight <david.laight.linux@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Joe Perches <joe@perches.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, users@kernel.org, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, 
	Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 16:49, David Laight <david.laight.linux@gmail.com> wrote:
> On Mon, 02 Nov 2026 07:34:37 -0700
> Jonathan Corbet <corbet@lwn.net> wrote:
> > "Rafael J. Wysocki (Intel)" <rafael@kernel.org> writes:
> > > So it occurred to me that it might be actually better to stop sending
> > > messages directly to LKML subscribers and only make it available for
> > > download somewhere and as a Lore archive.
> > >
> > > Is there really anyone depending on receiving all of the LKML traffic every day?
> >
> > * raises hand
> >
> > Some of us crazy people really do depend on it, yes.
>
> I certainly scan it.
> It is also useful to have an archived local copy that can be searched.

Indeed. Sorry to say that, but Gmail web interface search is still
much more effective than lore web interface search.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
