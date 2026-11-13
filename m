Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794589200;
	b=sf2VI1LHxvkV8v4eJbOhl8d2bSDailBNBE//YwSNG9ReIJB46nuRlyhPYz1n/cLL9zyx
	 PP/fgU+qQ5nC16zlCzpV36N6A9TTZVJRwSoP6KM/+pHnmyq/79F3g1vNoJ5sp3olndoor
	 LIPy3PcVKDXoIyuPtPNXjt94+BPp94Mz5li36bN1jqCcjTen9kN+4JP45nVK7GJyfZ6ec
	 +/s/A5v097KkKGmkH3pwR8Bf4c/QrWVqUAhpGmnWRuCCQtZXXKxHpFoJ/qNGXO3qnaRZi
	 QC2uEvIzH/wg9/W4ki+KOcLBl3wttSJxIk7FbxWbCUZGtnM37fA8Y/mVl1c+0CooQUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ht73lIdKfLXzYIM4DvC0DDEzfXuL/I3GCKbyKODV+Yg=;
	b=zugglyYpiCRO4idtaNbk2I6XwKVoIOnTr0CCb7aUaaSOmVbNA26cU4hCTsQXDQnYe66b
	 b0IDHIUjHGDOlAUC83xTg3qUyDyMR0xVKSiqDlUnmzPZxEDX0piO/NgkDUPH4rAdOwTSp
	 E4qRFsDWwO/maCAtY9u2LAYOQkYM9AqClxTZzDcMpFmcjfvratxShCZLjsiGeKwnt8JZk
	 HSEA+FoGlipBd48g1fHLrVrmzDd+hOrtNPB5si3xF0Ixzl6A9FcVGxftmMLmU/8puwGPd
	 ohQ3NcDtWOQbkEnTZbhybjvwnhw4l4FfDRvO+jFUZO8IthtLcVsPDtXld9r3U6BHjMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FYLt4ttP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E91606A8B2
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84E91606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FYLt4ttP
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b76c15ae36so88905e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:00:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794589199; cv=none;
        d=google.com; s=arc-20260327;
        b=iOWTOLSgNiHZ/F8tMjNejr3XC2dgRxnC/zFjfnx1kWQCFA29N4uP9nD5uBNgwuThph
         3+FUPwkSkyG9i8iMjIMtCS+EKjj4bySU/vYeAXqwtkjH0JQbvtzYOf0E1OPOh9qLH4hJ
         fc47kPonNDeo2ZJgTIP4z5kBjYKzDGX2XPGOfVfyX7KaFRt9WZiKFH0EO2lRV8ASoc4g
         1aGEi0iJEy/LkEKlomdZA8wALhLsnXaLdmCgbwlZtpsrDuCXvrqg9CImHj7InxtF5gSX
         9L1cgBoX27Dhk1FV0xYptij5eabQza02utGUrYtQhYNR2DGLIYftwI7PemRK1J8ajwNr
         rLSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ht73lIdKfLXzYIM4DvC0DDEzfXuL/I3GCKbyKODV+Yg=;
        fh=Wn2Yxzrkpk5TyhvhWv9jrsLw5eg3FKSCJ/TYtFAoGXQ=;
        b=Xe11qGKknT8dC/OHnlzNInDDJQwpvolnB5H1bPvTeVx7aMpoe9Bq2McNs+ulJo2bST
         NEEmUWrlYnZgHDldBCcPHFUr6RvBDCsaaeJLPV9qKW3gC5uKv6gxIcDwuAqMvhH01W1w
         bGBLPtjVb03Vjg6JKlvcTxMwznpko0jF7+WsYxlqAY0ZDj52kelsawCreCHfWa0ANKuz
         bx1cvDrlDjM4A/42ZRbuCwacBjBvSWI3wadZRt0LPkxtzwChxzK130BF8IQIUDwvVmKS
         g2S2P5H0qeaZBL5nn8+b2pNBaAHHzMNXK1S09Fai+VlFMvOaGNkCBBVcZzVKOvgs0LAd
         r8Mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794589199; x=1795193999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ht73lIdKfLXzYIM4DvC0DDEzfXuL/I3GCKbyKODV+Yg=;
        b=FYLt4ttP5B2WVHQ6vCHPoKjcfSzLRA8ecYOiE3nk+gqHrDdCArmGFAfCyVT148EhQI
         skjMiEVfofxcg4nfQkdnRH/JuUm1GJzsPQ/7iVvkcS2U47+eiAF3fvSKLoC8XiZ6PpiN
         EsMq7P3BZPSdCP0gqXHlU+VY/K/cxaFCtA4aX2ZxI0lafAlFqO8dD4gj55d6W39NjDYV
         WLD5DXNDPLF0iPlngPDHrtgxmh9UxHCbX83YetyGUfWLNJhWfuAEtUAvsAxTrtXta/+h
         hzPHbYgbYCWnpaB1yL01GqPyf2qozPZTXq0xoJVXcTqEgA/Me6HcfB5kVIOOIIoj1a4y
         kdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589199; x=1795193999;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ht73lIdKfLXzYIM4DvC0DDEzfXuL/I3GCKbyKODV+Yg=;
        b=fhRA+kyfvlRoykr88Vik8icTgk2Us5X9/5w1Vj0oT1Fw6IEAZBklnmyBXUIe8d5EeA
         dYKLO43dK2unuV5vuyK8f+9UgSLkaHXFUZjlTmMLKGkCk8ZYubCmcWJRMr8MLkWRF034
         t7lnbGwOoec1PABe8fekUS9tBo5UH17qx6ydJwIfF2m0UvNoFAiiVn3jz7PLTBtTU/ZB
         i8h7VHy4U/FWZj5T87pPCAh8/T0swY1dNcV0/8HyqOAM626jQB+9/a0VefDjDC5gxK+m
         MQODBdVRVwYVGw0bNE7EuozzP+tV6BCeL1RLejtZHqcG6eDryTb2k3zR+kHzLJ9Rh2lX
         E+vA==
