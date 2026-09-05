Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A561D1D47AC
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 13:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788614459; cv=pass; b=G1060rU9nD/54Oen7JL38eyE2l8l2SQIImiheM8XmbMLFhj46YZJ8wV42mS4B8dgQJNHOoImX0iIqLRHXhVY4Wn80cde2ohVctRJLDL1wDowgqAehxShJGRQGnOPsyzVw4zmWEW9O331AM+4MlACyJYammY2FEYD+f4mS/UKsP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788614459; c=relaxed/simple;
	bh=GreSufRi1ONTmHt+BvDsUtBuG0mFGu+TwdxDtw2zEhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UPpZTk+ssohEmwCV85ZiC3XQhFBTN7uO+5EU2PWRX/rBbgEHZhLCUYxzenIutVxMEovbY2GGk3uvXmXCtifHC+lQgjc2+6VsFlCBLYsI8W0HgrLrWl40II4RgpWjl4kaKTTORLMwC/7qMaGCorYwF/dBtfBnTRfyf9ieeBfM5nM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRjPs70d; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRjPs70d"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b4a0e5aefeso2202749e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 06:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788614455; cv=none;
        d=google.com; s=arc-20260327;
        b=hadAv6Y82bjG7d96rPnkTV51kzyHRNknEsi17xhaAABcbTx/f8UpeYR4EwQ8wkRf84
         c3umY4CZ3lgkpE1DUt0odBYjIHCtfPkWOwsTBHxzNCR8TLVLhyfjZ5N6zEpKPZ++0Ifk
         g7VcZPMntX/RR6zkA2CH+bSq5JLEIEa6IKBGQH05Clf9V2cI0+qU/Hd+2d4NeGdG+sNI
         WyHDMshbu0+ZlNGmV+IjfpmnatOeYy2AoCEcbiKiT1lVe2UcU5mep+dehYXB6qCtoJk6
         2HHfLViElgrygC9vsZ20/+Rr8EUHWX8s/JFsfDBEFnbnn9rxgNy3+PcZfjky6suR8AXc
         upUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uwIV32WsD/zZ7++4VP2rotd5bmAf7SflccOb0estirA=;
        fh=rTIDKcxkbt2CiUn7ylXXBXVv4ihH/lSaDbw0wMeaE4w=;
        b=NDjT7Pgc5N2kZpquYH4jFRqBGobQrZMBUuIKiQ16qJCLbwxG/zTojmMJATOaHlZ0+b
         d6aRiVb1vtBG3eja23hFb/OxG1ZKZsPVu44slku9wVe5LsO5nFIGoUlW2VcsJaPwsHGJ
         xdzaWMAiD7GrMa/mLk/zqde17D+NB8bCU1Za5o0VZvOhXz2EeIYIDEcvF0MsNr/42d6q
         /7XlHFR7++n93mUHtPGyWP/YS/VvTBr6dWlxx+KSgd9b0JwRGrP+mi1TGtDqlroAXM9V
         BC+zItxvF2KZzadApBDSdy0yCKnKVpqe1NJ8iEhvyOk+uh3zWzkIQ35fSWuEYYCKzlCr
         bsbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788614455; x=1789219255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uwIV32WsD/zZ7++4VP2rotd5bmAf7SflccOb0estirA=;
        b=CRjPs70dFVH0a0NvLKm5BAqWXFKtHMD46g4hell9mYqhI37V3bsjZFOvYhMi3uSqLG
         mscFKaBY7Z9DrxKOTbY4TpXn810hQIBuPUfnytmvuEz5oM+ejE8XJ29L/AIhocg/H64+
         h+9wuPRb625lEGpZyk/ewS5Tv1FD36r8LYxAHu2dWALi79b3ttY7dsOxuO8NQ6zyK49j
         HF+ErLeRfBwaPmaGKXHboIYWY0ZCc3m4FTO5nype8WOHvUG5LkbsuMkLNuizBGYdaWhp
         zwhE5S50uAgq3v2iRdZgUz76lOzln2CdMvxdj7nMkj4KFRvEF27QhGjDohwV7Rrt0akq
         ZKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788614455; x=1789219255;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uwIV32WsD/zZ7++4VP2rotd5bmAf7SflccOb0estirA=;
        b=AomyBB48yaJQCG7xyA8MS2KDwVCAGw37qtnYbAthbHrVQ6fco+xSRpGaRnploHNL7f
         DlRl6n3i4pxzYACFEE9En2CkiRj90s487EVAGhxcRcOMYZs47pGOagiIpn0PqQWCvwoQ
         h5fvam9JoTAlb2rqQiQn+3cEUk3Mb7hTnBMDggY56CIEnoPwR2s9NlrUkRgsnwKtvCXW
         Nay4NM/wwhHZ/1KUaB+NydeoySGBcb/ce58pV1rnVtwFLAONgVfMXsjB16MfYX6rBNnf
         Vbm4p3yfUSOZAs1oBcPortN+Sq2VPSU96dhbozYQYmZGfZJDZiF+FLGWxHzGVskIoIM1
         ykjw==
