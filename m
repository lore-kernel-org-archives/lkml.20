Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730391;
	b=O1It8MFUlHNa01ULCyrMArgJvK+fTfN81cH/4462GEr3p1w5nVY1PbHPN0hlaQJmNiJy
	 X7jp10T1quQQeQ55Y9XvGInE6+RQHyTban++tucmv2aTYo1rAQUBdAfWfbpZWjud2hEs5
	 9D/1Fbj+mXxhMsQehEWdYtZyms2LTuqiKdW4vAnrxt98wsLViWOgj9YumNbOjxb7+ZLKk
	 94pM1E5096TmgFsBIS9gUZvGseCK+f7irVyKZwyJ1K859hA+fTtVM7xzNd2dWUOAchlGQ
	 tiif2zZeBc7JJv0f8lnWGOF7mFMcU5JOWEohOiLBCS7mIuv6m5wacla51JSkZBaywXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kIGmBf8e1TRHzdHJsTtZA5MGm5kHZ3GW2cmzV+bXePs=;
	b=VJKc9ZxdcSkl8XTFYQ+uWoVEzfsVcDN6foazl/9224jANnWCxWusPgwgCP0pybUlu8Lw
	 7dF1JWdB8jaikZ3HFhv6tKCpc5nAhESVnx/8xscmXeRQudgXVvngQjhiOLMqMV2KgkTQx
	 xQtvfgGpLD+OHAkBu0BJM7kUbCsmb69e3fx1MzJzD7KZfmTjmzatHll4va/Fy+FZ9HfDA
	 +7IQmG0XFwWR1LPtSzG0VsxY1qo0u5Oa9YXyd1LngzUYEx6JWWgUmazkeX9JV3Ua3PvzB
	 3GbdXOgJKqkp7YZ4iUiU3aoDou75Ng7eORkuTTV5Nry3J/OP1hI6cdfDaDL2Tmc+ZRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=Vvm87aEb;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785B3606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 785B3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=Vvm87aEb
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b12b1ee403so28106607b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1793730389; x=1794335189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kIGmBf8e1TRHzdHJsTtZA5MGm5kHZ3GW2cmzV+bXePs=;
        b=Vvm87aEbPAKdDu11fpmKAQjjpqsUhNWCggFwnJ8Yy9vszc1oAQhlJwNvEvYCMDq1Cm
         59Xbc5msQCKCxw6lnOW/D/4gV3qIATsR3epMJSNLbRhoQsecRysDXuzPGgkr8kggfhJB
         p1iaauxp0SUOnqYiq0/RV7bjgx1tZ4eAZ8Gmt8i7ZLpx/QoRlF9EvxhAEgw11GlyDZ6V
         ztRs7qoI6+q1cRgfVWv7wnkOFXOBEn8ZVwWVXInKmCPsUOPFGyP6Q5KpVHlTuGACfB57
         aSMaM8cwA2+1lgpgMtYbWwDHXUq/Az5W1/UAonTNDTEGae6+CAepdJCOfEHD8vBwDVfn
         yTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730389; x=1794335189;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIGmBf8e1TRHzdHJsTtZA5MGm5kHZ3GW2cmzV+bXePs=;
        b=eanacHUOWxi2o/yjA5jaT5jr693dTVYUrZ1AKWQia8gVgT/3N+L5C94l6aq1CvNsxc
         Hpzinp0jbEascbdLomwDZO+iWPDIR3nxB5FdS5WNjRXF28hz3UVpqV60L1vFUdfxtx7X
         xeWVs7oWqFQN3ToxDUqKx1xw6GPMv4uxiPyTR84+CoW0L73MIGyWQ5rMorpQCe9XCfaS
         ImI3pZQLCHvOlavCs1kio/Gmmbb57mVZ8mhR5ye4mSXswSptP17s3YGIExVBECL8uTkL
         6hMMHDcVGp+QZFYVDZ7teCgQ6FOEPuVivvqwhmKILXtqmVlJ03p8xkdIStyvvQg3SqSP
         B0Rw==
X-Forwarded-Encrypted: i=1; AKwUvBzsBKsRHSN0MtoQL9R49+Y6rYco0w8FgZzhV4bQjB9pXApYyE8EGSSByYUO+vbrCQiNtv1MCc0Z+02m3h8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SUE6Pitgu5/XTIEDOSOZOj9K1xojmhGQde3nTw/6lJ64O9XWf
	JX07PSEo7ZwkI2vV03oJI5KkmwvGUg//FnYbJKY2nkzPtfQPd81YQ5fA0Bt+IFLeAkE=
