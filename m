Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F1749B46C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364121; cv=pass; b=eDinm7FcWRlu1MvH2acndPPAXcQ4gOX2QOVphuvi3QXiQhzTVr31utiQjQAhmrTMWIj5dtexTGcVU96enRdZLZSMrfMncOCmbMboF0qOlBxYKP8046dUfKwgJBCccvnjunqVHX8DOY8SPnkqT1dVu6Fb9hl8XqtKMJmSY10ml7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364121; c=relaxed/simple;
	bh=LJK4k9+FK6S0VP6imYj2QsZHzrZYFltqhgqnT9sHTTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dq8SqWlCFB3sGOoyNua+MQYNzXVp46HePlkQFzwA2t5LybdqihN03zj4ztz3w6qyMM8dWwU/JjNkDT7ZyXbs3szFYEQavtWjXNpU4wF9w42xcIUKwWBAhY5ZipLVbmji5DPOBMMvuueybXMyaQk1xbQvLQqyq/EoSqlPZ2Z9KOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hg4nyiH9; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hg4nyiH9"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1263498f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791363898; cv=none;
        d=google.com; s=arc-20260327;
        b=s9MHMWNG45H3lhUcgyoFopnt7o/QOntmXU/1+JLBXmC2SW8LryEdGHm+WIfwa1qHPh
         MkNqeUnLlbszpbBc1Uuz7EqNYZvYXeHoOMwst4RWHilqIOV2HL8yCr4HFtPW+zPw+Izr
         d9cZv6S0E1ocgMZcvazgJ/dwtdYFOqCWrytnxpublM2kNS4m3jYTCVGubOcoEdj9emlD
         rvviKBjB7Zg2XEVvJCafqYjUzP+kUJyB5w8ebhHFhPtMgBS2Z8SvzHK9V88YHc3eXOPk
         MPmuijNqZuxZ7RLOH7uN6MvSad77sdDpNd7AktGqsejCnLm7cEVqk26gqZzV82oT4RWb
         OQHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E36HoO2bl1lQRnp5YJO39xoegHQevQRhaq8fZKyuhuc=;
        fh=0R0y3ARQpLWsv1CSwM8G8VXa5vhdqwRiOavwLvjyLxw=;
        b=MoZFjrTPSKBKyh2VbYX1ODZ1ckaoYLxWQulp3ntpE980LQ4MxvhpOEl4sRZDcr1FIL
         UC/S2KbSbbSpeJwMPOe5Fsr8QdnoWV9tGdNAGyp1l7mmmng5NFbMkfoaxBDXvB+exEPa
         awHxYkdiS/uSFT0frp1cGAgYK3bm6NmkstsC4p9rGbTv47nY/1aetpksp4n+fmEdzJYD
         07ATwt+GrzUCUw060LCPZoNIyuDYN3zBSAqyw8AAOgfhpT4zsi5frtW+MmebKx3OkQ3q
         43P8MS5ciTqAP7dy3DXt/KvpiUKa1MDmp9R97/WT65BQEse63tGJYGOWgyWPik4i7hQU
         GKkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791363898; x=1791968698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E36HoO2bl1lQRnp5YJO39xoegHQevQRhaq8fZKyuhuc=;
        b=hg4nyiH9/g2Oz4ambYX+iij2CVMo0lI+tx5CvP9BRFvPRLtZC3HK6fstw4VTNM7GQN
         xOB7mU1tpeZrlJ5a/H4lJ22ITcy4YJo9lt5XcaquaLioy8K6cP6V1WBvG1FQv7XDyP82
         LFdCV20phJ4B+alYJ93HmJyysenFSJ5yNyPB7aYnZ9kRjTEg19WZt4S90o3Hw20xRJ+y
         siYnxqH2uVTMoNtRq3aK0bjLiszWKbd7THVP1yC2rnvrqtli7HWPHfWwMgWw7sY/yRb4
         ZUOARInYc8l/4SY9mxH1FSI8d2CkGI1CgC/dGmzl1DlxJTd8vHeYvPBMIdaEBkV9E2//
         QvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363898; x=1791968698;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E36HoO2bl1lQRnp5YJO39xoegHQevQRhaq8fZKyuhuc=;
        b=amn+M5szh0ayjLMsyC74k8QDWkHYhU5t0xNlfbJHpJDJqejlTYEqsxrP9FerLqUIVZ
         WbHCVm/btERU98L5rp26FKmU0TeiFdXnBAA0zKvIU03pqIkrmg1IQEhbX+GiycVK5Llm
         ouBucJ1BGK7qrVa8El+vjQtZLLtGWgEzw1VHYOA8kVpSv6b7jscsVoLtFOyJwt5l6xw8
         J454Kr3GRI+EBT5ZGw5mapWeHJifmYuxD87dBKff4GIZf8CwewuguD6IBGTRmXddUu31
         qtvzB5rvQWK04Yg3TlM2K3cdgiA9p6AkX/L7tPlVGUBWk2wPESZjED0wXv3N9Obujiqt
         UbDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzycMG8fRYiZk/maahTNVzRoXHXUslYrqGt5wn+dmGx0JTrT4iECIf/8T9SLvegcxLtqSyNpOJ/5FkZeNY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKjSLaNLbwznoSLc6pibUlhYxvly9bHucdW3ML79LafZln+Bji
	SUfBZWJvlYQbs+qtNlmPvCFNDmTuubJv5NivUYLekKWtKaxQJiOSypzcH13IIAkakJ1WyobTuQy
	mebr1uxCWD6CnBytzYiFNZq225l+logo=
