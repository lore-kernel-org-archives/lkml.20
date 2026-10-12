Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE15344683D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792118; cv=none; b=rWSxZl+chnltLvVmgebQBFdD/+ydcIRH+zFrvH+KEbAKo6QlO3NfcU9+y+GYJy7wGfx0j+ZC1f3G+bYy4pZ4x7jf0R3XAx/25gYwl5IpmxSwGDKP6pKaMkGX50AdlrB0kIg2VS0cH/+s9HgjjJlWQ2SUNVhsLY+kAKf+CJnIkG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792118; c=relaxed/simple;
	bh=nzayKrbLed1hClf89bVcalbZU+nMeqhW0sx035qX/ok=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Date; b=VtemP6ka/ms8NAf+7Z+NAdn2yGf2nuf9sgs0Ae0QEG8XPA6Qsw01km5ppCqVlE+d3EqmF5OfbMWNBMTimOrjMDqSQVqhqSrELpaE3U94VPbCluqza2RqEE5Paebqx5z4yp5+0dn4Foo0agu28MOppVNn8v2e2oZ5+BBzAf/8DMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=QecVtWv7; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="QecVtWv7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:From:To:Subject:Date; bh=nzayKrbLed1hClf
	89bVcalbZU+nMeqhW0sx035qX/ok=; b=QecVtWv7ijMNhUX6VePgXkz6ARm5TJk
	34R9RxtAn1KZLj1U3vVxYJEUCfXRFELAlqnnpbAjQxR7JJRviELga0WczjmOarcQ
	cEhDMceqyA25uvQVJlS+hDrLBvWOAzMLKYs8TB8upxXxxUe0dkoFADCHFKVZT67/
	gV8y5nPDeh/s=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wBn_hisk8xqWc75Dw--.36939S2;
	Mon, 12 Oct 2026 16:00:45 +0800 (CST)
Message-ID: <0b01765544ac7b56e065f4b0e3e4a91b@163.com>
From: Hui Su <sh_def@163.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Mike Galbraith <efault@gmx.de>,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: Re: [PATCH] sched/autogroup: Serialize nice rate-limit updates
In-Reply-To: <19b982f8-f4a0-4d47-8f56-0779e691f0eb@amd.com>
References: <20261008064440.240528-1-sh_def@163.com>
	<19b982f8-f4a0-4d47-8f56-0779e691f0eb@amd.com>
Date: Mon, 12 Oct 2026 16:44:12 +0900
X-CM-TRANSID:_____wBn_hisk8xqWc75Dw--.36939S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF45Cr4ruF48WryfGF17KFg_yoW8Jw48pa
	yftr10yrnIy3WI9F1IvF1fJay8ur93GrW5Arn5GrsFya1akrnagry0k3yY9r4Dua9aq3ya
	qF4Utas8Aa1kZr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUNL0nUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6g3dPWrMk61vRQAA31
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> Is it really that big of a problem?

I agree that the impact is limited. The issue is that concurrent
unprivileged callers can pass the same expired rate-limit window and
weaken the intended throttling of the expensive task-group update path.

> That comment suggests we don't want to take any global locks but this
> adds one more? Is that a good idea?
>
> Spinlock looks too heavy-handed for this. You can perhaps do a simple
> try_cmpxchg() and the ones that fails it can simply return -EAGAIN.
>
> Thoughts?

I agree that try_cmpxchg() is a better fit than adding another global
lock. One unprivileged caller can claim an expired rate-limit window,
while unprivileged callers that lose the cmpxchg can return -EAGAIN
without serializing on a spinlock or entering the expensive update path.

The v2 implementation needs to preserve the existing CAP_SYS_ADMIN behavior:
privileged callers bypass the rate-limit check but still update next. Thus,
an admin caller that loses the cmpxchg must retry rather than return
-EAGAIN.

I'll rework this along those lines for v2. I'll rerun the KCSAN and
rate-limit tests and add coverage for concurrent CAP_SYS_ADMIN callers
to verify that cmpxchg contention does not introduce an -EAGAIN result
for privileged callers.

Thanks for the review.

Thanks and Regards,
Hui

