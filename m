Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793573536;
	b=y7rv0swd8llzI0VcfccZ61V9NiSr0TTg1mW/g10Z1qTnczalVGM05H2F8MKOtZrpMYAQ
	 XHM9Agvll05SUwEYvsVs8oEFZp8ovdyDzX9A9+AjMhTptuD7VXmTNjpI4QXKaT0rNq0IF
	 N3dbwaBvCEX+vO1HB9OaU7pWVBcV0oZcjlF8ORD95YT57YwPD54LsBGUhDS7+v6r+SQP9
	 3cayVMT8DA+yCfWivqwez54FcQ6/HfcUoMzL3X67vPMlB3nhFE+hZ6iOu/22y1tmC2ofP
	 X6Eo0d9q7q1AnkyoZ95TNUGyVkL0CRlwmB4Qu8mIvu6hrcCKxI+7dq44wWl0uFLaMRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793573536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eu5PeOoH37NAfd6nk+CLB2nF31owU+T7GEbEN3ieYFk=;
	b=PWxWGFSqCfUGLbXp4qfkdMVRvZ//ZdNveoojsOpqn7/B2nokMXsJLrnydMvwmLXnokIz
	 rNikE7XeiDA2Ufero01wpBPYh1xFAOmIWFwUHUA1zEb6TrMSLWClfJejo+B3LsyMt4Qh3
	 QANMIySNgNxBofo41vcCUD3af2Fd68W8eadoCqG9R2gY+sNAAB0YHNs0rLrEaqJu9Z7qS
	 J0f0EkPDvZLgLsFK3s0oI5yZuKywXtrANCuX2+BuJm15mIhstKEj/TCBk00/Ry2o/LgVn
	 n/eFKyLM0LLmtypkgBJf2HCvedPlndS1mFThrHvWGCYflCfJOfFkOuv0mkQ1lm/C4Nw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=bGeXE1lu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32AD606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E32AD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=bGeXE1lu
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-679a2b5fe87so1975384d50.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:52:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793573535; cv=none;
        d=google.com; s=arc-20260327;
        b=iD2D7OuPOSed0Ad08vSNeqBCHZH+bEKmYblQdTFBXNRta9AvmhC0h5RVamZYRUq2/0
         h6STd8m90OXw61GUT5wWdzb5V0NBOHaXg34VS2XHzekGWO6QYiZyHnyhIDCaZWkd1g+2
         Q/wO3bM0r0ouna3fhjUDinJAAI2X3puPA8up/RPmm6R3Yl9BiFrurBNJr7SCIT8J6ggj
         N/gxVccEBlfU7s6hQYPpciM/j0Hs7hgvUD0xzvmT+HJC+EsbI5BRAImKGHBZXaBIIXxB
         uYZbX8ppeNULRAFofVOqORpGKt1wb25HDUN4rNs9zrvjbecjRlZYvBiYoierLzqyTrq6
         wFdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eu5PeOoH37NAfd6nk+CLB2nF31owU+T7GEbEN3ieYFk=;
        fh=tqmBFwRuOhsdz9HTHkUWCYjAgLFdExMb1KgLkN4ewO4=;
        b=Fg5h8F6+pxMhX3fqY01As76cTDQyAHQBRRYqS4+b+X9+0iT2CNYLoO/jJF8gc4zTzi
         1aYN5QCVtan865yUU9F4EyFhD3woxy0kJltRnh9C8yJsCOIKbzX4qeL3JpL/HQSHlaRf
         mxvDIgdJOk+cs3H65tJ+/l3My1WPmTo8z+n2SbCcXHFZG+BjeJJpCTJH3rLWy1moJlDi
         hfU/UKxml59FhRUpcVr7ra7aAXNzej2Qg4sEdDiwmZDqovpgn6aMd0/Gb6/eZjAFQRId
         xDrb7lThqocpBHS9BO33uijceRFH1/jZs9WwNPK700mtko55a33Lnx+XPawcQGznrZXK
         8ItQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793573535; x=1794178335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eu5PeOoH37NAfd6nk+CLB2nF31owU+T7GEbEN3ieYFk=;
        b=bGeXE1luiCMw3bBTfuupe0ogYgEZmQtxfeFDub8NbPQ7t8tAUp+zRTbt2l1fcRm3yM
         RymSZLhps++0mmDisypaK5p7TbhwcOmQIZXxMuMqFFqK5l0ILxH6ekoFjNOCVIyigd7C
         zRCdfMEK+xwcztJE/K/QieA0ZraLeNQy40BBCv867SwcGxHp23rXuzm6ze/Vm4aZPyq/
         rVP5S4L5x+UefHxWgSfWRA9az620uOZKtHoWdzKFatJwZB1ubvExY/LylSy0t3ayqDsF
         LQvGtI5vQ0fz/82RXsN5PULk2l3FjB6n9nEsEvtqCFentKRUIzZiDeEQH18s/BUEEvOz
         2rSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793573535; x=1794178335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eu5PeOoH37NAfd6nk+CLB2nF31owU+T7GEbEN3ieYFk=;
        b=iInBZODUWOo2NpaS7XNucJ680RXCzr+DdhQNCzzlr4zpF9mRdvmP4CEBUWkvEY5dhv
         /xMWOrVckqis/5WbtgMLlDLiVUcB55yhrVyFeYFqLEjkDd1GI7EA3i+fLfWiZtqpS6sT
         oaW+vUNT/Q775t7vVswIx1Lgc43+35bpCbgXHBeS69vApeFIybMW5Mq3k1Wom6pFoDrv
         J+k6QatmNs/ixC4AcCqMPyzJBFjhNTVkLR8mQncfKzVmWoVkaPhvy2B4tTJL955oaIJl
         FYjhD1/tRYO44bVdaLFq5EZOR3eaHdiUpJFc4NXlA09YA1FNco171e7pQib4YJmFtz9Z
         KEpw==
