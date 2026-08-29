Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6657937C908
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788006042; cv=none; b=NvKehxN9IqxxeNHJgwRSInff7f4ohpBHY0x6DGZLYz7vdyVUsT78b+jtSJv0M9k7H1AkkV4bUt+YSXaxnJNVprCQEUkztY94LtNmXDuXqlpeiQQ6rfqClDXps0X18UM9QCPumcx2D16LAoOXv6UrL6BrXnbACdMWNqz8Xzy9Jqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788006042; c=relaxed/simple;
	bh=On5QLSADWXj7ehvrb5mpi4doFVUA0NCpPYlWd5mFwE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N97NeM/qHEDZ9OgbBN0qqyPikXlq/Q/zU3pHzKRvRARKOJ1bET+gV/3lBu6c9MZvI8ZLnk80nIVVlU7K+UcEfspAwsL9okAXwpRQDJtJJ3XZW+V9q6UoPoLwVbyAkOWRqMtin0iYRE9vNTi/vSzugsnD2Vw+J2aGgbdCC/6SBEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZoWInOzc; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZoWInOzc"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso18580585e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 05:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788006038; x=1788610838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b9Hl9L5OM4zLmYxZt3PdWHTJUIrg0x1d8J+XYA0ccVA=;
        b=ZoWInOzcsApWwLvRrgSYkknxQSeh14RbZqORYqK64XXqMt1EthifU6GMQenqoBKXcO
         XJnVycgo0Sywdf+JxksAVwiYwMl8+DhaPkS5ixEfZo9oLIjSKlwCWjm5Av092BWuj3VD
         +DH/6V8xCeX8ncP/93PQq6qMvZrKrmR7M6LWkjtCZMEKdc8H/8XuBeumahK9qWaF2uEr
         TsgCd8t+FB/XSqB4Ux/0kxcg2Pa25JyEBMp6oQbFmlYSVrtout3PZ1kakVKcPGyoK8qu
         D6flpDQNo5ohmnqlSQP7yIHfNr2sQTYZWPR3A+VcOhXDcw2sps44kUYiRDDH32KJ7DY2
         5TTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788006038; x=1788610838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9Hl9L5OM4zLmYxZt3PdWHTJUIrg0x1d8J+XYA0ccVA=;
        b=pHxaVtYfpUR14bmcxf2GojF/FrWQ2Li1qtw9Ik4uQAunxYkpFqGxWRuYhwoxGmfHCV
         4+Zv6Cv875T/CR3toHm/Hg0Sv8beI8Yfh1XhkneFcsZRcfOjPsU9Hb/K77kVc5fYU1PA
         uwiTMS1t5/LH9EEwXhqV8xZqqXUp+xjHreWJx4Ukh90Vhgg6JCXqXUKbuO/lCvLMj85O
         tIBVwHUa3McD7C62diDWKHAKvR7BGGuKvTSzWK/ueLrEhQfbCuGKS312pIPsM/6dg2K+
         G0xuqt9cgCc1WfpQ/KiK+Yf856IlRXTwZPb7K/CuzNaiA8Ba8QaaG00rpXZ5BP4NURve
         ITyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqddURWseI/k0EepgMj7jSNT7EvL0ZNmDTiUsEsDD5T/Q6XsEn+yPvwafBSodDIRD+oSrJiNkCyV7KlsH0=@vger.kernel.org
X-Gm-Message-State: AFuF++mHGvGe2ZOOz2mGynil2bcRUj6228FuACpmCKzpYp9GME/WeTPO
	5pK59Nylli+JgkqTuG+IGKA7fbvFJZ03ioheZCSXbFtGGgpPNsgEETBy
X-Gm-Gg: AR+sD11KTE6jJHA4muKxCr2CMOntlULgvsFVNim45bNFhfx9OyR/8T355mw20x+fGAx
	3i7OTRnYZM1bEJ904Ovj5uM5gmOVF/SXLp4b6KslkI8f9/vzU7KIJVhXKpQsw8xiJHNssphWs45
	wqCjBr/x6hjOjcL0QvyP0Ah4qhJQtuPg3gwDViK0oDdNfLmf/AOKIHT3YzIs0CVCmCvK2FDIv8j
	dSrZy0BreIwRVl2BZL8oTRQZaZXAPacAWkOW41l5eHhkkIIRF0+idkW3FwvGcZtBKIs+vYtKmvL
	MMH4Dcr4KHFWwu7j4l6oKmGbLlnz6K/kw6SmhOJVah4t4nC6Dj2NN0twheLPPUOvdt0cXU+YxWP
	WrAME7c5GEQBsiYE3r77JgLgZ6IA+Z/t3kTm3S+tHitvrKdM1Elh/jI0u2rE1Fg606vOBoiqrtw
	mdS1VQ6SUWpvMrH7T2El5y3v887+K0duqWVM/EEnSkm0dg+Zos8/HEAxpag5OGUSjHjnG+aDyqZ
	bPDFwFudGwuzBu64rDVLYwSxr6zv6JrvmL1F/VVf+nsFpzm
X-Received: by 2002:a05:600c:4ecc:b0:49c:ced9:ab7f with SMTP id 5b1f17b1804b1-49cced9abb7mr32848505e9.8.1788006038105;
        Sat, 29 Aug 2026 05:20:38 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b494228bfsm207048685e9.2.2026.08.29.05.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 05:20:37 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: tj@kernel.org
