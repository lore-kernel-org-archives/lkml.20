Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5E9358381
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790575500; cv=pass; b=MC5EwMwOWal1q++m7QFq5gRQVyTumMi1ytpJwx0ARDiD3+4XX16XE9fcjsQHZcqEHlzQkKfJMe5tNA33vTtZ3I/z5dZLS8/eR7t80RBpnFognJkvYxCMEBNv3UXTLwBvimmhF5QqH2KJfQKY44pBI1bFV3pm12dG3Pdsv3SrabQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790575500; c=relaxed/simple;
	bh=GYLuVesnje3a3q8fx40L4GXeBGM+JoVDaVm2RxVQTuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jajEVAI3bGM4O3lBWIeXcNFDw28Xm33LoS/J2wEbDc7Ufxz+MURWK0i+zCRYfYc1jZJwNFsqrPun0pzssd2cNlCixIZysWdpx94Mo4JVB+yEqGaHgZ65buPhBDBEzPOMcRclmZZlpjzoGHoq6zT/Omb0inRqmwN5DbMQcGJ6Iuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISvg+HHs; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISvg+HHs"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso12496985e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:04:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790575497; cv=none;
        d=google.com; s=arc-20260327;
        b=PIhQlH1X+u4BLcYK/Eu30jWCFjRtPnZEbN28TLDyJ7zkCtRKwoYHkr0XoJ3k9vm4hn
         V8vh7+mckJHqkHpWVs0GrbLCyHTH8Gi5Z+6e4oeAQUIDwtNDU0SHEN21YLwnOtoux/PA
         3Bp3Hlg7aq6KJvgCaH8KqNfhgUH+V6J0aAH+SHHxCOxTTgbg2xQPXZsc39UbDzP/8bgk
         mYta9RDlKs1BroYh3K+cF/sHMxrF3qGS8t/WOd+AXIVF815MFab/El43Xzs4nc7toO2x
         DHVB5oO6GWQrtw9xxQXx4N2Dfpk7aJ0Gew6ddtMmJF1BN0rnPGSJ3mcCUgnTnLSlHhqe
         Ty5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GYLuVesnje3a3q8fx40L4GXeBGM+JoVDaVm2RxVQTuk=;
        fh=9ZRTZTT9Ci0UERtUcyX4aTaQ/mLztSPKAOabR3TTbg8=;
        b=lHg2n841vPAX7139wPUfsY6c0ocMsj+XM6yy6daUbPdojBYzZmnhFid7LCpqJhmbd/
         oL3564RIQWJ77y7xwpdzybCXM7W1eZkRSdbuOOK8XKU/Xj2CeTd5nG1ApPFC6yp9U/3u
         BZB7rzZ/YmDh50x0FpgpstO9oKAHqefT4hMSlsP/p4Zk2OpXP2C3AUkN51btrRZUC53O
         k/g9fpmpeWrK4UynMcXyENmtoazhFAyhtT8zXUc1ojIB1XovOvkrVASAk0BOItseFyUz
         PxEdw8jGdQnLD1Rrou3FkgVH7IRpIRP7vMJxTXhNT0hFeeZUBGhjmUMrPe9BIcoDebPi
         Uz8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790575497; x=1791180297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GYLuVesnje3a3q8fx40L4GXeBGM+JoVDaVm2RxVQTuk=;
        b=ISvg+HHs0Vm0kqLWM+2/0HRrZVYH+VC1VhwlHOLDmCvsx91QfggJxDXqNrK9ECD05k
         lnCYubiO8LVc9K3qp7IywkBFt4ARA1G4P3P1DUJpWJnTnDTrISeynfHNRyWw52wsGo6E
         SS0lck2gn17ckG2MAWItOe+ZQ1eX4LVn/yb9bElk3izPGGM3FpcOMBFz/3TiNDAt3Ofh
         3QNLuuPrrbpPgLh0jVyBJed1e5C19VBhpkxuUJ88XF5IoFb8aXsKQ3970eP8on3/5P8K
         fvlpuH2Unxhg4j6UMJYlqneV8BalfgXvEFxCk6mxfTx+F5rm0I2MmX3/ulouaFx6krWH
         u6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790575497; x=1791180297;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GYLuVesnje3a3q8fx40L4GXeBGM+JoVDaVm2RxVQTuk=;
        b=db9kxpv3/S+7F+a8TyVVfMEUl+OtyqN/IFU5eeCgiq7qC2CcXxYFjrvyZzk2yNdrMa
         LVz7K1v5oo6Tk/qwXyTp1NNj/I1b8TB5edPOLQgTrXS/w/miuGp9tPRNC1KfQSBt3XhK
         zpfXha/33A+mnPvHq3Y6RE5zL0ED+XTw1PcfuiYDZWKg14I45XaFVqhr3ItXQFTwwCnW
         4bhtyezpFR4NucUpr2umKsIPTiG2+u9qwyuZlTbNDzy+A5VnFJVqYl7UwQOitXLf9ANf
         7zBOjOcvpEn3E6XktZqpNn9AfDOH2n9OouNSz0lqeAgjQbceo9W/gVenD2Sm1gESKVqg
         UuDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBvoM082C5jg4/wlARWxV+BwpyVeg5mHKMGftEtSwPwMQdxHIc1m2RARY66Bb3UbT3bsPOiGlkDiVzvVM=@vger.kernel.org
