Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793085088;
	b=4RRVNxnbI8QbRnIGVYHqvA9cNIcXGvERfgpiVIZ4XNqedtHIBJKXMMGG99KUfqUQBL9D
	 B6alLiLi7HniT2eN5jpgvVHAufyjlpb3YLgpSapFbwijUlS76KKeOcvFi5FlupPXnfUgw
	 7XpVbQb9u+m8Q6Qgz0zi5P8qajuSVcvRDZSquQIICbvu0rW0qliHiOTMNBCc0zx219z3w
	 xEIif+ieEdJ93O4GLlEJJWJe/2EpYT4Ukd1NHQduY288X1VXP1vNDQRK74pgtA9EalitS
	 9uExEmhypQoH2Ua36eZDldi0iBzE40I/OPQlaaNv4EE84w90z4JNFVL7oPLMke16i+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793085088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E2GQKIdQM5uzG68snbI8euOUnqyt2y2f++AHs+X3HGc=;
	b=cDTzFXjsh4Gvnnhcme6/PQGe/urxkrsuXcEMGu0c1047qkDJBSsE32qJdkQ8KDHQykBU
	 jdVXnywwZ72Gopi6Vrvy3BqRvuFNVq1zDpcTQ+IBf7REHfSJj0cyx1Kysw2rpDYPGQFzM
	 QKuEEd7RhKRCDtNHex+khsrjaNUbPXttXHEZ89M8QBlZhVKvH4NgdEvl9aheCN0Jf4Fxh
	 hng4XLqsGiDRZh177iZBaKV9U3N15T2FtrxP3uBAVGaEs+zKOSgLHFswnZI2JeCImLFxT
	 P7AsncJaiN2iko7c1dXqqnBaS0uylecZEYodxyL0f59XH1zPJCbYIC3kb4MWIexnOaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YoQqTe3S;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC36606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCC36606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YoQqTe3S
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06454116eso1613779b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793085087; x=1793689887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2GQKIdQM5uzG68snbI8euOUnqyt2y2f++AHs+X3HGc=;
        b=YoQqTe3SrIoBPo2uF4cYQWKrrGQe91OgWdKUfDqkgsHpbHTw7L2/kNBomGuzGKG0Ec
         FeJ4lDvCtryNw+42J9ldJwC62wNwkB0YR61ARdaa50IQD2PhWNDgPqkSYDthN8tVos5X
         KcU6TO2LlAeGuAUakXuLNg8dTE5Nc0sX3zUefH1W5sOfF6F+9+/q8hJ+AerFmA/H+e/4
         0I23ooQMWZbPZI17ArUAov7xDx9hMhHVr0dWvOkBW9bjKOlnGYL99jAx9s9mnyHGjq6V
         R6MxtQbVGScKFIPDjCjcflWYgjXRKu0bpnQgUnnXFp19jtZRyM8F12wAzq0PYFAkKa9h
         /bNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793085087; x=1793689887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E2GQKIdQM5uzG68snbI8euOUnqyt2y2f++AHs+X3HGc=;
        b=1dpPh1kMvV/Z3xsQEoR0dbOs6qILWW2hYwze8BZx59sQ7n1eMjV0p/1sc05uBjY2s2
         hQL2dLEvx5mIvjCDJrTOe57Tr+qtONGO7pwitARjSlYUdrTjxFyKlNV8UWGVocmQz2yG
         JKjebUZsa5WSwrZERWKtu2lzhJVbTpk/kETxHC3ItLcDirn2sMXR3Y1l9eWMZpVCqdsr
         siAvWCm/cm/2K5NlCk1jIOAUVuGIwLMhT4uJNUbjUleXyOq/bOL5QLedUUXESlDazxnv
         7uhTlcmbfwl33Z2NRDMJzMehwG7kcTupYMQ+a0/uNyoPWzdqUK0j1RGRcZXYC5Za6aGK
         Qpmg==
X-Forwarded-Encrypted: i=1; AKwUvByNamt7h8y73EYrBjp/XpqAcAuKqueyvHM1L69bqJwNHkBLLpkPusuwKbXTNfb0IblilVQOXs49LEwMn6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUYEGTCz6twnMlJsQFcTEewQJi3N1WtKymrZCIayQxL1IW+2jX
	zQDdMiZJmoCuuM+FaL388cABphOZ4PwLvhD1IHUtbI1e/Ntr/UAm8ff4
