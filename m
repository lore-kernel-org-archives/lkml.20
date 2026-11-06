Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988483;
	b=r6ZoZv2aZGyvIZssutNaMVUipJS069SrmPDzT0EiMlmt8WLLCnq1zfJpEQqezwbgbTTK
	 Cexo0cnVX0eJh0pxPrEBpaHYyXouvi3RgijxjERBPmAOfBx2iePZ8trt/HTm3yrFJlXIS
	 R7HmxJSoG7wAp8VlV2DYxcIGRJfmBFvKJuqS4WFuXW9qjNZzANqD0q3zzVZELfF/8rrrs
	 Wkr12Q4yFkQYb1heIjlSH79Urff/NfDNpHyRH2hiB8RyZe1O4mZi9fUxAb6d0L+pWdMiI
	 BL+zk0Kz0d+U9neXA1sPrQEMYeeb3GaFSI2o8htXi6jlFnWfXBnd1QA4R4BCtYgCe9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=nPsdaBxxvXRIOafL/gj9O/KAWXfrOnN2AhuXc9Snvng=;
	b=fi7eOjHzGveU922hBJ0zIJJbEQ8S3NDTNI0OG6t4jsCzStVChEGAAewGpkf/KkTCtjvW
	 lpHWxUhe/JVIlqGZ7dOlSABkW+DNybMiAvDM4K8JClO2QFRD0CqNpflKn5U1g7wjAzJZi
	 1Ygw+e0OyZsXhRnPCDSXelUwSSe9QJ5CK736/jI6BCrvc4rk0ZBjuc8s85aIUxzKtqRJ6
	 RebBppKPjnscSh9f+01J/EJWnNNUDXIxSlnsISmec70wAkDshVYBTwiJ8/C1Y1JV5vc2b
	 AHFA+H00oy6LbklunBjPYN1mooLLLsRa1jAzxdAsY6gtm8VKvGDMuNUjmjJ3rR1eMWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mouhhFSI;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9A86082BE1
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B9A86082BE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mouhhFSI
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4b64722b5e6so9858605e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793988481; x=1794593281; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nPsdaBxxvXRIOafL/gj9O/KAWXfrOnN2AhuXc9Snvng=;
        b=mouhhFSI7EXYtK1PYeNpYmm6ud0Mr1ewW5Lb9VrjA9fWKbtnfViDeH2RvwAXeZtg8u
         9SKRlxs+fy3HO+Do7oy38iNszQZHpMW2oinLPjIr2L4mP1yLeQDEYJ5vCadWfy6FpZ+1
         EMEhS9eKbMhOhm+sLY6+HimQn84MVWvJhuLPXMCemkvWxn7gTM1TVTpy4Fln6fw8pqL4
         Yc88YclV4Ij2wywQ4jXPgrXHla7JRo13LQVU85VAr4TEgcAmMhHlfl5vYUx2nyG+7L9N
         hSt8A0mxhRIgFN96d2gRPLUfXyDLbVer7+pLSGHtgdYiT4QDkkbvqQ4Jrct8+LG2V83N
         Qx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988481; x=1794593281;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nPsdaBxxvXRIOafL/gj9O/KAWXfrOnN2AhuXc9Snvng=;
        b=2Zuk7zmWnGoUCrN3SR73+rPrKBHqHOpSwdDmFv0Z45VwBA10D9Uq3V90XRuAm4+rKY
         aF5xPbd4LRNcts/1L2NEfrUKlmoLjJZiYLRj3LRCnIQHuZeDKjXU5DWMti2WT9hivSDJ
         mOgZcVACjJ3SdS+bgSUkOMICDaWJ0251awJB0jxP9SpdycyyvM6F4Vafr+CvrLpIfRnz
         SCPK/YwL981wzQ98DM5puv9D/ikj0+AL5ZfUmzs6PwhV2NHbWuvHmi66xGjw/AolrgIO
         /xsDM4wsaT4ohDWXyyRAG18GFDmPjQcxGdSe0/q83fzp+14kSb/1qPJg/u5xIaBXaPhg
         FixQ==
