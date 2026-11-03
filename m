Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712369;
	b=y4U5r/ZP9aLUANC6maCkm6Rm/ta8fXD+pr4lZd4V/wR921WfKdG9pZTchBt1H41BH144
	 ZHbCNgCha3/X10PpRhpBinoziKYzMvt9oC7dEfkBaD0aYisPoBGm8zqnUrUA1ktxAM2BK
	 Tbo009WSRA1ZBnpLEAwp2eVf52LDSbkw6rn3K5ZQnMvCSJwOkbg7wfSOcBQDanD03eCI/
	 jbc/9DIEaw/eswYeDp5mOokDz2UItvZhTPLdyrXeZTHQQJwwaw1ONGQkGBQkTJniDlLEB
	 5ZMwyWAqjMU1BDxRwLGSir6B3ePJuS1LooeXSf/uZWQk+njKc71GSqDqyC7v60zGJiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712369;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=N+iIycM9A0fyr/eMinva8ANP9TfjG9fJvWCgKhLGyN0=;
	b=p7HEkaOZTkHW0/4Vwg2ISSoWP4TYx6A3IZ7ftrnf8QAL7p5TAWj+PipoOLDiKsW6ef4c
	 g/UzTf8tyIAawWINPXxxYQXxn/npJdg1gdslwKZ+jTte4QV5f1/IqlYQerMfooU6CihBo
	 SoYSxHWmjI/cpwYCleB/T3q5x3AYpTngYyU5Yoe5YI3yijJUtf64RJ8oOLqJyN6WVrfDZ
	 w4sK+tzyzeAonSM4RnZvKECL8cTpbN8Ne1vYM9wuCZ0LCW0K6sZ7fEE/WL86Qp9PjzhQ2
	 GQfNwp2LAt84j4evDe79A/Ioy9qTmIsK5QfHX2Bbyffq2p8yJNiQdH2ehFviz92HxfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wCnv3KW9;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=GjOCbzGt;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3049A606D833;
	Tue,  3 Nov 2026 13:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3049A606D833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wCnv3KW9;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=GjOCbzGt
Date: Tue, 03 Nov 2026 13:26:00 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793712362;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N+iIycM9A0fyr/eMinva8ANP9TfjG9fJvWCgKhLGyN0=;
	b=wCnv3KW9CB3A3XK7hMIytFaucZT6tToL6b/uGf7Ogr3R3+Jnd7lwq8ffDUOdfugE1CiZLn
	kTjRoPmgODgQNlD5LKWdSkjNV07lXKQzk4seNDbWVrpYtBS0xHxgleTdji3LaiCQ3Dfu2y
	iJhDF00fymONnceowSdw7U+F+WewbzDPAOXOCy8yXQpOtmCDzm5zj8YTO7L7wV5hXNdGnX
	hwcRSKjpvsba9R+VWXx+KFAgFjZwWO3d1cxaXEDq6Nc19YoXGyuVKFdHaTfNz31rwrRCC+
	VnGI5hOX69/rcwluyzhITCwOc19fwH0WNMW6FgcUOxpYOyYTT6BnFEKVXcRUdw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793712362;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N+iIycM9A0fyr/eMinva8ANP9TfjG9fJvWCgKhLGyN0=;
	b=GjOCbzGtNXKfjol6N7WtDEryztq4dfG/0od2fU7X22TiqiHOqjOnWpXf50TXe71M/LkLI/
	OUSD4AH/vSFy+2DQ==
From: "tip-bot2 for Juri Lelli" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched: Reject SCHED_FLAG_KEEP_PARAMS when it
 would change scheduling class
Cc: Juri Lelli <juri.lelli@redhat.com>, Ingo Molnar <mingo@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261103-b4-sched-dl-bw-fixes-v1-3-dd761fe005b4@redhat.com>
References: <20261103-b4-sched-dl-bw-fixes-v1-3-dd761fe005b4@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179371236003.1009794.6672434409287737146.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     8a70415351ba8b4d80ce0a119a2409c1e3709855
Gitweb:        https://git.kernel.org/tip/8a70415351ba8b4d80ce0a119a2409c1e37=
09855
Author:        Juri Lelli <juri.lelli@redhat.com>
AuthorDate:    Tue, 03 Nov 2026 12:26:31 +01:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 03 Nov 2026 14:18:05 +01:00

sched: Reject SCHED_FLAG_KEEP_PARAMS when it would change scheduling class

SCHED_FLAG_KEEP_PARAMS was introduced for uclamp (a509a7cd7974) to let
userspace adjust utilization clamping without disturbing existing
scheduling parameters. The flag skips __setscheduler_params() and the
sched_class assignment entirely.

However, when a sched_setattr() call requests a policy change that
would switch the scheduling class (e.g., SCHED_OTHER on a
SCHED_DEADLINE task) while also setting KEEP_PARAMS, the result is
contradictory: DEQUEUE_CLASS is set (because prev_class !=3D next_class),
causing sched_change_begin() to call switched_from_dl(), but the actual
class change never happens. This leaves the task in the original class
with its bandwidth accounting corrupted.

For SCHED_DEADLINE tasks, each such call spuriously releases running_bw
and rq_bw via switched_from_dl(), leading to accounting underflow.

Reject the contradictory combination early with -EINVAL. This does not
affect the intended uclamp use case, which always pairs KEEP_PARAMS
with KEEP_POLICY (keeping the same class).

Fixes: a509a7cd7974 ("sched/uclamp: Extend sched_setattr() to support utiliza=
tion clamping")
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/all/2b5fb3f22bca6aa383be8f4781923392@kernel.org/
Link: https://patch.msgid.link/20261103-b4-sched-dl-bw-fixes-v1-3-dd761fe005b=
4@redhat.com
---
 kernel/sched/syscalls.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index 45a127d..be351f8 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -675,8 +675,19 @@ change:
 	prev_class =3D p->sched_class;
 	next_class =3D __setscheduler_class(policy, newprio);
=20
-	if (prev_class !=3D next_class)
+	if (prev_class !=3D next_class) {
+		/*
+		 * SCHED_FLAG_KEEP_PARAMS prevents the class change from
+		 * actually happening (it skips __setscheduler_params and
+		 * the sched_class assignment). Reject contradictory
+		 * requests that ask for a class change with KEEP_PARAMS.
+		 */
+		if (attr->sched_flags & SCHED_FLAG_KEEP_PARAMS) {
+			retval =3D -EINVAL;
+			goto unlock;
+		}
 		queue_flags |=3D DEQUEUE_CLASS;
+	}
=20
 	scx_prepare_setscheduler(p, policy);
=20
