Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794298488;
	b=vAlVzYHnRnKFOftdDZheYdWRlRX2AY5GS07I2xmy6gmv0Vo9M6v0C05R11o+MNZJkqHH
	 gBfOwQAPRLT0c11jCkJyarsF3TU9kkfau5t4GHa3IYSrarwPKm3IChKoHtawQkIIbsl7I
	 MVD8m2r70k6D4ocV1OVityLhSKCRaJysyVxKVXq5SMdeJjOcnaqPBlz2K9Htx+L3HQmsS
	 NKP/XAIkEbl3A9Av24cfWKm97+oi+t8cWVLdF/wGXD/2CMs7VDTe4blT/Y3s4uaiNG19c
	 udK1KyxOloneRzTIovPamBz6ePcOADNjqtPfUoYMuAOPsJ5pBClVgA33UWkNXO+6HvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298488;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=hmo/fMBoxFe2B+JRVAByPcYqXixmz6jFWpSPY6BPjaQ=;
	b=CNAsTRiHvhBo2cBapoUYO9INubdx4pg2AH6OTk2k4ml7+iELDh44gip+gYr0XXq3PrST
	 JphipppZS9czjxPFJW34aXOGk7oJSsimDkS31qMa2uAuFtN6zk7LZhquCK+JDD7V78j/z
	 VMh7EscNnq6qS5lIxUETKDife9fDfza6IfZWlxa42wXxoVMjitm2wNq3abnDO1b8lqayG
	 1aIb8arzq6aK9y2nB0JlmOWL5RLiYs0cABDu6INR2C8QzkmWomG5MEfOUSG3e8L3FyTXH
	 iq/72nRnACcOoiYi7feNYnqpPG58ar22Lq2zKCJvicCyktQS1x9UnQrqiCWPLTcNwlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=dGcUTR7U;
	arc=fail smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AF5606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62AF5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=dGcUTR7U
