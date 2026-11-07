Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794030749;
	b=gqwujE+MJxug0c6nl1JwUrqgOk90tajJZqFZco8LMT8haJ7H/WO9Lwugqa7ItrYMFb11
	 8Tb6V+AJ5/eDWxUwlWhc/fg8uO7eDeNK9KKeB5a/ro3fEELUNig9mt5GEBr2l8z7lrVFW
	 1HkMrIKUD8AqKDp16ibqUzkjmPJvJD2jub3wrbhnqzbWIJ9yuljt+8wjP/p78DqwqK9Ne
	 1T7UdPa47ZujjoT6Izk/+LDmr4OPNRGDkOf++oYS1BsFdje74cvE1IjHokcAkKXSrt824
	 QeHcpXJGK+QGW0W+J/oItBO78jPZypMJoENpo8K0A3w6ZNlcN7YIO5sk0VMfC91Vfhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794030749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=cOkMQ7/E4scC+Fe1w2CQgNpHvbECQcUaydXqIgQCyRQ=;
	b=ujZ4sWnQdY0vGCe7GQ6/EYdMLCPaY0sPkql+bl0CpFdPNZ+OG6UXJuyymlwHCOD8f22n
	 xtOEfO4/TzhPGGW0I6R7LAbxDcULKbG30fWO8rAzJ2UHeTHOSDEoTEH11F6OiR5Kf4EUF
	 jSDJbFiBj9Sjckw+A0rQGTiI0xvfYvw94SRH+Ac05z1EoIIaufXSYKA5k5lNafIClabuS
	 04HroxV4UZmrOAYbC8Dj/83RGzhVwOfLjGjsx6JrkmU/mLvfjmO0kB3FRPZ9dWR2MuZs3
	 zkU/T5Xx8y8D/hp3W+pDnyd5WVS2hIDA51vWIhR9oZoX1InkBHmI66c1JWhABn0ySSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d2Q+04sD;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31C1606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A31C1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d2Q+04sD
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e985106c0cso10070325ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 21:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794030748; x=1794635548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cOkMQ7/E4scC+Fe1w2CQgNpHvbECQcUaydXqIgQCyRQ=;
        b=d2Q+04sDghPVR1F3UVhddiZz7pesKLOBBSigk7Ra4fZEGOZtTB6EpIpYJ/LRXuSwoJ
         uhW/m7cISvvBspB+lR4UaBoza+8MtPrPIwYjsrUDG8GjTHXBEy9DRGQOOae4TP9hhPII
         9lgd8c8dJi7cNkPnbHRTCniZYbSY4KyhNZ7x+YEOS1qWTVeIiSshUnjcw3HvOkyZlsw1
         E4jLliOm567HpQnt8CaP51mIbc9d6X6T5HeErDsB34kW5dSQzSTTY7wklLOyqdKxXCwr
         LaSK3sAsHnFeYzN1Ew6HrqKlLZsF7hgzIf0eVRM4e2y0jYdD5p3U7g4sy/rm0xlm1exv
         EHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794030748; x=1794635548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cOkMQ7/E4scC+Fe1w2CQgNpHvbECQcUaydXqIgQCyRQ=;
        b=0o07lt5qgb/pIqbKoNoWqzv7EAfsfVx+H7yS3SPA5ATGUMtqE5Ut6AZ2y5htp8rolU
         6JCZpjzSxYJEJjSf5gDaSrScb/fEg/xxdsgdIONv5ITzCUngkNdXyuQ2dVDx4FxI+Dj+
         iEhrgaN52GWIiIoyhS32STumhtKqEEIEBlS/6BTyAt9AMsMAHHn93CoULvDcSfR30qeI
         szGPZHJ2avCXVI0gBuyUgPF6htSSIeiTs6CmWNVVXmgCRSxTZChodrbP6UTG0378dbRR
         RZidE96sDh5qsnTBMZUekqNCqeZGKySPdGrrlMTKEGQJLcvZPePdssv7FE3hW/HfD3Et
         uKqg==
X-Forwarded-Encrypted: i=1; AL+hErHzumrKdQ2///8qop7hvgALrwLSAy6iZccSzpkyBC5w9D3Os9Mcrl3FVuuFYrFLaeal0b2HKzyROYHGByY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wYMbnYrP7/l2i2NtfQZgoBjrEpmRFUH4OFpSARhR8PM4N4PT0
	PVGgeVVS++q8ZRc0UZK3Wog19Pjqr9UM/B3sddhT2b3ZWaThuZ9uw9F0
