Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB2D4B44C7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829549; cv=none; b=lJG1RfCvKnyzOeYNYO+3Io+87NVe8C7hGPXCqpjcbXf+fKZ9/mJNON0sMd390w6Pm6zGeZoD5z+qTDQVuKS95WhT/4PVhXQqBBM2zULwVqWlzfrxvZEl8yfwT9ajmd783eqvXI62Rj1/3SLOCBzMdpTF/C3yYGizwsRd7CRrGuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829549; c=relaxed/simple;
	bh=VV9B0quQC0vnYg8lPUKY8P7CfU5mhpyJAmZtKD8vso8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=Gc+UF+4yKl3270QGlZWpMBBZBHcKRkW95zKF6jQdqaYlEUiJh1hE+Fl9hd6Br3N8f5rHRAjWLBtcgSN2WE+wpl6rQne5/5Okez3wdjIucyAPN93bhqi3550GKy4QeXxWLNkFsN5t0viVimjjs4ZAmCBT4sVTaB0x+HFqnoGhwUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZOg8Tdw4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZOg8Tdw4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D356D1F008A2;
	Mon, 12 Oct 2026 18:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791829548;
	bh=cN/1Ibo/BGJkFECWHysuohSCByy3I3nR0KXPKPwCc/g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZOg8Tdw4eIwnWFHh0o9GaPAoP2u6DXTGU8rH4dN8I5U32VpgKw1A1Z6A/UIGroSlL
	 pvkQO4q/JNf8sTiv0N0kT9xKHCnpFjQceDIvjXWYquuifBoOfOxCLGVJecIlOZMbOY
	 NCk+jVrflm6HKBl0g3fBMCTVOM/TPrTWssMk8Kna4DveqaWu3kcI+3Gv4OEDQB6Xuo
	 WD6v4tlKtVcvyl77kKRXTNVUFZ1PR3Ze3X87BJ9BqEbupU6PD2LDpTckA+YEdabX07
	 xddYEvhKSvOnjv1FIrTJ8i1oNx/VyCZmO7HMIFHs8dHTnR4VB6ynSytTfDuQ4tio9l
	 3wzVtmcx3Sing==
Date: Mon, 12 Oct 2026 08:25:47 -1000
Message-ID: <4a5abe9a312053d13afde2704d0b7061@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, syzbot+8922e6b8343f70be92e8@syzkaller.appspotmail.com, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] workqueue: annotate the lockless nr_running read in need_more_worker()
In-Reply-To: <20261012143605.281358-1-ngocthang2710.1999@gmail.com>
References: <20261012143605.281358-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello,

On Mon, Oct 12, 2026 at 09:36:05PM +0700, Nguyen Ngoc Thang wrote:
> Subject: [PATCH] workqueue: annotate the lockless nr_running read in need_more_worker()

The read is under pool->lock. The lockless side is the increment in
wq_worker_running(). Can you fix the subject?

> The race is benign: nr_running only goes 0 -> 1 here, and a stale 0
> merely causes a spurious wakeup of an idle worker. Annotate the read
> with data_race().

The increment can also go 1 -> 2: a worker sleeping in a work item wakes
up after kick_pool() woke another worker which is now running. The reason
it's benign is that the only lockless write is an increment. Decrements
and the reset are under pool->lock, so a reader holding the lock sees
either the old or the new count. 0 costs at most a spurious wakeup.
Nonzero is correct because the incrementing worker is running and
re-checks the worklist under pool->lock before it stops counting. Can you
update the description accordingly?

> +	/*
> +	 * wq_worker_running() bumps nr_running without pool->lock. A stale
> +	 * read at worst causes a spurious wakeup, so the race is benign.
> +	 */

This duplicates the comment on nr_running in struct worker_pool. A pointer
to that would do.

Thanks.

-- 
tejun
