Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF5441DDF0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792010921; cv=none; b=dWb3198NCdkMwe/Ww2RvlZ7EkRy0WtHZ/za9bywezOSdyIuPt7NxGOqKeiraQo4IgCrL56krlH1pQjrtGPXzYgqAqyjOTBIYihTliiWmpS4XIfUtOXaTErYp08GayFuBCcPKxw4yWiGGZIIipvkwZuL2WqgPiRx50Tk+9dRpub8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792010921; c=relaxed/simple;
	bh=a6PFiH7L2b352tRf/N8+k5i25jx7rFtbXH9tfl6MoAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAlrYhKOJ5wzNqn67r4KOh6kEDS+qnI0vHbGvgpO8e6Uc59Ty9kRh5v9XlKdwP+ZLHvQta92i9jlqgg+SrXgv6jE9ARojMB2/el0MZb4gs7hD6WTpvpNlTPknOsc7ikZ3d5b5NkK0Ai8gwf4iEFFaF7BMU+62d3n9wO5JBxoXtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=t0Q6a2nR; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="t0Q6a2nR"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93e4f0d7d77so145672685a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1792010917; x=1792615717; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G0ZQhgDb/5TZ/dqV2g9qMU0lMyYEMoDn6IfcrysY8YQ=;
        b=t0Q6a2nR77YYzgGMbIqDcCiG+l2r/MWDVAClth3KO6Q5EjfrbigpYMDtDadDcAuDxz
         iXt5bxxjaB+s8R9trSYvMAEndf58lgnCmDUTl6IBCKwFM2k24z4Apc/RPrwhpr/S9yL2
         G20PQK5lBh6ZIELKClhfVYkm8/4FtUU6a9wh1HAzMtEKDHzPBV46D6XNyT2FjfNzQDrK
         eME2IO5kDfcOcXVEHJIxmpY5WGZxeLR72BeS7a7XEbQWAV2oIt2iuwUfo769WpWf6YK3
         Lkwn4B6eWYnKW9MuQg3+zqGIRLwu2VQv+H0Umxhg6bLrWQxycvKSZJENpkBYd93dKg93
         YDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792010917; x=1792615717;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0ZQhgDb/5TZ/dqV2g9qMU0lMyYEMoDn6IfcrysY8YQ=;
        b=kIWtwjvjUtLcyyk7875RFV7fxOMCnJzoeAlWy+W/qUce8vBbzbHYprrvcJxOp7oPEa
         huEQbKSAL+f/m9/uHcf1D/3DaayJSgv+lcww2zIdwgZeepEa5OeBTL/qk7M2U1u2Kz1z
         ZmxsDZnf0RCY5y3PIgmRZ9R+7tfCVjR6TjlEZhAeYcDhUoZDF4URE3KYPwKb0pz9ysl7
         zTwXLLIBWNpZrk433bSVAtOW+2GYIuS0630q53TX9Ts/DGuXOGCRdHTuGOy7Jc2ZwYLO
         GZay/UJiEnrqhNtGrCEbwQnH2L/IIS3hXvucsGrhFaaiKV7j1M9ApPIE0ZvjNz2jQoXZ
         ueng==
X-Gm-Message-State: AFq9FYJMbbkbQMe8YKJ3AErHbQxoqB4+oFMgA3r1J35uiIXMeL5Le28L
	/HvmdCnFAmfSKAgKeelfyZ7NidkURlA1lzvP9n7/liliPkKewsddKy21QIU+pjB8nUM=
X-Gm-Gg: AYBFou0lOjvMytRgWsffOx/Wi/AngsiGaiMOvLu9E5iToN2bg96N99qXsT9LbGnFP73
	h22rZZXZgz2ElFjGj8UmbTXfcNyCAAk2tt/w3YF2fqEZQKcnPsU8kDg1vkckEAV0jwl1j+PEPI9
	PIePATlckq4fs/AT3eNGCas/1RDN3EPECWPhwojBYI/uzsuyP83wHeA43uhL8h12z7Zs/fuKUFk
	OQ560YtDrfenUC7PNNYckPFBxZziRO1QOlEwgir0000/3z6uHWAlvvNOzZkYWA6ak37IlI+Wv0o
	3zW1eZaLEk1tB2IgBJJCFC+jZt2OkZwt14xQbstSCglC5KSV/sS2tY6O4kgHLfsm1gt23aiuD11
	r53chYPVwU4guaOyGQfYcOK30RokK3trm2fh3ukqR3HC2w8r5+d573VILTnXpWNSJIFKUTJYLzN
	zoIf18OhcYJZJjsS5gdFlIqz2gwAfaYpikP6YlVHA/MGR1s3QgBvX+PPs3XaC8vgp/cXxm/JyWU
	V5RuKg=
X-Received: by 2002:a05:620a:1a23:b0:93e:5ff9:a8f4 with SMTP id af79cd13be357-93ec121d237mr2487124085a.0.1792010917481;
        Wed, 14 Oct 2026 13:48:37 -0700 (PDT)
Received: from localhost ([2603:7001:f100:5081:9526:3c0:45cc:5ac6])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5086fe3sm581516285a.37.2026.10.14.13.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 13:48:36 -0700 (PDT)
Date: Wed, 14 Oct 2026 22:48:36 +0200
From: Johannes Weiner <hannes@cmpxchg.org>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>, Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org
Subject: Re: [RFC PATCH 3/5] mm/page_alloc: convert any movable pageblock on
 a non-movable allocation
Message-ID: <20261014204836.GI371161@cmpxchg.org>
References: <20261007021250.1665929-1-riel@surriel.com>
 <20261007021250.1665929-4-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007021250.1665929-4-riel@surriel.com>

On Tue, Oct 06, 2026 at 10:12:48PM -0400, Rik van Riel wrote:
> try_to_claim_block() converts a movable pageblock for a non-movable
> allocation only when half its pages are free or compatible.
> Otherwise the steal path takes pages without converting, and
> non-movable content sits in a block still typed movable.
> 
> Convert a movable block on any non-movable claim, however few of
> its pages are free, so the block's type matches the allocation it
> serves.
> 
> When other pages in the block are freed later, they end up on the
> non-movable free lists, directing more non-movable allocations to
> the already non-movable page blocks.
> 
> Converting a non-movable pageblock to movable is made stricter:
> a movable claim takes a non-movable block only when every page
> is free or movable.
> 
> Blocks straddling a zone edge are never claimed;
> zone_spans_pageblock() tests for a block wholly inside its zone.
> 
> Assisted-by: LLM
> Signed-off-by: Rik van Riel <riel@surriel.com>

I like this in theory, but wonder how this behaves in practice.

The block is claimed, but the movable constituents aren't proactively
kicked out. The next unmovable request might well claim another mostly
movable block, and so forth. With a flurry of short-lived unmovable
allocations, this might explode the unmovable blocks, which will be
hard to recover especially when you raise the bar on *that* direction.
