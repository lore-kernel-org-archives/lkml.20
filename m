Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194430;
	b=UImqSY+qwrFbsbhCR/iRydByBfjCs9m8yHbXz+Fiy+xOOSbF689HOrktOvQPg2UfO5vi
	 hrMKcB3ORuIijQUib9WtW1jkSJQP+zgHMV2HdtriHwEg7857zGuw4rhTnt0QInhgdsbrL
	 SjXri7GgyKGyDj40k9ekWUhogssXUZju8ca4RqvotK1yXXje6lszfw7D92rMRx/iJvcxB
	 3l+08ZDEdJy/34jzI1nx/IaEfovl66hu2ESo+4iMEAQ2IjtIlFSBtC9ntwu1W3jfN3WBX
	 lnYPNjteNVYtVn2YHnTlyYzyVyuu3bEu7D24bi67F0qL38MKjqC6iMrUgwhaQmvqYyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5Gktc4fxUiUbyi4OC6QEacgpGkR7EGDsMwiLK6P1Grs=;
	b=RovBVtnRpDnVOWkZ6NcCRaK897v6x3VZb6MDoHB8ovjsam/z8C5ljAjl8Vsq0csjG7BN
	 c3COqQ27JUCCeBNflfeTDBWhcKoIL0OngWChknW3n32ybcoooXXKpn7vtLiKHtTOMSIdp
	 cJeiBgPMLjGkFmJQQy408CTaTtjdeIaATOoEBYs2mdV2UjD8QUFYAQNp8wXxmAcmiSu+G
	 UivdFDIiNZcCmBPJB+zHkwdF/XUP2TzYnFbdE2dWYMAtue+ddZGxjKMl3oCdP3rIvf3xD
	 4I8lbxINzhwMCvQ0et0EjLOdIZ9P1GsXbKUYY0YiBWEe2quoSVQiALo/LNA+U7UJ0bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=armoriq.io;
	spf=pass smtp.mailfrom=armoriq.io;
	dkim=pass header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=B91Aa6u7;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD3A60A2608
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDD3A60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armoriq.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armoriq.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=B91Aa6u7
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0cf2c0785so8221737b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=armoriq-io.20260707.gappssmtp.com; s=20260707; t=1793194429; x=1793799229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Gktc4fxUiUbyi4OC6QEacgpGkR7EGDsMwiLK6P1Grs=;
        b=B91Aa6u79uDzBTZQoJ4nI5PWEdog/sk7iPSmqLj0Ds0uOhiy1nZHi4jArsHgdLZ+we
         ML9JIYIXWsC1Yc8PaywyqFJfkjzxt9Rs/PCvH5sN8jYvnDm1uFNpo/H1Fz81yeaKg/iy
         lAONHkIUrZZZDINr68gcvgPSRIsPXOsnOmpaofi10nLSW7CjY9rr6rn8MyZFYf8iCf63
         /GgaGuUmCkE6+g0ivR5kmjIl4MgEtsnkwOyqG7WzO8QWHkAjuJRcbjJERJgFydEF2qCZ
         1kaJ4Pyk3fzy7ZDy45PsDEPoFAkuJtPuAuisDM60jP2EmZaV3dvEWlnxGolvEyzoCHFC
         ng8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194429; x=1793799229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Gktc4fxUiUbyi4OC6QEacgpGkR7EGDsMwiLK6P1Grs=;
        b=D/pAbdnzvcvakZh1DW1vPOJ8UJDZ3/4/Xxby714b7XxDrUYB8jsdZXZkoqN0FLsZSo
         A8LhLNum9+3oMOlmG3CwEYooXxzAvKPCVEAJaC3a4R4bb5GHCqRNp3a2FIIBX8BmeZMt
         +x3Y94B6U4rnnWndotG9dD+g4ZO5UucjRRf7CR1siYQ4cCsSYMMVS+yID8nbG/YID/V9
         KTacvy4qDHmsGZxhClnbxjqVsGZrZGgiOiXA/WlNmcZZrPd9kpBf7adui+YFjakBz3m+
         LswJHOOojYrKn9Jv2sM1TngrAqR2E/ZPBzOrgEcdh2ETwg0v+Zsx1v7p8YNJRCZ8IDmI
         POZg==
