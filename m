Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7273C585E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982679; cv=none; b=jPZXYndSiqcXE2kVgqdg8sj9WOdDYzVJA0z/MNIiM5BKunXVOEx4ZNPAJP6g8mRpubgsevXciOWZ4qVhnEEGeF0f7X/U9o7r/MqlqnBpXyW6/7m+zUGFJ/1NCdGbwpZsitDI9e5X9+J+4ErtoWjUjuRenmGQxDWzXQWNfUdpUAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982679; c=relaxed/simple;
	bh=/dxijAUwePg6/FhEMbyE1waXEgJ1mB/8UILjJnXwrrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=REWBwyK1Y5tMyWPtTI38t8unq84MEUHcH7nh5gu1U5z9zaTzj8p3NHKIce3LE5HS6+WaHR3KIkVWRL/MiYdd5LyBVXltk0JKbmAcHVLWwW7OV4bC0mb83GRiTtSe9blQ+QCwFQwx+mNw76fxDTZiogJTY5BIQkRM81oOobLIjwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r+IHGWER; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r+IHGWER"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-87f4e914a45so22212497b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982676; x=1789587476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B0X6CzMR8wIDenHZSYS+S86AsXPtgp2BAuIVL5oI510=;
        b=r+IHGWERI82Em0oYYhWNrktbDSRcbZ3tTYrvh5ZXtVWGP5E8N7oNzwzGhsx6FhdgXo
         7aeFrjoFQSptKmDgvRZ6kyZUq6DjCEFjpe+s7wXHGSt8teduQMt3XLDgM9tFnA6IhGbD
         pAg6HuIwADPLgF6le9JwKhBINTingozwaTs56WrSvgr+LcHRNRHSbgVwz/R+dyfH3ViD
         e+kc5Y7Di7UreSGAvRcYMGBlTLTA3uaPym8Vf3FudhMxAb752r9Hdz7yTn2GJHDEOuiz
         zu4UatWH2x4p19iDCd+Ymkz7ZKOa+uRAKCDZo+JbjuDe/cKGPxjxTGn4GnaOUvNnEb13
         sNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982676; x=1789587476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B0X6CzMR8wIDenHZSYS+S86AsXPtgp2BAuIVL5oI510=;
        b=nSpP5IAyw8thRwN8dz7Fw6Pdbs5v+e70+wMo/pBR0TUFOhWmsJXWKP+g6ZPOPbTmoH
         z+g0l0WTZEyyi9SNm5JG/rNkxDg/POfBJE3H/gJL1lGsJNGk6K8TyIwkU5y0RCq/bZ1N
         6flOEgZNYs8yedudkqu5iBDcTid+7B3tV6H5i/bd4rci7VU6RWGaIU3aGDNlfCfmFuqc
         SzdC8/QwmVwq3YBSNfjlQi3UXkMf2myFuNBLqsbQWv0XzbDVHXTIz4dK/0r56/z/ukNN
         RcpGtA9PVhykfpgiA6A/TvbW42PNLcBbKa3BVY1tvaf/aNPcTjfxt7iqOcADhT2W/0JW
         XJ/g==
X-Forwarded-Encrypted: i=1; AKwUvBwHa8lpDEZZSANZPBC+H1XA4xrmfBsbR7eQYTPC4eS8nM9aShSRXNX2NmzWKw9+mH9lE3yWCKsfmE/X5VY=@vger.kernel.org
X-Gm-Message-State: AFuF++l692S8GAV0cEvr/MqRsqBJ4hq3DA9EUXEub4dRpCvlqyEh79hd
	RLEu47a1Otbv/h2jz0LcdqzwxEc8pmJF+J2XvrzRil4M660O6E6D+Srw
X-Gm-Gg: AYBFou3pQ6tLwK5K+QWqLEMAr1bHT56bOz9Lxv+Q7uT+vJw/FJCU2tkstkjgsjcvvgV
	bGQqS4l5uhplNJ35+/aHEcjUKy1xVLlsnoDMBSRskA7EFyYcb5gE43ZRd3ilMG3q7Wyl9R86luV
	bbIoBt5u/08ZePc1ZjOwYePWQTjXnvwIIt/iMB5KVZlFcv/o93BfMXPnYR4gRzIPrNHbhq35hg0
	jsoBE7rthHV5kZr4FCX8BcN3xd5Ts0ltPHyEXqATN4gTTIfpQy6gBvd8jEjz38Vao2sFYxFXx1H
	RGd9uv4/SwS1pCFYlKAOF42IuW/vbB+c4aOaAvtqWizuCa8cWmtI3dVst4qyedBu++XDmVqmVDx
	JRP7rZKA19aMnBDmGjz5eXVNFFOrBrpaxzaTgfuOLdWGXQ1grH9cm6XHLHNQeHp7v1cPsF7vv3h
	RbCatT7V3zLIg+kFmfBqcuBjE/5pqPgbl11PPOePcn5OJ1cdFuhvuycBST1mA/RD9qxAbGl2jfl
	icYry5H0Zvi26B+WF3ivnFK/9p9qc89
X-Received: by 2002:a05:690c:e254:10b0:873:5ddf:d869 with SMTP id 00721157ae682-8735ddfdaaamr92262297b3.52.1788982676015;
        Wed, 09 Sep 2026 12:37:56 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:bae:bfc2:7e96:e5c8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-871493155d3sm115277577b3.16.2026.09.09.12.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:37:55 -0700 (PDT)
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
Subject: [PATCH bpf-next v3 05/15] lsm: Add the bpf_lsm_policy_from_fd kfunc
Date: Wed,  9 Sep 2026 15:37:08 -0400
Message-ID: <20260909193719.518517-6-utilityemal77@gmail.com>
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

