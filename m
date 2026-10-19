Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440809;
	b=egOsmJtaaCfd4vGEaMP7dkmMSG5uKcPDdB5aYDnuX9DNDX7h/LbDBhIRxuXqIkH2Hk9g
	 zUfs4GElfolNMEFVDFjm8BuBBU17m1H8EWUSFubHgoXNvICeN2WWE79acVIjbLf6lnAqd
	 AdRyaF1dBu15GiiAyc+AAD0FDabX8tk9bl0LjUTh7bYYUHtS6guA9Z1bZe4XmVEm54bQV
	 eK2Azt1kksPxOSf1lM5wy7LQwUqKDr67GToGnaRQZOhADBk3XGcwICAmWvsCaPBBNXzZb
	 xCfh5h2ISf1OsyU2jdrkk2p2n6H7wcAkx58hjCNN+5Gdo9Kj/n8cbiiHEqikyyhbN3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=33VILW/iOz2Ho7n7DFsaPmdMpjSfqsU0e30Nc2GjpZ0=;
	b=W94jN26wNQuS0+EafciaLIuco8mwZkNEv3hscWJ5ZUADAhUL/1aAsoUEYXL7KoifgAyl
	 pqeQSgaSDYQia/zm+EXDk0b3j1bFMVdz2vrku1lSg+AAKET+X/gw8gffDFJGIJVp8BF+l
	 OyWizz6W+4wlJetGXfTvxiCGgk6VZJ/jg1i7kqAZEKTUR7O+vUSdSiberCZ7chjcOHpWU
	 qoFBG4fPxM6tGGjNweq2lqJYMfUgpKbUd8k5AnAbjg4eWsQsAlNb7hAJY1G7H7zB9hbns
	 n1f8nDWQb8UtFLylqrzi9atlIY9EWoTryI8XPe02POH/30Pk3wc35jlG45o7qLvY1QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=Qw06nLbI;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A81606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26A81606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=Qw06nLbI
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b0c5a64de8so512837b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1792440807; x=1793045607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=33VILW/iOz2Ho7n7DFsaPmdMpjSfqsU0e30Nc2GjpZ0=;
        b=Qw06nLbIl6vgcbPwBJNaM6cguWt+HvtAQKKN8jK+h3l3Tpxby7v/7B1zWmhf+sYXTQ
         quIXO+5TRQpqMi5nfR0qq2KQMZMg1D4Azg2seDePtoylhZOeqSzzs4eO9nryfv5mPFD4
         l7qkR/mmAG0Voijmtar/Yz9AJu3K/uHqoPzlNsYmKHctwaW5T9nGjw5zShcfWHJ2yG2w
         lMHbt1tYYGH7vc5jqT5j/hx5trBryn9+kMmDFhoLDNCYcOFdTm3wA4HdBsTm0O+T74XM
         FHZzGVX1QcPE9Ozg+XNpcPqTJgVonXNosaV3lOrkCn5Wykxs1aTlXXKNTWzSTzpzPXN/
         /Nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792440807; x=1793045607;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=33VILW/iOz2Ho7n7DFsaPmdMpjSfqsU0e30Nc2GjpZ0=;
        b=HZU7jYDktuNMsQT8hJy30BuCwlaqlcOhoOkF00UFlceLTJm8C47PDbYOfXcyb1cGko
         yLUNjCPZOcqH6f3etzgYR9RyOkTBdn7fGuenLz1/N1YzJ02Wlck2nVQlBqvQQcZdcyiJ
         R8zFGCmZcGAhP+LncWEu6RQt6BmaGOgzhJ2WVosNmoBPC6KJF8GX+eMDTV/o7rUmvUON
         GPFonxABwu7mVy1IBBXc1bup14Z4CzjB3a6ZNxDBOXE7QHKC9ixLvnlthH7FlNWjZT1a
         BSJ1/Kq8893wRtSPZWD7K3PV4/Tvyql/fQXmNsemxvhMhkOvFT+ShGKaorvVrnkmcsh9
         2iUQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/HN+8gP4CC4lf57ViH30ADC2iaDzdEx3ybN1FQaIfW5G3DW4If75ZJpwMHu06qlw2i7GKV+887kbecsA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLw2rrH/Gpz0fKal7H8s8Hz8I3jPDxXksCs0EPHYcEF3okoaq9E
	QcxNsjqCC+CdaKzwPQtuk/Emyq7Aectj7BJC/ODlbxs94iPjlFsrDM9ciBZZtgWnhlE=
