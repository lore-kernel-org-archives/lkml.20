Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814179;
	b=4CRmdaNluZYVTicIq8VDhuSPvftkp9XYsdmyCTSgv7iAdiQBl66RtE7IkMTLER5f0YQB
	 rjIr1UyVauuvXuc7Ndb/LLiPhg6cfOmonsLSC3uhsVmODvCHvs2N+NwW4LfjaH/Snao8+
	 YsrlCnKp+oE7Zaz6ZFV/USVK15RPXo2trZvNe/KqrNX1RI6y+sHoUGKRBJFzXErb2OcsE
	 yu39qDSHSinmghNd4Ed5aPgsK2vNf50twe93RlETwrbIVAgr1sFajur/CmdiB506I2RPA
	 nIIUVENpvDj3TZDh5G5L7c6yyywFmVNFra67Jm+vWbzhQPBqg8X0gJM6ubnIhkHK+xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814179;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=gslwsSOHnTDJQMthG4yS+2Lt6ZuxgQnoAJ6oPGnvEDc=;
	b=0fkR5x7+3PXxnpXHaIDrnptlp3EWnPrjJd/AgYY/NxizkVyrskAFvfgzo3otp/qcN096
	 zRcFs2Dz/f+BoczA7uk6tqBs9oF3BOu5UzwAW0GYN/uJvy68bX9z3XVQUT5hQWEtGOv6o
	 edl0fdSvs8u2QndVLUPuoORgJWR+yOLA8hPus8yVfy9MlGeCubJNW/K1tk22FQMAU3BVs
	 LiPvBuJMCADWQ7o9FGhjDCKL6kYkf+sETct1Ac+saleSfA3oVATRL1vtFwDfLwzuxsy2L
	 KlpGVlyW8ISiyJYePQvsToUV0wjJ3HP9Oti3yo3ckmbj6Qd1F5jmM547XgSeUdFUfQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=eHxVv26i;
	arc=none smtp.remote-ip=115.124.30.112
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1FE606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF1FE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=eHxVv26i
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794814167; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=gslwsSOHnTDJQMthG4yS+2Lt6ZuxgQnoAJ6oPGnvEDc=;
	b=eHxVv26iNdbWkQC5Cr4DnOTiL5jWxECShMBsDeTeh24szj0mhUZ7jOh7c99pSrILBqa7yafzGO9JoH1EKS7niUaO2CgPegCfqo37GHf3VeXSzRoyt2uCN0HRxkPGeW2j6IwTdYMFKafiVbB+JRUebcSua1prSCnQRuiScek2WuY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R451e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0XEnonjq_1794814165;
Received: from 30.74.144.137(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEnonjq_1794814165 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 16 Nov 2026 15:29:26 +0800
Message-ID: <b6449fe5-a697-4fa4-8985-fff2e0b0ed76@linux.alibaba.com>
Date: Mon, 16 Nov 2026 15:29:24 +0800
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
Subject: Re: [PATCH v3] mm/mglru: use a smaller batch in
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
References: <20261116061158.333826-1-hui.zhu@linux.dev>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261116061158.333826-1-hui.zhu@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/16/26 2:11 PM, Hui Zhu wrote:
> From: Hui Zhu <zhuhui@kylinos.cn>
> 
> lru_gen_change_state() migrates folios in batches of up to
> MAX_LRU_BATCH (4096) folios under lruvec_lock_irq().  A full batch
> keeps local interrupts off for up to about a millisecond, and CPUs
> contending for the same lru_lock spin with interrupts disabled for
> that long.
> 
> The caller already drops the lock and reschedules between batches,
> and the restart protocol does not depend on the batch size: both
> functions make monotone progress, so a smaller batch only shortens
> the irq-off section.  Use MIN_LRU_BATCH (64) instead, bounding it to
> about 15us.  This is a cold path that runs once per kill-switch
> toggle; the extra unlock/resched/relock round trips cost a few
> percent of wall time on an otherwise idle machine.
> 
> Same change as commit 6e9be217a3ce ("mm/mglru: use a smaller batch
> for reclaim") made for try_to_shrink_lruvec().
> 
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> ---

I'm fine if the small change can fix your issue in this cold path. Let's 
also see others' input. Feel free to add:
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
