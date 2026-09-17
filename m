Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767062F39C7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619643; cv=none; b=LS2v1Z2m8i22NNAhNyr+r3VsOJEBcPSF9a9PschcPGyUxPA0MJfivLDJLIPvcIACEBeY56DukioiabxCeLW/jddHBPIboYUFWvV6rPecIVWOHpDkr+RGK6nkNQFmfROI7ykrwGQmJI9VKjGZddUkxItnSPHrc7nwZtb4fLX8DxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619643; c=relaxed/simple;
	bh=eDxJlO1beYomrz1saE9Ne3C+Rx4WExHSJA7Wxz9vWhQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Uzc1lhAngehpbZEnXY7fZiSQakofNVaPSwEje0gUw+v3kbbpzzvNtn01PrsUaQW9aNGjddcVC8JSNo82ORB6AG5rNDIgIzak57Vo0zZ8+ds48yUbeQ0lcEZE6O7DL2k6i8Q3FIjHxglRL+Ckzwhx9WwDIZu8XEXl7jVprj9haDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MGGzQZNa; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MGGzQZNa"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d959904658so9097365ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789619641; x=1790224441; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gOgTtu/ydiLy3NCjRlGseZb8fPO1g55uwKhgB7FabPk=;
        b=MGGzQZNaegZJEKQq7+VO14El4OH7e1LQ5puhxAJHNenQu2KgOiULVbG9+uvCIjV3iP
         TDZYa7QGwuljkav4brPP32G90VA135cMlfayeelELikbbcJQ9qGlEQJmmDQ94c3w6KVe
         rzxScbn5zUOP1b5Bz5iHHjoyfrvmjpL2Zv5QSea4J4E8aktuHqtHWm4xcDQdMbEhTmsD
         NAOVflSkfp0PiWsi3nDI6N1Kgsp0r8WuDaWQp4sQ3RpP92prDI808X0cZxAbz4ostUAG
         OgxjXdpnHfqMT3yv7a8GMrIiLnpuxfk5AmwBxaDc3o7xoRTtCTpsejk5V8Zbel73pJyJ
         SfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619641; x=1790224441;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gOgTtu/ydiLy3NCjRlGseZb8fPO1g55uwKhgB7FabPk=;
        b=bH4KQ6e7LME/FaLXxbkr3V8ud4Ksp4uETHN3NCtxfHFFsMBDW347C7iCe8tK+FVuhZ
         MkAe9OJQ219tGqtPu1awlp6NGASsQ3fFhQUhqqq3wPyzhWt6vLHj4cuzgvy1zY4Wz+50
         SMibBOU5nsGuASs99XQZygWWJML89xQTAumWxRfGupQEkIF/cWsh11ZYGZWvvGkCAczi
         gD9Pyu3O6/AYRw6HNeoiOLPslBNwsbo/PdOBkniLpLTk53WpHFt01bKUHHyv99YkiCjl
         0CAiRQEiSwCA4vufjF0oL2e1x/8DFreVcFfzl99efAXrycF6qicuMDnjv2rrIwft3lbg
         HDGQ==
X-Gm-Message-State: AFuF++m4COvaeoN/XD4cpIllCdDyyHloGS9gwK2Byj56h2605Rhz5VAw
	b49EhBfWX/Do6wD/wY3PHJXK+d+zacq1R88N0GWrxfQN/X6AkJeSoIUBXj6mgbU3dB87chp+pdK
	1IvkojtANCw3VQc94u9I2lbnFS9BrePc7wgXra7C0Grem4ZAMKVtQoOUc6db+ItW0O8WIOVGalX
	yAq25BaqM77tI6NDjLyrizmiwDSmgHTX0PyuBdyNyEkXrqJS47f+iCe1c=
