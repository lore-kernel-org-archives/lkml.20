Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348501;
	b=g+4Uu5VgK8+bjHsoWFtX0qM8zGYgemi8KVV6FkhHgN93ax6CMrgtGdllasNnZ4Pfuz5l
	 6WGVWTfWka9fPP0m5ag8k7d9UfFd8YBnqT+qUPNkbdPpFUGR8bb4c25fr2dMGKjNVGsmD
	 RJcVPKgEmFqTfDAfhgF+LKNXGuplcT29LDHbj280De/jltL8nmblrWR5H/L+xw5JBVcWq
	 tI8okbe2b4/Lhc0uBsMjP5V6L5a4d+o2rzB21VkOtPjwsThPB5qOCFeKW9heidJreAiEp
	 w+Lfl5Q5mgC1mhl/jjIQRyinkGciHNLRzQyrqlXflIpQD4SpVZwjUUXPMDHjaC/2IlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=N+MUyU3INOipJF3nxA2pGAx9KlSKX9/S9FUz5WZxUec=;
	b=JeCb66s+9/4XJMrMENuFss1aNnhnfY6NsPxcAa1cKvBllaXI4s9NHVVkhgevXcnbbMA6
	 7kVyfWsHKqYpM4Oud7TeESjx/kTKycsIfZGAZqr08yFsj3vhauO996KnTKIejzbsht2Qn
	 nwXWM3Ddepkqrm4reUtLp3Bj9XCqSp0On30oEnbCSA07Sn+ca5NUrcfRK7Zn4vnTHQOOV
	 YdOlwe5EgDYPlFDu/psiBbbC0NHvJpvAf+zjdvb4KD0X0xZQI4dMGewqsbsDDB9sLbjOV
	 MnzRMUzWYCMsocDq0psvSWaidF7OalGu2Rs8TTbzBo8NnoajHlNVUPB/MkWw1/2diJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ky8Ogiya;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2705660A383C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2705660A383C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ky8Ogiya
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f479b9819so4480691eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794348500; x=1794953300; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+MUyU3INOipJF3nxA2pGAx9KlSKX9/S9FUz5WZxUec=;
        b=Ky8OgiyaoiaPXQ5GDXZD+RBv0DPoRaAtnKw9p8ogt1sX/Z0anfPx9ViMWnBg1c7lLY
         73F1HT5Z9NHIMKskhPozje0KkEEcRv3Od/AYjwBc68+1dWmici1hSx6NRr0oK1D135MY
         t7wmaiT82fKQWMC2TL2IWUuSQvePd4yttehN+803HXXgQfsec4dqNyEKSGBOXB6Hgqp7
         C7y5oNuGLfiqEfbB5YlJ/zcDMhNxL5cKxt1Na3X91L70+fvnMugXZXpfMu1xVh9vNhU+
         YmQQq0GdsA7Kk6UQSa4dbTjPXvmpSC3tOUjznZNKpqBlTfElb4Wu4rrQzj0CRXMWmnoB
         oWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348500; x=1794953300;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+MUyU3INOipJF3nxA2pGAx9KlSKX9/S9FUz5WZxUec=;
        b=1i3fL0GeqTcZIaICeFEokxeCi3yJXrV6RMNyoNtShn6ClkL+q8C1fcKPsJzr7shM5S
         v9/81Fj1TrFJIqWhdqdVBUoKARR9CveoXwaV2V73ci396GRpnGPZ4cssiIJDPS4lya4s
         +sHkRz39MXcMxLs8k6FXZVHAKhBTxdpnvtdsNpyOqN85ud/p1PddXcOmjJHJTkdf7bma
         Y3Zobhl/wGYdfFa5+/hSgr0k58HNmMeKRxuvbBuz7pZgpTVPNsrGD9nbNtjuW+e/pFQ5
         GUGYYtfM07w/n91XhZGahiKLJ5bRG4EULWQNCbV+KSJOXIadHPfn9aiCTs5xbHJvL2c7
         250g==
X-Forwarded-Encrypted: i=1; AL+hErELkXNUz6R4liCvnH3evVG+EjJHBZhrhxx+EczbQUYE1adqzE2YxG3K2T9Brk08xf1rB73ohmxHCSK5l2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rmmH8fKYLlOq9haBHYX6XQpDZSm7duNWmQHxFM92QRgN7iXBS
	0/sVpzL564rfsaBNn/Ealp7xQgkTO6+KPbfRXWnTmXVw6w1QWROnCvmbFY8ZBKOcAg9ALEygK65
	UEEdUOy92xQ==
