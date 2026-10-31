Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793469142;
	b=AMa1wmeRszWTbTDRSTHr5AbmTfzyldQ2OupkFJfKGFe5RPYs7ovEQBLZ3xF4ZALaHUoN
	 tlKUGswhowd//gl2iYiEeSsD6NEzlxAYRMhpMIrVG1m6Z6OEKDwf6iOtjs9+H49UwNlAv
	 WGS7UoV2Qitl+aWpivKBXBWDLgheyKtrORSbejwQGkMzYBrA2+f/g69kgJyoEYXeZSkl4
	 OfyQcePImaGY0sGjlpXZ5LraZ2Gp1zzl89ff+8afhRSbeQm80TiINqrPBBn8sW74v2V92
	 oOAovXqv9Vy3Csj80hGZ1zfLC7Ck70iQ58c3emhoUF72JRPnCXxFwKtBzYw18MrlVDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793469142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=XKpSNaYPIFBe7psLxXuqPwh0OVaqKktwXLrY4cQL8M4=;
	b=NrgVB5M7Wa/vPVyPSp5VXYfd0mxZmqBWBjINdDLJM8ZJrzVj5C3tN3wlyr8Q/vT0SALO
	 Wiopgp2vypgqaUQxiRZDiYp5QHI43PQSlpm/yr6aSQHTfpSspfLa8wp+0PC1QBW9T4W+5
	 tqUFRGXBVCtUyaUjq0MxzAqWiNEp5xLwZQ06Mk0atT8QHrbINynSOvIh31xfGVN4B8j69
	 Ivt4pIokxPuQ/BbDmDEgC89/Flj+h+XewELXzukqBaqTKM0sD4oKUWtm9B3oNFQ38/FPU
	 xJfcmwL5zNch10PA71Y9EkWCngRVwicAk8OiJHQUQuhj9v2GtiSTBppYQv/B9r2EFYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V8SharBF;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FA5606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0FA5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V8SharBF
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-369f33df08eso3468690eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793469141; x=1794073941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XKpSNaYPIFBe7psLxXuqPwh0OVaqKktwXLrY4cQL8M4=;
        b=V8SharBFVely1YNWpjJAJpbi4Lsed5zJoHsnaxkpf75vRugMdigswYTrE4M3gDavUZ
         sfQURxveoFLwMYTzerHMCdoNwPY8y+k53/wpjBWDw6Ts3ne3QdWSP7EbKKCchPiMlCJX
         m5on8r2MYmAdszfYnIIqhkAWr65mOGkz5QnrsKDB5IMn1gITF2aj6yrPMetfVb0P3A2R
         8pUZ06Mzl4KoOtt1XNpRr4CAluAnZF0P3OvVER+AF4Boe4J1N2IpnoPZJLKKAfsRe5zl
         Uo6LFR972RfVvy5GSnToD731SYDEFpOB7Xd6gw4iGpaQ3efKmhdoj6tW6IwExEiH2mO2
         f88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793469141; x=1794073941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKpSNaYPIFBe7psLxXuqPwh0OVaqKktwXLrY4cQL8M4=;
        b=h5ZSzr/1NAo0FNRqRMM4kIHWLJ3+q0rhGewfGDR0U81h4GqtQf6ehDmyttali5PLy2
         urW9K3ZHOvawGx6H4ehNQO3lz+88OYRQNasq2m3mZKVUe2o7tLg4U9kLoo/ZvWDgAgoq
         6ArDn0l0xN/L3Awocy9hL6pBexPNvXhayRoWiDiyxa28iwLqlZQkoWWlS3pEpMBn/Moa
         qlLrG+8cV4L7I6cxCbmGW2FJy1n2ZhgFy5/RcES3y05lucblwNGETMJl2IY5IGaDN4EL
         Q5uPO5ObkSt/XC+O1sYG8kN9PhcYyof+aq+c6x74cxtpZqQPKWSvkYyJeBRhHrfKhbr3
         g/vQ==
X-Gm-Message-State: AFq9FYISsMl2Ozp+bGyjQwPVx6ViKQIhIb23TlVPrRN/xF0yrqOJ69t7
	DcyxSP2GqZ2DVz66HpN5vFIx7GrLILVc0DNcpcceD6QgcVC9U2mOJnUg
