Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27244B487B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788907885; cv=none; b=sCgi1QxAYvTvlExKC3uVVqaIHubUkaXEOkHkPmUpnrCLXbBxlH85fGAOtvKqy7hvtVA5VWcQiEJ87Me2bkiRXBaGapb+RGXwzlk2qnwhLu70Pq8Ju07ppTRosxu3Rlv3qE8DhHYDSIKAi5S3oUcRJF+bKOwCZUnEnnwsTIzrZVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788907885; c=relaxed/simple;
	bh=mJcLXh1i20rimddCHOu0f9bSUNpy/3TaPRammQT9db8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W9Hjzjc9RGLAOP/ihgodhI098CfRfml1DggbnCIdrO7Hz2jDzeqv73duva+k/9Anv1FZdnzRMkON8dSvR3bJkILyCGu737pg51i32cII+V6wU22Lddt278Zq6MTK9ysD+mpkwqC9U8mUxULAg0dtDsia/pXlekJQ70udSHf4Blo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VXpkgp9N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VXpkgp9N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C79E1F00A3A;
	Tue,  8 Sep 2026 22:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788907884;
	bh=HXNzkQIzS9z/LWitnfZ8U4rrIa8CiwOIVwRXMp23imI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VXpkgp9NcAxT6XELD8jLF89obbFAMDdNCz/nCVPrJg2APlNnkTEyeuZSgK1UIF+Cb
	 tKLXvNU5GdZlD3HMQ+aSAsFhn7hg/9Jzl2Pwzh3/pCyImkax65sO6YaNSpuk+e1oS8
	 nF+/s9Utar/YWUE1vlOzA12VP4nIWN7stdIOQ3Yr0iiGyn6LJ39ZrFLFCpaN1fciQN
	 +QeRyn6Uh8/wt+mbma+5ji94q51ZNeMwRdcaSm0/zsPBivrzz0hizj4IOVSgs2wcBf
	 nsTsfz0oa604NsagSIhsfQ0pZ0gKXdjMnIanzFcBKUgdFyyjZZny1dTCNC80HczOl2
	 O6jgXv367z+1g==
Date: Tue, 08 Sep 2026 12:51:23 -1000
Message-ID: <a7ac8aee6a315d4d6465b728d1d28226@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Chia-I Wu <olvaffe@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 Bradley Morgan <include@grrlz.net>, Chia-I Wu <olv@google.com>,
 Breno Leitao <leitao@debian.org>
Subject: Re: [RFC v4 1/2] workqueue: Add support for real-time workers
In-Reply-To: <8b0ea995-8299-4f68-9c06-2350a1d8fa2e@igalia.com>
References: <20260804101925.55414-1-tvrtko.ursulin@igalia.com>
 <20260804101925.55414-2-tvrtko.ursulin@igalia.com>
 <aoILFR3SNYBbMOOz@slm.duckdns.org>
 <8b0ea995-8299-4f68-9c06-2350a1d8fa2e@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

On Mon, Sep 07, 2026 at 04:00:47PM +0100, Tvrtko Ursulin wrote:
> I thought it was more elegant to split the policy from the priority
> within a policy for call sites which only look up the policy.

I'd prefer a single priority value. NORMAL and HIGH use the same policy, and
nice already determines their priority. With both fields in the pool
attributes, otherwise identical unbound queues with the same nice level
cannot share a pool if one is NORMAL and the other HIGH. rt_prio() can keep
the RT checks simple.

> I did not quite manage to follow you here. Was this not the per cpu
> part, with unbound and ordered down lower?

Yes, I was confused. Please disregard that comment.

> I suppose this landed by now? I can see some changes so once we clarify
> the above opens I will rebase and adjust.

The shared allocation path is in wq/for-7.4 now. Please rebase on that.
Per-cpu pools are still separate, but RT can remain unbound-only without
waiting for the rest of the unification. Converting the shared priority
field still needs the corresponding updates to per-cpu/BH initialization and
priority checks.

Thanks.

-- 
tejun
