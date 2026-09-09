Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9923C0621
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982668; cv=none; b=AeFqPBsnKhjcyLoYW+v7xXOb2ImULohC1PPBtCzlsefKk1YjzpJZ3WPobZ9RJeY3vPtcM1aYcZwHkCLmlz4FnST6iTtzgBuYiSrkx+X5njo0dliUJXqpTuPeTgBhzA9W1ven0nlYCAC7io7UkqJwPqkLW0gSIqKYSKT7YwzFxiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982668; c=relaxed/simple;
	bh=UJsvgSwI/yDoGvCnBHSm45ONH9EJW/+m6j0M3SFXO1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ffHkZVPxcaHMzaGXyzwRl88PGsarpbxyxQFO/Hsn1niP/4BrvoeW8vAJfXzM3pRUnGcN9p622FNK4jVgi2KbEBsUoXLAeqRTlutq2H/0zJTaP7WitRi3XAL/rRvAKrnNZTBigK8qrVRukAMwTdonLNC3wUJr+15+JmvDbacIgss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgN+MOSs; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgN+MOSs"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-87005a0e052so77760177b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982665; x=1789587465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDAYkmuiKuVgFzeoHlRDXquGRrGJTz+CZkotRusPofE=;
        b=HgN+MOSsbIV2uR0LhkUrMnE8a6nVaExxLy+8dJ+C0zLGgJQyqIMymSImp/nz7obWlD
         Ev7OrSq34nxtrYl5/aQCGVPugb33ERiQ3K2SrgIHOkcs0mSC/ojZwJpueNevlTTW1dHr
         bfO4rFX3sQn6Hw7mPURe0UV6jY1lC45B6bEJuwTSBySeNrUIqLw4hAsG4hSZTRNWx1VX
         B6WoQ1khM3P9xDisOTmtApbekwjwHdmGzTi+qplWuClXLsuPsQvI9OwBo6ntEUWY6eoA
         7WTfyRsVLJD5RoJKtwZ3Pv5bWQ029eEDC474LEfcGw+OVzmfqgXvGojoY89iwPPfIWz2
         clWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982665; x=1789587465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bDAYkmuiKuVgFzeoHlRDXquGRrGJTz+CZkotRusPofE=;
        b=qrPgbs6W/XWWt0BLDNFnD4J2K3P6JJiDDc/YIq/okcfqFM9w6/fSoaefklH+xzGt5O
         aq9tEJ42u7ADp/V3nIo0ryMwNPIMQWpkfk5Wip/ghPhRAE0HFIik57pd4vgJXE8i3aRi
         rmCVQLkyUmyPkvHK3YbjG+f5YGmPG9xaRH3Em5zf6djFB8X4lVYTWioBE3lPR7qUsjSg
         pvibpoKYwwqbjcmssr2cX8tj12j1ZL+Ak2QrrSEA0I/Et7KfI9JDmnb350sLPvFNNxu7
         RzzTxiMWfj6dTdUyuwNUAq7vRNdijq37IF02S0nAWutE1lfKBNAByUdGgiDxwEFdFcSa
         gapA==
X-Forwarded-Encrypted: i=1; AKwUvBxmx+tHmJFkRIF7kfIV35QEvk+L2n6uMOTD99gtUG5hmmdk/uWiL2EcjWeLPoaZBmq5rjpLNQRJNoATZXY=@vger.kernel.org
X-Gm-Message-State: AFuF++lWePmPRxqvhtO6eH/bVE9a1uOWQwSURkMpZFth/WaR5ZFXpiaW
	LxYJTnrgVCJWvdc2S7+c+abt+rEYUhagvTGua9cH254PrsSoPdtH0Fbz
X-Gm-Gg: AYBFou2A2T+npenXS6AnTe3IS5mACxvPc+o5tBiV23953TTSB3n54tKplhYqKwSAmur
	gjVLiDPeazGpG0LkCC8xRbFPueoUOsLhzW9ktbHefvWDGEU8YEBaHdIH2skod4u6DBhXXavRqfO
	V7K9hqML7fiIpIZxAW68lY8opokl6c+mNFwjzRrPm5YsgliIyUpGgDioVWEltYgHl+rYYcmv+Lp
	6s6+CEjJgMlgRdIpS5L1eONKFHBivEpjZm8bBLCe5DPbUdNFiOLr87dggnnt8pURxVylI8LAhgB
	HTfyuxRxxFgRa3mMcPUlqd92lY69uLAsF1hjh3CY6BDectET2fRAjN40Zt3uN1B8cSe47qWF3qx
	IWjhLIW0ICErfuPyVgYeoNStFpumcUekv+067i/5+7DiCeZ73Z/Iet0Sxgz7yA+Z3ppIL5NPYhP
	nLgMkXFLlV8MOC05QrhxzGXvGT04F9an8DzATzw68Y/wsCvZgnDGo3QQaypRofoWKStprB+CSeR
	lHa9fTo0+0/xWempAcXSaRVAVUQ8FlsxPIUnyvDg3M=
