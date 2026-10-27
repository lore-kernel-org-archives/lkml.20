Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793085106;
	b=zKWvvtBIrZoQ+feSCH5IZVfHbX4pa3uQ0i7KgqZcbk9Ty1XsCoS85NxGQ6MH4Hh9wwRd
	 WViESLCKEo/76AJqUNQff4/Iks9wbfTL+RKfnIEIVyWNVcXjkyEIfOyYOfmdGDPpMyxii
	 r7jgLt6YiiEo0DuXWS9fUmO19DGl/yDRvMT0bbpFv/mlSe5yVsxSbYCAf+r+tf++IRJYl
	 wAURcwp5kebK5e45isbxGMNpaCI1OywDNqXXjuLdap9ql6odINTVIoYd6S6NUqgW08uJh
	 HStTwsqV0FnUVVseZ7BgcmI5j1gjUquUQj4Ixdp3F+hwjV4Ad8lOFfc2sZJN/bN1O6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793085106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A0PZdMuRaPuxrFktKEqu16aYTR0a+VKbukOtArUVV0U=;
	b=Zk8SOreO5NhSnDZp+IIiRuRcyQUmdghfipL0iQcXWMW3naCvIU6P2qyhBgglHa6RDM0t
	 s3OUvksApzlOJDTDoWjAjcFl6AB9Y3nXRI7KVwUjpyWu4sC2QQYRXAUjF0QJCzMJeu2nq
	 Z/IVefk4ZjB6hXODjjr56sWVC7KlPSNJrWgiDnyHCoo2WYKL1uMwWVxDPySvQ6usBXYdz
	 8r+9ad5/gHihB5u0HpyDulKjcmNjBxEKX1pghfegKpsI8vpHFxxlrXl2iyZwEV6jN9lOK
	 v9JnMEDMhylPGWMxS+fxGqagiIy6mweM5hOumUbn9hjIVzJO0ZBrHHXe1JrLPhr1sUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jik7A2vp;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEFE606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CEFE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jik7A2vp
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a06b27bf9bso1997752b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793085105; x=1793689905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0PZdMuRaPuxrFktKEqu16aYTR0a+VKbukOtArUVV0U=;
        b=Jik7A2vp3a8DxHlOpMaXpyKknv7ORvGbKPPLW479LXSs7vv53qGBPZ84i+NZCDZhPe
         r3hfkCaCZ4aOh/Al3jxAlmvVlSbLcjAc6hkX1TblTa0TtBkt9ZLzNBejNj769KZ0/Vde
         nEVIz48TwL4ERW+Hs2XDJxKMK/sLfG7QwSb5HKN+9tUQJLm+wigkhnk3+wkd1YDJsy9R
         bVu/cbxXaDEvl0XoRf10ZLLo82M20ioUHAk0wzN9N40PoYSnOscvkYKl7l79/JKyAr+Q
         q1QkCkQ7wVfXevHkXQ0VxTIchmrWtj0Wfx1PMYh3EGkxybgFyQXFDyCixV8BeoOCz4PM
         NfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793085105; x=1793689905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A0PZdMuRaPuxrFktKEqu16aYTR0a+VKbukOtArUVV0U=;
        b=ev58Bt/ajstL7bAADqOVCDyYe50dUNHYJ3Mw351jiAuh0famk6+fef3fxLepw8zVs5
         DIhcXE56lF1y0LS0Qn6/0lU/piTozrZF+cKmpmgakaLZyReoZcqr+EYE2GRsr1Ts1e+5
         WoGx5Lze+9slIrIEtPj6az9ApzbNXU0sOtI9ePLgXiAEQPKRsDU+s13oenwEJHJSRFb2
         DZ3Hn1rHQgbB44O6chq88QedcP2/ZT/CZFHW2fl/9zEYDV20zQdEURaCER59tMJP4okY
         VDeX5OJ31CRYfldVrfVXOqEa8VuElGAhoJJPc3ue7uJVjB6M5s+I6oJ8ssyeNoKx20DW
         tLug==
