Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0504A30D406
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355078; cv=pass; b=T0setXUhUGviRgw3jwwS0Dz2dI/AudAwNRyaG6nDd9U51/WQPxggITs+iyCdBDxG5RE0EcTslSnZ1jj+Yl7e3EOSYkDWwlTSDb8HLQUJKst6CbELFmJ9G/nRv/Ml6F6HgfxCli7yo7EY71bzNxPQxdpl2HPHbBWEazpp6BtZpBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355078; c=relaxed/simple;
	bh=EnbOJbctUI3jeICE1p676LAx9nJxpk2azJhMo+Wok+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+5J5A7I82k466TTYm8TaWfXcr4mU3H3dwndj9p42lUvT9XJRxhX97B5Q3VnW9F8g9q/W8yOTwC5mHqe07sn9hEYhYQhoOMwdHx9/T6YkVeclT558XVqvF8FbZbxHY/TPns9GfwCTSAawqdqaTajBcoAfni7jk5OjgzQneqpAoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6VkCAOl; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6VkCAOl"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a2b4743936so19558821fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:04:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789355075; cv=none;
        d=google.com; s=arc-20260327;
        b=MUi/oMyvLjn26VS/yZ3g3AznRCeU6Ey9Yem+rcgCQTW1VoDvzKH5GxvO1O4YZf5b1X
         fRRDBIuPynUCtrx3vMHVEhcaLVz8GfN4W554jH6MK3oxMQ4eVP747ERR+rUVi97vz4UI
         TC2dR4DmSw3HcGVpqJoT4S5xzzcu2tyQOBmmtS5JWuQvvMhFWbtN5Ynwmzq+nmwQmftx
         tx6DxUfGJgHMA88XS5OYAcrlu6CMyze7Sek1giTlfxl0le9T5envsF3IsbyzHA/+O5hD
         ejLQVnGuetFPU83yvqgzqNPWQ5tl6WwZJrMDgGNXAn/VaunY7jz4V8dHy19urTdfjRVI
         bYHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KJqOqNeQWR2s2A9ELu5zJ2HbMajdgUAwUmVmEHOOFLk=;
        fh=sNPVpQp/rQLuLg2Lf8Rpg8VOocEGAGzur9LIv07428I=;
        b=nHqC9e/Kp28UeyJwwRg5filMwwRQV2ChQAjaM5aVIAPM5kQzjvwAEvLan+LJusNScq
         KQX1dgnt2/IeYzQYLGT92VvQDE0yMHtnWiddJirjoFYv46G6J8wLX76Fc7ftfeUDfIuf
         8EuWI7TqcZdOEb9nY1UJZvLICtPc8uG66AKKgSU2GMUB4StUd/JtuauZesmuzyk/aNBt
         9XqeskqIFCfKMkB5UJaHbscZzD4GKu1WBdBOpBBRGviACBNo2SWVL5yj2XYjkO3s0/X6
         M8nhxTbBNjAkOo5FjnyVHsJkJIEdICnt6QhTsGixRj/0jKjpZE+X3VxizY0Ewv9krnbK
         whUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789355075; x=1789959875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KJqOqNeQWR2s2A9ELu5zJ2HbMajdgUAwUmVmEHOOFLk=;
        b=O6VkCAOldE/FmAIq2O+IzOjgRL8Y7tUNyEW62h2Pqq9eZBuwZC+9ijsG0Sc+jyk3V0
         BhlWLjRpJtBDDamrI+FguPRirhgrcoBKM2PH58C9Fnt/XubPxXu94gJ8QnkGWE6d4dTR
         fQsWwvkdBY2wFGztCH3J/kFT4FGgRFCgFoxVHSBkqZ8ZThALbmZ2n+lhOmDyH2y2r2Xv
         6T8ViKoG04DWdsHdTFxLa8Grfponaw0y7TjOFl6Wn7LV/J5QJqFHS300h25xjghM59oD
         Zwt8z0uDry7HSj93uwQUwFyHH7+WvGWk/q9mTq/Szi4VJEpmZfGsjl0aa3/WtefjU0M/
         CA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355075; x=1789959875;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KJqOqNeQWR2s2A9ELu5zJ2HbMajdgUAwUmVmEHOOFLk=;
        b=N5KoZwC5Thhpy06opGoodT8VufKP9ETQtQXewrZAA4N7fIwgDabupj4oswlWihPrTQ
         bDuQLCpH9KHCmBo3ImDaNQgU9R1eZIhhxyd7f9B/lx26OMGIoc3aqqcPlBXIk9MKIUio
         UBPEchMc1asWmJveMMI/69LYln6LjtCRX/74SCnUt/ZVJb45tbMphj27NssUyXAXTrRE
         n8dUnVtAw2IQvuxNtdecdxdNV4gKtEJTHNrhuo/JJpnrmXhBchHObUJr2bhSkMosdRr0
         UpDzcaee2ISMvzKA+uP5UFsiaLX/7CXYtUp4W2JfOYt5G1vj/c7PCwEucJgnTMN15FeN
         ze1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxC8rc7M9LgCM2uzgIS/q3OogPJjsqyFjaVADwn4ZSTLzLauCnL5rYemq3yFlmNhpdwPB1QMHPLYaQXsFo=@vger.kernel.org