X-Forwarded-Encrypted: i=1; AKwUvBzVlwzpylelMwJ73dd0H892M9OYs3Dj0hcDXTj9F8CivkqoztormGtvhdV1TQ8mB5tIHj6ahTZeM4TDj0w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQanfUWD7ci7JrbqmDVx4j1mbpXMzVE2zN3zRQ/HGWLWbm8qgP
	/wapYitInynklgPZJQ8SYvvyL2Dt1MkgKkNyNa6XqxNCbGNU6dMipR/MI+uYxvQNjchY
X-Gm-Gg: AYBFou02GsseCLUIvC5OIhn9/CAEycfo/JZExVVzZJHx1s79xIm9V288Zty2kxz/QDl
	tpL+PCKnCNTwbyHOaxlH52Qe+72eLDEHWhcq/4Ijhl6TDpRTeLklIu+p0TMtvCs9aZunhCgPRim
	p1dhPrfgjC6CvHAdFvyFzv2J5g22C+NpHJMp4/am9mOpSIIN/7TTNpY5Vf/Xy+3k2ligVFw3FCF
	vh8r6Pm0QD+taLdll/tqzLGS5kUHxMFvN2r994UjqzRB74uJV8Bjo3ZpS8nrSZVg0/la0BXBYJu
	gFxzxCV2kfMkj+h6w9Uzl6rWvTo+9i+v0Pt1u4OjyuCWY/lqEgNgzP8N+ezy0JGg1SBcSVW3L70
	FT0EX4fpfu89WMc5j8Vp+LbQa1/l1d5YUBP8ihPiA9VsYwfXiOKb5fFk9Uqxu/G9EeKfIb9VJSo
	0jASRF+HhE8ZoJjg6mA7r2YSMzL147ALrUx53oGL/h+3qil2SjCAUFRZDEYIX4HFlEq5r3uzGg0
	RPomsWdxtJo4JneG+ll6jB7uu+r5tihKQdWsMXwXLKokSQTNBcn6FLQHtyEDcGuRfYFNwxecxjb
	5C3AmzWtYKn62upOYlmTIkugc5UDtYe91ejlACxlxW7mB/li2cmjpPcwhlDGjRAkbqyFQITP3I7
	N/AjUMCVI6TrsgWhLEgp03+jUZs22VZByLpEleIGesr5tDkI=
X-Received: by 2002:a05:690c:832:b0:8b0:e238:271c with SMTP id 00721157ae682-8b1b5c885f2mr9630557b3.27.1793194428780;
        Wed, 28 Oct 2026 06:33:48 -0700 (PDT)
Received: from CC-KJQTV599DQ.attlocal.net ([2600:1702:7b5a:ab90:103d:30e1:1f09:a9ae])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a79f38dfesm1694911d50.1.2026.10.28.06.33.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 06:33:48 -0700 (PDT)
From: Ketan Bhardwaj <ketan@armoriq.io>
To: Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>
Cc: linux-security-module@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-api@vger.kernel.org,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	linux-kernel@vger.kernel.org,
	"HARIHARA SUDHAN . R" <harisudhan@armoriq.io>,
	Ketan Bhardwaj <ketan@armoriq.io>
Subject: [RFC PATCH v2 2/6] security: kap: add the LSM ID and internal headers
Date: Wed, 28 Oct 2026 09:33:31 -0400
Message-ID: <20261028133335.75899-3-ketan@armoriq.io>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261028133335.75899-1-ketan@armoriq.io>
References: <20261028133335.75899-1-ketan@armoriq.io>
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
Co-developed-by: HARIHARA SUDHAN. R <harisudhan@armoriq.io>
Signed-off-by: HARIHARA SUDHAN. R <harisudhan@armoriq.io>
Assisted-by: Codex
Signed-off-by: Ketan Bhardwaj <ketan@armoriq.io>
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
2.51.0

