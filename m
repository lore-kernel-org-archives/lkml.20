Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792682869;
	b=sDv9JeLJQCdY6XodCpRQdqxrpj2LPxIeL8rrav6w98QrjZxkRNoh8at4MwzPMn1j93pC
	 1osVQsxIg6Q2ELxbr81mukcSDIK7xh7s7Bb3mPdx8wl2/aNYg0fKZPYBhN+FvRxVCliDd
	 YbH99OzTs1ENkKfW4doePh2EnuDc6CEbeXlHPn6wrbbSFjlICTYekqzIpf9HAlcFMB0Of
	 FLodFEI9AES4iW0xL3sNXMMAs+R9Iq9UPscma4jf7MUZn7yuICSFpbvNQYEB3/0Hen48Z
	 NEa/9LInJDBBFdVNSWI4yGejlIjWunYHOe1H3ux7xUrUQ0EB+FElcEJHJGlpI5ZYvzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6Hxj+A00cR7R2uHGcUSbmEOS3DLzDMNRKc/7icWTlNI=;
	b=DFJ4hJk0WNv3J/PuL1+4fo7Z0oTsRqXXlF0GKZni/rI9Ba2e2yi5mfgtShCiYp6orL0Y
	 7xIUvdhmReR+fQkS/ZrUgBx6HKdSyNqKEP2Bct4I2nAIjOEZw5ZPoQ6Sq9Hu34aaBtULU
	 dZCpq7Pwwg8IMQd/0krafiSdSfnh7KKOU5LxrI84Kxx/XnnbzXv5VD+JSGc+1xdROlxfk
	 HlCqL71OUSYHC/Cf3ZVBagy+nnGJqBFZbVUPymT8tKPb/TYBd06Z7lmOYNA6iBU1wdDEo
	 ppeGKdvnWpU+l33At8Hws18x36I3vkoBmtQyoNWhM4IItQQjDwFGjynbNDJF3Hni2yQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sAdHnZEF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3A7606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B3A7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sAdHnZEF
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso283508666b.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:27:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792682867; cv=none;
        d=google.com; s=arc-20260327;
        b=adZ6UD4mjB360+oOxPQG2eM+g6VSF4CKff0XkNzSq/2S2mGzLZ6m3I+BlTTFxHyiu4
         KPFm4S5LoyLO2PmABaimxhoUI3zYakvhbwPp8uMWnQ8fEsUetcpt7PCPc3gyvz+uCLMA
         gnoFlBz5iCVbVGGgLUDguFSPUjlbjIw6qteSm3YKJehdviN1Eqd7Z63HeqkPFh6ar6F+
         QAczGwE1vqFpfGSbJra/13lqkeb8CmUoGlBLJGMmjDrHpZqGzGYy9SVYLOz3QV3K+BgI
         Tmcxp5A+LMrFpC+27Eo6zjSC2FdszuC+spu/y+5RnGNIFHUEAapxLIZRmjVFivUEYiMj
         b7Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Hxj+A00cR7R2uHGcUSbmEOS3DLzDMNRKc/7icWTlNI=;
        fh=gTPfr5ye3KXS6GVnRq9gtTxeAex1GwBAnQZ8/kB6lsY=;
        b=LWJHbruiSq1a3GYnifV5t02jD6PgnJINrtNAcHsFbgMd7eUqMy5p7aKQWGbM4ZAWLb
         XeFruiofdUCyuqd8eUtiFDasOOtPQwsEeVLOn8k3QE2XKEM3vBubIcKQArKwI/uCXuQl
         oEiS/nvgW6ms4JGl1AM9DGnC7YT59KO2LWBfsTacNP+N02ygt8oF+FqhiBJrFVJbCg2O
         guTckibzIo0rcNi0q2zyFe5tVgdY6fR4MwmzyGm5iqGsBQT/ofbFkYuwwVRr1p/E8y3C
         L01sywTlBovCRho6fbT/9+eIHo1g9OyCUkIjJwu+QFHkbWDPUAsNUP9PcFWRRx78d52/
         yDzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792682867; x=1793287667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Hxj+A00cR7R2uHGcUSbmEOS3DLzDMNRKc/7icWTlNI=;
        b=sAdHnZEFcLSnbvOXqRxSdGy8GBuUppoR8hbdUqS804HFINcd/NKxUWsquAwE7S+khF
         VayivuNMsH6R8Ubv8fzPB3CLT5Zzzq3V/Yq5sZKty5AtOQJ37PPbkwD43X162radeM8l
         CqbxTYvqC7tBG7KWc5LKQiIw3ebhURGtyqK3MtaAklp8dy07pwvR1e0h7hxgykudhLj0
         u0r4a1Zv8+Mqwl3R7ayDlbVBg/6ji5MZPuAzT50kJPEMi6P56VVcJ/SnHH8zJjOEZtOU
         Cst1ntRipu02d/U2jiETXjJOYr0z/Tvc106U4KgrwYx0wk33FI00OXjObZiDlvucVzxg
         qqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792682867; x=1793287667;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Hxj+A00cR7R2uHGcUSbmEOS3DLzDMNRKc/7icWTlNI=;
        b=wkQizDbSx7RPCITZ9RT55fukHPyQgKTqgQCY2Y+cBoIco9DLDtMmDMfNg8miGs9O8e
         QMVHYmICkImGM1M+qCxxyyu6bw50eqo2LbjuklpcGNY+5Obfxx8+vQQTHN2H3oow3L2C
         ypYVH0HSSZXPVKSm7QAtOhulBUaO+gPnsw38HLE58SAL5oczKUR599U/DjxySbkAO4UA
         oHVX57/Sb7PeaLKGRgYZnxf8CTAv8P4iJRt5o9rNrtxTgFk4MhdNeFID6r0us/lZr8AE
         SdFNoomqmIqkvyNXBJKCobRcjrHy2ty680DeEn639VRmD+lPKseYzFgGQnfWeve4bjtN
         W3sA==
