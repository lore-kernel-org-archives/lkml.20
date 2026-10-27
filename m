Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142954;
	b=29DLlzikWIyqHHFJfrFInhYnG75ZeRvohSZ6UeELVLhP7MrvdCKbP2reaTULzmk9bpBP
	 D2bvrAWH+37xpew4w2P0czaO8SgR4JggIyqKgd1LAiL/96NGp4Vfwg/7ot0pnO02hcN6u
	 SGjtG820EVqgNrx2qYfLvrXIFrc3SDMpI7b5oaA82wuvU2D9uGPs8y6Z7WGNeupTgHvNo
	 RskJe2AZg6BbiIdbzkJWHpI3rENLbDUNJaVnJItxAnHSasKLmp4BbeLkNl2yjqGTMjMMO
	 hhgoBA8aGxFtLV0klhbtB+3SwCO7oPyVEG7StQp+Z5NS8XUSJMQPyXXvAT+eyvykKxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=3yLJES2nL61Anp97TrCq7ocFvAftT6kqwW8hv2ptu8U=;
	b=AsM61iPVFTIYMOtRkiJE4B7UYXsSzlfA7ZqNVdMKk3z3UvuXXsvrKVyKkwKoLtVFeAJv
	 poK5Bg9CiMp7SJlJkxKkLQSsZxwKDgd8SAetYDoGldeJa0TKEKLtPO19uSqrO4xQU16We
	 xjGsHFxfhyev0UhXHtJ0lbbC35ffLrkO/gtUctcorDvhj+HZ3bCNxW5o07nShCk9jyDVC
	 Zp4HQMv8UfScMlCIgAHNMdhNRVscb0ZRCSEKD1SYY2Krp4/bR1rjw8p6Si0uD+tVlhJ+j
	 V7vo4d0sbflybwBwWkSgDh4C7IQAkrevVYL6QpHgRpjpimRJ9AaWto7dhr/RoZXlcLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ef1ptcbG;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F2360A2639
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56F2360A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ef1ptcbG
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so1258012eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793142953; x=1793747753; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3yLJES2nL61Anp97TrCq7ocFvAftT6kqwW8hv2ptu8U=;
        b=ef1ptcbGT0dSTAdG38hGGwhRx7VkFWdasPaIi/yo94AOBbqgJdHCXSAwKbSMBKXjz8
         qmm2hI5IbYQOxeF9DfADDZ0UnaM1JMEMAt/QTU8vxPRbRO/kN6Gaj1ALEsL5T9J2nTkd
         aRa+nYFBNRFwoKpKrEDlyePRWZDogxC4aHh5XzDck1b2WPaeCBHPLD1XRR80Z+qiy85W
         J6sYIF5AyW+TIUCcuD0zSvSHQuejcPfSU3ObEz/UhN2NMfCJ2pLEkEykNRh7DKIj4HVt
         47fnVCvtyxbkCod1zroZgw2EsD0JJjpHZT3wY/oyqc6qdqTDMbW02be1tpYH5jCJQOOl
         J7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142953; x=1793747753;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3yLJES2nL61Anp97TrCq7ocFvAftT6kqwW8hv2ptu8U=;
        b=jnXZC1N1RS44ADKCuQMpFJoH7hM3HEb889nl7jT6a0UHu6oIPaUKfm00KXx03m+UtF
         JdgTssXuKLBYLuMKd327dS6zMDZXTzvYUf7CvTnm4omm5BQpZOQXXAQvFH9J0znu5nYr
         Dnf1fU53TjCy3n4jCyAqlrzsQsM9U4thsWIPSvzuxe5t/G1drL/7uEt/ePC8FI4Gm22V
         uZcAr6w9aj0WiNo+TT+MUvVlr1vkVbODX8e+JpP/5z9G+bP/iQ+obviRwqMlfN3UU18D
         VTypwfpdXtbC0FDoE/jLwoUeumZAfzy3XB8HhlUdg7yg4UmBgjUV+pJ1q29FVQhUC3aD
         CFzg==
X-Forwarded-Encrypted: i=1; AKwUvBxclKHxOh2nlxFO5RsmKvI6ZAdIUwSeYxa8BYrPMzpfSJneC4IGx1E3OOewzE9nLUpeyVna4rW2nNQcJrM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFotyaCuEhUUyp/GnshHHX3fWn6FXd6OsNp18NDtKwF/n7Kol+
	VP+ZRh46ehGNOzgWuBhE4+3na4xB8YWtRKJSLagzMOiA1dIZ71+GBv7IlpUVX7sWDgA2QWCQ3sF
	gRFYCImcBVA==
X-Received: from dycmb2-n2.prod.google.com ([2002:a05:693c:20c2:20b0:369:f60c:3f6b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8946:10b0:369:f7d2:d7a0
 with SMTP id 5a478bee46e88-36a20407ad2mr1223463eec.25.1793142953145; Tue, 27
 Oct 2026 16:15:53 -0700 (PDT)
Date: Tue, 27 Oct 2026 16:15:08 -0700
In-Reply-To: <20261027231513.816148-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260928075237.3055101-1-irogers@google.com> <20261027231513.816148-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261027231513.816148-15-irogers@google.com>
Subject: [PATCH v2 14/18] perf machine: Protect machines->guests rbtree with a rw_semaphore
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, haghdoost@uber.com, james.clark@linaro.org, 
	jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
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
index cb9e34220036..fb83da8ef09b 100644
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
@@ -935,10 +956,12 @@ size_t machines__fprintf_dsos(struct machines *machines, FILE *fp)
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
@@ -955,10 +978,12 @@ size_t machines__fprintf_dsos_buildid(struct machines *machines, FILE *fp,
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
 
@@ -1303,10 +1328,12 @@ int machines__create_guest_kernel_maps(struct machines *machines)
 
 void machines__destroy_kernel_maps(struct machines *machines)
 {
-	struct rb_node *next = rb_first_cached(&machines->guests);
+	struct rb_node *next;
 
 	machine__destroy_kernel_maps(&machines->host);
 
+	down_write(&machines->lock);
+	next = rb_first_cached(&machines->guests);
 	while (next) {
 		struct machine *pos = rb_entry(next, struct machine, rb_node);
 
@@ -1314,6 +1341,7 @@ void machines__destroy_kernel_maps(struct machines *machines)
 		rb_erase_cached(&pos->rb_node, &machines->guests);
 		machine__delete(pos);
 	}
+	up_write(&machines->lock);
 }
 
 int machines__create_kernel_maps(struct machines *machines, pid_t pid)
@@ -3134,13 +3162,15 @@ int machines__for_each_thread(struct machines *machines,
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
2.56.0.313.g2479322e68-goog

