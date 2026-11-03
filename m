Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793744878;
	b=C2tg2YpW5tURsr0/t/G2AlX7YwfV+ZwvfP9FecP1JPr+/+hduGo8z8z8ulAOefoJGbE/
	 D/elIK22327bbq6oPxe/RrTHNRKZOJQMJWfI4SwnP0NHWZOfm5Z4Wl+JjENCdYW8LAtbd
	 GsDqplbi7iHjIyq8eQakwpbgR79vEbF7JkmDDwMwT9Hq8Ov7Vv7VuKQ7AtFX54VMkXQPJ
	 8I8hCwhKawK2wFS/Sjw6YRcsb0QAL9p9mtRjy4LbGZLXRb3ZNXDZx9CpHCSPFR6FINysc
	 GUexYa0GSKYLEOoQNtpcmKM/nwYrV8xWCn69jumpVIwLq5gNq5YSPrxjqYeddeKkkFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=U6sOeMDVcAvnCgHIdX2jRiq2c1v5uHZOJD+0XTCDNiI=;
	b=PwcsJXJpHMHVT6Nx/BRvAf/9seeGmKLOPop4OOOq+kTXIX2AzJy+yc2QITWVG158xlUZ
	 UFG30fsE4dB/fgWD8Gi9xDLI8fw78NkN2pJIAAy+S81pj8Gz3SFR+1hCjgsZojFVaGs/6
	 37fsCi2bDcfFwbNA/o2ei7VGxlewFDQGpAOf9qf1A/O7sTlkW/yu/uj5wvyyqn/gP+TwB
	 YfEgYiAiozq0JHRgpN7VORUaxhe7tDxFF3fw+4SoOCRbW3pbc60l6Fo8EEFO9OkbwB8dA
	 da3bys4sM+xyFRZEL0g9PaDhRD4MzKGzu2oRZ/MrpJow5zUFsoRFxsGuCc9/0yJYHYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g7pPR470;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D924606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D924606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g7pPR470
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5383c97c8cfso38451cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:27:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793744877; cv=none;
        d=google.com; s=arc-20260327;
        b=MU/MADS9gL7dsLDyEgPmrMnmYLp3qbLma6INwizzfu3t0uvW5D+QoyhBwsC8My/6xo
         OfTWYMBkmGoSIy6hE2COlW0t9rufyUAYr7F/uO63cYu65qh7w5PuP82zx2OmlkGa69jm
         YxJXoNrGwLWzKJOP/VU0Npq/FBrjJ9NcwBFgmtGsEQAeJN4VFW9c0UMzYVwxqLTpyJ1H
         0BdJp/+ZLjh4QQx3td8ArMyqcxuXnlVk2T3yipcQI7S06nnwAQ8s+rLoiORo1uhq4GkG
         fiEEPQmZvPHSyuGhjgxRBzfsK7x3zrrxWNAc9qytQNwSnRDB+DLlnRXo0sXo8GYNkicw
         vUNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U6sOeMDVcAvnCgHIdX2jRiq2c1v5uHZOJD+0XTCDNiI=;
        fh=/oFE17bGKkZszq3DsxFcg4XDdSKvYFDIdljD0K4HAVk=;
        b=gKCKn4q71lnoraQSKpywYgUknDaAtmYvsPq3M1THv9XVZLML17yMlS+npASukUReJh
         OVPzTS68nU12wkxeMyi1mlKJeLgfu/B6wWofJ27CIZ+34FvoFAAgNWGed0H1YcbUdUj3
         Olr2LgeG/5erPVkI5cCFyiBAPZsDxcIsih33vv6HG9SInaWjtri8frC1wbURqd7cjE8y
         6RfMPEJox3mF1/x1oBtYduykFRCsk5cKet4xGMxbsKAZesmJ9fVopc6SYgvRZh+RGrqd
         WxXFRz+ybGjZHR/59IBW5wUtpscJ10mcut5R0GaO0/hDLUbqnhOszugIeX60kf88HFhW
         3xwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793744877; x=1794349677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U6sOeMDVcAvnCgHIdX2jRiq2c1v5uHZOJD+0XTCDNiI=;
        b=g7pPR470Cacpaxyq4bouZC5n+xAsKKXcWKRnDviJizeavWvuP+QVqEvi0u8zdOX65A
         sMQm04l1bjCw2aXHRB3dF/LeGiKgY5LOIUVG4gDEyv0SHS96/pClIJreiJx5ppi6LjrY
         eijCb/+dkNxT0KFC2NnbfedPtHUI4fmkqUjcSXademL4yPQ3oU1OQRlB9g530/IyP8BU
         sZxDXi/bqc4ZegEcQmLHjjavdguBpDsC/jJ102zP2NuVZgNjtoFtDeGmzlusXQiyUSKG
         jngfHDfSVTs0iUeLa8qFUaUOeBQYA0AVTG1Vy0Js0PoVcpZMNcGPShLgMCH9KXSJNY/i
         CIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744877; x=1794349677;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U6sOeMDVcAvnCgHIdX2jRiq2c1v5uHZOJD+0XTCDNiI=;
        b=XsThctFIjRc+w9DhK3whRJ9Y8lh5nq05WypzHlwgKZLyu+zuTQc3eKTM3XOnanwDgg
         DqUXAUQ0kXU/xnz3Mj1ZuY+l1Hacd95N370Nr+fVLMfpc6hyCcZxmNE3W23svP/dPax5
         UT7emtWMpdtNJQ1FT6AOUiAmossUghqexvEXyGDG+N0K9y7uussNP2x6FWn9jCmYkXvs
         HyG5eSKqYj+sGayV5Wg/kRsprB1E/fnCMJqaDJNreUH5hY0No3JhKdhBuHmKf/Ulgyv5
         AF3k16kMeAtHTNtGwWShMsGu3rWZRZfyNUNjD6gm/vCyvsrW5EM/ttqlWwJ1y4AYKg2c
         BkuA==
