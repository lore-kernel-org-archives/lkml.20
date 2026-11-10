Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342223;
	b=GKDkgZbhmca/ibfTWE4FhRfjoVO/f0o3xhOKIEOkuHTDl2vQjIWEuhFd0Qtg40o3HZW6
	 SWFwztzWup6bNpfjYQoFcD3vAe/ujnBpycOBXKJrYpvzZ+fkDcyPDkhKxcsDYlcR+Xz/q
	 4S58EuNdGazoocpy4ZLQ77KnXXlH2MkgclIvV7ifJudqHYGVZuRf9sjcyHVgrHoCOp5wA
	 cMAcR0PkrwIN63RD9ZJCqvCy7347dLO5Z2DwfKMRDvrtDJdp2JkApm2B2+pKahcSxRcNn
	 wjsJOqhvE5tEvwS4ozfJF0zzIwCxM+dUL5NHG8/qDMlFZBPcPeoRr1sL70t0taHq+BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iiQmrpC/DvbapskOgQfgIZOB3UAlz4kp9CKCXyKiGBY=;
	b=BpMdEPGJcFMFne33h8XU+vUR9l5uGyGJM58JlB5N31GhMPNKVNYEaZeCNCt5wAJdnCEn
	 nxZYQoOefbkuR/OeWBLdAJR60HH8fc5JRIRtoVeKXoxBmT1aWdRxHuQOHXmlLlPpNM6wJ
	 uaLNwxATWkqsTli2m9ba3lNoIovAM2LWte0l27j3GLevKAaH2+zuEtR06TH0vrmRKqcmQ
	 ed7SCHTPSgSACXOwxk6mWr9WmpzcM5wYPgdrT1v5k7t1SDAK15AVxSx76pchKgnajIml3
	 hgIUHQsQsSeIRLluFqcoOFD5aFS+ByU/i3a0pPBQ4F02HLPenaKQqA8EczhLXf0c4Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=armoriq.io;
	spf=pass smtp.mailfrom=armoriq.io;
	dkim=pass header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ClX4eINe;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2B960A381E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B2B960A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armoriq.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armoriq.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ClX4eINe
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37071c0f42aso4317372eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=armoriq-io.20260707.gappssmtp.com; s=20260707; t=1794342223; x=1794947023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iiQmrpC/DvbapskOgQfgIZOB3UAlz4kp9CKCXyKiGBY=;
        b=ClX4eINeCBGpbbsBX9R4C2FLvz48OC7bmO+t7aycI/KLBTIkaKsP4JH742yrNnX+9/
         FSooz94iAP+Sklig5VC0dZNZEcRCm4ObXWCGkCov4hovmTsxHGZL8FW+BRTD52+mzEkH
         oSE8bBFg8QpoGz6GKn9bFeIt/y47ZkxsU3vxWtEGVimKydMExkgybH/pc+XTsi6ANjwM
         nPCenQ57UhLojj8i2Q9mvvRZk5EuvSJwGm3bShYaq5tcVLsj7Ypt7Yi9RPlu5fxUb/KW
         MIuBixaeaVp2mKxouv8eDEy0RLMZyp/gXGs02bzO/m4BRnlRT7ic5JvKtwFbnp8m0/rt
         kqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342223; x=1794947023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iiQmrpC/DvbapskOgQfgIZOB3UAlz4kp9CKCXyKiGBY=;
        b=yupB4wWGtuSsC6QVw+fRYMZELaWIXczbxjdQcMcc1IbpnxgXxrB3ETfb2t36kd5vdf
         +dIIefmrZGVH+6RiuK4dmVoGLj7PVYqZ/aVI6RDFhvg5sSG+6Yxu1LhFAi/PacUJ0/70
         E8I5DQR3x0Kci2Vsl3AqnCaiHo3i+2JDavU76Cbg1s7wkbSKFjMH4LPi2scbj/YDZiwl
         /b1/f5gCux2DvuxSc2LK8gm/igyVK/LSUeX2q7MlfZZwKUURWi5hl1w/r/B/OjRWZSHv
         3r8zrgOcATba0+vfldukDM4JvTzchX0G8XzaxNEKUsZbWPWFkpxdAUVZ7ujl50xxJn3G
         kOYg==
