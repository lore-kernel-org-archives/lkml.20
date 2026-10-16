Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAA741DEF4;
	Fri, 16 Oct 2026 07:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137342; cv=none; b=KsGJNS2a+rdKdNbsrwRYm5OlUUCQuXSqUolTJa85U4bMshY55gJ8ewp+spabPHmMkkNCAln+GP2ohWs75ZQQTf3lwzGvvLFwRa7gz347rF3ajz2pC9nKUBi0jdiRvFW/ftIkRY0P5Fos3jJoZS7S9lOxFFe6CqR3kEsvMaT3NLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137342; c=relaxed/simple;
	bh=2I0t0yJeRVx4k3vZF1wdCH/nHgTInmX8Ne+O7ZmUll4=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=GW+Y/EAAu8RPDWFmdkHKmSMJpYqtSqxT6pWQDW5/QHRrdBX0d+UHWk6d5lddGdcUOdZqwP1KwXU+0P+R8ZSjDVxDO5tqSAzXRFudh0bIiGFF3XCUe1hyPJYtxakd6H/TUH2eT2CEg4GjId62QRWOUA28588kCfW1ibg7IuPZjAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YhS3NUrV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EL5dpLpp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YhS3NUrV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EL5dpLpp"
Date: Fri, 16 Oct 2026 07:55:34 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792137336;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zqS+nMo3xeXTPck9pXUq2BmDH2uRE+Iw5ccvJGCGlfY=;
	b=YhS3NUrVbvx9Zva3b109fL9ScSdV4kyoqqB7B02xLtXB762NTfwTKIT4ateMBMmDpri1jo
	NZOCqfHeFZUvJptFq98InD+yOkgCOw/ia7fQZNJKQkuBoCQYF6HcSOmQU+APeb8Z561oDb
	czEuiFNmRaZqhN/73AP6qGVyT312E59O5Hqtvik38jFafW6l5iveKUI7hyqWWzj6y4IK+9
	Ll6kcoHJZKVEP0qc7xdVcfpGal5WahjkuLHXLm8NKXK3Th++x4PttaMtYZPgSNK7x241K2
	reAP3pikBAvlS9/POMn5U08JDm/8D438gEfwcGTYYZbUM3IosANperG3WLyxEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792137336;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zqS+nMo3xeXTPck9pXUq2BmDH2uRE+Iw5ccvJGCGlfY=;
	b=EL5dpLpplUV2CbVUizj/v9YfYiIq4V6KjZtOrk2+qznNsj5y/IQk6g2HwiF5pGBU3gRI/U
	PjMorhS4mfw36PCQ==
From: "tip-bot2 for Haris Okanovic" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/urgent] perf: Fix perf_pmu_migrate_context() leaving events behind
Cc: Haris Okanovic <harisokn@amazon.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261013185603.1347265-2-harisokn@amazon.com>
References: <20261013185603.1347265-2-harisokn@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179213733440.2666988.10746007703349764375.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     e76b36b4be7160eaa14b416681e548b125702395
Gitweb:        https://git.kernel.org/tip/e76b36b4be7160eaa14b416681e548b1257=
02395
Author:        Haris Okanovic <harisokn@amazon.com>
AuthorDate:    Tue, 13 Oct 2026 13:56:00 -05:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 16 Oct 2026 09:49:01 +02:00

perf: Fix perf_pmu_migrate_context() leaving events behind

__perf_pmu_remove() walks the group leaders of a CPU and PMU with
perf_event_groups_for_cpu_pmu(), removing each one as it goes.
perf_remove_from_context() takes the leader out of the groups rbtree,
after which rb_next() on that node returns NULL, prematurely ending the
walk. Other groups stay behind in the source context.

On CPU hotplug, they are then torn down with the dying CPU. They keep
running until teardown, while the PMU's interrupt and migrated events
are on a new CPU, which drivers rely on never happening.

Walk ctx->event_list instead and pick out the PMU's events by their
pmu_ctx.

Fixes: bd2756811766 ("perf: Rewrite core context handling")
Signed-off-by: Haris Okanovic <harisokn@amazon.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20261013185603.1347265-2-harisokn@amazon.com
---
 kernel/events/core.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 8b69d50..dd3c82b 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -14394,23 +14394,18 @@ err:
 }
 EXPORT_SYMBOL_GPL(perf_event_create_kernel_counter);
=20
-static void __perf_pmu_remove(struct perf_event_context *ctx,
-			      int cpu, struct pmu *pmu,
-			      struct perf_event_groups *groups,
+static void __perf_pmu_remove(struct perf_event_context *ctx, struct pmu *pm=
u,
 			      struct list_head *events)
 {
-	struct perf_event *event, *sibling;
+	struct perf_event *event, *tmp;
+
+	list_for_each_entry_safe(event, tmp, &ctx->event_list, event_entry) {
+		if (event->pmu_ctx->pmu !=3D pmu)
+			continue;
=20
-	perf_event_groups_for_cpu_pmu(event, groups, cpu, pmu) {
 		perf_remove_from_context(event, 0);
 		put_pmu_ctx(event->pmu_ctx);
 		list_add(&event->migrate_entry, events);
-
-		for_each_sibling_event(sibling, event) {
-			perf_remove_from_context(sibling, 0);
-			put_pmu_ctx(sibling->pmu_ctx);
-			list_add(&sibling->migrate_entry, events);
-		}
 	}
 }
=20
@@ -14486,8 +14481,7 @@ void perf_pmu_migrate_context(struct pmu *pmu, int sr=
c_cpu, int dst_cpu)
 	 */
 	mutex_lock_double(&src_ctx->mutex, &dst_ctx->mutex);
=20
-	__perf_pmu_remove(src_ctx, src_cpu, pmu, &src_ctx->pinned_groups, &events);
-	__perf_pmu_remove(src_ctx, src_cpu, pmu, &src_ctx->flexible_groups, &events=
);
+	__perf_pmu_remove(src_ctx, pmu, &events);
=20
 	if (!list_empty(&events)) {
 		/*
