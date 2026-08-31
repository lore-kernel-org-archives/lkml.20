Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180AD4FB9A5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188419; cv=none; b=Mw808pis7HtjDHQbkwXInmRJX7hJFPUgeUxXYo2fXp5U8k1M2uuQvlg9gNTEP8twtjexcCqyC7QnqesLQlkb58xp83qd8O6dtAsXu6bSsXS0ftp8YbbZ/+9KCE5YUEnRFxALqM6lY6CHpNxOWD4OIGQMOHVzLVgBtQYxFvQTanU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188419; c=relaxed/simple;
	bh=mBguI3lxWh98IPKMLMiJfZb8ZI8JMn8qUfhfKB7O+cg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CKEP8Ompe3Attsmt27F/EaeZCxn/5L+ATYhUgGgnYxm3suP3Jb0yNZ7IbZSaT4yBUrn8w9uykSY2u0PynQp0D6pcpy2rRp+Tw0odTfHWDpVl90V8rFExkExzmeqgSpU+ZIfuzsrnX/jJgmx5dSbKDk7t1NPBQnQvS2KhmB8APCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boAMSZEm; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boAMSZEm"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8615bb9d857so9482257b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788188415; x=1788793215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JNBFYVAoUCaDrX6UYDOJH0oSYKJlB1jRjXPAi4Ru5wU=;
        b=boAMSZEmx4LSTuyQmyphqrdYrGkYSrIsuhsKPapEWUX8A1aWzZb6VtRH2JNee6KamT
         PSBqtY+VDNfHLY8h7vGc9D5Z4HAxsxatcfpo4AsNj50e6YMnQlhsq7bKrADZ6rZU0Rc3
         Zyei8la9BngfC7/JVNBIX9zTktXanfVGcZZIB3tNZ9cn4/h1/pb1CPPmTo2OOu/wUfVt
         Fec3+Cca/eFaGV6Y9D4Bo3UEgJGaoQjVwCKywHr80LsNQhzbQ3DxAIS+oQFzGhmsecpZ
         laDie4g6FXjuw7g19AjZyXfj/kWWdbZdA47JFlENLWq+yBC3EOoDgdrQ0JDN6QBNSt1e
         qYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188415; x=1788793215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JNBFYVAoUCaDrX6UYDOJH0oSYKJlB1jRjXPAi4Ru5wU=;
        b=hmrvgCKasQntpPZYGjA9OOXLV2Ams3uwb2i6lAupZh/buNfkJPH4cP3KUmydqZXlps
         IqE9Eml5bg9TES+A1+3859BfNDQUhYaepZ6RO/zsLgCEMeZNbRUBxrfg7xVwNJAoKcaG
         CaKhew1tK4UaxNfGyiU1TGYCHnJuhqPVYq5IaPi7ozQoxEgFpo4/EIee7MDoDHYW8DjG
         K7hQPGIqSiEclJMqZh0MCa+paHRbOKuokIMEqVHNJpFC4Q9Vf6/3U5ZOnVVprgwe9Vqk
         DXm5KXa6CBWMg8hpjhTUq8fKRz9xayOddtyqJ0BLx3rwwhyDREXE0hwCdQOEDVIZcdz3
         /cLw==
X-Forwarded-Encrypted: i=1; AKwUvBydu4WY9r2S9rfbjDoM/6zNfN3bgCQgnZLwCREC6AdVttvivHalWCxPzS4//H1yPP0JwdcNwcQHP2Dv/qI=@vger.kernel.org
X-Gm-Message-State: AFuF++msw9hWdJcbrcRN9P+3USYolnelgWc5iHRVe82WOAg3g45zkLFy
	aQWXu4W5W2Z5AZ0HKeRZIAl1j7PsJfpJkUF/ORjyzf9t/fkJoVDc9gyq
X-Gm-Gg: AYBFou0bV5fwXNzBBZfmbmkO1cOI9e+f2LRhfyta7NEgss/2WOzrjSCacdxHy0K+4ex
	z+oixaop56Bm1Jo+qA5R7njjNmhbEpv4fyy7zfHdnuqAUnZbDyh7BPbILDyZVrEG2TOsQprxxQG
	qH6+5/uQebsZESagVPHENxaJiogfRSKx+ILh0b/qVGBX8mF/y9FPvh52ySbsYnaNjnoVrmy0+5x
	fqkrkRmJpMrqKq1vs2uro+bMfFqxm+PnaE/8OiR5dYarei/AB/OlwUa4abT2x6lGT/8tY4lOse/
	lON4XUOFNzVISIEReSOFrhEHssBrcoIY5vLX4vp6bJ5BUUIu9DqejUsGEgCObuuS2e7FXwzGGcR
	iQLa1yEbxUxrjlGGQuCbedTA4YEpVH1+Vv+I8egtWitZX7BVrqFJDwtiJeqLpjcF20dXUGgeOTN
	xboAEYsFR/O7xY0lLVg48qJ5g+oQWRTt9G/DEElqCz8Xhr3ajyU7PHNM62d0KhIxyR03BbpjHkw
	HNWOByf9/MMrY4uRmc3x20=