X-Gm-Message-State: AFuF++mkvQVKOeDWif2hlbiu/aDCvMvvzLNw7bT/hXIE3NvoZDi9AhVG
	z+Yk2cNdYI83mzOLx57+PWnAS7nTNyU6upzGx8RGsESSNR+oiBsmXATMe5USYrAoI3L3A0rC0Ex
	CVGsTwuwdw2haWcef0LcksIhKKuhamfA=
X-Gm-Gg: AYBFou3HHq6HLp/SfuH+zE8Bf1QZnZ767DEyvqwvurvt0hjWiPz9+iGgihpqekfFWVt
	7VZFEbdtxBUSuHHGufu7QCWqDUyBuItPVkcIKIFG4vKkRMd90Ehocbxhisc85F3gPQTnczN11b8
	oRKfTA2G4QNNQZPbylT4pyM5iEi7ABSgUlu+83g0xSAWDnHGaEiSkfXkCH4wdtsbN/verHe1HEb
	qLdHf4wEqQqf7g+HzU0cnaW9rhjj1DCc2ylc/oh2inHS2tecUTkYJh+HtW0tX5ElZuOfIUbdQMk
	j+HrEQafTHmsMblRh2AxAWrKp6VSVmS2APAdY7RS0IB3r+s5I8Qa5zlTEPvWtqxfKcA0bWOF95h
	gQUgqH6OtgkyarLnvhG64fzacuaoFm7iehbVDXLeQr8s=
X-Received: by 2002:a05:600c:314f:b0:49f:e4ca:e09 with SMTP id
 5b1f17b1804b1-49fe66ca9e5mr205820295e9.3.1790575496482; Sun, 27 Sep 2026
 23:04:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927114425.442803-1-pooyan.azadparvar@gmail.com> <arnRiZyWe6zmd68S@google.com>
In-Reply-To: <arnRiZyWe6zmd68S@google.com>
From: Pooyan Azadparvar <pooyan.azadparvar@gmail.com>
Date: Mon, 28 Sep 2026 08:04:45 +0200
X-Gm-Features: AclHuK_3fgXapZcya5CBrYMS9Xf5tOl9z-cRxefBRXPrIhRa93bw0gYBhPqW9Z8
Message-ID: <CANC3H+LG5tHnSU+8cnBUt1HEyUecN7M7=guF0yr6AOTa3cGtUg@mail.gmail.com>
Subject: Re: [PATCH] Input: raydium_i2c_ts - validate report parameters
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Muhammad Bilal <meatuni001@gmail.com>, Herlangga Maulani <w1zardsec@proton.me>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Dmitry,

Sure, I'll split these up in v2 and keep the validation fix separate for st=
able.

Thanks,
Pooyan


On Mon, Sep 28, 2026 at 4:38=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Pooyan,
>
> On Sun, Sep 27, 2026 at 01:44:25PM +0200, Pooyan Azad wrote:
> > The controller supplies packet and per-contact sizes used to allocate a=
nd
> > parse touch reports. The driver trusts these values without validation.
> >
> > A packet size smaller than the two-byte checksum makes report_size wrap=
,
> > allowing the IRQ handler to read beyond the report buffer. A zero or
> > undersized contact size can cause a divide by zero or make the contact
> > parser read beyond a record.
> >
> > Validate both sizes before publishing them, and reject reports that
> > describe more contacts than the input device has slots.
> >
> > Allocate the report buffer once valid main firmware information is
> > available, and resize it if a firmware update changes the packet size.
> > This also handles devices that probe in bootloader mode, where the pack=
et
> > size is not known yet.
> >
> > Finally, return main firmware query failures from initialization so pro=
be
> > and firmware update do not continue with invalid report parameters. Kee=
p
> > bootloader HWID query failures non-fatal so the recovery interface rema=
ins
> > available.
>
> It looks like there ate 3 somewhat independent changes. Please split the
> incoming data validation from the buffer management and handling
> bootloader query failures. I think only the data validation needs to go
> into stable, the rest are regular behavior improvements.
>
> Thanks.
>
> --
> Dmitry
