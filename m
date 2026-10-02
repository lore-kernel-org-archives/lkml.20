Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C362247C113;
	Fri,  2 Oct 2026 09:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933597; cv=none; b=OVSgqHkip8Yqwq2t2WUOyESpuRN/w5/A/VGvBgtXGOyV1bB2IrA8Z0dOWlpd881ZNm0gq3gjqzZBiU4oCCa8VRcoDQjmDf9OSj1BVm7iIe2NLUlcReswVLgD7e4R3qHMt9BZYy9ocaamSwzW8YqTh0HUDyZhAL5gVKiPHni5pvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933597; c=relaxed/simple;
	bh=FmrAoHUQWPlPTFbhgdp3acW6uBGeeJ4VUlL4ma+qZjw=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=FHbO2wpwK95LyxvX3syiyVRr2lngR3vXoWG7XYgYel+WAGM7pCCLkRuD7e11U+1WT8rp7Jh9VG2wnCMLh5fiIVk+5YZKgCprxt80d8yvjCUbM/+s5N/JQjXd08DHVQMMloNrTNxr4XfAds6tgurbs0GcAqaNA4a8GRoE1ksblPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dxEvy7If; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=66a/rudp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dxEvy7If";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="66a/rudp"
Date: Fri, 02 Oct 2026 09:33:12 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790933594;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e/LGS28RfSxj/sJbGchnB+ETLk+KrlIWO8GAvrIvS7Q=;
	b=dxEvy7IfLl4r2oO3ycP+5L5VCMmhQwrpdFJ8t50T5Gj5gjNPugp7A1nxRGqiHE4n/29e+y
	M1DS7A3dGQ29nK1rt5GNDhzArcz+9OPm69Zs6QU16yiih3vFFQ4FEl+HjFCso1YgxMQ+/S
	iORUPCMAqlaeEMyxuA7hURP9hc8vB+c54bTKl9pPZ2i04Vvscutk5V0mReoqiKqiWGB47R
	DpN12b2rMmgA4jz1pGtlOvlsqYWcnWQ6t29EG4TMwXqBT9KxQnxmY94Od1vbvJRABbMxDX
	mzh/8HEpefirHa6bDlfanLJHSbkcHk2K7atjOosMqEEJJHGao1Er3F4b1W3qHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790933594;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e/LGS28RfSxj/sJbGchnB+ETLk+KrlIWO8GAvrIvS7Q=;
	b=66a/rudpyLt/rdPdiugCJzvZXvRMogiLs7l+Zd/74kt0EAZIe7l00IcD2MMn34UU8OvX/J
	hy851tcBKpNUzkBw==
From: "tip-bot2 for Sebastian Andrzej Siewior" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] irq_work: Update a comment regarding CPU hotplug invocation
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260911143815.997254-2-bigeasy@linutronix.de>
References: <20260911143815.997254-2-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179093359247.3910103.13537251559289648921.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     791b1760accdc15248929f9b767410a76be199b1
Gitweb:        https://git.kernel.org/tip/791b1760accdc15248929f9b767410a76be=
199b1
Author:        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
AuthorDate:    Fri, 11 Sep 2026 16:38:12 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Thu, 01 Oct 2026 14:00:35 +02:00

irq_work: Update a comment regarding CPU hotplug invocation

hotplug_cfd() no longer exists and the flow changed a bit since the
rework of CPU hotplug as of commit 31487f8328f20 ("smp/cfd: Convert core
to hotplug state machine").

Update the comment to reflect reality as of today.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260911143815.997254-2-bigeasy@linutronix.de
---
 kernel/irq_work.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/kernel/irq_work.c b/kernel/irq_work.c
index f7e2dc2..9f19c05 100644
--- a/kernel/irq_work.c
+++ b/kernel/irq_work.c
@@ -252,10 +252,7 @@ static void irq_work_run_list(struct llist_head *list)
 		irq_work_single(work);
 }
=20
-/*
- * hotplug calls this through:
- *  hotplug_cfd() -> flush_smp_call_function_queue()
- */
+/* CPU hotplug calls this through smpcfd_dying_cpu() */
 void irq_work_run(void)
 {
 	irq_work_run_list(this_cpu_ptr(&raised_list));
