Received: from mta1.migadu.com (out-250.mta1.migadu.com [95.215.58.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638C8377EC5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.250
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336463; cv=none; b=E0cLGnnULbjLy7KvhXAw9tsf0Qn5P8eamTjbLyBX71lkMFphe7W1WaYwR68Kmdj8/BwefFDMIwcP2r05fVU6VPrLInuoAL4BY+kCwET64fclCQ3+roXzBFAQiYStnloErJJ5tmxgacJSFYC6yRRegx2UPualjAb1W/9vttedmao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336463; c=relaxed/simple;
	bh=T/bumzJM3d5jlXTPAtKTEE9Yljf9oHesSte5DKZj6XA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJ8+AISqXVYVtJ1IfyrVOmO6d+5zqq2eUhn83drbLZy2o1pok+czom+ztgThynGGfIGxlMvORyH0AU4+VJe8kXnrymv1y7sef7ltD4N+w9P4Ky48GoLv3Sy/1xHi8q/lYRT9UA20+55EflBz+RTA0PcCWSI9s5EJSR+3J+1ZgBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EcQgRXCb; arc=none smtp.client-ip=95.215.58.250
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EcQgRXCb"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=T/bumzJM3d5jlXTPAtKTEE9Yljf9oHesSte5DKZj6XA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788336459; v=1; x=1788941259;
 b=EcQgRXCbdcbNsVTkmiBnxh3gV+M+mA8kkNE15MVHsgACvfMHePuwLu801PkU9UsleVthyb8L
 lI5kC1HTkrnbZm+GVhSjq9kbCftJTb4vg8bFgpa67K+Kikx/D3nEe/OuHeq0hHGEdCv57jzGcC3
 3FFNnwPBqB6u/WqHrU5wZaSg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id f6d858a2dbb51460;
	Wed, 02 Sep 2026 08:07:39 +0000
X-Mizu-Trace-ID: f6d858a2dbb51460
X-Migadu-Flow: FLOW_OUT
Date: Wed, 2 Sep 2026 16:07:28 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com, chenridong@xiaomi.com,
	david@kernel.org, hannes@cmpxchg.org, kasong@tencent.com,
	lianux.mm@gmail.com, linux-kernel@vger.kernel.org, ljs@kernel.org,
	lyugaofei@xiaomi.com, mhocko@kernel.org, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, stevensd@chromium.org,
	wangzicheng@honor.com, weixugc@google.com, yuanchu@google.com
Subject: Re: [PATCH v2 2/2] mm/mglru: make retry logic explicit in
 isolate_folios()
Message-ID: <apfZQE1X6zGAsBb_@fedora>
References: <20260829074204.45304-1-baohua@kernel.org>
 <20260829074204.45304-3-baohua@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829074204.45304-3-baohua@kernel.org>

Hi Barry,

On 08/29/26 at 03:42pm, Barry Song (Xiaomi) wrote:
> The existing mainline code retries the same type once in a rather
> subtle way. `for_each_evictable_type()` may provide one more iteration,
> allowing the same type to be retried if we scanned some folios but
> failed to isolate any due to protections, promotions, or races. This
> patch makes the retry behavior explicit.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>  mm/vmscan.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 35a233623368..718f59ffc688 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4852,6 +4852,7 @@ static int isolate_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>  	bool type_fallback_allowed = !is_single_type_reclaim(swappiness);
>  	int type = get_type_to_scan(lruvec, swappiness);
>  	int total_scanned = 0, scanned, tier;
> +	bool tried = false;
>  
>  retry:
>  	tier = get_tier_idx(lruvec, type);
> @@ -4871,9 +4872,18 @@ static int isolate_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>  	 */
>  	if (!scanned && type_fallback_allowed) {
>  		type = !type;
> +		tried = true;
>  		type_fallback_allowed = false;
>  		goto retry;
>  	}
> +	/*
> +	 * We scanned some folios but failed to isolate any due to promotions,
> +	 * protections, or races. Retry once to avoid a larger loop.
> +	 */
> +	if (scanned && !tried) {
> +		tried = true;
> +		goto retry;

Seems patch 1 and 2 makes not minor difference than mainline kernel on
behaviour.

1, if swappiness is 0 because no swap, it will run two times if
(scanned != 0). This is not corner case, but usually seen on some
systems w/o swap device. The 2nd no gain run could decrease efficiency.

static int get_swappiness(struct lruvec *lruvec, struct scan_control *sc)
{       
	...                

        if (!sc->may_swap)
                return 0;
	...
}

2, for swappiness (0, 200), the behavious is minor changed.

Mark one scan_folios() result as one of:
      iso     *isolated > 0
      empty   scanned == 0 && !*isolated
      busy    scanned > 0  && !*isolated

mainline:  T(busy) -> T(empty)         -> return   (2 scans, no fallback)
v2:        T(busy) -> T(empty) -> !T(...)        (a 3rd scan_folios())

Maybe we can go like below:

static int isolate_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
                          struct scan_control *sc, int swappiness,
                          struct list_head *list, int *isolated,
                          int *isolate_type, int *isolate_scanned)
	...

      for (attempt = 0; attempt < 2; attempt++) {
              int scanned = scan_folios(nr_to_scan, lruvec, sc, type,
                                        get_tier_idx(lruvec, type), list, isolated);

              total_scanned += scanned;
              if (*isolated) {
                      *isolate_type = type;
                      *isolate_scanned = scanned;
                      return total_scanned;
              }
              if (attempt)                /* already retried / fell back once */
                      break;
              if (scanned)
                      continue;           /* retry the same type once */
              if (single_type)
                      break;              /* no fallback for 0 / anon-only */
              type = !type;               /* empty: fall back to the other type */
      }

      return total_scanned;
}

This preserves mainline for 1..200 exactly, keeps the intended 0/201
same-type retry, and cannot produce a third scan. Just personal opinion.

> +	}
>  
>  	return total_scanned;
>  }
> -- 
> 2.34.1
> 
