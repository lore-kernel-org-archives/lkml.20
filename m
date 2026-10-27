Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793085066;
	b=VVsXHZe8AQ8dzGKsERQ57wIG1lcy31u1g2TZfzmMzSB1abC6ENK79A5t/h9sGOPAX0n7
	 Lgr7VHEJUv1+zKdhEcgKrJhXNZbOzOmRSCYzDhxhSfzx8+l0clM6ASTCxnAo9biL5R7oh
	 615DGAmeZmqKpkBGGaLr4i3U0ns5cnG328s5WZ+ZbEz2YxV5JeKlUE5TXKE3Kf5jc4Lu8
	 2TMalMvx5sHiyyWJukygPy9UrIUezJWmFIgkzFookaxLArIF7FTyiJ4mt4ffm8eVnOUvh
	 ibjMz5PB63xTDKeqFmmnC7rsEyfBAZnAeMWPGurz+NFt8H8GLAlsdBlnqHYbfrOuRdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793085066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JquzjJyvf3NvcwDt23a9P8thg6Ysb/TnHv/SZlZzeZQ=;
	b=CGEoONudon/HyWw0uykPbuoWGuE63n0jletBXYq9uKJY9f0g/SuGJ/+6ppNxEW7lRTAx
	 hGXr7Zj0aC8eEHZcOfGd+UkODS0ghqyTePor7AcbFIKqKHx3hrmsxha192JyJbtbVogPR
	 60d7lU8/gUJpE7uH+3t+CmzwePFMbe4ddNkKi5rm/AOVstY3B8/pnyEkXS3Zac8bCcFHD
	 l0LgCkHzdR2DcTy6PSQjewOYrcRUTTUxqGvDgd04CxO2QatDJ4nV6ej070y53N4wDWcR5
	 tKCWp2sKB36AzJc5+Eon3BgWcHseKG1uJExfwExptU9mbmfKnrUoaVuIl0jHn+8OKIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WsJQkpPw;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D92606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97D92606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WsJQkpPw
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso1554539a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793085065; x=1793689865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JquzjJyvf3NvcwDt23a9P8thg6Ysb/TnHv/SZlZzeZQ=;
        b=WsJQkpPwdKm4vgaGX4866ERFXl/v29IpJ079S5HRmOn52RtYTilL1a/Ck6wRFbxX3V
         m9/nWZ7AbWOby3dHkKpwuY2wVE8QzbOc43opQIDUT/BAl/f+q+L55RNarz2HMOaIqCxw
         Br4lMRxbkVrl61AICDPnYWawq3gazYP82CNK8os1KkfHiOKkkCADqsUugira8K84wCye
         U3vDJ4WHrTPTBDk6NnE24rFt9tvc0DpMcG/iaP0CLH0BcuIM45VMPjfPV00EUaD1ixq9
         tWezK2fdCt6FDavOI+luon+JFlG6gQm6gOxcWAv5kJ6TQHRvD/sHucdS0vuIu1HM+lyo
         l2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793085065; x=1793689865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JquzjJyvf3NvcwDt23a9P8thg6Ysb/TnHv/SZlZzeZQ=;
        b=vdBEgxs7mXRSFbiU38P6bk/riA6vysI2JGiMac50spWEEzd3AeoqbC/A2oS3flDzDA
         2QIUocg9xMBqfqa1jsDfqFb7AxYEXJoi0s0IDGcjD28va1hQ6ciH8L1HO13o8jK3sOpC
         xER8zU7kGowlihXKCX4rF4EZPGTmHDLL8hg4cY+k/EU5PnkQw+sfXPzHV5pP23PH+0Ju
         JWvGqTsYqbnzqClW+e98H5h/S87aQSKg3s/nK+kRlYmYlm16LknV4SGvIsMW/W0j6cG1
         WLLA0Wl43TpcqY0bPJulkpOwP0gorCho9qsm8g5mWJ30LWBX+Pvb0UBA8paYC0FIqXIa
         +I1A==
X-Forwarded-Encrypted: i=1; AKwUvBwbJHtt3APFBmos4y/ausTDNtr3w2ADfT7ZECurLGMd+NcgDB7Nm5PXTap5KjACBweJuMSOaHhLWck6BAo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6T9iEvC4uVln4ao485zIahLz1NeI6oY22WtWE3ySnmpztrtVB
	p05XjmMqD0HwbGN7Zx3UGrt3b08l5TuMIru71T7LXTBV8IUDQb0i5YBy
