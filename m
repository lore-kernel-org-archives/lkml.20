Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792425419;
	b=xesU7D4DCmf1syESuwCqYcfWsxmpcW57L0LCAx0kldULvgrLhL5bNbr7arexB5bQ5JUx
	 W5gJzQePF1NPNWpm9hlDmldhp2H0CTyJRgnHzfqz+PCotK6aAUwxo/cWy40i3gAUb7X0W
	 6apgjt7LrESTe5gIPWTe5GJ1LlgtkLDnguaOMgzljxJgiJvhCbyxJh7j09BRKJ8UlnsIu
	 YsEi0C9wPoDYEyDhwOPqqJNddlG4AuNkFQYgAs5fPT9/cy/ISSj339n7IKNQLUrfqedgJ
	 86D6YB1YJxycEWhW3fAL/3Cw2eS5147HGh9HD4p75kDQZJweUOMOvBuoxgAzGaPxbtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792425419;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=BCPGdn08In8hsRvJ/xlYMeYzGiSxsIAjqufejJHxudc=;
	b=GUDbDTGnN9X2TxGGYLT9jjLBWr/Rgj/QbZABNosIWhQkZlltVp+lTkudt82TP4ke67uB
	 1J5OAp8ADcSFW9ZH4II62ZNlg0NQbB2VkeWQn7OkGAaJuVp2JF0vDbLCzE80Mgd02+rpf
	 /lOfhXcC70wco4bP82aZs8Qs9cS29Hpu4bXofR9Ke2Z/ETGtO/r9ItgSq4lhyQ8lMPXZ7
	 iVYvM2ZC0OzEut/wqktlOyenEO67uvEkJbQLk78+0HPiBRi03+Jls2vSmk05GJuWevVjA
	 B8yJgmi2DaXJxLn+BmJTAm6jCsll9G7StgUf/mm4clDMh11vRuUByPhjks2tSJH2uug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=P+DJK3K8;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B311B606C15D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B311B606C15D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=P+DJK3K8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D726F169E;
	Mon, 19 Oct 2026 08:56:54 -0700 (PDT)
Received: from arm.com (RQ4T19M611-7.cambridge.arm.com [10.0.144.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8CDA3F7D8;
	Mon, 19 Oct 2026 08:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792425418; bh=FTlPPvQLOuIgddMm6UeqHnpF/oK8sW3b5I0vLFpaGFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P+DJK3K8pwaa4+8Yow2pf7Q0ivZ/XICojej4Co7OwLdOEl/oiSOF78MWnDUe5feSf
	 A+MbMP79i/mjXUxVink/0N+U5DW2PWeRHiY4hgCU/GP7hquFH/fQFV3vE/JmrFRhIk
	 YKu2+5HD7FY6MGesOjj8rVwgxvdkoIPH6vztddYE=
Date: Mon, 19 Oct 2026 16:56:53 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] mm: kmemleak: scan modified objects as soon as they are
 grayed
Message-ID: <atY9xT4MfPL7R8fo@arm.com>
References: <20261016-kmemleak-gray-drain-v1-1-3270256fdc8e@debian.org>
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
In-Reply-To: <20261016-kmemleak-gray-drain-v1-1-3270256fdc8e@debian.org>

On Fri, Oct 16, 2026 at 09:07:24AM -0700, Breno Leitao wrote:
> diff --git a/mm/kmemleak.c b/mm/kmemleak.c
> index 8fa409a4f9fb26..6e12bcd95312d2 100644
> --- a/mm/kmemleak.c
> +++ b/mm/kmemleak.c
> @@ -1696,8 +1696,10 @@ static void scan_gray_list(void)
>   * Conditionally call resched() in an object iteration loop while making sure
>   * that the given object won't go away without RCU read lock by performing a
>   * get_object() if necessaary.
> + * If @scan_gray is set, also scan the gray list while the RCU lock is dropped.
>   */
> -static void kmemleak_cond_resched(struct kmemleak_object *object)
> +static void kmemleak_cond_resched(struct kmemleak_object *object,
> +				  bool scan_gray)
>  {
>  	if (!get_object(object))
>  		return;	/* Try next object */
> @@ -1709,6 +1711,8 @@ static void kmemleak_cond_resched(struct kmemleak_object *object)
>  	raw_spin_unlock_irq(&kmemleak_lock);
>  
>  	rcu_read_unlock();
> +	if (scan_gray)
> +		scan_gray_list();
>  	cond_resched_tasks_rcu_qs();
>  	rcu_read_lock();
>  
> @@ -1910,7 +1914,7 @@ static int __kmemleak_scan(bool full)
>  		raw_spin_unlock_irq(&object->lock);
>  
>  		if (need_resched())
> -			kmemleak_cond_resched(object);
> +			kmemleak_cond_resched(object, false);
>  	}
>  	rcu_read_unlock();
>  
> @@ -1981,8 +1985,13 @@ static int __kmemleak_scan(bool full)
>  	 */
>  	rcu_read_lock();
>  	list_for_each_entry_rcu(object, &object_list, object_list) {
> -		if (need_resched())
> -			kmemleak_cond_resched(object);
> +		/*
> +		 * Scan newly grayed objects now, not after the walk: one may
> +		 * hold the only reference to another and be freed by then,
> +		 * like a maple tree node that keeps being replaced.
> +		 */
> +		if (need_resched() || !list_empty(&gray_list))
> +			kmemleak_cond_resched(object, true);

I think that's a good way to reduce the false positives for such maple
tree scenario. Do you have any numbers on how much this extends the scan
time by? If it's too expensive, we could rate-limit it, say every jiffy.

>  
>  		/*
>  		 * This is racy but we can save the overhead of lock/unlock
> @@ -2082,7 +2091,7 @@ static void kmemleak_scan(void)
>  		bool dedup_print;
>  
>  		if (need_resched())
> -			kmemleak_cond_resched(object);
> +			kmemleak_cond_resched(object, false);

Nitpick: instead of passing 'false' in a few places, rename
kmemleak_cond_resched() to kmemleak_resched_drain() (well, some better
name) call get kmemleak_cond_resched() to call that with 'false'. We
could also move need_resched() in such function, being a small wrapper
the compiler should inline it.

Either way,

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
