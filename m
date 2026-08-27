Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C53C3822A9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787799382; cv=pass; b=dfBusgkh48CQsZBbJEefRq6MjF4WAglCUkV9pyPy4yIguQv9w3JQxouX/b+iO5UQbXWGmUvZ+64ZgjQSMJXWL0pizshyO5CpeebHPgUp0BUWd1rgMP7tNq34ygQjtfAxy6IEVh+r2r/4xa1dCwSCc7aj6Uk/2G51uJez7HhzG30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787799382; c=relaxed/simple;
	bh=ZBhdSdl5+abIXlYKkjPbRcE9Y6VKqGLQ1FdukDJLIWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TK43pKnC2h9bBpmdSwWYVgsOm82+YgkO5MAAJc6uPH+3AQtSwh5ymp90kANW4Su88rw6prt3nIbV3mgHSFV8vEUCE8ZGqKFfjwGNgUuS/nKLFGgHNu2cR4As2HESaoK0QoFcAfYcplZG5Guu6E8ZmzEuD1aJonadf43TjbFcYMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clepdlZW; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clepdlZW"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c96c92c0980so1114473a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:56:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787799376; cv=none;
        d=google.com; s=arc-20260327;
        b=RBhLjUS4pjbJGi4GsSPRMaWHDjlL0ClS2k2mT49vLfdrGrVxH+kDHnttGm3ks4zIwz
         Q2EHZ6oUJBOPhy4Uu5YzylQaUE6vObH+J57lSIkW+MeoGJs3yhEWFsJH/e62VeS9tI/z
         6AE7zS0Cu//AAt1c0qHRBpc1bbWdCWl9gSEnuz7r8ZoIe5OULpb0O8bTpnAR/rXxaFbK
         9h6w4gUsCzN+YLgwL0mh/hTgEgcQ3g+Ps9B/T1euJ4S528KIe5RpnaWCF5qfi1CI7wMF
         74ZlnBiu5HTnrlG+Pk7KC0Hg+7KViaTBs+aVcHjKnVz0t4jYU8qT2sBaNtaJU+xOrywb
         8D4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BmocDsS7jcJjPt0AiPmcdXHK/Zgi5+SmiQPLaVUgJ6o=;
        fh=GedEPP1/+grPm6JEsujhLG2mpeO/owBS0GHRYRFp9+s=;
        b=AYMUULn35LNK6n45ytW8vNkg++p177HZYWXZWp66Te4ufeOdpCc3VXIe3GoPO3+YOM
         Zyubo7SujeRym2S3Edi1h9ifNq3NqwGx6O4oliRrxsadJ6UkxaKsIad2d2CRJuB21PE3
         d6asGBfm4abSqnTl985Q76uq626v3YkxsfoWwrpgDsNvSPt3+K2KpTSX3jM758Jr1lxp
         9WFjvVYvOEV7Xz9Y76zwByU3QXy8koa23oFHcOcbBO6OXjoUy9QpCBP92NIGh7+/Lh4f
         o4QKftjoixTDHQIgFLsrM0bQATy3f0PWamNIa2Q+2Z/V9TyMEWNab9C6P4FNZM6/yPGx
         T+sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787799376; x=1788404176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BmocDsS7jcJjPt0AiPmcdXHK/Zgi5+SmiQPLaVUgJ6o=;
        b=clepdlZWFH6yUAK33IQV7uPiXXs4OCCXfwqckBMWAhY7krwit5hbgX9y6B1Lq7DAJG
         9FnxSvQbpU7VRrbAdjhUSeYtgvbZH27cp0M0TZ1kvK5E6T102Id+E1ZWY5ho69wntGqs
         8s0DNGiEmaaYS4yezCMAs4jqQuaMaA4q9adYWQo4x5xdHkrBmHGRxgQxqDFwsNqE79Fh
         TmWK+dDw+m6+tVcifnz6hmiWc0DYI/KAwxOGfpfkF28sJq+aJtgnBbl18XrEshwM3alB
         modW6vXChhKVN1Xe9b223j00DCy8zEKM0zvGErGXJWLAm/TS4WZQwIcQiXXWn07qENIr
         a7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787799376; x=1788404176;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmocDsS7jcJjPt0AiPmcdXHK/Zgi5+SmiQPLaVUgJ6o=;
        b=Q142NDlZxAJt/MJo/g1YFRU8Ppz4K4o1KuxdV/x/y4jBf5FoKFNFxPwAvRvU53wQcK
         qpG2K9+E5XcNZaJk3Wlas/1DJhdRLJxYz6yvJhOVWwAonBxJk5TFH3lvzLQbZKJ3y0rX
         5QSZvJacs5HF7NPOhhMz5b9UZ7IqcxvgfBop7HzXs3GK1I4Bo6R6pktYPuIxK00LefqA
         TllwOC1oe05V423JMjsQzWRg4Bv3CRJjsbLO8jBB30GAo/OsEfUWMeCm2bHcL+2cS6Si
         FkW1o9sZZYe62elkH4M3lir/wS5e91b1vFnGgBoqzGr3fgh9rrVcHBonIx1RT97AsukV
         pAbA==