X-Gm-Gg: AYBFou0qQrnj96mFzGlJJeOY3wXZE8nCBRtdD9tAYCh+6pf5eUXZfyjoADsDgRnlZYY
	q8YV3Akm6qM9Zi3KRtsThJj1huKt8OokxSZTm37FgK+TQwZBhzpKvVxdNhIFtSLJOrp+xiVu9Vb
	IdlmdCm1S73TIaU/DuZibQeWX49kqM+FxaJiei8VlYV6/kyFQrmtm08iyJyb9Pj92VzC19Sf+AE
	oNgKbe+Xe6o06I6s7CChcm9kUD0qnWaq3lHe+IiCnvp/OoPVTWF7l1fT//aXz87/ea3rJvWWe7i
	VGAGwaZTHtdzfDL47NojbWsLnWa6UGQKEVIsbrtQMg1myIzMoeGj60XH8ux11JPO+oFzjfp3XJr
	odeiKKxaosGYKMMC9hCpmgh588/axiv26EUgW+aNUGMnzpTBn1B3id2Wd/xx/h1wRGTT5dAh0Or
	dScWS9mea4uFDiRLNvoEWEY9gsj5pflrdCUxwOa0h/UDqnomf5wD+sStfOXYVnKnC4GV2xFiDCK
	mznChAz6q17DKVG+xSoCjxZ6GJ6oGnekRDTx7EoafoLIKpZ80/LTRpN9ga+MSE3HIZPaNOulxkT
	XSIwEd+M+P2Plu4C8T/5zxo67iUfPYrrPkTZAYiDPgITGY9G
X-Received: by 2002:a05:690c:60c7:b0:8a8:6fac:1525 with SMTP id 00721157ae682-8b2b67ab45cmr101459337b3.46.1793730389191;
        Tue, 03 Nov 2026 10:26:29 -0800 (PST)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309959603sm2328207b3.24.2026.11.03.10.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:26:28 -0800 (PST)
Date: Tue, 3 Nov 2026 13:26:24 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Usama Arif <usamaarif642@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Yosry Ahmed <yosry@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Chuanhua Han <hanchuanhua@oppo.com>,
	Mani Tofigh <mt4022@columbia.edu>, NeilBrown <neil@brown.name>,
	Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>
Subject: Re: [PATCH v2 3/4] mm/swap: account synchronous swap reads as memory
 stall
Message-ID: <auonUGAjifyuWJDv@cmpxchg.org>
References: <20261104-swap-fixes-v2-0-204be064be5b@tencent.com>
 <20261104-swap-fixes-v2-3-204be064be5b@tencent.com>
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
In-Reply-To: <20261104-swap-fixes-v2-3-204be064be5b@tencent.com>

On Wed, Nov 04, 2026 at 12:18:16AM +0800, Kairui Song via B4 Relay wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> Swap-ins from SWP_SYNCHRONOUS_IO devices such as zram are no longer
> counted in PSI memory pressure or in the swapin and thrashing delays of
> delay accounting.  Refaults of the workingset from zram, the main input
> to userspace OOM handlers like lmkd and systemd-oomd on zram systems,
> become invisible in /proc/pressure/memory.
> 
> swap_read_folio() opens the accounting window with
> psi_memstall_enter() and delayacct_swapin_start() and, per its comment,
> means to count the submission time.  For synchronous devices the
> submission is the entire read: swap_bdev_submit_read() does
> submit_bio_wait() and completes the folio.  Since reads are batched in
> a swap_iocb, swap_read_folio() only queues the folio with
> swap_add_folio(), and the bio is submitted later by swap_read_submit()
> in the caller, e.g. swapin_sync(), after the window has been closed.
> By then the folio is uptodate and unlocked, so the fault does not wait
> on the folio lock either and the read time is not counted anywhere.
> 
> Fix by submitting synchronous reads from within swap_read_folio(), as
> was done before the batching, rather than from the caller.  This gives
> up batching of readahead for synchronous devices, which do their I/O
> inline anyway, in exchange for keeping the accounting simple and in one
> place.
> 
> Fixes: dda8fb68b590 ("mm/swap: also use struct swap_iocb for block I/O")
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Kairui Song <kasong@tencent.com>

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