X-Forwarded-Encrypted: i=1; AKwUvByjihtIxHn+rq82KzUkiDWx7q7qxzdavq1Yg+9oXYCmBDT19Yc51vICSGmeiuj9T2i+9L6qTXaYCOpdzjc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8q+SjQYNoD5JI3+o9Sr8+sq0YKqxq0+GSnGj9hWdwkPHpASYv8
	BVU/cH9BPG3wr/DnW2xudp/fpBB0kqDB/hYovI71fqQZ0aN7o/a1jrrUq7zNzbQptWws9i7g787
	pgLvOi2D1E46+WNzpkrwXvQ==
X-Received: from wmwz19-n1.prod.google.com ([2002:a05:600d:6413:10b0:4a1:f4c2:f6c7])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6994:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4b6df11de39mr60373835e9.14.1793988481445;
 Fri, 06 Nov 2026 10:08:01 -0800 (PST)
Date: Fri,  6 Nov 2026 18:06:52 +0000
In-Reply-To: <20261106180657.2460376-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106180657.2460376-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106180657.2460376-17-vdonnefort@google.com>
Subject: [PATCH v8 16/21] tracing/remotes: Add dump_on_panic tracefs file
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

When enabled, dump_on_panic will dump the content of the trace remote
buffer if the system panics.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/trace_remote.c | 228 ++++++++++++++++++++++++++++++------
 1 file changed, 190 insertions(+), 38 deletions(-)

diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 276bf94e837b..2946f263c79c 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -7,6 +7,8 @@
 #include <linux/kstrtox.h>
 #include <linux/lockdep.h>
 #include <linux/mutex.h>
+#include <linux/nmi.h>
+#include <linux/panic_notifier.h>
 #include <linux/tracefs.h>
 #include <linux/trace_remote.h>
 #include <linux/trace_seq.h>
@@ -22,6 +24,7 @@ enum tri_type {
 	TRI_CONSUMING,
 	TRI_NONCONSUMING,
 	TRI_DMESG,
+	TRI_PANIC,
 };
 
 struct trace_remote_iterator {
@@ -59,6 +62,9 @@ struct trace_remote {
 	unsigned int			poll_cnt;
 	unsigned int			poll_ms;
 	bool				tracing_on;
+	bool				panic_on;
+	struct notifier_block		panic_notifier;
+	struct trace_remote_iterator	*panic_iter;
 	struct delayed_work		poll_work;
 };
 
@@ -71,10 +77,15 @@ static bool trace_remote_loaded(struct trace_remote *remote)
 	return !!remote->trace_buffer;
 }
 
+static void trace_remote_unload(struct trace_remote *remote);
+static int trace_remote_panic_load(struct trace_remote *remote);
+static void trace_remote_panic_unload(struct trace_remote *remote);
+
 static int trace_remote_load(struct trace_remote *remote)
 {
 	struct ring_buffer_remote *rb_remote = &remote->rb_remote;
 	struct trace_buffer_desc *desc;
+	int ret = 0;
 
 	lockdep_assert_held(&remote->lock);
 
@@ -89,15 +100,28 @@ static int trace_remote_load(struct trace_remote *remote)
 	rb_remote->swap_reader_page = remote->cbs->swap_reader_page;
 	rb_remote->priv = remote->priv;
 	rb_remote->reset = remote->cbs->reset;
+	remote->trace_buffer_desc = desc;
 	remote->trace_buffer = ring_buffer_alloc_remote(rb_remote);
 	if (!remote->trace_buffer) {
 		remote->cbs->unload_trace_buffer(desc, remote->priv);
 		return -ENOMEM;
 	}
 
-	remote->trace_buffer_desc = desc;
+	if (remote->panic_on) {
+		ret = trace_remote_panic_load(remote);
+		if (ret)
+			trace_remote_unload(remote);
+	}
 
-	return 0;
+	return ret;
+}
+
+static void trace_remote_unload(struct trace_remote *remote)
+{
+	trace_remote_panic_unload(remote);
+	ring_buffer_free(remote->trace_buffer);
+	remote->trace_buffer = NULL;
+	remote->cbs->unload_trace_buffer(remote->trace_buffer_desc, remote->priv);
 }
 
 static void trace_remote_try_unload(struct trace_remote *remote)
