Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470641;
	b=paI2bSFXSCeUt5yCc0TfbNC1SpdCBRJDdGB5lr6RwpHeGNt+6Uvlje0+qjGU/NLeYKbU
	 /fBYD6lkvZshMKoLJSQO7aprTa1jWaRD99OGEr2RF7GfovlqxFgTGr9EZVq4ilmLqfdza
	 DtXvxo4PzHQ8LEnZI4OIeYyYFTHsCDDlNIxwcZ3HlBamkuT1KWIaOFch6WdDCfML2IQNr
	 uo/G1NNEfLTnoZBtbW2hcA7lWzRZXsE4uIThy9YDQwc5DqkX4BDAVQJsdz6D4+1T81Hbd
	 dlVTdUuLkyNdqwR/bajVBn33HG5qRHL8AdiLux8DJuYcgInJsp5EpiLhIPHWGHKdziQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=h7KD51JuAVXS/zaBEdvdcGsS4ekwTjWuZyMjjV1lAGI=;
	b=WGkFC1M23zN5pagZ/6RIYQVurvhpKzwFGwrfqkPLcxco8JjFk5LEVm5tBkhOkbTV2Pd6
	 6rEyRvipADZyMm/lcbw5PFgQsQqtz4/O4acxWI+4ORM1lqX6DtYGGhzUNTCZhXGcLffzz
	 gWbV/+6GvZpLBn54oPU3MZsyIBsWrGGfh8Bz/wlO5rHr9XeyQARWUF0q5whRzivefw+kB
	 Y9VFiqiZQhRa6UnR1Ng5PAo92z+TdyhPIrhmKktsumHEnnZ71c2pxvvCxxVFJxxDPZwgv
	 hW2TW1X60nmqsipK2o410N4JOpwRIni4hH/xgRT4BNR8Y2eI2HKOOHHUSx2BrtV90Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NaywuqUL;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E3A606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45E3A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NaywuqUL
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a9f9473029so3250969b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794470641; x=1795075441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h7KD51JuAVXS/zaBEdvdcGsS4ekwTjWuZyMjjV1lAGI=;
        b=NaywuqULZ7l6/c9LK/palCH1SO01sWoreRgTWNmmfOBDaNpmPOY6BlzHi8infp3RkH
         I8Wo+NXtkJe1wu4iV6MxyxAK8XPYHykJH0mgKtJxPJh+VNC5eFmiZGnle5K2Zzjq+kGS
         rKYmDQLGYobhFlXBCNTOn09WxDqrg/Ohk2marLnLCruVGfOpE4lwRZtUMx5Tuny79kCw
         yZYpzzCX6GtYf8CNubpwTnuPs0zOvo/hOSCyb0+Hda+XwZZe/XkxbCl/DAwKLI9eBo2X
         +B5F+RfHrXJqiEEyJxGTO0Xdh3doSFDoCW+krQrzFtGhVHJbU6o5ln6T32Bt9dB2MqhD
         llTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470641; x=1795075441;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7KD51JuAVXS/zaBEdvdcGsS4ekwTjWuZyMjjV1lAGI=;
        b=zg64ykLmmFNJtYlHZkNyQ+Crqfy/3xBWoEi8Gt9bpVDWzHYHXQQ379cZPUj1s2v0CU
         8zxmjUWyluRRMzQKpwNE9P3RXBvE6j3QHoosQxWbbheoWmkPxbD3mugyJuh8HENuWuV0
         BKJLzgfUqhd+oGSbzGE8MZMIepSXB2mHqzsEHRYFzTM1dauW2pCtDU8pVbwDareCoWWA
         eDnAYLT8sHRcn/6aAdNWVnyfAWsXDU3cO8rQEiGJAIrcHOoXdI2JBb0+XIoX+U/rB5yE
         7wMDCt3wHKtp7cGkriqHsH/5yzhHypdE9LYtTjszPQu44jtbmM3ocGh2piTiUhN+ZliS
         lelw==
