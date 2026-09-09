Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1C03BFE33
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982683; cv=none; b=PFSXYOUaaSmdLlRKuL2vEvGoOdKZ7hVc02JzNqtBIKYebhEhpDRJkz02mHAktoivBJWViEgbPLzlzdAMBPbgZD6lb8ePdIr2CGlYlfn/dsHS3Tshzrs+wkABLUIvxT95Ydv3j/tJCfPeIbisr7mHMvi6bcNjzuf/pJ0oJvbDjF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982683; c=relaxed/simple;
	bh=BExP6Uc0CAqt4PblTM1vCa+4tjOKYHzmWABKQ8gVc50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VjuVr/oH6vzpLTTAyPkeXBTYakFdRBa2Awg1q4k4XqJ1bcgsXBOkWuSDpAKlxnKTz7ItaNUdJSfySkv7bzdQbBXe3TlUPaPUijorlTOSIj8T7yfJt7nuL1N1qaYIhh66vcJkGXdudMLB/4rDYtQZpsSHz3OtH3te924eUfQwxQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/y+X3/K; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/y+X3/K"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-836c4474028so63217967b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982680; x=1789587480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/JJ/f47awfp4tzzCzgVlCBrXa77/+V7TaH/K3Hj08jM=;
        b=J/y+X3/KmzNOU4d4WZpf8v544xqstJlaUVOln4L+uebNmOzQSjR7d+B42fPeobQK/k
         V9hS26KQXcB57idq/0UlZ1wgHlUAgoeaUeqSDpOnDSzHU8anhI2GY8QWfRBk6YFXVCjT
         fMZJDodD6a+qe0sjUFsM3NclNZPeKShCDlfJNvYxZYGlCNt5etRDneZqyfjEgJA/Mnjs
         mi3BZy5Afqnw+NM/LrqDqhsRz0+8E5ygi6L842av6nSVD0+GJ3uZiDvjDH3z4fJSK0tl
         w30EJkF13YUzi9CkfTn/25mqr0zE0YO9U5rQ4JlwoCoCExJX9s1M3FN7/hVVBS8eGgY8
         Ncqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982680; x=1789587480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/JJ/f47awfp4tzzCzgVlCBrXa77/+V7TaH/K3Hj08jM=;
        b=fRx87sDP+83D4LMQta+Sc6bVkWMxH7xIAVdAn1WY0HtsoqujNLTpRbKeNTO/GhWjZF
         /GXr/uS69UWXw1LIiu0L6GaIV/GqZKhvDJztkEiAJ5Ckk6m2CkK9b7sNLmiDbd6UPIUg
         LYPF6kZVncCNznKxgL/wZHURfB+E+I3fY0ta8s+jt8BdH2SmwiXL62UWlXICyLNCP/pB
         C6WQv603rY401lQRNG6AhPgnBHAyqhrCLfJ7a3zPC2XqSEYP10CYz5X5BlESeJIahFWK
         wtuJXUlmq3t1E5O1O/AdpwgGfF+R0gRntmRgROGxtG+V8hrV+2JKQwJG8+MbNYCkssUr
         znVw==
X-Forwarded-Encrypted: i=1; AKwUvByVfvtvLjqPerJhcT5W2GyJk4YsKRmIdC5bx1zjt9U5I5ARQHwAOCZAJdiGWbWYsP6FAqO4tFZpDUJztGk=@vger.kernel.org
X-Gm-Message-State: AFuF++n1JuzmPJHjaDj+mjvdz6Lz2kJpnieP52hXeHXFeYI4Xs6aX8Um
	ZTxJCykNqygJhqzGG1YVUVykTaf6/3jKijGwPVTWSugrXvLIh9iKBOfX
X-Gm-Gg: AYBFou0v39PKRe7H+E+HM0qMzz6NQazOgYtcoXhis+LKOil0x1+SmXVvvKb7U9GxK/Q
	JR5Yn9ai87vTS4RCgf4pM352Puz+aSrgprOyYlIUTuopoYTOPYUUZ3i0GjJG9OYYLMsrUmjeUIJ
	HOuUCCinj01qA6IltkRzf5fkfKVhUThZT2MJ0pAsmXWf7bNoNA3IPGw1n7/hxE0EAF3GoGKfxd+
	1ZmyNxLedc2wSp1Q7f+c4Qs2MX20LPz5F2xU1OLXQAoekh7iNAn9Qq2Dd/R8kiZHbiw0LQMUW5d
	1E/2DkMFRuLWsw+yjIv26H5qm+PT+PQ6r/44HWKO7QbxH9dNAINbvXiAud863ggjHNTv5wSM/NX
	UAYwnSSMIGtyW68jD9cm7y0dn0R9E8rseADfKyxu/Ba59rMgQdeAqx9r9kKS5cybZgKea7W26f2
	+km41A58zej61T7FgwNfZyETNEnrVBYLDgXdtKpl9+v5hqR1P4PzcDrqXLSQRgQrz7jyQ8n5Of3
	3n7OuCg/05nOh6NqxlXUr6ZBf/lBQRO
X-Received: by 2002:a05:690c:e3c1:b0:86f:c1db:14c7 with SMTP id 00721157ae682-8712259664fmr133356567b3.7.1788982680038;
        Wed, 09 Sep 2026 12:38:00 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:bae:bfc2:7e96:e5c8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-871493155d3sm115277577b3.16.2026.09.09.12.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:37:59 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	kpsingh@kernel.org,
	matt@bobrowski.net,
	paul@paul-moore.com,
	mic@digikod.net,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	kees@kernel.org
