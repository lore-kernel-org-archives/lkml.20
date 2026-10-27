Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793085074;
	b=sE2Nmj4ZaWUevwkG8HoFzt1tSJpvAneOFhCuLxTUNas4EHaA4YMSEmQ1vO4ILZ9TrymI
	 IiZUg/z/f2lUhPoPbqY/ogRPBPw+7VLGv+UoLBWLFhcMKZ+S6pc3ueRdVyqhRbmK5lvMi
	 u7MfZfh+j+armVi0qJgUh3efgySfWZvWcRYe5LEo+WMryyCTG2aRtLslyQkyL50H9Nyn9
	 wX/FBvuIC3nvybQ8KgqSooaru6OHOXR4+dTXPHTIEqTVQiocI917NCALmMCXaWnhzrSse
	 7dfotHwxAybKB44JbxXMj4TdW/l9oufVNrkWODeuhmhbDdkPw9mR/YpVuNC/U/4kGyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793085074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EX2mJSpl72ktyH+OGtj4F4ld0yqDuHLPm1BrtlwUfBE=;
	b=Zi4iESADeLeT2JKlhQxSVCuD7QZVHG+yG7cuKnsuDmHgzhR/8i3kkcpA984bAYv9g6HS
	 HrQNg54396QJQudZPcMmAHECUHwuD5V5+tkT6zQHVyETk0sIPSPT3tPHvxBdsLBPB8GV5
	 SmMaP8A97OcgeLrkS46oqQtm1WyxQHNLToZG/um4Guf9cdJLCZVeBISup1HSlWW6iKy8S
	 AmLKaRCd7fPgQDW6k7DEMRzRfJOoQUrGvSROTHOhFCkt3oxrwJgmmGKxGv21hGzHCFa01
	 +AM24vZwtMpewKr7tlyhdlNzemF22gCkV9QBOfKWuer4wNmPSyPTWDb69GtIpfGeT5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IkbBoUhb;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2EC606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D2EC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IkbBoUhb
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc758830601so2333289a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793085073; x=1793689873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EX2mJSpl72ktyH+OGtj4F4ld0yqDuHLPm1BrtlwUfBE=;
        b=IkbBoUhbnco4i2rJ35omtvuqyQN2EiO55AjB+mrSuW42fwW32vjhrRJwsNGstOtAWS
         /VbIxWjVN+WJV4U/7cePkmMIRbQYtg9lE+e5sTg5lPoLiZM/3Ugv6bgeklOnfzkQqjE8
         ljX82KRyknwBVANf8STvySoie0V+u/mZ174patxZJ3efYPEQQXE8PYh74CFgo88E7Y14
         PcY7TQNrE5omyMYPH4q0LB4EqS8v3CjzHKVaHQ8xH/lmzvRRvIF6LgDbZfV2Y6h0QaYO
         FrEgbOIzOpXxX7lOxMWqwFupDuAQWKwdsMT1DwNP/Jk129eTR3EDeE9ksO4FDb20rF9N
         /yTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793085073; x=1793689873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EX2mJSpl72ktyH+OGtj4F4ld0yqDuHLPm1BrtlwUfBE=;
        b=DCJPoGHlIF3SuLXHot7Rjm7E7FIphzXjoyRjTtjh5pfJ8rpWpQUQe/N+3SOgW6nEl2
         VJn6z3ZDaO9LLFdYYQfspdGKKcGpFAJKHgTqvCn2AxFXvK2kuCwiZEFKUFRt+crtRZ3O
         llzFRpDZHpSRUex5yCsUfEqv7X2Ld9LoyUD36iwB+/gmSLNfjjLEITpGbcJJIKzoIKmx
         ukSBsCEpP+sbGQmuNTZbCHWiM4w2zb2bLsg2W6yHH2WkHk7yNirfGx2BV97d6QxT/pQV
         Jlj41/2SUAPXEddKsOwHv3fv7W9iqEm6MqCyWtC5EBGbLiQYzOsot0K5Z8a40qeOStU+
         1aug==
X-Forwarded-Encrypted: i=1; AKwUvBzQEFO8PaXdjnbBx6LkkRUUiDJV40xB0zbnChzSgVJi0Y0Foc05iECXx0JIl0nbPMtJcQJ3LkEj41HivMY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbdOsXkl4xpytQedCeSf46DYcMEaM5AlTeY6cK3OcV6yt3tNea
	BrFf4i6ydPC5mLeL031i+z/LiSOQMLsDKvycHrvXdNI4JjVwp4EHppxD