X-Received: by 2002:a05:690c:102:b0:867:ae30:4ea8 with SMTP id 00721157ae682-867ae307bcamr12393917b3.34.1788188414813;
        Mon, 31 Aug 2026 08:00:14 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:f6fc:b424:b1bb:6ff0])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e58666e15sm53903827b3.0.2026.08.31.08.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:00:13 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	kpsingh@kernel.org,
	paul@paul-moore.com,
	mic@digikod.net,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	kees@kernel.org
Cc: gnoack@google.com,
	jack@suse.cz,
	song@kernel.org,
	yonghong.song@linux.dev,
	martin.lau@linux.dev,
	m@maowtm.org,
	bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH v2 07/15] lsm: Add the bpf_lsm_policy_apply_bprm kfunc
Date: Mon, 31 Aug 2026 10:58:49 -0400
Message-ID: <20260831145858.3869191-8-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831145858.3869191-1-utilityemal77@gmail.com>
References: <20260831145858.3869191-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the kfunc applying a policy object to an execution:

  bpf_lsm_policy_apply_bprm(object, bprm, flags)        KF_SLEEPABLE

It asks the LSM owning @object, through the bprm_apply_policy_object
hook, to restrict the credentials prepared in @bprm, so that the
executed task starts confined by the policy.  The meaning of @flags
and the composition with restrictions the credentials already carry
are the owning LSM's; an LSM without execution policy support makes
the call fail with -EOPNOTSUPP.

The kfunc runs the hook in a root memcg charging scope: the policy
restricts the execution on behalf of the BPF program, not of the
mediated task, so what the owning LSM allocates to compute it, e.g.
Landlock's merged domain, is not charged to the task the program
supervises.

The filter makes the kfunc exclusive to the sleepable LSM programs
attached to the bprm_creds_for_exec() or bprm_creds_from_file()
hooks, the only contexts where the bprm's credentials are prepared
but not yet committed.

Cc: Paul Moore <paul@paul-moore.com>
Cc: KP Singh <kpsingh@kernel.org>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 security/bpf_lsm_kfuncs.c | 72 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/security/bpf_lsm_kfuncs.c b/security/bpf_lsm_kfuncs.c
index 43a4bf57fd31..743752b5852e 100644
--- a/security/bpf_lsm_kfuncs.c
+++ b/security/bpf_lsm_kfuncs.c
@@ -2,16 +2,25 @@
 
 /* BPF kfuncs exposing LSM policy objects. */
 
+#include <linux/binfmts.h>
 #include <linux/bpf.h>
 #include <linux/btf.h>
 #include <linux/btf_ids.h>
 #include <linux/cfi.h>
 #include <linux/init.h>
 #include <linux/lsm_hooks.h>
+#include <linux/memcontrol.h>
+#include <linux/sched/mm.h>
 #include <linux/security.h>
 
 #include "lsm.h"
 
