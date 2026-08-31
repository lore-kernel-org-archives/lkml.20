Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6346D4FB9B5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188412; cv=none; b=h8+w3vELKR+jASA5jYBfUPR0J/wRcKEhNzIs2I3/FKCXsk/qz5A8F7H0KDl6zZgz3kp1oQVWWI4h5YnEe7LTTDFpFZk0H+MGOmh4Qot81b+7QdjUWlyUpCC+LRTcgycVsJIDTGYMZ4TqNNKbeYuD5zFhLrSLRdC5JHRJ+mFuzqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188412; c=relaxed/simple;
	bh=ZSuaHxdeSmdK1XVdgW9I78FY4WiLUsxPZgAk1jSE970=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WjQ4A9azTZ7x4a/pIfmzHRwJ5SU9nQr9XAWWF3zyqkMl9VQg/vomwZ0wwNVM2ifApNToFZiXpvJBJVvV67nH9fGpxu52zIqvLfNxczrzdID3rJgGczCHO0lpf1UPf8ZsL40fAw99eETK+DGh5NVuHgD94Xq7ds4ZMD8hto0fEnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2/Vm0nU; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2/Vm0nU"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8664769db58so10149467b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788188409; x=1788793209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xKtb+s5mvwWHR2Dm56oQU87T2PX0PUH0OEkGW4x95GI=;
        b=Y2/Vm0nUmzXzhAQjDw/2Y5pc/FwY5dIj308vVT12yAbmD6fVCV68CiTqI/nRoKK+to
         fhf7XtN5CWyG/ydMSnekty57XGpqqI8mDNg+OMiJarRYCjocUGVwFypCNmj96Q3PZjuf
         mPZ7yqpuqyPWnTfzje3Q2SjPE3qM0Mbq+wT8XfEXr4d3mnVWgt9UIlcyOQcJgrD9yWpu
         1LbqAdnvzdIWd5x7BiesnOp/b6SWJWrEbLMaHLryZ7VczXWEIRBpfcWd0fDWNCaDRfjx
         1SvaajZ5iaOmCXDr+DHbtTpm3RQxW7pY7QMMMeAuWMGdHbavFNsE+hAugDlJ0apH2uQB
         Vs/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188409; x=1788793209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xKtb+s5mvwWHR2Dm56oQU87T2PX0PUH0OEkGW4x95GI=;
        b=NTWTXw66m8ZSIeWTyOUmXEPeQVycnjtnrYOf+T2PR8JROcvCsKjUZl7UfPDUOTi/OV
         xtL6Uy8jHiAAFZR34WTJZGDsQXnR9urIDe/T/LMuxujsSRu8ICl4EJOGszY2KP8hu4Mz
         EQjtgBOBTh8OEAyEi57WZ3GxYjvQEGAt/G9pnDFz5mmpootwGgq941Jb6JsacZQYGUy/
         +1j/HqAizvQgzwXlh96BN7GCMjkN6jWR0PMA+t5PmW+8jhtfqnUMND5D6UfosO3FVLtd
         MaMEvSqXiTfp7TASa4jYji8KkR1rdmVFlWvhd2lzYZcMHy3aloDOdCdmu8us6ZUVqS5C
         2mww==
X-Forwarded-Encrypted: i=1; AKwUvBy5o1HgPtsDKP/o+C6povRGYb6e9V0jlWANOorsrDvGGYnEHu43jIWtZC8ZeGuGUYZqcGtjHmgv6/+WsaI=@vger.kernel.org
X-Gm-Message-State: AFuF++kjsIcZ/Uu6Qv/AY2HykKkdE7MrA4/yLEvaIe6ByGrqrXk2cF7K
	msWgj/UHYHp1X3HE5vxW8+aMXu+YQoaqew2YRCKstxHpDNOYFj5UmlGr
X-Gm-Gg: AYBFou3/Wt9yUGBan1pMWCD+ScV5vYT8owGe21IZD/0xkiBOPKfBJvynXrPBKAoogqw
	fFnY2aKhPEwUsubP++j4z60TypzUuRmRudLCOwrtFAGH7yhfq5iuhkj8cD4x+rdLjZoXXNSeIe7
	7Ij+vKlJF8+Pbdcs7znLiGgiUQF/lSxOKjI2W3j9X6n73DvcUXgFJI4rMpegLkg/ix3lJTB0hx6
	wHjeRQve8DB1Uw/n9VjRVKPDA7St0JC0vhSz0bsHxgCGgOuQ18LtNEZbMQI+sV3yU5oPkUkQ008
	hrideVHyirFjXfEN/mrwBje7ZM80KW/fMrvf8iyGVBpTzDvjfVmXrBn+Itj39pUo/YLXEztTE2z
	b3x9+OG+FBQUQdx/osbHlLcqqiEK11t98dN/rxlSNHTlsMLZ4OxXBmBGZ+9mB3f1jy3hG0/dUO5
	qyVz/+PUczVI2LIFeU4qORHarXpKFJjymVLb3Yuk/LS45gJ4BjDI9BHs1cCQZ1LoY3D0yWLHaaz
	SCBZ6ulzrS4gniZN/qhdtg=
X-Received: by 2002:a05:690c:c6c5:b0:85c:79d2:91a4 with SMTP id 00721157ae682-85d6b275eacmr80105927b3.17.1788188408827;
        Mon, 31 Aug 2026 08:00:08 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:f6fc:b424:b1bb:6ff0])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e58666e15sm53903827b3.0.2026.08.31.08.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:00:08 -0700 (PDT)
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
Subject: [PATCH v2 06/15] lsm: Add the bpf_lsm_policy_acquire kfunc
Date: Mon, 31 Aug 2026 10:58:48 -0400
Message-ID: <20260831145858.3869191-7-utilityemal77@gmail.com>
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
 kernel/bpf/verifier.c     |  3 +++
 security/bpf_lsm_kfuncs.c | 34 +++++++++++++++++++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 7aa47342dc65..ba9972c572e1 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -4394,6 +4394,9 @@ BTF_ID(struct, task_struct)
 #ifdef CONFIG_CRYPTO
 BTF_ID(struct, bpf_crypto_ctx)
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

