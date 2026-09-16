Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC27F3BB9F3
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541467; cv=pass; b=HoG7BWHpYZsLYSrqRQSBfXfBX6BePGFw5oT2CWtMIY4ExSteBxbxPVPm9jNHf4nkGqKdkTPBBemB3EPNeEjPBBtH3l2AB0e20X3UhOdfP2uIeRkCHi3Lkb4Q3wkxeGBce9197W3PvviizHVtPYSEFKZfzo04o7Li7KdB/pFtmi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541467; c=relaxed/simple;
	bh=7fmSOz7iXB5a8XLL2bezW2+ceV14IeadbCUEVSxZg+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fE7G00bwTv6tGSgxw2FnjPPLzNZMHCUAxSt1wWx5rXgmcyyKbpi0igKkDJugPyYAzWVUO1u2GDnGHMHHQB0lgcw/tlLqKxMrgr+ksjxtdGMgvBPFIxQ5EEjBTPzF3PSAaCUGwdefTfdui9FklP7G88s0OHyCOK/zhZGZzxkSPOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9cHJTSN; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9cHJTSN"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b91369d18so3690075e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789541464; cv=none;
        d=google.com; s=arc-20260327;
        b=GLlhA+QvrkFttvoXf6ntrEJW83nwZI40KYhBjZSdfXVhJRJ458Fy9/gSIKSUYFDpTu
         JvtAuFWKecvAzgQlkVHS6xPSvFeJmYrlNlEB3VTFVFqwks8TnVoSdUc3ExFRT8PkaDcG
         s2mYjsg6TeLpkILOnalX8lncME6nSiktjTm82z3SVG7cQrYns1km79lRwgXKffxChOjY
         UScTKyXiIPb9VeHvUCv6uwXUCGXPBmpG6ghXQwoowaW303PuurOYU5tpRG8oXkbqcIBQ
         oOl8M7Mszplxh99a/9wZ/gKM32KOJHM3vPelm0q6eIISjbGvBRoSlYQXi/hYOtKUtw04
         byjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6n5rbrY/01roG/1TlDqdvk5Po6lB1Q7LrGFLCfNfZQw=;
        fh=6xopT/cctCWPW2LP4CMYaEkuOYaMGa1zD4PmWSJPoXg=;
        b=q9z/W/bWH3OCwQAosWfVHcxgiJtGDecC2xwgLS5HMnJ/w77owlTzkKsygNgyX59UoI
         VY/0qB+zoltlehwFVMwNP9lU5T1oVWUhjii78zhiKk8NWtV7DLpAT/k1eLm2IFWwU/49
         WHEhTSFvCHoHBTInw8+vshaIMlOt2oNqkXwme6Hb5JHYyk9J2RfYFdJqjJsWH4Z1OqxG
         GHGqcbIEktaqLNmI5OznAArfovQtI6BJyZQz97pwjjabdU5orYVioRxJH9TS11ZKVr6Y
         1lYC+joIGdOc80OWMads/3krinbP8hOpRol8q1eO04EEEju7oxyu+Ac20CwEw+7W0wAF
         /AxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789541464; x=1790146264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6n5rbrY/01roG/1TlDqdvk5Po6lB1Q7LrGFLCfNfZQw=;
        b=l9cHJTSNnz4yD3VVv9yB/tSPXPnvxKtcTJkdZl8eITTDh615Fu53MHlCz3J9j2+AAp
         bc8ZKVSJ9ABh4PKjPsYLvTBttfnVQX1xuIqlWbKUCbnricvPVj2LHabVWNF6gtkL3cdx
         GgfLhOwNkQczqVMZmrrckqKnd4gcuN7EBe3Qpq0vXbWHnRuqxSEN+WE9QVFwBt2+oAJ8
         aL+TFeERcAVvvcu0GKewCyQp49d4hc+D7I9qalh05NP1S2DZ2+0CLUCZATDNTLF6ofJy
         Pu1t3wS8AeYrjeke7OxwCohhdwYWwR+CRDA/Fqu3OjzqSB93+P8RWMwTKsRBNbdXWWUt
         Hpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789541464; x=1790146264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6n5rbrY/01roG/1TlDqdvk5Po6lB1Q7LrGFLCfNfZQw=;
        b=OgB6vYWVt/YSNguNRb+W9p+5qyJ/M6l8pfqF5AYtsznTcIoDGxyXdWK6bojKibLoIF
         ZPAzbwiq9OGg9XtlLaaSQ2ldNqlDo5ns+6LhAP6nHoSjhiJnZJGYVd9lQr86HfdVJGIT
         cj+fsP+0506/MUHHKx27ZATtmuOc2uPobszPdy/1azi8V9sd6Lc79AVNkumJGBZnJQqX
         sKxcioCqe5Qr3Zf9ody9012uvisyUMYoMNDulNfH9bvAeddWhKjwOtZJNVpvBhcD1LcA
         7NMfQgr6sGFoVQlYt/zQjNiXqp66cmlS6ZFYctZLxFz122rG3BJ/3PO+nkSHV5rTqPjI
         zsLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTT3jiaS9umVVUunTIl3xUwpgmWCbkg6/Z6vI9rU2jFwdFbsSRb5dZtbL2QSDkghufJeOmSmMVa5l2jN8=@vger.kernel.org
X-Gm-Message-State: AFuF++kLfDeTEh4ghen62vreoPfggUiliplXaKU9oaa2AgaMLxkxeVrK
	eiTYvnqfxwrWaBgn2YMMn/7MOYMZHd0hgwqw6SftiRJ/CS2ETSnXfY/tFE4fKXpQVsGpM/jiIvC
	zVGFknXjJORAC53HMnal1XMTaMa0zuu0=
