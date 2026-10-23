Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750787;
	b=vFuN2ytmoLW6NPHAp6htClgxt3tOYA8yUldglMSITyNor7RbPa+HyJHmQ8d4/H9WsGIq
	 ikseRhww+VEAEzTbMdRP5v9S4uRWJQAw9TjMYmDHUQfbzdhkQMshJKooMIYqDAzBgaEJN
	 v6flGyaaYGoKMGHTQmdD+Aw9+SJMXxIwQMVOnwCtREOLk21UvQMT3UVtHvtYkj42wA5cE
	 zsyBTkrYf1Ggg6TVM9TPyMQ29rqIQ74M0SXplaxPDv2Ukytp0+HrtJihdMspB46OyA3vk
	 V90c2pwC4Ic1Pp1Ojz4jy3f35ojZLQQDX7sbOdC4uSS8ZRu3oVoJGWvaaH4WRNXulBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ysCvLZPGVtFGxSlHiZpjqvLUwJkgfMWFoc/Ns4wjzwM=;
	b=RvcKkl+dH5LeSyvQzffFqibIMeEVPTkmbeuFaC5CIFpaRqYGfxIEB9ZupwtNPqX2x1cD
	 XY3coTQzj/k7dtHXJQA63PkD9wVTc+fvIoVHqMtYd51tTZRWRSg5lRTlvQUeMs+Qtqxpk
	 bLNMXtU6eONstyL30tC1xN3/PX2gQZPNNe2+PvuTIR1gDItRgiMDa+doiklLvJsk8oK1f
	 An/4olG8feJidTbUa4jX0l/pJIUt7n3MDAwG+vY9XdHql0/5HRdAawvbZd1L3S13EHXa0
	 hXJimUDt08gTCB8Y4nLIyArPuTe86AoD79kseMYwK0bU1sWY5G0mRvdBSHQgnFLiBJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZG7+Ukz8;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CD8606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11CD8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZG7+Ukz8
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1931ff67a29so114803c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792750786; x=1793355586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ysCvLZPGVtFGxSlHiZpjqvLUwJkgfMWFoc/Ns4wjzwM=;
        b=ZG7+Ukz8SjtUGehbJKVuTa1/UwNmO84XZM68Wpfmck/BPHDtnJXsuEez9Wkbo2fZR/
         VWDSM0I/2IaYpJvkE5mgSXzfmBJCyct0dBZeYyJi/qX8xMCl/JtOLX7Bm+abk4+Jug65
         rwtDXLPaKQr7W3ZMJTEy/uIe85jCVSK2T2atQQF7Q23WDTPXLJu0kXE9o5jL0JQkfVT2
         u/tnQGTaQg2mSDGTJJ76iNaPcDAJ4DWDedpAL3aMyburXZ+nHOfHrTxDJm2/rtn2m4Kv
         rkhFsNpa7Vr1mnNSKth6F7hYG9LcA7hCCmGQRytk9dY4I1WQEBJ/4Cp9KOSf9vTA6LD8
         CPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750786; x=1793355586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ysCvLZPGVtFGxSlHiZpjqvLUwJkgfMWFoc/Ns4wjzwM=;
        b=1m7jqWnyHnaxTZTA0PPWwjVkZbwYoxYgi0INA56c9PRQUSVcYS38tky2tOSVY4ESkL
         rP2WxRWtzY+NaefKcRF4zHNqVBTHQh9jS5a7VYHBQ9wsSz9ozDRWmkW0dyBD87qk64Aj
         GoyecnXRrKs/AQiljbg5/411kocAmOCPUIoVZxEoOaKiowVoP0lOu98rq0diJn1UZZ4i
         UM8/p+LryS9QIt4gf85+nGX1kT6xA+t2ZEKtbxqXdEswBtKuy/3sdKJcfiUYvtmrBjxm
         eLntCpSwcUdq1fi9bXM221OWWHASponHp0Xyd/ZzEt9VlVGdE9xUTDViZjtAm0cVq0mu
         X4mg==
X-Forwarded-Encrypted: i=1; AKwUvBzns6zYZ9LByxp1QOc77aDl08mvm4q6+r3NclLU8Dfe56XG9lC42H6k477QLSZcNV2HhXJ2MCFp+1DAKdA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrUNwjfPhqN1fkFx3650fOyIvNTJcSt2D5AWczPYjWOa1UVREL
	0lwWVr+wfNa0/q3434gJ0hMg2JLfeG9q1XH5cbgleo/81HmADlI7flOx
