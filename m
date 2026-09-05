Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7439519D07E
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 13:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788614166; cv=pass; b=H5J2KOqf6mxqmA5J0krzsON5rGWg94rQ95QxVissoAlhmm2QpmK3r+l62p28nZcs1xLpyeKiZrgf8YT04HrCMFsGmxJ1fPr00RguNsQUA6vQa2ylN856r6XbkcrCoqmmMYwrM6UENzay+7cE3vFUETTM7TGRRBi8nB46sURPiMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788614166; c=relaxed/simple;
	bh=3xByIkp87+1zFL+VIigWqq3MlmbMUyeHVyfRbnkocxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Roo3GCusztc4uPE1bFuyJ7QzEBrir7e/O49/R+Zgiz68R8m5kFI+Tu0aw3UIhOnRxAIje0d/R8jqp2a7OkQCI6UoaEgUhZH/nIBCMLkO0Qxh/YCCbs7t+3cETXic5gjm3jcYiB1/UxKuUDcLSakSYxNDBS5M7qh/sXY4VdxL5to=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vt70kAWB; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vt70kAWB"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a0faa764beso14218051fa.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 06:16:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788614160; cv=none;
        d=google.com; s=arc-20260327;
        b=DJNgwFUt0QigFvWVIAHbU6yW0P7PyW3qoEvFmH1kk2Xmmxe1huR4cdkCJR13l3MOHV
         Iwq5jnlZSgwKMxjmYHOHUoG54uxyp8L3CLOWvMdIN7u+4n7t7u0AlLPMcvlc3ooL8sH0
         0VdY3BMnyo7NcMx1Ga9wXxqckWTk155g6gjFmfz4uhD286n5KQWNLiBsEf+7v6idQaY1
         y9/Eg4ZRyyBy2Xcnt0rMdDG1iiCogHb9fRqbeYxN/KsA43hxjcH8ggqTky8DXm5pgQwj
         KeL1serCmqephyPTAP8xH7IDnLRkeuDJbiFNY6FFcvpltaBqjB497yyYWKN/W1BKxAPM
         5Y1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BIDLuR2kbCh+tksJuAQN8RIab7rU28NTAOGf9YHRpSo=;
        fh=JZUrGGpkigDG17AU5wNIq0PTl+rP99PfjNbK2hnutoc=;
        b=LWNmjHsQ+wlDIh24b8laSDRZgU3TexYj8M80lhSsvMW+fD7MD/i5KM3mEAbFxizXyu
         gDpwwiBHRW4Or2y2f/f4BjJDwdGjSdMQ9K0SQyGM6c/xSOo1v3TNqeJIuULBN+tkJVUn
         2zoM2Db5xN4yThkcTFlt2GLjPBQVPn8Wxx+B+m/oqGgV52oZJA2KsWPEuosS078QanMz
         sxI3+exxfl/zL/rRoSmiYW1HBrxt9dyCbGhlbstEiMK40BXdR7pSIJM/NlCQzEn6qPB1
         PMU+UP0C4iiuN6O3gLyunlWln5GVxGBttJ5f3G8H6FV98sUgMZRwk9v553z2Gu+mLzLn
         uRbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788614160; x=1789218960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BIDLuR2kbCh+tksJuAQN8RIab7rU28NTAOGf9YHRpSo=;
        b=Vt70kAWBqhtwg2OtfWZjixseyExkTIo6+FHr326efd331XXSFRWdd8I4d2vtDFJfqY
         v8iAaMMlP74jCVTFU1IhWAQe7eSqtGKlQux/JZuZnLSXdbur/x9oHJaKQXVEq3gM8wn/
         C9mF6drnDYiMcmcLDqDPa/fbf8bjfSLn/3mEmI/8M2hivJW71SEc91uCSWvdqojJdm2A
         HYySss/GWPL49fBxSTALYlkIRBQOgbgfUVNC/KmML3ZtR8JNnEn1+zMb3j9uw9qAVkEV
         f/7/m6AKJxwEHrl1wYc93VVzpJ4NNoISXv39Zffkf8fJMrVz6vqiia6AVwApxpeSDxkJ
         WZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788614160; x=1789218960;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIDLuR2kbCh+tksJuAQN8RIab7rU28NTAOGf9YHRpSo=;
        b=r5ao46VdLEYEMz1C2r+Cilqzok4aWVVmADwqFv9AePfT5nQZyKz3f00yM5rWOOg99g
         2W4sqTC2txZinCTCJeGnMm9YbdDlC9bC7X0kOmtWF5d/FL+iK01sokzZvoROKzuZgPPe
         NZiF73SsTXva3p1PLszGggloNgSVWGfucGDHrxcYxqQxlx00t/f4nTLMiSGI36S38IRw
         9i35q7b6LH6nYfbvhjicNC/lW17csyRd+nUepKvmeGEbpySQShII2ONQ4vEMsyO61M3X
         eTpxBr9CPRjYKc69eWhJSHa5/Q0MjzV5iV+rJYs/sXzYQgRtwnJ+y/vM40abGHApvV0J
         9HHg==
