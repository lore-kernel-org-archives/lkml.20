Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23251DED4C
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788019913; cv=none; b=L2++NaSaQKlzucZqjcVTq8ujFgazFY8vxsCB1mBT4tPYzUODyxO363JkkeDnF7oPXtdDybMkwiWXMzsxO+n8OxDWzaeb1U25osp2TLXNeY20jj5p4Ng5cNc+xJcHh0RgWwv7zVjx5jmecviOewkXZlNIggSuZp6v79xu4XOzt0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788019913; c=relaxed/simple;
	bh=4gwz04zhUP3e/9yXvTkge71pTUX5ByxF8VTCtqiVkeA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YseXySawvdxXMtaobqOxykk3qB4cKsfNEepf+nr/djAtTdSIHyIYkAHvFjgOie297xMHNnwBuxRPJxLd1oGLfd369rbuCGAK4Eyhs80J+O9y04R9HMDsevgFfZR+iF5tyzmYQpycSR4XOnf7DAVkTPL86lEnkD9k5RNIiuwzOX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=grrlz.net; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=M2Tw5Enl; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=qLHPMG8N; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=grrlz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="M2Tw5Enl";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="qLHPMG8N"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1788019909; bh=fylqSYnNVNCXBa+n4AroSEQ
	Q4EZcnWRgwPFOcoMNyrU=; b=M2Tw5Enl65g1hAiTK3XmLW0ccjGbsvCvyndLhhCZ8l3douuLow
	nerhcNSnViA/S7N+QYTJVaG1o3jQ/qgNefcI3TIpJv+0HQ05cHl8obo8O3qCqVvhZHYhfoplVbm
	No7VzrOYZce+yfNzRqF/ifcSRRZ+/2EW8OL/22babAdMIrrCphiNn4W4ucJaXJiZr+4ScvozUOm
	923RjGuYReO++HRFfLTNEFPvHEtUO7kRO9dZt31jwpYElh6uVOzddWUS7m6wtyY6d1K9VUK4zst
	55a1tl6j9zgml3lRxqn16HbKQuNFb1Sql2oSKoEtrJJsTj5yukwZatiME0u30NLuAIw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1788019909; bh=fylqSYnNVNCXBa+n4AroSEQ
	Q4EZcnWRgwPFOcoMNyrU=; b=qLHPMG8NviyyQP57mrhf8dP9viqBy0p+K5480L7OtyXy6Ni3EH
	yrquIv1Jf9OrioLRJbM+ja7C8hf47fPMZ8Bw==;
From: Bradley Morgan <include@grrlz.net>
To: linux-kernel@vger.kernel.org
Cc: brads@mainlining.org
Subject: [RESEND PATCH 0/5] kthread: remove worker->task self-assignment
Date: Sat, 29 Aug 2026 16:11:50 +0000
Message-ID: <20260829161150.16301-1-include@grrlz.net>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bradley Morgan <brads@mainlining.org>

Resent as a proper series with cover letter. The first send went out as
five separate threads instead of one.

kthread_worker_fn() has carried a FIXME for a decade: it assigns
worker->task = current because the old kthread_run(kthread_worker_fn)
callers never told the worker what task it was. The new
kthread_create_worker*() API sets worker->task before the worker even
starts, so the self-assignment is dead code.

Four drivers were still on the old API. Convert them, then remove the
FIXME.

No functional change intended.

Bradley Morgan (5):
  media: ivtv: convert to kthread_run_worker
  net: encx24j600: convert to kthread_run_worker
  tty: sc16is7xx: convert to kthread_run_worker
  cpufreq: schedutil: convert to kthread_create_worker
  kthread: remove worker->task self-assignment

 drivers/media/pci/ivtv/ivtv-driver.c    | 11 ++++-------
 drivers/media/pci/ivtv/ivtv-driver.h    |  3 +--
 drivers/net/ethernet/microchip/encx24j600.c | 12 ++++--------
 drivers/tty/serial/sc16is7xx.c        | 17 +++++++----------
 kernel/sched/cpufreq_schedutil.c       | 14 +++++--------
 kernel/kthread.c                      |  7 -------
 6 files changed, 21 insertions(+), 63 deletions(-)