X-Forwarded-Encrypted: i=1; AKwUvByMGnE007yUKvbjPimJQSQG4xPo3HKNTlSCwew7b5t30PGdb421sC8iBjclunmHhfUD1KaiytiRrN7pVDs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKi3Lnwcqj1ZVxzXxpl4yhDrzm3yF1uo3C3bjxC5CYPmv+ZAnhX
	Zc9VnRD8iNnsnhgc2g/7TdtcRcRNqjIqdmNgQPJpW7rVGToLqVZ4i3KdfE0rPzVqrMfNB3HC5eL
	9oYqXo12Xlk+7cGWD5uY27Z/FiYXwRWw=
X-Gm-Gg: AYBFou16zvhzSpkVqbxqpVuyWzZvRN6VKwlVVkVTwaDRvZ47vhHsPtabMQ1rjjYEVnk
	c2YX0SxLJiT/zzc2ILwLbMwxVeTnDIMB+jzK8jUoSKSkjuVAkd84Xp6RQDNndnlCaMciQnaFgsQ
	fxASh9gk8nmrKzJipd/fE8LKwA5NdVFDJ8eUDe4RtWIj+ZXp3Cd+85YTNYhVdwblL171mvk26Qq
	ClNsq8Ki0CyPLqTeE65b0Zj/CTd/Ki6MmfrTBvpp/NA1niiwZF+NHBzHCWRCjE70ImCzUck5nui
	BwDdgAsgb77wXrbwx6NrFpkJlnstK2Q1zv//AHXM13ivDy7VCszSKIMWBNptwuiVSI1DHxKFPLw
	EfOWrzhfKjJBR5HGm5N4e/4cXO+vxv0iWw2znjnj0OP8GbZhtbFVgAeQx82vRRcXntPtJtw==
X-Received: by 2002:a17:907:96a0:b0:c2a:fcb7:62f2 with SMTP id
 a640c23a62f3a-c46795d8b8amr616802066b.19.1792682866675; Thu, 22 Oct 2026
 08:27:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022145615.2184343-1-alex@ghiti.fr>
In-Reply-To: <20261022145615.2184343-1-alex@ghiti.fr>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 22 Oct 2026 23:27:10 +0800
X-Gm-Features: AclHuK-fIBBaSiERuV8G5LHCXzXK7ovXYByOu5sY2WraRLkDWuK_sndSlfwYbXI
Message-ID: <CAMgjq7AB4wUzmugV3n4mhWcYqMKmhoZJCDV2uUagFjZXjUUi3A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] mm/swap: keep reclaim batches contiguous on swap
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Andrew Morton <akpm@linux-foundation.org>, Barry Song <baohua@kernel.org>, 
	Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 11:00=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr> wr=
ote:
>
> 7.3 regressed swap I/O: for the same swap volume, a workload that
> rewrites swapped out memory sends many more requests to the device.
> mysql/sysbench in a 256M memcg swapping to an NVMe partition, 7.3
> compared to the previous version:
>
>   device read requests per transaction        +59%
>   device write requests per transaction       +27%
>   throughput, iocost off                      no change
>   throughput, iocost on                       -19%
>
> Two commits interact:
>
> - Commit 9a42aed48421 ("mm, swap: prefer nonfull over free clusters"),
>   in 6.18, makes order-0 allocations fill nonfull clusters before
>   taking a free one.
>
> - Commit 3cedb745d354 ("mm: clarify the folio_free_swap() for
>   do_swap_page()"), in 7.3, frees the swap slot on an exclusive write
>   fault. 7.0 to 7.2 kept the slot, but only as a side effect of commit
>   4b34f1d82c65 ("mm, swap: free the swap cache after folio is
>   mapped").
>
> The freed slots leave holes in full clusters, which then go back on
> the nonfull list. Reclaim allocates slots one folio at a time and
> merges the writes afterwards, so a batch of LRU-adjacent folios gets
> scattered over those holes and is written with many small requests.
> Readahead later finds those pages scattered as well, and needs more
> read requests to bring them back.
>
> I tried three fixes, which perform similarly:
>
> A. Revert 3cedb745d354. This keeps the slot on write fault, but undoes
>    the intent of that commit and keeps swap space pinned under dirty
>    pages.
>
> B. Below 50% swap usage, make order-0 allocations take a free cluster
>    before a nonfull one. This is what the allocator already does, at
>    any usage, on swap devices with discard enabled (swapon
>    --discard=3Dpages). It is about five lines, but the threshold is
>    arbitrary, it stops working as swap fills up, and it applies to
>    every order-0 allocation, using up the free clusters that
>    nonfull-first keeps for mTHP.

Hi Alexandre,

That's a interesting problem. I think the real problem is with commit
9a42aed48421 ("mm, swap: prefer nonfull over free clusters"), right?

It's more like a balance between fragmentation and contiguity of small
order allocation issue.

Perhaps we should instead always scan the full clusters and revert
that one commit? That commit was only following the idea of keeping
the allocation more compacted for that series, it looked good at that
time. Since fragmentation issues can be solved in other ways,
contiguity seems to matter more for large physical swap devices.