X-Gm-Gg: AYBFou3l6LhggJ6+aFmPyEb3Mmw5uulGSyjgSc+snPCBQkGwxMrVy86++AvJZrNcOfN
	pUxq4MRdx9oWodoOBEjbJZYKjefI5WKY5MyuFN2LiIyyKZ/1p5hF7hXhCk9BoXhcD3apQ0z1i+e
	DAgiB4GHpWYCOW6FEDNTuuZSIrpBd9gfJJjZOhdfbHJ3Wo5t9gTpUKnJVnkAr9+IrTSuJbp8A/A
	qJRy09DGgXOJ8lLGoxo/NL4hbDzeN7tRrTsHF9zZLTMKqKlGaB7VvBVqC14I8DXzyWrJfIfPNi1
	qVLkXTZLnrYD58OL4HRFcKG2CJyx43TRl/4Rn/aQXw9tUt2RUvivfiL4EJcRAbI9sewjvN1bvsd
	M9lQlL1YmChzli0ZwYVQ4sY8L/iRYYK7xINxP8gdNCTdSVD4Jq6vKiTupFsvL2ic7NCZaCt/8ZP
	p53MoufUabjiUeF/7Si1vkqFRnAYZ0sFMBjWFLNuPwl4V/buW4Fs2L+Gc15lUvcQOYa51lR56sw
	nP1wp0ya7QJtfA1wMCtWyqASSYOVQrcfQX9W7CHrpTNIKF5AZXp8W5Gf2tJy17Bel7TEa1GCzJG
	7dy04WqhG+R6uynkr9iAz3Xd5NSeEqUgGP6b/rvfITdV4WnuahEoRL4woCl9pyyoDbaSB7uKQqz
	R9w==
X-Received: by 2002:a05:7300:2a91:b0:36a:1bd4:627f with SMTP id 5a478bee46e88-36a423a9d6fmr7991386eec.14.1793469140462;
        Sat, 31 Oct 2026 10:52:20 -0700 (PDT)
Received: from Terra.tail0ac356.ts.net ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm27088158eec.16.2026.10.31.10.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 10:52:19 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH v3] ftrace: Complete subops teardown on shutdown failure
Date: Sat, 31 Oct 2026 10:52:13 -0700
Message-ID: <20261031175213.704021-1-bestswngs@gmail.com>
X-Mailer: git-send-email 2.56.0
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

ftrace_shutdown_subops() unlinks a subop before rebuilding the manager
hashes, but leaves it enabled and managed when rebuilding or updating
fails. unregister_ftrace_graph() cannot recover from that partial
teardown, and a later registration can corrupt the empty manager state.

Always detach and clear the subop once shutdown begins. Keep conservative
manager hashes behind per-subop filtering when an update fails, and disable
direct graph dispatch until those hashes are exact again. If the last
manager cannot be shut down, disable ftrace and normalize its list, flags,
count, and hashes before the caller releases the graph operation.

Cc: stable@vger.kernel.org
Fixes: 0ae6b8ce200d ("ftrace: Fix accounting of subop hashes")
Reported-by: Xiang Mei <xmei5@asu.edu>
Assisted-by: OpenAI Codex <noreply@openai.com>
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 kernel/trace/fgraph.c          | 35 +++++++++++++++++----
 kernel/trace/ftrace.c          | 57 +++++++++++++++++++++-------------
 kernel/trace/ftrace_internal.h |  3 ++
 3 files changed, 68 insertions(+), 27 deletions(-)

diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
index ed455b535..1a8e092ec 100644
--- a/kernel/trace/fgraph.c
+++ b/kernel/trace/fgraph.c
@@ -1306,7 +1306,7 @@ static void ftrace_graph_enable_direct(bool enable_branch, struct fgraph_ops *go
 
 	static_call_update(fgraph_func, func);
 	static_call_update(fgraph_retfunc, retfunc);
-	if (enable_branch)
+	if (enable_branch && !static_key_enabled(&fgraph_do_direct.key))
 		static_branch_enable(&fgraph_do_direct);
 }
 
@@ -1315,13 +1315,27 @@ static void ftrace_graph_disable_direct(bool disable_branch)
 	if (FGRAPH_NO_DIRECT)
 		return;
 
-	if (disable_branch)
+	if (disable_branch && static_key_enabled(&fgraph_do_direct.key))
 		static_branch_disable(&fgraph_do_direct);
 	static_call_update(fgraph_func, ftrace_graph_entry_stub);
 	static_call_update(fgraph_retfunc, ftrace_graph_ret_stub);
 	fgraph_direct_gops = &fgraph_stub;
 }
 