X-Received: by 2002:a05:690c:6a01:b0:81e:abe2:9a3b with SMTP id 00721157ae682-8712314032cmr152621237b3.10.1788982660585;
        Wed, 09 Sep 2026 12:37:40 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:bae:bfc2:7e96:e5c8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-871493155d3sm115277577b3.16.2026.09.09.12.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:37:40 -0700 (PDT)
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
Subject: [PATCH bpf-next v3 01/15] lsm: Add the LSM policy object lifetime hooks
Date: Wed,  9 Sep 2026 15:37:04 -0400
Message-ID: <20260909193719.518517-2-utilityemal77@gmail.com>
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

Add struct lsm_policy_object, the identity an LSM embeds in a policy
object it shares with BPF programs, and the three hooks managing such
an object's lifetime:

  policy_object_from_fd(fd, &object)
  policy_object_get(object)
  policy_object_put(object)

The object records the owning LSM's LSM_ID_* value.  The BPF kfuncs
built on these hooks dispatch each call on an object to the one LSM
matching its lsmid, which resolves the containing object with
container_of(); the framework never interprets an object beyond its
lsmid.  The type field discriminates between the owning LSM's own
policy object kinds and is private to it, with 0 reserved as "unset"
so a zeroed, untagged object fails every type check.

from_fd has no object to route by: the fd refers to a file set up
through the owning LSM's own userspace interface, so the fd itself
identifies its LSM.  The framework offers the fd to every
implementation in turn; an LSM declines a fd that is not one of its
policy objects with -EOPNOTSUPP, and any other error is a definitive
translation failure.

The hooks back referenced BPF kptrs, which imposes the same lifetime
contract on every implementation: from_fd returns a reference on a
live object, get acquires with inc-not-zero semantics and fails with
-ENOENT once the count dropped to zero, put may be called from
contexts that cannot sleep (BPF drives it from map destructors), and
the containing object is freed only after an RCU grace period, as
programs load policy object kptrs from maps under RCU and may examine
an object concurrently with its last put.

The hooks are excluded from the "bpf" LSM's attachment points.  The
object-routed hooks are unreachable there, as LSM_ID_BPF policy
objects cannot exist; for from_fd, whose walk visits every
implementation, a BPF program cannot fill the object out parameter,
so an attachment returning 0 would hand the caller an uninitialized
pointer.

Cc: Paul Moore <paul@paul-moore.com>
Cc: Casey Schaufler <casey@schaufler-ca.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---

Notes:
    v2->v3:
        - No change.

 include/linux/lsm_hook_defs.h |  4 ++++
 include/linux/security.h      | 11 +++++++++++
 kernel/bpf/bpf_lsm.c          |  3 +++
 3 files changed, 18 insertions(+)

diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index 65c9609ec207..d7684407737a 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -452,6 +452,10 @@ LSM_HOOK(int, 0, bpf_token_create, struct bpf_token *token, union bpf_attr *attr
 LSM_HOOK(void, LSM_RET_VOID, bpf_token_free, struct bpf_token *token)
 LSM_HOOK(int, 0, bpf_token_cmd, const struct bpf_token *token, enum bpf_cmd cmd)
 LSM_HOOK(int, 0, bpf_token_capable, const struct bpf_token *token, int cap)
+LSM_HOOK(int, -EOPNOTSUPP, policy_object_from_fd, int fd,
+	 struct lsm_policy_object **object)
+LSM_HOOK(int, -EOPNOTSUPP, policy_object_get, struct lsm_policy_object *object)
+LSM_HOOK(void, LSM_RET_VOID, policy_object_put, struct lsm_policy_object *object)
 #endif /* CONFIG_BPF_SYSCALL */
 
 LSM_HOOK(int, 0, locked_down, enum lockdown_reason what)
diff --git a/include/linux/security.h b/include/linux/security.h
index 153e9043058f..5e423bea080e 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -168,6 +168,17 @@ struct lsm_prop {
 	struct lsm_prop_bpf bpf;
 };
 
+/*
+ * Identity of a policy object an LSM shares with BPF programs,
+ * embedded in the LSM's own object.  @lsmid identifies the owning
+ * LSM; @type discriminates that LSM's policy object types, with 0
+ * reserved as "unset".
+ */
+struct lsm_policy_object {
+	u64 lsmid;
+	u32 type;
+};
+
 extern const char *const lockdown_reasons[LOCKDOWN_CONFIDENTIALITY_MAX+1];
 
 /* These functions are in security/commoncap.c */
diff --git a/kernel/bpf/bpf_lsm.c b/kernel/bpf/bpf_lsm.c
index 82c5988417a0..f762cac6838b 100644
--- a/kernel/bpf/bpf_lsm.c
+++ b/kernel/bpf/bpf_lsm.c
@@ -56,6 +56,9 @@ BTF_ID(func, bpf_lsm_xfrm_decode_session)
 #endif
 BTF_ID(func, bpf_lsm_ismaclabel)
 BTF_ID(func, bpf_lsm_file_alloc_security)
+BTF_ID(func, bpf_lsm_policy_object_from_fd)
+BTF_ID(func, bpf_lsm_policy_object_get)
+BTF_ID(func, bpf_lsm_policy_object_put)
 BTF_SET_END(bpf_lsm_disabled_hooks)
 
 /* List of LSM hooks that should operate on 'current' cgroup regardless
-- 
2.55.0