X-Gm-Gg: AYBFou0zKA0xaBsvD5+5oqEPVdWO040aS6l2eoib8bLRoFdejlXKcisBWmTt56eRfKI
	AsAHjTd9MJtkm02Gw6fy+9/2rYZNFMNeRuonkaezUCp/H9yyB2vX/w0sS6Z9BH8pBUk2SQerEiE
	UuVDr+HINqnDiUKWzqBgz0yTgNUAm+mDYC9XqnkNO0A+s+SQcD2mwJ36AoD64pCZPyVpGDFYMTy
	MUJ+iAFdCGXtPS+E1VfI3p4CpuVPcTdptO8JCN7fyRVyfljxVBtQrhiTlL8IgN4s9JRHowWCWH7
	8QQkg4PBCJqSS2zikr6YKzc1ft1mbjNfw5uKBSfjM08juEzqbqoh1CP63RHd6h+UmnisXBXeqM+
	31pvvoqoidDAqLESs75bSviOyVPh0HsBZ7lhujcIvJ2ZpY/xJWXknSRrDFmsDx6FKKgD5FRk5Tj
	iNCrqSJiEYzjpQhyjZeOBgclLOAtrNV/+ohKfdv8ct3jVItEU57Yw4SUltj3J0M1MVJIhUonvQv
	Bru3+77N44C4HiHgHdkcBwUOlFH0IbmCr5rMY6GUckEbl9PUllgYLVv0GuOuLQC6DqfGJIK7IVP
	Zk0++V6T2QpSmlVc7TA=
X-Received: by 2002:a05:6300:408a:b0:3e0:b445:5612 with SMTP id adf61e73a8af0-3e7bfa4a6a0mr7089526637.14.1793085064628;
        Tue, 27 Oct 2026 00:11:04 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc21274sm2277512a12.8.2026.10.27.00.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:11:04 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: jiangshanlai@gmail.com,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	work@onurozkan.dev,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	qiang.zhang@linux.dev,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH v2 07/10] srcu: Detect duplicate callback enqueue at registration
Date: Tue, 27 Oct 2026 15:09:20 +0800
Message-ID: <20261027070923.3054462-8-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027070923.3054462-1-kunwu.chan@gmail.com>
References: <20261027070923.3054462-1-kunwu.chan@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the duplicate-callback check from srcu_do_enqueue() to
__call_srcu() entry so that detected duplicate registrations
are rejected before they reach the deferred-list enqueue path.
Use __ratelimit() to limit the diagnostic output (error message,
object dump, and stack trace) as a group.

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/srcutree.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index 1993ddbdb828..81423b3dffae 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -23,10 +23,12 @@
 #include <linux/kasan.h>
 #include <linux/llist.h>
 #include <linux/rcupdate_wait.h>
+#include <linux/ratelimit.h>
 #include <linux/sched.h>
 #include <linux/smp.h>
 #include <linux/delay.h>
 #include <linux/module.h>
+#include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/srcu.h>
 
@@ -1511,12 +1513,6 @@ static unsigned long srcu_gp_start_if_needed(struct srcu_struct *ssp,
 static void srcu_do_enqueue(struct srcu_struct *ssp, struct rcu_head *rhp,
 			    rcu_callback_t func, bool do_norm)
 {
-	if (debug_rcu_head_queue(rhp)) {
-		/* Probable double call_srcu(), so leak the callback. */
-		WRITE_ONCE(rhp->func, srcu_leak_callback);
-		WARN_ONCE(1, "call_srcu(): Leaked duplicate callback\n");
-		return;
-	}
 	rhp->func = func;
 	(void)srcu_gp_start_if_needed(ssp, rhp, do_norm);
 }
@@ -1526,6 +1522,10 @@ static void srcu_do_enqueue(struct srcu_struct *ssp, struct rcu_head *rhp,
  * disabled, so defer when interrupts are already off rather than enqueue into
  * an operation that may be in flight on this CPU.
  */
+static DEFINE_RATELIMIT_STATE(rcu_srcu_dup_rs,
+			      DEFAULT_RATELIMIT_INTERVAL,
+			      DEFAULT_RATELIMIT_BURST);
+
 static void __call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
 			rcu_callback_t func, bool do_norm)
 {
@@ -1539,6 +1539,17 @@ static void __call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
 	if (WARN_ON_ONCE(ssp->srcu_reader_flavor == SRCU_READ_FLAVOR_ATOMIC))
 		return; // Leak the callback rather than corrupt SRCU state.
 
+	if (debug_rcu_head_queue(rhp)) {
+		if (__ratelimit(&rcu_srcu_dup_rs)) {
+			pr_err("%s(): Duplicate call_srcu() CB %p->%pS()\n",
+			       __func__, rhp, rhp->func);
+			mem_dump_obj(rhp);
+			dump_stack();
+		}
+		WRITE_ONCE(rhp->func, srcu_leak_callback);
+		return;
+	}
+
 	/* Record the caller: the irq_work's stack says nothing about it. */
 	kasan_record_aux_stack(rhp);
 
@@ -1554,6 +1565,7 @@ static void __call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
 		if (READ_ONCE(sndp->draining) && !in_nmi()) {
 			WARN_ONCE(IS_ENABLED(CONFIG_PROVE_RCU),
 				  "call_srcu() re-entered during callback drain; leaking callback\n");
+			debug_rcu_head_unqueue(rhp);
 			return;
 		}
 		sdp = this_cpu_ptr(ssp->sda);
-- 
2.43.0

