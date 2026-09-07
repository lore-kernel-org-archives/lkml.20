Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25EC3AEF34
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773996; cv=none; b=oyBC6yD1yXrBYU1u1OfA8/jzgE6wvuE6Abd/0T2zirDh9Jo4Nqd22LxhFDyTdK0xuQM+Gqqh1/DdY8OSUMKt4GGHjKDsh3Me4N0zM8Oi5fp+71n44fhDD6Sq/ASA/MFZruF9VUZ/JGUkXuWc4AvoB3jAtW49/B1YZrAlghnsbDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773996; c=relaxed/simple;
	bh=WlL+j/Ie6m0Twd+B1P3rICow2WcfWKryEoGQ+1VVbBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UBvl9/OEwWYP5pqo+RDjI5fEVOdZP/tgnTiBY4XuyaycZFahpjV/m0YIUvMKYJ9lMNBlInSmi1zoimPs2pynaKTX2B3ZyjCTZ0P34U1OYngD4klZoP4RW8/cBr4A7M41fi3TH25e4Ki432QMcHcq/2eNKm0Qx7hVVVnWn8DpkIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-783d429d0cfso2476093137.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773993; x=1789378793;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=idsP1neYZsT92lOTYUcwf/RINlIKDTK8HxAaGpjV2+8=;
        b=Kn0e08RSWlvxcUeZGOFiF2wtQ9Ba5uFvCLygQ7S2NzR/mGYI2g9VpgU5yroUYl5jIn
         E0bQhkT6ANBK/ktUFeSjXtPwTHtV0z2ZR8YsVHF6AKhNNHmE9qDdRR1WpkPu8ujzseR4
         f02hpt7LubDsGve5CrwKsY1RJcNCwnXInAHVnopC6ObMr8Yyg5/JQDq+Vn5NgBjGenFT
         MzW9ZoEe7UKZol5LA290inBufXi15ZCD3+vBH6qoSZobXwYO/yKlUAyiQj5U2hMsjHQm
         MZsR1EdpCQPw6fh5IzzlUHdSEQwRkOySIL8NsxDpJ3T6vyvfDnHfXwIO0/xafD/DIiba
         tdIA==
X-Forwarded-Encrypted: i=1; AKwUvBw9cyKgPQgc5zcE5CBZppCUyOZEIeP9KX+XFmfQj+a/iKJoEq+NAGio+BOTaVwhylaeIA499A+HoetGBXk=@vger.kernel.org
X-Gm-Message-State: AFuF++k85t7g2BtjQqYLwanRXZrNLZ0Yd2sQ406MRj5FGgFCc0U0uxOp
	lR6HbZ3JaMDoiPV5DpsKV2PVT/kgxLjMvKZxvPSzz0l2NsKVYDyI9tFcznLASTq6
X-Gm-Gg: AYBFou0CvSL5RcAmBVD4LJ7Fzuikor8ltNX9+7EPiODcUsMK0FU8SkGSaCOvGxDPgTr
	fMh7TTykncBFF0BTuzJI+InQcIUl8rZBc3M79F45+0paBdX1LvErwhm0s1+E5JjJMAvL2kCXFA3
	aiNz9+pPZMdivMS6PgwLkRH1hZ4GREQL8YgBqoZ1YVrFFdzitYvF/EcHZwuUceF45JCoN92ErAx
	t2K3rwH3+yYaHMkwMq6ZrIp96AhheJ+elzf+XgdSuMK9axSrf2b5PdlB4i+TGXScds5tLKHzSXu
	tCyCnSdUCOdQZ45tpumVh2iPrFPyi6JuV5MmWf43EGM1n/ZnHp1JfBN9C9xd7LPe3JmmlckrzDR
	GG36eIO9WZdvVQfZ2D9Gh+KH4LlUgNxA8MBduIzxy8CVqUEchP05tNDHIQ5AL1ccKwTYtFwxCdQ
	4iXMw+QEtIH18jyz4qSVB1+tjzFpH1/mk7fFXc6ApgPz2v/937ltG17eT8Hor7gVs++9bfO93zR
	DtnyxsdB0gNmTg11zXUXlvaYRl+lA==
X-Received: by 2002:a05:6102:334f:b0:786:dfc0:2ece with SMTP id ada2fe7eead31-78a4ab0d88emr8170320137.11.1788773993511;
        Mon, 07 Sep 2026 02:39:53 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47ae8dd2sm6769123137.8.2026.09.07.02.39.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 02:39:52 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c7d65c83feso3200490e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:39:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwwi+aAsouxWPmEqVlvKWt7Fqh9ggrvkI+zbqn6g+gHiK5PiFUXrTAeFDQXBV8Ag9QS8w4JOo//j9w6W4s=@vger.kernel.org
X-Received: by 2002:a05:6122:c8f:b0:5c6:4bab:4cb2 with SMTP id
 71dfb90a1353d-5c7ed80403dmr10646528e0c.6.1788773992044; Mon, 07 Sep 2026
 02:39:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907090956.2825703-1-arnd@kernel.org> <20260907090956.2825703-2-arnd@kernel.org>
In-Reply-To: <20260907090956.2825703-2-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 11:39:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVc=ntgrDDqdNUzEbeQ=qjh7Pw=B3TSN+qOD5bRY4_i+g@mail.gmail.com>
X-Gm-Features: AcwNN1Wp7dWP-FBPz6xYVraXlAq6_uFTgT8pt9uLR2DvecmC1uG2AIElIe46m7g
Message-ID: <CAMuHMdVc=ntgrDDqdNUzEbeQ=qjh7Pw=B3TSN+qOD5bRY4_i+g@mail.gmail.com>
Subject: Re: [PATCH 1/2 v7] gpiolib: turn off legacy interface by default
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Gibson <warthog618@gmail.com>, 
	Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-wireless@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Sept 2026 at 11:10, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> All users of the legacy interface now select CONFIG_GPIOLIB_LEGACY,
> so it can be turned off by default and only get built on platforms
> that still have one unconverted driver.
>
> Allow turning it on manually for compile testing, in order to keep
> the build coverage of the legacy drivers in allmodconfig and
> randconfig.
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
