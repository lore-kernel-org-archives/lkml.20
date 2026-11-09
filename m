Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240824;
	b=AwzfwcaN72wsuYzG6JwYOYsQ46yQKu/v+0AX+hmGmJhqsy2PIQlSxnlA19N4Qap1D+ea
	 Qn2kZHmD6EuB+1T61KO7rakz2qMY7/WF46AxAQNCCHttaFsranxvSREDhciN/ZAYWsnP5
	 loLW03qUFVvaFfDXZAMjokoaLKEbZnbxaqN356djxmKkmFkKX0/vQPpnZ9mRvptonZvLF
	 U/72nHmtitGPCSsCTBFrKDcnz/Yi0wHth9ISEDybkPAQKXrfVCQkfnAHAbCQ61zvUvp3S
	 hv1Rw8M5QF0dqpU/5fdKUyfMMLfAznhbeNBQDOMjuEUF85AgsfDOet+DBsBi98hgkcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240824;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=v1vnO5+c8gwp6L0hAfoYDMFRTL5xir/58sfGDjrj6sw=;
	b=TyB/OZC8kHJLQAyRCJLpcGEZcgEQitdnipjFj+2Sby2z829jvfe0YP6cKbJeWisrKmLj
	 QYQsiBWSnrXwiCNqAa0wRf+GA0tixBDenmjGJ310rDValAdmgOi089YUHD5A3PWVAbMwM
	 S8SjhbyCG2Rnr4j9DRl1KdkO881EOImXo5KQbzLv1363W0wToB1Fo2aEZxmLGq+cp29O+
	 0Y8cy4wEgfLw2GZzlFkC6GUCQmnpf99/b4NkO8BWaFCU1PjwpqX1WLhlKhSszRRFViIRZ
	 xmeeqX4z66nwxo9NYOO2ZQ7lMufTD+pJ/dc7kOFdN+2nePXpPrKxFekH5f2yQEmf2vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=brirBYU8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A50606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=brirBYU8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204621F0089F;
	Mon,  9 Nov 2026 16:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794240824;
	bh=v1vnO5+c8gwp6L0hAfoYDMFRTL5xir/58sfGDjrj6sw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=brirBYU8fGiVLbLA0rqqxfnfj/alZ4iC3WUy2+lIYb7Z2QTvHvYArSuqhQwT6wAEA
	 Y+ltj9hieJUc6+cGZTeHBh7Y/pTm4hinXQzaUpuhTtqwP3JivOSWKHdO5rkrNq00m9
	 ieTWfQC7JqSgJbx9dt3IdKCQpDqwRjIeeSdWlbQ44ezH5XfAESBYpSNdG/+GIFxlBs
	 9R/zdk6DXz7rmQc6SSiA2sdfpwuTzEBcOBmu49icNGXWCxhBAgLVJNiJ5knoTuSPKW
	 2w0BqS5FdX7TC2VmdO6TtyVIluST8lOdyrA4D/6dzPuXXw/Bt/Mm5Ey974TRHiBQs4
	 doetVwSCafkbw==
Date: Mon, 09 Nov 2026 06:13:43 -1000
Message-ID: <3e2d11bf898399decdbbb4c96d10ccbd@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v5 0/2] workqueue: Make WQ_UNBOUND the default behavior
In-Reply-To: <20261102110047.115375-1-marco.crivellari@suse.com>
References: <20261102110047.115375-1-marco.crivellari@suse.com>
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

Hello, Marco.

On Mon, Nov 02, 2026 at 12:00:45PM +0100, Marco Crivellari wrote:
> This default is suboptimal: most workloads benefit from unbound queues,
> allowing the scheduler to place worker threads where they're needed and
> reducing noise when CPUs are isolated.

I think this is an overstatement. Maybe just say that we're transitioning
to unbound as the default because, while some users benefit from the
strict affinity and concurrency management that per-CPU workqueues
provide, for a lot of users they don't matter and they put significant
restrictions on what the scheduler can do with the work items. Unbound
workqueues now have non-strict (soft) affinity scopes, so they don't lose
all the locality benefits while giving the scheduler more flexibility,
which helps system-level concerns such as power management and isolation.

Can you rebase the series onto wq/for-7.5? 1/2 doesn't apply there.
a23c7afbc587 ("workqueue: Add support for real-time workers") added a
WQ_RT check to __alloc_workqueue() right after the WQ_BH block. The new
defaulting block has to come before that check, or alloc_workqueue() with
WQ_RT and no WQ_UNBOUND warns and fails instead of becoming unbound. The
WQ_RT comment in include/linux/workqueue.h says "valid only with
WQ_UNBOUND", which may want updating too, maybe to something like
"invalid with WQ_PERCPU".

- 1/2: Can you update the description the same way?

  The WQ_POWER_EFFICIENT comment in include/linux/workqueue.h still opens
  with "Per-cpu workqueues are generally preferred because they tend to
  show better performance thanks to cache locality", which now contradicts
  the change. A similar sentence is in the workqueue.power_efficient entry
  in Documentation/admin-guide/kernel-parameters.txt and in the
  WQ_POWER_EFFICIENT_DEFAULT help in kernel/power/Kconfig. Can you update
  them too? While at it, the paragraph the patch edits is left with short
  lines and can be reflowed.

  In the new comment above the defaulting block, "Do this before
  computing wq_size and before WQ_POWER_EFFICIENT can drop WQ_PERCPU",
  "this" doesn't refer to anything and the comment doesn't say why the
  order matters. Maybe note that the WQ_POWER_EFFICIENT override would
  otherwise drop WQ_PERCPU and hide a caller passing both WQ_PERCPU and
  WQ_UNBOUND from the warning?

- 2/2: Saying that WQ_PERCPU is implied is enough. There's no need to
  list it as an allowed flag, so "WQ_HIGHPRI is the only allowed
  additional flag" can stay with "WQ_PERCPU is implied" added.

Thanks.

--
tejun