X-Gm-Gg: AYBFou3g/jIpOS+fraxmkkMmM0Pl90DWN997JLqs6FqxlyaJiFmGxLLJkj+o8oMcovJ
	hF69JO5GIvCnvvBKGfrwzIsfNhQnO343+SiHJtdjsrWkNJ1h97qfdKZJoU7R20fZkJdujc6+cFt
	SOCxHEClcMobUCSa5w6cklGBtkpM3zu/h2TeLjNYCeJu/FWR+w1LaKpIgoSm/jKYSR1XiEtfevI
	GyIPygfHWm0xXp7jdYaIHm4lWCHRxxogWifRDn5Li6YNOTu4TiOfcwcDIJV1Ho8VWw0SR+E7fwJ
	viv3Db6WBQZwlqMpVF4qHlbIwl1ERCpJy/Mk26rGSKdQYuJE7xpKrCYSEEOeXIEsEy97LO1ZCf5
	D6mCLrdJYCzZMEFcnSktIkDTT8j3VWt2VxXCvQp1jKHjmAwe0WVHkEoVkEZgQpPkbIudfPlZVzn
	AB+MxjcjimkuJn7z+ICgRV81b2E8BFxf4YM4LEc4ywwqt6CNsdp7dTqaCzOC2RVQjrk2EPO8PCN
	KOiq5htq1s0hhSow1eQO9RBfrF8Q9UrzKV1c6DrYndtWmKSrcFH6X38PCyNBwReIAAR/IgvGQ==
X-Received: by 2002:a05:6300:4096:b0:3e2:b482:ba2e with SMTP id adf61e73a8af0-3e7bfa3401bmr6314626637.14.1793085086813;
        Tue, 27 Oct 2026 00:11:26 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc21274sm2277512a12.8.2026.10.27.00.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:11:26 -0700 (PDT)
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
Subject: [PATCH v2 09/10] rcu-tasks: Detect duplicate callback enqueue
Date: Tue, 27 Oct 2026 15:09:22 +0800
Message-ID: <20261027070923.3054462-10-kunwu.chan@gmail.com>
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

Detect duplicate callback enqueue attempts in the generic
RCU Tasks callback registration path.  Use __ratelimit()
for the diagnostic output group.

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/tasks.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index 5d7f234795b4..d5d060a5c4b6 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -6,6 +6,8 @@
  */
 
 #ifdef CONFIG_TASKS_RCU_GENERIC
+#include <linux/mm.h>
+#include <linux/ratelimit.h>
 #include "rcu_segcblist.h"
 
 ////////////////////////////////////////////////////////////////////////
@@ -339,6 +341,12 @@ static void call_rcu_tasks_iw_wakeup(struct irq_work *iwp)
 }
 
 // Enqueue a callback for the specified flavor of Tasks RCU.
+static void rcu_tasks_leak_callback(struct rcu_head *rhp) { }
+
+static DEFINE_RATELIMIT_STATE(rcu_tasks_dup_rs,
+			      DEFAULT_RATELIMIT_INTERVAL,
+			      DEFAULT_RATELIMIT_BURST);
+
 static void call_rcu_tasks_generic(struct rcu_head *rhp, rcu_callback_t func,
 				   struct rcu_tasks *rtp)
 {
@@ -358,6 +366,17 @@ static void call_rcu_tasks_generic(struct rcu_head *rhp, rcu_callback_t func,
 	if (WARN_ON_ONCE(!func))
 		return;
 
+	if (debug_rcu_head_queue(rhp)) {
+		if (__ratelimit(&rcu_tasks_dup_rs)) {
+			pr_err("%s(): Duplicate CB for %s, %p->%pS()\n",
+			       __func__, rtp->name, rhp, rhp->func);
+			mem_dump_obj(rhp);
+			dump_stack();
+		}
+		WRITE_ONCE(rhp->func, rcu_tasks_leak_callback);
+		return;
+	}
+
 	rhp->next = NULL;
 	rhp->func = func;
 	local_irq_save(flags);
@@ -586,6 +605,7 @@ static void rcu_tasks_invoke_cbs(struct rcu_tasks *rtp, struct rcu_tasks_percpu
 	raw_spin_unlock_irqrestore_rcu_node(rtpcp, flags);
 	len = rcl.len;
 	for (rhp = rcu_cblist_dequeue(&rcl); rhp; rhp = rcu_cblist_dequeue(&rcl)) {
+		debug_rcu_head_unqueue(rhp);
 		debug_rcu_head_callback(rhp);
 		local_bh_disable();
 		rhp->func(rhp);
-- 
2.43.0

