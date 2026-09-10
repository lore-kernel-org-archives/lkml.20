Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395CA44A403
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046319; cv=none; b=MNWt1t7zvuHUG5Y83VjfAJrPyaUSqxq7w7GPz1e75KKU+CnIJYSCP2MMOA1PKtLQvmDNJhnDGrJdzyYIyAXDhpzKZ+DXkinilWsGWMLHYJsnFm2DDyixnmIFZYNb1EgWcfnQB88LjU8BJrnIWNrO5k6Nt9Goa1qVA33B59QUB8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046319; c=relaxed/simple;
	bh=uXETCAtUxRcwtJd3jNcHuJEuUYTBLBUg3mXBPOuaCp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tdum+TSt0DV6txyBswkb8MR3x3uf5ZbhqOEzQ2veb7v7qIsmAL/VhlpsXfebnUfDIFmUwiM2Zhnx4wjdx3mBohahZE5uN/A5BHqR/a1svQLGmlUvsZGhVqGR76V89Xjtmgx1e+4NbzZ8ltgumJq4N/i2Ucoo/8R3HcJOthC/1/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=GZTI0bzr; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="GZTI0bzr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Hr
	Ct4li0BwNg4FRzlyX/LRT6vaNhJGEkE+t5BVt1kfg=; b=GZTI0bzrpIWSfpyIOq
	XlEh7e2ZEcmD+AO/UVX05XupDBnJ4PLFS/xZdaOaLTMFui96YXoETahsD/1ox5Ws
	NKOQ7MNIYuZQ4s8x6llVWqdKWVb2zjUob0oJ3e6llyXmXYbU9NXxdicjXyKvqjWe
	1TVisvfnVhByJ8x7B85HQGMpk=
Received: from deepin (unknown [])
	by gzsmtp2 (Coremail) with UTF8SMTPA id Ms8vCgC3_0XZraJqxb4TBg--.990S2;
	Thu, 10 Sep 2026 21:17:14 +0800 (CST)
From: Ziran Zhang <zhangcoder@yeah.net>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org,
	Ziran Zhang <zhangcoder@yeah.net>
Subject: Re: [PATCH] sched: clarify ptrace's effect on task_struct->parent
Date: Thu, 10 Sep 2026 21:16:56 +0800
Message-ID: <20260910131656.7470-1-zhangcoder@yeah.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aqKobFZ_a_Nvj_Wi@redhat.com>
References: <aqKobFZ_a_Nvj_Wi@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Ms8vCgC3_0XZraJqxb4TBg--.990S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: x2kd0wpfrgv2o61htxgoqh3/1tbiNRvkpWqirdtMHQAA3A

On Thu, 10 Sep 2026 14:54:04 +0200, Oleg Nesterov <oleg@redhat.com> wrote:
> Well. Not sure this comment needs to be updated...
> 
> Anyway, this looks like overdocumentation to me. Perhaps just
> 
> 	/* Recipient of SIGCHLD, wait4() reports: ->real_parent or ptracer */
> 
> ?
> 
> Oleg.

Agreed, the long form is overdocumenting it. I'll send a v2 patch with your
suggestion.

Best,
Ziran Zhang

