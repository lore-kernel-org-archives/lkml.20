Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712368;
	b=wREzoMnOlog3m9dKYiPq87aY4DNKNeIQeajvIK+zZp/CtX89oMyBQj4hWneDiXw0M8d6
	 kAivWckbnrXLRYDqJvg3uot7zIu3VzTbYyPMkf9/yqq1H787HnlITJWcH4RxNxqZLQ8MS
	 gtClWUIZmg/hNi03UpgGU/VInp5lejjgqc0FINZh7eNcKK7FS/UMq3NfPSQc3D7Y7O/R4
	 /jkDp9hRf1GU+1VUwmFSY1Kckl4GiOQBmjbCtJULV7eTJHQaIwm19WohGnI7aabTO/bTC
	 O/OvvxqJmGpypr6RgHiz+QDnlCfWuOqk77pfpP+SAgcydcHXv7wJCPU16RvvJBpSOMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712368;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=o5SZ/NShCuAWE2uB9E4TilJUmn35hUWsHaAWAMpUlpo=;
	b=S5mfGkGe2cHYT952igaW5XV5icBJR0xu1EX4gcuEAwl9lYJC2r+JpFaSaB6kZ4UiO3vc
	 vq/O9WXMTK5CbOs6+UhFY+wOcEyjbizek6aVXliwMfuM3KS4wkQA8gDJwZY6/LBpz+pz7
	 mOjnP0nzTiFMhrnVn6LBBQLeuec4wLw3Jf694Q5fNopo9A9v+fKvz2Rvjexy09Ax+MkAA
	 5wSgVOkjeBLd7hzOxptU4LE4sOg9FXBbiul8GtLAqeVyNidksQE2mxDbTXJkgWsnW61gK
	 GjeNFUoP+DmH56CjgAFmWOFJN9Ox10sukrUcsm6SQYCLthgEnh4t4xxnVdKb08tFHaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lIO2otwz;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9hxx1d1W;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84049606D820;
	Tue,  3 Nov 2026 13:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84049606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lIO2otwz;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9hxx1d1W
Date: Tue, 03 Nov 2026 13:25:58 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793712360;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o5SZ/NShCuAWE2uB9E4TilJUmn35hUWsHaAWAMpUlpo=;
	b=lIO2otwzqOtT0ws2FqH4yp2q89eo/1g9TLGh9hISFmF+6uvvUJamWVERI4mcmUBgss6XHv
	Dd4gBqqvOhP4W5xXzIh7pSLl7/q9TQYFJJxsEz3WxMdIKHjmGj7b4WOrNA9/9Mu6dehEnu
	SRnZU71/TiOgsQPt7ntFaLcAPWDoWCGIgE0dJgDE01RKVTOvXVWcjeOMScr3fo/iTC7vIz
	ZA/13X91Sgdjr5pE4KGT9QhFc3tk+AtDYX8DdnebBoRWMejTseXZ7zUej2se7po5Fa/x24
	BiQfsMMUhZZ2ejANnwjH99TzqVFtR+zJ3dGAUcrWPmyDLKmbULuDDUF0RbGebA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793712360;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o5SZ/NShCuAWE2uB9E4TilJUmn35hUWsHaAWAMpUlpo=;
	b=9hxx1d1W58jRYJJUPp/Wi7vnFakA13h33rfTtMlFPADpacghKUYp233i/kAnMuuDmL7SQD
	EwCfFMlhMvGuDsBQ==
From: "tip-bot2 for Juri Lelli" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/urgent] sched/deadline: Reject SCHED_DEADLINE on exited tasks
Cc: Weiheng Qiu <weihengqiuu@gmail.com>, Juri Lelli <juri.lelli@redhat.com>,
 Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261103-b4-sched-dl-bw-fixes-v1-4-dd761fe005b4@redhat.com>
References: <20261103-b4-sched-dl-bw-fixes-v1-4-dd761fe005b4@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179371235835.1009794.6060109721665812114.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     a2b67e904401858d9f0ff6a0485c2fab506cc1bf
Gitweb:        https://git.kernel.org/tip/a2b67e904401858d9f0ff6a0485c2fab506=
cc1bf
Author:        Juri Lelli <juri.lelli@redhat.com>
AuthorDate:    Tue, 03 Nov 2026 12:26:32 +01:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 03 Nov 2026 14:18:06 +01:00

sched/deadline: Reject SCHED_DEADLINE on exited tasks

sched_setattr(SCHED_DEADLINE) on a zombie task succeeds and charges
total_bw via sched_dl_overflow(), but the task has already done its
final schedule() and will never run again. Nothing releases the reserved
bandwidth. Repeating this fills total_bw to the admission cap, after
which sched_setattr(SCHED_DEADLINE) and CPU offline fail with -EBUSY.

Reject sched_setattr(SCHED_DEADLINE) on exited tasks with -ESRCH.

Reported-by: Weiheng Qiu <weihengqiuu@gmail.com>
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Link: https://patch.msgid.link/20261103-b4-sched-dl-bw-fixes-v1-4-dd761fe005b=
4@redhat.com
Closes: https://lore.kernel.org/all/3f6e6c87-645b-45fd-8fc6-8da5bc5b82d8@gmai=
l.com/
---
 kernel/sched/syscalls.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index be351f8..3fa447a 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -584,6 +584,16 @@ recheck:
 		goto unlock;
=20
 	/*
+	 * Reject SCHED_DEADLINE on exited tasks. A zombie will never be
+	 * scheduled again, so sched_dl_overflow() would charge total_bw
+	 * that nothing will ever release.
+	 */
+	if (dl_policy(policy) && p->exit_state) {
+		retval =3D -ESRCH;
+		goto unlock;
+	}
+
+	/*
 	 * If not changing anything there's no need to proceed further,
 	 * but store a possible modification of reset_on_fork.
 	 */