Cc: casey@schaufler-ca.com,
	gnoack@google.com,
	jack@suse.cz,
	song@kernel.org,
	yonghong.song@linux.dev,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	jolsa@kernel.org,
	m@maowtm.org,
	bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH bpf-next v3 06/15] lsm: Add the bpf_lsm_policy_acquire kfunc
Date: Wed,  9 Sep 2026 15:37:09 -0400
Message-ID: <20260909193719.518517-7-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909193719.518517-1-utilityemal77@gmail.com>
References: <20260909193719.518517-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the kfunc acquiring a reference on a policy object the program
does not own:

  bpf_lsm_policy_acquire(object)        KF_ACQUIRE|KF_RCU|KF_RET_NULL

bpf_kptr_xchg() is the only way to take an owned pointer out of a map
kptr field, and it empties the slot: concurrent executions of an
enforcement program would race for the one stored reference.  Modeled
after bpf_task_acquire(), this kfunc removes the exclusivity: a
program loads the kptr field with a plain read under
bpf_rcu_read_lock(), acquires its own reference through the
policy_object_get hook, and leaves the map slot untouched.  The
acquired reference survives bpf_rcu_read_unlock(), carrying over to a
sleepable bpf_lsm_policy_apply_bprm() call, and is released with
bpf_lsm_policy_release().

Adding struct lsm_policy_object to the verifier's rcu_protected_types
set makes the plain load yield an RCU-protected pointer instead of an
untrusted one.  This is where the policy object contract's RCU
requirements become load-bearing: the kfunc and the get hook examine
the object concurrently with a possible last put, which is safe
because implementations free only after an RCU grace period and
acquire with inc-not-zero semantics.  A failed get makes the kfunc
return NULL, per KF_RET_NULL.

The kfunc does not sleep and is meaningful wherever a policy object
pointer can be loaded, so the filter adds no per-kfunc rule.

Cc: Paul Moore <paul@paul-moore.com>
Cc: KP Singh <kpsingh@kernel.org>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---

Notes:
    v2->v3:
        - No change.

 kernel/bpf/verifier.c     |  3 +++
 security/bpf_lsm_kfuncs.c | 34 +++++++++++++++++++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 9e79750e2480..d1af0090d38f 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -4660,6 +4660,9 @@ BTF_ID(struct, bpf_crypto_ctx)
 #ifdef CONFIG_INET
 BTF_ID(struct, bpf_ksock)
 #endif
+#ifdef CONFIG_BPF_LSM
+BTF_ID(struct, lsm_policy_object)
+#endif
 BTF_SET_END(rcu_protected_types)
 
 static bool rcu_protected_object(const struct btf *btf, u32 btf_id)
diff --git a/security/bpf_lsm_kfuncs.c b/security/bpf_lsm_kfuncs.c
index 988dcd6f4dd9..43a4bf57fd31 100644
--- a/security/bpf_lsm_kfuncs.c
+++ b/security/bpf_lsm_kfuncs.c
@@ -14,6 +14,36 @@
 
 __bpf_kfunc_start_defs();
 
+/**
+ * bpf_lsm_policy_acquire - Acquire a reference on a shared policy object
+ * @object: RCU-protected pointer to a policy object, e.g. loaded from
+ *          a map kptr field under bpf_rcu_read_lock()
+ *
+ * Acquire a reference of its own on a policy object the program does
+ * not own, so that any number of concurrent program executions can
+ * use the object shared through one map kptr field, without emptying
+ * it as bpf_kptr_xchg() would.  The returned reference stays valid
+ * after bpf_rcu_read_unlock() and must be released with
+ * bpf_lsm_policy_release().
+ *
+ * Return: A referenced policy object, or NULL if the object's
+ * reference count concurrently dropped to zero.
+ */
+__bpf_kfunc struct lsm_policy_object *
+bpf_lsm_policy_acquire(struct lsm_policy_object *object)
+{
+	struct lsm_static_call *scall;
+
+	lsm_for_each_hook(scall, policy_object_get) {
+		if (scall->hl->lsmid->id != object->lsmid)
+			continue;
+		if (scall->hl->hook.policy_object_get(object))
+			return NULL;
+		return object;
+	}
+	return NULL;
+}
+
 /**
  * bpf_lsm_policy_from_fd - Get an LSM policy object from a fd
  * @fd: file descriptor referring to a policy object, resolved in the
@@ -57,7 +87,8 @@ __bpf_kfunc struct lsm_policy_object *bpf_lsm_policy_from_fd(int fd, u32 flags)
  * bpf_lsm_policy_release - Release a policy object reference
  * @object: policy object to release
  *
- * Release a reference acquired with bpf_lsm_policy_from_fd().
+ * Release a reference acquired with bpf_lsm_policy_from_fd() or
+ * bpf_lsm_policy_acquire().
  */
 __bpf_kfunc void bpf_lsm_policy_release(struct lsm_policy_object *object)
 {
@@ -83,6 +114,7 @@ CFI_NOSEAL(bpf_lsm_policy_release_dtor);
 __bpf_kfunc_end_defs();
 
 BTF_KFUNCS_START(bpf_lsm_policy_kfunc_ids)
+BTF_ID_FLAGS(func, bpf_lsm_policy_acquire, KF_ACQUIRE | KF_RCU | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_lsm_policy_from_fd,
 	     KF_ACQUIRE | KF_RET_NULL | KF_SLEEPABLE)
 BTF_ID_FLAGS(func, bpf_lsm_policy_release, KF_RELEASE)
-- 
2.55.0

