Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750800;
	b=FzpnVtQvePbu0b3j3MLA7POh5b7bN1mYcCt5ncs07E5zP/QerlmEp+oyw23SU6R7TX4M
	 /hkYo+NOQPP8L3ApSAlgtCJCCGmzEsWHle7YgwgaqfsO6TL+VO/KZvjx26VaDs2WHa69t
	 Cks+cQK79H3ZSxlemvbhZvZ35mhaLNf4oIPb6Vcm8WjuYlB3uutxHcg0K4y2folOftXAB
	 llJVXXPN2jo/zWAN+BKJbGJyYWB6d0YxQ0OTn/yMktsHNXWAyEr7jHhqMza1oATd/NV4M
	 1/MKl7tT7OpODkC2DYJ6FRCxdNG9+/oSaxwmf+eZzP6SswkA5PZEjp6/IZ2qjxVVRBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Cvh1e2ACKZ6dBS33vYatxd8Ssl5s8JzjtHSDS9Smmho=;
	b=zx9AsBTbMUndL9EVsXnQYL6Fc2CTYK/dUKuoH1LoBXvpJEGZUe641zBGtE+UU4KtmwJL
	 RwbbLqtRTUKCfVo2u/wvHR2tRx3PqJRZpLBFwOzbIcmuI5Y8DAJlwHQtrgocXly0xgzU1
	 CQ7LIXYnU7ORVX0IRKQ0WDBEokS/V+ORwApiysL44gX7Jw1cEjMbj7wZQ2htWEUEGIYXD
	 VI/GgOZjXDRK14kq+a1//j0ajCUAbzp+pMAAtHIlfpPxmyIGTZbcHMEsippHYDXFxdXYw
	 adcFiOjaRD17YPtrFDjU52iwZ70ekmgzmTKB6c+sul5n7TMfD5tRAsx/BF4Y3HzhQQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F8vFIoAj;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD296606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD296606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F8vFIoAj
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35b2c599f43so1723461eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792750799; x=1793355599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cvh1e2ACKZ6dBS33vYatxd8Ssl5s8JzjtHSDS9Smmho=;
        b=F8vFIoAjg93S+5E4TRlD1x9tixLp91pSGF3ufTJP2VdXXsexiqOikCYA7zExeiqRN9
         tf5gDjpcTNUewI28yhwmbgzXAU8OhJ+gzbdplIMv0AVptffhVcv3HJrO742scx7B1aPK
         woNlSsbYqUF2J1O7gsiC+LT9G7wgDTK8vI7A3Z7i7e4w2VqkB6wIliTshAU0NGL7gmR9
         ZCr+wskKXehRyrZRH0ct/CGne2+kW1ReXnUF7WQN4gwS4JVZy5LM53frhfJrp6P9Bpey
         iwaxdkbXxLXr7yw5U0nFAaZffoqqGuRUoF5kltnDtMoQku6Vt1rjZnXEYfJSLF68gdq4
         SW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750799; x=1793355599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cvh1e2ACKZ6dBS33vYatxd8Ssl5s8JzjtHSDS9Smmho=;
        b=F55X4wlIbOL45MZzLNtOhCaKh2X5+We47dEXorK+2H2q1Xm0qdDNsP9O2UmkEU+yER
         TOs4ENKuv5+VkDjwicaM/UBoq3URNLVPceG5jNn1LZsfOzsm1WPxuQaEHnZv+9Gs8a6y
         ylaWJjgDtH6A3pt0Y5AnJ4zuTAOt8y7ZRoJvFZNG+zYHN0+sh8J/WFbe8NSH4R5pCE5h
         YMngkyOHbCDA3iMiNGRPALkeJ+OHiPRlg71/Fba2dUeZzvGTAgqnaQ+p36hs57giCgpY
         oS8OXVfCBPDp4VhAKRD/EsGYgxM0f5W+XdM6yYcQvr8avbTlYj8jINOP2jF5j6MJUebH
         CyHw==
X-Forwarded-Encrypted: i=1; AKwUvBxIBLVFqJu/YQs7+78v0lodToxc95EJZ5VsRUF3Dq1i+/GT2rUvXi2VvpeFxxA5WWz0Zn1Sw0Mu7bcJKKc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJA4C4By3zqnQDhN81Ywd/7VhowWuhIw+vxxz+DQ2R6zRqQn55m
	mMzclmQyhpdzOOIakMR7lAKEdfw1qNFx+MBUhxVkjApFSfyeaBks5hsQwZfTMmpSxWRAzA==
