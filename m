Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142AD318EC7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789438799; cv=pass; b=VAfkP8/lU2WgeT6kPOs7ZKyhy/WMCZdAdMb8kO/LKEoaNnrB4+qjCXrqJvMf0kqGt7R6M0evK859P+UbkNlMEZCbPHl4VLvE0HBCU61gcrKHGg9GMQvWyxlAViBAXFIYSIYD9L8r5YcqmZdQurcVxcZGDke5zDhsV1huKTDn9Nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789438799; c=relaxed/simple;
	bh=AMPDRjUt6HdBBpjJECQoFS9UOZEk/Aun9vZfZ71povQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tseQ090agf7DltYKrnAlXFMATSe9LIl2QKorB5zqGK4qd9IzIS0mqK/q5lkd5q1OZza4cCp2JgIShCQbAMazM08P6SaSN7ZpvCHL0JP6zRdaRq8Of2wKT+FkAm+vslQOQCbhn/L6c2Le2ufCj51mvlkqbl73CR35tVXuzaMumcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3yTSaVP; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3yTSaVP"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so9109545e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:19:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789438795; cv=none;
        d=google.com; s=arc-20260327;
        b=cwXrVw7v7EFo4QgYpG0H5Z3uyDQ3BZrOjg1wppiJx+u2hc5/N1u276UMYqCYxq1X39
         lI/ByC1ZaZxqICF+uhKiLQV8WYLs0nZFXUoosGC3Rk0X4gV19EnV3M8fXKobPDlrOD2g
         99qcZeIOuV17kKpcsxiCIJioCoTK2aWu9y1w+Zp7iBpFoHEOHl8DcieYt4gMWDXDpp2Q
         zVIB0MP4NQMgMVs7veZ2fMbFQX/iRiFUX9dik/GGg1z7oayEdUttFrl5ab+Tv+sapUSX
         wXjYj3VmFNu9HJOvYvNN4B3qeB6h4vSJc2Uzoib/PCf9+7Jvc/cKSbVVIf60eBUV9t7k
         7Esw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uz6pzhfSfo3jkEMjApuPj77vcnUzEs00MyRYle4FEto=;
        fh=W0e2bouKJjCXTXVUKng9qWFVwyoB+T7aKyJaEi5nQSY=;
        b=adougaO2oJW0I0895iGftu40UdLI347azggaFR3owa5S8+48BNA5NVwrJeDXbQIPgo
         R+nZu9GmaWYrIps4lnx+v9fQi58/JJtnPON/4qA9cq2FQiZEipJB2/GCyRAzFJfiDZQ5
         FVBcPSEm2A8gA+bMXhGAHtYqAVw2/jdEEDG+OfFgKYZQDHTwmagT3KmnVIuPNiZTuKh8
         m6u+EwZdvkgAyK+8GUVKzDhZaoLm3pOlK5eTF6PgJWK2TnwG+aejtbioItEjhxW00hxm
         9Lj8wO2ZFK7WM2gV7X+QZaiSxYL1qdqsLdF1kxtMK9P177g5U6hD8VHe7k/zp4dskrDm
         JRaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789438795; x=1790043595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uz6pzhfSfo3jkEMjApuPj77vcnUzEs00MyRYle4FEto=;
        b=i3yTSaVP87L5ECPiwa38OFCRcmZ6AKHLiea5kUilVLddCapsltOGYZ4CgPkXvXqQo0
         f0BS+9b/u2trk4RcHVKWwhxF17wdHn64nR720GxQKPXkKJv/HoOE5oz6nyrWDQ0blfij
         ppICyQfgO1ecO9EvdebwSIVcrbLfJvUf5d2tf/5JV45m1cvQ9kYFqFUImIdnGrcaeAQQ
         km2Ip3OPoIFZQXTRwiMO/sWe6q4lGOKt1SmFZbj/czu/l/4YrSYH16WgqX5K4u3uYk0s
         O9W+bcSpK05p9gblYX3DGa5tt+nfVGACTv2XtB8uB/+6t7JdRZZk09zfD+9xNyrI/bgk
         5W8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789438795; x=1790043595;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uz6pzhfSfo3jkEMjApuPj77vcnUzEs00MyRYle4FEto=;
        b=NecvdHm+azDKtgvGj0aB1HvvBuWIS9/QbrtJlLgBd7hK40/IKYswP98U+K5edbD4Bg
         /JDKM3Lrhrx8i4vaJoGP/VeTMDoKKlttJ9bMRD2Q5wEwmQcDMDqBoO6iNAL4Z8BqIJ7D
         JthhoILdDhO7yUUjFIb1esyT0d3OBcVWnTh9Xy/RwNi72Q6NbscyWP2IZgKhXpwQRe3v
         1d3KFyLtu68+hxgy7IBd8TRnV4wGy/kvskBSDlv15pzV8SJYByPNxl4vZ1jLvfwK0/BG
         CuAfdOjt44DRvFdq/s9gFtvr2LOWBy/MOO8fDGkgd9KAV2ftoAZT9q/h1a+0+O+kjzxH
         9nzA==
X-Forwarded-Encrypted: i=1; AKwUvBzO+OST8zYiCyMCuCjWRqWb9YxVci4CPXYGigHR95UIkNR/sZq2Iol7m/rosq+eWOW7J3fk9QC9vsJ9RV0=@vger.kernel.org
X-Gm-Message-State: AFuF++lFbW3vZLAXWXJ3esYe/7JxvBE3u++MkRsKAr/tdFxjQ4uWpkwD
	RJUaYusGgO44u8Cz29tVCJ84+3Gxrm7y96HbQy0BZRYvQiYWUWSm0icCoZ0TYAwlKtfmF+tbAmk
	RY9ymkPef1kltvev7U0ll3KKQGZ/Kp90=
