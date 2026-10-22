Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702451;
	b=w8cqMwjPYVERJ94L05gP+gUDnTUba9AwGXx+4EUsXPfrv8/80F/L1NRDsaTxLqTn2f+w
	 KGVQtK0PQfKCHw5CQYqY6eCHonPqhFicgvHV8VSI8Y/PM0tp3CQRe9O3ybFqqogTBdQIZ
	 FSjwthkHuCcAirdYO7EodVYWMlg6929mtXG4nC5ty1bybpB9ZNxgW7rtgnM3L218gmgWT
	 64XGAhC9YoMBvlLr1BiqWmnxCHnI34ETddnUfRea3N6vtIQA6XhI0WKU88EDgHo48JNku
	 +y3wDA+RJDOOKyfvKBS3u4dR7DCdAaKiYED9pM75EV6l+m+w4XtC4qta6QaRL8gRhMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AE4c8qZkLEuD3bWD68hYum0BC77PeC40PBLBKrUJ+TQ=;
	b=emZUugIHKp0B7Z2Nv7m9Swz3jtf9u3GdmdKTUtKAD1owKkFMgdcieDKQgc0cnvoecpHO
	 2n2Vb908i+vQIttfmB/Ak/FqTl0pTCR6Q7RKK398cM6mbV/I8M0M4LBXh4pB+GRwX9Lvl
	 flfTkD4JCJnqd3EI9LZnmpdSlCUa4cF+Y2TjCrY79X0X52SkJumlmVwdDiB3T9GkFCiSt
	 +dQIkaA27nT0bGvBT1bCsUF9tibBKdD7AIzTL7HULe1Un6XSZp1iDK3BToZitsr6j93xK
	 twGjnILIcdzQ5J7RWlcANLA/zjtmJRHHc+V33P8ZcASbuq0xjvEkilTSlqs5Ks5GFrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n8WRq1XS;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C2A606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53C2A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n8WRq1XS
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso2489645e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792702449; x=1793307249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AE4c8qZkLEuD3bWD68hYum0BC77PeC40PBLBKrUJ+TQ=;
        b=n8WRq1XSfUOhSWeOAVM9FBBn9wnnCTDxt+vRKL19Wv/i1SBQ2McGoHY4n8yI6MOSJd
         lklpME1hgegMqCIDW+BZQqoHllUddxCvRRTetV5ZDxU/aGGO4ocMyaG8aZ4nhK8gDAU9
         mG2TeU+VOnRhjGR+IV3PDyOu5gKa2GYouwWviOefXS+BO9t3lMH/JEsD0YFY3YU+2V40
         3UwudxtvrOXqWEpquXu+5+DOKqmjD96Ewsm5pHtmJqVRHAqOxuAZ2xRA/BBdkuV+1hb9
         16H23SqYF/dCcVz1Lmw9LFaeEM7tYjU4wispXe4aLQI96rAzqiracV9LSPKsnwIXPkTd
         K4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702449; x=1793307249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AE4c8qZkLEuD3bWD68hYum0BC77PeC40PBLBKrUJ+TQ=;
        b=O+1xyCzOQoMn9Xw0nMfVPyx61gwCJAWqzG1wcEvlMefOjZc8/QF2jDJhDPsWugMA5V
         TgSdnGk4CRWbpVJlG12QSQLF/nhBYD19Jx3+iaoZv+BxGa1rvOpzLqonHSHJkhKVrcYe
         iFiFyaeMuIB7uyBE48IKLZsnyJ6cCeeBDSzws/GYhQCQHhEdJfk3F61ox8SbKgavH9dl
         U1LhbueetUgKBCW7AbJ95As/jflQpSSUxj1Z6St0f7erY6NOea71RnbUwTv82QnDAg0C
         Wm2OSfDrJzdm8q5GLRagxs7Fp2N88ZUNPmGCJ3OU6TITiDh/pRgAp3UHAa7RkzSkUt80
         QG5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxHmkoh43Sq4fBU3NapZ4g9XbzOnx+Rh8ioJVOZRdgN0Tu6lj1JlMa+A29u2uH1Ey2wDpIgQ7Ai7GQGsZk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzSDe39MjshbdVhfLfCvOWxGuz27v8TZna5uVc1GE6p1XlZAKr
	QDlfbqlJHHJx6c0WTQPkiwuQ4eY92e7r8s4NkAL8WmYlmPrtDyFIIGwsreZdaQ==
