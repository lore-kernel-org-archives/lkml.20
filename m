Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FA419CCF5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256417; cv=none; b=M6lStq8LCPtFZzaJDdBX4mcVXvDq0gjD5dRXnJLiV9/uLZMKgiARKDsRNM+n0qB7JnX5nguhG62qcTn5XZm1NgFRzpJpPrb/xaabMTsg98EztVnH1OLftbJbgE69zbQTGJVePIcuCgufhHAf46GkHNMseIGFx4vnmCc2glO10aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256417; c=relaxed/simple;
	bh=+D+Plu4eVSlvmBB7xj6eNzA6DXJKW4rXcJ4lhz4mkZU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QTVRdTsFxNMsmOax24USdloQNBhxiZsfAlh/UC+jsDZ2Tby7fNkUqsJJ0HMczxLuMmkApM3FcLUBq1b/OxH9KQ/rv1vf2bglpJUbhgpYRQcdHSev9uiq5TziyRzu8JmPspNkOqTxkK41CV6q/rC0SMCBulSNTBhDLJ94KNW+8QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1M1/fR0k; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZNBlNd+g; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1M1/fR0k";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZNBlNd+g"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788256413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+D+Plu4eVSlvmBB7xj6eNzA6DXJKW4rXcJ4lhz4mkZU=;
	b=1M1/fR0kPJyx6pBb69WGovbkJeUXGeGPnTsVuvhshAQfFclazt/PO/vSVoUK8u23jwYx6M
	/kJokzKQUtuRl/62+Tx6RCufRp9KM/O7JyImVH1zok0ZrIQP0y9YxQpOZa/rqgJJlEDQw+
	4p1Ev49wEXzPr8c7fGoWJ2e8xYxDv0h5EpvTyi1v2YGCNVrhjGkXbe1QcvEITQPfn0bBes
	O3Ij9U3fOCNp4pYoLhi4y4YRtn7uUXiWm49/BkbUE+Hg+H3/uNdHhMwAWdeFeH330/WWSS
	qkbE6AKgDqAMtjr3WJkvO/DTZOC+3r/26e1xdK1eK0d44/Pk97Wln+6j0ihLoQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788256413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+D+Plu4eVSlvmBB7xj6eNzA6DXJKW4rXcJ4lhz4mkZU=;
	b=ZNBlNd+gysbXeLD7nVkW63cmC5dI37uJ/fuOYjBzMfsCXPQyiLffIabtok+2pntVA/WXnp
	mCHGmGUFLyhG51DA==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Jon Hunter <jonathanh@nvidia.com>, Thierry Reding
 <thierry.reding@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Thomas
 Gleixner <tglx@kernel.org>
Subject: Re: [PATCH printk v3 2/2] printk/nbcon: Change nbcon_irq_work to
 IRQ_WORK_LAZY
In-Reply-To: <20260901093245.344455-3-john.ogness@linutronix.de>
References: <20260901093245.344455-1-john.ogness@linutronix.de>
 <20260901093245.344455-3-john.ogness@linutronix.de>
Date: Tue, 01 Sep 2026 11:59:32 +0206
Message-ID: <8733vt8fhf.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2026-09-01, John Ogness <john.ogness@linutronix.de> wrote:
> Change the nbcon_irq_work to be IRQ_WORK_LAZY, thus not raising
> an IRQ upon irq_work queuing. The irq_work is then handled on the
> next kernel tick. This additional delay is acceptable because
> nbcon_irq_work is only responsible for non-emergency deferred
> printing, which is delayed anyway. This has the benefit of not
> needing to raise an IRQ for each printk() call.
>
> On a side note, the Tegra20 and Tegra30 platforms can hang if an
> irq_work IRQ is raised while entering cpuidle states. This problem
> was reproducible by calling printk() while entering cpuidle. So
> this change also provides a workaround for these platforms (as long
> as they are not running tickless).
>
> Link: https://lore.kernel.org/lkml/f3757a75-0ba1-4558-bf57-f19ab7e59a4c@nvidia.com
> Fixes: 76f258bf3f2a ("printk: nbcon: Introduce printer kthreads")
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Sorry, I failed to gather the previous tags:

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>