Add the kfunc translating a file descriptor into a referenced policy
object:

  bpf_lsm_policy_from_fd(fd, flags)
      KF_ACQUIRE|KF_RET_NULL|KF_SLEEPABLE

No argument names an LSM: a policy object fd refers to a file set up
through the owning LSM's own userspace interface so the fd itself
identifies the LSM asked to translate it.  The kfunc offers the fd to
every policy_object_from_fd implementation in turn until one claims it.

Following the convention of the lsm_*(2) syscalls, @flags belongs to
the framework and is reserved: the kfunc returns NULL for @flags != 0.

A policy object fd is only meaningful in the fd table of the process
that set the object up, while an LSM program runs in the context of
the task it mediates, so the filter makes this kfunc exclusive to
syscall programs (BPF_PROG_TYPE_SYSCALL), which run in the context of
the task invoking them.  The acquired object may be released with
bpf_lsm_policy_release().

Cc: Paul Moore <paul@paul-moore.com>
Cc: KP Singh <kpsingh@kernel.org>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---

Notes:
    v2->v3:
        - No change.

 security/bpf_lsm_kfuncs.c | 53 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/security/bpf_lsm_kfuncs.c b/security/bpf_lsm_kfuncs.c
index e1190215d477..988dcd6f4dd9 100644
--- a/security/bpf_lsm_kfuncs.c
+++ b/security/bpf_lsm_kfuncs.c
@@ -14,11 +14,50 @@
 
 __bpf_kfunc_start_defs();
 
+/**
+ * bpf_lsm_policy_from_fd - Get an LSM policy object from a fd
+ * @fd: file descriptor referring to a policy object, resolved in the
+ *      file descriptor table of the task running the program
+ * @flags: reserved for future use, must be 0
+ *
+ * Translate @fd, as set up through the owning LSM's own userspace
+ * interface, into a referenced policy object.  The fd identifies the
+ * LSM asked to translate it: each LSM recognizes its own fds and
+ * declines every other.  Only syscall programs may call this kfunc:
+ * they run in the context of the task invoking them, where the fd is
+ * meaningful.  The reference must be released with
+ * bpf_lsm_policy_release().
+ *
+ * Return: A referenced policy object, or NULL if @flags is not 0, if
+ * no enabled LSM recognizes @fd as one of its policy objects, or if
+ * the recognizing LSM fails to translate it.
+ */
+__bpf_kfunc struct lsm_policy_object *bpf_lsm_policy_from_fd(int fd, u32 flags)
+{
+	struct lsm_static_call *scall;
+	struct lsm_policy_object *object;
+	int err;
+
+	if (flags)
+		return NULL;
+
+	lsm_for_each_hook(scall, policy_object_from_fd) {
+		err = scall->hl->hook.policy_object_from_fd(fd, &object);
+		if (err == -EOPNOTSUPP)
+			/* Not this LSM's fd: let another claim it. */
+			continue;
+		if (err)
+			return NULL;
+		return object;
+	}
+	return NULL;
+}
+
 /**
  * bpf_lsm_policy_release - Release a policy object reference
  * @object: policy object to release
  *
- * Release an acquired reference on a policy object.
+ * Release a reference acquired with bpf_lsm_policy_from_fd().
  */
 __bpf_kfunc void bpf_lsm_policy_release(struct lsm_policy_object *object)
 {
@@ -44,6 +83,8 @@ CFI_NOSEAL(bpf_lsm_policy_release_dtor);
 __bpf_kfunc_end_defs();
 
 BTF_KFUNCS_START(bpf_lsm_policy_kfunc_ids)
+BTF_ID_FLAGS(func, bpf_lsm_policy_from_fd,
+	     KF_ACQUIRE | KF_RET_NULL | KF_SLEEPABLE)
 BTF_ID_FLAGS(func, bpf_lsm_policy_release, KF_RELEASE)
 BTF_KFUNCS_END(bpf_lsm_policy_kfunc_ids)
 
@@ -51,10 +92,14 @@ BTF_ID_LIST(bpf_lsm_policy_dtor_ids)
 BTF_ID(struct, lsm_policy_object)
 BTF_ID(func, bpf_lsm_policy_release_dtor)
 
+BTF_ID_LIST_SINGLE(bpf_lsm_policy_from_fd_ids, func, bpf_lsm_policy_from_fd)
+
 /*
  * BPF_PROG_TYPE_LSM and BPF_PROG_TYPE_SYSCALL share their kfunc
  * lookup buckets with other program types, so restricting the policy
- * kfuncs requires a filter.
+ * kfuncs requires a filter.  A policy object fd is only meaningful in
+ * the fd table of the task that set the object up: the fd kfunc is
+ * exclusive to syscall programs, which run in that task's context.
  */
 static int bpf_lsm_policy_kfunc_filter(const struct bpf_prog *prog,
 				       u32 kfunc_id)
@@ -64,7 +109,11 @@ static int bpf_lsm_policy_kfunc_filter(const struct bpf_prog *prog,
 
 	switch (prog->type) {
 	case BPF_PROG_TYPE_SYSCALL:
+		return 0;
 	case BPF_PROG_TYPE_LSM:
+		if (kfunc_id == bpf_lsm_policy_from_fd_ids[0])
+			return -EACCES;
+
 		return 0;
 	default:
 		return -EACCES;
-- 
2.55.0