X-Gm-Gg: AYBFou3Wm2pTTA+E9oU0dTFwb5CmkF2sPRq+n2WFHtLeylgdljXmLxTM3aS3btr1l8Q
	IAsIagMoonCku5M47bVO+6ItkwvOi3n5GEkVYAMCTGzmZHdIMxwePb4ir+Ug03XKvOP16GMFWz7
	0HAwAspBz9XGdOg27xFHWcBkkVtJ6ILreqns23e46puPV1OIbLOER7X70+HbnqGhoPXeZk0Juft
	LrgjapcuLHL6C9Rv4wmtU3LyEEoW3Y6XWy04XLujBW8IdhtROmnZFul9fKefPhGubEfo6Xu6cZw
	bPHdb9O4wKo2mXRNSV4l0vXTcHlKbYuQGocXTBuqHCNQAcK95y23cW4apLXg/MlnX5i0k38AikH
	OcBvrGB+jvAHSOQ==
X-Received: by 2002:a05:600c:4505:b0:49c:fc6e:a3e1 with SMTP id
 5b1f17b1804b1-49eb7346118mr12408175e9.32.1789541463728; Tue, 15 Sep 2026
 23:51:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916041409.106926-1-sj@kernel.org>
In-Reply-To: <20260916041409.106926-1-sj@kernel.org>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Wed, 16 Sep 2026 14:50:52 +0800
X-Gm-Features: AcwNN1VhHl9-ceP5c4iG_sWBNprIthUHetKIW-a6tK-i7YoEH8Zpfkg8hmrI5R0
Message-ID: <CAN_Opa-Cb2TG0C1bZix7LqFk_LH-0qgNgkj8GU4kUE2FwtA7mQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2] mm/damon/core: don't skip damos_adjust_quota()
 while esz is not zero
To: SJ Park <sj@kernel.org>
Cc: stable@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	damon@lists.linux.dev, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	lianux.mm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:14=E2=80=AFPM SJ Park <sj@kernel.org> wrote:
>
> DAMOS could unexpectedly stop working when a user disables quota using
> the online parameters commit feature.  Fix it by correcting a wrong
> quota unset check in damos_adjust_quota().
>
> DAMON users could disable all quotas by unsetting time and size quotas,
> and removing all quota goals.  The intention of disabling quotas would
> be making DAMOS run at full speed.  When such quota disabled setup is
> detected, damos_adjust_quota() skips all its work.  The skipped works
> include effective size quota (damos_quota->esz) updates and charged
> quota amount (damos_quota->charged_sz) resets.  The intention is to
> avoid doing unnecessary work when quotas are disabled.
>
> However, users could do the setup while effective size quota is
> non-zero, by doing the disabling with the online DAMON parameters commit
> feature.  In this case, because the effective size quota exists, DAMOS
> will keep working with the quota until it is fully charged.  After the
> effective quota is fully charged, the charged quota amount
> (damos_quota->charged_sz) cannot be reset because damos_adjust_quota()
> skips it.  Then, DAMOS stops working until the quota is newly set or
> DAMON is entirely restarted.
>
> The problem happens because damos_adjust_quota() assumes the user setup
> for disabling quota immediately disabled it.  In reality, the quota is
> still working until the effective size quota is also updated to zero.
> Other logic for catching that uses damos_quota_is_set(), which
> understands the fact and therefore checks the effective size quota in
> addition to the user setup.  Fix the issue by using damos_quota_is_set()
> in damos_adjust_quota() to determine if its works should be skipped.
>
> The user impact is a non-deterministic and unexpected DAMOS stop
> behavior.  That is, users would disable quotas using the online
> parameters commit feature, expecting DAMOS will run at full speed.
> However, depending on the timing, the setup can be updated while the
> effective size quota is non-zero.  Due to the above mentioned internal
> mechanism, DAMOS stops working instead of running at full speed.  It is
> unexpected behavior.  It is also non-deterministic because sometimes the
> setup is done when the effective size quota is zero, depending on the
> timing.  It doesn't cause critical issues like crashes or leaks.  Users
> can simply set a reasonable quota again, or restart DAMON.  But
> definitely it is an unexpected and non-deterministic behavior that makes
> it difficult to reliably use.  Also investigating the root cause of the
> behavior would be quite difficult.
>
> Fixes: da87878010e5 ("mm/damon/sysfs: support online inputs update")
> Cc: <stable@vger.kernel.org> # 5.19.x
> Cc: Kunwu Chan <kunwu.chan@gmail.com>
> Signed-off-by: SJ Park <sj@kernel.org>

Thanks, SJ. The commit message captures the full lifecycle precisely.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

> ---
> Changes from RFC
> - RFC: https://lore.kernel.org/20260912200814.145612-5-sj@kernel.org
> - Split out from the cleanup series for taking hotfix path.
> - Describe the real issue.
>
>  mm/damon/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/damon/core.c b/mm/damon/core.c
> index e0414d2adcb41..89390897a0d8e 100644
> --- a/mm/damon/core.c
> +++ b/mm/damon/core.c
> @@ -3330,7 +3330,7 @@ static void damos_adjust_quota(struct damon_ctx *c,=
 struct damos *s)
>         unsigned long cumulated_sz, cached_esz;
>         unsigned int score, max_score =3D 0;
>
> -       if (!quota->ms && !quota->sz && list_empty(&quota->goals))
> +       if (!damos_quota_is_set(quota))
>                 return;
>
>         /* First charge window */
>
> base-commit: 191c4a84eef1db85cc7e1a853761e8ce8683afd4
> --
> 2.47.3