X-Gm-Message-State: APuU4Z+BW1xWlddbsMSRQ6A8Np5KwdzU/0bVIZT/ynv4hzm2CIa5C8je
	nZP7BP8y9XNr8kuHhpfCQtVe1SiYrYNoxj6rk2Pk85GazFJE/SRkD2rWsqbUNoLzbK54z2xWrjr
	aqUcPadCmtbo=
X-Gm-Gg: AYBFou22XxAe+r5LZYOUTHR4QEyYodQrflboy0HdBMfsH1qI5hXID1xVfFbc/6iJN0/
	CjTLcB+aossRSzOk8mYhqRhHgGdjMBZiOK04Zwll+RqdnysIMTJskcWoiBZA/Q7bFhQk2IVmZ3z
	4WJmLjjmy8Qaf7Vk+E+nPV40vZf/SRdVd7fmT8Feu3xhzPGEnDv046uWqGpaL9wLvg9YghEk2Ve
	Zpcke70we/MXbkx6q2gsFcyUegDOQpUhWmfcWsrsfMagzXHR/pdt8FhJJnCnhLRurUeZ2tLAJxP
	tz0PPXcckrwG7iZ9sj+DVCenBq82jFTopBOxcoSY34u2xbYr4zUXKh1fveVnPEy1T0wczuI8YWA
	syBa1WbK4Ib7YDRPzlPY5M7/Xea2U8+5gzmehwJoacnWaMmWE6USB8gefVg7hm2MZhSeb/PAZ9W
	WJ3jf19+P0JAkoqt0kxC3dZDbuxcOVgatzkoM0mkk2ANnWOqd87eRfSOfxy5heDrhO1oiuMlmKF
	4xygcOPE5Di48gox4xGTwd1F0KfCtGz1G1rdrn+ljdn5GRVd9Z/Z9eeCS5+Sien1g9/XXuuFgnu
	QJJusS0nrUGB47u7CVenCE6+rA+NKLtRpyPyWG2ASTsHOunle4uv7nI5/0Hg3i/m3Xt6/793NvV
	Mxmkozdlx81sDcAYhSe7AKAgynOOGy5mDDdQsTwczrTJfHvgG/QXPqQ==
X-Received: by 2002:a05:7301:d186:b0:369:38e3:5363 with SMTP id 5a478bee46e88-3768579fb1emr528736eec.7.1794342222184;
        Tue, 10 Nov 2026 12:23:42 -0800 (PST)
