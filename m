Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82725357CED
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792299163; cv=pass; b=gLdhSkp8tuf1j8pGZddhegPcv3JbjP2UzX3ngjufz2UEFH2X18+Ox/ggJlsaRIFiwE8lRfaRO2FWyS4a5RP3gyb6YBhsAw/8UEDiQCQdtYGC34S7exqxkKTkQotkmc+9UJTZqX8fa1iEJXOVIpNOvIJiMV7TKQpMU7cD9H9LWOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792299163; c=relaxed/simple;
	bh=hAtRSVMMTHxmyC0YpP48NUQGHVcPPL9epUfP6boAMt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJnJVY3Rr/Kx72P+TDqQK6QUbbmwDqsx3OidtljXQnX/QO+T1B+XStC4kw5aZiVwl6DIWBZITV5jKDOOcd3R14f73AWlJI94ccFp3VsrvuNrNNtkZns8Fav+U85enKFmxB8UvcnnvnkcjSuzCnaW1uP4L/dwN1ysyzvHqD5RMro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TlnI34f/; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TlnI34f/"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-533202fe429so237111cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:52:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792299160; cv=none;
        d=google.com; s=arc-20260327;
        b=Rp+N/J4InoUOYv5KU9MEmwAHFoVAVVwMStHUTcDtvp9eHTPAfxcJcPrXDqCTMxbTTB
         5TvT2qtxKk+A2oSrZA/bvMo9XIVvROQl4Q60eDuWvX4uNO7LjTzo1kPMq+6ABkP6hXKZ
         Vy5pgsOCGd1vb+MItpHsF1vrJm9E8eeOCTalDGqkobywZGPPffP2B+oAAIDu7Iz6fURs
         AQ9rP1mStiTAjCz+8uVHe4QAmyTfWCJGAGlGTJuvtztnfE7SdBCgRkmgcLlsAuGkGV9k
         U0pNZKPiBHMCa6W6n6Mz6AL8K+4Pab+MXZ3H+pXqm8RqqkVV35HVmOlvTzN+GytkmgiD
         T9Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/j83INDW+E0oYwL7EQYpoQA+T4KbuWW9MUJmzBfXlTw=;
        fh=PjtMeCuOjjanGGZj3u0G2q+4GfXWh2rCPxf8o9zd3nY=;
        b=P2EKo4pAXKYDvKm9a2jgO3RADlfH6gGHkVlaTUDl2mPnOFHkYk3KnewtRDubravccu
         G95Bg7l8cdXzMx/Ii//zD5xi9RUzCPLH69cJEKtSrs2utc46zy3x3e8vm0StyfZ3s0dl
         Io+KMwkQgFGKHp3srmilxZU/wFhNdjDA2V7PBe0/tgdLZ+5hKXU2wXWcLpQ3a0P+LRgH
         5KhwF3rtWsJ2GU+MXBZ7Q3pZJGVHsFr1cXf1/iaFP2n8IS1aUMgiXamKXRNVebK7bjOO
         O/CKq5pR8qkVGEtaq39p4fgNXjDNcoclAnUdHzWeOc2aM0iNHbpfADAxYBnJYMBtTplo
         tL+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792299160; x=1792903960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/j83INDW+E0oYwL7EQYpoQA+T4KbuWW9MUJmzBfXlTw=;
        b=TlnI34f/4I6xROuSZywQgkn7gXSLd5Npjchb7PSd1eJVLno14lERWIFHioJtf/1P/F
         1XFzam+Ix1E3OR43MrfvIoVibroPifRaXzFZTdbrwxarICi6WEXlmFkoSyJpST5AbKIT
         NW/f3tCxHvGPqe2OTBpm8eeVXuf8cMvVJizRXl4vgvDvbJGATuIfMPGLlZoIpWcYmATt
         Y3Ban3L0yuKZPXR3pl7qorFeieMNcAVgTrtJ5rnwce02aSlXqRSgdvHv6a2hDA7Rcjy7
         6463HADXg6XPx1FD5HpaK5aCqqu/aaTREmF3eYptyJSy3VtWqp3nnLNJHJK4jtrBM4Xv
         ce0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792299160; x=1792903960;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/j83INDW+E0oYwL7EQYpoQA+T4KbuWW9MUJmzBfXlTw=;
        b=zlbI+rgmXK7u2STE0zoP2ql787g+deu85xrIdnxAqfDKRCdQi6B2+rsd5WWKdfLJwF
         ff1etQLGA4JP+atX7KV3hfx9anUrMEdSBCGLAtD4IKkfTj6S5UIgeEeruwzGSJID9RVV
         lrWY6OxPGhvPQYor2KH93tSth87tPxu6Nh6U9b5/ZlxbISby4kzzSisktGY6G5nz66Ns
         rix6x3KvVM4CBm0Bb2a4ASUjsnPqxPs3ZBGnlERiiVvHC26VPI1xOzs9m8PhXBbnxGBq
         C1u1oIf3OcDh1vUQ9W3TAhEDpFmZAP7PHaoSdDYS/SzdN83tuTLCwtyWK8AFN2hDnb+o
         TuGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVIayKHMOiTkZTPAQT7UuWhDf/X0e09ssMMMMwOXhouFDDfk4WgdqbjpLuFeZvKzYV2mKJE5RHjLyD39I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKpI6u37CA6vVOsj0TxoCPfdKfFCVXgACdB/aumQlxhcMOKxLl
	O5xcdpLuJc2eMZtSzANySJomiC6swl2SVVGXnOswwk/DgnmtKWke1E7gheHSbDNDLwUKE9G+PGs
	IMHkjRVUN/UTDaNaqkhThsTDsFzQzqa4RxfDLj5Bg
