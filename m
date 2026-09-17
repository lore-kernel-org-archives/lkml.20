Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE294E781D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789661380; cv=pass; b=d4gnvNhDasRJcWv+Ko2U6GNbn4BtSjN0Ddeyl0ETp1CKqJSiFUJbmjjjtoM0LSIREe1PugZ6EoYcdYR8m5QuL7sxdBmsnXbczlF7epUv9go9qblWi1+ODk84pJJIiMIBX6i2zZ6vOe+xY9Eu2ggtz0Tm5TipZNA6jL2MXiXf4Fg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789661380; c=relaxed/simple;
	bh=RgL79Lnzncx8mghSjwh58S2gtWUM52THqisj17I1bc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bq38CLZchW8H8vY0WWF1PtWouN5PtIHGSpBVTgy5r48OCfwcTH0GJZDmRUy00Dhm6ut6/oPkVyoJHHFuhfJ0WiqqGMLK4/q9ktT3gxKAE4Bvdtzf8Xb9t0WEMTuW7KNKitIgCmdl4k+VaMK42EqafBjiaNkgK9TzvHKhPmbwe+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IW4jqh6F; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IW4jqh6F"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66e56a1fe3fso923747d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789661376; cv=none;
        d=google.com; s=arc-20260327;
        b=O/486CdivBnMcF3Q4URYw1NNSYeVRU0b73VIWOnaSX2s4AW7GTwHRmv69tgj7LigcW
         FTS9mdWf1G7teRSQO3W1LZWqT4oW52Cp8lqK81vYxkNlTVopaDl3ui9VyMR1oQhT3knd
         kVfaXtGg2U/Db3RJuAESuTfqQwEsYmgRRvcTLP3cqaW+Gb5VenbcgezgawzHL+lK59KZ
         YdrzQvDNXAa5Qp9uQ75hzbaXkQ5VqXbpHHQLYV4ZlIPbJpGy66WlT8o7HqrBNdWlklK9
         VQ03Sb36JLF1S1OwfEHHCnZHv+AyHALI0mKsIBca9YxORGLBAOLjq7VemZgTYrNxGmey
         jjSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Utnj2BUg2wgBn65CQTDS0GpKi8jE06RpdxKfTfpq1t4=;
        fh=qOWGy8bt+wsPAigt9apeHC+c5BJFCN6b7X3LAq9uk5I=;
        b=QYgZdb3jOXng/a4B0/5wb1U7Ae8z6mrn0V9yRPHRuOJT6/27lHGYQQ8x5jvFcGSJ8L
         NaHgC8qkk/hVzeK/DOhj6jXEPIep8bFcRgnf3dvnGCunFFRJUbpFmI9Yd9T1iew1XRWF
         LH/JVtv3iGiw4HIaBbTHyak98LAkxpSazKdT0qL1wH6OYcJ0BiKA9qPjqpg2neuVsK8Y
         elx66BzlTL0aJw35fSnjMZC26/c4iUvJb9v0/v7JayU3wD60tI5F25AJXb5LlwzRDLru
         RASWTtjMTrj94UVzMpGlKq3YFmRCJi8KnfHRI/1CeTfI6q7lLrXH8Gj1Ts6J4kzrt0tY
         soLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789661376; x=1790266176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Utnj2BUg2wgBn65CQTDS0GpKi8jE06RpdxKfTfpq1t4=;
        b=IW4jqh6FKat/c6vz09WPPbCVCMJSw1M+MOsWovM8IE/Ch9ljuIzuaf07PFDF8gHh10
         f5WgCGrpXQLswESUaW0oN+TI793A8CGEtGgYfRl82DBgWjl9pLjyTgqtZlQc0tMw1zCS
         1MQMqo6Xe1JcLthxyRYLOVVxvn6rVbbQRlb5R0DqV/Xk8cb/wqljPWqDGxJWVEYzEzzx
         8hxRRQ9nqY8QcI7KY4CqOLtymQvvhdopNL5AjUYsF9JS79c8x9dJRmjuUojcpFBgRQzP
         7FvBbdS17Hg7+sjbXWWNDClg6IVe2GV2ARWFbUlY7U08v3BknedCEqU61od6F7+s3awb
         CCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789661376; x=1790266176;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Utnj2BUg2wgBn65CQTDS0GpKi8jE06RpdxKfTfpq1t4=;
        b=Q9L3TOMPaXpVj6IYdoMMNR/u7qbMuw115A92Yhugmr1Zui0ahnuVmwB75NK6oixQMZ
         qcPjaKtYZ+oKqtC9v6slyP/vnNnPL0I25eeqMJDoGYWD7FZ8xrI2hksUhZDUa/1SH5qf
         hKt1hm1BXx5lUvaLgLA6iWC1VmHqYs7vafU5h35QMaxCrQvKX2xSJNb9FVG3/bIfUias
         rcgiHo2DrBYyrGV7hz5SGkzL6e2BOMaTZjPgyTa1pPcftxflPLEW32i1pYTS90HhKaRW
         PHU462sOyjjEip+3k0Vefa9OLazGhQd0j+7D3SWCP0rIBExqQY0gXHImvH5SVhXLqiva
         Sa5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzM1T25RoWg6aC7hPSooIQsWq/FOUYQfU9M1CaLbmBQla1FYHlHavTAB6sguEBV6aPLh2eZfScDKEw0DII=@vger.kernel.org
