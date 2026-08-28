Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442D136F916
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907941; cv=none; b=hhoJjri6fzVplqNStooloG3OFMrEkytOoA+rGepGWPJt2S1u1hvEuJnOy4NJb2Fsi7KJE6bHj5uFTafdvdvPOrwmRaSnPzS6Mi0GUytkT5oU9MgSLqgtx1Kkj+jltLM9JRE4R6qVIGNcxTU0QESjQnt/9qmhMtDm9JiE6QrH6Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907941; c=relaxed/simple;
	bh=6G3f3e/hHHgdAL3qfyFmXk06NOG5W1LSCjVo3O7YQKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXdrHr85/VwJmVnmFOiZCrTFBWuVvw5pFJzB8kb2dso+Cdgnw0kfjv4NyqoStt7OtR2S5ctfZmc0mlqERPmSPGRE5n7SLXClCrnXllSzLZkjj5foZV5WTkmjzt0j+kOB2AujBVusjthY0Nkf4ddgKqBVG7pFpDlq3CrqeNzlrwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QU589jMI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QU589jMI"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4956869750eso4352115e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787907937; x=1788512737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BZfz1FzWZ0BwOsnfIl8utTNnclF/R6kd8AaIZGBs870=;
        b=QU589jMI58pnCgr99d5Uxp9dfQlaVj5X03tf3tb44vwsHWXlzQwXbYy3djf+sQOJvk
         juJuDhA9123sMrnQk8DnnPOBABdqCSqO69UeP/O4TUjA3PxxUKgmCEM7U8tnVp/8D6gL
         rq4vA9SPeNccaX3t7qG98D+YAozs2mTVPsvAPa/D0WNBhk90NF3WSq1CsAC5gkxPNbMS
         vE3jd5roh0G8kjIwwCz5eZNSibFwoTfapHA7zyAwnrEyrm/T/AG8MA7pDQ57MdyK87eU
         iSFqOxSVD1RSN0OcJEGBVKkiBoPio743AJBVYUs7ZGfEJ49AIL1PNXg2fKQFXqs9R7Vb
         Ypqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907937; x=1788512737;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BZfz1FzWZ0BwOsnfIl8utTNnclF/R6kd8AaIZGBs870=;
        b=hFwsnzdeYIFUWkxjJUy2fSJaEZsgclpKLNyvwJ/I5Yk8kgdfYWbrt460zaOxioNN3/
         JAxvgbDf8OJWz8w8yEEXY569ftQi34GweDfW0fcZgqIkLjKM/qDMK9QGkapNoaMELi2V
         O8MREhYPrTUrtTNYUwr+luT1iZjfaReLy6E1v2D3lxakmk/5FaPhtjXgOe/dIV6hMmYy
         mxZoM7JqnZZkzkX5OJ8rB2/dzmd1VX94OVseoJSIAYB49RasVcgt7PB0DCcGzbsWsOEy
         whfzP7rEXgM9s4kVp66ABwlp0GRP2UZ7bYLN/1U6CYGvFg4NkhtBeqbUlQ5CvQlxSyJJ
         fwzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrrcgpm+mqRRQWKifkADB0SnS0ys+aJhxbjI7vgy7fPhPPHhpiBaX4IebbfAmU3EIUQ/8+JvudEtMwBxGI=@vger.kernel.org
X-Gm-Message-State: AFuF++mVWGkBbm9E27HONJ8sh8R0DIsvnN9N08amMGGAdgzke4Mi+948
	d+3U3KZD8/6yw6zETkeozClzQBebC58C8V/FMwX65w1LGJXINVz4jSJOI2gKiL5XOF8=
X-Gm-Gg: AR+sD11dM5p0xEwLQF7cTL+cxrC8VOnfLP29aZ7z+NHAUCWCOKfh2UWx+mZDJH/OnQR
	9ajWSKwqSLyzxlP5yHUU+zsCrJT6XKjFMtq9ISLj61kMLzQPTKawiI3x5qSk8HiSLwSws0RAvRy
	RlWJ+MileSGX4Ei4cNHci2OnI0QpASykmKbh+NorPNH91094nJok6SUy7FQEkaw3/dTTU/k6QX3
	wB6F+EYh5e3qlpyiouaybxedBo6B8Ds+rcYF0cy9AMC3bAN/15L50b6KNSL34tI+5l5L3AYPEVK
	WqCMwtcV7HYqNnhk/MI1XqpCc1xwyJh8Y2oee0jVeJBHS3uYM9BnC2kkv2E7uXnWCdkQcNyf6mQ
	W/ga4uKctjkV6ZWJ0sU7SxN59vQhBFCOnx08EbcTEOnbB3esazJNvYytq1g38H7C7/X5kTZP2Fp
	vLyvje3Z4OIugIvc5s6f+E6I3yHBI+SgMFKSXJBpcu64lTwVTfSR1dkxKUYS5KoQ==