X-Gm-Gg: AYBFou00VFEBxWYSgXDmEEJ4/YlziEF9bK9+CqLqXatl+L10hS6DkrcDVZGotxJeEoS
	t/X8a3UPopQIsEqGy+BOqtyXpdt5bHQCNmRTcRL8xpGGgMFYbtA7VwZJn6ENd+ILDrz3+sT7wOz
	hOQqBl/i/0nOkQ1gIUUqoiWJpHfzQ9G5W+LNSCmj67qY64gapv4b5fCSnu1slHvuZkOXGiIIjAx
	23id95VEgeKSVYZBy0DR7qFs+aM8WqB3D1kyMktLhFX4VZKG4N/VWl0ObukvCQKrds42Goe56TU
	pbv5tqot8jJkS/mIYZGVICsx8wSGyMKXyH7W15FtXRvNTmkxp2MXh2X6fJE2s/Wb6bSi
X-Received: by 2002:a05:622a:15c2:b0:534:d386:c3f1 with SMTP id
 d75a77b69052e-53646271decmr19987131cf.9.1792299159704; Sat, 17 Oct 2026
 21:52:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791410885.git.abhishekbapat@google.com> <aae089a81ea891e1bc7e3ad171064d37d800ad1a.1791410886.git.abhishekbapat@google.com>
In-Reply-To: <aae089a81ea891e1bc7e3ad171064d37d800ad1a.1791410886.git.abhishekbapat@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 18 Oct 2026 08:52:27 +0400
X-Gm-Features: AclHuK-Wl1wHq9C6FbkV2z85b221S8kRzKVDRSqQmdSzTuR5W-gPJA5u6SMeDIA
Message-ID: <CAJuCfpF+kVSa0Rb0pW2gSwkBF57u-JC0J6gwFk62iGUpXVNwSw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] alloc_tag: Extend allocinfo_filter to support
 tracing queries
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Hao Ge <hao.ge@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 2:40=E2=80=AFAM Abhishek Bapat <abhishekbapat@google=
.com> wrote:
>
> Extend the allocinfo filtering mechanism to allow users to filter tags
> based on their trace state.
>
> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>

Acked-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  include/uapi/linux/alloc_tag.h | 8 ++++++--
>  mm/alloc_tag.c                 | 8 ++++++++
>  2 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_ta=
g.h
> index dafcba2f7e2c..a96054ac2237 100644
> --- a/include/uapi/linux/alloc_tag.h
> +++ b/include/uapi/linux/alloc_tag.h
> @@ -38,7 +38,8 @@ struct allocinfo_counter {
>         __u64 bytes;
>         __u64 calls;
>         __u8 accurate;
> -       __u8 pad[7];
> +       __u8 trace_on;
> +       __u8 pad[6];
>  } __attribute__((aligned(8)));
>
>  struct allocinfo_tag_data {
> @@ -54,7 +55,8 @@ enum {
>         ALLOCINFO_FILTER_INACCURATE,
>         ALLOCINFO_FILTER_MIN_SIZE,
>         ALLOCINFO_FILTER_MAX_SIZE,
> -       __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_MAX_SIZE
> +       ALLOCINFO_FILTER_TRACE_ON,
> +       __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_TRACE_ON
>  };
>
>  #define ALLOCINFO_FILTER_MASK_MODNAME          (1 << ALLOCINFO_FILTER_MO=
DNAME)
> @@ -64,6 +66,7 @@ enum {
>  #define ALLOCINFO_FILTER_MASK_INACCURATE       (1 << ALLOCINFO_FILTER_IN=
ACCURATE)
>  #define ALLOCINFO_FILTER_MASK_MIN_SIZE         (1 << ALLOCINFO_FILTER_MI=
N_SIZE)
>  #define ALLOCINFO_FILTER_MASK_MAX_SIZE         (1 << ALLOCINFO_FILTER_MA=
X_SIZE)
> +#define ALLOCINFO_FILTER_MASK_TRACE_ON         (1 << ALLOCINFO_FILTER_TR=
ACE_ON)
>
>  #define ALLOCINFO_FILTER_MASKS \
>         ((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
> @@ -75,6 +78,7 @@ struct allocinfo_filter {
>         __u64 max_size;
>         /* filter criteria only; see allocinfo_counter.accurate for actua=
l accuracy */
>         __u64 inaccurate;
> +       __u64 tracing;
>  };
>
>  struct allocinfo_get_at {
> diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> index 262f00f2bba9..8e63f347657b 100644
> --- a/mm/alloc_tag.c
> +++ b/mm/alloc_tag.c
> @@ -250,6 +250,7 @@ static void allocinfo_to_params(struct codetag *ct,
>         data->counter.bytes =3D counters->bytes;
>         data->counter.calls =3D counters->calls;
>         data->counter.accurate =3D !alloc_tag_is_inaccurate(ct_to_alloc_t=
ag(ct));
> +       data->counter.trace_on =3D alloc_tag_is_traced(ct_to_alloc_tag(ct=
));
>  }
>
>  /*
> @@ -323,6 +324,13 @@ static bool matches_filter(struct codetag *ct, struc=
t allocinfo_filter *filter,
>                         return false;
>         }
>
> +       if (filter->mask & ALLOCINFO_FILTER_MASK_TRACE_ON) {
> +               bool tracing =3D alloc_tag_is_traced(ct_to_alloc_tag(ct))=
;
> +
> +               if (tracing !=3D !!(filter->tracing))

nit: Compilers are smart enough nowadays to convert u8 to bool without !!

> +                       return false;
> +       }
> +
>         return true;
>  }
>
> --
> 2.56.0.385.gd3acb90ef8-goog
>
