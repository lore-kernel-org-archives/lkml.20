Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470949;
	b=m9espeysSskr713OAu7l7gPlFt37x4ocstL2reZUssv24dC/1+FfFeCaFS5x0Mx5X+6F
	 W9V4kuaFxEWwPR4oU3E2WSX2Ndv/YJGosJD1aCsLLDzK2f6s/ICBcmByLQyz2TWUCOzq0
	 0nZUklnrYnlZvI0u8l7QwGQzrxJOBlX+G+7O2b3vGAcPTVXuUwQOQsy0wUh8X9//jQSZC
	 GtrB5ARAoE/x9El9wT8C1eWsdVJG0qZjoK706u43cC9EU5zzLzKSZ0KYg6Kirb/slyiKz
	 GcnvsK98jK/pss1eD0IkoOAmH4x79pbh5YZkYSP7RPySm2yIc2OcSedHjF+gopI69fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=47XZdRfBE/Mu+f4vGfvNQyMttNaXDnZejEnBAd4jy8c=;
	b=Qc7serEBgZ2pRKX5KeoYyHBEm8rVMbGprL6pUV+KVq/jCgOPDSzN+LvU8r1Zk+gGa3kN
	 6qdieSK7NU53IOuKdlBdJoh86DBgyvK6BRSMq3U3rOKyEv1QiE0t6L01+maxYmckd3s/6
	 q6OJU2kOT7wruZLscim+cFGJSmHlV5Bw9/WmaVopXyo9Prst6rVAd4XdFQqXsqGL5SMkS
	 mMeJkkmnop8rOFnNivz1I1Yl1gA6GxhK+LgxlngLnzzzqSo6a4Wq/pDfNZ2PazKvTifUm
	 akC2Mrc12m20mjS2FsbwWzDTzRAzv4JN5CZMA+V1NzSq0VOXBFQb9etqrhuCRkn7/Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Qm49bMFd;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AB2606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1AB2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Qm49bMFd
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490f38e9688so480906f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794470947; x=1795075747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=47XZdRfBE/Mu+f4vGfvNQyMttNaXDnZejEnBAd4jy8c=;
        b=Qm49bMFdJZeItgDFcw85nhDVM41H98YKto99TiTod9qa6dUUe+S9NPfVRBSp4cTbVu
         U3tCsg3tlxam35oJ706aKfA/OhEgYKGjCwk6kDyKZ1OLzd22fR7rY3Tpk3NxUkPtKeTL
         V4YKZIMU1Cs6DpTZks7rrVDw6hXkxuTmubQGfSsQgVdm1/4WVZbTcL9d3KjJBbrQ823B
         PP8V15HPtN9nhPEijfJ2gjJGuCEDb3JKtFt3/5B3EgLI74KzJqmLz6Rw+FxLRrVOFdKz
         00729+98NTP3WvAWAcyH01/vj8z0FkTC/Ao62luV1kkjYDal9R7zPFS0oS3fBqkcSeMW
         lJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470947; x=1795075747;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=47XZdRfBE/Mu+f4vGfvNQyMttNaXDnZejEnBAd4jy8c=;
        b=EWbpKNsat6lqbcL678+zQgAq+eQ+je/a04E2P/O59ffyDFqvBYjlqdB27BuO5tlSwq
         RZ6MORdEFFKurIoebFyowA5Qf+XuYrWFJddu0hFzbfXSUpStY2vU2GMy3Z8m56e6Xe9r
         Ppidk39HZLK2yG+XoPjr9NgvxiButvc2WWaHOq8EeD68NiRzxCvaUpZc+4DitYG/cRCI
         keJdpq1wkxpI3caMcn8Zm0brgW8FuXFgYxGPNd0rm/XidjtQ1VgYJykbpy1iBfGIgXtu
         HnR7vb0Txp1JNCKrF0HProQ6JeDmJcdU2W9Cb0HkD0zqLaAnkuUX/hpOQglcHq9hW3Rg
         X+fQ==
X-Forwarded-Encrypted: i=1; AL+hErEmi8qFwedjSG+lkHZcsrNIE6TrHm+JmK+yqdVhjzptK/04H7G2nq42N7OwjrAZmKt8GOkQ9VDFy1uz42A=@vger.kernel.org
X-Gm-Message-State: APuU4Z84Jy/E61efbCafLkweKwYHuXqHTSPXuprQ9FIBR5d7MXMG4WZT
	aGOovH3sAqsui9E1vUgADGbF9+LIk3TFxFoVl0XL+RcWZoai1JVp+vswfO9EMhszN2+wWmROGV7
	43Pw9NOE=