+void fgraph_update_direct_func(struct ftrace_ops *ops, bool enable)
+{
+	struct fgraph_ops *gops;
+
+	if (ftrace_graph_active != 1 || !(ops->flags & FTRACE_OPS_FL_GRAPH))
+		return;
+
+	gops = container_of(ops, struct fgraph_ops, ops);
+	if (enable)
+		ftrace_graph_enable_direct(true, gops);
+	else
+		ftrace_graph_disable_direct(true);
+}
+
 /* The cpu_boot init_task->ret_stack will never be freed */
 static int fgraph_cpu_init(unsigned int cpu)
 {
@@ -1406,16 +1420,24 @@ int register_ftrace_graph(struct fgraph_ops *gops)
 	gops->ops.flags |= FTRACE_OPS_FL_GRAPH;
 
 	ret = ftrace_startup_subops(&graph_ops, &gops->ops, command);
-	if (!ret)
+	if (!ret) {
 		fgraph_array[i] = gops;
+		if (ftrace_graph_active == 1)
+			ftrace_graph_enable_direct(true, gops);
+	}
 
 error:
 	if (ret) {
 		ftrace_graph_active--;
+		gops->ops.flags &= ~FTRACE_OPS_FL_GRAPH;
 		gops->saved_func = NULL;
 		fgraph_lru_release_index(i);
-		if (!ftrace_graph_active)
+		if (ftrace_graph_active == 1) {
+			ftrace_graph_enable_direct(true, NULL);
+		} else if (!ftrace_graph_active) {
+			ftrace_graph_disable_direct(false);
 			unregister_pm_notifier(&ftrace_suspend_notifier);
+		}
 	}
 	return ret;
 }