X-Received: by 2002:a05:600c:4453:b0:499:8777:ccba with SMTP id 5b1f17b1804b1-49b91c486abmr70075465e9.12.1787907936663;
        Fri, 28 Aug 2026 02:05:36 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91728319sm48557415e9.12.2026.08.28.02.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:05:36 -0700 (PDT)
Date: Fri, 28 Aug 2026 11:05:34 +0200
From: Petr Mladek <pmladek@suse.com>
To: Lance Yang <lance.yang@linux.dev>
Cc: atomlin@atomlin.com, akpm@linux-foundation.org, mhiramat@kernel.org,
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com,
	neelx@suse.com, sean@ashe.io, chjohnst@gmail.com, steve@abita.co,
	mproche@gmail.com, nick.lange@gmail.com
Subject: Re: [PATCH v9 1/2] hung_task: Reset warning budget when problem gets
 resolved
Message-ID: <apFPXhPynOlfON4B@pathway.suse.cz>
References: <ao7LW7-3GjJzKNp0@pathway.suse.cz>
 <20260827153001.18515-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827153001.18515-1-lance.yang@linux.dev>

On Thu 2026-08-27 23:30:01, Lance Yang wrote:
> On Wed, Aug 26, 2026 at 01:17:47PM +0200, Petr Mladek wrote:
> >> @@ -314,6 +317,11 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
> >>  	if (test_taint(TAINT_DIE) || did_panic)
> >>  		return;
> >>  
> >> +	if (atomic_xchg(&reset_hung_task_warnings, 0))
> >
> >I would use here atomic_xchg_acquire(). It serializes the ordering
> >of reset_hung_task_warnings vs sysctl_hung_task_warnings.
> >It would make it symetric with the barrier in the sysctl handler.
> 
> Yep, _acquire is enough here. Plain atomic_xchg() is already fully
> ordered, though, so this looks like making the intent clearer rather
> than fixing the ordering :)

Yes, my intention was to make the ordering more clear and symmetric.
The original code worked because the barrier was even stronger.

> The old-value return already makes plain atomic_xchg() fully ordered :)
> 
> ORDERING  (see memory-barriers.txt)
> --------
> 
> The rule of thumb:
> ...
> - RMW operations that have a return value are fully ordered;
> ...
> Except of course when a successful operation has an explicit ordering
> like:
> 
> {}_relaxed: unordered
> {}_acquire: the R of the RMW (or atomic_read) is an ACQUIRE
> {}_release: the W of the RMW (or atomic_set)  is a  RELEASE
> 
> >
> >> +		hung_task_warnings_printed =
> >> +			READ_ONCE(sysctl_hung_task_warnings);
> >
> >This would work only when "sysctl_hung_task_warnings"
> >is updated using WRITE_ONCE(). But it seems that this
> >is not the case. My understading is that it is updated by:
> 
> Wait, I think proc_dointvec_minmax() already handles this.

You are right.

> For proc_dointvec_minmax(), the converter is:
> 
> int proc_dointvec_minmax(const struct ctl_table *table, int dir,
> 		  void *buffer, size_t *lenp, loff_t *ppos)
> {
> 	return do_proc_dointvec(table, dir, buffer, lenp, ppos,
> 				do_proc_int_conv_minmax);
> }
> 
> Here, i is table->data, while lval is local:

I have missed this.

> static int do_proc_dointvec(const struct ctl_table *table, int dir,
> 		  void *buffer, size_t *lenp, loff_t *ppos,
> 		  int (*conv)(bool *negp, unsigned long *u_ptr, int *k_ptr,
> 			      int dir, const struct ctl_table *table))
> {
> ...
> 	i = (int *) table->data;
> 	vleft = table->maxlen / sizeof(*i);
> ...
> 	for (; left && vleft--; i++, first=0) {
> 		unsigned long lval;
> 		bool neg;
> 
> 		if (SYSCTL_USER_TO_KERN(dir)) {
> 			proc_skip_spaces(&p, &left);
> 
> 			if (!left)
> 				break;
> 			err = proc_get_long(&p, &left, &lval, &neg,
> 					     proc_wspace_sep,
> 					     sizeof(proc_wspace_sep), NULL);

I have missed that proc_get_long() assigns the value to the local
variable @lval.

> 			if (err)
> 				break;
> 			if (conv(&neg, &lval, i, 1, table)) {
> 				err = -EINVAL;
> 				break;

The real asigment to table->data is done here. And I agree that it
goes down to proc_int_conv() which does WRITE_ONCE().

So, we are on the safe side and do _not_ need the proxy table.

Now, I am not sure whether we need v10. It might be worth it.
AFAIK, Andrew has not taken this patchset yet...

I am sorry for complications.

Best Regards,
Petr
