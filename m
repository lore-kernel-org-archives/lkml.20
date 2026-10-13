Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C06B4EBAD6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890325; cv=pass; b=WLefjtoI238JAcoX6f4NdceMY/9EJM1URu2AdDjtTHZsa/xIu1tMEHEqcCS6bcet/BwLHcNTyLasX90pbS3V9klA9SlT3BZv+fPgWtM68XlrxwXkHCHAS1/DzxPwie/tOzXjbe2LPzN6VKYgu5bju7EWBrow1S9h0zpyRHqASf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890325; c=relaxed/simple;
	bh=Q63BcNZyGyVpop4uzp221nM7vw8JR/lEp1p43PpSduQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/YE1t7darlQkDK7XvwK/w7k+97ha2HtgR7Oj0CHwwPIVphb0dPKbkOBgpRbyY4u5hTcG58lSJWFuO97YANYu09cdor3MQjX1+rjM1yW05/sE3EfYqCY7mpKuzfJ+o5huppbuGQOjKSsN1RmJNZ76JKsVRnNXk4SZPexIOOuXuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HkZpI+el; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HkZpI+el"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5337c7b9937so706251cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791890323; cv=none;
        d=google.com; s=arc-20260327;
        b=OZBXOhZ5MkxFS3e10IZNkb3/CheEgdiuVqK+ZhLDkWFJRJkLbRICO0wt0Xfnc8/jC9
         E/sWc925nDYIU15OwbQH6TzsGaWc4DTQRH0eJDXcKuWbBK8d8VDr1fE0ljTGbUw8si5R
         6v+4ad2bvPQtPvHONYIGwogrvvsHFYPXRbDo6A/147we7X5jjKt+qdsfKqCLHAs+K63L
         MYukzJ+OqgKa+RtC7bmew6j8HfdQMKK0Re3L7eC8N2xN7TF5ENKG6pnDqRudA0E7n95q
         mTcA0Jl8qCqYaM/z2DI4CZKO+m/DlADdRypNVPvydmTxhbbcDo/UpwTlgIMRXVv3W5HC
         ioSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=02lGd8mbATmejUO3KQVY/K9npSJMZS97UeoTBHaxfAg=;
        fh=duse05wpXnhRFPpmxKsHsL+M+EOkoBxAXeuRP4AL91c=;
        b=XYV0UHQ+GL5LyseRpVaO3lgCdhDPjJ4VFYSbJ0voGH1fRtSwxG27ixHmcFdRvm5imQ
         8+dNTagZz/6MJu3ZWJ9bRu+NFZJFu9IL2qgmdH54laxOA8LOfgPzrqxSbIsOhhm5tdWo
         co163KQx5VJT+n5JnoYXzeE6F8qlFcLbdlfCya+59Lyka7JAMuvHb9FGj0aS/u2EVRz8
         PV8o9RVbBEGMmW3MifcSIPHCSERMAx57bGuxXgNZoPbfipPw3w7b6fEGnKHqjUOEPhsh
         TzuQeMobQqxtzdZ0YnU/NJdESRRANzJozHg9FuAyppYIEU0EArAjOBhJrLea4iWXO1I1
         iAIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791890323; x=1792495123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=02lGd8mbATmejUO3KQVY/K9npSJMZS97UeoTBHaxfAg=;
        b=HkZpI+elt5tGTiVYG2jz4qK9ByUe1O8zK7ppp0VkxSuHFSxtda6G22rxjgtnpUtofZ
         3BjfQYYJYXq6lWdLghkm6ekOZdY+sJXsahpLTMeikazO55wvSfT7DnwZ607qaGXOyj/Y
         uqq1cM3/iyVleESX8sUqH1b3Eqw703vmXQihYLcvPvWuYcDtc3m8WYTY3OhDXkaHvvlN
         RQ3BQVrU180Ha/QmHx7XnTZQMINZcEbqygbG9yYBNViHfruuxFPqAz6yTMKIpQn4QEL1
         OQ/M8McYuxkG1S3ugmaNu2N8bu9S0eRr3VDQ9MnN8DgEd8cuwkZ+9Nq7dXPagzP6206P
         0JzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791890323; x=1792495123;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=02lGd8mbATmejUO3KQVY/K9npSJMZS97UeoTBHaxfAg=;
        b=yMHq4QiSpmIiKLqepga2SQQURoaLL5A8xv/78jr8lznxc9S8XUn5a4gHuyReVPW/yB
         XA1re3AJcOaOxEoh2VFrqABU3jnNFagYSfGiG1ytZFDynOElXKEe6w5NTpZ7WGAUCNvw
         jzYKJRMgeGtmpzaQmZiWo00FpMIlxY2ERqAKSaXsjVgPKXfFOyR/pC3XXk4yaQgTlA8q
         KkzPAxipbL23XXNpwH5C638h6oGjJPEOSjLx1H58VTlpnyBy9+R7uWQOZnkFPfRhf6NP
         4mbJdnai05efnZe3KlQuEcAbI2rcDnPIuAKm+wAImwtdvW0N07bR17dDZdRyCKLKQ63B
         pNHQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6uY5KQ3TLLB9u0yVTlgQKrL6BaNfBIWZBjvw0pi5p+ajr8sBaljoSC8zNcI2vTgJVIGfjEINaW4b3r9M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgU0tEtk4oS1g6BKJGDYUZ6pyHtwgK2IANwNhYp/n6qwgfQLpW
	xDtuHK7JGWea18lno684/gEi2msj/nJA3HOIkTSjgoFCNLZ3TBxQFTfUUuvVk3Nw/cwVKcdVuuh
	1E97PzaJCcp2M2qgAJ+PKP8DuCVE0kHTr1Vv7aX1W