X-Gm-Message-State: AFuF++kJn40MwYHPOE0yewq7vXfEOTapfGUFPb/CJcSioobg7cIXKUkr
	x3PkzdvMV0ZRaGSRF4w7r3SoBHkZQ+5dshedR0DkON39lc4lOD8tGXvOpJAdxDtfGgP/ojIGhK7
	eM/Ul+FdtslH5qTANJhcUXw6dE4xoWrk=
X-Gm-Gg: AYBFou2HgQoA/ee46tYq+nJmNPR/KITiECL4PaKM3jwhB5borRDIVvy84EuALOR1wdg
	12cPfsqtRvwnWHZalsCXsC2zwTLzjaeq77BPpnDUURuDzkNyeu8XTxT2NMlf/u5tKlI1BX0E7nd
	0jK+DjDkISCZ7ecYluJB2V2Wl2a2JKu2I8HyrxheDYCRq1z3m3DD6C/RyCRx1i2GghfniQsK8nz
	ukBQ6yqffyuAp26gCBIKErVl2ZtYqHquCYSVlpjfty0cJe2o+ikVKqTxvLuiYdb0ZMzp3dytWJO
	hao66OMqaldZ09a6EJCWx7VhuZK26T8gUbaESW6m6bsPIdFJiiZj
X-Received: by 2002:a05:690e:454e:10b0:671:4099:2195 with SMTP id
 956f58d0204a3-6716321104dmr1607824d50.26.1789661375920; Thu, 17 Sep 2026
 09:09:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917150631.1138698-1-karthiproffesional@gmail.com>
In-Reply-To: <20260917150631.1138698-1-karthiproffesional@gmail.com>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Fri, 18 Sep 2026 01:09:24 +0900
X-Gm-Features: AcwNN1Uk9UpyoJUob1Iy_YX5RVhaLvh8gpmUhgIMopwOfP5aLXWiHdFhc1xctuM
Message-ID: <CABFDxMHjbQhzvrQmRjo_F9Tf0_zQ20FxaSHFEQN8nfN+VgsF2Q@mail.gmail.com>
Subject: Re: [PATCH] mm/damon: reject zero sampling interval
To: Karthikeyan KS <karthiproffesional@gmail.com>
Cc: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 18, 2026 at 12:14=E2=80=AFAM Karthikeyan KS
<karthiproffesional@gmail.com> wrote:
>
> damon_set_attrs() already rejects inverted intervals (sample_interval >
> aggr_interval) and invalid region counts, but it accepts
> sample_interval =3D=3D 0.
>
> A zero sampling interval is not a valid monitoring period.  Sysfs "on"
> and "commit" both install attrs via damon_set_attrs(), so kdamond then
> calls kdamond_usleep(0) and busy-spins.
>
> Return -EINVAL if sample_interval is zero.

