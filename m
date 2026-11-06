Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988465;
	b=edEe+EFxFAvLkyOP9M93lCmymkkREN4fCvxP2TTrf2ZaOCaZQwWQu5Wcuu/M1DzJjsJC
	 Y8nacsLeCoUM3p3qUzYpeTLNIjWsw2CZAXygU03RGAplgP6AuD40PVkL6igTFcQJeA0HN
	 EhqcHXsMzqMr2OVH0hn+i4hk1YJblv5dS5EbNLZ7btU/dO3tTiEk/E7XSuc0aFrDPwaYo
	 8sVwAYICeENS34eiVLYlUsvzwNT3tMc3XSZbNOHQKRKq7oG/KQIX6ySEA4kD0Is71kGyV
	 xpCc3fjfkufHgpIdkdnRqxzdT4e+6QZiH7YOF8tjfp8SoCCV6nPrOnC6PU1OuKfF10Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=9VpW2XcWLKAq/ot4di2VXzHiKutqIoaszfzzAa09OfQ=;
	b=iPZ5xZmqvAsNocdVMcHG2Tjm2owSaFWXvwSjmAcJvD4BQVJOaGu9KGaxG9res/Q5F5vw
	 8dXYJ/fevfhhuKRRbd0EecOIDfwDVJOVyVENiL0Tm5G8Gjr7P1aA8WU8i9VUh1kHj81nS
	 sKWsEzz7RC48el47XGchy2iRae3mv9r+zQVkOZggTASHu2ZDUVPC9zfrbOhJ9VQnKEpXM
	 JJz60bPlMRCb7qCLJLmmHZIi89kN81X+JaIm2HLcD/WX4W+z1eH0qT2HFN3WHZ8JTYgVq
	 TsGWcr3q9VzgIZxb7d74awHPWpkzAfZ5CTwyty+kQaXHPE/hEiPaXWWoGgCt6/KaDFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YLdPzAWe;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBFF606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EBFF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YLdPzAWe
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e0ef019a4so812809f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793988464; x=1794593264; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9VpW2XcWLKAq/ot4di2VXzHiKutqIoaszfzzAa09OfQ=;
        b=YLdPzAWeKmzm8nhoDUocT8LqW7LJydFNeIhsJ7t2HvFCSd+5n9/fyfgpNeseYCR7rM
         8Vl5NBnnrPC+7jUeZpKyONh98/qWB3LsMLCHosG7JVpiOYMqi4/sf4sGXBmWZp6n5MTu
         ddhHEO15/Dz+/cjq73nwbcryBAcsOqGSI6JdYOJxvPFA1PKIUJihtqUiCYY3l8QC4Hs4
         DTBUL8Pv9TLwxbxC+gu/RUktD7bTuAJ0yzjaFTyGHmHnjnL3TNPylUzfrZRE4GbrS8Zx
         RwzpGVNMfl/yKwyxd+bGv/QTbZtIKkGwOQRnG7Yhv2oxGsIFgUUV+Pe8slk/+/GQxT64
         D0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988464; x=1794593264;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9VpW2XcWLKAq/ot4di2VXzHiKutqIoaszfzzAa09OfQ=;
        b=FsACUaZ8N5crTVPuMIQQXZdndfZ4iQgnpxNcDBt0nPcRT+EbBT8w/63mQNx+7Dc3lY
         s8T6XgQQyV0AEuAM+P+8SWkBJ222OzyhTrbvxJDxx8U9G7+/TW2NChO4aAVDsQ4ZmK4M
         BFoRCBwyRb34tM/wntPg8BncVg6+YHKWSsYH0qauF0X4KERCzGaVNPZjWVuuOdL9mBZl
         d/cU2f3VRhIdbbLIeg574NaD1HvZiU/sHekLV2WmFGDFzYWtBvu+jSnCXYYYkg2d4ZWY
         kHKqFDl1/oMi91n9HxQQfhh+p+7DHvEGfPfBBSO46t5RRqd2atDwwIKGwCZwDIDkzrTX
         D1dw==
X-Forwarded-Encrypted: i=1; AL+hErE58qvxP1jMmqsapn1LQzkBdYN8k6Yh291SPjgnT0Y51f1whoMNZyecI2nZSwCrj1e2Uix2oKzy5hhmelo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nMmCL+6+7RIbLDkVf31C5RAyMhvvodemevEK+5tvKXUL1m1kB
	AzolqlsAphZqGj+gU/BKmMi0IXxCrcggSHEz19kI0DfygKLjz2cUnMEzxhDaWN81KSO80/ZVr9c
	jTENQp2avUSxmtwae+cFo3A==
