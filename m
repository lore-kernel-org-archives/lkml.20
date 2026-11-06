Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988472;
	b=YO8SuUKmCQ6lMwzPFa5clgbAvBxgmOXSCqJxPl2jkp8YYajpD28Ht4uDVLGj0XBiPLTw
	 zt8rjWsFoMdeCAos2aH64R5fGOmMxSDZpZEDvfMFfkipYwC2tDR5NwJSrUygsbqRUV/N0
	 QhYWKwSk3cB+18QDo68ijcdUAZeBAoQBxe1RnxKuwnahOAChyrXUbg5y2qJkwFz4ZQynU
	 +SmFyjA13mWQrk3bD9/EaS+Mph1RhRJwhbg8AjcCO8K0tSn/4T7g1142lnSml+uC5Wgzg
	 NBOUuHCuc8l3h9y+aCxMje261oGDpiDzJE6t7ECsjlcmC4yFB1Z/7gu2SEDayHXOMwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=dhTsJsvZqJnk5gOBxrG9eboMWFqOc2PMfpVCk05mF3Q=;
	b=WElq3cKRs2KjtflZIaYO5a7/UetUu/SLNHawD+n3ke04fFV6aKNRcA/QZH5jUXfs+8m4
	 RDD4JcI5qgXmzCPqCwFuJw7X4dm+nDXeTNw2O8oVdW0BG9vvJsTdcjCb2vqse0wfFNFNJ
	 ZIEsND6nsOzfbx0Uz0pSyBdsWhMHpcb9q5VTl+5wWy9/UlfbsMNl+sel/LoYhI6x/B0FH
	 mD77usYribaEkKgtv4Juyb5/5XdB2uocx3NipfMy1dO6c32PW4QR8bIRqsoLZ/xnpceta
	 aU3I3gI/c46rOBFFGzVguVZrnwPXP/tTjAFGrCLfaADnvVdtNiijGxkwNYdGPVTIP4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="A1RPkK/r";
	arc=none smtp.remote-ip=209.85.218.72
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E80D606D82C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E80D606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A1RPkK/r
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c42888c50c4so99450566b.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793988470; x=1794593270; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dhTsJsvZqJnk5gOBxrG9eboMWFqOc2PMfpVCk05mF3Q=;
        b=A1RPkK/rcCdKOQg1pnsA34UFNHVQsOLqjtwjikIuzsp4wIHe0e4qQq/hXzzgYDjeCm
         xRe3NjKrQUgXoy+XXRheJVsuKdlEwo9iw0Eu9p28xNmuWFCZ57gZfGvz5zVIHRmW1Sxn
         xpDixUXWA3EWxwdznKcNSzUBeAjougbTVqR42kbHHQ/640TXxERJQ8jp8PIds68ISzTU
         tR3NeWlS31ZQAPHvZKYcoQ7QyOq2H/RcVnU8h+9nhu4jJ5M8QBDnRfk/vGFR27UCQMIJ
         She7IkxIqLm1gGDIPhCUZJLp9GCVz6qOeshlIyNdSavyHr1nMeB7seyf2kiQw4cVbGEr
         MJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988470; x=1794593270;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dhTsJsvZqJnk5gOBxrG9eboMWFqOc2PMfpVCk05mF3Q=;
        b=jOYwZTbeMDNVUj2ixUY0UcN41cBaJmwUtJDJa1Na7/hk/Ddn46v8Q8dDUc4PhZZgHO
         IsCrvvnWTYlDDiCmZ8EOdqlzNv6JkFJp6f27KQSKYDlrooMh9nQ86ythUwvLC+tcn+Lv
         CK1ZytV2NnlMUDIskyeXxxczXRJQiTaZ/TG1yM53L+PGhvzmi1S+Qy/lnY4r3X9EsczQ
         QcHXPzb5a2dLQJDTER0A3BX9byG00Fiq45NQS5WDIJ9iK61MuDUV4G1VBrKgKXn/y+YM
         QEw2irKgnmUfHHIDmhnA/U6sc9s9gTyhPqbzI0dXx2YvkfbSmv883Ud6UFqk5o07yKxR
         54bg==
X-Forwarded-Encrypted: i=1; AKwUvBzlzEYO+VBlxoI5YpMVTFxAorJQc7IjELePVXHypV1bbnhQtPiBF/Ing911VVJ0d2KeUhdYht9sk33EHOM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QcWPSp7FQlxdKpTpY1oRGKcAJs8cfdPap4FdUSqZdSWAwE5G+
	FnJL6Hu3ywo2e6SrQwm0fMeEMdpsEIiGVRtIvyY3yRl/PI9Vlk1avWZym2W7AX4xsd6fG0u6OWG
	UuibQ5zCxfq1JpKCG4qRyaw==