Received: from pps.filterd (m0528006.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7mfLQ4008538
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:14:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=hmo/fMBoxFe2B+JRVAByPcYqXixmz6jFWpSPY
	6BPjaQ=; b=dGcUTR7UegpYPr9sVQe8CKL09HPfRUWuwOKN1c57nl9yHNTzja6AY
	PiLQvqKh0JX8heGiX9XTY4GiJQZAxurl7p55D8IsGc18b9/4GOsNu1VRmbyPQeIU
	MOX43WOlhuNbF8IGA5ioOMSvnFn/NJYsw0ILMAVwPrVH7r7N/87kupsbnHnwV1w7
	eXd02F0kXQAhBrknLfhu0WSy6os+Fi6e+liGq97G8k8BpcwOSiiPZlrg7QRwAC0X
	BLhxR2xEfu3sl6Jj73oFwLCaAppx6iU1j8yHAKGbR+TKF8x647SVZPya27pNjMkd
	VryipeLzK+F4Aw/iaIKxVs1rRkHJohnmg==
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4htngpcw4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:14:45 -0800 (PST)
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6b6723180baso1947594a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:14:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794298484; cv=none;
        d=google.com; s=arc-20260327;
        b=Dr11PKhhCj2lwqit2Bil0U4/+V8Kt74k8dw66toAyZgqrp2OAIQJUD8hE59XHjf8RT
         I5/SeFI594nYRHryHUhc/ABgxSdyOzChkADIxZgK6ZljTuhq95TicH5UovNxCCMGzN4z
         OFJXoFL89UxkAFxymEvl+Bv9nFHj5ppsJTn1bBZ20USsvLNE4/zmsXLxAJA5hNK6CbqE
         lUyTWrM6n1cj7ObMc3RMfFWELp8O9pQmcqDjQRz0jnS93gZkebCmxgqZAQjGTaWG/phI
         aeJ1IKruwaTox2t+XdHONhmtffoW3lSaAC86UgWrg7qkXSg2LiAioB2G+P2UQ5CGNH70
         q1pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=gyLzlpGhZg8sniTvoRBctNU6s13Fevfb6cYKwRM4x2M=;
        fh=V7a/8YpHm1JfixTez4Dt52XjYi1faHDevg+lN2hncIQ=;
        b=o4o9O5DyjqR01zNpGtOqGBdeqYqnyCv7yTS1iL0+0/dPYo3SX3jwrHI4kEEcba6REm
         LF1oPisCrqqUCo8qz2fACQQjjs3gHg+o/yAZrZgWrn5D9doyNzuCpcntf2poUjp+XhZN
         5QMRlL0I6r5UEi7iUtBbql8NHgNK5lv9mWFPZ6RBDAMTkeOiGJgOp4WmOwN62N3caKdK
         EWrTcb524yVFxLGq8EZyuDF0kXQz3Ep+sLVDxZP4DSwb7pOaU63dyJ71FgH3BCsH0jtJ
         6x1AtA/Usj9MdByx0TdxIWOfSKM37h3hL1xD7RFZRNf0IiDRIE0z63A4YAVCXnh3Z8f5
         K3Kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298484; x=1794903284;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyLzlpGhZg8sniTvoRBctNU6s13Fevfb6cYKwRM4x2M=;
        b=dMsr9/s1N8iZBCUAOcjyRxuqwkv/HRAnFJpNQO/SAR1dFrszTZQht2M8Dai83AKeDY
         Tl0ZyHRzD38jIxLKHnLQ/29Asag4jxYLCElqKRjB84FrT48rZ5J5vF22YATlfncgaNiZ
         gfAiENUXORFZ5GXynwuP5GTzUGpeqeciwjClt8+CJYIaZujgExzAoGfLsKjbi2kzpY5W
         R2ddSiWj/L/afoqwm+4p9QUEm0NPQPARjLgvudSyq6BidTjZXKGO4ICFS5bt4BKVfLwM
         xbKaDQ/PAHEbznGuuyy4z+Fm/iBGm8HFgEKuVAyVTRDge6C8Jn5d6L14kMRoA/VMUw03
         MPaQ==
X-Forwarded-Encrypted: i=1; AL+hErFbb4DD16J1V6yrXmW7yflZ9zTcvxYo1DGXLxTSsW0Z5gD0fbxEf5nEyL7015mVObyACEA2BobX1wO1nvo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0uEIDU/7rq9A6noesW52BhdaG/8gey+ocPFtEGXO6dLQ1gQ0/
	mYDJqEXGf7l1w8wCZseVPmth0nasBvG7Gc7/kqt2oU0wjlcaSazeeZoq8ixdPzzSfsHexVUA8Tl
	w33x4FKamVqCQVtYtwbOyP3TueGCMo7seZp5DSNplRr9vvVYDarlv6sfio1pH+xfQ8iyGgJg49O
	HWfmo6ygFuF2UyQ8q3yNRgfKYh3kpLsW5E3nZbgcY=
X-Gm-Gg: AYBFou32Fv6yNU8WGjBXr77f4KDai9BGZfiGWMM6XjNJYYJikLa8IzXVH/lE+K3bqA/
	WigEPPhtELUEA760SdJ1kuUyQ1X1vRS5qRVE3cFH8pdf+hOyD85Mt5L79WPpUOCOn+mjs+ZmQUq
	NcTndpj148dsnplS+TWq3ml7xjxLb2l0NDjvtt1Hb2w7nsZEX8xUpw8ys+MQ==
X-Received: by 2002:a05:6402:13d4:b0:6b7:182c:5d4e with SMTP id 4fb4d7f45d1cf-6b755e6c44cmr1698848a12.5.1794298484573;
        Tue, 10 Nov 2026 00:14:44 -0800 (PST)
X-Received: by 2002:a05:6402:13d4:b0:6b7:182c:5d4e with SMTP id
 4fb4d7f45d1cf-6b755e6c44cmr1698829a12.5.1794298484159; Tue, 10 Nov 2026
 00:14:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105155032.240457-1-alex@ghiti.fr> <20261105155032.240457-2-alex@ghiti.fr>
 <CAMgjq7DpCCiEK00Es7yU_i_wyf7NU4fFN7QFO_RptF9tGvPZWA@mail.gmail.com>
 <CAEmasaWMKsBSQ_LrewZc3f6a2u15WARAk25AKWjS4oFy8yciCA@mail.gmail.com> <20261109152415.f7bb160e4089a17f15c8f42c@linux-foundation.org>
In-Reply-To: <20261109152415.f7bb160e4089a17f15c8f42c@linux-foundation.org>
From: Alexandre Ghiti <alexghiti@meta.com>
Date: Tue, 10 Nov 2026 09:14:32 +0100
X-Gm-Features: AclHuK9bds7F579Pncn9eD6wNRwnqJv1dEZAt-NTPVDd9Qni3oFVl8sFmvkMi3Y
Message-ID: <CAEmasaWm9KvUrfN4JtaqoF2H8z_d+Vyf+vxNXLaJoLZT=xFTJg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mm, swap: only prefer nonfull clusters on
 synchronous devices
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kairui Song <ryncsn@gmail.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Barry Song <baohua@kernel.org>, Chris Li <chrisl@kernel.org>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>,
        Youngjun Park <youngjun.park@lge.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Hugh Dickins <hughd@google.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>,
        Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
        Lorenzo Stoakes <ljs@kernel.org>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: gyLUhl0STvLHFAQj-A33Ni-FBBfeVFQA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzMiBTYWx0ZWRfXwpy/chDLw14x
 d1lhlEcPsoa1CQ3mrk9puOEUFST3Xv7gr7Wq/oK7y15dkMHqePb1fQ3NsbwNR8FUSvz9RH7uMoR
 vt6WbsZBXZHUOk0Zo00qp9DQH7lnBLzLyeSTVwXTFLmigefHFLrMlyovOcEIkg5Zk7dvpFoQz23
 Ag6V5bC1TMSf2YjxofnlWj2EE59Kge4MKBsVzGwilreDgLOJTC2itYyZg+4VLlrk/YyZrQdA1Gt
 NQD0OaARuEdjgS9BjFPB5VLfwqLGdwUxYKmuuyh7sOBkA8PCtfm9ygsem08uSJ1dmYh0LP/KKOG
 Iy48kJ0vb1+kCTvse/DXHIXTWmacYR3oFgHIMnSMgMlwJbyMLEU++nYdKnJakHiw4AySRxLFvdO
 n8z8aCsHu9zqIWNu5zFHzEU+wP5khIK9Oz+aQoyVyfBnVwTq/yXHguM/TzPn4SF7BT1SLbeNX75
 iih8Lmprymc67gRp4NQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzMiBTYWx0ZWRfXzlyBEO+q9Ima
 kBI4gyDyKDvld3isiSfxts1Za8Y5mwpsNwevbASJGMsxQdu58XPCafXpCxjDkZKtP41vfSY9y4b
 QYuLmuSawpYcJf3WYGkP0gYjqUdOSbc=
X-Proofpoint-ORIG-GUID: gyLUhl0STvLHFAQj-A33Ni-FBBfeVFQA
X-Authority-Analysis: v=2.4 cv=D43SufRj c=1 sm=1 tr=0 ts=6af2d275 cx=c_pps
 a=Tczdrg5if7+wQeIJmxD/XA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=kkcUborcUVj0H7zxAXTl:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Z4Rwk6OoAAAA:8 a=VabnemYjAAAA:8
 a=GvQkQWPkAAAA:8 a=zye6zbfopLjCFlMnxIUA:9 a=QEXdDO2ut3YA:10
 a=1oAhN8tkTtOBK6_UvoHx:22 a=HkZW87K1Qel5hWWM3VKY:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01

Hi Andrew,

On Tue, Nov 10, 2026 at 12:24=E2=80=AFAM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> >
> On Mon, 9 Nov 2026 10:00:45 +0100 Alexandre Ghiti <alexghiti@meta.com> wr=
ote:
>
> > > The patch itself looks good to me.
> > >
> > > Acked-by: Kairui Song <kasong@tencent.com>
> >
> > Thanks,
>
> Thanks all.
>
> Please avoid single-patch patch series?  Present them as a unified
> singleton.

Sorry, won't do again.

>
> Here's what I ended up with.  Please check.
>
>
> From: Alexandre Ghiti <alex@ghiti.fr>
> Subject: mm, swap: only prefer nonfull clusters on synchronous devices
> Date: Mon, 09 Nov 2026 15:18:32 -0800
>
> Commit 9a42aed48421 ("mm, swap: prefer nonfull over free clusters") made
> the allocator fill nonfull clusters before taking free ones on swap
> devices without discard.  Commit 3cedb745d354 ("mm: clarify the
> folio_free_swap() for do_swap_page()") frees the swap slot on an exclusive
> write fault.  Such faults now leave holes in formerly full clusters,
> putting those clusters back on the nonfull list.  Reclaim allocates slots
> one folio at a time, scattering a batch across the holes instead of
> producing mergeable writes.  Later swapin can also require more read
> requests.
>
> On a mysql/sysbench workload in a 256 MiB memcg swapping to an NVMe
> partition, 7.3 compared with the previous version produced 59% more device
> read requests and 27% more write requests per transaction.  Throughput was
> unchanged without iocost and fell 19% with iocost.
>
> Prefer free clusters first on nonsynchronous devices, preserving
> contiguous swap slots for merging I/O.  Keep nonfull-first on synchronous
> devices such as zram: they do not merge I/O, and filling holes saves free
> clusters for large folios.  Keep free-cluster preference on discard
> devices to spread writes.
>
> In the same workload, v2 reduced read requests per transaction by 14% and
> write requests by 48% against its base kernel.  Throughput was unchanged
> without iocost and improved 33% with iocost.  The RFC's batch-aware
> allocator also improved this workload, but this policy needs no batch
> information from reclaim.  Reverting the slot-freeing change would keep
> swap space pinned under dirty pages; a proposed 50% swap-usage cutoff for
> free-cluster preference was arbitrary and would stop helping as swap
> filled.
>
> The 7.0 to 7.2 kernels retained the swap slot after a write fault as a
> side effect of 4b34f1d82c65 ("mm, swap: free the swap cache after folio is
> mapped").  The observed regression requires both 9a42aed48421 and
> 3cedb745d354; stable backports should target trees containing both.

That's fine by me!

Thanks,

Alex

>
> Link: https://lore.kernel.org/r/20261105155032.240457-1-alex@ghiti.fr
> Link: https://lore.kernel.org/r/20261105155032.240457-2-alex@ghiti.fr
> Link: https://lore.kernel.org/r/20261022145615.2184343-1-alex@ghiti.fr
> Link: https://lore.kernel.org/r/CAMgjq7BFbXEKEt9faj_rg5AStfLkpJ0j57EQOOJ+=
L3-w2xRvtg@mail.gmail.com
> Fixes: 9a42aed48421 ("mm, swap: prefer nonfull over free clusters")
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Suggested-by: Kairui Song <kasong@tencent.com>
> Acked-by: Kairui Song <kasong@tencent.com>
> Reviewed-by: Nhat Pham <nphamcs@gmail.com>
> Cc: <stable@vger.kernel.org>
> ---
>
>  mm/swapfile.c |   19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> --- a/mm/swapfile.c~mm-swap-only-prefer-nonfull-clusters-on-synchronous-d=
evices
> +++ a/mm/swapfile.c
> @@ -973,6 +973,17 @@ static bool __swap_cluster_alloc_entries
>         return true;
>  }
>
> +/*
> + * Prefer a new cluster over a nonfull one if the device needs discard, =
to
> + * spread out the writes, or if it is not synchronous, to keep the slots
> + * of a swapout batch contiguous so that its writes can be merged.
> + */
> +static bool swap_prefer_free_cluster(struct swap_info_struct *si)
> +{
> +       return (si->flags & SWP_PAGE_DISCARD) ||
> +              !(si->flags & SWP_SYNCHRONOUS_IO);
> +}
> +
>  /* Try use a new cluster for current CPU and allocate from it. */
>  static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
>                                             struct swap_cluster_info *ci,
> @@ -1143,11 +1154,7 @@ static unsigned long cluster_alloc_swap_
>         }
>
>  new_cluster:
> -       /*
> -        * If the device need discard, prefer new cluster over nonfull
> -        * to spread out the writes.
> -        */
> -       if (si->flags & SWP_PAGE_DISCARD) {
> +       if (swap_prefer_free_cluster(si)) {
>                 found =3D alloc_swap_scan_list(si, &si->free_clusters, fo=
lio, false);
>                 if (found)
>                         goto done;
> @@ -1159,7 +1166,7 @@ new_cluster:
>                         goto done;
>         }
>
> -       if (!(si->flags & SWP_PAGE_DISCARD)) {
> +       if (!swap_prefer_free_cluster(si)) {
>                 found =3D alloc_swap_scan_list(si, &si->free_clusters, fo=
lio, false);
>                 if (found)
>                         goto done;
> _
>
