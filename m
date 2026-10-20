Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792527591;
	b=hg1xYlqDV6oAxMXPuHXfYnci4Bso86MupaVX60UeLzwqg3D75R7/pl+YSYYNsQUhe4iq
	 yOnyPw0AxXpPr9qCbZnJ+PtfcXLF/7OCVwSl5PSvyPuiNK66rk8QwNPxn1WX2m7wfwnB+
	 mtKoFsN0GJeFb50oaauKJuKOAV8rm7kUH5z68whAwv/xOkvdvSJf8HU7/bO7/j6IiGRQx
	 TY/jqZcCqDvls3VzzQQ43L1zaqEnxPfR6wH4chq9Wbskef2SqKyAQ59bKpJ+uzndtfQdH
	 9HBBTC8fWqZE2ulBo+A4DhffTOppZv1hCH5vYv7G55J4u8tA+PCWbsntUsId7rd1k8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792527591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MRhdzsXjkPnZHHLr+3Q8i+R2BJY5HtmbkjLcsOK9Zzw=;
	b=JZAweXzegmhTVjFabEDk3kTrk301WIDoSMy8jb2FLUVBjFTTgMxv03OcPxJVPcg67+Or
	 IYtRhe4S1sUXOcgIk2oEJDBo6MAVQdp9R7WlmyxUiYIoc5bwIgu/BqZRoowU85jpwtxAw
	 1pASkCkhdsZRofuvaZCjeMPx0pp3Nqzj0SHLOhUgMFBb4Re/to+pjr7RQgESmvrwDFcDi
	 tYf4msNhhmIpaqo7n9rhUeDBr6H6vcmJIvlcGpZIAfnR/IpFzYKq9HBRe6w4tC0NJt8Sm
	 1JZzvwPDM+O4cgr4hOoVciqyoLkohu2V6GkPmAnwaDu4fqvNB215jWIE5xgr/CcXejg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j8nmofGy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC15606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CC15606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j8nmofGy
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1df146015so53795e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792527589; cv=none;
        d=google.com; s=arc-20260327;
        b=LQg/OGZn/mF4FMwXoChY+uSdcpzkyNwP4lOiuD4VjdSxpGk9b0fC0R9pKzIgM3Ues8
         Lx49koBs5sBsWONDxONyJzZ9myTZ628nOddBVQ4yNlOZKZpiZH50zx30uRetUK5D4gz+
         5TELYcoecemgX9IbGfR88HQF7Reg+vHsQ7Df9qEt6LTjBLFrY5pr4H+/6aDBR0ArfcV/
         0w2TYgfijHdDsj2BRCrcMJpk4W1jTY4vSgc/GrqMIIMHnBjhWaAccvrq6zcwRv6L9Iqw
         pbUnjDpUDxB7HmY3cYk4bmsxINrOmKjoUPhIFJRSDJ/NTODi0dcIjnjYJQiycXh/3Fv3
         MSsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MRhdzsXjkPnZHHLr+3Q8i+R2BJY5HtmbkjLcsOK9Zzw=;
        fh=RDshDNIVgHvrKM1LIYpUZlGgwfnA64oBU8U0IOvQAuw=;
        b=bsvq9bFB7pIhYz4TaXs4jAGOdp4o+bv98duZRYDTaI5Zba28IT31xqoxaXSTRSk8RB
         i2Sl1xP1RvbJOvHmIbGoFwyLJCw4B3091VJ0a2BoKKOBofT9XvD8zr0LIxGOTUKhSwQn
         R7z31IK/V4fhWMkNmMhNOSwtFm5GjMy5N6GkE2HxvkAQRd7UPSFiQ0cRdJpLXIBSYhVo
         XmD0Du3a/CaEx6splJMM8xTVIHSHqbIvPvqRO+Ezm8uBYRYci6OdxKdG8pAumQ0Vgxtz
         CypT84+hAHlHkzNS1nS5ZCCZ7emWKx8BdudjMYAvdvb5D6dhgCfGUv3vovIDtqf3r9bk
         MvVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792527589; x=1793132389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MRhdzsXjkPnZHHLr+3Q8i+R2BJY5HtmbkjLcsOK9Zzw=;
        b=j8nmofGyTJP3d+Aj8hJjpcskIYke1FWfEm+/ciY3MWuek3/agZNaO6jBHreRliLv/H
         Aiho0WyE820F9AzerpvYKHPsDhdHFJisad7hnky+GglPt4lLWUt540+ZMvneRGdZf0FO
         qnRbdt7UNEwoCHN64NHHPPaXQuPGGM2bb9hPn3NE3HLPbBaMDnoePfV+hW/EKMGfV7p1
         4T7dmzxc5S/tHrTkGU7UHMQ/t1aa/3+j+OJegaYoquB18AfdgmK3odddKaxVJlLcYibL
         +rAjKaOIUvgpJ7FDaHN82cu3HU9j2IOvG7Bsmw8Dns8Kjwn/E5nMNSMZo4Z0oNWNqG1X
         7rTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792527589; x=1793132389;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MRhdzsXjkPnZHHLr+3Q8i+R2BJY5HtmbkjLcsOK9Zzw=;
        b=jLl4/kXJ1y7MVw2RdzDK89mNDV7dAURVOjRQkGPYTFbUwdmgY2vJ637/G/cfMaro1J
         2uMDrKs1yt6tggtMOZeavgP7Jq/NBlO7AUEYWwWP6xyeX9a/A+uzHO9j4mxxuDCE7x4e
         DduE2LGrfRDzKDW870F/BfU8070XVaREfhwyZiBOoHYloMzC3TNLdWp49Wp3fnL2iAJM
         JmHaJqF7nFm2AE2Zlu5vw5aZvseeON0dbwXMmdcwcjI6A9fuon9LOB8qXEzfjv2Ci5CV
         7TTioSDiY8sBZKDoC4cqjoUON+F7mceerI7EEnMUB+1SQek9UWrROEeLfvkXnpIb5nsI
         hZ2g==
