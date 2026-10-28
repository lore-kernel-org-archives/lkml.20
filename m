Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793179223;
	b=qbnfLGwKez6h2g8bSWBXDP7VxVMb7SgN951tUFHZAVPQaxc4aWI2fkWKNl3dEBQ/jjMg
	 PF+IqnVqo6/0jUHWTh56oKXdkgahjFy8B5A4wxVW2T41eOrpLGM2DuXJC3zH/Mzeq1ttu
	 Li4YWzchrO/My4ZgOzlzkQHnw4IbvGZKo/Na5iIe2WKevR1TJy7oL/TZoUc5jRMNbT5mc
	 3v6cMBUfu4QzUShEy3fhLwedpoa8g1tGM4QSE+fJ5I/IyR3v+C/04UsAOYMag5xtl6hyq
	 xh2blLzOhJj+TvGwquDq9Str0kzC2SHw52jqSg64fe6SAY/jHGVHjonS4ElbY8aUQ8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793179223;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=4ZFHM4+DLjyn47zDsovu4y4A00dH/kf24XvJgX5dD+w=;
	b=pEXJRBDs/uRksRlThk7y+I7lrgN1s+vkMCyenvVWVR6+75Jb2VZFV+aeVIuIIpnAlKmW
	 G4FPA4Y87Sq8pe0rlnTLe2RxsvVYcqfmFvzEAIMp7rhCfn1ZP1eXXxzoejsDetXBCKMx3
	 doxejCWUeSrOU7VG54LXSq3dcOCgRHeSq0gVPRAkUec6MPR0DB7DLhZLKJ8C/oowBnDUo
	 XImzrQKFH/CEWhxJ3tdftkq56bZXw4+KJAN7XRYz0xT6bcMENla5I+7yiSW9p+x7jkcs8
	 mTopJu8reTAJWpI5iYzzctucKpT7my0ucb8AAnyjKQ4dv3h0OT/S9gBfiocQduHj8xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=uHAG3HqB;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B20606A31D;
	Wed, 28 Oct 2026 09:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10B20606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=uHAG3HqB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4ZFHM4+DLjyn47zDsovu4y4A00dH/kf24XvJgX5dD+w=; b=uHAG3HqBdy5czMRd0B0gFKODf7
	xEiO9EmxmA8jDbYlz6b9/g8ePrlc4NeMgIo0P7k07/aHHx5/5hcJFVfbJRREuWZXG28yVn7eBFeNx
	1DN/Egp1H12OBO+Otyc/u2RrO9OSF1v2pjl1fluCLs885s0+Ua8hhOjyexusDFeiPPyskzUdnWPiK
	gSOs/YtbHExKIHNwb7OfIUwnEYeaZKeHB4H/ViBtKLcR1/LX0VL92nagvmTRTmQXZHjHY+kDdZKpW
	luQUeshAZcwlNW5Kc/VZ4xOqFtScOOXV7yXKj8uS+PAwN+b+wjUjHIT2VsH8gXk4BppopbuxL+a1u
	G0h+TG5A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLzpF-00000002RUY-45tI;
	Wed, 28 Oct 2026 09:20:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D1BE830120E; Wed, 28 Oct 2026 10:20:04 +0100 (CET)
Date: Wed, 28 Oct 2026 10:20:04 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Li Zhe <lizhe.67@bytedance.com>, bharata@amd.com
Cc: akpm@linux-foundation.org, bsegall@google.com, david@kernel.org,
	dietmar.eggemann@arm.com, gourry@gourry.net,
	joshua.hahnjy@gmail.com, juri.lelli@redhat.com,
	kprateek.nayak@amd.com, ljs@kernel.org, mgorman@suse.de,
	mingo@redhat.com, riel@redhat.com, rostedt@goodmis.org,
	vincent.guittot@linaro.org, vschneid@redhat.com, ziy@nvidia.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 0/3] sched/numa: refine memory tiering promotion
 heuristics
Message-ID: <20261028092004.GG2668804@noisy.programming.kicks-ass.net>
References: <20261028041253.74839-1-lizhe.67@bytedance.com>
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
In-Reply-To: <20261028041253.74839-1-lizhe.67@bytedance.com>

On Wed, Oct 28, 2026 at 12:12:50PM +0800, Li Zhe wrote:
> This version narrows the series to memory tiering.  The generic normal
> NUMA balancing cleanups and heuristic changes from v1 are not included.

Should we not look at Bharata's pghot stuff first and untangle this numa
balancing vs tiering nonsense, before making an even bigger mess of
things?

