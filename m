Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393674;
	b=FbOkJkIpBLkhdMipVS4+KQg0EvBuVAnGXFpVWNT+tj9EtYtlT+WC4phmfFurQv5q6I4s
	 B35k6qTNexiutXsWRYO4zIvKwF9D7QzTNXXs30uxBhJ2nzVQBG+CKG452iPCuFmfGN3Iv
	 yS+YH/v/J9f44PwDn5D3imAAZDz7KZtIF/WO+F+w97dLqdFr8QGoLEKf2Mka7Yqj8txO3
	 xFl4gbzfVSfiJaxMiUQGKGOWG9sp3nl5L9dXLpceclWhY2NqaPsEBI1G0T/l6Byh/QfWC
	 Hpy11+eeL6UUG9qwDYXgsuuLiHSY8ERR5VAHxAoM9hP+qxZ+JGkqoOFt/iL0PD8falQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393674;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UiKVIuUaGfr1z9c8L1F5Xy0czC5HJ0GORdxdVG2Wlmg=;
	b=ueT8+M3B95V6dcoHPs2e1DdqNfHfEwu2xsn9pOa99MaF/Tk/RhNoLC2BhNw0JOgNXTk1
	 rLiBvfLdNFK+sbFYh1UxLpqHVXeZx7ZdnjBEVYuyiiZ5CwnsOP/nF0wdozce1lVdhcBW0
	 889TT4N7zCx4FevOlKIZZNR3by5ZIpgtjJKmhZ/uQY+Ic0Du/KYUvuSl7ljXHk/qZZbdX
	 pU/NzZkh7dJBEvNCbKrqUIF0CjpvnCPMmsSGG0/fXnuN+ihn2w/9CfgzCa4Dbwhk3VyFu
	 uWjxSBONCjbhW9mQ5AYJnHowdmhv6jZ3Yb9wWa4c9Msn3pxrZY51/HVkiqxhegFVBLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZKwEmnjZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69195606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZKwEmnjZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619801F00A06;
	Wed, 11 Nov 2026 10:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794393673;
	bh=UiKVIuUaGfr1z9c8L1F5Xy0czC5HJ0GORdxdVG2Wlmg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZKwEmnjZMnIXdWvC4jPplrFMr5BlVB6yTCZnoEUcUA3m3zQRCdM5wGDAPCBoAl6fQ
	 qe0HWy7gfYLFtQ5LzzxxgV8aDkagUmwy4z/zmtc0/morS7wIpmvnoDZqr7dA/Ugaym
	 BLJohzZ54C1cftQAZXo+4un4G3AM19V62tzegswD8B1iLzqekDUlSdVC1nMbVVrICY
	 2aLslW2pX27xDiewVSfPBFSwIHg0zq2Dd46cMsBFp7eU6EJhQL7vbBmJKkEZ6h4HVp
	 LNmymtj3zCv8Un/4x41hbXdXkldE945Q06Plsi/T8BCFkv7Gd9EbA1PxFcmv5/HEMA
	 3YSAkwmZpqU8g==
Date: Wed, 11 Nov 2026 00:41:12 -1000
Message-ID: <f9072bc8cfb14ebf3e36d3b555ea1011@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 06/12] sched/core: New rq_{pin,drop,repin,unpin}_lock() semantics
In-Reply-To: <20261107120207.361504499@infradead.org>
References: <20261107115913.261163891@infradead.org> <20261107120207.361504499@infradead.org>
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
Content-Transfer-Encoding: 7bit

Hello,

On Sat, Nov 07, 2026 at 12:59:19PM +0100, Peter Zijlstra wrote:
>  static inline void rq_drop_lock(struct rq *rq, struct rq_flags *rf)
>  {
> -	rq_unpin_lock(rq, rf);
> +	rf->clock_update_flags = rq_clock_freeze(rq);
> +	scx_rq_clock_invalidate(rq);
> +	lockdep_unpin_lock(__rq_lockp(rq), rf->cookie);
>  }

As 02/12 switched __balance_callbacks() to rq_drop_lock(), it now goes
through rq_clock_freeze() and its assert_clock_updated() whether a
callback is queued or not. The scx task iterator calls
__balance_callbacks() before each unlock and doesn't necessarily update
the clock in between, so loading a BPF scheduler triggers:

  WARNING: kernel/sched/sched.h:1862 at __balance_callbacks
   __scx_task_iter_rq_unlock
   scx_task_iter_unlock
   scx_root_enable_workfn

__balance_callbacks() could skip the drop when no callback is queued,
but that's getting too subtle. The scx side can manually update the
clock there too, but overall the whole thing is looking a bit too
brittle.

Thanks.

--
tejun