X-Gm-Gg: AYBFou08aw188EFE7tNoj+oxSXwLvmgnjcF4Z1Q/xukXlAq4sdaNMd3u0abyCdBqljH
	wqH+M4jI/GyrDhci9wMzxeQMlygQ3hccBt3DrpmH1HkvfFd8k7ohhSkcst89tiErnTvmiER2x9M
	mBKSUGoDcXZXVpd6nlIlk3mjKD/aOuACcEQJakcPQHFW/Og93CJFa4d0AI+On0Ky4t/oXsrah/6
	y2t2DBmJcUTDdw74mm8vGOawOeneqMtmZzXpaGSBsUsO3MzoY2NyrPl1nsq5qNn+41xrarVxuhP
	EepyImNWIjxS8bdTEq4VpROe++HrYqrt2wXqjcrlri78PgSx4pY/jeCTKEDA06Z2qDc4SZyzvPs
	VtbC80uX7RcLAL+a289ZrlbEUfKCjvgBUgz3YFO0KSfLJW2Fj5LQ0TWfWZyUJ3xWbzPzCJPigMh
	/rwJpaZdzHaLxVuB93K/a9GvcaQa4ZRSjFstCuGQBdWkJKZKOSfLhpAS24sacNIuROqfjmxhXF3
	+b9E4g+3OC4NeWSpYuaHvTR6F1c/T87H6JrfKgaqBYNPKB91CBxbVpmq1cd5zGjxXqIDftvCGGt
	apu12lBTtBugwD0m6RejCJxIt0EqmQg4e3uamRgOf3o=
X-Received: by 2002:a05:6000:3cd:b0:492:aff5:da4d with SMTP id ffacd0b85a97d-49b01734c32mr3651482f8f.7.1794470947068;
        Thu, 12 Nov 2026 00:09:07 -0800 (PST)
Received: from localhost (109-81-94-245.rct.o2.cz. [109.81.94.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm15550414f8f.37.2026.11.12.00.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:09:06 -0800 (PST)
Date: Thu, 12 Nov 2026 09:09:05 +0100
From: Michal Hocko <mhocko@suse.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: Hui Zhu <hui.zhu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Subject: Re: [PATCH] mm/mglru: check need_resched() in fill/drain_evictable()
Message-ID: <avV0IbvSx4iuv0tF@tiehlicka>
References: <20261112075827.255602-1-hui.zhu@linux.dev>
 <avVx_1BEP7fIzGDK@KASONG-MC4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avVx_1BEP7fIzGDK@KASONG-MC4>

On Thu 12-11-26 16:03:54, Kairui Song wrote:
> On Thu, Nov 12, 2026 at 03:58:27PM +0800, Hui Zhu wrote:
> > From: Hui Zhu <zhuhui@kylinos.cn>
> > 
> > lru_gen_change_state() migrates folios in batches of up to
> > MAX_LRU_BATCH (4096) folios under lruvec_lock_irq().  A full batch
> > keeps local interrupts off for up to about a millisecond, and CPUs
> > contending for the same lru_lock spin with interrupts disabled for
> > that long.
> > 
> > The caller already reschedules between batches, but a batch itself
> > only ends after 4096 folios.  Stop it early when a resched is
> > pending; the caller restarts the migration where it left off.  A
> > remote resched_curr() sets TIF_NEED_RESCHED directly in the target's
> > thread_info, so the flag can still be set with interrupts off.
> > 
> > This follows walk_pud_range(), which already pairs need_resched()
> > with a MAX_LRU_BATCH cap, and commit 6e9be217a3ce ("mm/mglru: use a
> > smaller batch for reclaim").
> > 
> > Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> > ---
> >  mm/vmscan.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 6a1af9b92349..47f2cb25eb46 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -5533,7 +5533,8 @@ static bool fill_evictable(struct lruvec *lruvec)
> >  			success = lru_gen_add_folio(lruvec, folio, !active);
> >  			VM_WARN_ON_ONCE(!success);
> >  
> > -			if (!--remaining)
> > +			/* stop early to shorten the irq-off section */
> > +			if (!--remaining || need_resched())
> 
> Hi Hui,
> 
> I've been thinking about a different design, what if we just
> delete the `--remaining` check completely, and check
> spin_is_contended on the lruvec and need_resched()?
> 
> In the optimal case we don't need to keep lock/unlock the lruvec
> at all so this is faster. And it still avoids lock contention or
> blocked schedule, and it might be even more responsive as we are
> release the lock earlier on contention.

Wouldn't this result in too much lock bouncing in the end? Would it make
sense to reduce the batch instead?

-- 
Michal Hocko
SUSE Labs