@@ -115,9 +139,7 @@ static void trace_remote_try_unload(struct trace_remote *remote)
 	if (!ring_buffer_empty(remote->trace_buffer))
 		return;
 
-	ring_buffer_free(remote->trace_buffer);
-	remote->trace_buffer = NULL;
-	remote->cbs->unload_trace_buffer(remote->trace_buffer_desc, remote->priv);
+	trace_remote_unload(remote);
 }
 
 static int trace_remote_enable_tracing(struct trace_remote *remote)
@@ -440,12 +462,20 @@ static struct trace_remote_iterator
 
 	lockdep_assert_held(&remote->lock);
 
-	if (type == TRI_NONCONSUMING && !trace_remote_loaded(remote))
-		return NULL;
-
-	ret = trace_remote_get(remote, cpu);
-	if (ret)
-		return ERR_PTR(ret);
+	switch (type) {
+	case TRI_NONCONSUMING:
+		if (!trace_remote_loaded(remote))
+			return NULL;
+		fallthrough;
+	case TRI_CONSUMING:
+	case TRI_DMESG:
+		ret = trace_remote_get(remote, cpu);
+		if (ret)
+			return ERR_PTR(ret);
+		break;
+	case TRI_PANIC:
+		break;
+	}
 
 	if (!trace_remote_has_cpu(remote, cpu)) {
 		ret = -ENODEV;
@@ -453,40 +483,46 @@ static struct trace_remote_iterator
 	}
 
 	iter = kzalloc_obj(*iter);
-	if (iter) {
-		iter->remote = remote;
-		iter->cpu = cpu;
-		iter->type = type;
-		trace_seq_init(&iter->seq);
+	if (!iter) {
+		ret = -ENOMEM;
+		goto err;
+	}
 
-		switch (type) {
-		case TRI_DMESG:
-			/* only one dmesg iter allowed */
-			if (WARN_ON_ONCE(remote->dmesg)) {
-				ret = -EBUSY;
-				break;
-			}
-			smp_store_release(&remote->dmesg, iter);
-			fallthrough;
-		case TRI_CONSUMING:
-			trace_remote_inc_poll(remote);
-			break;
-		case TRI_NONCONSUMING:
-			ret = __alloc_ring_buffer_iter(iter, cpu);
-			break;
+	iter->remote = remote;
+	iter->cpu = cpu;
+	iter->type = type;
+	trace_seq_init(&iter->seq);
+
+	switch (type) {
+	case TRI_DMESG:
+		/* only one dmesg iter allowed */
+		if (WARN_ON_ONCE(remote->dmesg)) {
+			ret = -EBUSY;
+			goto err;
 		}
-
+		smp_store_release(&remote->dmesg, iter);
+		fallthrough;
+	case TRI_CONSUMING:
+		trace_remote_inc_poll(remote);
+		break;
+	case TRI_PANIC:
+	case TRI_NONCONSUMING:
+		ret = __alloc_ring_buffer_iter(iter, cpu);
 		if (ret)
 			goto err;
-
-		return iter;
+		break;
 	}
-	ret = -ENOMEM;
+
+	return iter;
 
 err:
 	kfree(iter);
-	trace_remote_put(remote);
-
+	switch (type) {
+	case TRI_PANIC:
+		break;
+	default:
+		trace_remote_put(remote);
+	}
 	return ERR_PTR(ret);
 }
 
@@ -509,14 +545,18 @@ static void trace_remote_iter_free(struct trace_remote_iterator *iter)
 		fallthrough;
 	case TRI_CONSUMING:
 		trace_remote_dec_poll(remote);
+		trace_remote_put(remote);
 		break;
 	case TRI_NONCONSUMING:
+		__free_ring_buffer_iter(iter, iter->cpu);
+		trace_remote_put(remote);
+		break;
+	case TRI_PANIC:
 		__free_ring_buffer_iter(iter, iter->cpu);
 		break;
 	}
 
 	kfree(iter);
-	trace_remote_put(remote);
 }
 
 static bool trace_remote_iter_is_consuming(struct trace_remote_iterator *iter)
@@ -990,6 +1030,113 @@ static int dmesg_show(struct seq_file *s, void *unused)
 }
 DEFINE_TRACE_REMOTE_ATTRIBUTE(dmesg);
 
