Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6F044C506
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455862; cv=pass; b=Q+WV34H8oWtuGQXJMA+MCo6+lGTGU86xLBLRpuTa9u5QBWnqDZ4Ua3TvSNPDX86etDyVFVSLGNNZ0MHSsP+jmDCNd4w9iXdQ2bS+xlt5R/wrdScq3wCjt0Yo6cwHqPnse+AR+6GdqzNOB80ytU4aXDpUYdxKXsWCuZuOwlcL6gY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455862; c=relaxed/simple;
	bh=bYYVgBnGPKY5m2bD0aoFpeUEfd4ZsBb5Sr3Pzz074UU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wd7fws2do/KCW+tssZw4WWDm4CB9Vr9qlFtI9WzsiEVfGam+h6q099MWdyHuub7lGXy7oi9xJCnktvgTCrDYnEJ0WaqwxDS1CLsJfTIVrvYy87fwXwD7LA0d38LNY6v4hVRAerpZTIr99fjgnMlRA1mVKNIlc/dYtgCT2wXGIZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bpq/xcsx; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bpq/xcsx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49e6e69d528so29195115e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:04:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789455859; cv=none;
        d=google.com; s=arc-20260327;
        b=DqfG+rg2wiSUj3OzythLh/HmEC2ORaFvN6YohggL3jCuUz2EGWNNlAhewCQFYqdBqP
         zftyDJgkLC+j1wjDzizQQRp9VCY5nzYudaV/F4Y9SvP7jbAj8BAKncZjowlC9mRwmndV
         qD8C3Jp6CFsdgcJTXNoSgb+vrPu9QcRppwqCSDLt/tXcZlPG2LK7/IxlkJEFzQIA+oFt
         PoC8nQyiPP0IC/ZreKhD70s3xYqZjTcWa9/9e469PlsdGOJ7KdoE7N+I+XPpiv1tF+KM
         2myYer3LAhgyv04Dtgfh6EAJOPk/jV+A7D7x3oy2gsAurpisP7y85Xz93Es9wZU1IW6T
         RRdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5rBX2/r5Oc8pD3Msk2TcE9A0RNIhE2Nvsx1mMLMnh+I=;
        fh=6p+4rx6Ol8uxWGRNhpNUgvWb+EUWFX0tpTzFeP6RGYk=;
        b=WRIPDT2OZ/biORynO3NJ+yFuv9J8oouUdI6jLdQn+50Rb9n8ywYa/iEHqgW9EAz8wB
         IrP5jlMLtPeu1eDRlue1lVyRKWTkVy729R/K8TK5JKT568/LVsQbjVUPJdyWgRncv8Q3
         xOavOEDzuiPbSyeT9l5R2yJcUGZ4vs5Dq5bBKd91ac2+q+edrGcOxu6EkTbtZjEK25bs
         G1NBPlQeoN95QmQ5JISw17+Nn3/bubNh09G4sUYvLRrH7BWxxVgVoAZz0aZvJi9vtvyj
         rjuGjalUnpjqPkdGkvGMMVVV3NqNJL0/Vv/UD1ST2ejj6jWiT1nP+FkU2V6qdFN85QYB
         rKlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789455859; x=1790060659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5rBX2/r5Oc8pD3Msk2TcE9A0RNIhE2Nvsx1mMLMnh+I=;
        b=Bpq/xcsx5y/OFvFIK2LWEhfLR0jz3NMNQE56VOV93btPRLhyO0gV943QciWgGQ1qxj
         GX21YHVGUBNrJvl1FSW0DTKozFf9jzC7QTLTl4NOawA9ueSR9vjv4AlTFWujrsGeM0Qz
         ujTnLcfCntVyYPfc2FKEQFWjixR1jLR6dHeyS7tlUsRfHV4axnHCmiIfKUChv5c4DPxB
         UWQyWxsXkFv5wUdqqPlT97QnPV2pxQ27JvgMQz4MCUAgTzvnJReVjqXTY5IPAZX5j2yG
         LyVRrELCHXhZhIb7mxGHqpZrKarp8YigZX6zcPWLFGl6bbDsrXL5yZ4xCDwmU7z3jlzu
         S5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789455859; x=1790060659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5rBX2/r5Oc8pD3Msk2TcE9A0RNIhE2Nvsx1mMLMnh+I=;
        b=elLlmrdGKZ1jzaLnXs/pf3XraNftScJhq5UkGzxhHUVLX2T3RERDk15A2yrq1W0qAI
         mEgtA9oPLzS55MQfLYnJuUNtPH+veVxzP3Dfgy+SxwBd8d2pMxi0/pDqDcal+l9TwBat
         esuMycwemlZlj9eslUDhifws5HUogj8UdlIulyijW8gB8/FVqwlTeiRRY2kZ4xS8fL8c
         XrUO5N4kdGwCWoR408g8OCCGNChkP3/BnciYWNpZujJzoLrg6Orh0PdJTyyRkAZjRzd5
         LsEyHoYJMIo1APu/7WS2hvCC4k80U4j0UEhgtjSZEhHXWXLhfx+2DOu+nXNOpU8+vWHL
         nuiA==