X-Gm-Gg: AYBFou3Xkzl+A+6Py+WBVJGiWT78BSYHiraWDe3Xq4YEXqmVu3NeJW8eff9y1aPdb7F
	dj3U0YzFjSs9XTlhMxyTm2UrXBdw1EfDIB91QCFR9oJFer7rWixTmIH8xlvL0NM0kqdxtIs/HiS
	iXcVlqtcRK0ZOgqGZz1Ic5RfDGVBaJEMaQe6VhTS7q5Z1bILUp7zO2okEhh/jHNiPW/AjQyMN1Q
	12m5VW1QYMJRrVj5GfDPmKlK/Gwb0AeOyK3fQWRMQWuFqNJF7vByOuNM+MA//5sJKDBRchY1tjT
	JTyrxysssqburEtgDEYYLeklL1rAGEf11GGHUkqWinQoxa7oE/COaRlf2JqCew+EHr7UiWQp924
	vOmNsjpoG8FuNYS247Vo/YneGCvXrCux9NlApXjVCNRz2+Wd/TdQaOCpe/lueiJ6lCJVMvA6RBB
	afX0G4JysBeggxjosgSM7Qj4YrC0RpVHzVHi9H9khQJfKHVLNoZi/yS7BHO0mcAga57YSE9g==
X-Received: by 2002:a05:690c:4992:b0:8ac:e48c:4f97 with SMTP id 00721157ae682-8b1201bff9emr666537b3.24.1792440806814;
        Mon, 19 Oct 2026 13:13:26 -0700 (PDT)
Received: from localhost ([2605:8600:200:1d58:2ffc:79a5:7374:fa95])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b11b8117ebsm4601537b3.16.2026.10.19.13.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:13:25 -0700 (PDT)
Date: Mon, 19 Oct 2026 22:13:21 +0200
From: Johannes Weiner <hannes@cmpxchg.org>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
	akpm@linux-foundation.org, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, brendan.jackman@linux.dev, ziy@nvidia.com,
	flyinrm@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH] mm/page_alloc: let the highest memory node recover from
 hopeless state
Message-ID: <20261019201321.GJ371161@cmpxchg.org>
References: <20261019184850.3427905-1-gourry@gourry.net>
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
In-Reply-To: <20261019184850.3427905-1-gourry@gourry.net>

On Mon, Oct 19, 2026 at 02:48:50PM -0400, Gregory Price (Meta) wrote:
> free_frozen_page_commit() clears a hopeless node's kswapd failures once
> its zone recovers above the high watermark, but only if another memory
> node exists for allocations to fall back to.
> 
> The test `next_memory_node(nid) < MAX_NUMNODES` finds only memory nodes
> with a higher id. The highest-numbered memory node therefore never
> recovers on this path, and its kswapd stays disabled until reclaim on
> that node makes progress and balances it, or demotion is re-enabled.

This seems to be the express goal in the commit referenced by
Fixes:. Can you explain why this premise was wrong?

The patch in question also only added another re-wake event. It didn't
remove one. How can it be at fault for kswapd getting stuck?

> In many cases, direct reclaim many never fully run against a lower
> node (CXL/kmem), and that means its kswapd can end up full disabled
> in rare situations.
> 
> To reproduce, fill the highest memory node with bound, non-THP anonymous
> memory and no swap until kswapd gives up, then free it: /proc/zoneinfo
> keeps showing node_unreclaimable 1 for that node. A lower node recovers.

> Count the memory nodes instead. Adding first_memory_node != nid to the
> existing test would also work, but a count says directly what the check
> means: some other memory node exists.

I don't understand what "having more than one node in the system"
means for re-igniting kswapd on this one node.

Generally I don't understand what the heck we're trying to do with all
these patches against the hopeless state code. It shouldn't be that
hard, right?? If kswapd on a node failed for whatever reason, let it
sleep until direct reclaim makes forward progress, or other frees
(unmap, etc.) put the node back above the high watermarks (which means
enough of the unreclaimable pages were freed to justify a new wakeup
in the future to attempt reclaim against new pages).
