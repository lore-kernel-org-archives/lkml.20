Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792654857;
	b=2b+284P2RIUOI3dAX3r+xmKHUEshuy2O6PYoc2H67mnfY7GNaT1D8orNj9Afk5EFmtYH
	 Aym9xwOWV9QjlKk1g6ydq1OJQraNgIU/ecm/G5xOs2VXJ/wZBTYvE0D06MLDWHEux0Nho
	 21e9BSJ+d0ZV80HluthhhX6nhWNSeC9+KrcBTCRKvCOyfmoHxUJhanQvEmIPCqEkb1T9Q
	 2J21Jdxf4UPiYwNoPijzDbS6kJvpmgaQm4m8yYCrUXDb8SqHeqJdpAft8sIAI9mHjm8+7
	 9QUvaIlyrTsAok4rMyDZThE1TFLSWo2IZ2H/RBVQObMDHQ/ADXaOHqoetlxmy/MeimQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792654857;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=4jARpRQBZWcUOWsfIpjIUIqYlk6Cs5OUtKbrP2IDK68=;
	b=pSNpamCn/mx8uEYmbtCB0x+4q1W4NsRIX0/QYZZ4QMlyyNJ1s7k5MWkU9qsHQXdNgz9z
	 9TsKnogurWfaTceVGMQIF/2+RReD0FGz0K1y+tdnKox0an7nW6tZBGsCyrN9+bNpTAQBg
	 cJ7NWBGOCluuWj7OSlBd4NGWrhU2y330vuMtWN4V7zovJ2AGbHRKvV/0VEr4Fw52SMNDt
	 iwIO/PyjoFkHm2qUbmn80tFZhelawzCIPxSN0VtYDcqT++hzIkHGH+uICWy9Ctu/pjXv/
	 QPs5FbKVAWfuV5lxjjGbAymni7FyzE6Inq7BzulGZbXvRIjbkq5H22N8OsKq6g5+EIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=QhvPJFEn;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE467606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE467606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=QhvPJFEn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4jARpRQBZWcUOWsfIpjIUIqYlk6Cs5OUtKbrP2IDK68=; b=QhvPJFEnrWDRLxWHkeUGYTr1m+
	E41KcZDVY0LIkCT5qwQY8xcazXGhQuQDRxAmlg2XARB7+Xr0DgCiUb0uo7Z4vI84tEiFTJpGqbUpv
	VFVBoQutPGU7uyc/3yDrYFU/Nbc4Mo1EKVGBksWp7I6YNvNCaEPj5tAjCHpZRv8EkMKp8H3hhr0Nj
	n9tA+H+cT/RiEeLc7Q3PN23+JZfMz4EATzucTESel2iLKeNXqvrVn8+nteIte2HXg8lB+ZUhrMSe4
	KnIzsV/s0mA+kxsui6ISReoEFrqGUo2L7FWxNOu+n/T/+NJ7Z4tO8GLsjK6C8yC5kYY+UonRQ99NR
	1YT2Giqw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnPp-0000000GkUr-3uME;
	Thu, 22 Oct 2026 07:40:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 05291300385; Thu, 22 Oct 2026 09:40:45 +0200 (CEST)
Date: Thu, 22 Oct 2026 09:40:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Li kunyu <likunyu@open-hieco.net>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/6] sched/fair: Introduce the SMT_BUDDY_ASSIST
 feature
Message-ID: <20261022074044.GA4120091@noisy.programming.kicks-ass.net>
References: <20261020083746.37068-1-likunyu@open-hieco.net>
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
In-Reply-To: <20261020083746.37068-1-likunyu@open-hieco.net>

On Tue, Oct 20, 2026 at 04:37:40PM +0800, Li kunyu wrote:
> [Problem]
> 
> It was found that on servers equipped with the Hygon 7447v CPU (Model 7,
> 384 logical cores), migrating tasks across LLC scheduling domains during
> load balancing caused significant performance degradation:
> 
> 1. A low L3 cache hitting rate (due to factors such as non-shared L3
> caches).
> 
> 2. The traversal overhead of higher-level scheduling domains (e.g.,
> cross-NUMA scheduling domains).
> 
> Similar issues were also observed on CPUs from other vendors during
> testing, though the degree of memory bandwidth increase and other
> latency effects varied. Consequently, a series of patches was developed
> to address and improve these issues.
> 
> 
> [Solution]
> 
> This RFC patch series introduces the SMT_BUDDY_ASSIST scheduling
> feature. The main work is as follows:
> 
> 1. Push CFS tasks to SMT sibling CPUs during periodic load balancing.
> 
> 2. Skip SMT-domain balancing after a successful push and avoid pulling
> the pushed task back.
> 
> 3. Restrict newidle balancing so it does not pull from higher-level
> scheduling domains.
> 
> 4. Compensate for the resulting load imbalance with a burst-task wakeup
> path that sends tasks to idle CPUs.

So you're combatting undue LLC migrations with brute force :-( Mostly
this looks like something where cache aware scheduling should help, no?
That ought to make cross-LLC migrations less attractive.

Now, I realize that cache-aware scheduling as is won't help stream; when
build using OpenMP the whole thing is one big process and cache-aware
mostly gives up, when build using MPI its a ton of single threads and
cache-aware will ignore them.

Still, I think you really should look that way, perhaps investigate if
something like:

  https://patch.msgid.link/cover.1787955777.git.tim.c.chen%40linux.intel.com

can help you.




I'm not sure why you're doing the SMT push thing; but there's this
thing:

  https://patch.msgid.link/20261002154415.2270586-8-vincent.guittot%40linaro.org