X-Gm-Gg: AYBFou3tQtRsDSFeaQk019BUNYsxFBaHhRTNHx38Bq0drgw6Qxa2P9aIx3Eo/UCycVi
	4E7h1qjHOaCakhD24tfz8O2oGphuuzUnfvax251Xjn8pIgppXBJQbaxgOH+vWmo2CjUqAMbMWro
	v8qcJXIWrq4tNWjbQC9/7H/Wr4FgI5TJQwAYfexhA6VsqHNzMj5bfmwTrrnZN5V1qFFV9h4ak6c
	99NCRmlvdcCzMUIv262guXT80NIdJDIbNV+UcElebkIES9QPj/M1rZxEWxkI+Sv7u8/68xd6vn4
	UbdiA0NsggzJXhPkq0v/5O74T8o59KYwBc2MgWBWRX83yy4dZ0sbbrKate3acXAtNHX+bnJZDgH
	VCfcy+8QDKSK8kjRA7+Gft6zQVOVJqDZeP+xdL2lZahAAJilxinzB/RaTM2JaWavsRMjkSju6Wx
	ahxOObzcMELyJWZ/B9/D3FFDjPOnQ05uV5DVcNC5VnyhC2VloOZeFWCaYgHT1o/53NgDEwWTRTB
	Bn/2tMf6+KYpFoIrS2J3V9diNa1zmR5kMgjbWORWJsqHLUP2RVbLVILpZYgJQBf1r+g3HEWyw==
X-Received: by 2002:a05:693c:6384:10b0:35d:f7f4:bc1c with SMTP id 5a478bee46e88-369d971e05bmr2648699eec.6.1792750798851;
        Fri, 23 Oct 2026 03:19:58 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9deef9bsm5852176eec.22.2026.10.23.03.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:19:58 -0700 (PDT)
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
Subject: [PATCH 9/9] rcu-tasks: Detect duplicate callback enqueue
Date: Fri, 23 Oct 2026 18:18:41 +0800
Message-ID: <20261023101841.2910719-10-kunwu.chan@gmail.com>
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

Detect duplicate callback enqueue attempts in the generic
RCU Tasks callback registration path.

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/tasks.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index 5d7f234795b4..49b716feb31d 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -6,6 +6,7 @@
  */
 
 #ifdef CONFIG_TASKS_RCU_GENERIC
+#include <linux/mm.h>
 #include "rcu_segcblist.h"
 
 ////////////////////////////////////////////////////////////////////////
@@ -339,9 +340,12 @@ static void call_rcu_tasks_iw_wakeup(struct irq_work *iwp)
 }
 
 // Enqueue a callback for the specified flavor of Tasks RCU.
+static void rcu_tasks_leak_callback(struct rcu_head *rhp) { }
+
 static void call_rcu_tasks_generic(struct rcu_head *rhp, rcu_callback_t func,
 				   struct rcu_tasks *rtp)
 {
+	static atomic_t doublefrees;
 	int chosen_cpu;
 	unsigned long flags;
 	bool havekthread = smp_load_acquire(&rtp->kthread_ptr);
@@ -358,6 +362,16 @@ static void call_rcu_tasks_generic(struct rcu_head *rhp, rcu_callback_t func,
 	if (WARN_ON_ONCE(!func))
 		return;
 
+	if (debug_rcu_head_queue(rhp)) {
+		if (atomic_inc_return(&doublefrees) < 4) {
+			pr_err("%s(): Duplicate call_rcu_%s() CB %p->%pS()\n",
+			       __func__, rtp->name, rhp, rhp->func);
+			mem_dump_obj(rhp);
+		}
+		WRITE_ONCE(rhp->func, rcu_tasks_leak_callback);
+		return;
+	}
+
 	rhp->next = NULL;
 	rhp->func = func;
 	local_irq_save(flags);
@@ -586,6 +600,7 @@ static void rcu_tasks_invoke_cbs(struct rcu_tasks *rtp, struct rcu_tasks_percpu
 	raw_spin_unlock_irqrestore_rcu_node(rtpcp, flags);
 	len = rcl.len;
 	for (rhp = rcu_cblist_dequeue(&rcl); rhp; rhp = rcu_cblist_dequeue(&rcl)) {
+		debug_rcu_head_unqueue(rhp);
 		debug_rcu_head_callback(rhp);
 		local_bh_disable();
 		rhp->func(rhp);
-- 
2.43.0