X-Forwarded-Encrypted: i=1; AKwUvBzk6wHQcPxt+dgi3BruUYm1SQasXRs+Q7QuvvT3abK3mOvx7xBHjLfw9AeJwth5x1E94XLJffg2MIV2doA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YeTZLobyEcDU4aAOBxUtxobBFw2Thmud+Aag/o3mQUgNaoM9M
	V0rSswRJnJVxRuFwnPwKicXsZZVGx8JslVFyo1kDYUUMlBbq6MJglOpifwe7/5DiSiTi6Thm0nZ
	vA4P9IOLLsu7tuHPx81Y41sxWKbeBC/nhh6NBZZ7CgjuMabg1nHwBxqpNeVU=
X-Gm-Gg: AYBFou08eccsOGs6CMk9CDDouU/Rlcmg4HrAkDn9qMq0rRecr9SJITwrpIMmiDjkIIR
	vQrHTxZAIyfvtmXSOw8WaWjzJwCtzPmhuL18t3sbehNAR0wk8XKP96jEzbPsS/F09tYiUNqN0j/
	JjYLJI2xVyxeB+MeYTIpR3kqoPy+VnAYB9TIx936WT9K8M5kz1e4gzJyI5W6GHgFWYtBSyg9Dpa
	kdtDVskwfgH5k8UwqzFikrZPBOtoEyW4x25OaaYpwZAmwtAjZfdawo75fp3M6GZ1YJVTN+m681o
	TaX7q4+tQAoUqO/DfO8Gp1iu01LVkoMszyolYnLwUz9LReHmZWTD5WKdz/x8ON5wWZPXJoAnmj1
	u6jZDJXSdW6UqOnRl/OhFP+Q7cPTMo9PIrKdWsHG6eUQYA/u/PA4hkEpB6dM6ALJWxk+kuMuD3N
	a+0pIWlE0e7WQ=
X-Received: by 2002:a05:622a:2b07:b0:542:fc60:fe23 with SMTP id
 d75a77b69052e-54b2a80e855mr5349021cf.3.1793744876064; Tue, 03 Nov 2026
 14:27:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103070407.1211071-1-robertpang@google.com>
In-Reply-To: <20261103070407.1211071-1-robertpang@google.com>
From: Robert Pang <robertpang@google.com>
Date: Tue, 3 Nov 2026 14:27:44 -0800
X-Gm-Features: AclHuK_ZoXvD-8aoB7BiBr9V6B5ChZ0ecv0eLMPp_diX0MDcPttP-OdgfME7Vps
Message-ID: <CAJhEC051dpSeqoMR4-w-feaEdR90xW_g9O91RiZ0HJoUM6CofA@mail.gmail.com>
Subject: Re: [PATCH] bcache: fix available bucket accounting in bucket allocation
To: colyli@fygo.io, kent.overstreet@linux.dev
Cc: linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 11:04=E2=80=AFPM Robert Pang <robertpang@google.com>=
 wrote:
>
> In bch_bucket_alloc(), a cache set's avail_nbuckets is decremented whenev=
er a
> bucket is allocated, assuming that the bucket becomes unavailable once
> allocated. However, when a bucket is allocated but the GC mark is unset o=
r
> reclaimable, it is available still. This false counter decrement leads to=
 an
> inflated in-use measurement, which triggers cache bypasses once CUTOFF_CA=
CHE_ADD
> is reached, persisting until the next garbage collection cycle.
>
> Fix this by ensuring avail_nbuckets is only decremented when the allocate=
d
> bucket is already marked and not in the GC_MARK_RECLAIMABLE state.
>
> Signed-off-by: Robert Pang <robertpang@google.com>
> ---
>  drivers/md/bcache/alloc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/md/bcache/alloc.c b/drivers/md/bcache/alloc.c
> index 3ec240ec685d..2d0cb9b414ac 100644
> --- a/drivers/md/bcache/alloc.c
> +++ b/drivers/md/bcache/alloc.c
> @@ -446,7 +446,8 @@ long bch_bucket_alloc(struct cache *ca, unsigned int =
reserve, bool wait)
>                 b->prio =3D INITIAL_PRIO;
>         }
>
> -       if (ca->set->avail_nbuckets > 0) {
> +       if (ca->set->avail_nbuckets > 0 &&
> +           GC_MARK(b) && GC_MARK(b) !=3D GC_MARK_RECLAIMABLE) {
>                 ca->set->avail_nbuckets--;
>                 bch_update_bucket_in_use(ca->set, &ca->set->gc_stats);
>         }
> --
> 2.56.0.398.g882cbad275-goog
>

Hi all,

Here is some more context on this fix. This issue was observed during
the investigation of [1]. We believe this is a latent issue exposed by
longer garbage collection durations following commit 009073806fbc
("bcache: reduce gc latency by processing less nodes and sleep less
time") to reduce front IO tail latency during GC.

Best regards,
Robert Pang

[1] https://lore.kernel.org/linux-bcache/CAJhEC04+1tu_vGVNfc0TicEb9T2wPpFPL=
qmQRqX0G_k7M3sBwQ@mail.gmail.com/T/#m0be3c1a4a63427ed7b233a3f753a55fcded69d=
05
