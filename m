Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126118;
	b=jWjoW6b4qmS58OmpKfHuJpShEA/OfILlHY2ddOVhOegPrKhmOPdrhqQeNLjbOV05Xiwj
	 DQB3YS/IOrMHnFO1RKbQ6AWJd4lYAoitJsLbjnihrUILvxzfaRSWOGNu5rtFpMoPJPK6Q
	 xlblP5KEczPJxhvGpWKSEQWHU8WfGih7hPh7AGDp8zsjgfdM0nucN//0LwqElVi7Fb2yT
	 Zn7t2KJh6+IsVBHZ5ZOOMlZZFO5UOa7fJ/r4pLi5wM+QbGIUEf70padlK554lu2i+lyDM
	 HqwhDirRXpamSU+Wroj6/e11a4ctYT8yG5M6DY2b+F5/p5PrwiWcmUcDaoP9tVjQUOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=68JN5QHnKCq47WQPiHLxuMujC+xRd0JDDXBuUw27i9U=;
	b=UxWnOeO5CQokoQV1Zf2E7KTxU5x68rGWRh0WRHL5uMxpb7tAPNv6TKHHtF1O6wW3AzhB
	 HMt80ZfsNgFT7JO7DHyBbv1LHD6NUM4aeuBypHg4gveiWTnks1snNmBc5KlbSenaYuq35
	 ZXgt8zsdU/XAlsot90lBUfqtz0uRDNrp399FhLTUe8SWvdmZSiMgYER5RBhBfy3zodyFV
	 sM30tZImkfi0ytwF2sURYw+tVBDycEe+VH/GTBV8xVB3q/OmxlLHdtnR9x7EGnUYlnPJf
	 MfZ9GCLW+eItbbY2jGaLL1JZcgRuzqhKyEg787Ttjiu2KTUpHK/jBGyzjN8VgidH9MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=XjXswNiB;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BEB606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87BEB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=XjXswNiB
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91c7a0c1617so3432926d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793126116; x=1793730916; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=68JN5QHnKCq47WQPiHLxuMujC+xRd0JDDXBuUw27i9U=;
        b=XjXswNiBaIyM5J+Wi10iG9bo3DMCBqtsjjRzQ3+VJAHwHozZCeZhZVKP5aLVdWbr++
         wD4OQDUrriX98EzsAlx1DKUCa2e6QsCm32wWkRAdkw2wHc1UexYGdJx2loAbTJXpp1Ch
         cU3NzJvsFzkLA2LuRlStfTDLf6HInHnV75Yu5btykVHVTmL1pFoh2nZCV6HIPtWd0ccl
         cNgYKAt+HXGs1k2xaop8NzFkI3zVJlbB4LGR0e4K2M1GHuR/01HGA5RF8Ovkvta7g01Z
         tJUEa1aEX8e/W/eXgzGfAEFeaY4ULnFvjLa8NZNRwtpE9DIagMGV/7lS65MrkiEDeH5E
         xcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126116; x=1793730916;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=68JN5QHnKCq47WQPiHLxuMujC+xRd0JDDXBuUw27i9U=;
        b=qtyyPD6j8NB+KMruEMZwpu1WXb9uVTK91jAsknfnmPs/J8BGdlNs+QURHGK5wkHqQc
         LYPr4A/NQBTxowraZmveVIgIU4tIkf84OjZNdRzQfSskkbeV/746tHDi5E0wM3fPYWls
         HwsItG/uW9KTC7ZM5DN+kF51QJfGaTpdfOcPTfwPIykCsOmeOhLJMNYY+bRVzzfH0EWB
         xwYt5+azPnZDV925buYunScg5DrjHgd62Oij+CYHLk9DP48/cF9hLlDukkHyC5iAYnlK
         oaBkr+ieXa8ORgPjh5QIwSSiSeAhSuCJCoGGSaq5JRc/Buz944DBKriytqOj6H1JPyF7
         g67Q==
