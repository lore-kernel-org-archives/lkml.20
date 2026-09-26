Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622ED23ED60;
	Sat, 26 Sep 2026 15:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437520; cv=none; b=f/mHCMrEuF4tXhJeu2n91SdcN1U6kNXEK5IEi7C+Nhj1XstndpZB7xqcpIKya5zY6/e8XsW0dQH7Sou9xgxdAq8UCXbs9o/rFOzqUPTVcHE6lIWOl+WPJao2MzbE9fYpEK4WJprv5+q2uwuDxRTbvWy/W3EPOdkrKFEnpqEtPJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437520; c=relaxed/simple;
	bh=AGQQRfVn/LZC3bBxbuh5PVzchb9e6YqbQ12CpoBq9ik=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GrthZu6DhyL/NR/wH10QQaUMEiZE9Ua0a831irqh5/OCSaHjsYKI9eNp3SCYPj6bMsGKn6697xEPcQzjtV2urV2CS6yPnV/ialQdEflTGQqA0KEb09OtJtEVgxLlGeelOZ9EmLkzvNUF0aBMSch2hMnHycBUCVgUQBr1OgPVizo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=lklcf0Sa; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="lklcf0Sa"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 49157415B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1790437518; bh=XOKkXjsyVICPpvg/s0jz2mX8l+l7Wcy1CQ2zuJfihiI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lklcf0Sa+O9GwvgoH+jKyAbS2WAJ+Zm/Yc0v8U5Aa8aOyODvCri3CUF2VEQYZ3W5x
	 KQQjuHfDNmBRq6yUNK+x/9UAABKbm5cVGz4LBsOYmH0UiBzfKmrKKAU6xDn6cxHZL/
	 gj311iZaQCeeK46kz4vkVP1hqGgZXzDOx6ESf0dptygS8ounfpV7xxIu5pE9RvY5j1
	 DDn+vE9HkAk4eVV7GqliPwYqiVXLwg2jy4BqjW0OTZK5Pfgc/o4f2SpipL2eekfGUz
	 NntjxyKyf8p93ew07v8G+//BC2MvCDuwHAsr6N5ugeddAOVF8rwBBR7Yb6Ez1gm21c
	 j47lVesS0zDUQ==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 49157415B2;
	Sat, 26 Sep 2026 15:45:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Quchaosheng <quchaosheng000406@163.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 quchaosheng000406@163.com
Subject: Re: [PATCH v2 1/2] sched/doc: add a preemption model overview
In-Reply-To: <20260922083101.99685-1-quchaosheng000406@163.com>
References: <20260922083101.99685-1-quchaosheng000406@163.com>
Date: Sat, 26 Sep 2026 09:45:17 -0600
Message-ID: <87v77s2f02.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Quchaosheng <quchaosheng000406@163.com> writes:

> The scheduler documentation describes the individual scheduling classes
> and various tuning knobs, but there is nothing that describes the
> preemption models themselves.  The only place where they are documented
> is the kernel-parameters entry for "preempt=", which explains the boot
> time parameter but not the models it selects.
>
> Add Documentation/scheduler/sched-preemption.rst, covering the four
> models, how a scheduling request is honoured under each of them, and
> which of them can be selected at runtime.
>
> The overview follows the scheduling request: a wakeup makes a task
> runnable, the scheduler decides what has to leave the CPU and sets
> TIF_NEED_RESCHED or TIF_NEED_RESCHED_LAZY on it, and the preemption model
> decides where that request is honoured.
>
> Assisted-by: LLM
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
> ---

I have applied these two patches.  However: can you please send a
followup with a suitable SPDX line for your new sched-preemption.rst
file?

Thanks,

jon
