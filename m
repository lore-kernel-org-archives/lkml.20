Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793039546;
	b=Gv9OIqE6E7HfyfYeqvW43FtvNUZBQLw4wjuodzvvns2vxn88xEeuHCUXZAsbfBx7wgjt
	 ceiWb63TewIpvG8KmcWlLUtVJoOaeIPwac9fWimvXnG+BtZZNwBPMx7ZG6IYPp/QHa+QW
	 BcbNA870On0hrK2wEMfetaN6IO9XAP51sPzPwdX+Pehv8VSa/XdwyACrmsREQ3seFza9q
	 ITUBkIAa9rwMDaVsbsBvtXGTvWUAi4bO8CyakfbqVO75BZb6hDtK3PJ8tSuk6yjyl0H+F
	 Eg/p9wOBJo6uAZ+z9FHq2/3Usswf83P2na3t448WFr3k7Gosr1djwpRFUy0w1lFLHzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WEX9+sqg9KeVky/NcPkirTK8PMNoKH+/ZsoFca1T+0s=;
	b=5OBJOGQo6d0nAcdgnIfeu6DfWsVAszcg73p97x32tIxTWc3Th6NnZfJufTzKfQhx/ORp
	 V6Hle/e1MksUhfXFXDaYp5/npxIymCIMOWjTynOqs/3drwmuvpL29N8+AqbVAw1NSGfbk
	 GhLS2FWR6P5+fBokTCPyo5a5syP7374mQdBe9qWwkTJz2sjnARJr59YQ27/HuXCyyz/de
	 JmCfAInE5qLw9IzgpKg+CjBQanwx29MePUwLY9rG0s0ogFNufJJ6y3izVLCZhZE6cZk4c
	 N4I7NZICuX/0FA+t49eRdZqSS9SQUDh3Jo2GV/F85rtRxolEI8NSfBeDaGHxa1pKifA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nFlKpNNN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00029606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00029606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nFlKpNNN
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so28613545e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:32:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793039543; cv=none;
        d=google.com; s=arc-20260327;
        b=MD0W5EVusZwkdhBah+hMgtpTQ+g/1MQ+TNsPnNmjbbj6E5FyOq4nzaQSk2LIZCU6Np
         nygig4ZFNnWPqiBAl2Hm7Kzh2uIQvf1q9F49rGuNZBrrZU6pIhSj72JJnmuzYSWlBa8/
         lQOJRg01EZA9o4zP8Uylo/9c3KC/hc04z8tIJS2+PDXhfUdq1JJWrkks/FBLUOXH9b68
         EBZcZ2LD3oDxZAxlYfHcQiTxXbQnqYvzCfOWTUOtouLklXdvHt8GycP7qJSlW7vDBMLZ
         AbeCbLBCnM5ycJ1rUJHGnL2UUHIUqmYHGthIW+fmSA4kjXw1FYYplyT9fQdoM0UTElLk
         4JXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WEX9+sqg9KeVky/NcPkirTK8PMNoKH+/ZsoFca1T+0s=;
        fh=73n07gMJ95BR6X1yg83bXZRJqgVN9Vk2euLbWHsy+V4=;
        b=DPstxH/dD/diVBjxXthR0RKpoSq2vAy44HQlwl/3ttzlSBN7LEXels9wcRL33D34il
         FbIPkO+yI+OR/Hb6NhypX9RXUcsDuGBLSFuUGUwLmzWg6UPpJtrfjVfprTDXxVhMV6+6
         qR2Cq4cHoV+me9vLOrlhPl4Gs+t0Hv26RW+VH0wPwpAljMvM/HZZuq34un7c8dAvqqhF
         72Fp77j1k5uBZAhZ6Px5cltkpUUnTZr7WYoNicozOCWu4FH/nKBT+QvnV7TzBtjHxynB
         e9Q0QyE7vVuW8wzbQCec9wS5zWWiLnsUdfCIUZf/LT/I+hzw2Ls+Ab+29fC/h2dhc9sR
         z/sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793039543; x=1793644343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WEX9+sqg9KeVky/NcPkirTK8PMNoKH+/ZsoFca1T+0s=;
        b=nFlKpNNNs+M8NXXCCZiaK2V85D/zRSjrKNbX5mRXExdk8mMy3jEhTxV/DbvE3kHVld
         GUT1wSx+EC2Xb3ParLzCQnoNRNnX8eimPBgMA4dwJHn9RnAAPHcJOiUZlnUQ3F/cctf6
         MZJ/rnaPQrEyElT+jNkareOG8NoEbM1Gr8Lskgquk889E4SNNiIIZDO6YIL+c8m/bThT
         tNcQOv5/777NeBm8yoB4bFmjc3xr2VRMtx8gXmc9vymM1PvIj+yp5ENSDLtqYpw9Yxu8
         9foFP2ylI/caEC3OtC9+8P1jYygicqc7O/PfKfI55FKs10kMQs05m+f8KNGLmzyzTRc7
         GSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039543; x=1793644343;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WEX9+sqg9KeVky/NcPkirTK8PMNoKH+/ZsoFca1T+0s=;
        b=MGOZhlSkznEj2TLEOynQGHNjSU0FUGsJ9B8Qnrfjmtdyjcrf2BLYXAhn2p4EK2xz0f
         tHHaoUxJ33VfFaafBUIUKWAjp5Gv0iXLHlvwDB0k6jLojXktJkep1IF6VCeEwNRbMPTH
         x6GmmjPfNGli+Yxuk3iDAR44AW+YIfEYdh4taXxt5Zpt/PJs6a0nnSA1NWVyMSSN8OkD
         t/hTYjSQpxTnvy+8iI8M3q9PUU0O55cb1QaDSiESMQXAcht18x+raBqhX18q4jsStJ+H
         NrbAOUgAbopebTr4Vwi52u/SSvCmc3Z+yJxwBrfQoLYjsg6stjtYJtHTvmTLeFuhd2Yx
         mahA==