X-Forwarded-Encrypted: i=1; AL+hErH+o7WPx3C5XaSPvdPgmJHAgsSWzeVkSkV9ZBX+ufNjPXSs1+hHERzdWHZKsj1WY2E7XwDJglm1HRnYSBs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ckzhUhNuoD1Mv3GMW1UiPQimKaroAEYvxTIOY0FWfixNF9Db2
	jOE67kT09zU+6tA2G27Y3sPJyStl54okab2ko7WTHF3Do0PQ3lW+qfLtUAxFYGBBa9US3HhybMM
	OUdHpUQrEiZ7s9c2ieFFEF/ixzP1XvaO6XrdPtg1v
X-Gm-Gg: AYBFou346c1nhcH5/H/BT8tHjSPcrZBx41UOIh01UQzrRHglZ5DYR6WLwoipnTPDglm
	2skghuWdNFJx5QAAj5VJgfjKsOhioLu9tCsBoyLVjOu16F/bgCpQ0iy//Pwz4GatgYt5n7eupG1
	W1aBAgL4puX5BuLNwchFJJd3pU1RGn+twtQ7n62Nci1ew+5r2rVBBIheyljqAUoq2Zu+K9Hr4Jw
	oriLlMVcqfPOMCh1Dy7r6CN835uBwua2PtvZ+K12hsA7j8VXGkNQp1pd2uHHLQ6BSPRNAP6TYEq
	GgaCWzjCEkjOz5RlFCpKVovjl5IzS7fJ6IU4KlcLqVyq7UKT2U3M2Hdne9U23F56TA118nnRjoV
	gXY29dm3435U8npapOxjmpyCLYukk6IbqvitvFDPAP0z3hQcox/s7Qkg4JgxEEslFUfrqkw8DJ9
	ysjWRJmul+/wKI+e/BQ2vayqs=
X-Received: by 2002:a05:600c:ac1:b0:4b8:b175:c5a3 with SMTP id
 5b1f17b1804b1-4bb56e4edcbmr658015e9.9.1794589198370; Fri, 13 Nov 2026
 08:59:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113024447.922683-1-k.chen@smail.nju.edu.cn> <20261113035640.948458-1-k.chen@smail.nju.edu.cn>
