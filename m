Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794804648;
	b=u16Ocq5dmMdw7UbKCmKwgnIhEgwls2by7lQ3ZSPDGu+p3J3ivgJxQvA/Lr2JzMgTITLZ
	 3aq1/NIY5qA7ojUl3GyaKG5lAdrBGEiwbp51hcxA88DEr05MCKnSN0Wz/L3ltGV2MPfN0
	 677nLpgpRcXjGMV0oiHBj1XCZhTe28Jpw1W65854nLPQP36sejY4/8fqX3tAXu3DJ70/U
	 OTPaEjjpiaQl4Gl13v/IO+PJpaGvPJ9D20H2yM25DExTmG0ebuTwQKMHm14TyX25ZFNed
	 QBtmhfFn9PwRVPspsgCPqWmSAGcvHq2KrCa1k7AApeIFabqthDO2itTj/iWx2TW5o1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804648;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=x7rTvYMtAMvHRPS6DPYo2cQG6L/Be3uAnvxO8PNm0bs=;
	b=Oq0iNEOjqZuoywrTRkWNIVJbOp/yxudAgq9M61Prki3lG1iLX22qK/dV/6XrndExkLul
	 cI9Sg+sOHozma9Ni9MxEe6DVLXqVBixUgEGIgYoQBJDfJGR1qmA27ZMco2yTxUfeZcyuW
	 FJhOyoepK8sUqH8tmw67xPra/ztF6ui7BvpBXOG52+VVi02cLdganymxO0wY/WonpsewR
	 5toezZfkCZlz4G9zmoDYUOO2XAgzc5Y31qkyMGGYF2+x+LhuutYRlepxqfeBNY2b3nHyO
	 gR0+SFGWfzgG9HsM5fOlnvmi9uGILQMNEnEuPv7gaYfBBPDj0ARSlz5wsrAYva5Qctg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b="F+lsNK/G";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F893606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=F+lsNK/G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460291F000C4;
	Mon, 16 Nov 2026 04:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794804648;
	bh=x7rTvYMtAMvHRPS6DPYo2cQG6L/Be3uAnvxO8PNm0bs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=F+lsNK/GKd+fPaa4dSCLWOtllbYi7ZWp49WLoZXXYX/faq/WnmO4YfPZWa/ZfOpdu
	 RZ5J1zeeik55bO1EJW/vA1RpKNoROaT66wKabAbn4oO8sD3v6EYi1VO1J1s+hMLskI
	 SPmGmhtmx+UAeDlPki5Cgr5DbrIQaDjwgZYrgdZc=
Date: Sun, 15 Nov 2026 20:50:46 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: ryncsn@gmail.com, axelrasmussen@google.com,
 baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, hannes@cmpxchg.org,
 hui.zhu@linux.dev, kunwu.chan@gmail.com, liam@infradead.org,
 lianux.mm@gmail.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 liuxiang.277@bytedance.com, lyugaofei@xiaomi.com, mhocko@kernel.org,
 mhocko@suse.com, qi.zheng@linux.dev, ridong.chen@linux.dev,
 rppt@kernel.org, shakeel.butt@linux.dev, sidchintamaneni@gmail.com,
 surenb@google.com, wangzicheng@honor.com, weixugc@google.com,
 yuanchu@google.com, zhangbo56@xiaomi.com, zhuhui@kylinos.cn
Subject: Re: [PATCH v9 10/16] mm/mglru: Run aging when pages are rare
 outside the youngest gen
Message-Id: <20261115205046.8473acf5a93d69d460598559@linux-foundation.org>
In-Reply-To: <20261116042556.42111-1-baohua@kernel.org>
References: <CAMgjq7C_cH75JrYs8=P5LbxnDjDD6bqeqsCidOPa=r8Z+42sCQ@mail.gmail.com>
	<20261116042556.42111-1-baohua@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 16 Nov 2026 12:25:56 +0800 "Barry Song (Xiaomi)" <baohua@kernel.org> wrote:

> On Sun, Nov 15, 2026 at 11:55 PM Kairui Song <ryncsn@gmail.com> wrote:
> [...]
> >
> > A little nit: with the rounding above, I think we don't need youngest
> > / old as an array, just an accumulative value seems enough now? But
> > feel free to ignore this so we can avoid more update noise in this
> > series.
> 
> Makes sense to me!
> 
> I guess Andrew could help squash the cleanup below into the patch?

yep.

> As suggested by Kairui[1], we don't need youngest and old as
> array. just an accumulative value should be enough.
> 
> No functional change.

It got a bit messy because the later "mm/mglru: restrict eviction
accounting to eligible zones" alters this code also, but I think I
figured it out.  And I might have accidentally fixed an 80-col thing
while in there ;)

Here's the end-of-series result - please check.  It compiles!


static bool lru_gen_imbalanced(struct lruvec *lruvec, struct scan_control *sc,
		int swappiness)
{
	struct lru_gen_folio *lrugen = &lruvec->lrugen;
	unsigned long youngest = 0, old = 0;
	DEFINE_MAX_SEQ(lruvec);
	DEFINE_MIN_SEQ(lruvec);
	int type;

	if (sc->priority > AGING_PRIORITY)
		return false;

	/*
	 * Round up or down corner swappiness, to balance the heavy biased
	 * type better
	 */
	if (swappiness == MIN_SWAPPINESS + 1)
		swappiness = MIN_SWAPPINESS;
	else if (swappiness == MAX_SWAPPINESS)
		swappiness = MAX_SWAPPINESS + 1;

	for_each_evictable_type(type, swappiness) {
		unsigned long seq;

		youngest += lruvec_gen_size(lrugen, type, max_seq,
					    sc->reclaim_idx + 1);
		for (seq = min_seq[type]; seq < max_seq; seq++)
			old += lruvec_gen_size(lrugen, type, seq,
					       sc->reclaim_idx + 1);
	}

	/* the vast majority of pages sit in the youngest gen */
	return youngest > old * MAX_NR_GENS;
}

