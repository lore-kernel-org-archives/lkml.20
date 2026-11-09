Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254012;
	b=cg+mv15O02TAFdBDbND+LX5PPoRh2aiidn6DQSbY13I8HE4EYxEpcqMRMC0GyPlKdk40
	 isfbQv5u19Z/snka7ucwIYKhsr6oIc7RZHSzPeXe1QzBRHq6ei4Xm6cTJR8ur4jWgI4uy
	 5wxKv9ejC2tyEHt/UoCRrn5WEl1FUL7NoLFngXNRMWke+LCut1TgK2z1b09c+AXkRax2w
	 PSthP9pJuXtzGyox3fnSwITL+K71zUTKi08Deh2lp/6q6YFjN2b54D3LemXXBpK90HKFl
	 sJEjX+lSD7YY0oXDsd54DT/iT2bQW7a1DxmIwZvxRGlhMWhSZFOdHeaZKJDlwe7y/oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254012;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=ziqmv22Qk1kgfORplo3vXQ0RI/vMC+WLZjTCWGJCxpI=;
	b=056P0zJu7RaMQi/HdccxeHWC870F5wr8J+/K4LNqBoh3sRGB/4MQV+t+0Jrl3LWa4EDk
	 QHAsSGJSRCTcDk5X6KOFUpI8xMWde6kZoNq4ZSksk22r14hUhHueGy2xxqmYnA//2iY7b
	 zqwB4rz5E1Fo0dgQVDsCHceHxqROoCOoK8GJzbrZjeBMUfARkY1DCjTIeX83hayZCdTfJ
	 w3Zrrrq/AHBwRiS42KbHFEZMlalsnaBiNL1m8EqWJMANKAVVUwGd/+vgLBkORocdt3blx
	 xuZ4hhXAvx/4uMBe5ipycrXFLIAi2SpzTn/agVReiIVnfC5+6Oe5gU7kPZoaYieX8dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KtqwyayR;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=LdgcBgkP;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C78060A2610;
	Mon,  9 Nov 2026 19:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C78060A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KtqwyayR;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=LdgcBgkP
Date: Mon, 09 Nov 2026 19:53:28 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794254010;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ziqmv22Qk1kgfORplo3vXQ0RI/vMC+WLZjTCWGJCxpI=;
	b=KtqwyayR31P6M0wFkcZn+cOIznQx1I0316b3k3ugWf+iq6J873G8B4QQNlJLEPSqA6kskH
	pqpi7hH5PRqqY4eUl669sxd6QJY0t8oE8dBZR99rFYh0SA1YiDmhMuN2Ec1lHKxN8B/e8y
	LKVYaWyFZvaTFloGWSSJMAItsp6xQEQfOXgdmONd+JPwVy+7VesbWjIJkmhq+t3xN+f1sJ
	ftTPpctrB9QRJ4wXtdeZUtcK1r13vvT3nPWHksPusWQwDFeREMjGRJqrlxugoCp4YT3T3j
	O/F4ggUjJ0U2g1muZnPn1ADu6nGq6iJSqaMecdX2fEUWQzSYfnIqcTA14GC2pw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794254010;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ziqmv22Qk1kgfORplo3vXQ0RI/vMC+WLZjTCWGJCxpI=;
	b=LdgcBgkP2xmlIU8HKxpK5wtu0Y+6snPyhvhwXVUTbTAMk6tG6CzK9RXuNTjnFCN6q9fMiR
	pWQLyeCbQCsIeUBQ==
From: "tip-bot2 for Avi Weiss" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: timers/core] hrtimer: Retrigger local timers after clock changes
Cc: Avi Weiss <thnkslprpt@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261101141552.644764-2-thnkslprpt@gmail.com>
References: <20261101141552.644764-2-thnkslprpt@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179425400868.2093942.1967492952392197381.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     81b8beef105bd9151ca1fa2e0796933a46adb670
Gitweb:        https://git.kernel.org/tip/81b8beef105bd9151ca1fa2e0796933a46a=
db670
Author:        Avi Weiss <thnkslprpt@gmail.com>
AuthorDate:    Sun, 01 Nov 2026 16:15:53 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 20:25:25 +01:00

hrtimer: Retrigger local timers after clock changes

clock_was_set() selects CPUs whose hrtimer deadlines move earlier
after a clock change. smp_call_function_many() excludes the calling
CPU even when it is in the mask, leaving its clock event programmed
for the old deadline. An overdue realtime timer can then expire
only when a later event triggers timer handling.

Use on_each_cpu_mask() to retrigger the local CPU when selected,
without interrupting CPUs with unaffected deadlines.

Fixes: 81d741d3460c ("hrtimer: Avoid unnecessary SMP function calls in clock_=
was_set()")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
Link: https://patch.msgid.link/20261101141552.644764-2-thnkslprpt@gmail.com
---
 kernel/time/hrtimer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index a9dc2d5..6d7a0d8 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -1000,7 +1000,7 @@ void clock_was_set(unsigned int bases)
 				cpumask_set_cpu(cpu, mask);
 		}
 		scoped_guard(preempt)
-			smp_call_function_many(mask, retrigger_next_event, NULL, 1);
+			on_each_cpu_mask(mask, retrigger_next_event, NULL, 1);
 	}
 	free_cpumask_var(mask);
=20