X-Gm-Gg: AYBFou0BktRvdKTEZdDxJOfXda+H5bukDU8kpur43fL5CtXauRQvMILHZ67+0LRId0K
	lA5r1FoLrDFg2nZNwjUBmFoKCEmE3XobW2DQ6GOttkyhh4JaHwjBs0sJfEtP5gK8aSc7kbA70ww
	mdj0OEOBP8f7DFsslZctpDGpnAXMUtCCfTGNOGYQT4w4FVnbIRklKAg92qf7wnlJ1ptmaRG8YVH
	rI+tEkJM8htCLUTRDHQ00KAtkAOpdiJGpJvrbt5TkBGWYhieMY0nrPWDRUVSbCCstk5L5v4A3GB
	M0NgvdYFWyoiald4gwfIrBYV9+EJQNK7Ay0G0Q/t37aPIswLwQNHlZh7FBynr5I0CmKThLxyXOt
	eB24/vOMpQS0sX2L6vUPJIwxXYeUk+YL7AZnQj8b9EM3/cVrDta0wdUbr15jqk52VAZy43upcvz
	W0kY2S6/BStrIy6MKTsc/HwdCfi9c8wg/MvZplcyASx8UK4PF1H3YMZ8WZad5aPtwxNCt2uiKMp
	385MBVs3KDslQ0UUUqwwWE5MjjUxpTEVB+Nb2nxcxxdYvEhTKXfbswvtdoo0vf4lvEt7/FZYRyt
	MOGbjiDwgWaEzs1YAK2vFyId1+eK7+13HkVlipUXEYbai8CoMRkltSP89IFdWTi8tkSIzg==
X-Received: by 2002:a17:902:d584:b0:2e9:776c:d52e with SMTP id d9443c01a7336-2ed41c0ab5dmr51284825ad.52.1794030747981;
        Fri, 06 Nov 2026 21:52:27 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a1a:7bc2:20ba:a479])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d8949fsm11189465ad.62.2026.11.06.21.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:52:26 -0800 (PST)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com,
	lkp@intel.com
Subject: [PATCH v8 3/5] tracing: Add stackmap statistics interface
Date: Sat,  7 Nov 2026 13:51:37 +0800
Message-Id: <20261107055139.3138633-4-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107055139.3138633-1-lipengfei28@xiaomi.com>
References: <20261107055139.3138633-1-lipengfei28@xiaomi.com>
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

From: Pengfei Li <lipengfei28@xiaomi.com>

Add stack_map_stat to report the map generation, the elements used, the
stacks recorded as a cookie, and the stacks the map could not store
because the element pool or the probe limit was exhausted, so that users
can tell when the map is too small.

Assisted-by: LLM
Signed-off-by: Pengfei Li <lipengfei28@xiaomi.com>
---
 kernel/trace/trace.c          |  4 ++
 kernel/trace/trace_stackmap.c | 78 +++++++++++++++++++++++++++++++++++
 kernel/trace/trace_stackmap.h |  1 +
 3 files changed, 83 insertions(+)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index cdae2976d224..e58e7936c867 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -2197,6 +2197,9 @@ static __init void stackmap_init_tracefs(void)
 		return;
 	}
 
+	trace_create_file("stack_map_stat", TRACE_MODE_READ, NULL,
+			  &global_trace, &ftrace_stackmap_stat_fops);
+
 	guard(mutex)(&trace_types_lock);
 	stackmap_state = STACKMAP_INIT_READY;
 	/* trace_options=stackmap on the command line */
@@ -4399,6 +4402,7 @@ static const char readme_msg[] =
 #ifdef CONFIG_FTRACE_STACKMAP
 	"  stack_map\t\t- Stacks recorded as cookies with options/stackmap\n"
 	"\t\t\t  Write '0' to reset it, 'free' to release it\n"
+	"  stack_map_stat\t- Usage of the stack map\n"
 #endif
 #ifdef CONFIG_DYNAMIC_EVENTS
 	"  dynamic_events\t\t- Create/append/remove/show the generic dynamic events\n"
diff --git a/kernel/trace/trace_stackmap.c b/kernel/trace/trace_stackmap.c
index b02eb22c76a9..5d2a406f39b9 100644
--- a/kernel/trace/trace_stackmap.c
+++ b/kernel/trace/trace_stackmap.c
@@ -42,6 +42,8 @@ struct ftrace_stackmap {
 	atomic_t		resetting;
 	u32			generation;
 	refcount_t		ref;
+	atomic_long_t __percpu	*successes;
+	atomic_long_t __percpu	*fallbacks;
 };
 
 /* Serializes tracefs readers against reset. */