I think SJ already commented on a similar patch. please refer to [1]
If this happens a lot, maybe should we document or add a comment about this=
?

[1] https://lore.kernel.org/all/20260722094304.3132750-1-dayou5941@163.com/

> Signed-off-by: Karthikeyan KS <karthiproffesional@gmail.com>
> ---
>
> Hello,
>
> I recently started reading DAMON and just found this one.  This
> change only tightens damon_set_attrs() validation, in the same place
> as the existing sample > aggr and min_nr_regions checks.  It is not a
> crash, UAF, or race.
>
> sample_us=3D0 is accepted today, so kdamond_usleep(0) busy-spins (about
> one core).  Sysfs "on" and "commit" both go through damon_set_attrs();
> one check covers both.
>
> Checked on v7.3-rc3 (238650ef6c7c):
>
>   unpatched: echo on with sample_us=3D0 succeeds; kdamond uses ~97% of
>              one core.  echo commit of 0 onto a running kdamond also
>              succeeds and it starts spinning.
>
>   patched:   both on and commit return -EINVAL.  Valid sample_us=3D5000
>              still starts.  After a rejected commit the same pid stays
>              on and does not spin.
>
> aggr_us=3D0 with a positive sample_us is already -EINVAL from the
> ordering check.
>
> Thanks,
>
>  mm/damon/core.c             |  2 ++
>  mm/damon/tests/core-kunit.h | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/mm/damon/core.c b/mm/damon/core.c
> index 644daf5a1656..376c3e2cbe00 100644
> --- a/mm/damon/core.c
> +++ b/mm/damon/core.c
> @@ -1060,6 +1060,8 @@ int damon_set_attrs(struct damon_ctx *ctx, struct d=
amon_attrs *attrs)
>                 return -EINVAL;
>         if (attrs->min_nr_regions > attrs->max_nr_regions)
>                 return -EINVAL;
> +       if (!attrs->sample_interval)
> +               return -EINVAL;
>         if (attrs->sample_interval > attrs->aggr_interval)
>                 return -EINVAL;
>
> diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
> index 4a536d41cdb2..ec8ef71956c8 100644
> --- a/mm/damon/tests/core-kunit.h
> +++ b/mm/damon/tests/core-kunit.h
> @@ -658,6 +658,19 @@ static void damon_test_set_attrs(struct kunit *test)
>         invalid_attrs.aggr_interval =3D 4999;
>         KUNIT_EXPECT_EQ(test, damon_set_attrs(c, &invalid_attrs), -EINVAL=
);
>
> +       invalid_attrs =3D valid_attrs;
> +       invalid_attrs.sample_interval =3D 0;
> +       KUNIT_EXPECT_EQ(test, damon_set_attrs(c, &invalid_attrs), -EINVAL=
);
> +
> +       invalid_attrs =3D valid_attrs;
> +       invalid_attrs.aggr_interval =3D 0;
> +       KUNIT_EXPECT_EQ(test, damon_set_attrs(c, &invalid_attrs), -EINVAL=
);
> +
> +       invalid_attrs =3D valid_attrs;
> +       invalid_attrs.sample_interval =3D 0;
> +       invalid_attrs.aggr_interval =3D 0;
> +       KUNIT_EXPECT_EQ(test, damon_set_attrs(c, &invalid_attrs), -EINVAL=
);
> +
>         damon_destroy_ctx(c);
>  }
>
> --
> 2.34.1
>

Best regards,
Sang-Heon Jeon
