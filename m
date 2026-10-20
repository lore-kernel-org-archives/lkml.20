Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792527622;
	b=t5yRTlQXXTeHnl9DyDCt4sFzPEccby64xHaXFcnkL0hxVsHqg1gtNJyjsLG9H2LmQjgd
	 WidXT/B3v4vOlgem52WM3u0d7JHnUxI4McM4RoZLsPxcf+jkloCYcu8/f8iklXYZ2d8Ly
	 /m0UPU9nT63ZpaaIrWFhSTyl0OVqbgw52no1Ko2iRiXiHNbr4UD7wWmcgoOzSGKBZBfk2
	 hej9J1kEoTFCISnPsEaXFgd8X6qvp5tpr+k8ZePLlKdMANPFFqWG8NuBKPJNvWEOpr5Cz
	 RuoINpZdXGGRWMPjaVmVNxn4ljOW7O28nZeEwCzOR8eTc+xX83CKvhhrqzqRZJeKSSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792527622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EPIXAJZkQDCcHbLvbKTfW5OnsdsgE9PbSQDDg/rz3K0=;
	b=nxasDITVyj9tLbg65/mhOG/FTbv2QTfzFutUGn9gsH/B9ppo1UhkVK/7AvZ+vINiYv+p
	 WF01kFSTf3LygBsp0sZMs0r0Fz4FgmpbULS/Dkjuzw8VxbE8UiREfI9VhdgI9Fx/X/pNq
	 ls3VT+bp9RimMIgCgHwxpEABgDt8eHAJ0a6i6IDrhcPaDNYDQsMF3fkgSN6zlYJLN2e4k
	 0tsTS6OlijNye58111uQHy2gNlc3YbqX4UUw1ZcskNmwUk8WFU3NfVu2rWToVxKJIla14
	 EQNrY/iF8e/Dtjrj/ulFhe2+yzobxN1GHKaDdWvRKwSONC9+nz7taY98LxLfnpR3NHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=bOuwAPAt;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B43606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59B43606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=bOuwAPAt
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93f2ed2541aso4883085a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792527620; x=1793132420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EPIXAJZkQDCcHbLvbKTfW5OnsdsgE9PbSQDDg/rz3K0=;
        b=bOuwAPAtKcczF949cnW6uJfDZ/2l/cCmLn+ov2hnEvuK9ipVEuATvir0+R/tI61RoB
         soOQIQDSpc3SvMKXxS/62liN3mKS5xrLoX+NQXjFs9mJhAUUiEyRtHMoWFNLbtO2yAif
         w6RHxusWHz//MD+hoAClMBf+j1tog7m3yLj7ovK1LrQUyrJj7BmY6AVPyqvxVunjQWOJ
         b7hztBmvXapUs26J3IJ4uwI9xOQALKLEgGzQCHa/FxZZjs/TBQrdMWJmEXx5z97AxC4b
         EvR3hnWVutU1HEBTIyUaUPKVr7sjKRa1Zlwr9/ch5CIhG7QFeHShwPbNoAorRWtF630E
         gdfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792527620; x=1793132420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EPIXAJZkQDCcHbLvbKTfW5OnsdsgE9PbSQDDg/rz3K0=;
        b=p1XCqA87nhQUq9ZTz/80V3s7MgHEt5NkKt/27COeCjVw8PVFXzrMjEwKWOlBV9tqpO
         OHDdySbmsYnxxJHuHiNppuIixVc173JHua2Xt+hRRWRt+fk73nZDOQAHT4MIXKhP9JjY
         BPl8o8edOTyzfVPBJIDxfNTcr8hiFL5TjTvp2dk0EjgQqKOvJsjZb+wZ1aaeDm7ogLUJ
         N0oC8nOffnezjHf4BxrGAcfcDdsCVP9YkQYPNrD16ekflZlaUkYUWV8jYdEZYkd+OFBk
         3TaysDwKVaAcEoSGNLjF7E1wwe/HiFaDAoTDrW8kLpFi4oqUAs+CKwNHKcNMp7FAnspo
         JfNw==
X-Forwarded-Encrypted: i=1; AKwUvByiU2ew9qtPsWPRLywEtrIrIwZrWrPHqufd1RoVUBXvnfhWyAZZ7XungqHm+07hXW6DnH5l1p6P+BaA0Xs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtWS8OKpUWz7oqZSkm8BJ8fdYWdRXyQN8etMXN/F0aHr35TBaa
	KYRfrzXKMnx3CD35ov/dOx1ZM5b/LTh2cM9Dqy3CRU9yNLMJAnwNL2kFFn2zRi0iLM0=