In-Reply-To: <20261113035640.948458-1-k.chen@smail.nju.edu.cn>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 13 Nov 2026 08:59:42 -0800
X-Gm-Features: AclHuK-LFbMT3CtNvV1OqgqhSoIHpLJtutAfAmKAD9TN_Xuh-nAE2mDUwuHSl-g
Message-ID: <CABdmKX39KyeRFLwiJKpt0ZVjWkNcL62ajYNUjHfN4VXAqbHJrQ@mail.gmail.com>
Subject: Re: [PATCH bpf v3 1/2] bpf: make dmabuf iterator stay drained after NULL
To: Kang Chen <k.chen@smail.nju.edu.cn>
Cc: Yonghong Song <yonghong.song@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Philipp Stanner <phasta@kernel.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 7:57=E2=80=AFPM Kang Chen <k.chen@smail.nju.edu.cn>=
 wrote:
>
> bpf_iter_dmabuf_next() uses kit->dmabuf =3D=3D NULL to mean "iteration ha=
s
> not started".  dma_buf_iter_next() also returns NULL at the end of the
> list, so a next() call after exhaustion restarts from the list head.
>
> The verifier relies on the iterator contract that once next() returns
> NULL it keeps returning NULL: process_iter_next_call() marks the
> iterator DRAINED and treats the result of later next() calls as the
> constant zero.  A restarted dmabuf iteration therefore hands the BPF
> program a kernel pointer while the verifier believes R0 =3D=3D 0.
>
> NULL now means drained.  Initialize the state to DMABUF_ITER_START and
> translate it to dma_buf_iter_begin() on the first next().  The iterator
> state is BPF-visible ABI (one pointer wide), so use an invalid pointer
> sentinel instead of growing it.
>
> Fixes: 6eab7ac7c5ee ("bpf: Add open coded dmabuf iterator")
> Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

> ---
> v3:
> - No change from v2; reposted with the updated 2/2 attribution.
>
>  kernel/bpf/dmabuf_iter.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
> index cd500248abd9..390f6d730a67 100644
> --- a/kernel/bpf/dmabuf_iter.c
> +++ b/kernel/bpf/dmabuf_iter.c
> @@ -156,6 +156,9 @@ struct bpf_iter_dmabuf_kern {
>         struct dma_buf *dmabuf;
>  } __aligned(8);
>
> +/* NULL means drained; START means "not started yet". */
> +#define DMABUF_ITER_START      ((struct dma_buf *)1L)
> +
>  __bpf_kfunc_start_defs();
>
>  __bpf_kfunc int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it)
> @@ -165,7 +168,7 @@ __bpf_kfunc int bpf_iter_dmabuf_new(struct bpf_iter_d=
mabuf *it)
>         BUILD_BUG_ON(sizeof(*kit) > sizeof(*it));
>         BUILD_BUG_ON(__alignof__(*kit) !=3D __alignof__(*it));
>
> -       kit->dmabuf =3D NULL;
> +       kit->dmabuf =3D DMABUF_ITER_START;
>         return 0;
>  }
>
> @@ -173,10 +176,14 @@ __bpf_kfunc struct dma_buf *bpf_iter_dmabuf_next(st=
ruct bpf_iter_dmabuf *it)
>  {
>         struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
>
> -       if (kit->dmabuf)
> -               kit->dmabuf =3D dma_buf_iter_next(kit->dmabuf);
> -       else
> +       /* Once NULL is returned, next() has to keep returning NULL. */
> +       if (!kit->dmabuf)
> +               return NULL;
> +
> +       if (kit->dmabuf =3D=3D DMABUF_ITER_START)
>                 kit->dmabuf =3D dma_buf_iter_begin();
> +       else
> +               kit->dmabuf =3D dma_buf_iter_next(kit->dmabuf);
>
>         return kit->dmabuf;
>  }
> @@ -185,7 +192,7 @@ __bpf_kfunc void bpf_iter_dmabuf_destroy(struct bpf_i=
ter_dmabuf *it)
>  {
>         struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
>
> -       if (kit->dmabuf)
> +       if (kit->dmabuf && kit->dmabuf !=3D DMABUF_ITER_START)
>                 dma_buf_put(kit->dmabuf);
>  }
>
> --
> 2.34.1
>