X-Forwarded-Encrypted: i=1; AKwUvBwnOKoLPtUeLagcw5o9jGbFNw69qwjARwNK3cYli2C+c1BVhTPVU39KmiboDVN3f1njqLTpceSd1d6u6BQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvqhoVyVHZaxwFiuCcMygXsu73HtZ6h5Le4oiKMG4T4xL+y8Ij
	hLSG30tbtYujumwvuPBpCpsypY6GMv/ctWEdbIMIHByAzE0gVGyQUfdEVJXlSjqZlcsZzdKOYKY
	Gd5rmr2tu/AwiMIGn/LerIWKeu8Kg7x5uy/iWSas=
X-Gm-Gg: AYBFou3e29usWrOJAXBd3UUjpK7O0W9csTMgch+7EahFFhKjDt+WulO8tWqmMb3Hto0
	lJzGDhVAlT2cAgcappFfCvcpT2RNPDvFYjL6s5SUCpyfD0RZ0VJOr2dsdIy4M7B/E6Nsk2K39Hr
	Z6c6tQxH+t6SpU+K0urjD3vRjtGpqg/UmtQVu0hXTNe2BD1630Y9Bwp631YqLF3ubhHxTdqLidp
	11EHcgmve+pOYMhSwCh44Clf9ilMwVQr7YHXVlXtvn6jkRLctWzvMBNGILzeYJRL3Zd/ajZdMT8
	mQFE9ShmA0ZDijVBL0cRl7GQo7Wqiq1id1lozgsg9AqE2Gak6MMl4yRjtkB5HQN8c2x54uSX4gL
	yFBYpcw24O1Qj8+7NpP25auqbmLy+pW71NYXs6QEvRdI2ivVzcS+SlAk/HjJlQljdpsyK24Y=
X-Received: by 2002:a05:600c:83c5:b0:4a1:faa1:3813 with SMTP id
 5b1f17b1804b1-4a1faa1386cmr33962685e9.27.1792527589379; Tue, 20 Oct 2026
 13:19:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019160615.2348500-1-nphamcs@gmail.com> <CAMgjq7AEg6XEUJPaM3mMBQAeS_KiDv8_za4w-R2WaZ=ZGenvuw@mail.gmail.com>
In-Reply-To: <CAMgjq7AEg6XEUJPaM3mMBQAeS_KiDv8_za4w-R2WaZ=ZGenvuw@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 20 Oct 2026 13:19:38 -0700
X-Gm-Features: AclHuK9xKTOFZ19xiMZBkY3q582rEW0wqbjhnZMOWfykMSCUkqYNJyTrgcZkxG8
Message-ID: <CAKEwX=O=PL3DEaEDe=F-=zhQ=VW3_UtcqesdX9fH_cr6orb2wQ@mail.gmail.com>
Subject: Re: [PATCH] mm, swap: revalidate populated clusters before scanning
To: Kairui Song <ryncsn@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 10:58=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wro=
te:
>
> On Tue, Oct 20, 2026 at 1:41=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wro=
te:
> >
> > swap_cluster_populate() can publish a cluster's table with the cluster
> > lock dropped. A cached allocator can use and empty it before the
> > populating allocator reacquires the lock. The resumed scan can then
> > dereference a NULL table.
> >
> > For example, CPU1 can retain a cached cluster offset on an SSD with
> > per-page discard disabled:
> >
> >     CPU0                          CPU1
> >     ----                          ----
> >     swap_cluster_populate()
> >       swap_cluster_alloc_table() fails
> >       spin_unlock(&ci->lock)
> >       local_unlock(&percpu_swap_cluster.lock)
> >       swap_cluster_alloc_table()
> >         rcu_assign_pointer(ci->table, table)
>
> Nice catch!
>
> I think the real problem is that it turns out calling
> swap_cluster_alloc_table() without holding ci lock is bad idea... I
> think this patch still leaves some other call site too?

Do we have another callsite? There's a callsite in setup code, but I
assume that's safe...?

But at this point, who knows any more. The caching only stores a
swapfile struct, and an offset. I wonder if there is a potential race
between swapoff-then-re-swapon and cached allocation? That'd be pretty
wild.


>
> We may instead add a "bool locked" to swap_cluster_alloc_table, and
> let it lock the ci first before it does any assign (not the alloc) if
> the allocation context is not locked. That is, keep the
> sleep-allocated tables private until swap_cluster_populate()
> reacquires local/global/ci, then install them under ci->lock,
> something like pre-cdd77f84d966, always assign it atomically.

Hmm so a bitlock?

Lemme think about it a bit.

>
> That should also cover the problem reported by Kemeng a few weeks
> earlier too, and prevent further misuse. My Bad on that change :P

No worries. Lifetime is hard :)