X-Forwarded-Encrypted: i=1; AKwUvBxImyAqxHAJ50zOgdyxa5dHtYkxSY9GQlGFSKiRQaUSz+pNoJwBaZiClPQT4LMicC+iJfQKXaSqiQJ5Rvc=@vger.kernel.org
X-Gm-Message-State: AFuF++ngsrO0aACGkzMBCGuqC96SitXVBoMdq7VS2z/TN1PauXnb/Zwi
	ZEfgDKfFdYybnTWflxUxJNv37e5fRm2eT+wp39Uau0lUgp0j/sYUMcObxSUMClxJSqkeOEzeI+f
	oye1CJVftISEfKg0FJunqN2wNZKFAxW8=
X-Gm-Gg: AYBFou1wSo33aCEs+TwPQvyF7Ci//G/qsO0b2NKmZnz7f/K8UwS39dvEFy+16rpCVTD
	ajB8Lxf8crtH9+5pu65Tm0vMnXdA6KWi0LPluVl/aQWHprUFeM6VZOcUWrIXTA/Rw9KlaOT+R8A
	mZpsWeJC6eHR9tmPdhztKb2dmHTQ4znOm1aRzFGl+NcC7qMOQIvrlBr58GrimVmyTpNvtOTKq+S
	WM5Gk5Wti74KGVZKbB41EVo+CupnnIB2ByKYdURLnr/LIGHhr5OccMG2Tfy0Yppo/C1YUTq/s5t
	N+XWj/UM3ZeCslpByPgp39pLZOmFrDxxNOxWVUuj1hQ1kvmuj3Fv/DxcFnDhCZmP8fuCvSW2RzA
	mE3mCyT1WNA8s1A==
X-Received: by 2002:a05:600c:6218:b0:49e:7423:687c with SMTP id
 5b1f17b1804b1-49e7a65cb0bmr63673125e9.1.1789455858317; Tue, 15 Sep 2026
 00:04:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915060937.3423-1-kmehltretter@gmail.com> <20260915060937.3423-3-kmehltretter@gmail.com>
