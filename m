Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958626;
	b=z1ImekO4ekKt227BbuZ8RxAeQj09wGLgQO8YvNAatg6Aheqa7s55lAcELLtgpOrgYLPV
	 7X95OO/DGR8//yPHzAw7i/le6fIjHpFHVzsBv58WtmOMJRTYeW8upsRSoqSIrQ5lSE43W
	 a1tF2p6gtuE8KLrAAsqlZVNr07cnQb3xScNH5lD+JbSbjjnL3zNZ5IcCwlhClBMYjl39B
	 VUtEmD036jsuzdICh5G14IU+J6gBwNODs7UvGWdCYNsBDMOOpSjn9xjoyiAv4OnmWInBd
	 mc5FPJsNTco0p06BwPYtStnItSpftPLWL0xE6Vu1MDGBFupUiOQXQDA/BqCvYLxGvfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958626;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=0BFGf5Gqnt46AUvW3mAdakz12b9NgAjCrOay4QNcQyI=;
	b=uBJlk8/6UFYefXfgjlZHjShTMqvrp4ifOSDPh1dsxsruaq6vIA3aK5xLahQBWG3LTySC
	 R3ytccPzQ2GXjEbG2rG6VQGwERbi5qeRJZ80iRXVkuzwUhCbgEh6qxdMN/5wWOLdzrMYP
	 LWoHyauMF6gemIMvdqryS2T4Zujpe3myo7PL0Suw0GiDI4e4sfNXTKrs6PCYNDS5+kaMD
	 hnxwH+7TIwA84TGXvEsi55V7AGIXjrtDssqYrf63bLTePjRyIjFoy+o85cq8V3HI3jAsH
	 W82kfPXwhkLOeeX/oQEH3zYi8ZkXe8xcJSkOifefZSUjj4UItiPd3UDxwvbW6eKLyBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cIGLv33I;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aBViO0Te;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF553606A32E;
	Fri,  6 Nov 2026 09:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF553606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cIGLv33I;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aBViO0Te
Date: Fri, 06 Nov 2026 09:50:22 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793958624;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0BFGf5Gqnt46AUvW3mAdakz12b9NgAjCrOay4QNcQyI=;
	b=cIGLv33IE7ouV+SByIIihXItWzIhyQko8ZkOIJF5E8iorNs7TzehR2Adm3hLCSv19fBEV4
	Wu620I0jRuXbVV4f+wtL1AMT5aNBJRSjKrRprkHBFraSYiZmhLX6gqpv9BUVlT1xvX5AP+
	q28+zv9dBlpmzJezRfZOXbGNN7StzUKn6L2b/bOCXFPyDCPCkMXTg2bjjUN5O7dAw61EZ2
	I5Xf4dLxO23XSelFtz4gFxxwMNoC3bZrlDIQk7htNr8ymqxF6H16/X1r1MsZ3ABYn5ExD3
	biXKBursWThWnlzywbUTo0/bPhU0FG+2mL2NBE/Ik30KUCflgvVLWf/BEN1bZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793958624;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0BFGf5Gqnt46AUvW3mAdakz12b9NgAjCrOay4QNcQyI=;
	b=aBViO0TejV64vUQ+iEFhTwFe5ho73XayNKVQbHokNnsADWi8nHQmaP3pcje0j1/UXqPuSR
	QZaSqv1Bo6xx78DA==
From: "tip-bot2 for Ravi Bangoria" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] perf/amd/ibs: Fix kernel address leak via
 REGS_USER and REGS_INTR
Cc: Gennady Kupava <gennady.kupava@gmail.com>,
 Jayapal Ashwin Nair <janair@amd.com>, Ravi Bangoria <ravi.bangoria@amd.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261026041838.941-3-ravi.bangoria@amd.com>
References: <20261026041838.941-3-ravi.bangoria@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179395862242.1009794.11131252308264311238.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     b61c12527223423ab66891b2e8131da0d66537c4
Gitweb:        https://git.kernel.org/tip/b61c12527223423ab66891b2e8131da0d66=
537c4
Author:        Ravi Bangoria <ravi.bangoria@amd.com>
AuthorDate:    Mon, 26 Oct 2026 04:18:36=20
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 06 Nov 2026 09:45:25 +01:00

perf/amd/ibs: Fix kernel address leak via REGS_USER and REGS_INTR

IBS hardware captures a sample and raises an NMI. Since the NMI can be
delivered with a delay, a privilege change may occur between sample
capture and NMI delivery. Because IBS only provides the sample RIP, the
kernel records GPRs from the NMI pt_regs, which may reflect kernel mode
if a privilege switch occurred in the interim. This can leak kernel
addresses to unprivileged users through PERF_SAMPLE_REGS_USER and/or
PERF_SAMPLE_REGS_INTR.

Fix this by using interrupt regs while preparing PERF_SAMPLE_REGS_USER
and PERF_SAMPLE_REGS_INTR. With the change, when IBS samples a user mode
instruction but the NMI is delivered in kernel mode, PERF_SAMPLE_REGS_USER
will source its register state from task_pt_regs(current) and
PERF_SAMPLE_REGS_INTR will be omitted from the data sent to userspace.

In addition to fixing the kernel address leak, this change also ensures
GPR snapshot consistency, which resolves the DWARF unwinding issue with
IBS.