X-Received: from plhn4.prod.google.com ([2002:a17:903:1104:b0:2db:56c2:8176])
 (user=suleiman job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f60c:b0:2db:3d9a:173b with SMTP id d9443c01a7336-2dd8e17e0a6mr111390485ad.9.1789619640410;
 Wed, 16 Sep 2026 21:34:00 -0700 (PDT)
Date: Thu, 17 Sep 2026 04:33:29 +0000
In-Reply-To: <20260917043339.2093426-1-suleiman@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260917043339.2093426-1-suleiman@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917043339.2093426-6-suleiman@google.com>
Subject: [RFC PATCH 05/12] futex: Implement exit_ping_state_list().
From: Suleiman Souhlal <suleiman@google.com>
To: linux-kernel@vger.kernel.org
Cc: Suleiman Souhlal <suleiman@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	zhidao su <soolaugust@gmail.com>, John Stultz <jstultz@google.com>, 
	Qais Yousef <qyousef@google.com>, ssouhlal@FreeBSD.org
Content-Type: text/plain; charset="UTF-8"

Handle the case when a task exits while holding some ping_states,
unowning them and dropping their references.

Signed-off-by: Suleiman Souhlal <suleiman@google.com>
---
 kernel/futex/core.c | 55 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 13c7ea3a26b3..56c7e2d5faac 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -1430,6 +1430,58 @@ static void exit_pi_state_list(struct task_struct *curr)
 static inline void exit_pi_state_list(struct task_struct *curr) { }
 #endif
 
+/* Similar to exit_pi_state_list() */
+static void exit_ping_state_list(struct task_struct *curr)
+{
+	struct list_head *next, *head = &curr->futex.ping_state_list;
+	struct futex_pi_state *ping_state;
+	union futex_key key = FUTEX_KEY_INIT;
+
+	might_sleep();
+	WARN_ON(curr != current);
+	guard(private_hash)(current->mm);
+
+	raw_spin_lock_irq(&curr->pi_futex_lock);
+	while (!list_empty(head)) {
+		next = head->next;
+		ping_state = list_entry(next, struct futex_pi_state, list);
+		if (1) {
+			CLASS(hbr, hbr)(&key);
+			auto hb = hbr.hb;
+
+			if (!refcount_inc_not_zero(&ping_state->refcount)) {
+				raw_spin_unlock_irq(&curr->pi_futex_lock);
+				cpu_relax();
+				raw_spin_lock_irq(&curr->pi_futex_lock);
+				continue;
+			}
+			raw_spin_unlock_irq(&curr->pi_futex_lock);
+
+			spin_lock(&hb->lock);
+			raw_spin_lock_irq(&ping_state->ping_mutex.wait_lock);
+			raw_spin_lock(&curr->pi_futex_lock);
+			if (head->next != next) {
+				raw_spin_unlock(&ping_state->ping_mutex.wait_lock);
+				spin_unlock(&hb->lock);
+				put_ping_state(ping_state);
+				continue;
+			}
+
+			WARN_ON(ping_state->owner != curr);
+			WARN_ON(list_empty(&ping_state->list));
+			list_del_init(&ping_state->list);
+			ping_state->owner = NULL;
+			raw_spin_unlock(&curr->pi_futex_lock);
+			raw_spin_unlock_irq(&ping_state->ping_mutex.wait_lock);
+			spin_unlock(&hb->lock);
+		}
+		put_ping_state(ping_state);
+
+		raw_spin_lock_irq(&curr->pi_futex_lock);
+	}
+	raw_spin_unlock_irq(&curr->pi_futex_lock);
+}
+
 bool futex_robust_list_clear_pending(void __user *pop, unsigned int flags)
 {
 	bool size32bit = !!(flags & FLAGS_ROBUST_LIST32);
@@ -1475,6 +1527,9 @@ static void futex_cleanup(struct task_struct *tsk)
 
 	if (unlikely(!list_empty(&tsk->futex.pi_state_list)))
 		exit_pi_state_list(tsk);
+
+	if (unlikely(!list_empty(&tsk->futex.ping_state_list)))
+		exit_ping_state_list(tsk);
 }
 
 /**
-- 
2.55.0.1082.g2b9226bbc0-goog

