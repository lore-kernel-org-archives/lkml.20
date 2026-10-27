Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=144.76.98.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102724;
	b=N0Da7HXEbWdReV7GBse9T3d4jFzIhHrEhl76sixz43H5/NNHeSWcUSCZZ+90KDLXWcxc
	 AU6Djw2Mle7kSuQDqWI46VkSWZUlzIoLEzWnp38FF97HHlnhBCoA0cfz2dwWUw1cq/8ri
	 EdGPhFUJywjTSSPfJp6ADaMUZnhlYXhuXbkxX5DQ5aGxmuaUT8ft0b48pHu59pXsSa7Nu
	 q7jfadLfh9dB7D8NWXOZ/EouqRretBzU4XJNY9d/gPTc5KXmtUZWk9S8ki1010uc3+abS
	 QRla+BC/NUC+YtuSeFFXQbtppcEt26YIzuWHtlvuyqgHNwDumnxzX345xyKsA1RQQzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102724;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NqEHCLFHg/YZTrdCvxEaQojESD0wlarw6wA9b0nhmXo=;
	b=uvwFJ+sdSptngG+iqDT7k4Wz8LICv3ChLlqzCFB+aI2ATkGmqE9aUUwS8uGRf7JrWvEH
	 3CB9AQ7f7jydEoVHxAS8N0mFHnGMbsTQzul09IDyc8U/AhebdROspqWRlloDDxjT3lmIB
	 kTe9q6REHGCF2x4Jg52k/Dp5GYVvGOvmwanjfVUcUh6kNsjv0CiXAxBNmNyPwOK0ESyZA
	 mTS1fIv37pO9K3erJUSf6SwaD7F3y5cQ6xViR1IaSQubkXXluAVBxMyzCzBjJfIQZsF/P
	 ad2YOZRRSji19pzeyZL1uMo0l32fR2bTZ4FJGAqrFL1KZH6KJeza9cTJwhbwMM2B8OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rojer.me;
	spf=pass smtp.mailfrom=rojer.me;
	dkim=pass header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=k2qznDTg;
	arc=none smtp.remote-ip=144.76.98.110