In-Reply-To: <20260915060937.3423-3-kmehltretter@gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 15 Sep 2026 15:04:06 +0800
X-Gm-Features: AcwNN1Us-54OWzGUJ1Z9_Z4eN7azOm4Uvr77tQtD9tUxI7JjaSi59KP2yTRjYgg
Message-ID: <CAN_Opa9rS45S_MHbmf63KC0LY9AGAdAC5r=vv_qcYMVAenWosQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/damon/tests/core-kunit: test PSI goal rounds under
 the temporal tuner
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Lian Wang <lianux.mm@gmail.com>, damon@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 2:09=E2=80=AFPM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> Exercise a PSI quota goal under the temporal tuner on its first
> round, its next measured round, and after a goal commit. Use
> ULONG_MAX as the target so the goal is not reached during the test.
> Then check that a measured round which does reach the target sets
> the quota to zero, and that the consist tuner keeps its quota over
> an unmeasured round.
>
> Without the previous patch, the first and the post-commit checks see
> a zero quota.
>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  mm/damon/tests/core-kunit.h | 69 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>
> diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
> index c01e6a75cadc..2b9b24ce7dad 100644
> --- a/mm/damon/tests/core-kunit.h
> +++ b/mm/damon/tests/core-kunit.h
> @@ -889,6 +889,74 @@ static void damos_test_commit_quota_goal(struct kuni=
t *test)
>                         });
>  }
>
> +/*
> + * Unmeasured PSI goals must not disable the temporal quota.
> + * Keep sz * 10000 within a 32-bit unsigned long.
> + */
> +static void damos_test_set_effective_quota_temporal_psi(struct kunit *te=
st)
> +{
> +       struct damon_ctx *c =3D damon_new_ctx();
> +       struct damos_access_pattern pattern =3D {};
> +       struct damos_quota quota =3D {
> +               .sz =3D SZ_64K,
> +               .goal_tuner =3D DAMOS_QUOTA_GOAL_TUNER_TEMPORAL,
> +       };
> +       struct damos_watermarks wmarks =3D {};
> +       struct damos_quota_goal src =3D {
> +               .metric =3D DAMOS_QUOTA_SOME_MEM_PSI_US,
> +               .target_value =3D ULONG_MAX,
> +       };
> +       struct damos_quota_goal *goal;
> +       struct damos *s;
> +
> +       if (!c)
> +               kunit_skip(test, "ctx alloc fail");
> +       s =3D damon_new_scheme(&pattern, DAMOS_STAT, 0, &quota, &wmarks,
> +                       NUMA_NO_NODE);
> +       if (!s) {
> +               damon_destroy_ctx(c);
> +               kunit_skip(test, "scheme alloc fail");
> +       }
> +       damon_add_scheme(c, s);
> +       goal =3D damos_new_quota_goal(DAMOS_QUOTA_SOME_MEM_PSI_US, ULONG_=
MAX);
> +       if (!goal) {
> +               damon_destroy_ctx(c);
> +               kunit_skip(test, "goal alloc fail");
> +       }
> +       damos_add_quota_goal(&s->quota, goal);
> +
> +       /* fresh goal, first tuning round */
> +       damos_set_effective_quota(c, s);
> +       KUNIT_EXPECT_EQ(test, s->quota.esz, (unsigned long)SZ_64K);
> +
> +       /* second round: last_psi_total is initialised now */

Could we also check goal->last_psi_total here?

The first tuning round should consume the U64_MAX sentinel
and establish the measured state.

Testing this explicitly would lock in that state transition.

Thanks,
Kunwu


> +       damos_set_effective_quota(c, s);
> +       KUNIT_EXPECT_EQ(test, s->quota.esz, (unsigned long)SZ_64K);
> +
> +       /* commit a PSI goal onto the initialised PSI goal */
> +       damos_commit_quota_goal(goal, &src);
> +       damos_set_effective_quota(c, s);
> +       KUNIT_EXPECT_EQ(test, s->quota.esz, (unsigned long)SZ_64K);
> +
> +       /* a measured round that reaches the target disables the quota */
> +       goal->target_value =3D 10;
> +       goal->last_psi_total =3D damos_get_some_mem_psi_total() - 10;
> +       /* U64_MAX marks an unmeasured goal, keep the sample away from it=
 */
> +       if (goal->last_psi_total =3D=3D U64_MAX)
> +               goal->last_psi_total--;
> +       damos_set_effective_quota(c, s);
> +       KUNIT_EXPECT_EQ(test, s->quota.esz, 0ul);
> +
> +       /* the consist tuner keeps its quota over an unmeasured round */
> +       s->quota.goal_tuner =3D DAMOS_QUOTA_GOAL_TUNER_CONSIST;
> +       s->quota.esz_bp =3D SZ_32K * 10000;
> +       damos_commit_quota_goal(goal, &src);
> +       damos_set_effective_quota(c, s);
> +       KUNIT_EXPECT_EQ(test, s->quota.esz, (unsigned long)SZ_32K);
> +
> +       damon_destroy_ctx(c);
> +}
> +
>  static void damos_test_commit_quota_goals_for(struct kunit *test,
>                 struct damos_quota_goal *dst_goals, int nr_dst_goals,
>                 struct damos_quota_goal *src_goals, int nr_src_goals)
> @@ -1887,6 +1955,7 @@ static struct kunit_case damon_test_cases[] =3D {
>         KUNIT_CASE(damos_test_new_filter),
>         KUNIT_CASE(damos_test_commit_quota_goal),
>         KUNIT_CASE(damos_test_commit_quota_goals),
> +       KUNIT_CASE(damos_test_set_effective_quota_temporal_psi),
>         KUNIT_CASE(damos_test_commit_quota),
>         KUNIT_CASE(damos_test_commit_dests),
>         KUNIT_CASE(damos_test_commit_filter),
> --
> 2.53.0
>