X-Received: from wrwy2.prod.google.com ([2002:a05:6000:1082:b0:48e:596:f6cd])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:25f3:b0:48b:1c:d6e1 with SMTP id ffacd0b85a97d-49277abcdb7mr6666871f8f.43.1793988463508;
 Fri, 06 Nov 2026 10:07:43 -0800 (PST)
Date: Fri,  6 Nov 2026 18:06:37 +0000
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
Message-ID: <20261106180657.2460376-2-vdonnefort@google.com>
Subject: [PATCH v8 01/21] tracing/remotes: Gate tracefs files opening on trace
 remote registration
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Currently, if a remote fails to register, its resources will leak and
will not be properly torn down.

To prevent a user accessing a remote tracefs that is about to be
destroyed, keep track of the registered remotes in a global list,
similarly to trace instances. Gate the tracefs open function based on
the presence of the remote in that list.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/trace_remote.c | 100 +++++++++++++++++++++++++++++++-----
 1 file changed, 87 insertions(+), 13 deletions(-)

diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 2d5bc423efca..e8cbbd01964d 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -39,6 +39,7 @@ struct trace_remote_iterator {
 };
 
 struct trace_remote {
+	struct list_head		node;
 	struct trace_remote_callbacks	*cbs;
 	void				*priv;
 	struct trace_buffer		*trace_buffer;
@@ -57,6 +58,9 @@ struct trace_remote {
 	bool				tracing_on;
 };
 
+static DEFINE_MUTEX(trace_remotes_lock);
+static LIST_HEAD(trace_remotes);
+
 static bool trace_remote_loaded(struct trace_remote *remote)
 {
 	return !!remote->trace_buffer;
@@ -170,6 +174,60 @@ static void trace_remote_reset(struct trace_remote *remote, int cpu)
 	trace_remote_try_unload(remote);
 }
 
+static int trace_remote_tracefs_open(struct inode *inode, struct file *filp)
+{
+	void *i_private = inode->i_private;
+	struct trace_remote *r;
+
+	if (!i_private)
+		return -ENODEV;
+
+	guard(mutex)(&trace_remotes_lock);
+
+	/* i_private is either a struct trace_remote or a struct remote_event */
+	list_for_each_entry(r, &trace_remotes, node) {
+		if (r == i_private)
+			return 0;
+		if (!r->events)
+			continue;
+		if (i_private >= (void *)r->events &&
+		    i_private < (void *)(r->events + r->nr_events))
+			return 0;
+	}
+
+	return -ENODEV;
+}
+
+#define DEFINE_TRACE_REMOTE_ATTRIBUTE_FUNCS(__name)			\
+static int __name ## _open(struct inode *inode, struct file *file)	\
+{									\
+	int ret = trace_remote_tracefs_open(inode, file);		\
+									\
+	if (ret)							\
+		return ret;						\
+									\
+	return single_open(file, __name ## _show, inode->i_private);	\
+}
+
+#define DEFINE_TRACE_REMOTE_ATTRIBUTE(__name)				\
+DEFINE_TRACE_REMOTE_ATTRIBUTE_FUNCS(__name)				\
+static const struct file_operations __name ## _fops = {			\
+	.open		= __name ## _open,				\
+	.read		= seq_read,					\
+	.write		= __name ## _write,				\
+	.llseek		= seq_lseek,					\
+	.release	= single_release,				\
+}
+
+#define DEFINE_TRACE_REMOTE_SHOW_ATTRIBUTE(__name)			\
+DEFINE_TRACE_REMOTE_ATTRIBUTE_FUNCS(__name)				\
+static const struct file_operations __name ## _fops = {			\
+	.open		= __name ## _open,				\
+	.read		= seq_read,					\
+	.llseek		= seq_lseek,					\
+	.release	= single_release,				\
+}
+
 static ssize_t
 tracing_on_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t *ppos)
 {
@@ -198,7 +256,7 @@ static int tracing_on_show(struct seq_file *s, void *unused)
 
 	return 0;
 }
-DEFINE_SHOW_STORE_ATTRIBUTE(tracing_on);
+DEFINE_TRACE_REMOTE_ATTRIBUTE(tracing_on);
 
 static ssize_t buffer_size_kb_write(struct file *filp, const char __user *ubuf, size_t cnt,
 				    loff_t *ppos)
@@ -235,7 +293,7 @@ static int buffer_size_kb_show(struct seq_file *s, void *unused)
 
 	return 0;
 }
