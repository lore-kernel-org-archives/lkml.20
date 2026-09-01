Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4D41ABED9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270903; cv=none; b=M6ks20J8fEWXkLXrjxxd4PdAOf6jp7MlJ5JLgWoKtO2RlZSib30JA6zEfX5FxHE0k8OTfCm5CVMumsEVbD07mZzYx8SxbHp4vYLE8ZIjVKajbN2WfVB6XD854Sd1HY/7xuJTCoduvuS3bnQWv4KmEm0LBN4iE4ITZj+jkRSg8hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270903; c=relaxed/simple;
	bh=peaiG4utdtDmiTw+VM51fMGkc99uuU/N1OYIRRJoyK8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SSLdDbKsS65RKCpIQq/mumwQWKYd8DMw6Oke1mOTm0LDF/y5rbChIFa0dY+S1WXXf1SFCX78btcUw2SgO/93w1hDT/9BXHJmd1Rlnzfo7IjHbkOAkT1GbncHcRk2mhSexILEhi+wTZifj5da+XR1l5H4EAIl8rEnfjiUe92/j7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eHCx/uL1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=M7qtZ8HM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eHCx/uL1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="M7qtZ8HM"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788270898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pBedKPjpyAqB3ilM47w1kt238sOX7lz5UOuQTj6NJEc=;
	b=eHCx/uL1kbIUTkYHgK9IUnksVWiQxSfW57p5XssYSI2p3NUP8kxmIZmqv3Gzd/fgyz2oto
	OpWi7+AMEWtOMZo2wB/OBafYDsZ6j9nKynwlL94B6iJO1ADHFX6MNd/qAE7mmf1EMJm+Hr
	mlN/LM9M+QpBIix6Q/b88IiKu9c0dB6mM4lDMnVkAh30dvUWP8STDy0fcREY1ZDrCbjpi5
	HdIKSrHt1Ypvm+SP1LttYT3TxWnq9bIZlvLeAS2Y7DwaT3ni7goMbW5BiX/SfSpUDM3r4j
	Z2gr8X0l0q4sxjqquzdCMgzD/BzZTuaLXusbJZz7QxGvj8DyH/+ESv3r29lRjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788270898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pBedKPjpyAqB3ilM47w1kt238sOX7lz5UOuQTj6NJEc=;
	b=M7qtZ8HMEL68tvpeWnk8CZjTM1iVJnGg1smrSvKuD6uVFTkXpGy+3wCnRbLVYQKe4DFull
	s0LhsAtgSkNAW0CQ==
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Yao Kai <yaokai34@huawei.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v4 0/2] futex: Address two futex-requeue-pi issues
Date: Tue,  1 Sep 2026 15:54:50 +0200
Message-ID: <20260901135453.3121948-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This is an update to Yao Kai initial series. I replaced #1 and updated the
commit a bit in #2.
=20
#1 Was simply missed in the initial commit and never noticed.
#2 Requires extreme precise timing to reproduce.

v3=E2=80=A64: https://lore.kernel.org/all/20260824125544.2353006-1-bigeasy@=
linutronix.de/
 - PeterZ pointed out that doing sched_submit_work() while waiter is enqueu=
ed
   looks a bit wrong. tglx's enthusiasm was also missing.
   Rewrote that bit to only trigger the assert.
=20
v2=E2=80=A6v3: https://lore.kernel.org/20260722085140.1949077-1-yaokai34@hu=
awei.com
 - Update commit message for both patches.
 - Drop the comment from #1. The whole thing has nothing to do with
   skipped schedule(). The only problem is that that rt_mutex_schedule()
   requires a rt_mutex_.*_schedule() invocation before rtmutex is about
   to be acquired. In case it went unnoticed for so long because that
   rt_mutex is usually not contended.
 - Update the comment in #2 to describe the race and why the wake is
   skipped.
=20
v1=E2=80=A6v2: (Yao Kai) https://lore.kernel.org/20260722085140.1949077-1-y=
aokai34@huawei.com
 - Replace the scheduler helper split in patch 1 with
   rt_mutex_pre_schedule()/rt_mutex_post_schedule() directly around
   rt_mutex_wait_proxy_lock().
 - Expand patch 2's comment and changelog to explain why the saved-task
   wakeup covers rcuwait without losing a wakeup.

Sebastian Andrzej Siewior (1):
  futex: Provide rt_mutex_.*_schedule() equivalents for futex scheduling

Yao Kai (1):
  futex: Prevent rcuwait use-after-free during requeue PI

 include/linux/sched/rt.h     |  2 ++
 kernel/futex/pi.c            | 16 +++-------------
 kernel/futex/requeue.c       | 12 ++++++++++--
 kernel/locking/rtmutex_api.c |  2 ++
 kernel/sched/core.c          | 16 ++++++++++++++++
 5 files changed, 33 insertions(+), 15 deletions(-)

--=20
2.55.0

