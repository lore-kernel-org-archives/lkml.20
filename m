Received: from mta0.migadu.com (out-232.mta0.migadu.com [91.218.175.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20D1388E46
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787886937; cv=none; b=BzKp+TVNR5CZSFcDUi6SW8L0yvSFs90SU5xp9bXsTiw+l/N3+Rh/8rmxOxD3GkKDeiK7lA1pXfMTjH3/Gelxh5nS1W5YAjlsZbMYA6bnltlrRZ6Ope3zFM6JlYCehfzKVjcNhbk468kVhL8GpuAzb0lQknJhmoHwJx62G51sFvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787886937; c=relaxed/simple;
	bh=XOjaiGKjhheJ/kjCevTLOAsBuo3lmObElKlXBzQBRYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BS33OmtvU1DY7FA4woUt86IkYlaUR3EoG2VnpbraSGX4lIXUW4xoapc/uw5DrVHhENzfItSPKQDahon/2GhlIpUmalKFejk0qmk6YI2rPDsGXc3fAtdeAvppVAI57XrJFqeI24TolsgTsy7buAnqOhdPqbAtPe5cMhTudQQfY3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CNnl1uXM; arc=none smtp.client-ip=91.218.175.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CNnl1uXM"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XOjaiGKjhheJ/kjCevTLOAsBuo3lmObElKlXBzQBRYA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787886920; v=1; x=1788491720;
 b=CNnl1uXM2Lfcc1PxX5SJy+Cg8Op4CQlCaBSwewc6DSKh1HHZkQmoWUeD43QInC2VFxR34F72
 F3FQxJ8//YRO9XoWrhei/9BS2jjJmzM0WdSgwPPyah/edgLe5BLWlnc/5GvFk5PQwxJlGSjuRpV
 Kma75/8SimqFFy1OizuRJFEc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 01ad734866bc36eb;
	Fri, 28 Aug 2026 03:15:20 +0000
X-Mizu-Trace-ID: 01ad734866bc36eb
X-Migadu-Flow: FLOW_OUT
Date: Fri, 28 Aug 2026 11:15:14 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com, chenridong@xiaomi.com,
	david@kernel.org, hannes@cmpxchg.org, kasong@tencent.com,
	lianux.mm@gmail.com, linux-kernel@vger.kernel.org, ljs@kernel.org,
	lyugaofei@xiaomi.com, mhocko@kernel.org, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, stevensd@chromium.org,
	wangzicheng@honor.com, weixugc@google.com, yuanchu@google.com
Subject: Re: [PATCH 1/3] mm/mglru: improve readability of isolate_folios()
Message-ID: <apD9QqyFGRoGxyZA@fedora>
References: <20260820045603.68809-1-baohua@kernel.org>
 <20260820045603.68809-2-baohua@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820045603.68809-2-baohua@kernel.org>

On 08/20/26 at 12:56pm, Barry Song (Xiaomi) wrote:
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

The subject doens't reflect the truth. This patch changes the behaviour,
but not improve readability of isolate_folios() only.

I also noticed the confusion of isolate_folios() implementation, and made
a patch to only change the local variable and added code comment to
explain it in my local branch. Surely refactorying is also good.

+        * Scan at most one type per evictable type (anon/file), starting with
+        * the type get_type_to_scan() picked as statistically colder.
+        *
+        * After a scan:
+        *  - isolated > 0:  got folios, record the type and return.
+        *  - scanned == 0:  the type is empty; fall back to the other type.
+        *  - otherwise:     the type has folios but all were hot (or lost an
+        *                   isolate race); retry the same type rather than
+        *                   switch, so positive_ctrl_err()'s refault
+        *                   statistics stay unbiased.
+        */

While in Ridong's patch, the 3rd case disappeared. It doesn't rescan with
the original type as the old code is doing, but return directly. 


> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index c1404a59523d..d5cc30b667ad 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4833,35 +4833,41 @@ static int get_type_to_scan(struct lruvec *lruvec, int swappiness)
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