-DEFINE_SHOW_STORE_ATTRIBUTE(buffer_size_kb);
+DEFINE_TRACE_REMOTE_ATTRIBUTE(buffer_size_kb);
 
 static int trace_remote_get(struct trace_remote *remote, int cpu)
 {
@@ -593,6 +651,11 @@ static int trace_pipe_open(struct inode *inode, struct file *filp)
 	struct trace_remote *remote = inode->i_private;
 	struct trace_remote_iterator *iter;
 	int cpu = tracing_get_cpu(inode);
+	int ret;
+
+	ret = trace_remote_tracefs_open(inode, filp);
+	if (ret)
+		return ret;
 
 	guard(mutex)(&remote->lock);
 
@@ -734,22 +797,26 @@ static int trace_open(struct inode *inode, struct file *filp)
 	int cpu = tracing_get_cpu(inode);
 	int ret;
 
+	ret = trace_remote_tracefs_open(inode, filp);
+	if (ret)
+		return ret;
+
 	if (!(filp->f_mode & FMODE_READ))
 		return 0;
 
+	ret = seq_open(filp, &trace_sops);
+	if (ret)
+		return ret;
+
 	guard(mutex)(&remote->lock);
 
 	iter = trace_remote_iter(remote, cpu, TRI_NONCONSUMING);
-	if (IS_ERR(iter))
+	if (IS_ERR(iter)) {
+		seq_release(inode, filp);
 		return PTR_ERR(iter);
-
-	ret = seq_open(filp, &trace_sops);
-	if (ret) {
-		trace_remote_iter_free(iter);
-		return ret;
 	}
 
-	((struct seq_file *)filp->private_data)->private = (void *)iter;
+	((struct seq_file *)filp->private_data)->private = iter;
 
 	return 0;
 }
@@ -932,8 +999,12 @@ int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs,
 	}
 
 	ret = cbs->init ? cbs->init(remote->dentry, priv) : 0;
-	if (ret)
+	if (ret) {
 		pr_err("Init failed for trace remote '%s' (%d)\n", name, ret);
+	} else {
+		guard(mutex)(&trace_remotes_lock);
+		list_add(&remote->node, &trace_remotes);
+	}
 
 	return ret;
 }
@@ -1073,7 +1144,7 @@ static ssize_t remote_event_enable_write(struct file *filp, const char __user *u
 
 	return count;
 }
-DEFINE_SHOW_STORE_ATTRIBUTE(remote_event_enable);
+DEFINE_TRACE_REMOTE_ATTRIBUTE(remote_event_enable);
 
 static int remote_event_id_show(struct seq_file *s, void *unused)
 {
@@ -1083,7 +1154,7 @@ static int remote_event_id_show(struct seq_file *s, void *unused)
 
 	return 0;
 }
-DEFINE_SHOW_ATTRIBUTE(remote_event_id);
+DEFINE_TRACE_REMOTE_SHOW_ATTRIBUTE(remote_event_id);
 
 static int remote_event_format_show(struct seq_file *s, void *unused)
 {
@@ -1112,7 +1183,7 @@ static int remote_event_format_show(struct seq_file *s, void *unused)
 
 	return 0;
 }
-DEFINE_SHOW_ATTRIBUTE(remote_event_format);
+DEFINE_TRACE_REMOTE_SHOW_ATTRIBUTE(remote_event_format);
 
 static int remote_event_callback(const char *name, umode_t *mode, void **data,
 				 const struct file_operations **fops)
@@ -1198,6 +1269,7 @@ static ssize_t remote_events_dir_enable_read(struct file *filp, char __user *ubu
 }
 
 static const struct file_operations remote_events_dir_enable_fops = {
+	.open = trace_remote_tracefs_open,
 	.write = remote_events_dir_enable_write,
 	.read = remote_events_dir_enable_read,
 };
@@ -1222,6 +1294,7 @@ remote_events_dir_header_page_read(struct file *filp, char __user *ubuf, size_t
 }
 
 static const struct file_operations remote_events_dir_header_page_fops = {
+	.open = trace_remote_tracefs_open,
 	.read = remote_events_dir_header_page_read,
 };
 
@@ -1245,6 +1318,7 @@ remote_events_dir_header_event_read(struct file *filp, char __user *ubuf, size_t
 }
 
 static const struct file_operations remote_events_dir_header_event_fops = {
+	.open = trace_remote_tracefs_open,
 	.read = remote_events_dir_header_event_read,
 };
 
-- 
2.56.0.455.g6c5a503b38-goog