X-Forwarded-Encrypted: i=1; AHgh+RqKcH61ESqM2MqkancnfDfF5tYP4bazYOXEZuIRY4oQSr5DHpLi09DQb2pC/Po1edgMwcPNQCUfG22yarU=@vger.kernel.org
X-Gm-Message-State: AFuF++nvvzcma3k1D4xkStmJOiZABXvaVXaZpwx1U3cRMnVq8L/BDJGj
	rjJ2v9M1x26gJNYr5k8evQD2ztjMwEgIIiSwoo5/AUNkEwXzXXsHecQ8cYkUos1OOXvdjsNUSpa
	9N9gsOtkolBDYEnmie7KAmx2yIOoSuBA=
X-Gm-Gg: AR+sD13MXAFYzpUvKcXwyo+5/lv6x3WJEKP+jFoNaHtoNrh3l4JO8b22h0CoSa9UxBx
	qZlQzJLRX+Aex+h3J8y1cYNMxA4Bbssnmv2+83pLKca4IMdeyJk0UNTKdrw5nDlLemCEdKrpvSR
	gla8SabrjqG59FcSkhOm8CVJSoYv9UOzAvCJLGi+qJtvya6j/tbly05K7vW3a0MUJyAlkFdczGm
	4f69zFCsf+i540dCc+zdhxKeJrIZ6sUPryjrHE5gLDM8FKiYcwdBR7fgDP9vdLuX61MquWjGHSD
	pCOHFtYDdfHJJ2C+PjZ+IJxFuVQ6bXMxSw7h47E2w6uDnhLATuW2g9VP8eDT0uHIeTaUl36yMoh
	/posoSp2dUgGqnRHX3/T7UY7sdklRVYqsuW/DbbXzIDBmwyTkDDpx6Vi5ZfxFYiQ=
X-Received: by 2002:a17:90b:2604:b0:38e:ad9d:1151 with SMTP id
 98e67ed59e1d1-3966d18ec9dmr24486491a91.4.1787799376080; Wed, 26 Aug 2026
 19:56:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824134016.2006188-1-chenyuan_fl@163.com> <20260824134016.2006188-3-chenyuan_fl@163.com>
In-Reply-To: <20260824134016.2006188-3-chenyuan_fl@163.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 26 Aug 2026 19:56:04 -0700
X-Gm-Features: AcwNN1Xf4GjnowAicFWJ8kHVsUKvNkOD5IQBzS8D5CTI9OTkylntSJQVxRx7ZVA
Message-ID: <CAADnVQKPSWBzaEc7QBT39C_N_32Gu5_P5Cob9G0rxcDgiSQg6g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 2/3] bpf, arena: fix range_tree_set
 inconsistency on kmalloc_nolock failure
To: Yuan Chen <chenyuan_fl@163.com>
Cc: bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Yuan Chen <chenyuan@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 6:40=E2=80=AFAM <chenyuan_fl@163.com> wrote:
>
> From: Yuan Chen <chenyuan@kylinos.cn>
>
> range_tree_set() pre-allocates the node needed for a brand-new range
> before calling range_tree_clear(), so an allocation failure returns
> -ENOMEM without having modified the tree (previously the overlapping
> nodes were already removed by range_tree_clear() before the allocation
> was attempted, permanently losing the cleared sub-ranges).
>
> Signed-off-by: Yuan Chen <chenyuan@kylinos.cn>
> ---
>  kernel/bpf/range_tree.c | 45 +++++++++++++++++++++++++++++++----------
>  1 file changed, 34 insertions(+), 11 deletions(-)
>
> diff --git a/kernel/bpf/range_tree.c b/kernel/bpf/range_tree.c
> index 15b588377a76..54055b1fe541 100644
> --- a/kernel/bpf/range_tree.c
> +++ b/kernel/bpf/range_tree.c
> @@ -199,6 +199,7 @@ int is_range_tree_set(struct range_tree *rt, u32 star=
t, u32 len)
>  int range_tree_set(struct range_tree *rt, u32 start, u32 len)
>  {
>         u32 last =3D start + len - 1;
> +       struct range_node *new_rn =3D NULL;
>         struct range_node *right;
>         struct range_node *left;
>         int err;
> @@ -208,20 +209,40 @@ int range_tree_set(struct range_tree *rt, u32 start=
, u32 len)
>         if (left && left->rn_start <=3D start && left->rn_last >=3D last)
>                 return 0;
>
> +       /*
> +        * A new node is needed only when the range has no adjacent free
> +        * range on either side.  This is known before clearing: any rang=
e
> +        * covering start - 1 or last + 1 survives the clear as an adjace=
nt
> +        * piece.

If this is true, why do a 2nd call to left =3D range_it_iter_first() ?


>  Allocate only in that case, before modifying the tree, so
> +        * a failure leaves the range tree unmodified
> +        */
> +       left =3D range_it_iter_first(rt, start - 1, start - 1);
> +       right =3D range_it_iter_first(rt, last + 1, last + 1);
> +       if (!left && !right) {
> +               new_rn =3D kmalloc_nolock(sizeof(struct range_node),
> +                                       __GFP_ACCOUNT, NUMA_NO_NODE);
> +               if (!new_rn)
> +                       return -ENOMEM;
> +       }
> +
>         /* Clear out everything in the range we want to set. */
>         err =3D range_tree_clear(rt, start, len);
>         if (err)
> -               return err;
> +               goto out_free_new;
>
>         /* Do we have a left-adjacent range ? */
>         left =3D range_it_iter_first(rt, start - 1, start - 1);

pw-bot: cr