X-Gm-Gg: AYBFou3LcqOzV+1t2HJ8p4JLkBUJhxApFm6QKQFwqaGEaUkR5yotlorKORR+MrV/mmk
	Ha4PwdAgK96R6FwE+fzocZaT0HFCd6tl05rlxOXoS+Oh4374SKdnNKWUGOagWCo0VqMnfVmPDWN
	zYa3z9LUFeXTXwwRVIxUcfGMXIlLOCC+v5inbk63IOFFcqgJ9DjUrEZM0drgl5qfH1a3dbrcgp2
	W3Hxa1orqtRN9v77kg12fXI97z2sDUQYZkCt8vZd177As8rjK/yufqhv2m8cCKGUIS0eOeloqKe
	FyFWSQvMEp98KV2E+RCfG3bkGGwfu2bdKfRECyxe5n8J6vQ/XmEjOfwJaWLl6f16EEIsVzWnvhJ
	Uljq7NRxHmubh
X-Received: by 2002:a05:600c:5307:b0:49d:1e79:35d6 with SMTP id
 5b1f17b1804b1-49e7d750cc2mr26446565e9.14.1789438794905; Mon, 14 Sep 2026
 19:19:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914150150.1507525-1-kunwu.chan@gmail.com> <20260914151617.97903-1-sj@kernel.org>
In-Reply-To: <20260914151617.97903-1-sj@kernel.org>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 15 Sep 2026 10:19:43 +0800
X-Gm-Features: AcwNN1W8hM-JtjZLNyC-iYEta08SQzUOjubSm-5TdDfo7dJjMBqxsOi_D3YW6Tc
Message-ID: <CAN_Opa8qSHcDNU8k=EWMywUADizJEhHPpuia3jMcZ13i5iYXgg@mail.gmail.com>
Subject: Re: [RFC PATCH 4/9] mm/damon/core: use damos_quota_is_set() in damos_adjust_quota()
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lianux.mm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 11:16=E2=80=AFPM SJ Park <sj@kernel.org> wrote:
>
> On Mon, 14 Sep 2026 23:01:48 +0800 Kunwu Chan <kunwu.chan@gmail.com> wrot=
e:
>
> > On Sat, 12 Sep 2026 13:08:05 -0700 SJ Park <sj@kernel.org> wrote:
> >
> > > damos_adjust_quota() is manually checking if the user set the DAMOS
> > > quota.  There is a dedicated helper, damos_quota_is_set(), for the
> > > purpose.  Use the helper.
> > >
> > > Signed-off-by: SJ Park <sj@kernel.org>
> > > ---
> > >  mm/damon/core.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/mm/damon/core.c b/mm/damon/core.c
> > > index cf10f6d725c19..dd27068cb83e3 100644
> > > --- a/mm/damon/core.c
> > > +++ b/mm/damon/core.c
> > > @@ -3344,7 +3344,7 @@ static void damos_adjust_quota(struct damon_ctx=
 *c, struct damos *s)
> > >     unsigned long cumulated_sz, cached_esz;
> > >     unsigned int score, max_score =3D 0;
> > >
> > > -   if (!quota->ms && !quota->sz && list_empty(&quota->goals))
> > > +   if (!damos_quota_is_set(quota))
> >
> > Hi SJ,
> > This is more than a cleanup, because damos_quota_is_set() also checks
> > quota->esz, which the original condition did not.
> >
> > The path that makes this matter: damos_commit_quota() copies ms and sz
> > from sysfs but not esz.  So if a scheme runs with a non-zero ms, then
> > the user sets ms=3D0 and commits, the running scheme gets ms=3D0 while =
esz
> > keeps its old value.
> >
> > The old check would then return early, leaving esz stale.  That stale
> > esz is visible to damos_valid_target() and damos_quota_is_full(),
> > which also use damos_quota_is_set().
> >
> > With the helper, damos_adjust_quota() proceeds into
> > damos_set_effective_quota(), where the first branch resets esz from sz
> > when ms and goals are unset.
> >
> > The code change is correct, but worth noting the behavioral change in
> > the commit message.
>
> So, if user sets only time quota, and then commits the quota to zero whil=
e the
> esz is non-zero, esz is never reset to zero.  As a result, DAMOS keeps ap=
plying
> the action with the esz forever.  Correct?

Yes, the stale esz path is confirmed.

One clarification, though: it does not keep applying the action
forever. While charged_sz < stale_esz, damos_adjust_quota() still
returns early, but damos_apply_target() continues to apply the
scheme and damos_charge_quota() keeps increasing charged_sz.

Once charged_sz >=3D stale_esz, damos_quota_is_full() returns true,
so damon_do_apply_schemes() skips the scheme. Since the early return
also prevents the charge-window handling from running,
charged_sz is never reset, and the scheme remains permanently
inactive.

So clearing the quota can result in the scheme applying up to the
stale esz, and then stopping permanently.

>
> If so, this may deserve Cc-ing stable@.  Kunwu, what do you think?

I think this is a functional bug in the existing code, and Cc'ing
stable makes sense.

Thanks,
Kunwu

>
>
> Thanks,
> SJ
>
> [...]
