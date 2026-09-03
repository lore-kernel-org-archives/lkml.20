Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382684A5C50
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439770; cv=none; b=K3/x1c4kh74vDlc/o/zgtjfLSkmI3wQXBNhFJCjNknuML0Gy0s5TczQIte7CkskSaZIIJw+u7ywEm4d3kCqqtxYt2grvZIduR/42EmYwqQYZ02z5vK/WzVh0mBMUEmSsluSPytfSDPb2oZ7uyeICdPt8Jl18uMOS3EYXOfg6J+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439770; c=relaxed/simple;
	bh=SCJH1YaQiZ8otd5acpUPrUWrxC3sCSBup6bILvA0gn4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y+g9chdON6ZziEzzoB81eKtNQqxn8EWCK6qK9PrsQsm/dVMPgfNjJZzAR+zsh5gRHTRTprj0D3OL2F6DeocvPZGYK2caKIjniXR/p1W7+8iz+3Ir62KCcoHtkjuvuSO0qU7AenCqYQzaXqj2MdVoneZMMX2FvAw/Kdyq3HpjOFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Npmm8Xgm; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Npmm8Xgm"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso1548315a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788439768; x=1789044568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UXj/TYVdXwaN/k93Aa7dPL0IcomTyKCbxd6CDyPSqJs=;
        b=Npmm8Xgm1suFFaaJBpPazpRSS8p0SlxPGrXHCaEM+mVbIkEY1mDTo8yvdAKmmAxyPq
         zC3sK8Voh9jeKn7PmvB3SWpq32BU74jM/CZFaXM2rcbLuacPTWvsZ5OY23nr3R5ttJdo
         yNSe5N2UbJzH/4KoB7vZtnkwE7zOGd6jnRQ6c4+kEbCX9MliY+10lXD6ztKm0fjFINcK
         3ZKBLbA40jxeAC6RxOuD2oyo/Ei9T6GMyD7LDb+D65/ANXtB7/wyVGYbV8H3nIiz4py9
         Ok+gf6sDId4cXP9lMTFHbpI2u80VYIuezmSUuoTExfvlqOJp/OIn8A25cPtDikep/UNg
         Zygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439768; x=1789044568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UXj/TYVdXwaN/k93Aa7dPL0IcomTyKCbxd6CDyPSqJs=;
        b=K14RUS+kBzmZlufkSFK0viwtmRxBiIBMc/r/rlYhfqaBkubHO8lO1gYiRZdXOm0cTm
         o3uNO9a7AtT9evVvZRcnyfpj4gvxvK4dwvXwnumXZQDS9b6Zf9ldD3rt8TLQ4YIbcXS2
         s2Ag8hdWkdj05X7VSPZB/vISdSJowJ8aDac8NQ+CjHxbNrvFl5HUdHwRgWR95tCuXIFk
         b5xbMi3lUk8KyOYmfJECj71u8ohK63DYenwzLOG0EDxDh9yAKyttBSt2iZVLFo12z2Ai
         3PU9fakhZTvum387QqFyl0pJWUYg/IEgbvVxoFgmDAOtkffxGJIWl0gbbkh4PDXF+4n5
         SxTw==
X-Forwarded-Encrypted: i=1; AKwUvByBzY2hzTCozojdotovht4PSjx/G4MQnqCoMAbAsmqZsD34Lx2ynHWpQ9/1GnuYxDTJqBdnJSkBGGnY42E=@vger.kernel.org
X-Gm-Message-State: AFuF++mvPWHc+zKT+/AF5GYcqNyw4hRflX6i2K6n/F8aB0dFDeN55nQ9
	aLe8KEgHhmgTJ+DRIeOPpwctViAZ7bBUzG9miUuJsA5PWr6BS74mN+kR
X-Gm-Gg: AYBFou1KiHEoafhuzRZplA7Z/9mhW0sx0r8fi3oKJDgcivnudu4YhFAAwABl+1xMTx0
	K8J0f9SWPJnzQhtW7cDEY9zYdpF30pmterg+i/ksZEzt0l0d4LkFLbNXqLXjT2xZLOcVS92AjXh
	0lZvYsP7jdF/hm2V25atF+W/rdxj8es6W+aZOko3LdX4e4R9men9Hghqlq3r36TIRAiwfS9+Eww
	H+7VtGomC6EeDjPh+5KNiktpZST2iVJ9bVPX5++sFv+s+SswghS23dqzPzWbZc610CiQqCAiMYg
	dnnSV55rVdqlpKpXOgSZDlRqWxNZa3CMXLoNXyu6p3x4y4OA/gBA/mZ2cXbXbrSWjtSJG2Nknsw
	sOviNC8U8HAyvG3qtNHZqvZAXInt7hQB/CkiUcCYdm+nw6p8apwqDSH2f4yyc8ZzgP4jSFW5UJf
	Oj8n6dg3gMhbbWXt4EisgzzE58PHx6OtzhCx1ZvF6mRkaPXfKtXBE1dz1Ph7gEg6w4tAK4nEgWY
	qt8bA==
X-Received: by 2002:a17:90b:4b89:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39aee105a46mr17130138a91.18.1788439768292;
        Thu, 03 Sep 2026 05:49:28 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcd243sm5431599a91.5.2026.09.03.05.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:49:27 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: baohua@kernel.org
Cc: akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	david@kernel.org,
	mhocko@kernel.org,
	ljs@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mm: vmscan: avoid anon scanning for GFP_NOIO with low swapcache
Date: Thu,  3 Sep 2026 20:49:15 +0800
Message-Id: <20260903124915.4099765-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAGsJ_4z+SgetmjVD8bcOFisKNd9CFqe6kNcYcFtVd-PijYJ04Q@mail.gmail.com>
References: <CAGsJ_4z+SgetmjVD8bcOFisKNd9CFqe6kNcYcFtVd-PijYJ04Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Sep 3, 2026 at 6:35 PM Barry Song <baohua@kernel.org> wrote:
>
> Yes. The coexistence of `GFP_NOIO` and anon rmap scanning seems
> nasty. We might also want to do something like the following, but
> the side effect is that it might keep a folio while preserving its
> PTE young state, indirectly making the folio semantically hotter.
> So this may not be a good option. Skipping anon scanning in the first
> place seems more sensible.
>
> +               /*
> +                * Don't waste time doing rmap and scanning PTE access for
> +                * non-reclaimable folios.
> +                */
> +               if (!do_demote_pass && folio_test_anon(folio) &&
> +                   folio_test_swapbacked(folio) &&
> +                   !folio_test_swapcache(folio)) {
> +                       if (!(sc->gfp_mask & __GFP_IO))
> +                               goto keep_locked;
> +                       if (folio_maybe_dma_pinned(folio))
> +                               goto keep_locked;
> +               }

Agreed. That matches my thinking: doing the rmap/PTE walk first and
then keeping the folio would leave its young state set and make it look
hotter, so skipping anon selection up front avoids that side effect.
I'll keep the check in can_reclaim_anon_pages().

> it seems we could just use mem_cgroup_lruvec() instead:
>
> -       struct lruvec *lruvec = get_lruvec(memcg, nid);
> +       struct lruvec *lruvec = mem_cgroup_lruvec(memcg, NODE_DATA(nid));
>
> I applied your patch on my PC with the above change. I didn't see any
> panic or run into any problems.

Thanks, and thanks to the sashiko bot for catching this. I've switched
to mem_cgroup_lruvec() in v2, which also lets me drop the get_lruvec()
move entirely. Thanks for testing it on your side.

I'll send v2 shortly.

Thanks,
Bo