+/* The sleepable LSM hooks bpf_lsm_policy_apply_bprm() may be called from. */
+BTF_SET_START(bpf_lsm_policy_bprm_hooks)
+BTF_ID(func, bpf_lsm_bprm_creds_for_exec)
+BTF_ID(func, bpf_lsm_bprm_creds_from_file)
+BTF_SET_END(bpf_lsm_policy_bprm_hooks)
+
 __bpf_kfunc_start_defs();
 
 /**
@@ -44,6 +53,49 @@ bpf_lsm_policy_acquire(struct lsm_policy_object *object)
 	return NULL;
 }
 
+/**
+ * bpf_lsm_policy_apply_bprm - Apply a policy object to exec credentials
+ * @object: policy object to apply
+ * @bprm: execution context providing the prepared credentials to
+ *        restrict
+ * @flags: flags defined by the LSM owning @object
+ *
+ * Ask the LSM owning @object to restrict the credentials prepared in
+ * @bprm with it, so that the executed task starts confined by the
+ * policy.  How the policy composes with restrictions the credentials
+ * already carry, and the meaning of @flags, are defined by the owning
+ * LSM.  @object is only borrowed: the caller keeps its reference.
+ * The hook runs in a root memcg charging scope: policy the LSM
+ * computes on behalf of the program is not charged to the mediated
+ * task.
+ *
+ * Return: 0 on success, -EOPNOTSUPP if the LSM owning @object does
+ * not support applying policy to an execution, -EINVAL on unsupported
+ * @flags, other negative values on LSM-specific failures.
+ */
+__bpf_kfunc int bpf_lsm_policy_apply_bprm(struct lsm_policy_object *object,
+					  struct linux_binprm *bprm, u32 flags)
+{
+	struct lsm_static_call *scall;
+	struct mem_cgroup *old_memcg;
+	int err;
+
+	lsm_for_each_hook(scall, bprm_apply_policy_object) {
+		if (scall->hl->lsmid->id != object->lsmid)
+			continue;
+		/*
+		 * The hook runs on behalf of the BPF program, not of the
+		 * mediated task: charge its allocations to the root memcg.
+		 */
+		old_memcg = set_active_memcg(root_mem_cgroup);
+		err = scall->hl->hook.bprm_apply_policy_object(bprm, object,
+							       flags);
+		set_active_memcg(old_memcg);
+		return err;
+	}
+	return -EOPNOTSUPP;
+}
+
 /**
  * bpf_lsm_policy_from_fd - Get an LSM policy object from a fd
  * @fd: file descriptor referring to a policy object, resolved in the
@@ -115,6 +167,7 @@ __bpf_kfunc_end_defs();
 
 BTF_KFUNCS_START(bpf_lsm_policy_kfunc_ids)
 BTF_ID_FLAGS(func, bpf_lsm_policy_acquire, KF_ACQUIRE | KF_RCU | KF_RET_NULL)
+BTF_ID_FLAGS(func, bpf_lsm_policy_apply_bprm, KF_SLEEPABLE)
 BTF_ID_FLAGS(func, bpf_lsm_policy_from_fd,
 	     KF_ACQUIRE | KF_RET_NULL | KF_SLEEPABLE)
 BTF_ID_FLAGS(func, bpf_lsm_policy_release, KF_RELEASE)
@@ -124,6 +177,8 @@ BTF_ID_LIST(bpf_lsm_policy_dtor_ids)
 BTF_ID(struct, lsm_policy_object)
 BTF_ID(func, bpf_lsm_policy_release_dtor)
 
+BTF_ID_LIST_SINGLE(bpf_lsm_policy_apply_bprm_ids, func,
+		   bpf_lsm_policy_apply_bprm)
 BTF_ID_LIST_SINGLE(bpf_lsm_policy_from_fd_ids, func, bpf_lsm_policy_from_fd)
 
 /*
@@ -132,6 +187,8 @@ BTF_ID_LIST_SINGLE(bpf_lsm_policy_from_fd_ids, func, bpf_lsm_policy_from_fd)
  * kfuncs requires a filter.  A policy object fd is only meaningful in
  * the fd table of the task that set the object up: the fd kfunc is
  * exclusive to syscall programs, which run in that task's context.
+ * Applying policy to an execution is exclusive to the sleepable bprm
+ * LSM hooks the operation is specified for.
  */
 static int bpf_lsm_policy_kfunc_filter(const struct bpf_prog *prog,
 				       u32 kfunc_id)
@@ -141,11 +198,26 @@ static int bpf_lsm_policy_kfunc_filter(const struct bpf_prog *prog,
 
 	switch (prog->type) {
 	case BPF_PROG_TYPE_SYSCALL:
+		if (kfunc_id == bpf_lsm_policy_apply_bprm_ids[0])
+			return -EACCES;
 		return 0;
 	case BPF_PROG_TYPE_LSM:
 		if (kfunc_id == bpf_lsm_policy_from_fd_ids[0])
 			return -EACCES;
 
+		if (kfunc_id == bpf_lsm_policy_apply_bprm_ids[0]) {
+			/*
+			 * BPF_LSM_CGROUP programs run under classic
+			 * RCU and cannot sleep.
+			 */
+			if (prog->expected_attach_type == BPF_LSM_CGROUP)
+				return -EACCES;
+
+			if (!btf_id_set_contains(&bpf_lsm_policy_bprm_hooks,
+						 prog->aux->attach_btf_id))
+				return -EACCES;
+		}
+
 		return 0;
 	default:
 		return -EACCES;
-- 
2.55.0

