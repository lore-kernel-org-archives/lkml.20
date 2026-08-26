Received: from mta0.migadu.com (out-105.mta0.migadu.com [91.218.175.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3D644E64F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787757783; cv=none; b=qwHJWGCmAKPMmNlkhzpzkCMKT6B+5Q0Zq27BRIrtdqKdVgWYSebBt0pYrstADZdnoXVmLRz8LyzvmQwxHeMiwD5vi75ZnZBJ6sFjDfCLu2/gXuQ+6JUfHkvG1eBYrv2rd8P8IewoBcf952K9dj76eUZJvfHnMYFb25KBBHE0RTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787757783; c=relaxed/simple;
	bh=P4CHd4Cs803vM07ydLj0CxH0jUagdT+ydskhHvtX6Og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HmHMCbIroUIV7t8xV8WdGzsKVQBmeBghzmr0CTdTiw9FSnmyVvpgVKOObtRR9ZJtWwuXAFu3+vHewgsJ+LE8abj4SUUReJGGIyT9Hhq4RQVDmIgkaZY9kVVjeA0gJY5LXTr1auVWI10fdusjDf0SmyTgn3AyitbE/dviB/zGsPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WpjUCPWf; arc=none smtp.client-ip=91.218.175.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WpjUCPWf"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=P4CHd4Cs803vM07ydLj0CxH0jUagdT+ydskhHvtX6Og=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787757772; v=1; x=1788362572;
 b=WpjUCPWfK2XqWPA6mfLNkPYrHvFWL0Y4OhdHB4/DqYffqsfxrHJd2VIlRQKSGdbcORiShBCJ
 a6jU1hUMA4VGZqTRHbeK0Z82Yta5yUANQMFPSAJG3/sLXiM2JlD02XuWCa4z5ZzL6DO9/rRzd/u
 NISNt/Ff2SYFWvHxmLFtyR4g=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: from localhost (2a03:2880:10ff:12::)
	by mta11.migadu.com with ESMTPS id 0e6e818bbd641865;
	Wed, 26 Aug 2026 15:22:52 +0000
X-Mizu-Trace-ID: 0e6e818bbd641865
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Usama Arif <usama.arif@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Dmitry Ilvokhin <d@ilvokhin.com>,
	peterz@infradead.org,
	andrealmeid@igalia.com,
	dave@stgolabs.net,
	dvhart@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	mingo@redhat.com,
	shuah@kernel.org,
	shakeel.butt@linux.dev,
	hannes@cmpxchg.org,
	riel@surriel.com,
	kernel-team@meta.com
Subject: Re: [PATCH] futex: Avoid hash-bucket locking for mismatched waits
Date: Wed, 26 Aug 2026 08:22:48 -0700
Message-ID: <20260826152249.1690870-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <0de32be8-7e19-4e8c-b9b9-0ed9a14b9eff@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 20 Aug 2026 19:05:31 +0100 Usama Arif <usama.arif@linux.dev> wrote:

> 
> 
> On 20/08/2026 17:23, Thomas Gleixner wrote:
> > Usama!
> > 
> > On Thu, Aug 20 2026 at 16:19, Usama Arif wrote:
> >> On 14/08/2026 17:02, Thomas Gleixner wrote:
> >>> --- a/kernel/futex/waitwake.c
> >>> +++ b/kernel/futex/waitwake.c
> >>> @@ -857,7 +857,21 @@ int futex_wait_setup(u32 __user *uaddr,
> >>>  		CLASS(hbr, hbr)(&q->key);
> >>>  		auto hb = hbr.hb;
> >>>  
> >>> -		futex_q_lock(q, hb);
> >>> +		futex_hb_waiters_inc(hb);
> >>> +		q->lock_ptr = &hb->lock;
> >>> +
> >>> +		if (!spin_trylock(&hb->lock)) {
> >>> +			ret = get_user_inline(uval, uaddr);
> >>> +			if (ret) {
> >>> +				futex_hb_waiters_dec(hb);
> >>> +				return ret;
> >>> +			}
> >>> +			if (uval != val) {
> >>> +				futex_hb_waiters_dec(hb);
> >>> +				return -EWOULDBLOCK;
> >>> +			}
> >>> +			spin_lock(&hb->lock);
> >>> +		}
> >>>  
> >>>  		ret = futex_get_value_locked(&uval, uaddr);
> >>>
> >> I like this approach; it makes the trade-off much better than my patch.
> >> When spin_trylock() succeeds, the matching path performs only the existing 
> >> single user access, rather than the two accesses in my version.
> > 
> > Correct.
> > 
> >> Is it alright if I send v2 of the patch with your diff above? Or would you
> >> like to send it?
> > 
> > Go wild.
> > 
> 
> Thanks! I am going to try and run this in production workloads to gather data.
> Should be done in the next few days and send it early next week.

Just coming back on this, its taking more time than I would like to setup a
hosts with custom kernel on production traffic, I will update here once I have
something with this patch.