X-Gm-Gg: AYBFou1zN9Yss//XlwafirNkN3F3axTsoEkNaZJ+a4YwW1NUC7rCPiUHyZuEoEvf5DZ
	SK+f1Hi5tOcbAvmj3WsshqmU1btObWqDzT4xNOcVZtp7pZFu84sFXSeNWLwpqTENxe40E+mJ2My
	WFDfl6/bIqUiGIIeZdTZSs6IQjYEpiiKehutP7neopAehiv7jekUFfG1s6TkCgR+GF5yoBb9O5U
	WQmdDt0wGdGEpr1Z376eEYS1I3yf8xhU6vO6YBEAWQorfS1dSwry7NgmnL15bDAoLfuZ7sqms+X
	lEVo3IquC1kT6NDGhju83aigsnpQeovPFH/ASlMTBRb3yfBSJbFXnbyG
X-Received: by 2002:a05:622a:4cc:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-535b2910266mr48102151cf.0.1791890322506; Tue, 13 Oct 2026
 04:18:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009063619.112313-1-hao.ge@linux.dev> <20261009063619.112313-2-hao.ge@linux.dev>
In-Reply-To: <20261009063619.112313-2-hao.ge@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 13 Oct 2026 15:18:29 +0400
X-Gm-Features: AclHuK-qvcUVrSOqAHUBuFhMyipfniAtX1mtGlvajg8JTqSPRj6kAwYVpLqLul8
Message-ID: <CAJuCfpG4Zq6zRyvXkf40XcsiMSvS78Za28zY2xcaAh=kXpuD8Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] mm/kmsan: undo the shadow mapping when the origin
 mapping fails
To: Hao Ge <hao.ge@linux.dev>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Uladzislau Rezki <urezki@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 10:35=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> kmsan_vmap_pages_range_noflush() first maps the shadow pages and then
> the origin pages. If the second mapping fails, the first one is left
> mapped, and the callers do not roll it back. The next vmap of the
> same metadata range hits the stale PTEs again and BUG()s on the huge
> mapping path, or gets -EBUSY with a WARN_ON() on the small page one.
>
> Undo the shadow mapping on that error path, the same way
> kmsan_ioremap_page_range() cleans up after a partial failure.
> __vunmap_range_noflush() only clears the PTEs; nothing has touched
> the shadow mapping, so no TLB flush is needed.
>
> Fixes: 47ebd0310e89 ("mm: kmsan: handle alloc failures in kmsan_vmap_page=
s_range_noflush()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hao Ge <hao.ge@linux.dev>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>


> ---
>  mm/kmsan/shadow.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
> index 0c88d89bf0d6..2166086d3dc3 100644
> --- a/mm/kmsan/shadow.c
> +++ b/mm/kmsan/shadow.c
> @@ -258,6 +258,10 @@ int kmsan_vmap_pages_range_noflush(unsigned long sta=
rt, unsigned long end,
>                                             o_pages, page_shift);
>         kmsan_leave_runtime();
>         if (mapped) {
> +               /* Undo the shadow mapping set up above. */
> +               kmsan_enter_runtime();
> +               __vunmap_range_noflush(shadow_start, shadow_end);
> +               kmsan_leave_runtime();
>                 err =3D mapped;
>                 goto ret;
>         }
> --
> 2.25.1
>