@@ -73,6 +75,8 @@ static struct stackmap_elt *stackmap_get_elt(struct ftrace_stackmap *smap)
 
 static void ftrace_stackmap_destroy(struct ftrace_stackmap *smap)
 {
+	free_percpu(smap->fallbacks);
+	free_percpu(smap->successes);
 	vfree(smap->elts);
 	vfree(smap->entries);
 	kfree(smap);
@@ -100,6 +104,14 @@ static struct ftrace_stackmap *ftrace_stackmap_create(void)
 	if (!smap->elts)
 		goto fail;
 
+	smap->successes = alloc_percpu(atomic_long_t);
+	if (!smap->successes)
+		goto fail;
+
+	smap->fallbacks = alloc_percpu(atomic_long_t);
+	if (!smap->fallbacks)
+		goto fail;
+
 	smap->hash_seed = get_random_u32();
 	smap->generation = stackmap_next_gen;
 	refcount_set(&smap->ref, 1);
@@ -149,6 +161,7 @@ static void stackmap_put(struct ftrace_stackmap *smap)
 static void stackmap_reset(struct trace_array *tr)
 {
 	struct ftrace_stackmap *smap = stackmap_locked(tr);
+	int cpu;
 
 	if (!smap)
 		return;
@@ -161,6 +174,10 @@ static void stackmap_reset(struct trace_array *tr)
 		memset(smap->entries, 0, sizeof(*smap->entries) * smap->map_size);
 		memset(smap->elts, 0, sizeof(*smap->elts) * smap->max_elts);
 		atomic_set(&smap->next_elt, 0);
+		for_each_possible_cpu(cpu) {
+			atomic_long_set(per_cpu_ptr(smap->successes, cpu), 0);
+			atomic_long_set(per_cpu_ptr(smap->fallbacks, cpu), 0);
+		}
 		smap->generation++;
 	}
 
@@ -194,6 +211,11 @@ static int stackmap_free(struct trace_array *tr, struct ftrace_stackmap *self)
 	return ret;
 }
 
+static void stackmap_count(atomic_long_t __percpu *counter)
+{
+	atomic_long_add_unless(this_cpu_ptr(counter), 1, LONG_MAX);
+}
+
 bool ftrace_stackmap_get_cookie(struct ftrace_stackmap *smap,
 				unsigned long *ips, unsigned int nr_entries,
 				u64 *cookie)
@@ -254,8 +276,10 @@ bool ftrace_stackmap_get_cookie(struct ftrace_stackmap *smap,
 		probes++;
 	}
 
+	stackmap_count(smap->fallbacks);
 	return false;
 found:
+	stackmap_count(smap->successes);
 	*cookie = ((u64)smap->generation << FTRACE_STACKMAP_COOKIE_GEN_SHIFT) | idx;
 	return true;
 }
@@ -415,3 +439,57 @@ const struct file_operations ftrace_stackmap_fops = {
 	.llseek		= seq_lseek,
 	.release	= stackmap_release,
 };
+
+static int stackmap_stat_show(struct seq_file *m, void *v)
+{
+	struct trace_array *tr = m->private;
+	struct ftrace_stackmap *smap;
+	u64 successes = 0, fallbacks = 0;
+	int cpu;
+
+	/* Reset and free also take trace_types_lock. */
+	guard(mutex)(&trace_types_lock);
+	smap = stackmap_locked(tr);
+	if (!smap)
+		return 0;
+
+	for_each_possible_cpu(cpu) {
+		successes += atomic_long_read(per_cpu_ptr(smap->successes, cpu));
+		fallbacks += atomic_long_read(per_cpu_ptr(smap->fallbacks, cpu));
+	}
+
+	seq_printf(m, "generation: %u\n", smap->generation);
+	seq_printf(m, "entries: %d\n", atomic_read(&smap->next_elt));
+	seq_printf(m, "capacity: %u\n", smap->max_elts);
+	seq_printf(m, "successes: %llu\n", successes);
+	seq_printf(m, "fallbacks: %llu\n", fallbacks);
+	return 0;
+}
+
+static int stackmap_stat_open(struct inode *inode, struct file *file)
+{
+	struct trace_array *tr = inode->i_private;
+	int ret;
+
+	ret = tracing_check_open_get_tr(tr);
+	if (ret)
+		return ret;
+
+	ret = single_open(file, stackmap_stat_show, tr);
+	if (ret)
+		trace_array_put(tr);
+	return ret;
+}
+
+static int stackmap_stat_release(struct inode *inode, struct file *file)
+{
+	trace_array_put(inode->i_private);
+	return single_release(inode, file);
+}
+
+const struct file_operations ftrace_stackmap_stat_fops = {
+	.open		= stackmap_stat_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= stackmap_stat_release,
+};
diff --git a/kernel/trace/trace_stackmap.h b/kernel/trace/trace_stackmap.h
index 6699988da390..a18e41c08494 100644
--- a/kernel/trace/trace_stackmap.h
+++ b/kernel/trace/trace_stackmap.h
@@ -18,5 +18,6 @@ bool ftrace_stackmap_get_cookie(struct ftrace_stackmap *smap,
 				u64 *cookie);
 
 extern const struct file_operations ftrace_stackmap_fops;
+extern const struct file_operations ftrace_stackmap_stat_fops;
 
 #endif /* _TRACE_STACKMAP_H */
-- 
2.34.1

