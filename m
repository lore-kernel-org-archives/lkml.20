Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793743086;
	b=M2TlK3I0AHIOPUbf5Ug6UMgFS75EFPxTpIL4mt87MrVwBGQi8BS7EjwDbByNyDIJHQsu
	 GBiOqX+GIICORsLPMiOl4DR5gUIRQsCblmtOOknUivFSOSCANkIOCTh4zZ/Hj8rrY0Nn4
	 K4lIcn7+pvJWan7US9gvBrDlOoPprCrR28bBVf1E6+aOyqHKGubf5PbYknXDJ+5bYpgQ/
	 7qThCOQOivRM3szFF8XZLy9qil0MPXLKyuuJUy7lOF5VwqTQuxLtl+vPA0c5jFwtb2sSt
	 okTeEbYwyQda7bGzJOZeMi8WyCwb4B2XnrLf0fY8gxlfJd5eyI+maHuugeRsucOFseQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eXfhE46ByNVgLysQds+yI8htZlyiiFA2uPyig/gxm3w=;
	b=fF7AWtCRvH3+cMVAUSgmpLXWsorfIvpEkpMqFAKvGGxY8QfWU0NTuKPSb4Px49O42Nrg
	 7NzA2sLnx+rpprfbhlyRUEgmkbo4aueIYN5FH/v69LUc5Dq2HODQ1GzW9oh2/kR0ViqGM
	 V+An1IC6em8fvreW2qO+Ekco1YHH8YvWaApejAl2Stza8ZUO/MvWOFAVh3u7Bffw7j3B0
	 4+L5cZWWg7eK8mV4RTUVKpnXq1jTN/Ri2qmDZBssdl9wO5Rkrw0KfiFV1MhuCwp9dOgIS
	 nSEkXk1bXZnqY3cqb/Wg4DREKMRtk2wna1x1DbXp6tXPjcLqA1cSl1uImmPrVAWwrsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dwK6R528;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62680606D802
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62680606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dwK6R528
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5383c97c8cfso29561cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:58:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793743085; cv=none;
        d=google.com; s=arc-20260327;
        b=nzeQ6646TOj94zcJIZ+GywONBWf8qhqm4qttOtyRx32UiMXpGDsm5Wqa61tCa+DqVM
         Akfxcz+SRQ0egVg9b0GCPU7XGY93ZURiLKkTKnrCCqkiWYKMBWSjyv/m4giPIyV9KGxl
         biNLY47k4gyi9LTYnJ/iAQKrurr07US1naITzPyCiY7udpdZ/A6WRKi56ZaxnsIlreee
         IW/aVjDCid0Mlm4Hq/Z7O2u2JIqDInrcCRUPmHtpwi9lN5jOOke3uHQkWRjj1YWnJ5Jz
         5JuE4g5lQjZidzObC4WxqZrUh4JKedVAFnOpfK7w/tL/x59BY2hw1T7gWLc5ervByitj
         vJ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eXfhE46ByNVgLysQds+yI8htZlyiiFA2uPyig/gxm3w=;
        fh=nF7IACXZ5rJhLt2S9tI5y+FHIPodbxb9HxNAKLlA6NE=;
        b=AfrdoaJQXHmAl3eKLiOs5mR/GLGC7gdxA0pQfWYhzyxESNQGy2weJNEGQhfYc2Xauk
         HMAGlZEht53KrBX8Dhzto07KWsdHyt1RuWYpP7Gs/VMlVeRvOtm1FFRB6f61LCuGvO3x
         mFpn/sXGCN497R2yCggdQ7tciEwPxOmNdqifub/RBdkA5thaS/jzxqazz3A5Q6X9qd+A
         tO6PN7f3eaLwX3lWbLXElNljpgm31DiHYVhlUqCfTvjke+GzfLiQ9dTf+EU5GCzqx/Li
         Sjax9B0yCiVXIbEaJ4Irwm/Yf7CN3toX1rJH3E7MPStF8TdVQQO+UHnskxamyjpF9xFT
         DQLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793743085; x=1794347885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eXfhE46ByNVgLysQds+yI8htZlyiiFA2uPyig/gxm3w=;
        b=dwK6R528K3S39IyfjydsfTmiX9LFzcMgUu6nD/bXYJxrTqYBDETz4LHTEWG3NvhFdp
         ftUx9Z11He8VAFPjJHRr5bojyw32mmnOTt8LYj+cpgAJa8HRcBJyGAYZUNLX/2nAnnIr
         h1HsE3eB6LxLOi3YlXTAWu0P/8uJVQYMy8o3OUCN1dZrhQxMzeUZ3sVLJC/bIE1XYPZ/
         otjku0JGSireL02eK0A5I6P6ovG/mxXK/0Kx8cWri/wVw+PHskU/xRs8cnTqDzWCJAXy
         N8cMOqB1Txna/jVRUOWDzzwDmH6vTvYrkCiLU2AmRYB155PbWmiR26KDx32bY7K1AQkO
         LjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743085; x=1794347885;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eXfhE46ByNVgLysQds+yI8htZlyiiFA2uPyig/gxm3w=;
        b=LOA8Q1F3iKmDLm9CFBRNPptpf9L7horPs/+FYHNufsD5WR/tA4OcUSG0jxvRuOZ/+Y
         0h3cq1tHLDT7Ao8fqzomTJajzBWTuIE34w93YThQNwhSkUWepGOD8Dw5ojhfBExWTssR
         nWIjZEkkOW5hXjdKwcChhsINXjQLxcnGOJDzTDykfPDLvcJ41EOWxQZTA8wcnxtieiVw
         vQn35NvQashp6X61wD4DYgIfChM3sNy1AHu/Ocy8S1rDroZWv4u50fbNOmKtXXGUKgSV
         gydGuNQhTsKcd6PwBlo5A9DXay4QFqVo06CjFOdXLfQjirMaIHYbae/SACcAFhg8G4c/
         iDsA==