X-Gm-Message-State: AFuF++mzNnT2cDnhy8JaEO8GEdlmKDwEZbPc/l+R/8o21z7ScMG0rMCX
	4RtQ5xR/3PFFCRSzsNEvpMryfT940pMmkMAPcSWDCdTd6Q+glNYkUBQaKn7+nruA5ODmUiTHf33
	E/l6kXb0vNoW2JYwqXDvN9mCk9Vz6K6Q=
X-Gm-Gg: AYBFou3VEU6/QWNARYqF6PW1GhSbuWBU21Rji2BCGawt8/A1DatfHvCHfqGshLsIAEW
	IXcTTwMLDsT5yg7Yju7Jk0jrEBqsZDQNgYssKTTU3e4D1UqKPJzZ7wilV+PEvxGhkamB3bJdk3a
	RqZbknyxi8f3gP04Q/tRQnYjxeFYamlizIRRmzQ1Cmqg84Qns5OCsXwHE1WeT8WONlBR+iCnERa
	mK6WO3nVIqyatmoPDifkIus0qB3B5Wx0bnrcQ/9wdmIGG67tOKwRdNzAkIZtwoDGXI0SH28mSfk
	+TxMSiettcpB7WC83YpZ/Oz982goEgk9lJrnet6uF6wAQmFEfXsFIdnYxEWqxTZth999SSWTTzB
	LVHi5nSJ/l0ZA5HeFdP1tmhlR
X-Received: by 2002:a05:651c:4ca:b0:3a1:94fc:e1cf with SMTP id
 38308e7fff4ca-3a5c88b91f5mr576081fa.10.1789355074742; Sun, 13 Sep 2026
 20:04:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912-b4-bunzip2-blocksize-fix-v1-1-c7384bbfc954@gmail.com>
 <20260913190904.bd6811bc8e094047017c67f3@linux-foundation.org>
 <CAEdQ38FOnZPmhc2LYOCXS4sqpi4gqLGnkUMA7EXyDFL_9A=X0w@mail.gmail.com> <20260913194932.c36fad94a3a74fbed5cdb4a6@linux-foundation.org>
In-Reply-To: <20260913194932.c36fad94a3a74fbed5cdb4a6@linux-foundation.org>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 13 Sep 2026 23:04:20 -0400
X-Gm-Features: AcwNN1VwzDqGO9CdnOVUBM5-wBa44-Riof3Z6CPl3pCqTJz353sJaoGueShPDK0
Message-ID: <CAEdQ38G3V8BtL7kFehNCg1C6=khxcS+h+v6yv=iRSfgto0HvQw@mail.gmail.com>
Subject: Re: [PATCH] lib/decompress_bunzip2: fix off-by-one in run-length
 bounds check
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Alain Knaff <alain@knaff.lu>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 10:49=E2=80=AFPM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Sun, 13 Sep 2026 22:18:07 -0400 Matt Turner <mattst88@gmail.com> wrote=
:
>
> > On Sun, Sep 13, 2026 at 10:09=E2=80=AFPM Andrew Morton
> > <akpm@linux-foundation.org> wrote:
> > >
> > > On Sat, 12 Sep 2026 14:17:35 -0400 Matt Turner <mattst88@gmail.com> w=
rote:
> > >
> > > > The run-length path rejects a block when dbufCount+t equals dbufSiz=
e,
> > > > but the loop that follows writes exactly t bytes starting at dbufCo=
unt,
> > > > so a block that fills the buffer exactly is legal. bzip2 allows it =
too:
> > > > its decompressor bounds a block at 100000 * blockSize100k and check=
s
> > > > that limit per byte appended. Use > instead of >=3D.
> > > >
> > > > bzip2's encoder stops filling a block 19 bytes early, so nothing it
> > > > produces ever reaches the limit and the bug stays hidden. Compresso=
rs
> > > > that use the full block size do reach it: an lbzip2 -9 image whose =
block
> > > > ends on a run fails to decode, and a self-extracting kernel built t=
hat
> > > > way does not boot.
> > > >
> > > > This code came from busybox, which fixed the same line in 2013 in c=
ommit
> > > > 932e233a491b ("bunzip2: fix off-by-one check").
> > > >
> > > >
> > > > ...
> > > >
> > > > -                     if (dbufCount+t >=3D dbufSize)
> > > > +                     if (dbufCount+t > dbufSize)
> > >
> > > Sashiko thinks there's also a potential overflow here which could be
> > > addressed in this patch.
> > >
> > >         https://sashiko.dev/#/patchset/20260912-b4-bunzip2-blocksize-=
fix-v1-1-c7384bbfc954@gmail.com
> >
> > What's the appropriate flow to/from busybox (from which this code
> > originates)? Apparently we don't sync from busybox, but do we want to
> > avoid divergences?
>
> I'm not aware of any such process for any of the lib/ material which
> mirrors some userspace project.  So I guess it's an ad-hoc "send them
> an email" thing.  There's clearly risk that if we accept a new drop
> from upstream, such kernel-first fixes will get lost :(

Okay, thanks. I'll investigate the Sashiko report and follow up with
busybox upstream and then circle back to LKML if there's something we
need to address here.
