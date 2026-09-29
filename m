Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3515756260C;
	Tue, 29 Sep 2026 19:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708745; cv=none; b=HWGrqG5knZv5wsOYIC2/jLICBBXYnnP2gtdTMB1jZHoxNNgZ//YDRVZwhDdxi0qwfZzG7FTDR6Oky8jM6A9by5N3QQnE0+ITecU/ih6WmXtIGNoYIPR+3OA4atAt2WAEb0jOKQspnboM/c0GncuzAYEu5xdQMXv0azflCwCiLhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708745; c=relaxed/simple;
	bh=rfWZCN3hFrUNiNp17o6zwkfunCMO7PQ/56LrZKgnABs=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ftYMkZKriyw9nvdCu0buwWG+supoW65NxSaob+V2eeZo9wpCSdDHily5Zh/JRIo08SxX9lQFeXPQO3KIRFzjitgfmU9xmdIxiT0pKRuUQmsHG6BpXWRz8x4I7e3TS3FleGEsN4m5ST/iyVnoEORn+ezpy3ozxPgsPQktLtuRcws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jpWZn+ba; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=e149J1VC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jpWZn+ba";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="e149J1VC"
Date: Tue, 29 Sep 2026 19:05:40 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790708742;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mASTbbTZIH2HICcuITTmRTbcUd51gLtKXB6khy0hTg0=;
	b=jpWZn+basL9s1oajWcM9skUlmMQcONkBiOT8v/MsnQoipbbwf/Z7mGVSazKzDRdwJ6f8KG
	FDR+8Kn+C4GXDgAnMI5zuEYuBgaXde7ZCWpN0iQo/aW89wpzN1nBh/HvdEbO5XHWZd/dcf
	Cw4Oa1XdZW29tNux1P1j3WnCrCfg5rqam3s0UkdLrC6fdu47XLNUaCGKInQzbVDuyylLSN
	UtKo5khLs2cFq61h+DhYHOtnG/XzIyGmHWmf/vE2Nw+FQ0tstxgoOgu+MIdLmzy+6NWlWk
	cIXLKVE5EJDBLhtpckOLsE/xOnCpkNimuJe2zSvcwPUmydlfjc7993vnle1Z5w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790708742;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mASTbbTZIH2HICcuITTmRTbcUd51gLtKXB6khy0hTg0=;
	b=e149J1VCx4JTyj7DgJ/vLILAYNn2dCOOYwcCVjlYYzysulqVmFJsX9PP6wODBR7k5vCBvP
	rlx043+xoDWE/WDg==
From: "tip-bot2 for Paul E. McKenney" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: timers/core] wait: Use accessor for hrtimer_sleeper ->task field
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260919001428.3133388-3-paulmck@kernel.org>
References: <20260919001428.3133388-3-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179070874092.3910103.869640092040726230.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     66b29025b6761d9e0a8bd4d1b813b1f2c3c1a28e
Gitweb:        https://git.kernel.org/tip/66b29025b6761d9e0a8bd4d1b813b1f2c3c=
1a28e
Author:        Paul E. McKenney <paulmck@kernel.org>
AuthorDate:    Fri, 18 Sep 2026 17:14:19 -07:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 21:02:51 +02:00

wait: Use accessor for hrtimer_sleeper ->task field

The hrtimer_sleeper structure's ->task field is used as a flag to indicate
that the associated hrtimer has expired.  This means that the hrtimer
handler can be storing to this field while other code is loading from it
to check for expiry.  Note that additional races appear for hrtimers that
can be restarted, which could be argued to be a user error.  However, that
is no reason to let the compiler introduce additional confusion, and to
this end, the hrtimer_sleeper_task_get() was introduced, use of which also
has the benefit of avoiding open-code access to hrtimer_sleeper innards.

Therefore, apply this accessor to the __wait_event_hrtimeout() macro.

KCSAN located this issue.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260919001428.3133388-3-paulmck@kernel.org
---
 include/linux/wait.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/wait.h b/include/linux/wait.h
index 7e21533..c2af98b 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -556,7 +556,7 @@ do {										\
 	}									\
 										\
 	__ret =3D ___wait_event(wq_head, condition, state, 0, 0,			\
-		if (!__t.task) {						\
+		if (!hrtimer_sleeper_task_get(&__t)) {				\
 			__ret =3D -ETIME;						\
 			break;							\
 		}								\
