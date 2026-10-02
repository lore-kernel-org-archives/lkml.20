Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D64474248;
	Fri,  2 Oct 2026 09:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933591; cv=none; b=TAqsZnh0n8YFQzMWF4BwqfwBB69rb7vJK/npl+ikw+RIgJ10Evd02psqWJNXnqyf93OOHzXTJVmzGJPQi4cWuPJtXDkiRvrbWH1oolRt1OAlP+95rYJxpOSAXhN7fsqz/PMrgZxxsZam4d6L9TShCuZGgdEbeBf8R4geqfEHETY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933591; c=relaxed/simple;
	bh=/4Lvufgl+eaoXdTjJ01OMoMxCTvHaqW4t26h1sWhAiY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=MEo5jwv4lHaRbVqm5zw/9GwsB2AzM9h5tYnZ1rNtA06ct81Ti29+4aQSFkCQDv4ubHnFYgzGMUDW8Ftv6xH+Rbvj2zc37M4N4oD5D5FiYiRFDst+edPT6g/kV2bhk1UtDNICM1m5omv5F8qxFsMQOhrApVD19hUMe0h/xjBuRFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Iv7/WjPs; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Df1zMbFe; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Iv7/WjPs";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Df1zMbFe"
Date: Fri, 02 Oct 2026 09:33:06 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790933588;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U5sSpTkyjTQkJ4EQ6KdcC5lMNhdGTc3lr122zJm4UWc=;
	b=Iv7/WjPsRBqoq7UdC9n0JUjs9XjEFWKXqHmK5kpO+PQAXxOYZJCGYrde8uUVdhOnRJeQuX
	VlBn/8BKriTcieCZRoIXcYfBWCBZSszMoniZcp/Ohtg1WAEwk6uu7uSqkDGYDyRv47BNBo
	PHSiH0qvgp0lyuZUVpD5oZXF4CXYOn+CB3MnlzQ8MBGXEaVfuZcQGEQleO34ylZK53GZBU
	aF5AasYHLgcACNTIM8htpScicQX8meJ2QCua8dqOGWN3Q2vMb9Fs4die116nw0PI5NCi8O
	pu4uX0qebLPvYq7OeChR+1R5lprwR113zOo0Hk92srGfxLVcMW7fkqXOEvVB+Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790933588;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U5sSpTkyjTQkJ4EQ6KdcC5lMNhdGTc3lr122zJm4UWc=;
	b=Df1zMbFeQPQkkrKlAe0TWHtRk8N/Zr6lm+aJYEiwcK7Zm9HEXIUpEUmY5TZFj3OrEkqpnt
	/GiwluC5oyfwqnAg==
From: "tip-bot2 for Luo Gengkun" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] perf: Fix race between perf_event_exit_task() and
 perf_pending_task()
Cc: Luo Gengkun <luogengkun2@huawei.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260920075026.990582-1-luogengkun2@huawei.com>
References: <20260920075026.990582-1-luogengkun2@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179093358676.3910103.1866977705714236659.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     ffb684f2aa141eeb0caa6308422e7e05d1ded7c4
Gitweb:        https://git.kernel.org/tip/ffb684f2aa141eeb0caa6308422e7e05d1d=
ed7c4
Author:        Luo Gengkun <luogengkun2@huawei.com>
AuthorDate:    Sun, 20 Sep 2026 07:50:26=20
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Thu, 01 Oct 2026 14:02:05 +02:00

perf: Fix race between perf_event_exit_task() and perf_pending_task()

A race condition exists between perf_event_exit_task() and
perf_pending_task() during begin_new_exec().

During begin_new_exec(), perf_event_exit_task() may be called, and the
PF_EXITING flag is not set on task. So perf_sigtrap() continues to execute
and triggers WARN_ON_ONCE(event->ctx->task !=3D current).

Since both task exit and exec paths can call perf_event_exit_task() which
sets ctx->task to TASK_TOMBSTONE, fix this by explicitly checking if
event->ctx->task equals TASK_TOMBSTONE and dropping the redundant
PF_EXITING check.

Fixes: 97ba62b27867 ("perf: Add support for SIGTRAP on perf events")
Signed-off-by: Luo Gengkun <luogengkun2@huawei.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260920075026.990582-1-luogengkun2@huawei.com
---
 kernel/events/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 634d2cc..c2882b5 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7626,9 +7626,11 @@ static void perf_sigtrap(struct perf_event *event)
 {
 	/*
 	 * Both perf_pending_task() and perf_pending_irq() can race with the
-	 * task exiting.
+	 * task exiting or exec-ing. We can determine if such a race has
+	 * occurred by checking if perf_event_exit_task(), which will set
+	 * ctx->task to TASK_TOMBSTONE, has already been called.
 	 */
-	if (current->flags & PF_EXITING)
+	if (event->ctx->task =3D=3D TASK_TOMBSTONE)
 		return;
=20
 	/*