X-Received: from ejzb26.prod.google.com ([2002:a17:906:d11a:b0:c43:9f30:62f6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e18:b0:c29:3c97:c994 with SMTP id a640c23a62f3a-c4d354dea2bmr307738566b.35.1793988469701;
 Fri, 06 Nov 2026 10:07:49 -0800 (PST)
Date: Fri,  6 Nov 2026 18:06:42 +0000
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
Message-ID: <20261106180657.2460376-7-vdonnefort@google.com>
Subject: [PATCH v8 06/21] tracing/remotes: Use a single per-remote polling work
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Having a per-iterator polling work is wasteful when logging several
trace_remote per_cpu/trace_pipe files in parallel. This results in one
work running per-CPU, where only one would suffice.

Transition to a single per-remote polling work, scheduled on the first
consumer creation and stopped when the last consuming iterator is freed.

This blanket polls all CPUs, regardless of which ones are actually being
read. This is acceptable because the poll consists of reading the
meta-page, which is a fast operation. Also, it is more common to log all
CPUs in the system than only one, so this use-case should be favoured.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/trace_remote.c | 51 +++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index a677b093fa07..08a89b7315c3 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -26,7 +26,6 @@ enum tri_type {
 struct trace_remote_iterator {
 	struct trace_remote		*remote;
 	struct trace_seq		seq;
-	struct delayed_work		poll_work;
 	unsigned long			lost_events;
 	u64				ts;
 	struct ring_buffer_iter		*rb_iter;
@@ -55,8 +54,10 @@ struct trace_remote {
 	struct rw_semaphore		reader_lock;
 	struct rw_semaphore		*pcpu_reader_locks;
 	unsigned int			nr_readers;
+	unsigned int			poll_cnt;
 	unsigned int			poll_ms;
 	bool				tracing_on;
+	struct delayed_work		poll_work;
 };
 
 static DEFINE_MUTEX(trace_remotes_lock);
@@ -351,17 +352,6 @@ static bool trace_remote_has_cpu(struct trace_remote *remote, int cpu)
 	return ring_buffer_poll_remote(remote->trace_buffer, cpu) == 0;
 }
 
-static void __poll_remote(struct work_struct *work)
-{
-	struct delayed_work *dwork = to_delayed_work(work);
-	struct trace_remote_iterator *iter;
-
-	iter = container_of(dwork, struct trace_remote_iterator, poll_work);
-	ring_buffer_poll_remote(iter->remote->trace_buffer, iter->cpu);
-	schedule_delayed_work((struct delayed_work *)work,
-			      msecs_to_jiffies(iter->remote->poll_ms));
-}
-
 static void __free_ring_buffer_iter(struct trace_remote_iterator *iter, int cpu)
 {
 	if (cpu != RING_BUFFER_ALL_CPUS) {
@@ -405,6 +395,36 @@ static int __alloc_ring_buffer_iter(struct trace_remote_iterator *iter, int cpu)
 	return 0;
 }
 
+static void trace_remote_do_poll(struct trace_remote *remote)
+{
+	ring_buffer_poll_remote(remote->trace_buffer, RING_BUFFER_ALL_CPUS);
+	schedule_delayed_work(&remote->poll_work, msecs_to_jiffies(remote->poll_ms));
+}
+
+static void __poll_remote(struct work_struct *work)
+{
+	struct delayed_work *dwork = to_delayed_work(work);
+
+	trace_remote_do_poll(container_of(dwork, struct trace_remote, poll_work));
+}
+
+static void trace_remote_inc_poll(struct trace_remote *remote)
+{
+	/* poll_cnt <= nr_readers, inherits its overflow protection */
+	if (!remote->poll_cnt++)
+		trace_remote_do_poll(remote);
+}
+
+static void trace_remote_dec_poll(struct trace_remote *remote)
+{
+	if (WARN_ON_ONCE(!remote->poll_cnt))
+		return;
+
+	remote->poll_cnt--;
+	if (!remote->poll_cnt)
+		cancel_delayed_work_sync(&remote->poll_work);
+}
+
 static struct trace_remote_iterator
 *trace_remote_iter(struct trace_remote *remote, int cpu, enum tri_type type)
 {
@@ -434,9 +454,7 @@ static struct trace_remote_iterator
 
 		switch (type) {
 		case TRI_CONSUMING:
-			ring_buffer_poll_remote(remote->trace_buffer, cpu);
-			INIT_DELAYED_WORK(&iter->poll_work, __poll_remote);
-			schedule_delayed_work(&iter->poll_work, msecs_to_jiffies(remote->poll_ms));
+			trace_remote_inc_poll(remote);
 			break;
 		case TRI_NONCONSUMING:
 			ret = __alloc_ring_buffer_iter(iter, cpu);
@@ -470,7 +488,7 @@ static void trace_remote_iter_free(struct trace_remote_iterator *iter)
 
 	switch (iter->type) {
 	case TRI_CONSUMING:
-		cancel_delayed_work_sync(&iter->poll_work);
+		trace_remote_dec_poll(remote);
 		break;
 	case TRI_NONCONSUMING:
 		__free_ring_buffer_iter(iter, iter->cpu);
@@ -1003,6 +1021,7 @@ int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs,
 	remote->poll_ms = 100;
 	mutex_init(&remote->lock);
 	init_rwsem(&remote->reader_lock);
+	INIT_DELAYED_WORK(&remote->poll_work, __poll_remote);
 
 	guard(mutex)(&trace_remotes_lock);
 
-- 
2.56.0.455.g6c5a503b38-goog

