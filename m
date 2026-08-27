Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06723812C2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787805484; cv=pass; b=srd/7BZh5Ep+rBDXYpX4OTcmHPWwPxXBvowqe+554Ar/0sUn498h/QUZ6kEWL74r8zORtbuuvqb2rp6CF/XKzIE5g8/fgY77MEeTVgcosd6U3bZjsv1C0jx9jjBMCQUlX5nqsLW6yOI6tQNu3rmuzaXWY9m/ewh1qJ/py5HFZNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787805484; c=relaxed/simple;
	bh=/os/lBVKVu34/Sk/bZ6mF62MBv5i8FLdH5QjMQA8f+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qveg0Jy+lc+DlqkwnGnaU5FW1UU3uW6TXaKvW4FDHDXuEOPgnyasqNwQNgBX4RURrs4JFO8MOK2H1+G9d0berabWgGSL/nVu9ugSAhx5m62sj/mMfxpFcE6ASfEwXCegvwKJkyjP3/fbTgRo4tVzYSu955BpJyPEw13FgEm8VlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOj4//zs; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOj4//zs"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so3177106a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:38:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787805481; cv=none;
        d=google.com; s=arc-20260327;
        b=lf6wppaZKon7DY4PBgImbXnzxkxk/osVE55jaBa4yF7FRSmfQEV3jOCFGjUl1xP35I
         bXGyxUoc0NT0PhicWI7HkMobWuD+TWLDpWXY/1HJS6S6hBmcYprBXJhAfZ95FcfaUmLV
         0m4n+jPIVcBdLcXEHLlTHzfaY8va+zfwoVYZ+RqOB0qgfg3PaeoPuZiXsjbsW+SdSmil
         GvWEOeT+QR/a2XufCXkAAUmVoIaQN2z04sSegYVl8vgtR1CrNNlQs89zp/O7Mt3bHvjQ
         QIsnCQZz9pN1T9XtJGqWV7pVi0J3PkwG7IEW/gr+LinTJd84G/ng+aTO+QEDX7fe4Cgu
         yQuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O2htsjTtUphYSt5se8iPNa2KE41kzGCj3QpUGDniBOI=;
        fh=MnkbZARGLpr3zQmQZ3jHsCuVt+/0B9AN1Gwj59sZ9z4=;
        b=QPsVgoaDK02IiMBjs7KdiQKz8d2TCK8CP6Ji98HzqWm4JhV0svHPx01Dv6MG5b6AQc
         mdUhGLEoessZQmLd8MKKAkwhOhCBWGjBm2n6hVcBs4+UlGw9MWKDWZkvMoBVkwDcIbKy
         wRpZjiBm9qfPEQ6msMIc7khqUYpZd6ddAKJqHWWKTrcIknwW100XhFOBquu4Y9tGRRL9
         7Ijfr0/SC5J84VBOG62ejOlbR/lwYWegod+nfPPDeuPjTMDY3gmhsvf+w1uCHrWp9oj6
         xRBE8dpCU1/hbXxG148X/78zDogQ8A/DW03QdvKHCkUEJfSqsZkDuBdC+TqTl6lUwLut
         KMqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787805481; x=1788410281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O2htsjTtUphYSt5se8iPNa2KE41kzGCj3QpUGDniBOI=;
        b=SOj4//zsSnjeOWy1pUiA4h8GtJVRpEt0diS9Rd8UHk1Lcs/FKU2Rz5Qvpi/U5UbMgB
         2e/wsdJx1FRCYEDRY83mE0VBDfj7a474BbjD8/rPuy0rwAvvYkks7jBbUdZrjS8RUveI
         YV6H9KpUj1QkLnSJR2fGrF35nc1OEQoL65F2Ros2Tib9+Xkw3TUYuk5zciKwnOV6rOw5
         Tw7EuzZVtJfJWWlXR0/IeCZ9vOhKfg9HUjiqE+diHdE8ktPRxz9d81T5/bOHkBbwVpt9
         jvyH1jvherlLuXUS2ZbFRJoG6DU5IWSFh4YjAWT0PxuTNaJqj8h4JoEs84Hs8ekfA32H
         Qm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787805481; x=1788410281;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O2htsjTtUphYSt5se8iPNa2KE41kzGCj3QpUGDniBOI=;
        b=PZ+Hse6zUgiydNno+MFnV+Glo89erVDNg5dEdK0rAQFeXKCWMeF8IaLm/2A8JDWtLx
         yWOtrCWmmjbrCfX5wq73cUC5hSYGsKXMitfAtB+4uXb3o/TcHvykvWsjRkT4u267+Rl1
         epx4Kut6N0HsZ9qjv1vctJCAIrYtRw0bVFpL67qih69lEXrWLtHKxZfN86Y7Uss9TaEa
         +mJffrVDzHjN49VWdARKmbX77ELaQn7qELgkwbok5qgROcWOjgYvkA+khCqo+h/f7jv7
         fkLXx+CewIMQiMJ2WJvzygeUmzbgp+nFc/OpfMRZh/8cRlZ9BKbFsUG6DyZuWaOuJUw7
         YT3A==
