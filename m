Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792841649;
	b=AvSIbCHoA0ANt4vYpRYHdOW7YCXoqCYVMlAd4KeGAjj6Ss+I9YB9uRfxQ/5VhgtO/4a+
	 V33/pQ8ssRsptYkk2yPxHilwnBRUvblyU7Izcz+nTeYqWoG2RR3qrraV9zvSQ4KxeIaO6
	 mX93X7fKqzgaTVEM16XRuMWsw7yrJtOEovmL1Q5WEsKMSO9hcOyxOVl5zmbGBQrmPFNuk
	 OuCT4mq27PeGTXaT1G9bBzmXApWr+biWFG98EBsVKJwG7Ux8NPUdU5UUqNa1zUZOV+xWP
	 FSvTaeSrqwXs7GWUDPdoyeU359JDvUFGUx7NFIKZhb/Xk9xFeDxdHMwjSeR9MGSi8yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792841649;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:MIME-Version:Message-ID:Robot-ID:Robot-Unsubscribe:
	 Precedence:Content-Type:Content-Transfer-Encoding;
	bh=LbJ4TnjJoq3SpoEsBNReJaJpQ+4HGVCoG9k5ZH7zY5o=;
	b=WrE/rcHVA+jrs+CDbOU+yitKNw+9096j8WghYCJ1xNmGOfkNgo3pAdB/dRWJdNn701eo
	 R5ZJGeZBZPJYYT1icrgtzGZrQbUp55MgKAk0IKo4FCyY4Z3dqJIIjiqk4HsDqvzwykT5g
	 AcosV8XiKE7OLhsmOtTgKYNWiIbbKYRlyaPWZv6apdeH0LPWwb0hMnDgBYuKG/Ctohmvz
	 IedwD+sJmuoyUI/JBdxMHPVPEUu9ve6rcG4ODl6SFGvQ5QpBCanQMkDEGyKF1mZX6NDKY
	 FgEMoTVv6eFDknWdQn/lJafuJ9xUXVbryuBJ/cVHXZtaRlvYGzr8QAWO6uBqUqAZGKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=adyl4LoV;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ZMUjZl7P;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472FA606A31B;
	Sat, 24 Oct 2026 11:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 472FA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=adyl4LoV;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ZMUjZl7P
Date: Sat, 24 Oct 2026 11:34:03 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792841645;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=LbJ4TnjJoq3SpoEsBNReJaJpQ+4HGVCoG9k5ZH7zY5o=;
	b=adyl4LoV/PO910ibjr7bUwPumH+/EmM7a0mP+V54trgs2MKTXD98yXfyz7mEucWqvy+4Cd
	lCu2E6Pj+uHjXrM5F847yVav4YvWIdLUEdXLNPkAGwKybsXoWEh3ECZ7jTiWI7LnvGDcrB
	b6uGnCMtLGeR0Uw7IwsqAnRKRve5Nm9r1qv3zuKSR5TsQeZCw9nvfTVn1xeW/oZtBRRDVn
	C83X0iwI9cylg6YzIxZSiMK3+hhHNgzvPdyqU93TfaqXZPZRia9x7eaccSwLxu5Wv0D6CL
	PHXyyOtT4PmB9ml0sx2MWr85Y9eIzno349EsCb6vhPjKHVbRRu+QYVUJFyWyqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792841645;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=LbJ4TnjJoq3SpoEsBNReJaJpQ+4HGVCoG9k5ZH7zY5o=;
	b=ZMUjZl7PQWSa1EqrwDwn2HaAnciuK8BwvuVKT7kbqK4telgcVma5cLwWaBweLerMl79SKQ
	wapYGqC6F4LzOlBQ==
From: "tip-bot2 for Peter Zijlstra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/urgent] perf: Fix perf_remove_from_context() event scheduling
Cc: Q8 <cipher.gnep@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179284164324.4109677.8240630031562225279.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     d095321349222961813333277881b3c74f10b17b
Gitweb:        https://git.kernel.org/tip/d095321349222961813333277881b3c74f1=
0b17b
Author:        Peter Zijlstra <peterz@infradead.org>
AuthorDate:    Wed, 14 Oct 2026 14:45:51 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 23 Oct 2026 19:09:52 +02:00

perf: Fix perf_remove_from_context() event scheduling

Q8 noted that it is possible to get into an inconsistent state when
using perf_remove_from_context() on a group leader event.

Specifically, when the leader gets scheduled out, we should (when not
destroying the grouping) schedule out the complete group, similar to
__perf_event_disable().

Reported-by: Q8 <cipher.gnep@gmail.com>
Tested-by: Q8 <cipher.gnep@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |  9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index e248f34..f36a3bb 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -2590,6 +2590,7 @@ __perf_remove_from_context(struct perf_event *event,
 	enum perf_event_state state =3D PERF_EVENT_STATE_OFF;
 	unsigned long flags =3D (unsigned long)info;
=20
+	perf_pmu_disable(pmu_ctx->pmu);
 	ctx_time_update(cpuctx, ctx);
=20
 	/*
@@ -2603,6 +2604,13 @@ __perf_remove_from_context(struct perf_event *event,
 	if (flags & DETACH_DEAD)
 		state =3D PERF_EVENT_STATE_DEAD;
=20
+	/*
+	 * When disabling a group leader, the whole group becomes ineligible
+	 * to run, so schedule out the full group.
+	 */
+	if (!(flags & DETACH_GROUP) && event =3D=3D event->group_leader)
+		group_sched_out(event, ctx);
+
 	__event_disable(event, ctx, state);
=20
 	if (flags & DETACH_GROUP)
@@ -2632,6 +2640,7 @@ __perf_remove_from_context(struct perf_event *event,
 			cpuctx->task_ctx =3D NULL;
 		}
 	}
+	perf_pmu_enable(pmu_ctx->pmu);
 }
=20
 /*