X-Gm-Gg: AYBFou2dZSBbtbWBw77OxIdMhz9nbxOR10Ymgkc+f0/Rd2b+VgvCAArHK8c+BpI6f8a
	HR7HftMKPEDfCIpUtnFtQDBAQgexeZgrmpbGQVDAQpSBtPVtDzfeCVWTCFSJEmgXtU2DGZpLRip
	Z3NpxDA3tIYoi9hUhE5+0k/1mUfqnougYUjXJ+YFU3ON+fbfXruCmZ7xV312o6LAe7wsBEse1OM
	pDJ9pknasP77C5lcFOlZs+SfKTH+R2ecwFVc6M8FG2YgR3rx+TdAwA5b6s9QpNb8wxCArimVPsC
	5N1GyJkNdfTl5wTauEdqDhmtky5FXm3Hn3UZRuUdYKPuB/ORMPyOx/QTqMOu6NuzHRAhcBjSNb7
	EIZNU6mvaayAdFFEXrf8K9sy2ph7JLcbUah6m4PvE3YgeRgHEcdHJkx7hI9Lfv+Ah84gdAGp3Ts
	6synnVp4wKpl1MNJRtWstsGf5S+lzjm0MkdEMD2fT8O4Tv3zLv1HLgRbgFJlQngcxrxSmWRoEvL
	JVNYvmK/8hvNH2PvmXwBsi4sArzOU2UqFPgwdvA7z0tkChOZMrOdmpOjHtOPNozEk7UJiS8KQ==
X-Received: by 2002:a17:90b:1a92:b0:3a8:211b:6c8c with SMTP id 98e67ed59e1d1-3adeaae6e15mr7986056a91.22.1793085072791;
        Tue, 27 Oct 2026 00:11:12 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc21274sm2277512a12.8.2026.10.27.00.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:11:11 -0700 (PDT)
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
Subject: [PATCH v2 08/10] srcutiny: Detect duplicate callback enqueue
Date: Tue, 27 Oct 2026 15:09:21 +0800
Message-ID: <20261027070923.3054462-9-kunwu.chan@gmail.com>
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

Detect duplicate callback enqueue attempts at call_srcu()
entry, before the deferred list can be corrupted.  Use
__ratelimit() for the diagnostic output group.

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/srcutiny.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/kernel/rcu/srcutiny.c b/kernel/rcu/srcutiny.c
index 98864977bed2..4c1e8d8595b3 100644
--- a/kernel/rcu/srcutiny.c
+++ b/kernel/rcu/srcutiny.c
@@ -12,9 +12,11 @@
 #include <linux/irq_work.h>
 #include <linux/kasan.h>
 #include <linux/llist.h>
+#include <linux/mm.h>
 #include <linux/mutex.h>
 #include <linux/preempt.h>
 #include <linux/rcupdate_wait.h>
+#include <linux/ratelimit.h>
 #include <linux/sched.h>
 #include <linux/delay.h>
 #include <linux/srcu.h>
@@ -178,6 +180,7 @@ void srcu_drive_gp(struct work_struct *wp)
 	while (lh) {
 		rhp = lh;
 		lh = lh->next;
+		debug_rcu_head_unqueue(rhp);
 		debug_rcu_head_callback(rhp);
 		local_bh_disable();
 		rhp->func(rhp);
@@ -235,6 +238,8 @@ static void srcu_gp_start_if_needed(struct srcu_struct *ssp)
  * Also called by __srcu_defer_drain() to re-issue a deferred callback, so it
  * must not re-check the deferral condition.
  */
+static void srcu_leak_callback(struct rcu_head *rhp) { }
+
 static void srcu_do_enqueue(struct srcu_struct *ssp, struct rcu_head *rhp,
 			    rcu_callback_t func)
 {
@@ -272,6 +277,8 @@ static void __srcu_defer_drain(struct srcu_struct *ssp)
 	llist_for_each_safe(node, next, llist_del_all(&ssp->defer_cbs)) {
 		struct rcu_head *rhp = (struct rcu_head *)node;
 
+		/* Bounds a node self-linked by a double call_srcu(). */
+		rhp->next = NULL;
 		srcu_do_enqueue(ssp, rhp, rhp->func);
 	}
 	local_irq_restore(flags);
@@ -288,6 +295,10 @@ void srcu_defer_drain(struct irq_work *iw)
 }
 EXPORT_SYMBOL_GPL(srcu_defer_drain);
 
+static DEFINE_RATELIMIT_STATE(rcu_srcutiny_dup_rs,
+			      DEFAULT_RATELIMIT_INTERVAL,
+			      DEFAULT_RATELIMIT_BURST);
+
 void call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
 	       rcu_callback_t func)
 {
@@ -298,6 +309,17 @@ void call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
 	if (WARN_ON_ONCE(!func))
 		return;
 
+	if (debug_rcu_head_queue(rhp)) {
+		if (__ratelimit(&rcu_srcutiny_dup_rs)) {
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
 
@@ -306,6 +328,7 @@ void call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
 		if (READ_ONCE(srcu_defer_draining) && !in_nmi()) {
 			WARN_ONCE(IS_ENABLED(CONFIG_PROVE_RCU),
 				  "call_srcu() re-entered during callback drain; leaking callback\n");
+			debug_rcu_head_unqueue(rhp);
 			return;
 		}
 		rhp->func = func;
-- 
2.43.0