@@ -1423,6 +1445,7 @@ int register_ftrace_graph(struct fgraph_ops *gops)
 void unregister_ftrace_graph(struct fgraph_ops *gops)
 {
 	int command = 0;
+	int ret;
 
 	if (WARN_ONCE(!(gops->ops.flags & FTRACE_OPS_FL_GRAPH),
 		      "function graph ops unregistered without registering"))
@@ -1447,9 +1470,9 @@ void unregister_ftrace_graph(struct fgraph_ops *gops)
 	if (!ftrace_graph_active)
 		command = FTRACE_STOP_FUNC_RET;
 
-	ftrace_shutdown_subops(&graph_ops, &gops->ops, command);
+	ret = ftrace_shutdown_subops(&graph_ops, &gops->ops, command);
 
-	if (ftrace_graph_active == 1)
+	if (ftrace_graph_active == 1 && !ret)
 		ftrace_graph_enable_direct(true, NULL);
 	else if (!ftrace_graph_active)
 		ftrace_graph_disable_direct(false);
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 673a54fdf..831f04de6 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -3667,6 +3667,8 @@ static int rebuild_hashes(struct ftrace_hash **filter_hash, struct ftrace_hash *
 	bool first = true;
 	int ret;
 
+	*filter_hash = EMPTY_HASH;
+	*notrace_hash = EMPTY_HASH;
 	temp_hash.filter_hash = EMPTY_HASH;
 	temp_hash.notrace_hash = EMPTY_HASH;
 
@@ -3708,7 +3710,13 @@ static int rebuild_hashes(struct ftrace_hash **filter_hash, struct ftrace_hash *
  * will not affect functions that are being traced by other subops that
  * still exist in @ops.
  *
- * If the last subops is removed from @ops, then @ops is shutdown normally.
+ * Once removal starts, @subops is detached even if rebuilding the manager
+ * hashes fails. The old manager hashes are conservative in that case and the
+ * remaining subops continue to filter callbacks. If the last-manager shutdown
+ * fails, ftrace is disabled before the manager state is discarded.
+ *
+ * Return: 0 on success or a negative error code if the manager could not be
+ * updated or shut down.
  */
 int ftrace_shutdown_subops(struct ftrace_ops *ops, struct ftrace_ops *subops, int command)
 {
@@ -3716,9 +3724,6 @@ int ftrace_shutdown_subops(struct ftrace_ops *ops, struct ftrace_ops *subops, in
 	struct ftrace_hash *notrace_hash = EMPTY_HASH;
 	int ret;
 
-	if (unlikely(ftrace_disabled))
-		return -ENODEV;
-
 	if (WARN_ON_ONCE(!(subops->flags & FTRACE_OPS_FL_ENABLED)))
 		return -EINVAL;
 
@@ -3727,36 +3732,45 @@ int ftrace_shutdown_subops(struct ftrace_ops *ops, struct ftrace_ops *subops, in
 	if (list_empty(&ops->subop_list)) {
 		/* Last one, just disable the current ops */
 
-		ret = ftrace_shutdown(ops, command);
+		if (unlikely(ftrace_disabled))
+			ret = -ENODEV;
+		else
+			ret = ftrace_shutdown(ops, command);
 		if (ret < 0) {
-			list_add(&subops->list, &ops->subop_list);
-			return ret;
+			bool enabled = ops->flags & FTRACE_OPS_FL_ENABLED;
+
+			FTRACE_WARN_ON_ONCE(!ftrace_disabled);
+			remove_ftrace_ops(&ftrace_ops_list, ops);
+			if (enabled && ftrace_start_up > 0)
+				ftrace_start_up--;
+			ops->flags &= ~(FTRACE_OPS_FL_ENABLED |
+					FTRACE_OPS_FL_ADDING |
+					FTRACE_OPS_FL_REMOVING);
+			ops->func = ops->saved_func;
 		}
 
-		subops->flags &= ~FTRACE_OPS_FL_ENABLED;
-
 		free_ftrace_hash(ops->func_hash->filter_hash);
 		free_ftrace_hash(ops->func_hash->notrace_hash);
 		ops->func_hash->filter_hash = EMPTY_HASH;
 		ops->func_hash->notrace_hash = EMPTY_HASH;
-		subops->flags &= ~(FTRACE_OPS_FL_ENABLED | FTRACE_OPS_FL_SUBOP);
-		subops->managed = NULL;
+		goto out;
+	}
 
-		return 0;
+	if (unlikely(ftrace_disabled)) {
+		ret = -ENODEV;
+		goto out;
 	}
 
 	/* Rebuild the hashes without subops */
 	ret = rebuild_hashes(&filter_hash, &notrace_hash, ops);
 	if (ret < 0)
-		return ret;
+		goto out;
 
 	ret = ftrace_update_ops(ops, filter_hash, notrace_hash);
-	if (ret < 0) {
-		list_add(&subops->list, &ops->subop_list);
-	} else {
-		subops->flags &= ~(FTRACE_OPS_FL_ENABLED | FTRACE_OPS_FL_SUBOP);
-		subops->managed = NULL;
-	}
+
+out:
+	subops->flags &= ~(FTRACE_OPS_FL_ENABLED | FTRACE_OPS_FL_SUBOP);
+	subops->managed = NULL;
 	free_ftrace_hash(filter_hash);
 	free_ftrace_hash(notrace_hash);
 	return ret;
@@ -3767,8 +3781,8 @@ static int ftrace_hash_move_and_update_subops(struct ftrace_ops *subops,
 					      struct ftrace_hash *hash)
 {
 	struct ftrace_ops *ops = subops->managed;
-	struct ftrace_hash *notrace_hash;
-	struct ftrace_hash *filter_hash;
+	struct ftrace_hash *notrace_hash = EMPTY_HASH;
+	struct ftrace_hash *filter_hash = EMPTY_HASH;
 	struct ftrace_hash *save_hash;
 	struct ftrace_hash *new_hash;
 	int ret;
@@ -3800,6 +3814,7 @@ static int ftrace_hash_move_and_update_subops(struct ftrace_ops *subops,
 	} else {
 		free_ftrace_hash_rcu(save_hash);
 	}
+	fgraph_update_direct_func(subops, !ret);
 	return ret;
 }
 
diff --git a/kernel/trace/ftrace_internal.h b/kernel/trace/ftrace_internal.h
index 3235470e6..3d5934b1c 100644
--- a/kernel/trace/ftrace_internal.h
+++ b/kernel/trace/ftrace_internal.h
@@ -16,6 +16,7 @@ int ftrace_startup(struct ftrace_ops *ops, int command);
 int ftrace_shutdown(struct ftrace_ops *ops, int command);
 int ftrace_ops_test(struct ftrace_ops *ops, unsigned long ip, void *regs);
 int ftrace_startup_subops(struct ftrace_ops *ops, struct ftrace_ops *subops, int command);
+/* Once started, shutdown always detaches @subops, even when it returns an error. */
 int ftrace_shutdown_subops(struct ftrace_ops *ops, struct ftrace_ops *subops, int command);
 
 #else /* !CONFIG_DYNAMIC_FTRACE */
@@ -52,6 +53,7 @@ static inline int ftrace_shutdown_subops(struct ftrace_ops *ops, struct ftrace_o
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 extern int ftrace_graph_active;
+void fgraph_update_direct_func(struct ftrace_ops *ops, bool enable);
 # ifdef CONFIG_DYNAMIC_FTRACE
 extern void fgraph_update_pid_func(void);
 # else
@@ -59,6 +61,7 @@ static inline void fgraph_update_pid_func(void) {}
 # endif
 #else /* !CONFIG_FUNCTION_GRAPH_TRACER */
 # define ftrace_graph_active 0
+static inline void fgraph_update_direct_func(struct ftrace_ops *ops, bool enable) {}
 static inline void fgraph_update_pid_func(void) {}
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
 
-- 
2.56.0

