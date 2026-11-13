Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538257;
	b=bOKeFw2jmvdwrYCB+3RwxSHyTBB3JEprXL24gW6fN/FOKcEIHGi+JNMCUKiueHHwvQpS
	 d+pOMikj7DlnF2mFtzDIs46dwyuwDmWPDv4C8GFwuBNJkVTRz8Lekw/cuDvYiGJ1KmNmJ
	 gvFxDRG4xEPkWZuR8wqYJoEFCHg+TtDh/WOw3CLbzAJzGXcT5PpnhCTo11zBXz/mE8l1r
	 IzG35cFmauJ3yNkmj0k3J+Tcp2XHVBV/uhsFjpeUe6yvg5qo/X0RgfCekp0jOJcnCiz03
	 LY2YH0oFYEArhOjBxOT24OLjtK4m7F8Q6DOMYRlZuV7oDlhkPZd4mugWm1twBHY+Zzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538257;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=mVe5HwVBkXjfHvoljda/mJvecIfGagV1bTDZ+w25zss=;
	b=zAOhJefmkwE9Va/K2X3vxru61VvxvUeeNs8n37R5k2pCy0J0qbCzMUQPE50NBdc24Kyd
	 fjzNC9AHHjtlMuN6dMTo10lsaJxcphgqIb/tfmwWaUbF1z9tD19IsdvADwjgT+GF8+Stn
	 30xlUKy33m/eQa1dTo19fQQb618DkUiTfbNb2QLm4IpvE5kx+Ib5XvZpL3SrUXVGwOH5a
	 rhb0ZXAKH0dgi2FoQlL1gtmMFIQ5K6wr+9Xke9LhpNXeFYzuS+2usFFx10ubArOvnyuo2
	 SUofL5BORGnU6VoInRIl8k0ysErVhhMdNGfo6ofJ3MHYKbngIQYeHb5phn25wblI6rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=E6sSJsVs;
	arc=none smtp.remote-ip=115.124.30.132
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5E4606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A5E4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=E6sSJsVs
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794538253; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=mVe5HwVBkXjfHvoljda/mJvecIfGagV1bTDZ+w25zss=;
	b=E6sSJsVsEaCjwvnsQikzMaUEUv/36jSyAoGGqiZSCCxOte7j9oVLLsGbJZ/gaMLFeT5nY0Wf0u9MtzybAllv1xT5ip1U6KBnRcclvHka/p2yyk6YH76opVFWC8940oT9z7jCQLgrB1QGjz7yr6lhSA+8iTSshPrKKNosk1/jOPM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0XEdfmiI_1794538251;
Received: from 30.74.144.124(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEdfmiI_1794538251 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 13 Nov 2026 10:50:52 +0800
Message-ID: <a72af87a-0f10-4717-9d50-2d3480c32caf@linux.alibaba.com>
Date: Fri, 13 Nov 2026 10:50:51 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/mglru: yield the lru_lock earlier in
 fill/drain_evictable()
To: Hui Zhu <hui.zhu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Hui Zhu <zhuhui@kylinos.cn>
References: <20261113020132.274013-1-hui.zhu@linux.dev>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261113020132.274013-1-hui.zhu@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/13/26 10:01 AM, Hui Zhu wrote:
> From: Hui Zhu <zhuhui@kylinos.cn>
> 
> lru_gen_change_state() migrates folios in batches of up to
> MAX_LRU_BATCH (4096) folios under lruvec_lock_irq().  A full batch
> keeps local interrupts off for up to about a millisecond, and CPUs
> contending for the same lru_lock spin with interrupts disabled for
> that long.
> 
> The caller already reschedules between batches, but a batch itself
> only ends after 4096 folios.  Stop it early when a resched is
> pending, or when the lock has waiters and the current hold has moved
> at least MIN_LRU_BATCH folios; the caller restarts where it left off.
> TIF_NEED_RESCHED can still be set with interrupts off: a remote
> resched_curr() sets it directly in the target's thread_info.  The
> minimum batch avoids lock bouncing under sustained contention, while
> a waiter now waits ~15us instead of ~1ms.
> 
> This follows lru_gen_look_around() in this file, security/keys/gc.c
> and jbd2_log_do_checkpoint(), and commit 6e9be217a3ce ("mm/mglru:
> use a smaller batch for reclaim").
> 
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> ---
> Changlog:
> v2:
> Also yield on lock contention after a minimum batch (Kairui Song).
> 
>   mm/vmscan.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 6a1af9b92349..c1231925159f 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -5533,7 +5533,10 @@ static bool fill_evictable(struct lruvec *lruvec)
>   			success = lru_gen_add_folio(lruvec, folio, !active);
>   			VM_WARN_ON_ONCE(!success);
>   
> -			if (!--remaining)
> +			/* stop early to shorten the irq-off section */
> +			if (!--remaining || need_resched() ||
> +			    (MAX_LRU_BATCH - remaining >= MIN_LRU_BATCH &&
> +			     spin_is_contended(&lruvec->lru_lock)))
>   				return false;

IIUC, Kairui's point[1] is to just drop the 'MAX_LRU_BATCH - remaining 
 >= MIN_LRU_BATCH' condition, no?

if (!--remaining || need_resched() || spin_is_contended(&lruvec->lru_lock))

[1] 
https://lore.kernel.org/all/CAMgjq7CUMuNSdCXZ7_kDdo9+0BFvPNHuO=mq=ct_Q5YUyyckvQ@mail.gmail.com/