X-Forwarded-Encrypted: i=1; AKwUvBwsmg4mEt64XormMQsPNdE7uf5tQ3YJ0bJvgnAevLa0YcQ38GlGJT3BQMsbKVQl+ao84ap8HOKpnV7dp+0=@vger.kernel.org
X-Gm-Message-State: AFuF++mPVXIwjozIXoVksbSW9d7X+cZ/EUWmbqBhY8vWjZubg2Tu7j+R
	01MakbJJ5q0lvCuFLuROlXSgFBfSeKTgN/hhhff3i4gZYUJqhZ5EGw8T80TNSphPc6ccXFgNDku
	Qhx0rO+ncH+QtFmS42pLUETTnvz73W0U=
X-Gm-Gg: AYBFou1oLWo2kfXhAyzQeBfMhYavJsR4GS9fRFV1N2J5eJO/+Jq8AMcr1kNBfCzXWJM
	BmRHnX9Cf11wJXCPG4OJmpdAZdyi3vwqEu7zgqKfjIswZRvlvdhSi3TkC/aF+FQZuvWZUBqdPgr
	YmAneciv+Xw8jRClPRdlzuOSFxdP5F6JTjTuCuLo6W1oTvKvkoz41hkRijuRFWj0DkeBWb2AVED
	8d+i5YGG+NUGYqTEospovsUp735iYJ4iDC0BnvdTOAPCBw7+O7VlhGz0P+8vtaXm8hZMyunyZDW
	jZl7RAAvgK2vUK8L/euCQqxaLsNeXzl+YZE5fBhQ7X9KbLJvjvclrxocoPr+sbp1wr4CsMk41Sc
	=
X-Received: by 2002:a05:6512:3f0e:b0:5b0:eda:de1f with SMTP id
 2adb3069b0e04-5b616f02096mr2059293e87.6.1788614454269; Sat, 05 Sep 2026
 06:20:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830114731.8322-1-wujianyue000@gmail.com> <cover.1788528216.git.wujianyue000@gmail.com>
 <5c4f72f1ffbd5f15d0b57fb1a87f73b4249ab424.1788528216.git.wujianyue000@gmail.com>
 <CAO9r8zP7LCRaq4e0O_gPz61d+ee6Pt=tBZXQRy4X27idB228rw@mail.gmail.com>
In-Reply-To: <CAO9r8zP7LCRaq4e0O_gPz61d+ee6Pt=tBZXQRy4X27idB228rw@mail.gmail.com>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Sat, 5 Sep 2026 21:20:39 +0800
X-Gm-Features: AcwNN1XQdTnL4GDeFU5BsDnq2fml9cZJZMgkYM195Nirw_rp_dSf65yDkyjMKHI
Message-ID: <CAJxJ_jifBfg+f9OuUSPiYThFU_0edA-XOmuKxbKf=2LNgeWPvg@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] mm/zswap: reference the pool by id to shrink
 struct zswap_entry
To: Yosry Ahmed <yosry@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 11:38=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
> > +/*
> > + * The pool stays alive after this returns because a stored entry hold=
s a
> > + * reference to its pool (taken in zswap_store_page()).
> > + */
> > +static struct zswap_pool *zswap_entry_pool(struct zswap_entry *entry)
> > +{
> > +       struct zswap_pool *pool;
> > +
> > +       rcu_read_lock();
> > +       pool =3D xa_load(&zswap_pools, entry->pool_idx);
> > +       rcu_read_unlock();
>
> Doesn't xa_load() already call rcu_read_[un]lock()?
>

Yes, xa_load() does the lookup under RCU internally, so the wrapping
rcu_read_lock()/unlock() is redundant, and will remove it.

Best regards,
Jianyue
