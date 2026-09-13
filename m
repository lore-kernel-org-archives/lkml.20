Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D650738F95A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789274576; cv=none; b=AQq+A+nAQV+sXMTPBxkEusdULYOuZwf4Bfosl7hsgGLQ5P9hhXN0+dPMGg3n9bBKedT9Q18GYcnVMhTaYYgTVpwdClN1rWa0qel8heukVCULi2bHaObdpa8ROn9wN8MH4+auv4rYv1YWB69knifyL80e/v0dJwUCG3AUTCnpd7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789274576; c=relaxed/simple;
	bh=oygAlw0LON6Yl4EyDzIaDfcNsHjbMhPcXxKMGKkvL3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjSjpjQIVOXoSAWD9IoQ0zAzy20ZzVVJ5zgjh1lVGk7zGJC6Aj+lJ8mKhY6SzrmgmxQ44YfpftT3lKdVt/urpDmJBtBvtHqMuVsAhABmxMXb99iq3V6lm9KCVsSYYYyWmjZZvwf1lxW2BaRZHdJlr/PnX4A960vHnu33JXVywOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=T4/4R03U; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="T4/4R03U"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ccs7gEOpe3e5tMpEkXHimu7RBYE5MxCJoaUx7mSCdx8=; b=T4/4R03UOXz6bk6wvuT0Y456jL
	HoSHPtAnEFbZdBgvEv8CildvupeM6Qj+pRrNQquwahZkThO6+hFQwdvbOAa4JzTD7pl0LEVHO4yDC
	DlQZdF4fytK3JFw5lv1quqY7v9gYydNf6p5QfhUaKHZaz/N+k9hufmBKWkdgMLSx188fRnY73dqqs
	Sw9g0IbL/a81mmKE3f9H+WMA2ST2pcjjcE2uVt4MMWMm7RFquHueGMpurK1w6z5Akcrxm63Om2DnT
	kosAAYktUTdNQL7SbvGxJe7X8EfO8+x/alZoNAjVBWWkJa9+7a4hCYgpgwofbKPUUXQp/X/2asId5
	WsG8eJRQ==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5c3D-00000003Stg-0rTk;
	Sun, 13 Sep 2026 04:42:47 +0000
Date: Sun, 13 Sep 2026 05:42:47 +0100
From: Matthew Wilcox <willy@infradead.org>
To: xu.xin16@zte.com.cn
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	surenb@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	chengming.zhou@linux.dev
Subject: Re: [PATCH 3/4] mm/ksm: make break_ksm() more scalable
Message-ID: <aqYpx0hYUbcKKVYp@casper.infradead.org>
References: <20260911160421076_KNXun8Mpp9Xj7fxHG0i7@zte.com.cn>
 <20260911161210082WKOqK1dumByDY7jeEOdPF@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911161210082WKOqK1dumByDY7jeEOdPF@zte.com.cn>

On Fri, Sep 11, 2026 at 04:12:10PM +0800, xu.xin16@zte.com.cn wrote:
> +++ b/mm/ksm.c
> @@ -660,16 +660,11 @@ static int break_ksm_pmd_entry(pmd_t *pmdp, unsigned long addr, unsigned long en
>  	return found;
>  }
> 
> -static const struct mm_walk_ops break_ksm_ops = {
> +static struct mm_walk_ops break_ksm_ops = {
>  	.pmd_entry = break_ksm_pmd_entry,
>  	.walk_lock = PGWALK_RDLOCK,
>  };

Absolutely not.  This is a struct full of function pointers, and
you're making it modifiable.  That makes it a big juicy target for
attackers to find and exploit.