Closes: https://lore.kernel.org/r/CAPu-DQqF0aF6=3DGS8Z6KKWeeX_V5LiXeKU_rJQZC+=
uGg8zuTPNw@mail.gmail.com
Fixes: d29e744c7167 ("perf/x86: Relax privilege filter restriction on AMD IBS=
")
Reported-by: Gennady Kupava <gennady.kupava@gmail.com>
Reported-by: Jayapal Ashwin Nair <janair@amd.com>
Signed-off-by: Ravi Bangoria <ravi.bangoria@amd.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20261026041838.941-3-ravi.bangoria@amd.com
---
 arch/x86/events/amd/ibs.c  | 50 +++++++++++++++++++++++++++++++++++++-
 include/linux/perf_event.h |  6 ++++-
 kernel/events/core.c       | 10 +++----
 3 files changed, 61 insertions(+), 5 deletions(-)

diff --git a/arch/x86/events/amd/ibs.c b/arch/x86/events/amd/ibs.c
index bfb51f8..010d14d 100644
--- a/arch/x86/events/amd/ibs.c
+++ b/arch/x86/events/amd/ibs.c
@@ -1533,6 +1533,56 @@ fail:
 		throttle =3D perf_event_account_interrupt(event);
 		goto out;
 	}
+
+	/*
+	 * IBS captured RIP is out of sync with NMI pt_regs due to NMI
+	 * delivery latency. Use NMI pt_regs for PERF_SAMPLE_REGS_USER.
+	 *
+	 * Note: Valid user regs are required for PERF_SAMPLE_STACK_USER.
+	 */
+	if (event->attr.sample_type & (PERF_SAMPLE_REGS_USER |
+				       PERF_SAMPLE_STACK_USER)) {
+		perf_sample_regs_user(&data.regs_user, iregs);
+
+		/*
+		 * Don't update dyn_size if user has not requested for
+		 * PERF_SAMPLE_REGS_USER.
+		 */
+		if (event->attr.sample_type & PERF_SAMPLE_REGS_USER) {
+			/* regs dump ABI info */
+			int size =3D sizeof(u64);
+
+			if (data.regs_user.regs) {
+				u64 mask =3D event->attr.sample_regs_user;
+				size +=3D hweight64(mask) * sizeof(u64);
+			}
+
+			data.dyn_size +=3D size;
+		}
+
+		data.sample_flags |=3D PERF_SAMPLE_REGS_USER;
+	}
+
+	/*
+	 * IBS captured RIP is out of sync with NMI pt_regs due to NMI
+	 * delivery latency. Use NMI pt_regs for PERF_SAMPLE_REGS_INTR.
+	 */
+	if (event->attr.sample_type & PERF_SAMPLE_REGS_INTR) {
+		/* regs dump ABI info */
+		int size =3D sizeof(u64);
+
+		perf_sample_regs_intr(&data.regs_intr, iregs,
+				      event->attr.exclude_kernel);
+
+		if (data.regs_intr.regs) {
+			u64 mask =3D event->attr.sample_regs_intr;
+			size +=3D hweight64(mask) * sizeof(u64);
+		}
+
+		data.dyn_size +=3D size;
+		data.sample_flags |=3D PERF_SAMPLE_REGS_INTR;
+	}
+
 	/*
 	 * Prevent leaking physical addresses to unprivileged users. Skip
 	 * PERF_SAMPLE_PHYS_ADDR check since generic code prevents it for
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index eb3f7ba..7884489 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1814,6 +1814,12 @@ extern unsigned long perf_misc_flags(struct perf_event=
 *event, struct pt_regs *r
 extern unsigned long perf_instruction_pointer(struct perf_event *event,
 					      struct pt_regs *regs);
=20
+extern void perf_sample_regs_user(struct perf_regs *regs_user,
+				  struct pt_regs *regs);
+extern void perf_sample_regs_intr(struct perf_regs *regs_intr,
+				  struct pt_regs *regs,
+				  bool exclude_kernel);
+
 #ifndef perf_arch_misc_flags
 # define perf_arch_misc_flags(regs) \
 		(user_mode(regs) ? PERF_RECORD_MISC_USER : PERF_RECORD_MISC_KERNEL)
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 580590b..51bca42 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7919,8 +7919,8 @@ perf_output_sample_simd_regs(struct perf_output_handle =
*handle,
 	}
 }
=20
-static void perf_sample_regs_user(struct perf_regs *regs_user,
-				  struct pt_regs *regs)
+void perf_sample_regs_user(struct perf_regs *regs_user,
+			   struct pt_regs *regs)
 {
 	if (user_mode(regs)) {
 		regs_user->abi =3D perf_reg_abi(current);
@@ -7933,9 +7933,9 @@ static void perf_sample_regs_user(struct perf_regs *reg=
s_user,
 	}
 }
=20
-static void perf_sample_regs_intr(struct perf_regs *regs_intr,
-				  struct pt_regs *regs,
-				  bool exclude_kernel)
+void perf_sample_regs_intr(struct perf_regs *regs_intr,
+			   struct pt_regs *regs,
+			   bool exclude_kernel)
 {
 	/*
 	 * Hardware skid can lead to a scenario where a PMI is