X-Gm-Gg: AYBFou3jkKc+B0e7haR5451/kehD6Pg4/APckZy0jQ/J7BzgWCPtk2qM0eHZmnvCu3W
	JFGtyVkAYjTW6JDRV0C781HitjuEWNWvvoloWmc+iWDNTLutiUNyeqs/lMvMMJKO6h0lX942bjS
	OwGYwDvg1qN4uy4+0lmSMxqo/H+Il3YhTiqqab+hRVqyXjqRACFekABwDXVk59JQYYsquapnnFl
	zu8YH57By3r0g4GliMBJnWOogg+JqMOI2Px+7xjl4HIOgT8nUlxjkzHIAVefa9dRkLlfdmG1mnQ
	X67Vf9lHZcytm0NuiurS1U/qB6Qgh841M53bgnP0YdqVQ9m/zhWK8UYbt7T7F+0fFGPBOLzpR/k
	dZRwuDS7OnxgxtfNW7MEsPTSpP7ed0ifNmiB6zoxZzuu5JdOK9iK51eEwJDoK6mU1myCu1DqajV
	denZRpLlCDhqqsEHizqK1TUHQ01a512qHKMN8mbZa5eqyK6Jcv1vZfnajMDnjMh/ulBkDxc6Yrz
	oA148e5ngkldh8PsoBS9r6SgdeVfQuXSts8EJyiD+sQu0vvXvCQ//zw8WWPfqpjrVO/KpyYo/bL
	UfjQBHNJW5RIJjHEcWk9XmG4gPLaji+pFoyaZSrk
X-Received: by 2002:a05:600c:e558:10b0:4a1:d8fc:8165 with SMTP id 5b1f17b1804b1-4a211ce42fdmr2054815e9.20.1792702448539;
        Thu, 22 Oct 2026 13:54:08 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38025d82sm431076f8f.16.2026.10.22.13.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:54:08 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lee Jones <lee@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] tracing: Drop the synthetic event ref when clearing hist triggers
Date: Thu, 22 Oct 2026 21:53:16 +0100
Message-ID: <20261022205405.1228742-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
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

clear_event_triggers() frees a hist trigger on a synthetic event without
dropping the se->ref taken by event_hist_trigger_parse(). Removing an
instance with such a trigger leaves the synthetic event busy forever.

Fixes: 4b147936fa50 ("tracing: Add support for 'synthetic' events")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
Applies on trace/for-next, depends on 3403d9bb27eb ("tracing/histograms: Verify event_call identity when updating synth_event refcount").
 kernel/trace/trace.h                |  2 ++
 kernel/trace/trace_events_hist.c    | 20 +++++++++++++-------
 kernel/trace/trace_events_trigger.c |  2 ++
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 0f0786700f99..e108f95fd609 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -1915,9 +1915,11 @@ extern const struct file_operations event_inject_fops;
 #ifdef CONFIG_HIST_TRIGGERS
 extern int register_trigger_hist_cmd(void);
 extern int register_trigger_hist_enable_disable_cmds(void);
+extern void hist_put_synth_event(struct trace_event_file *file);
 #else
 static inline int register_trigger_hist_cmd(void) { return 0; }
 static inline int register_trigger_hist_enable_disable_cmds(void) { return 0; }
+static inline void hist_put_synth_event(struct trace_event_file *file) { }
 #endif
 
 extern int register_trigger_cmds(void);
diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index f39fa8942673..9419edfd1b67 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -6756,6 +6756,17 @@ static bool hist_trigger_check_refs(struct event_trigger_data *data,
 	return false;
 }
 
+void hist_put_synth_event(struct trace_event_file *file)
+{
+	struct synth_event *se;
+
+	lockdep_assert_held(&event_mutex);
+
+	se = find_synth_event_call(file->event_call);
+	if (se)
+		se->ref--;
+}
+
 static void hist_unregister_trigger(char *glob,
 				    struct event_trigger_data *data,
 				    struct trace_event_file *file)
@@ -6811,7 +6822,6 @@ static void hist_unreg_all(struct trace_event_file *file)
 {
 	struct event_trigger_data *test, *n;
 	struct hist_trigger_data *hist_data;
-	struct synth_event *se;
 
 	lockdep_assert_held(&event_mutex);
 
@@ -6824,9 +6834,7 @@ static void hist_unreg_all(struct trace_event_file *file)
 			list_del_rcu(&test->list);
 			trace_event_trigger_enable_disable(file, 0);
 
-			se = find_synth_event_call(file->event_call);
-			if (se)
-				se->ref--;
+			hist_put_synth_event(file);
 
 			update_cond_flag(file);
 			if (hist_data->enable_timestamps)
@@ -6941,9 +6949,7 @@ static int event_hist_trigger_parse(struct event_command *cmd_ops,
 		}
 
 		event_trigger_unregister(cmd_ops, file, glob+1, trigger_data);
-		se = find_synth_event_call(file->event_call);
-		if (se)
-			se->ref--;
+		hist_put_synth_event(file);
 		ret = 0;
 		goto out_free;
 	}
diff --git a/kernel/trace/trace_events_trigger.c b/kernel/trace/trace_events_trigger.c
index 4d2fde996c0f..a2487ad7fef8 100644
--- a/kernel/trace/trace_events_trigger.c
+++ b/kernel/trace/trace_events_trigger.c
@@ -643,6 +643,8 @@ clear_event_triggers(struct trace_array *tr)
 		list_for_each_entry_safe(data, n, &file->triggers, list) {
 			trace_event_trigger_enable_disable(file, 0);
 			list_del_rcu(&data->list);
+			if (data->cmd_ops->trigger_type == ETT_EVENT_HIST)
+				hist_put_synth_event(file);
 			if (data->cmd_ops->free)
 				data->cmd_ops->free(data);
 		}
-- 
2.55.0