Cc: sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	changwoo@igalia.com,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] tools/sched_ext: Extend the prolog migration probe to cid-form schedulers
Date: Sat, 29 Aug 2026 13:20:35 +0100
Message-ID: <20260829122035.58018-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scx_lib_init_probe hooks bpf_scx_reg(), which is where a cpu-form
scheduler enters the kernel when its struct_ops link is created. A
cid-form scheduler comes in elsewhere: bpf_sched_ext_ops_cid points .reg
at bpf_scx_reg_cid(), a separate function, so the probe never fires and
the flag it is meant to set keeps whatever it was compiled with. Give
that path its own probe over the same body. The catch is that
bpf_scx_reg_cid() has only existed since v7.2 while this header still
builds schedulers for older kernels, so the new program is "?" and
__SCX_OPS_OPEN() switches it on once it sees the symbol.

Default __scx_prolog_disables_migration to false, the over-reporting side
of is_migration_disabled(current), so the value used when no probe runs
matches what the comment describes as safe. That also covers loaders
which attach the struct_ops map but not the fentry programs.

Cc: Changwoo Min <changwoo@igalia.com>
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 tools/sched_ext/include/scx/common.bpf.h | 53 +++++++++++++-----------
 tools/sched_ext/include/scx/compat.h     |  3 ++
 2 files changed, 32 insertions(+), 24 deletions(-)

diff --git a/tools/sched_ext/include/scx/common.bpf.h b/tools/sched_ext/include/scx/common.bpf.h
index 76f5e025e107..be37c451cc0d 100644
--- a/tools/sched_ext/include/scx/common.bpf.h
+++ b/tools/sched_ext/include/scx/common.bpf.h
@@ -530,37 +530,29 @@ static __always_inline const struct cpumask *cast_mask(struct bpf_cpumask *mask)
 }
 
 /*
- * True if the non-sleepable BPF trampoline prolog (__bpf_prog_enter) calls
- * migrate_disable() for the current task. Recorded once by
- * scx_lib_init_probe, an fentry program on bpf_scx_reg() that fires during
- * the natural scheduler-attach call chain (auto-attached by scx_ops_attach!).
+ * True if the non-sleepable BPF prolog (__bpf_prog_enter) calls
+ * migrate_disable() for the current task. Set by the probes below.
  *
- * Defaults to true (conservative). Over-reporting in is_migration_disabled()
- * causes local-only dispatch, which is safe. Under-reporting can crash the
- * scheduler, so we err high if the probe somehow fails to run.
+ * Only affects is_migration_disabled(current): set attributes
+ * migration_disabled == 1 to the prolog (returns false), clear takes it at
+ * face value (returns true). Under-reporting can crash the scheduler, so the
+ * default is false for loaders that never attach the probes.
  */
-bool __scx_prolog_disables_migration __weak = true;
+bool __scx_prolog_disables_migration __weak;
 
 /*
- * scx_lib_init_probe - non-sleepable prolog probe.
+ * Prolog probes. Each struct_ops type needs its own: bpf_scx_reg() serves
+ * bpf_sched_ext_ops, bpf_scx_reg_cid() serves bpf_sched_ext_ops_cid, and the
+ * two are separate functions. Both run before ops.init() and are vtable
+ * entries, so neither can be inlined away.
  *
- * Attached to bpf_scx_reg(), the .reg callback in bpf_sched_ext_ops
- * (kernel/sched/ext.c). The kernel's struct_ops machinery invokes
- * bpf_scx_reg when userspace creates the scheduler link, before
- * ops.init() fires. Its address is taken in the vtable, so the symbol
- * is non-inlinable and has been stable since introduction.
+ * bpf_scx_reg_cid() only exists from v7.2, so that probe is "?" and
+ * __SCX_OPS_OPEN() enables it when the symbol is present.
  *
- * Entering via fentry runs us through __bpf_prog_enter -- the
- * non-sleepable prolog that consumers of is_migration_disabled() live
- * under.
- *
- * Loud warning: the prolog adds at most 1 to migration_disabled.
- * Reading > 1 means something upstream in the
- * bpf_struct_ops_link_create -> bpf_scx_reg path disabled migration
- * before the prolog ran, invalidating the probe; audit and adjust.
+ * The prolog adds at most 1 to migration_disabled. Reading > 1 means
+ * something disabled migration before it ran and the result is unreliable.
  */
-SEC("fentry/bpf_scx_reg") __weak
-int scx_lib_init_probe(void *ctx)
+static __always_inline void __scx_record_prolog_migration(void)
 {
 	if (bpf_core_field_exists(((struct task_struct *)0)->migration_disabled)) {
 		const struct task_struct *p = bpf_get_current_task_btf();
@@ -573,6 +565,19 @@ int scx_lib_init_probe(void *ctx)
 
 		__scx_prolog_disables_migration = md > 0;
 	}
+}
+
+SEC("fentry/bpf_scx_reg") __weak
+int scx_lib_init_probe(void *ctx)
+{
+	__scx_record_prolog_migration();
+	return 0;
+}
+
+SEC("?fentry/bpf_scx_reg_cid") __weak
+int scx_lib_init_probe_cid(void *ctx)
+{
+	__scx_record_prolog_migration();
 	return 0;
 }
 
diff --git a/tools/sched_ext/include/scx/compat.h b/tools/sched_ext/include/scx/compat.h
index 7c12df45fdba..3a42f65a9346 100644
--- a/tools/sched_ext/include/scx/compat.h
+++ b/tools/sched_ext/include/scx/compat.h
@@ -284,6 +284,9 @@ static inline long scx_hotplug_seq(void)
 	SCX_BUG_ON(!__oskel, "Could not open " #__scx_name);			\
 	__oskel->struct_ops.__ops_name->hotplug_seq = scx_hotplug_seq();	\
 	SCX_ENUM_INIT(__oskel);							\
+	if (__COMPAT_has_ksym("bpf_scx_reg_cid"))				\
+		bpf_program__set_autoload(					\
+			(__oskel)->progs.scx_lib_init_probe_cid, true);		\
 	__oskel;								\
 })
 
-- 
2.55.0