X-Forwarded-Encrypted: i=1; AKwUvBykPY5se2AzSPmDlCvZ4JdKXe//NxkcvsJkAJMaH643BbFdky5f+z2JrtUTkEJ4PjCwKdyHswmJFoxzBmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nVSYZntGHwoEahF6SDkjKY3lK6lii5pXQOoG6anlP2ENi6xeL
	SSYf0GsnTHhm85AnI9A4Bkm1c9E99Tb3laLKEsUiPCHSqrg/8kQCx+JNBsbyulOcBt+4TTkQMYT
	l1VMkPhl4G++en4nHOQcuNx+udGI8ye0=
X-Gm-Gg: AYBFou2dlbGMJgHmwe4bG08foJX93R6r/+9ZaxAEOaRiMGpJ68h44ircZ6hDIpAnNdz
	KzUbH3z6y53HdjJ2t8wcC91yIInPpgyC38pskqlzHYEBU3iPglwvJc00rTLWpBdUBkD2m8gNyDa
	HYY+ioHJL7sqJ6r0GZqhoW8c2q9ME9GnlILWOfvnyEUf1r/4zX+BGsU3x3PjMMZXNrjvQ24Mekp
	72ChUSQozAENNLpijV/myZd022eaqAEdCsqHa+26VBge3c0ZccOQZSlmGAipHPVDeyusURaHPH7
	yyUbCuT/5vcWTMUoWbp5kiyMOjeQQEb/9Xur7vN4oBy2GQfoZRp8cTwPnWas7Nh7zCXFLmRRAWm
	R5N3jME7I2aTJcJ2CFkwofx6Hxkv986uwsRMf9SkjGlsgLZ64DGPiTzq4QFw8jDxWvHdEHA==
X-Received: by 2002:a05:690e:b8d:b0:679:98dc:b39c with SMTP id
 956f58d0204a3-67ba501901amr5094827d50.125.1793573534917; Sun, 01 Nov 2026
 14:52:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031200925.3364-1-yuanzhenpeng210@gmail.com>
 <CAFBinCBo0C=KABcg5ueDTRSJhF9vmWnPwYHbaMGTOYppOsabwA@mail.gmail.com>
 <CAEDN0nDjYLE5hy7gVLQ3hv1WESVJQWgc7T_8aLqzRui036A-_A@mail.gmail.com> <CAEDN0nBEK5PvkV-eC11XHYG04Occgs6o9_9K67OZn+xtkh68yQ@mail.gmail.com>
In-Reply-To: <CAEDN0nBEK5PvkV-eC11XHYG04Occgs6o9_9K67OZn+xtkh68yQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 1 Nov 2026 23:52:04 +0100
X-Gm-Features: AclHuK-R3xNv9qpm1VWMmHjI05K4ugJP9l_pkjDrq2qiEZoGQf-7YzD1L0LqP9c
Message-ID: <CAFBinCCxfp65Fe0D1UnupghgiOkTB0-m=+L0kNSOUm7DzRFKcQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: meson-mx-sdhc: add DMA bounce buffer support
To: HELPMEEADICE <yuanzhenpeng210@gmail.com>
Cc: linux-mmc@vger.kernel.org, ulfh@kernel.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 1, 2026 at 9:55=E2=80=AFAM HELPMEEADICE <yuanzhenpeng210@gmail.=
com> wrote:
>
> Hi Martin,
>
> Thank you again for your feedback!
>
> I've completed the comparison between the original driver,
> MMC_CAP2_MERGE_CAPABLE, and the 128 KiB bounce buffer implementation
> on my Xunlei OneCloud (Amlogic S805).
>
> The results show that MMC_CAP2_MERGE_CAPABLE alone does not improve
> performance on this platform.
>
> Runtime instrumentation confirmed that:
>
> - dma_get_merge_boundary() returns 0.
> - host->can_dma_map_merge remains 0.
I see, so that will prevent it from doing anything.

> - The block queue's max_segments remains 1.
> - The merge-only variant behaves essentially the same as the original dri=
ver.
>
> Here are the sequential read results (MiB/s, mean of 5 runs):
>
>                  Baseline   Merge-only   Bounce
>     4 KiB          11.81       12.20      13.01
>    64 KiB          12.88       12.80      57.52
>   128 KiB          12.97       12.80      67.68
>     1 MiB          13.11       13.05      69.43
>
> The bounce buffer improves sequential read throughput by up to 5.3x
> and sequential write throughput by up to 2.1x.
Let's wait for Ulf's feedback in the next few days if it's something
that should go into MMC core (either by default or opt-in) or if we
should keep it driver specific.


Best regards,
Martin