Received: from localhost.localdomain ([2409:40f4:147:2742:6545:702a:2431:7dca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe29fsm10076615eec.21.2026.11.10.12.23.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 12:23:41 -0800 (PST)
From: "HARIHARA SUDHAN. R" <harisudhan@armoriq.io>
To: linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Paul Moore <paul@paul-moore.com>,
	Kees Cook <kees@kernel.org>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mel Gorman <mgorman@suse.de>,
	Suren Baghdasaryan <surenb@google.com>,
	Ben Segall <bsegall@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Ketan Bhardwaj <ketan@armoriq.io>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	"HARIHARA SUDHAN . R" <harisudhan@armoriq.io>
Subject: [RFC PATCH v3 2/6] security: kap: add the LSM ID and internal headers
Date: Wed, 11 Nov 2026 01:52:42 +0530
Message-ID: <20261110202246.274-3-harisudhan@armoriq.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110202246.274-1-harisudhan@armoriq.io>
References: <20261110202246.274-1-harisudhan@armoriq.io>
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

Reserve an LSM ID for KAP and add the declarations its files share.

The ID is the next free value in the target tree. It is provisional
and is for the LSM maintainers to confirm.

Assisted-by: Claude
Co-developed-by: Ketan Bhardwaj <ketan@armoriq.io>
Signed-off-by: Ketan Bhardwaj <ketan@armoriq.io>
Signed-off-by: HARIHARA SUDHAN. R <harisudhan@armoriq.io>
---
 include/linux/kap.h      |  16 ++++
 include/uapi/linux/lsm.h |   1 +
 security/kap/kap.h       | 159 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 176 insertions(+)
 create mode 100644 include/linux/kap.h
 create mode 100644 security/kap/kap.h

diff --git a/include/linux/kap.h b/include/linux/kap.h
new file mode 100644
index 0000000..8d11d20
--- /dev/null
+++ b/include/linux/kap.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_KAP_H
+#define _LINUX_KAP_H
+
+#include <linux/types.h>
+
+#ifdef CONFIG_SECURITY_KAP
+int kap_check_namespace_flags(unsigned long flags, const char *operation);
+#else
+static inline int kap_check_namespace_flags(unsigned long flags, const char *operation)
+{
+	return 0;
+}
+#endif
+
+#endif /* _LINUX_KAP_H */
diff --git a/include/uapi/linux/lsm.h b/include/uapi/linux/lsm.h
index 938593d..7cb3d64 100644
--- a/include/uapi/linux/lsm.h
+++ b/include/uapi/linux/lsm.h
@@ -65,6 +65,7 @@ struct lsm_ctx {
 #define LSM_ID_IMA		111
 #define LSM_ID_EVM		112
 #define LSM_ID_IPE		113
+#define LSM_ID_KAP		114
 
 /*
  * LSM_ATTR_XXX definitions identify different LSM attributes
diff --git a/security/kap/kap.h b/security/kap/kap.h
new file mode 100644
index 0000000..14cfe4d
--- /dev/null
+++ b/security/kap/kap.h
@@ -0,0 +1,159 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _SECURITY_KAP_H
+#define _SECURITY_KAP_H
+
+#include <linux/list.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#define KAP_TASK_IGROUP_NAME_LEN 64
+
+struct dentry;
+struct task_struct;
+
+enum kap_hook_kind {
+	KAP_HOOK_EXEC,
+	KAP_HOOK_FILE,
+	KAP_HOOK_SOCKET_CONNECT,
+	KAP_HOOK_CRED,
+	KAP_HOOK_IPC,
+	KAP_HOOK_NAMESPACE,
+	KAP_HOOK_DESCRIPTOR,
+	KAP_HOOK_BPF,
+	KAP_HOOK_PTRACE,
+	KAP_HOOK_PROCFS,
+	KAP_HOOK_EXECMEM,
+	KAP_HOOK_IO_URING,
+	KAP_HOOK_LAST = KAP_HOOK_IO_URING,
+};
+
+struct kap_task_state {
+	bool active;
+	u64 epoch;
+	char igroup_name[KAP_TASK_IGROUP_NAME_LEN];
+};
+
+struct kap_task_state *kap_task_state(struct task_struct *task);
+bool kap_fail_closed_kind(enum kap_hook_kind kind);
+int kap_check_current_target_why(enum kap_hook_kind kind, const char *target,
+				 const char **why);
+int kap_check_current_emit(enum kap_hook_kind kind, const void *object,
+			   const char *deny_reason, const char *allow_reason);
+int kap_check_current_target_emit(enum kap_hook_kind kind, const char *target,
+				  const char *deny_reason, const char *allow_reason);
+void kap_emit_current_event_target(enum kap_hook_kind kind, int decision,
+				   const char *reason, const char *target);
+
+/* Shared between the policy engine (igroup.c) and the control plane (kapfs.c). */
+#define KAP_MAX_NAME_LEN 63
+#define KAP_MAX_ROOT_LEN 64
+#define KAP_MAX_PREDICATE_BYTES 65536
+#define KAP_MAX_EVENTS_BYTES 65536
+/* The install document is the authority plus a few short header lines. */
+#define KAP_MAX_INSTALL_BYTES (KAP_MAX_PREDICATE_BYTES + 1024)
+
+enum kap_file_kind {
+	KAP_FILE_PROCS,
+	KAP_FILE_IGFD,
+	KAP_FILE_LINEAGE_ROOT,
+	KAP_FILE_AUTHORITY_EPOCH,
+	KAP_FILE_AUTHORITY,
+	KAP_FILE_TRANSITION,
+	KAP_FILE_MODE,
+	KAP_FILE_EVENTS,
+	KAP_FILE_EXPIRES_AT,
+	KAP_FILE_INSTALL,
+	KAP_FILE_COUNT,
+	/* Filesystem-wide, not created per igroup, so it sits past the count. */
+	KAP_FILE_DEFAULT = KAP_FILE_COUNT,
+};
+
+struct kap_igroup;
+
+struct kap_file_ctx {
+	enum kap_file_kind kind;
+	struct kap_igroup *igroup;
+};
+
+struct kap_bound_pid {
+	pid_t pid;
+	struct list_head node;
+};
+
+/*
+ * Predicates are compiled once at install, so a decision only walks an array.
+ * Patterns are interned into one pool and referenced by offset, so the whole
+ * thing is a flat allocation and a decision allocates nothing.
+ *
+ * The pool is sized to the authority document itself, so any document that is
+ * accepted can be compiled: a pattern costs strlen + 1 here and at least
+ * strlen + 2 in the document because of its surrounding quotes. Each set's
+ * patterns are laid out contiguously and walked by length, so there is no
+ * per-set entry limit either.
+ */
+struct kap_pattern_set {
+	u32 offset;
+	u32 count;
+};
+
+struct kap_compiled_authority {
+	char pool[KAP_MAX_PREDICATE_BYTES];
+	u32 pool_used;
+	struct kap_pattern_set allow[KAP_HOOK_LAST + 1];
+	struct kap_pattern_set deny[KAP_HOOK_LAST + 1];
+};
+
+struct kap_igroup {
+	char name[KAP_MAX_NAME_LEN + 1];
+	u64 epoch;
+	bool revoked;
+	bool has_sequence;
+	u64 last_sequence;
+	char lineage_root[KAP_MAX_ROOT_LEN + 1];
+	char authority[KAP_MAX_PREDICATE_BYTES];
+	size_t authority_len;
+	/* Expiry in Unix seconds, 0 for none. */
+	u64 expires_at;
+	/* Swapped wholesale on a successful install; NULL until the first one. */
+	struct kap_compiled_authority *compiled;
+	char events[KAP_MAX_EVENTS_BYTES];
+	size_t events_len;
+	struct kap_file_ctx files[KAP_FILE_COUNT];
+	struct list_head pids;
+	struct list_head node;
+	struct dentry *dentry;
+};
+
+struct kap_install_request {
+	char lineage_root[KAP_MAX_ROOT_LEN + 1];
+	u64 epoch;
+	u64 expires_at;
+	u64 sequence;
+	/* Points into the caller's buffer, which outlives this request. */
+	const char *authority;
+	bool have_root;
+	bool have_epoch;
+	bool have_expires_at;
+	bool have_transition;
+	bool have_authority;
+};
+
+extern struct list_head kap_igroups;
+extern spinlock_t kap_lock;
+extern bool kap_lsm_active;
+extern bool kap_ready;
+extern bool kap_default_closed;
+
+struct kap_igroup *kap_find_igroup_locked(const char *name);
+int kap_bind_pid_locked(struct kap_igroup *igroup, pid_t pid,
+			struct kap_bound_pid **entry);
+int kap_parse_transition_sequence(const char *payload, u64 *sequence);
+int kap_install_parse(char *payload, struct kap_install_request *req);
+int kap_authority_prepare(const char *doc, struct kap_compiled_authority **out);
+int kap_install_locked(struct kap_igroup *igroup,
+		       const struct kap_install_request *req,
+		       struct kap_compiled_authority **compiled);
+void kap_trim_newline(char *value);
+int kap_securityfs_init(void);
+
+#endif /* _SECURITY_KAP_H */
-- 
2.53.0