X-Forwarded-Encrypted: i=1; AL+hErH3hUY7QHiEhYweae9GgZAKXGI8p3rZgVs8Yt9Y6gdZVBrhUr2LvjJ+2tZx/FEnsP92ZmXyRvb1efgwhK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8LLMzEeQezPW/vCwXygyy1RgeG+vBsIZRSyZY0rwElwttj0iy
	toGHQU12biC1hgGDJ6oNyJwxOl5CKMCnvh9BBVAAt2uWN+N2xn0TCCCP
X-Gm-Gg: AYBFou1uzcxy0L9BlYeIooLUquDfGGXD0omO5jSwyc0MmfZ0C6d3Ym9UbnYlACWJ2Bp
	3nhXDcyElh9PO+TKUdhOL+KvdyG3vIY3GDw8J2Tu1hba5Ga3966vW33TlIhebM5L6xf1sKgYLmO
	mJeb3vGtAzYRvEQVO/TGgFp/szj0EXmm1YZjfC5sEhrFvpxr3Odi8nIGr0EiexEmowUk97XHaMt
	lPqPlCmFZBontxaISrazykeGdXH7NMiWhXWBoQ93r/pew7xBvM9ivCD4GrXIY6Q02L1jftBxec1
	LiKnp4MKPLPRhcp94hbfoBWUAe+4ISU7QY1qEPIAdk2pBx4PizPTwQUb1yCYvjq0S0TRqCHuDZF
	Mz3RcrqXJFaQ7hNM7j1v4EG3kzIbeeXwRqfmMXdlwBv+N4woz4wWiMprJRMALcQ/l9iiYzQ6jUz
	vZTj5H17/se6kL46H3Dc7n+GH3v5tvDBskIEAXzf6cuvsD61i8AZ3Kx6rDlrCquPaicglgCeOG4
	XpesQBEEos9Di+hrpMWJHX/3wkDU0pa0mG6nc+kwFxFEWnmidoSLgtu1WIgoUQ8YzNpuwZB4A1h
	/bV7fXkhepewgPMHurXHj2LohGkAa0G+nKeDDMyEONFTk6O8bxxzi/qwL8sByp9mLoio09TR5g=
	=
X-Received: by 2002:a05:6a00:3d54:b0:8b1:3137:d78b with SMTP id d2e1a72fcca58-8bc1c78b3e4mr4735592b3a.48.1794470640490;
        Thu, 12 Nov 2026 00:04:00 -0800 (PST)
Received: from KASONG-MC4 ([43.132.141.24])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab4fd5c6sm3065568b3a.46.2026.11.12.00.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:03:59 -0800 (PST)
Date: Thu, 12 Nov 2026 16:03:54 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, 
	Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Subject: Re: [PATCH] mm/mglru: check need_resched() in fill/drain_evictable()
Message-ID: <avVx_1BEP7fIzGDK@KASONG-MC4>
References: <20261112075827.255602-1-hui.zhu@linux.dev>
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
In-Reply-To: <20261112075827.255602-1-hui.zhu@linux.dev>

On Thu, Nov 12, 2026 at 03:58:27PM +0800, Hui Zhu wrote:
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
> pending; the caller restarts the migration where it left off.  A
> remote resched_curr() sets TIF_NEED_RESCHED directly in the target's
> thread_info, so the flag can still be set with interrupts off.
> 
> This follows walk_pud_range(), which already pairs need_resched()
> with a MAX_LRU_BATCH cap, and commit 6e9be217a3ce ("mm/mglru: use a
> smaller batch for reclaim").
> 
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> ---
>  mm/vmscan.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 6a1af9b92349..47f2cb25eb46 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -5533,7 +5533,8 @@ static bool fill_evictable(struct lruvec *lruvec)
>  			success = lru_gen_add_folio(lruvec, folio, !active);
>  			VM_WARN_ON_ONCE(!success);
>  
> -			if (!--remaining)
> +			/* stop early to shorten the irq-off section */
> +			if (!--remaining || need_resched())

Hi Hui,

I've been thinking about a different design, what if we just
delete the `--remaining` check completely, and check
spin_is_contended on the lruvec and need_resched()?

In the optimal case we don't need to keep lock/unlock the lruvec
at all so this is faster. And it still avoids lock contention or
blocked schedule, and it might be even more responsive as we are
release the lock earlier on contention.