Received: from mail1.rojer.cloud (mail1.rojer.cloud [144.76.98.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5C4606C968
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E5C4606C968
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rojer.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rojer.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=k2qznDTg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rojer.me; s=main;
	t=1793102721; bh=NqEHCLFHg/YZTrdCvxEaQojESD0wlarw6wA9b0nhmXo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=k2qznDTgR+igebwJ3O+83zIrI5mskGhXIkn2iXvsScqJHDpiEHA7ojCrHAGNpfISa
	 2oS0cU76c2tESFYzNoi513gFlITWhkoAGqCPeliWyH9wS6i8rA7QbMpGTabTwhPujO
	 j3ccE/ivDtZG8kSC/gQoZcebx947RmSxVCvJogo68VAICXCI2BJT32TuS9WxnhV1xV
	 ahpdTGh2add4qUgVsCLUdLjAF9Ac7Zewcj87YAGBINj3L7/KElplV20yAVgcK8swcK
	 G5igrYDqvuVVYExDzKT+0bFR+oqT+dxxA5gnmhdv/B2e0rduTXysy4VTuQ/PDCZXYr
	 ZnTn1NnYNo+VA==
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail1.rojer.cloud (Postfix) with ESMTPSA id 052261271E3
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:05:21 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6b19e291cc6so3595003eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:05:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz0WWtOlAkOPY6HVzAdGmB9+d7bTrA8WJoTczmLK7+B5PY9RUtHkIK5Cfjwx1Usl0W4TxEKv/4wDkwgYKQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTP6FrJYQDcxa4BkqnLbSSxcUOp1Rgjacz8k+KJI0TJ2tdN2S8
	sEZFGGpHpYiTCopaC1qhx/tsSDuofKoqJJTStVXAvmLSJ49Tfd0Fa3CLeVP4YD9Na/uqgmkVmQ0
	JNPmUAkD6y3QYx6kbcJ0tny45/JPrnw==
X-Received: by 2002:a05:6820:610:b0:703:c2a2:cc9a with SMTP id
 006d021491bc7-70ba0b5adf0mr5430261eaf.9.1793102719530; Tue, 27 Oct 2026
 05:05:19 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023232813.2983368-1-rojer@rojer.me> <20261023232813.2983368-3-rojer@rojer.me>
 <4e8bbb32-e062-40fe-8ee4-363e83a68f2b@rock-chips.com> <46a26683-9d8e-451b-bc98-505b1c13b09f@rock-chips.com>
 <202610261435018282601@rock-chips.com> <CABFmFwr0JozEeaDd4KErDzh+DWjkjkVRo6z61OxHG6BE=L_hKg@mail.gmail.com>
 <6e59ac7e-0186-477d-8166-083dd2987aa4@linux.dev>
In-Reply-To: <6e59ac7e-0186-477d-8166-083dd2987aa4@linux.dev>
From: "Deomid \"rojer\" Ryabkov" <rojer@rojer.me>
Date: Tue, 27 Oct 2026 14:05:07 +0200
X-Gmail-Original-Message-ID: <CABFmFwr9uGBNF1YkqWYp1L95wM+vjn7NXVahc7rjEmWeqNEX0g@mail.gmail.com>
X-Gm-Features: AclHuK-ZfGNpknDt8OEgvtqYY6LHLRznlRDEFz1uyBQ7dOxZ50hJpqapR4Kv1uM
Message-ID: <CABFmFwr9uGBNF1YkqWYp1L95wM+vjn7NXVahc7rjEmWeqNEX0g@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: core: sdio: skip CMD11 if signalling is already 1.8V
To: Shawn Lin <shawn.lin@linux.dev>
Cc: "llj@rock-chips.com" <llj@rock-chips.com>, =?UTF-8?B?5p6X5rab77yI57O757uf77yJ?= <shawn.lin@rock-chips.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Jensen Huang <jensenhuang@friendlyarm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

agreed, will send a v2 with all the updates



On Tue, 27 Oct 2026 at 13:53, Shawn Lin <shawn.lin@linux.dev> wrote:
>
> Hi Deomid
>
> =E5=9C=A8 2026/10/27 =E6=98=9F=E6=9C=9F=E4=BA=8C 19:00, Deomid "rojer" Ry=
abkov =E5=86=99=E9=81=93:
> > On Mon, 26 Oct 2026 at 08:35, llj@rock-chips.com <llj@rock-chips.com> w=
rote:
> >> With this patch, swt6621s can skip CMD11 and successfully
> >> enable UHS mode.
> >>
> >> Tested-by: Longjian Lin <llj@rock-chips.com>
> >
> > thanks for testing, Longjian! so in your case it's even worse: without
> > the patch doesn't come up at all. good to know that now it does.
> > note that your reply didn't reach the list (vger drops HTML-only
> > mail). i'm quoting it here for but if you can, please re-send it in
> > plain text again, with full context.
> >
> > Shawn, thanks for the reviews! you're right about the soft-reset vs
> > power cycle: card is soft-reset, not power-cycled.
>
> Just to mention that vqmmc is optional, so if not vqmmc-supply in DT,
> the voltage is hardwired to 1.8V, then this patch doesn't help.
>
> I'm inclined to add vqmmc dependency to the commit msg of this patch as
> well. What's your opinion?
>
>
> >
> > Ulf, if there are no other comments, please s/power-cycle the
> > card/reset the card/ in 1/2 when applying. sounds like we're
> > converging on 2a, so the alt patch can be dropped. or, if you prefer a
> > single cleaned up patch set, please let me know.
> >
>


--
Deomid "rojer" Ryabkov
rojer@rojer.me