X-Forwarded-Encrypted: i=1; AKwUvBxwQRyvoRzZBhToFSTwbQGCYGQZcEe3zjctN2SNv8Hz7hA/B6ptxzCInQeauKdslQjPt4mbtR71PV2WdZE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwZ6cudRpk7VKB/nPssjOPVwtvrPjKVxdXORMAhjz7IAwx2hKX
	6y1HtXEsyI01/K9njiEezXsw6ksJVIz0OqWbHz0gmhyVEakVn0qBCN9qsSwOMGc1JiMCJNeGBF7
	7TblMHrs=
X-Gm-Gg: AYBFou1UDgRYM2crzyN2poAsRFl0QZgm4YBMSvcMWYqTPiTgq4nWeBfaS2ciic9U43E
	I6zUCJRw6ireAT5ro6LYwaDPmyI+gF2VJcoqsa36eqeqi4BbuTgpcponZHhwsItue0ryvTCv1Qo
	YEBi4g10x51Tju9XiE8o7CqukriFM2TiAIco6O2jintzKdzxJUMLREi0FcGzB5gMKRKJj+8CqKQ
	NH8f2WCjw4J0T2O9cRjIR+yND8vcQ2/Ugc7S0SLt5QqpAPAWGleLUiFrjGaARJPvdSUtHmb9It5
	Mw1rEFF/iIwbSZVrew7GCKWv0scGJJQly/aK+H11a/U5nu5FSwB1fOZFxoez7PUDtlTuRtekfAE
	xl5vU+BxtJ6dgWBUaUhcV96KYBOzbu/LzVghe+WCkBGfs20Ms5rT+HP+EbPZs7OMjWTY0kTqy3r
	x7P0K1L2KPjphZz+W21hg7iHnfMS+MK0rs6rnnJZF/x+Hgz+hd+0z3ACKgX7uTCcX3KpPCQHs/c
	EwFCTUQw/YDyKplnaRWGJWuzjYFuH8A3varzPXRXXtsDZSvuwjRFZWWJXTx9jfvLIW5RHXa0nbz
	CWvYdL22r2VdS4BVzFuPFehpsGgOvsUJxD+lPJP1eenIert+
X-Received: by 2002:a05:6214:4792:b0:91c:6d83:60ed with SMTP id 6a1803df08f44-91c6d836156mr52476076d6.55.1793126116366;
        Tue, 27 Oct 2026 11:35:16 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c0ffd4sm110412956d6.16.2026.10.27.11.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:35:15 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 5/9] mm, page_alloc: pass zone pointer to
 trace_reclaim_retry_zone
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Brendan Jackman <brendan.jackman@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, 
 stable@vger.kernel.org
In-Reply-To: <20261027-pgalloc-ai-hotfixes-v1-5-9c7d1aca801e@kernel.org>
References: <20261027-pgalloc-ai-hotfixes-v1-0-9c7d1aca801e@kernel.org>
 <20261027-pgalloc-ai-hotfixes-v1-5-9c7d1aca801e@kernel.org>
Date: Tue, 27 Oct 2026 14:35:14 -0400
Message-Id: <179312611485.3837667.16073234237109614963.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-27 16:46 +0100, Vlastimil Babka (SUSE) wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> should_reclaim_retry() walks a zonelist and passes the zoneref pointer
> to the reclaim_retry_zone tracepoint, which loads the zone from the
> entry again to find the node.
> 
> Memory hotplug rebuilds the zonelists in place while allocations are
> under way. When a zone in front of the zoneref entry has become empty,
> the entries move up, and this one can be the end marker by the time the
> tracepoint looks at it. zonelist_node_idx() then dereferences a NULL
> zone. Short of that, the event can name another zone than the one its
> numbers belong to.
> 
> Pass the zone pointer instead of the zoneref pointer.
> 
> Fixes: d379f01de095 ("oom, trace: add oom detection tracepoints")
> Cc: <stable@vger.kernel.org>
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

Similarly found separately and tested the fix.

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Tested-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