X-Forwarded-Encrypted: i=1; AHgh+Rr4V+q41oYmHCB6baZM2DH8bwbODtbqrqh6kHvVvRof0AO4DYgu2QbE7uJNiYacN7PQO/D9F1YG+1wl/Ls=@vger.kernel.org
X-Gm-Message-State: AFuF++ly6cttJPiKjWBPuFWl5IjreGcMfLUW+omGydkJyqw37oP/Q5ur
	5RK9aIcAoP3vI9FN37PiHiIgAq1QR2Rj42PF+IVzH5y5TInh3r7gHro9GfeweMvTtr243Fu0yOA
	+La5f+mT4I3Ud9uz9g5hwQZdWIQhU7Mo=
X-Gm-Gg: AR+sD11/9fU09KXUZ+fQjaSxdIKJ4B1U3fmLF8DsU9MteSMi3BthTL9w+SjND/CSISr
	2CEd1VF8i4J6P2riQ/hqe/pVAA9aPwx5VaCjOuo8buu/aZIyhJibMWDsDu6Jaue80oqO8q4rfOM
	w8UN1qzZ44Wh1FOk7m0PDnE/zdmYRkDfkSvAlZIAOIq553YXfa7GzHVCklYPjEKoGzZPjFTUPSe
	Bqz49R3qoa4K3URsBZvScxlu38L+4vMV0tnKuLFR+c1vsQ6Aq+jhMIbCCk/gRvPO5Po9o6FPwrn
	c/smXkTXMc/ORkuGAeOCOThXdjbF9dTvh2L1DOehnWRiWv7vq0cRb5KNwqTBFhq8F83/R7L6gDa
	A
X-Received: by 2002:a05:6402:458a:b0:6a3:6d83:ba44 with SMTP id
 4fb4d7f45d1cf-6a5df5f0b43mr15774182a12.2.1787805480780; Wed, 26 Aug 2026
 21:38:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821102538.22642-1-baohua@kernel.org> <20260821102538.22642-4-baohua@kernel.org>
In-Reply-To: <20260821102538.22642-4-baohua@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 27 Aug 2026 12:37:24 +0800
X-Gm-Features: AcwNN1W_iNwvnVYGqb9JLU7jABYknRmkiSpEp4pVMz6naKioEKLVJRixCPrb4j8
Message-ID: <CAMgjq7Ar197XNkGf-aeb-XXAL-5uwO3jodOTtrgX-w6p-sOwTA@mail.gmail.com>
Subject: Re: [PATCH 3/6] mm/mglru: enhance cold/hot inversion handling in inc_min_seq()
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, chenridong@xiaomi.com, 
	david@kernel.org, hannes@cmpxchg.org, lianux.mm@gmail.com, 
	linux-kernel@vger.kernel.org, ljs@kernel.org, lyugaofei@xiaomi.com, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	stevensd@chromium.org, wangzicheng@honor.com, weixugc@google.com, 
	yuanchu@google.com, zhangbo56@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 7:09=E2=80=AFPM Barry Song (Xiaomi) <baohua@kernel.=
org> wrote:
>
> During aging, a folio's generation may already have been updated by
> folio_update_gen(), even though it has not yet been moved to the
> corresponding generation list. Such folios are hotter than those
> already in that generation.
>
> It makes sense for inc_min_seq() to increment the generation of
> folios that were never promoted during aging and move them to the
> tail of the new oldest generation. However, folios that were already
> promoted should instead be moved to the head of their updated
> generation, just as sort_folio() does in scan_folios().
>
> Otherwise, promoted folios could end up behind folios that were
> never promoted, effectively inverting their hot/cold ordering.
>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>  mm/vmscan.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 99ee3c833d54..3b618a51cde2 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3946,9 +3946,12 @@ static bool inc_min_seq(struct lruvec *lruvec, int=
 type, int swappiness)
>                         VM_WARN_ON_ONCE_FOLIO(folio_zonenum(folio) !=3D z=
one, folio);
>
>                         new_gen =3D __folio_inc_gen(folio, old_gen, &gen_=
increased);
> -                       list_move_tail(&folio->lru, &lrugen->folios[new_g=
en][type][zone]);
> -                       if (gen_increased)
> +                       if (gen_increased) {
>                                 delta +=3D nr_pages;
> +                               list_move_tail(&folio->lru, &lrugen->foli=
os[new_gen][type][zone]);
> +                       } else {
> +                               list_move(&folio->lru, &lrugen->folios[ne=
w_gen][type][zone]);
> +                       }
>                         /* don't count the workingset being lazily promot=
ed */
>                         if (refs + workingset !=3D BIT(LRU_REFS_WIDTH) + =
1) {
>                                 int tier =3D lru_tier_from_refs(refs, wor=
kingset);
> --
> 2.34.1
>
>

It looks more consistent with the one in sort_folio, the idea LGTM:

Reviewed-by: Kairui Song <kasong@tencent.com>