X-Forwarded-Encrypted: i=1; AKwUvBzHA6r834tYq9h4OCRxR+9GaerN37g4S5ZmVkMqUSry8gmHG3dwHuCy2k5+alWs5rLeevuCoGSpDUPx4mA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pdBwdceGw7FyAbFOqpu7blWu7FLCaBxbJX4yil3D3gDWxmOYf
	M9USueC9WoZgmh8VPDKCZUzUA0YBmRMjc16K23AzefH5E9Qq5kiQ0uRREBM6aDdnd/fY/19lv08
	YYdFQuo5ieFmJvuChYmkQk2OLVu+uiIMuKtVyxltb
X-Gm-Gg: AYBFou1scNb3wKAQBntrl3eaC36Pt8VU5vVzf7bVlxq34WLOxzLXAZrV73hP5EwbAF5
	VxM/dDYGeuywgRMXR39NpofBoW1lQe6+NVfbdZdVT5Ow+SssXg11FENYzHXFIZ6iuTxsvdRl6sz
	roCo5KUl2OhGdtVtKyU7LfmuaBSWxGJk65sPCinMKcTZ6xls62Idh0RyGAO+ibT6cAx9AI5iNPq
	mtRIoxVCUryvVzb0l//D4oOG92P7UbUIB+00p/X+b9SBcorjYzWfsN/oE8bQX5lzE3NmY48eeSj
	lqot236+1TgKC14HD+dGyfnfcv7do0rHA2L/k8NpSD62YtYNluYTnF3iGjwLBs+ZNX6DYa9UFeK
	X8LdowBwqEK1/6Y++lUzgf4ily4k6oyd7KAV0fbZX/EHulEYSjlC8MTBSmZG+MpPl2A==
X-Received: by 2002:a05:622a:250c:b0:534:313:9b4e with SMTP id
 d75a77b69052e-54b2beaaf4amr4792951cf.5.1793743084531; Tue, 03 Nov 2026
 13:58:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103070122.1208383-1-robertpang@google.com>
In-Reply-To: <20261103070122.1208383-1-robertpang@google.com>
From: Robert Pang <robertpang@google.com>
Date: Tue, 3 Nov 2026 13:57:53 -0800
X-Gm-Features: AclHuK_s85z0JpxqehQwdC_3u-Z0zzJP76eAsxlJmBPLxwKxztS9OJIUR-ZEAB0
Message-ID: <CAJhEC04+1tu_vGVNfc0TicEb9T2wPpFPLqmQRqX0G_k7M3sBwQ@mail.gmail.com>
Subject: Re: [PATCH] bcache: allow more bucket reclaims during garbage collection
To: colyli@fygo.io, kent.overstreet@linux.dev
Cc: linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dongsheng.yang@easystack.cn, mingzhe.zou@easystack.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 11:02=E2=80=AFPM Robert Pang <robertpang@google.com>=
 wrote:
>
> In patch a14a68b76954 ("bcache: allow allocator to invalidate bucket in g=
c"),
> reclaimable buckets are added to the free list for the bucket allocator
> at the start of a GC cycle.
>
> However, once these buckets are allocated, they are no longer marked as
> reclaimable until the GC cycle finishes. Under heavy loads and frequent c=
ache
> updates, all reclaimable buckets can be exhausted before the GC ends, cau=
sing
> the allocator to wait and stalling incoming I/O.
>
> Address this by allowing reclaimable buckets to be reclaimed during GC up=
 to
> the number of generations left before BUCKET_GC_GEN_MAX.
>
> Signed-off-by: Robert Pang <robertpang@google.com>
> ---
>  drivers/md/bcache/alloc.c  | 3 ++-
>  drivers/md/bcache/bcache.h | 2 +-
>  drivers/md/bcache/btree.c  | 5 +++--
>  3 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/md/bcache/alloc.c b/drivers/md/bcache/alloc.c
> index 3ec240ec685d..959d753e7cf6 100644
> --- a/drivers/md/bcache/alloc.c
> +++ b/drivers/md/bcache/alloc.c
> @@ -141,7 +141,8 @@ void __bch_invalidate_one_bucket(struct cache *ca, st=
ruct bucket *b)
>         bch_inc_gen(ca, b);
>         b->prio =3D INITIAL_PRIO;
>         atomic_inc(&b->pin);
> -       b->reclaimable_in_gc =3D 0;
> +       if (b->reclaimable_in_gc)
> +               b->reclaimable_in_gc--;
>  }
>
>  static void bch_invalidate_one_bucket(struct cache *ca, struct bucket *b=
)
> diff --git a/drivers/md/bcache/bcache.h b/drivers/md/bcache/bcache.h
> index ec9ff9715081..daae5ac5ffbc 100644
> --- a/drivers/md/bcache/bcache.h
> +++ b/drivers/md/bcache/bcache.h
> @@ -200,7 +200,7 @@ struct bucket {
>         uint8_t         gen;
>         uint8_t         last_gc; /* Most out of date gen in the btree */
>         uint16_t        gc_mark; /* Bitfield used by GC. See below for fi=
eld */
> -       uint16_t        reclaimable_in_gc:1;
> +       uint8_t         reclaimable_in_gc; /* no. of times reclaimable in=
 GC */
>  };
>
>  /*
> diff --git a/drivers/md/bcache/btree.c b/drivers/md/bcache/btree.c
> index 27a129d47d0a..fc167868c814 100644
> --- a/drivers/md/bcache/btree.c
> +++ b/drivers/md/bcache/btree.c
> @@ -1742,9 +1742,10 @@ static void btree_gc_start(struct cache_set *c)
>
>         ca =3D c->cache;
>         for_each_bucket(b, ca) {
> -               b->last_gc =3D b->gen;
>                 if (bch_can_invalidate_bucket(ca, b))
> -                       b->reclaimable_in_gc =3D 1;
> +                       b->reclaimable_in_gc =3D
> +                               BUCKET_GC_GEN_MAX - bucket_gc_gen(b);
> +               b->last_gc =3D b->gen;
>                 if (!atomic_read(&b->pin)) {
>                         SET_GC_MARK(b, 0);
>                         SET_GC_SECTORS_USED(b, 0);
> --
> 2.56.0.398.g882cbad275-goog
>

Hi all,

To provide some additional context on this patch:

  - This commit fixes a recurrence of the I/O stall issue [1]
originally addressed by commit a14a68b76954 ("bcache: allow allocator
to invalidate bucket in gc").
  - The recurrence stems from commit 009073806fbc ("bcache: reduce gc
latency by processing less nodes and sleep less time"), which
introduces longer GC pauses (100 ms) to reduce front IO tail latency
during GC.
  - Due to the longer GC runtime, commit a14a68b76954 becomes
ineffective under heavy cache updates because reclaimable buckets are
rapidly exhausted when each bucket is limited to a single reclaim.
  - This patch extends commit a14a68b76954 to allow buckets to be
reclaimed multiple times, bounded by the BUCKET_GC_GEN_MAX safety
range.

Best regards
Robert Pang

[1] https://lore.kernel.org/linux-bcache/1599736884-5479-1-git-send-email-d=
ongsheng.yang@easystack.cn/