X-Forwarded-Encrypted: i=1; AKwUvBwzL2xdIIY2AExOxBdCfTHT6JhlWeasJk0X2TGfoFtOAZZOgidq5gaVuG4AjpMMQVTHIqrjpyVWZ7MdajI=@vger.kernel.org
X-Gm-Message-State: AFuF++lgR/wNBVI0tHltk6mYzdPFYkQrBPB+etP/Te/v8a9RLJekoj6J
	HpJfiVSd3q96yRJMyV9qmXX7h/7lqCc6jwl9HcoCKTpi4T2Tn4K3f+Wzwo1lkINUH2hRvfaBGlo
	xlyNLih9TCRcHRYBXtXwRbY5qXrASIbs=
X-Gm-Gg: AYBFou38a1uk+H0L2kRFh/aoB1r/Mkk4hpzt8qJDUl1+XKBfYOm25hTr82vW2iQcrzg
	jWwbwuSFFpHbaAYLcRPL9YtJU0FNO3lceDlB1EkQmzlIDmwmgic23lPNTSmJQH04jEGPdJyXy+9
	8Iu10FFup1wIw34s6gGauz3wgG3VNKrHXiQOHzCyGVKeJBvNoEkKXkkbBc+sM1fSFMKFU7KPFM2
	8QXjOByz3jdo+cgjcx94JjOPQtEFcmEKJLQQWzT13B0AhLxXsuQ7ohSxc6TRBwqQhPHncjskuu5
	0WWHH5xzX+92MM/7ZHCPzo8/Wh5KPO20/ELG9t+6ONT6eFxY6OWydQO0Cw6jCIXRmmUQ/iVO8S4
	=
X-Received: by 2002:a05:651c:b10:b0:3a2:72c:cde9 with SMTP id
 38308e7fff4ca-3a371aa4067mr15568791fa.4.1788614159830; Sat, 05 Sep 2026
 06:15:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830114731.8322-1-wujianyue000@gmail.com> <cover.1788528216.git.wujianyue000@gmail.com>
 <22625ed4915936814f766092e9d7ac6637c5b2f4.1788528216.git.wujianyue000@gmail.com>
 <CAO9r8zMiOvhy3BZ0NjvL6Wn6e_VpVb-sZzk5bpDFuoXBHbzATA@mail.gmail.com>
In-Reply-To: <CAO9r8zMiOvhy3BZ0NjvL6Wn6e_VpVb-sZzk5bpDFuoXBHbzATA@mail.gmail.com>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Sat, 5 Sep 2026 21:15:44 +0800
X-Gm-Features: AcwNN1VskVyn78MOpZJIqhjd6iWsQ7_GA-bFD4pMhIW8yua49SmVA6-bbHCeXls
Message-ID: <CAJxJ_jhfJ-ZTnvXvQsKFtyKK-ScTa2HUjnSpK+sOvgtgdZ=bcQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] mm/zswap: replace the zswap_pools list with an
 allocating xarray
To: Yosry Ahmed <yosry@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 12:04=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> > -       list_del_rcu(&pool->list);
> > +       __xa_erase(&zswap_pools, pool->idx);
> >
> >         INIT_RCU_WORK(&pool->release_rwork, __zswap_pool_release);
> >         queue_rcu_work(system_percpu_wq, &pool->release_rwork);
> >
> > -       spin_unlock_bh(&zswap_pools_lock);
> > +       xa_unlock_bh(&zswap_pools);
>
> Do we need to call queue_rcu_work() under the lock? I assume not. Can
> we just call xa_erase_bh()?

Right, no need. queue_rcu_work() only touches the retiring pool's own
release_rwork. xa_erase_bh(&zswap_pools, pool->idx) is enough.

>
> Doesn't xa_for_each() already handle RCU locking?
>
> >         rcu_read_lock();
> > -       list_for_each_entry_rcu(pool, &zswap_pools, list)
> > +       xa_for_each(&zswap_pools, id, pool)
> >                 total +=3D zs_get_total_pages(pool->zs_pool);
> >         rcu_read_unlock();

xa_for_each() only takes RCU around each internal lookup, not across the
loop body, so the explicit rcu_read_lock() is still needed to keep a
concurrently retired pool alive while we dereference pool->zs_pool.

> > @@ -554,20 +584,17 @@ static int zswap_compressor_param_set(const char =
*val, const struct kernel_param
> >                 return -ENOENT;
> >         }
> >
> > -       spin_lock_bh(&zswap_pools_lock);
> > -
> > +       xa_lock_bh(&zswap_pools);
> >         pool =3D zswap_pool_find_get(s);
>
> This is the only caller of zswap_pool_find_get(), and since we remove
> list_del_rcu() below we have no reason for holding the lock here other
> than zswap_pool_find_get(). So let's move the locking inside? I am
> also not really sure if we actually need to hold the lock here anymore
> to begin with.

Agreed, and it turns out we don't need xa_lock here at all.

> > @@ -584,23 +611,17 @@ static int zswap_compressor_param_set(const char =
*val, const struct kernel_param
> >         else
> >                 ret =3D -EINVAL;
> >
> > -       spin_lock_bh(&zswap_pools_lock);
> > +       xa_lock_bh(&zswap_pools);
>
> Do we still need to hold the lock here?
>

Agreed, no need lock here. Compressor switches are serialized by the
module parameter lock, so this is the only writer of zswap_current_pool.

Thanks for the review!

Best regards,
Jianyue