X-Forwarded-Encrypted: i=1; AKwUvBx35IXaXpz5uW8iDQhMhzoe3EED26V95onmlISJePpSQ+rOt8/7c+L8QT1UrwZP04UJ7fm0NiwLSdYYhDA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOixsJ+nWfLVppYKl9D3WrSz/3qIBsblOzZzcM0Ckt984kyBYb
	wEFvJ5CK7Hc7Wtfe50w1unhZQZvERgznG1YM1weww1SD0kXK5vlkKTq1
X-Gm-Gg: AYBFou2hTyRqGAvmPB7Jrv8qociwBZwhF8+A+871vyg8UTMg9mv7EJn+Sgf9dEwDdJC
	/axVNyQPiuMphnH5dW8C8jSz4MBMxYXGKl+aR2WmwyEEp+ZOhfadJLO0ptxAZ0LrShwHQEXgn7H
	YiPiWFFw1AAfITUMil9k5hn7NVd/DC5Yb1cOJc+gApTlNBH83NSzCaMSBBqyEyluOPIzsAposkc
	ib5Fvt4YmEdwHGO/5ubN2fZjMk2g960y96KEtloqa84oHvD3XiJprImJcDxgfszKSMHQvHg9nTX
	K7MjX3vUUpiQUDubdl0p3DhNpJLUqXbGUK3BpGpr+YDz0kotlLduCS/3XjyQetWT7q7sxGTTeeJ
	hJR/5ZfUaZuLG9zJgbPE7FhW5udVX1vSHoZAR5ZdCTXJSBHGknmRwRQ42ZksUw+7zMT7/u3Oxba
	2D5Ris4whoI3v9U8kdC1u47IQDeRRvM3kWnByMEzQDm05xTW+yfxR2s+qjb830i6F3tRtAN3cev
	dXDdUCTlpkZ/a2bTbs7/Jf64PJZnqsLJhAE7NJb+6LlKyG3FVHdzXpH5BirgaY1ENhMFJY06PV/
	ccIAOI3q2fA8q7jQZK8sqCQzy7zczIyu3FjeInM7tAG0TH4=
X-Received: by 2002:a05:6a20:258d:b0:3e1:de28:8ebc with SMTP id adf61e73a8af0-3e7bfaaea6emr6520063637.49.1793085104791;
        Tue, 27 Oct 2026 00:11:44 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc21274sm2277512a12.8.2026.10.27.00.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:11:44 -0700 (PDT)
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
Subject: [PATCH v2 10/10] rcu: Improve duplicate callback diagnostics
Date: Tue, 27 Oct 2026 15:09:23 +0800
Message-ID: <20261027070923.3054462-11-kunwu.chan@gmail.com>
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

Use ratelimited diagnostics with dump_stack() for duplicate
callback detection in rcu_do_enqueue().

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/tree.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index aea3aef7397e..a8ede50dbeff 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -25,6 +25,7 @@
 #include <linux/rcupdate_wait.h>
 #include <linux/interrupt.h>
 #include <linux/llist.h>
+#include <linux/ratelimit.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/nmi.h>
@@ -3154,9 +3155,12 @@ static void check_cb_ovld(struct rcu_data *rdp)
  * already disabled, and a drain of a remote CPU re-issues onto the draining
  * CPU.
  */
+static DEFINE_RATELIMIT_STATE(rcu_dup_rs,
+			      DEFAULT_RATELIMIT_INTERVAL,
+			      DEFAULT_RATELIMIT_BURST);
+
 static void rcu_do_enqueue(struct rcu_head *head, rcu_callback_t func, bool lazy_in)
 {
-	static atomic_t doublefrees;
 	unsigned long flags;
 	bool lazy;
 	struct rcu_data *rdp;
@@ -3167,9 +3171,10 @@ static void rcu_do_enqueue(struct rcu_head *head, rcu_callback_t func, bool lazy
 		 * Use rcu:rcu_callback trace event to find the previous
 		 * time callback was passed to call_rcu().
 		 */
-		if (atomic_inc_return(&doublefrees) < 4) {
+		if (__ratelimit(&rcu_dup_rs)) {
 			pr_err("%s(): Double-freed CB %p->%pS()!!!  ", __func__, head, head->func);
 			mem_dump_obj(head);
+			dump_stack();
 		}
 		WRITE_ONCE(head->func, rcu_leak_callback);
 		return;
-- 
2.43.0