+static int trace_remote_panic_handler(struct notifier_block *self, unsigned long ev, void *v)
+{
+	struct trace_remote *remote = container_of(self, struct trace_remote, panic_notifier);
+	struct trace_remote_iterator *iter = smp_load_acquire(&remote->panic_iter);
+	int cpu;
+
+	if (!iter) {
+		pr_warn("Unexpected error: no panic iterator for the trace remote\n");
+		return NOTIFY_DONE;
+	}
+
+	for_each_possible_cpu(cpu)
+		ring_buffer_iter_reset(iter->rb_iters[cpu]);
+
+	while (trace_remote_iter_read_event(iter)) {
+		trace_seq_init(&iter->seq);
+
+		trace_remote_iter_print_event(iter);
+		trace_seq_putc(&iter->seq, 0);
+		pr_emerg("%s", seq_buf_str(&iter->seq.seq));
+
+		trace_remote_iter_move(iter);
+		touch_nmi_watchdog();
+	}
+
+	return NOTIFY_DONE;
+}
+
+static int trace_remote_panic_load(struct trace_remote *remote)
+{
+	struct notifier_block *notifier = &remote->panic_notifier;
+	struct trace_remote_iterator *iter;
+
+	lockdep_assert_held(&remote->lock);
+
+	if (remote->panic_iter)
+		return 0;
+
+	iter = trace_remote_iter(remote, RING_BUFFER_ALL_CPUS, TRI_PANIC);
+	if (IS_ERR(iter))
+		return PTR_ERR(iter);
+
+	smp_store_release(&remote->panic_iter, iter);
+
+	notifier->notifier_call = trace_remote_panic_handler;
+	notifier->priority = INT_MAX - 1;
+	atomic_notifier_chain_register(&panic_notifier_list, notifier);
+
+	return 0;
+}
+
+static void trace_remote_panic_unload(struct trace_remote *remote)
+{
+	struct trace_remote_iterator *iter = remote->panic_iter;
+
+	lockdep_assert_held(&remote->lock);
+
+	if (!iter)
+		return;
+
+	atomic_notifier_chain_unregister(&panic_notifier_list, &remote->panic_notifier);
+	smp_store_release(&remote->panic_iter, NULL);
+	trace_remote_iter_free(iter);
+}
+
+static ssize_t dump_on_panic_write(struct file *filp, const char __user *ubuf,
+				   size_t cnt, loff_t *ppos)
+{
+	struct seq_file *seq = filp->private_data;
+	struct trace_remote *remote = seq->private;
+	bool enable;
+	int ret;
+
+	ret = kstrtobool_from_user(ubuf, cnt, &enable);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&remote->lock);
+
+	if (enable == remote->panic_on)
+		return cnt;
+
+	if (trace_remote_loaded(remote)) {
+		if (enable) {
+			ret = trace_remote_panic_load(remote);
+			if (ret)
+				return ret;
+		} else {
+			trace_remote_panic_unload(remote);
+		}
+	}
+
+	WRITE_ONCE(remote->panic_on, enable);
+
+	return cnt;
+}
+
+static int dump_on_panic_show(struct seq_file *s, void *unused)
+{
+	struct trace_remote *remote = s->private;
+
+	seq_printf(s, "%d\n", READ_ONCE(remote->panic_on));
+
+	return 0;
+}
+DEFINE_TRACE_REMOTE_ATTRIBUTE(dump_on_panic);
+
 static int trace_remote_init_tracefs(const char *name, struct trace_remote *remote)
 {
 	struct dentry *remote_d, *percpu_d, *d;
@@ -1017,6 +1164,11 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 	if (!d)
 		goto err;
 
+	d = trace_create_file("dump_on_panic", TRACEFS_MODE_WRITE, remote_d, remote,
+			      &dump_on_panic_fops);
+	if (!d)
+		goto err;
+
 	d = trace_create_file("buffer_size_kb", TRACEFS_MODE_WRITE, remote_d, remote,
 			      &buffer_size_kb_fops);
 	if (!d)
-- 
2.56.0.455.g6c5a503b38-goog