X-Gm-Gg: AYBFou0RUzAmrUDfCLSILWGsdE29s1uqpray4Bac9MOp/FSOMKGjfQ8Pi2SyIoSFNUj
	uAIzfOxdaXrD6jhUSBVwDjCmWusTho6+KAb37RLdW8y8IBz6WJuGSh74da8fEz4+2IQ1+G9ny3a
	8A4yEFLNglXJ0fxxxOaJySIAmSzif050UErvNqSaSb39nCLDC0jhj6ykO7sjlrWKd8uqI/EJip4
	NRKKQRxNaRLwv9nKB05+268xeSrhu9tj7MjWjhUpM2vQpYfTgAl6IOqkBvD9C91Mj9DLMky84f7
	UqgvFQZZxpRVuR3E6nMT4lOU7trGZZJnJXfDK87O8h3Y283B5fdIJh2Bny32SG3rOSmhncCEBij
	0R2gnFoaLU88cy30kTZRYHoe8ELxzsJ4d7fIEff6wAkl/
X-Received: by 2002:a5d:5f84:0:b0:48c:571a:a1aa with SMTP id
 ffacd0b85a97d-48c72779abcmr3033081f8f.19.1791363898205; Wed, 07 Oct 2026
 02:04:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927114425.442803-1-pooyan.azadparvar@gmail.com> <cover.1790612085.git.pooyan.azadparvar@gmail.com>
In-Reply-To: <cover.1790612085.git.pooyan.azadparvar@gmail.com>
From: Pooyan Azadparvar <pooyan.azadparvar@gmail.com>
Date: Wed, 7 Oct 2026 11:04:46 +0200
X-Gm-Features: AclHuK8xJQ6Fne9ZpkS7d6oSSqfAzB9NOx42HiHkCjgoiIsL7KKjyXseT1JY3aI
Message-ID: <CANC3H+Lc3GCuWpqr2ydCkYmRxTu4em+vM9R4gd-vEn_kzu-gyQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Input: raydium_i2c_ts report handling fixes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Muhammad Bilal <meatuni001@gmail.com>, Herlangga Maulani <w1zardsec@proton.me>, 
	Rob Herring <robh@kernel.org>, Jeffrey Lin <jeffrey.lin@rad-ic.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

A gentle ping on this v2 series. Please let me know if there is
anything else I should address.
Thanks,
Pooyan

On Mon, Sep 28, 2026 at 6:26=E2=80=AFPM Pooyan Azad <pooyan.azadparvar@gmai=
l.com> wrote:
>
> Hi Dmitry,
>
> This is v2 of the Raydium report parameter patch, split as requested.
>
> Patch 1 validates the packet and contact sizes supplied by the controller=
.
> It also propagates main firmware query errors because otherwise a validat=
ion
> failure would be ignored by initialization. This is the only patch marked
> for stable.
>
> Patch 2 resizes an existing report buffer when a firmware update changes =
the
> packet size. Patch 3 moves the initial allocation to the main firmware qu=
ery
> so devices can remain usable for recovery when they probe in bootloader m=
ode.
>
> Changes in v2:
> - Split validation, buffer resizing, and bootloader-mode allocation handl=
ing
>   into separate patches.
> - Mark only the validation fix for stable.
> - Rebase onto v7.3-rc5.
>
> The series was compile-tested with:
>
>   make O=3D/tmp/raydium-build W=3D1 -j$(nproc) \
>        drivers/input/touchscreen/raydium_i2c_ts.o
>
> No runtime testing with a Raydium controller was performed.
>
> Thanks,
> Pooyan
>
> Pooyan Azad (3):
>   Input: raydium_i2c_ts - validate report parameters
>   Input: raydium_i2c_ts - resize report buffer after firmware update
>   Input: raydium_i2c_ts - defer report buffer allocation
>
>  drivers/input/touchscreen/raydium_i2c_ts.c | 64 +++++++++++++---------
>  1 file changed, 39 insertions(+), 25 deletions(-)
>
> --
> 2.43.0