X-Received: from dycc6.prod.google.com ([2002:a05:693c:60c6:b0:33e:5767:2163])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:ce01:b0:36a:1452:8dad
 with SMTP id 5a478bee46e88-3768636e3c6mr883020eec.20.1794348499849; Tue, 10
 Nov 2026 14:08:19 -0800 (PST)
Date: Tue, 10 Nov 2026 14:07:45 -0800
In-Reply-To: <20261110220803.2503416-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027231513.816148-1-irogers@google.com> <20261110220803.2503416-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110220803.2503416-3-irogers@google.com>
Subject: [PATCH v3 02/20] perf machine: Protect machines->guests rbtree with a rw_semaphore
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, haghdoost@uber.com, 
	namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Unlike struct dsos, struct maps, and struct threads, struct machines had
no lock protecting its machines->guests rbtree. Synchronizing access to
machines->guests is needed both for concurrent guest machine lookups and
so machines__shrink() can safely iterate guest machines using
down_read_trylock(&machines->lock).

Add a rw_semaphore lock to struct machines to synchronize access to the
machines->guests rbtree across machines__add(), machines__find(),
machines__set_comm_exec(), machines__process_guests(),
machines__set_id_hdr_size(), machines__fprintf_dsos(),
machines__fprintf_dsos_buildid(), machines__destroy_kernel_maps(), and
machines__for_each_thread(), and check for an existing guest machine PID
under write lock in machines__add().

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/machine.c | 42 +++++++++++++++++++++++++++++++++------
 tools/perf/util/machine.h |  1 +
 2 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 5eb5efa4eb90..f6975d9c4568 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -237,6 +237,7 @@ int machines__init(struct machines *machines, struct perf_session *session)
 {
 	int err = machine__init(&machines->host, "", HOST_KERNEL_ID);
 
+	init_rwsem(&machines->lock);
 	machines->session = session;
 	machines->host.machines = machines;
 	machines->guests = RB_ROOT_CACHED;
@@ -247,12 +248,13 @@ void machines__exit(struct machines *machines)
 {
 	machine__exit(&machines->host);
 	/* XXX exit guest */
+	exit_rwsem(&machines->lock);
 }
 
 struct machine *machines__add(struct machines *machines, pid_t pid,
 			      const char *root_dir)
 {
-	struct rb_node **p = &machines->guests.rb_root.rb_node;
+	struct rb_node **p;
 	struct rb_node *parent = NULL;
 	struct machine *pos, *machine = malloc(sizeof(*machine));
 	bool leftmost = true;
@@ -265,9 +267,17 @@ struct machine *machines__add(struct machines *machines, pid_t pid,
 		return NULL;
 	}
 
+	down_write(&machines->lock);
+	p = &machines->guests.rb_root.rb_node;
 	while (*p != NULL) {
 		parent = *p;
 		pos = rb_entry(parent, struct machine, rb_node);
+		if (pid == pos->pid) {
+			up_write(&machines->lock);
+			machine__exit(machine);
+			free(machine);
+			return pos;
+		}
 		if (pid < pos->pid)
 			p = &(*p)->rb_left;
 		else {
@@ -278,8 +288,8 @@ struct machine *machines__add(struct machines *machines, pid_t pid,
 
 	rb_link_node(&machine->rb_node, parent, p);
 	rb_insert_color_cached(&machine->rb_node, &machines->guests, leftmost);
-
 	machine->machines = machines;
+	up_write(&machines->lock);
 
 	return machine;
 }
@@ -290,16 +300,18 @@ void machines__set_comm_exec(struct machines *machines, bool comm_exec)
 
 	machines->host.comm_exec = comm_exec;
 
+	down_read(&machines->lock);
 	for (nd = rb_first_cached(&machines->guests); nd; nd = rb_next(nd)) {
 		struct machine *machine = rb_entry(nd, struct machine, rb_node);
 
 		machine->comm_exec = comm_exec;
 	}
+	up_read(&machines->lock);
 }
 
 struct machine *machines__find(struct machines *machines, pid_t pid)
 {
-	struct rb_node **p = &machines->guests.rb_root.rb_node;
+	struct rb_node **p;
 	struct rb_node *parent = NULL;
 	struct machine *machine;
 	struct machine *default_machine = NULL;
@@ -307,6 +319,8 @@ struct machine *machines__find(struct machines *machines, pid_t pid)
 	if (pid == HOST_KERNEL_ID)
 		return &machines->host;
 
+	down_read(&machines->lock);
+	p = &machines->guests.rb_root.rb_node;
 	while (*p != NULL) {
 		parent = *p;
 		machine = rb_entry(parent, struct machine, rb_node);
@@ -314,11 +328,14 @@ struct machine *machines__find(struct machines *machines, pid_t pid)
 			p = &(*p)->rb_left;
 		else if (pid > machine->pid)
 			p = &(*p)->rb_right;
-		else
+		else {
+			up_read(&machines->lock);
 			return machine;
+		}
 		if (!machine->pid)
 			default_machine = machine;
 	}
+	up_read(&machines->lock);
 
 	return default_machine;
 }
@@ -464,10 +481,12 @@ void machines__process_guests(struct machines *machines,
 {
 	struct rb_node *nd;
 
+	down_read(&machines->lock);
 	for (nd = rb_first_cached(&machines->guests); nd; nd = rb_next(nd)) {
 		struct machine *pos = rb_entry(nd, struct machine, rb_node);
 		process(pos, data);
 	}
+	up_read(&machines->lock);
 }
 
 void machines__set_id_hdr_size(struct machines *machines, u16 id_hdr_size)
@@ -477,11 +496,13 @@ void machines__set_id_hdr_size(struct machines *machines, u16 id_hdr_size)
 
 	machines->host.id_hdr_size = id_hdr_size;
 
+	down_read(&machines->lock);
 	for (node = rb_first_cached(&machines->guests); node;
 	     node = rb_next(node)) {
 		machine = rb_entry(node, struct machine, rb_node);
 		machine->id_hdr_size = id_hdr_size;
 	}
+	up_read(&machines->lock);
 
 	return;
 }
@@ -933,10 +954,12 @@ size_t machines__fprintf_dsos(struct machines *machines, FILE *fp)
 	struct rb_node *nd;
 	size_t ret = dsos__fprintf(&machines->host.dsos, fp);
 
+	down_read(&machines->lock);
 	for (nd = rb_first_cached(&machines->guests); nd; nd = rb_next(nd)) {
 		struct machine *pos = rb_entry(nd, struct machine, rb_node);
 		ret += dsos__fprintf(&pos->dsos, fp);
 	}
+	up_read(&machines->lock);
 
 	return ret;
 }
@@ -953,10 +976,12 @@ size_t machines__fprintf_dsos_buildid(struct machines *machines, FILE *fp,
 	struct rb_node *nd;
 	size_t ret = machine__fprintf_dsos_buildid(&machines->host, fp, skip, parm);
 
+	down_read(&machines->lock);
 	for (nd = rb_first_cached(&machines->guests); nd; nd = rb_next(nd)) {
 		struct machine *pos = rb_entry(nd, struct machine, rb_node);
 		ret += machine__fprintf_dsos_buildid(pos, fp, skip, parm);
 	}
+	up_read(&machines->lock);
 	return ret;
 }
 
@@ -1295,10 +1320,12 @@ int machines__create_guest_kernel_maps(struct machines *machines)
 
 void machines__destroy_kernel_maps(struct machines *machines)
 {
-	struct rb_node *next = rb_first_cached(&machines->guests);
+	struct rb_node *next;
 
 	machine__destroy_kernel_maps(&machines->host);
 
+	down_write(&machines->lock);
+	next = rb_first_cached(&machines->guests);
 	while (next) {
 		struct machine *pos = rb_entry(next, struct machine, rb_node);
 
@@ -1306,6 +1333,7 @@ void machines__destroy_kernel_maps(struct machines *machines)
 		rb_erase_cached(&pos->rb_node, &machines->guests);
 		machine__delete(pos);
 	}
+	up_write(&machines->lock);
 }
 
 int machines__create_kernel_maps(struct machines *machines, pid_t pid)
@@ -3128,13 +3156,15 @@ int machines__for_each_thread(struct machines *machines,
 	if (rc != 0)
 		return rc;
 
+	down_read(&machines->lock);
 	for (nd = rb_first_cached(&machines->guests); nd; nd = rb_next(nd)) {
 		struct machine *machine = rb_entry(nd, struct machine, rb_node);
 
 		rc = machine__for_each_thread(machine, fn, priv);
 		if (rc != 0)
-			return rc;
+			break;
 	}
+	up_read(&machines->lock);
 	return rc;
 }
 
diff --git a/tools/perf/util/machine.h b/tools/perf/util/machine.h
index 973a59f7c26a..147ce343e370 100644
--- a/tools/perf/util/machine.h
+++ b/tools/perf/util/machine.h
@@ -151,6 +151,7 @@ typedef void (*machine__process_t)(struct machine *machine, void *data);
 struct machines {
 	/** @session: back link to owning session if there is one. */
 	struct perf_session *session;
+	struct rw_semaphore lock;
 	struct machine host;
 	struct rb_root_cached guests;
 };
-- 
2.56.0.542.g3ef89b7020-goog

