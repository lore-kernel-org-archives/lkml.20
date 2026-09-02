Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85C73ACF10;
	Wed,  2 Sep 2026 07:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335692; cv=none; b=WWlMcacLgeNPC04C+aY4Nvg0Ovept2krkQybYgPTcS3MNeGivjUk4jh1u04bNRc9ue8CxQo7AumgyXZjNLJsgkIz8X8yTYS47E/9jsMDHAvamvPjVw54XhCjuqE56IRTWL8gPpzDSBaiPycYU6P04UzoSQGQam+RDWm+tsjdl98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335692; c=relaxed/simple;
	bh=SF6jxYkxWWqO8FLgk4hHtX+KAGw/ALeIJv7IW1Hr9Zw=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=W5ajBJ8bPcRIEwA9ubOC4BHSshNFWUos1lCNT04FBOIbxttJjZqMAakbgP5ZMDCd1hNtpQ7AbMyFiIjFd7ZhKRHvf/fIpSAJalT8TmVQyE7H1zQvN2ld7QnXF9CtPCkLAv71B67/kyyad93NFo2I3JNtu8Z7kNFoLhoSp5YhbOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qclDddwg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TwVYf/kf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qclDddwg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TwVYf/kf"
Date: Wed, 02 Sep 2026 07:54:46 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788335688;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0DzO3Zpy/BhA14WMJ3OBfvrH6U9zXqO8LCwLN/QMlvk=;
	b=qclDddwgo7CPKDfoqnDd0pMMduwHm97EvdVn/gekgu97Wkei26yYt2pnyEffxL9YgbtUuC
	UDH3jCAffK37JqxkgoKOJqjSle1+JCzuvhn5UChZNobNHWnq3nXvbOZcPGez+zQWjYdDNw
	uCqg3xNzrXcyqWTxqSRX76aNnMn/+6xkVcux9n751ifRH/eubCTfzooxI4sD7PiiKaT0SK
	3976ZQ6G2Y45Avu/Exo73XtK2g2SJD6QVAtx7P/ESsx5V9hte5ojwFk7lwu+NNtsSEXQpL
	V0YBqPQaEFbbFmBBrgDCbg1zYFipVQB4jZTeYdl5UX72MROVy3FDULHSazpqVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788335688;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0DzO3Zpy/BhA14WMJ3OBfvrH6U9zXqO8LCwLN/QMlvk=;
	b=TwVYf/kfprjD49XgeuC4RwmjZuPYHdMijWwd3ZsMUc9b8R/qqw273Ua49JE4W+GCLqgGVS
	GyL29MAI/2FqnEBw==
From: "tip-bot2 for Mark Rutland" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched: dynamic: Simplify preempt model accessors
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Mete Durlu <meted@linux.ibm.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260803191731.3244294-7-mark.rutland@arm.com>
References: <20260803191731.3244294-7-mark.rutland@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833568657.3717435.9039553295457619088.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     9650ce11f2e377310332d87a902dc4df3f59b905
Gitweb:        https://git.kernel.org/tip/9650ce11f2e377310332d87a902dc4df3f5=
9b905
Author:        Mark Rutland <mark.rutland@arm.com>
AuthorDate:    Mon, 03 Aug 2026 20:17:31 +01:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 09:37:24 +02:00

sched: dynamic: Simplify preempt model accessors

PREEMPT_DYNAMIC is now limited to the FULL and LAZY preemption models.
When CONFIG_PREEMPT_DYNAMIC=3Dy, the NONE and VOLUNTARY models cannot be
used, and neither CONFIG_PREEMPT_NONE nor CONFIG_PREEMPT_VOLUNTARY can
be selected.

Simplify the preempt model accessors accordingly: remove the out-of-line
implementations of preempt_model_none() and preempt_model_voluntary(),
and remove the preempt_dynamic_{none,voluntary} values.

There are no current users of preempt_model_voluntary(), but I've kept
it around for consistency, with every scheduler model having its own
preempt_model_*() accessor.

Suggested-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Tested-by: Mete Durlu <meted@linux.ibm.com>
Tested-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
Link: https://patch.msgid.link/20260803191731.3244294-7-mark.rutland@arm.com
---
 include/linux/preempt.h | 20 ++++++++++----------
 kernel/sched/core.c     |  4 ----
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index 8299657..4031067 100644
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -502,21 +502,11 @@ DEFINE_LOCK_GUARD_0(preempt_notrace, preempt_disable_no=
trace(), preempt_enable_n
=20
 #ifdef CONFIG_PREEMPT_DYNAMIC
=20
-extern bool preempt_model_none(void);
-extern bool preempt_model_voluntary(void);
 extern bool preempt_model_full(void);
 extern bool preempt_model_lazy(void);
=20
 #else
=20
-static inline bool preempt_model_none(void)
-{
-	return IS_ENABLED(CONFIG_PREEMPT_NONE);
-}
-static inline bool preempt_model_voluntary(void)
-{
-	return IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY);
-}
 static inline bool preempt_model_full(void)
 {
 	return IS_ENABLED(CONFIG_PREEMPT);
@@ -529,6 +519,16 @@ static inline bool preempt_model_lazy(void)
=20
 #endif
=20
+static inline bool preempt_model_none(void)
+{
+	return IS_ENABLED(CONFIG_PREEMPT_NONE);
+}
+
+static inline bool preempt_model_voluntary(void)
+{
+	return IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY);
+}
+
 static inline bool preempt_model_rt(void)
 {
 	return IS_ENABLED(CONFIG_PREEMPT_RT);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 0592320..c9dd6f4 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7864,8 +7864,6 @@ EXPORT_SYMBOL(__cond_resched_rwlock_write);
=20
 enum {
 	preempt_dynamic_undefined =3D -1,
-	preempt_dynamic_none,
-	preempt_dynamic_voluntary,
 	preempt_dynamic_full,
 	preempt_dynamic_lazy,
 };
@@ -7950,8 +7948,6 @@ static void __init preempt_dynamic_init(void)
 	}								\
 	EXPORT_SYMBOL_GPL(preempt_model_##mode)
=20
-PREEMPT_MODEL_ACCESSOR(none);
-PREEMPT_MODEL_ACCESSOR(voluntary);
 PREEMPT_MODEL_ACCESSOR(full);
 PREEMPT_MODEL_ACCESSOR(lazy);
=20