X-Gm-Gg: AYBFou1aqtcvW8yyEMark9cqneKUC3pxX5XvZn0CMrm2G4NvtwHCAtSYxQT+2MCIPfi
	wlaDZU7q64RqaqIpjfGiMDwsxACF6XQ8WlwgK1kEVM+pM+nNlnPUSLQc+2h9QRqt50bLySkBGMb
	vy5TlnRV0Du35gjG4XiOLy92PiQP/bDSrq2TLMQMXbIa5b85LlGHLtl9KI+jXnTigPVnpxICl8g
	ul54/UE7hlQiI76AeRLX2pgy/fsGtEFQuKhiWd/IhDqZ2f8JbY9UbMe9VRzT9sGWFJ1YCegn+hS
	tcOTnOp9LnwWJLWmkOmq34Jh6T5rzSQza8ZD4A8vij7hU5xlwxHMzk/FBEjBES7T1xQJ+nfw7wy
	KCWHlieXQWdGlZye46IuFTuPuvKj3vFNWMdbflGM9VxvB3ImWVuMTo3HnWMC+UdiSzZZjtueeOj
	GEIzXdZK7dGHZ7yepEVkhbWGyu7Drf87N5N5Y7IDSI3DY5DWMixVfBzmr/UfEH3WbJSFZRvavNe
	4CikajgL1BY8d3IbbSkdVnt2lCJGK7AyXlMbVDMkFsOR0JfFWLOp957f9ekTRXOVMWlfFwp5g==
X-Received: by 2002:a05:7301:490c:b0:367:941:c253 with SMTP id 5a478bee46e88-369d9730ee9mr2529100eec.11.1792750785795;
        Fri, 23 Oct 2026 03:19:45 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9deef9bsm5852176eec.22.2026.10.23.03.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:19:44 -0700 (PDT)
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
Subject: [PATCH 7/9] srcu: Detect duplicate callback enqueue at registration
Date: Fri, 23 Oct 2026 18:18:39 +0800
Message-ID: <20261023101841.2910719-8-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023101841.2910719-1-kunwu.chan@gmail.com>
References: <20261023101841.2910719-1-kunwu.chan@gmail.com>
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
Report the callback address, function symbol, and object
information, rate-limited to the first three occurrences.

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/srcutree.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index 1993ddbdb828..3838d9fdf532 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -27,6 +27,7 @@
 #include <linux/smp.h>
 #include <linux/delay.h>
 #include <linux/module.h>
+#include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/srcu.h>
 
@@ -1511,12 +1512,6 @@ static unsigned long srcu_gp_start_if_needed(struct srcu_struct *ssp,
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
@@ -1529,6 +1524,8 @@ static void srcu_do_enqueue(struct srcu_struct *ssp, struct rcu_head *rhp,
 static void __call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
 			rcu_callback_t func, bool do_norm)
 {
+	static atomic_t doublefrees;
+
 	/* Misaligned rcu_head! */
 	WARN_ON_ONCE((unsigned long)rhp & (sizeof(void *) - 1));
 
@@ -1539,6 +1536,16 @@ static void __call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
 	if (WARN_ON_ONCE(ssp->srcu_reader_flavor == SRCU_READ_FLAVOR_ATOMIC))
 		return; // Leak the callback rather than corrupt SRCU state.
 
+	if (debug_rcu_head_queue(rhp)) {
+		if (atomic_inc_return(&doublefrees) < 4) {
+			pr_err("%s(): Duplicate call_srcu() CB %p->%pS()\n",
+			       __func__, rhp, rhp->func);
+			mem_dump_obj(rhp);
+		}
+		WRITE_ONCE(rhp->func, srcu_leak_callback);
+		return;
+	}
+
 	/* Record the caller: the irq_work's stack says nothing about it. */
 	kasan_record_aux_stack(rhp);
 
@@ -1554,6 +1561,7 @@ static void __call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
 		if (READ_ONCE(sndp->draining) && !in_nmi()) {
 			WARN_ONCE(IS_ENABLED(CONFIG_PROVE_RCU),
 				  "call_srcu() re-entered during callback drain; leaking callback\n");
+			debug_rcu_head_unqueue(rhp);
 			return;
 		}
 		sdp = this_cpu_ptr(ssp->sda);
-- 
2.43.0