X-Gm-Gg: AYBFou36fGEntoRpn+f8eG6pv/z+OzTnHkQRXaK+qoyRz6EXlpaWTrJuXCA+s4IUjuL
	VmWUYC6gUXe17nsG675M/kcOf8SfpWDRLK2elZjOYZuSy+ZBpWAGh2iT2L0KLpUwdub0JNcylll
	rpNiC6X5XRIJqewQNYTX9yQJqsS8gg1UtTBT9b1CDbGuyvxbwYy+qJ4FvY8lH/QAxdMu2Sr5Wd+
	KALQLURhHKLsghFxTVl7fkuLKgPxluGPA0WJCpcuC6aBXdyEsjWdRSFxTXcg9UstgftE8PRSFOP
	7mLGmv/tSpJzQuVTNqt6QMM2Ey5hScDQ7YKQ2ANq9od6iDsftxYJgur0chF2Y0XOkC0F0YcP+6b
	YmBwoc3M4nknEP98VF5oczeB/O/sqaTsz9I0ztmbKs5jv6QIYL3RklzoGzrzji7eJ1XoHO0yA+x
	3yiX0GyPLVF0dZ4Yhkt0lm1o8hWUH5gzJMsx0toWS48eMM8vB4yzohliFwRYzFyFOuvpEgAxu4P
	ZMZI/t7z3lUU0hSDBgbDLQCj0csps5jUZg/4SJNBuI9b9YMzJ8qX4aJE36g1YjAnQ==
X-Received: by 2002:a05:620a:44c1:b0:93e:c173:f690 with SMTP id af79cd13be357-93f57fa664amr59174285a.36.1792527620137;
        Tue, 20 Oct 2026 13:20:20 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56e30610sm68153885a.43.2026.10.20.13.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:20:19 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:20:17 -0400
From: Gregory Price <gourry@gourry.net>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, brendan.jackman@linux.dev, 
	hannes@cmpxchg.org, ziy@nvidia.com, mgorman@techsingularity.net, 
	jiang.liu@huawei.com, Bessel.Wang@huawei.com, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/5] mm/page_alloc: validate zonelist slots against
 concurrent rebuilds
Message-ID: <atfLxfuFm-c8pKnP@gourry-fedora-PF4VCD3F>
References: <20261019172346.3344005-1-gourry@gourry.net>
 <20261019172346.3344005-3-gourry@gourry.net>
 <45ef34c7-eea5-4813-b54f-3e34675697b5@kernel.org>
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
In-Reply-To: <45ef34c7-eea5-4813-b54f-3e34675697b5@kernel.org>

On Tue, Oct 20, 2026 at 05:22:11PM +0200, Vlastimil Babka (SUSE) wrote:
> On 10/19/26 19:23, Gregory Price (Meta) wrote:
> > Onlining the first block of a zone rebuilds every zonelist in place,
> > shifting the slots after the new zone. An in-flight walk can use a
> > zone it previously filtered. e.g.:
> >   - a GFP_KERNEL request can land in ZONE_MOVABLE,
> >   - a node not in the nodemask can have its zones selected.
> > 
> > With kprobes holding the walk across the online, I was able to get this
> > zone/node misplacement to happen consistently across hotplug events.
> > 
> > The iterator approves a slot by its zone index and node, and the
> > allocator then loads the zone pointer from the slot again:
> > 
> >   CPU 0                             CPU 1
> >   first_zones_zonelist(nodemask {1})
> >     slot 0 (NORMAL1) approved
> >                                     online_pages()
> >                                       build_all_zonelists()
> >                                         [NORMAL1, NORMAL2, ...]
> >                                         -> [MOVABLE1, NORMAL1, ...]
> >   get_page_from_freelist()
> >     zone = zonelist_zone(slot 0)    /* MOVABLE1 */
> 
> Since the zonelist_zone_valid() checks you're adding happen before the
> "zone = zonelist_zone(slot 0)" part, I don't understand how they can be
> helping here. Aren't we just reapproving slot 0 when CPU 1 can mess it up
> between that reapproval and load? Am I missing something?
>

Heh, see patch 3.

patch 2 and 3 should probably be re-ordered, or maybe just squashed
together?

~Gregory