X-Forwarded-Encrypted: i=1; AKwUvBy8ri2ayazaUMnr1FjUKIvkfx/1pKCQyMmcXOThkYZP7TbBeG8FJEH3zy5qKR1KMkjPSWX44R9Qzt/qCqM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOF+Gkiqm9GxbC9dCdhkTp5yTZMwYIMEZ2H5icG9fSMB/3kJHz
	6eH9o8b7jkC4mfLKqR3lEfEOKxL/xTSs9zLm9pgz5vVa7ydoKuA1jGdy7JxugAW20ly23be1D1V
	B+1GBMNknDcrEYfqM2vm9EbEvNo4WhDg=
X-Gm-Gg: AYBFou0NglWRqwuKTlT6Shtv1HT7lLSfjp4kdmITW47tagoXWGbPciRHe2d85FBBlK2
	disN8ANxgCi7qN5ujU+xU+uEoyK1YUFjgaCMaXjZPqOQNcIlhOwkqh/nkgKCCxl0i+AhxneDEYx
	ye7CpV+uuS5aFK3KL/d1S1tYG/c9aTOuCA6fgvvu751mUhaedINaChRbu+7lX2l4r/8ny8sCwJh
	JrYj8bo0MGCf07IF0dZ6IqSzL9Q7hMSeuMie+eS9Xa5vnlREsGUj1RKhOBK/8Th3g6kY9SbZgPo
	i1MYDEXbDhjDNOXQxDZP6vJZvGLyKUvmX9M3GRpyoJ2w0xkGPGJhuz/12TLEI6rsBr4XcUv420V
	31W/TZlLjh6RcbRJFwOF/4gCMZRS8iSV2ZINrtZ9dCwb4vhjnr65C00i+vMRs3+OVqoSCmQI5K5
	GbT8iutVLtlZoG4SII/T8VeCHkIeIJLzkLpsepc8wOpAnpvFjBoyc4
X-Received: by 2002:a05:600c:4e87:b0:4a1:a2c0:7b73 with SMTP id
 5b1f17b1804b1-4a35acaa6c3mr145207195e9.30.1793039543135; Mon, 26 Oct 2026
 11:32:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-fixes_shmem-v1-0-703206d5fa0c@kernel.org> <20261026-fixes_shmem-v1-6-703206d5fa0c@kernel.org>
In-Reply-To: <20261026-fixes_shmem-v1-6-703206d5fa0c@kernel.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 26 Oct 2026 11:32:10 -0700
X-Gm-Features: AclHuK_E_LaW5XNIuZY1k1mQOjBZJvvQ1cVrvsfMHmbvxMe_yR0Z_CAYp1s13eU
Message-ID: <CAKEwX=NJfyZMgC1trXKnr3G_PMau+j5wqMxBty6QtHCyMdmYrg@mail.gmail.com>
Subject: Re: [PATCH 06/16] mm/shmem: hold off eviction in shmem_writeout()
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Gregory Price <gourry@gourry.net>, 
	Zi Yan <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Vladimir Davydov <vdavydov.dev@gmail.com>, Michal Hocko <mhocko@suse.com>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Lukas Czerner <lczerner@redhat.com>, Carlos Maiolino <cmaiolino@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Daniel Verkamp <dverkamp@chromium.org>, Jeff Xu <jeffxu@google.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	David Stevens <stevensd@chromium.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	William Kucharski <william.kucharski@oracle.com>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 2:41=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> From: Josef Bacik <josef@toxicpanda.com>
>
> Once shmem_writeout() has moved the folio from the page cache to the
> swap cache, the folio lock no longer keeps the inode alive: truncation
> and eviction find a swap entry, free it and do not wait for anybody.
> That did not matter as long as swap_writeout() was the last thing the
> function did.  But since it puts the folio back when swap_writeout()
> returns AOP_WRITEPAGE_ACTIVATE, it uses the mapping and the inode
> afterwards:
>
>   reclaim                               last close of an unlinked file
>   shmem_writeout()
>     shmem_delete_from_page_cache()
>     swap_writeout()
>       zswap_store() fails               shmem_evict_inode()
>       writeback is disabled               shmem_truncate_range()
>       return AOP_WRITEPAGE_ACTIVATE         shmem_free_swap()
>                                         destroy_inode()
>                                         ... RCU grace period, freed
>     shmem_add_to_page_cache(mapping)
>       xas_lock_irq()            <- use after free

Yikes on a bike yeah I think this race is definitely possible. Good catch.

>
> swap_writeout() behaves that way if zswap is enabled, cannot take the
> folio and the memcg or one of its ancestors has memory.zswap.writeback
> set to 0.

Acked. It just takes some incompressible pages to trigger this with
memory.zswap.writeback=3D0.

>
> shmem_unuse() already added infrastructure to deal with that.
> Reuse info->stop_eviction to protect the inode during writeout. Increment
> it before removing the folio from the page cache, and decrement it after
> swap_writeout() and any attempted reinsertion and inode accounting.
> In shmem_evict_inode(), wait for the counter to reach zero even if
> swapoff has already removed the inode from the swap list. Add some helper=
s
> to make the code easier to digest.
>
> Fix generated by an LLM and sent by Josef Bacik in private.
>
> Fixes: 6344a6d9ce13 ("mm/shmem: writeout free swap if swap_writeout() rea=
ctivates")
> Cc: stable@vger.kernel.org
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> [ david: code cleanups; improve description ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM from (z)swap perspective.

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
