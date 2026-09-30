Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614342F25F3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758082; cv=none; b=lMqISN1AGWHjJtpL2SojATdU9NJzHFeTg6WUILAAWGnj64Fd1eeUi6hNIbDprLYH9CsAgTJt1AhoF69Ov6zGqgiPAMTvaNucNnAfETk2NYXYZIjvUGZy5nnbtXIZod0r443i7x9N9rWCU/RJXfuhQ97rduy1TV+w0b3HKKLi09k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758082; c=relaxed/simple;
	bh=X6Thh2YT8+9Ct2b1BhmXw10QAko2EidJ5329cy+wzFk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HfBEVkDAjFIFeQMjrWguUVdAddi75xbWQsJHoxg/iSxqBrK5fX9B2AvogXE1Y6IPpEQ5iCiKiQSpx+YvIJT4J0p7L6gVeoQdJJg+eIbqN+dfvc3jcpcbLrvxJa0vSpPxQIrWfS5fr6eYiT9m14a5ocDxfEAIe8b7D1rXt1WP03s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ch9aemyr; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ch9aemyr"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C1F3143D;
	Wed, 30 Sep 2026 01:47:56 -0700 (PDT)
Received: from e127648.arm.com (unknown [10.57.52.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 214C73F85F;
	Wed, 30 Sep 2026 01:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790758079; bh=X6Thh2YT8+9Ct2b1BhmXw10QAko2EidJ5329cy+wzFk=;
	h=From:To:Cc:Subject:Date:From;
	b=Ch9aemyr+88r5wZljd1p0U2cxFMdINAnTJaNCrzY/eOTvDhlFYGOeP1q/D06VlRA0
	 jRk5l1dt1D2bQca1kjGRRQoPe3svfPDOEq1dmLBgfYzOvZJqOAe09FP3FhNe9xE745
	 mGRYle+K7Tqr9OSTM4KI0NDjUM8T2ehiRmU9zGDc=
From: Christian Loehle <christian.loehle@arm.com>
To: linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	kayracizmeci@gmail.com,
	Christian Loehle <christian.loehle@arm.com>
Subject: [PATCH 0/2] sched/eevdf: Fix slice protection across state changes
Date: Wed, 30 Sep 2026 09:47:36 +0100
Message-Id: <cover.1790756779.git.christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These two fixes address slice-protection boundaries that become stale
after a request-size or weight change, found when testing a few edge
cases for Vincent's series:
https://lore.kernel.org/lkml/20260921152238.3804392-1-vincent.guittot@linaro.org/

Patch 1 caps every fresh protection grant at the selected minimum slice.
A preserved deadline can outlast a task's new, shorter request, including
when current itself owns the minimum slice. In that case the existing
slice != se->slice condition skips the cap. This completes the minimum-
slice bound from aae2a33ea662 ("sched/eevdf: Ensure that vprot will never go
above a min slice").

Patch 2 keeps expired protection expired when reweighting moves vruntime.
An old absolute vprot can otherwise become live again and cause current
to be selected over an eligible entity with an earlier deadline. Anchor
the expired boundary at the new vruntime while retaining the existing
rescaling of live protection.

For the first case a task reducing its request from 100 ms to 100 us can
receive over 26 ms of fresh protection while competing with a 1 ms task.
For the second case directed cgroup-weight changes show expired protection
becoming live and affecting selection.

Based on v7.3-rc5 plus:

  c72945693b90 sched: Restart fair hrtick after same-task repicks
  aae2a33ea662 sched/eevdf: Ensure that vprot will never go above a min slice
  4bf32ec3327d sched/eevdf: Align update_protect_slice to set_protect_slice
  d2e010082757 sched/eevdf: Handle more short slice waking cases

(Patch 2 is independent, patch 1 follows Vincent's minimum-slice change)

Thanks,
Christian

Christian Loehle (2):
  sched/eevdf: Cap protection when current has the shortest slice
  sched/eevdf: Keep expired protection expired across reweighting

 kernel/sched/fair.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

