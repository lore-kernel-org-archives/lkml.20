Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64664DAF96
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406890; cv=none; b=ptOSxrsPEmYIAYoAtJYp9XPXvJUPqd3z0xZhw/NGiaK8IuC9leFmdOCrYM8YQlMrEqcBmTwwwhBlhQFff4JWRMxH/4mV7ykYX1Dgnzy8ap19RSiGgT3e+XfIaeJVmwKCz3JGgWsXOKHnckeo4P8u216JgMgyRr7i6wq4cYl/AF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406890; c=relaxed/simple;
	bh=2zFo7X1fruWS5uVCrKKmIgu2IK6cL03ib82vpKLuBSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XYTa7VrhAalXLEPhzQIyHlTnJfzuROIrm34zR6VG79Uc99PSrU9EeQ7iH0ONeAxckO/a+ed54pyU8/aCMsa8RDgBUGOaPMwVhq/+NTCu5jBUWGoETfmCnzNzE5mrpilgg551GocPUjBS81ywp99wdhCCQYtpXeAL4pVoaBEaFEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=CQotCRVf; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="CQotCRVf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=iB
	ErIPAAh/E3uSAfZNPu5b2og9EBbDyPtN4wPVb9F+k=; b=CQotCRVfEKTADvgkm7
	qDRY5SP/Uf7fsaCw6jK+0qOz8Bhl/vkYB0jmzsArh1bZctK4OQ9CExnTfBQVhw9g
	aGO/zUuZwUJD+BwWBtrhabqTMI7mgcyxWwRIP9Jf02UAbVLCNRRfRvw1XqGZgmbk
	Uf6UJ+KojG4ZU5rA6SYk/3xLI=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3fyIj9dVqxNHcAw--.2297S2;
	Mon, 19 Oct 2026 18:47:00 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: hannes@cmpxchg.org,
	surenb@google.com,
	peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	sh_def@163.com
Subject: [PATCH 0/2] sched/psi: Preserve RT poll notifications
Date: Mon, 19 Oct 2026 19:46:57 +0900
Message-ID: <20261019104700.3296133-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3fyIj9dVqxNHcAw--.2297S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF1fWF4fWFykZw18GrW7Jwb_yoW8Xw4rpa
	9ag34ruF4ktry7ursxZw18KFy5X3Z5Gr47Jrs7Jry0vay3try8tFWYkr4UXry7Cr4Skw12
	qr4DKFZIkwn8Aa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRiYFJUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6gWW9WrV9SVl2wAA3d

Privileged RT trigger registration can consume pressure accounting before
existing triggers evaluate it. A separate worker shutdown path can leave a
rate-limited event pending after active polling expires.

Patch 1 preserves registration-time pressure changes for existing triggers
and advances the consumed total after due evaluation.

Patch 2 derives pending notification deadlines from the trigger list instead
of storing a duplicate deadline in psi_group. It preserves pending trigger
windows, resumes active polling when watched pressure returns, and lets the
worker return to idle after the notification is delivered.

Testing:
- x86_64 KASAN/lockdep KUnit: candidate PSI 10/10 passed; baseline PSI had
  1/10 pass and 9 candidate-dependent failures. Refcount tests passed 4/4
  on both sides; no KASAN report.
- QEMU cgroup PSI_POLL: baseline pressure qualified but the second long event
  was absent by 2500 ms; the worker log showed pending=1 and timer_pending=0.
  Candidate delivered the second event after 2004.4 ms; pending cleared and
  the worker returned to idle. Both runs had zero quiet-period pressure and
  no unexpected third event.

Hui Su (2):
  sched/psi: Preserve pressure accounting across RT trigger registration
  sched/psi: Deliver pending RT poll events after polling expires

 include/linux/psi_types.h |   1 +
 kernel/sched/psi.c        | 206 +++++++++++++++++++++++++++++---------
 2 files changed, 157 insertions(+), 50 deletions(-)


base-commit: b99b7f60c5b473d374c68b53753153b4aa9e0702
-- 
2.55.0

