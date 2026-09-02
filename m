Received: from mta1.migadu.com (out-30.mta1.migadu.com [95.215.58.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17493A0E99
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788332030; cv=none; b=R6Lw5YAtnqTPRCFMdMTLZ/DUKzCAd412Fuw6XVy9J1bfl8uD24RPtw1/X3Yg+dJpYW+ap7+ysW76DgPETnBeOzy2IG45X8i0EBrgYLhGPCQr8tZEAHpJTA59djRH5nzRlLsjYEE60FoPYHRw6vIpleuC5TqHDVGWJoHN4xFlewQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788332030; c=relaxed/simple;
	bh=uI99S26D5TZQ1wv4WgExHkjMpzPeg6mRBSMTMpU+XFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/S12+0qudKVmew4mHKSs7NjPA3aNBEc4HLtwjU1y6ZoTTz9hm7xE8naw0/knTaAbVKb73wUp3cKbnAvxSgCWLiOWl8Ev2dY+Q3qFPh6H6ATagugrloSxgdOCF9JSC3DR8d6oGuSXOSRXKzZIBoeqRXCNypLp3eY4eNcIhJv4xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lKPVmQO/; arc=none smtp.client-ip=95.215.58.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lKPVmQO/"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uI99S26D5TZQ1wv4WgExHkjMpzPeg6mRBSMTMpU+XFU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788332016; v=1; x=1788936816;
 b=lKPVmQO/3ym5FxmjPM5ELyGfSlehMcgEUMSAhLDnTW52iV+dwyIVyPAkLFfdhZnORwZOmZiC
 EPHZh+S1x21SSbvYOttxb/ZSnxf5x3eO8m/3qhxLkimPK7MICMYD4MmCKmOqSr6K3pr4vm3bfZE
 6Q7XlldwUueVkeAzB6nsZZCg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 6addee44da3240d2;
	Wed, 02 Sep 2026 06:53:35 +0000
X-Mizu-Trace-ID: 6addee44da3240d2
X-Migadu-Flow: FLOW_OUT
Date: Wed, 2 Sep 2026 14:53:28 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com, chenridong@xiaomi.com,
	david@kernel.org, hannes@cmpxchg.org, kasong@tencent.com,
	lianux.mm@gmail.com, linux-kernel@vger.kernel.org, ljs@kernel.org,
	lyugaofei@xiaomi.com, mhocko@kernel.org, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, stevensd@chromium.org,
	wangzicheng@honor.com, weixugc@google.com, yuanchu@google.com
Subject: Re: [PATCH v2 1/2] mm/mglru: make type fallback logic explicit in
 isolate_folios()
Message-ID: <apfH6MYe6fNj1B-E@fedora>
References: <20260829074204.45304-1-baohua@kernel.org>
 <20260829074204.45304-2-baohua@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829074204.45304-2-baohua@kernel.org>

On 08/29/26 at 03:42pm, Barry Song (Xiaomi) wrote:
> From: Ridong Chen <chenridong@xiaomi.com>
> 
> The for_each_evictable_type() loop in isolate_folios()
> is misleading: it does not actually iterate over each
> evictable type. Instead, get_type_to_scan() selects the
> type to scan, while the iterator `i` merely bounds the
> number of attempts.
> 
> Make the fallback behavior explicit in the code and remove the
> opaque for_each_evictable_type(i, swappiness).
> 
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> Co-developed-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>  mm/vmscan.c | 46 ++++++++++++++++++++++++++--------------------
>  1 file changed, 26 insertions(+), 20 deletions(-)

Reviewed-by: Baoquan He <baoquan.he@linux.dev>

> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index fdd13299a04a..35a233623368 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4838,35 +4838,41 @@ static int get_type_to_scan(struct lruvec *lruvec, int swappiness)
>  	return positive_ctrl_err(&sp, &pv);
>  }
>  
> +static inline bool is_single_type_reclaim(int swappiness)
> +{
> +	return swappiness == MIN_SWAPPINESS ||
> +	       swappiness == SWAPPINESS_ANON_ONLY;
> +}
> +
>  static int isolate_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>  			  struct scan_control *sc, int swappiness,
>  			  struct list_head *list, int *isolated,
>  			  int *isolate_type, int *isolate_scanned)
>  {
> -	int i;
> -	int total_scanned = 0;
> +	bool type_fallback_allowed = !is_single_type_reclaim(swappiness);
>  	int type = get_type_to_scan(lruvec, swappiness);
> +	int total_scanned = 0, scanned, tier;
>  
> -	for_each_evictable_type(i, swappiness) {
> -		int scanned;
> -		int tier = get_tier_idx(lruvec, type);
> +retry:
> +	tier = get_tier_idx(lruvec, type);
> +	scanned = scan_folios(nr_to_scan, lruvec, sc,
> +			      type, tier, list, isolated);
>  
> -		scanned = scan_folios(nr_to_scan, lruvec, sc,
> -				      type, tier, list, isolated);
> +	total_scanned += scanned;
> +	if (*isolated) {
> +		*isolate_type = type;
> +		*isolate_scanned = scanned;
> +		return total_scanned;
> +	}
>  
> -		total_scanned += scanned;
> -		if (*isolated) {
> -			*isolate_type = type;
> -			*isolate_scanned = scanned;
> -			break;
> -		}
> -		/*
> -		 * If scanned > 0 and isolated == 0, avoid falling back to the
> -		 * other type, as this type remains sufficient. Falling back
> -		 * too readily can disrupt the positive_ctrl_err() bias.
> -		 */
> -		if (!scanned)
> -			type = !type;
> +	/*
> +	 * We are running out of the current reclaim type. Fall back to
> +	 * the other type if allowed.
> +	 */
> +	if (!scanned && type_fallback_allowed) {
> +		type = !type;
> +		type_fallback_allowed = false;
> +		goto retry;
>  	}
>  
>  	return total_scanned;
> -- 
> 2.34.1
> 
