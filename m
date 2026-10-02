Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C82E47A88B;
	Fri,  2 Oct 2026 09:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933594; cv=none; b=fFQEaRyHofylVn2+Z3SG1FQac5wP8PB5478BQUbBazZSb4oPcbImOa8CUwJBYR5+1b6sx5h6CFb7RrRMBAKeNC5xD9hHqY51EktkrDXHCXmLdkwkvH9WwKEczKmKVwEPlU8IAMF/YOuX2VGgx6BOYHuF5FVEKMzQxw6SnHiKNf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933594; c=relaxed/simple;
	bh=lgmXUKPnVi07b++qrTqezMTNDEo+TY+63HsVGmjZKb0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=heg1OxcSLodtkzo4skGg4R+SbRIwpfPQ60hSo4wjaThwUOjItaYe+okrPEKlAavHy8gOGpaGtFng9Kvl5sXahLECIPQ81d9SBf1yFjwcmrv7iSw3mOAvVl82gDSO2S2K0S8y9AFomkGsOgsIJkrSRrpFAqDJ/gy0dBx449XBxsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NcSECyNR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aZmaFt48; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NcSECyNR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aZmaFt48"
Date: Fri, 02 Oct 2026 09:33:09 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790933591;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jb6AC4LEnKba7THncd2tSAG6/VNILBKfZvfWeQ8yJ7o=;
	b=NcSECyNRfcAf/Gy0+yUxBhB35Qhb6iMh4eNOGX15f4T8hY7o/6AXVWDBoEKaj2k7O4rSgs
	SNKVgZ+wc9YLYDfss1/8XXOxUx5/LBXG3Q14w6mUkL4E14q/jDA93FZW1oJNH7ifrsGgLP
	+IN3bzrkoM+Dhpw8ggjCfzar7U1S8Da8e/my0xRY0HZvZxjdgHW9HHDHRrL6gIIGHOTtsj
	dFrot/FpAgUJvwRO1G+g7BOjQDrfKzu/5qv0r4YevBljZE566b3sMXGX3IMRpdHpdrXoTs
	vcm/OA124pm9PzXcqrt8J2OELOkKJ4Z1WqZznYbgkZGdbWnD7EYUB2iwOWE8RA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790933591;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jb6AC4LEnKba7THncd2tSAG6/VNILBKfZvfWeQ8yJ7o=;
	b=aZmaFt48WV9wP+tsY3CXAkVrD6ipmY2KM8qouwsqlyS473Aky928om0ivTD8jxCjVOCclo
	DTk0clPxIvH758Cw==
From: "tip-bot2 for Sebastian Andrzej Siewior" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] smpboot: Don't park the thread if work is pending
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260911143815.997254-4-bigeasy@linutronix.de>
References: <20260911143815.997254-4-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179093358975.3910103.4950626443987838537.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     4a3b51aab6e25244d97936aa65e6d5425adf98e1
Gitweb:        https://git.kernel.org/tip/4a3b51aab6e25244d97936aa65e6d5425ad=
f98e1
Author:        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
AuthorDate:    Fri, 11 Sep 2026 16:38:14 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Thu, 01 Oct 2026 14:00:36 +02:00

smpboot: Don't park the thread if work is pending

Once a smpboot thread gets work assigned it receives a wake up. If the
thread had no chance to run and receives a parking requesst during a
CPU-hotplug event then it is parked without running the callback first.
As a result the enqueued work remains stuck until the CPU gets back
online.

There is nothing wrong with invoking the thread function first and
parking in the following iteration. This would ensure that the callbacks
are processed before the shutdown.

Honor the park request once thread function does not need to run.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260911143815.997254-4-bigeasy@linutronix.de
---
 kernel/smpboot.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/smpboot.c b/kernel/smpboot.c
index 4503b60..3f60e8c 100644
--- a/kernel/smpboot.c
+++ b/kernel/smpboot.c
@@ -103,6 +103,7 @@ static int smpboot_thread_fn(void *data)
 {
 	struct smpboot_thread_data *td =3D data;
 	struct smp_hotplug_thread *ht =3D td->ht;
+	bool should_run;
=20
 	while (1) {
 		set_current_state(TASK_INTERRUPTIBLE);
@@ -117,7 +118,8 @@ static int smpboot_thread_fn(void *data)
 			return 0;
 		}
=20
-		if (kthread_should_park()) {
+		should_run =3D td->status =3D=3D HP_THREAD_ACTIVE && ht->thread_should_run=
(td->cpu);
+		if (kthread_should_park() && !should_run) {
 			__set_current_state(TASK_RUNNING);
 			preempt_enable();
 			if (ht->park && td->status =3D=3D HP_THREAD_ACTIVE) {
@@ -151,7 +153,7 @@ static int smpboot_thread_fn(void *data)
 			continue;
 		}
=20
-		if (!ht->thread_should_run(td->cpu)) {
+		if (!should_run) {
 			preempt_enable_no_resched();
 			schedule();
 		} else {
