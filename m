Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCBE48A2B5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808111; cv=pass; b=AvnBfD8oTwkFzKWfNV94X2bTkphud123LNKCpsEVxH5cy84VsLsbSMJy5yip9kVg9uFD2qHiNISVkntnQbQf+prS2p8Np9PTMtyUx0KngHweA9Hn3saeduzu/SkYpJupblkMz/ZPaQEE5Z2LjerwjDHuiWrGe0MdeGzvy+FirPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808111; c=relaxed/simple;
	bh=YHrMauSfalkQT8DKMHgEaX6NxUN+ODq7GRVz3H+3fmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iEnFuzzWi2uvvt5n+m9vO2TSwsir1W2B2lvs6taMbMArSBs/crZAL8uwd09F7+f5k9YAkp3d1E7rmOUwfGw2SY/cTwAqC62rVaBNmDYa7B5UJBJce0N9qP/HWhwWmjaI6NpbuMkkUUd8y01iMgXf/i1+/m5NtqFmV7MPTJR8km0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NRk3wjL7; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NRk3wjL7"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c33bb2f3e6cso200178566b.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:28:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791808108; cv=none;
        d=google.com; s=arc-20260327;
        b=Wwxqab0UpQG+nGQnMHel+Q7eVcwhHrR0tPdSXSXhzDh/682Im7JY9pXLQlZFlnNU+s
         7qdXlJXbxgCFx7o6+igBoW+5gq4bLh91ECWUAs2YUlXYGkd8Ip9T5pgA/L1jHEaNWWwX
         PqooZbOjxYw65GmTLZpGNntH59t8lAImKT4mWayHkxmdfwRRD9hU1DRsakbC17Lc0ICH
         X1wCJLFdNvazCmoOFnoLHtfmST/HIEIM53Z3oXD9tI01bVxPti3ILUhvTbDrwOnZJ26U
         +SFbYSckmnghJD56y11MWANa/ewfCf4krzg0W0CJM4dq5/1qYVUGkTGyIyvewmMOtnt/
         NYrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nJ5NhrhBncW0QRsUS8hp2zICmLShi/rx8K0hvOJwI3o=;
        fh=vQrh1IDDLnwnhLs2zK9c2CjXGlEkuR89BXT9BfiyOUQ=;
        b=YhKSRKx+muZvD/hBvsMlM4Y32rd5y935LWlorLuTxqb+kbd2VPtCsbSVSsf2JuZhyl
         tp7ajtyk37tv+OV/yq2VbYseVQaFPf8+zs4PJ4BlMPWAuJvlVh3+xekVIps+CQJCPh2y
         Pop+Y7UAY8sf75smNaY01vj6SbIT4tpXPuqFaletdzQlYLEsr8XJglKhpXhyimz/GwZU
         2BeGz1S/O5r/x0Hp1HM+f1iD9/Sz6Z2i/KGHQuMO0PMThzLmrYjfM03iW64q42FfQJrv
         SuQW6o/YMeKMMei2VN1F2n3fpF0+61lUERZL3XU/AkBkJFmxIVjJ7BaLH+CvcCjMLaje
         k3Ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791808108; x=1792412908; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nJ5NhrhBncW0QRsUS8hp2zICmLShi/rx8K0hvOJwI3o=;
        b=NRk3wjL7sTj5vV9qr1WIr0OdT2E7hygTKFH3y3vr+rWh8G6jxbanKDzC1ZS6KdOLUF
         vdzArGK1rNYOQn5wYyA8x+22XlQQ8TwQMjGaNWJYZlIyeGjo1FJjx3QcnEiAvJlf64Vt
         xA+uJnGOfWtV9txZQP2G7TbmaEUaIZ9fttAwNNWT6p02WIgyFgDGKQdzyrBYT1FcWii0
         h4VDjH7E+3sZ6TV63SV0uy6fZJjAgc4eG+5yjjWxr7bJiq5+G4YHxOg5ISE8rrGnXn4L
         +v4NFprTnjRLd0+Ycq3+8ttLBlbLfC5r6QGQWzAihJWYy1d1wqPIsT48552t1c0ai9R7
         JM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808108; x=1792412908;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nJ5NhrhBncW0QRsUS8hp2zICmLShi/rx8K0hvOJwI3o=;
        b=GO7Hg6fFs4B9W8SR2gEjHFxNHnkpXBHt1sb/zoMQgFVxlqgkq1k19w/bUcMAqdAInf
         exTVXcfXZRusWfZSN/EVhhQwhIrIve9Vd3UrOl/HXhOnBUaR0kEFB3Sf82uXc27fGbcQ
         7s6QdxwcKt+KUy6Be/zUgniOTKVYR1lgNSoCCEPI0pcV8tKSS8Fn5kmVIpJl+Yh9dXfp
         fo7Ytuk4fY8mH81sKwIpv6rIuxLOci3LobPwt3iAR8Rh42loGfGFX/8LLVtpG2VVUR59
         ZCKwES3npLIe5NEeRUUsQx7tNqgyn4kIoJ+OUfhqo8vY85VQDUyZ6GlJsiUzK2dNnRmL
         Dtvg==
