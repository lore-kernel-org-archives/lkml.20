Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BD7493632
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160649; cv=none; b=BDtCR0U5/QlSUQEPTOGGAHAsD3qE46hgBAffdlAjWpTkINuDkpuHzLWlAU5A4yp+eYr+J00jU1+geiMwzJfDWWBdcjpFAkmx77AZyHrRikByJCPEVvJ8t237fxLBnqgAlOMxqvtfOUHtt1lKszoxzkyYzWNp40o/LeWfT2z4BoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160649; c=relaxed/simple;
	bh=bn75c3IYueGvjAQPrcpdhxypvqLVO3IiQNYMJMqMr10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlFzK5N/vLBcd4sDza0WYCyK87rK3ZpBpy2rHukY2unnqeiK/99pK2Bc1846nBlkO6bDOEfsTyUD9qM9DPMiVq+WIiQLMHn9gGFCmplUC1TPa5JcWTZZQ3u66ydrRjbtQif0PPXq3E3WZEDwUczFfLABpCoV4aD80eIsOGnSZgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ux7FCf6c; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EiMYhXwY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ux7FCf6c";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EiMYhXwY"
Date: Wed, 23 Sep 2026 12:50:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790160638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gE7SOapHmsqdRcCRFYoTEg/koChJLdV8R/L5X+rSZno=;
	b=ux7FCf6c7AU+yER7wruDXtEPhhT57M7Q39fy/sa6Kh68uoktKi7ujwYj/bTBKkM/2R3Fcb
	aZzb90FuR5gV747FvIoecEy/Cm9qTehbsEoDC4JsvfIOgtTkQR6pxiZW7lM7+a5jv3Tntb
	j1ECmr5aeo7h5SqaG3WI8deL5AY4O+Rw5Okz6+WVz/TCcTrNd7x+odCHPy6uBcIMKoIAXW
	Hfy4xjObG2nTLkL13Y2lVvGxAV9/aPFFGQizYWdev5Z6ma9mGWTZooPWiJVT025V7E6ux2
	UCsc0AP9UMjrBg+S37GgXkNe4suhmzA1U7h3/UV2C797fAA2c3uWg5zp7XWogg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790160638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gE7SOapHmsqdRcCRFYoTEg/koChJLdV8R/L5X+rSZno=;
	b=EiMYhXwYxIfnqVOyTCid9p2zGeMMB6XttC5HNMvu/854ddLVGqGcGBzyaJzpo49TqAho8v
	hQuvUhd0GU47YMDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Chuyi Zhou <zhouchuyi@bytedance.com>
Cc: tglx@kernel.org, mingo@redhat.com, luto@kernel.org,
	peterz@infradead.org, paulmck@kernel.org, muchun.song@linux.dev,
	bp@alien8.de, dave.hansen@linux.intel.com, pbonzini@redhat.com,
	clrkwllms@kernel.org, rostedt@goodmis.org, nadav.amit@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] x86/mm: Decouple kernel TLB flushes from
 flush_tlb_info
Message-ID: <20260923105037.4wyE0RLj@linutronix.de>
References: <20260921095359.3784458-1-zhouchuyi@bytedance.com>
 <20260921095359.3784458-5-zhouchuyi@bytedance.com>
 <20260923092819.OVgjJ9Gb@linutronix.de>
 <956efada-ac6a-413c-ac90-324eae428025@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <956efada-ac6a-413c-ac90-324eae428025@bytedance.com>

On 2026-09-23 18:43:55 [+0800], Chuyi Zhou wrote:
> The ceiling check does not cover all possible inputs, though. For
> example, with start = ULONG_MAX - PAGE_SIZE + 1 and end = TLB_FLUSH_ALL,

Well, due to the number of pages when it is considered to do a full
flush. But "ULONG_MAX - PAGE_SIZE + 1"  isn't a valid start input, is
it?

Sebastian