X-Forwarded-Encrypted: i=1; AKwUvBzkApVDbhlxeD3202JCie6QjD6oM+BpUwsC7Lk7N/VZxcZMY2mUAjqx8enRh1qFvveVDL80sv/6k1ScBnM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfE7soUjgECRv3a1edHzEH1eLuxoKCYBguw0/7fXaojKWZl3Uy
	Ek48kliZWpeaXrt7mv6SZ68J5SnjfzwTXaVGd9PX6ND3WPKeo5GrBC9MBFlwDucKfIP1vmVHVfm
	8mALNeqJhUlpQl8hN1+csMZtCeEC3/VbSMnzO88MmpQ==
X-Gm-Gg: AYBFou04JSoADVlRLC4k84VDpkU1E4ePh2TQYY61P6/WSfIhovBVEdkKJO//GreJpJ3
	aome/cvGU4XPPKJfwKfUW54nU5IImajdEeu+knk1Ncq86q7eqhCK2gRvNvnCQXLodUQPoWb0pLs
	e+cubESuk76ZjMGD141TmZYvXBGaf4cCGzye/8ZwXJ3pjXoUOUDpDc6RBIPtTvPCa8dR2e48TWD
	gU1ee/goXa8BCoha9QcApWGo7GsrVf56ZBhGV5mnROrP9RSb5eXuhiZ0BLXtVHI7aYCdOUuCTKX
	sq0b3MLYEd8vpCe4xKRyHokdR8Ur4MOEjt8CKPa+5X3jqDMnNuj/qRiVbh75+8m0lFeD14V5eey
	W96NzwZN1R1U=
X-Received: by 2002:a17:907:d1a:b0:c2a:704c:8c8e with SMTP id
 a640c23a62f3a-c31a9fced4fmr998696466b.11.1791808108454; Mon, 12 Oct 2026
 05:28:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012105001.131311-1-elif.topuz@arm.com>
In-Reply-To: <20261012105001.131311-1-elif.topuz@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 12 Oct 2026 14:28:15 +0200
X-Gm-Features: AclHuK-s3iDVNN4vEHh7YmQNqYhUQTaVfn0z-VxtT97Cul1Wu5lYlL5NBonlShc
Message-ID: <CAKfTPtA_TkR3bmhknaZtJ0VUWtAM=05tHK1i5ixL9cuutGNsBA@mail.gmail.com>
Subject: Re: [PATCH] sched/eevdf: Remove redundant RUN_TO_PARITY check
To: Elif Topuz <elif.topuz@arm.com>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com, 
	linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com, 
	kprateek.nayak@amd.com, christian.loehle@arm.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Oct 2026 at 12:53, Elif Topuz <elif.topuz@arm.com> wrote:
>
> update_protect_slice() is only called from wakeup_preempt_fair() when
> RUN_TO_PARITY is enabled. Remove RUN_TO_PARITY check inside
> update_protect_slice() and use cfs_rq_min_slice() directly.
>
> Signed-off-by: Elif Topuz <elif.topuz@arm.com>

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
>  kernel/sched/fair.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index b42a0ca2a69e..f493fa29aed6 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1133,13 +1133,8 @@ static inline void set_protect_slice(struct cfs_rq *cfs_rq, struct sched_entity
>  static inline void update_protect_slice(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  {
>         u64 vruntime = min_vruntime(se->vruntime, avg_vruntime(cfs_rq));
> -       u64 slice = normalized_sysctl_sched_base_slice;
> -       u64 vprot;
> -
> -       if (sched_feat(RUN_TO_PARITY))
> -               slice = cfs_rq_min_slice(cfs_rq);
> -
> -       vprot = min_vruntime(se->vprot, vruntime + calc_delta_fair(slice, se));
> +       u64 slice = cfs_rq_min_slice(cfs_rq);
> +       u64 vprot = min_vruntime(se->vprot, vruntime + calc_delta_fair(slice, se));
>
>         if (sched_feat(PREEMPT_SHORT) && slice != se->slice)
>                 vprot = min_vruntime(vprot, ineligible_vruntime(cfs_rq));
>
> base-commit: 4a3b51aab6e25244d97936aa65e6d5425adf98e1
> --
> 2.34.1
>
