Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A096D4F6470
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188406; cv=none; b=MtpkV1GpDcQ9UFolqvVuSsee5r++UQaTo0rTzRpUWpYiDNbIRocFGqza/HWq3GxV0ItWS+ObRcGmHR6UZFm4uYbDTt8wDCyLmde118JAIb2jWXKFWYDrUVdq/CIvYuE1qLNToaCAA398Y2RLTB1kq185DvW4snq9vHXUNYksU3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188406; c=relaxed/simple;
	bh=b13IPf/84INpWuDI29q/RKRtrh98z2Lf1mSfFGTrgeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RH3d5qfmqoDHbUOdpK3IGRih5nuZOLcdJXdty/RiNf2keFU2h+Z56ypFDRWSoKIeLkidKt0QhuLEVgUGjJ/QN2StpvZ1VvgHiAWDmdbbn7q8lp4HpulT0rnvEJ83uDccF5p3+8nXXv0h1/0KVYmgk16HS+2ZcHm/Mwy8qp8z100=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZbge3x0; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZbge3x0"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8588583a7c3so43999067b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788188403; x=1788793203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rCFWN9c5DyvZlo6DEGKf40uISp6POIHTrkimV4mL3IQ=;
        b=kZbge3x06aKFzXNvf6cyjoA7yBvs5Ly+cX1WlfmDUoSnwqQih1TnNj2pK1iRia+5wb
         lpUl6uE5rzbRx4elvQdOtyUEerK2r9vxqATKZs9flWkMvmC+qATzcrIZtsx4Jyw1Fzx1
         zSxDQfo3FRwq9HCH5tgP3KdEXN2s8opCR8CsdY4PxE2GUYQbrQDPH271O9EBtuT0xk8C
         H+v95cOXvlRk0zUrAZy7RY+IjGRqcddqiSgdsAiKs8ykI8P6VsFqWA1ew9em/Zi+yy9v
         Z4039trmXpZocgF+eJtBnNQH+RMVI+Asn/VuBcbyjXi7ohefY91/w6SduZvFGRHFa7kb
         VzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188403; x=1788793203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rCFWN9c5DyvZlo6DEGKf40uISp6POIHTrkimV4mL3IQ=;
        b=LIXgaTmBz1HtV4FEofgclWCMSqzqxqomgcAAf42hEK5pnM9EgYE3AEXsxrT9IINa9h
         jILr9LVyR0JtQDufg69uyNyIY0nlVkK5rn2eg+YHc/EqM8+EgUoaHgk2YgwAYwMPcBcK
         Mk5Z6y9mVOChVddhwGr7vPg4FgZ+nN7jATq81lFbi9u09KAg93XkNe0eBRrHRg9GrUGP
         Mi+wAtGJi25azqSiWVWB6IxF+IhuAss/T1GrEOf14HuiaMvzvmM+SVQ8jOyMxG00SI/a
         6sNi019dXPgdGkRcR858fs+579f2eX6jaWhuR6m1QY3iwQswXS+5VtJd8srz00RD3Jt7
         YxpA==
X-Forwarded-Encrypted: i=1; AKwUvBz0biWrzlpo/CBaiwvjKA0UmavenH1tNbMG58x4Rge8OQsej26u9LKlYXvPshdIitb0cBfn7QShxCiDZ14=@vger.kernel.org
X-Gm-Message-State: AFuF++l+eBRu4gXCdq6SpCQAH9FNfVThIkcUv1XqoUUR+2crqcTREa02
	bIzBTmsgi45H2g2yBRvjw6mHg/xQPFWz2eFxt9z361IQM+sO2fEjbRVr
X-Gm-Gg: AYBFou2eR0Xz1+BMDGI7RsYQpNSBCOncJPONWri9pEhY51JcGyMIOxkc/nhHYiomj6P
	HVKOx7ug06VJ0sx9knTKrGjRMbf6YvuJ9V01sID6wCTS1znQzwXtZTXRPdUXvuTBpGlGAI1Eb21
	kpf10idzLc3IjCckLB2cG2168Bal1GkXAjFPseQEZS+XdCbGmX5siNht0Pfq1/YF9cUMSHkxKNf
	bN/Y6bvnzDZiohamtXcj1U8Wxii6jEIfl3ZexBwvXZXFJBsXkP0neovb3iL437VO3lQbeWbN/Ve
	pN3FSm+gsVXdQqXfgVadXy5T6/e2AevCjvTBAB98uFdsdDQUO2Uzhtb072yCYoxYFzsL1UaztI9
	R4fTllb1y6F5eg6pbOuyOZeKdHDjw5Z4mKTTuwWExWwNiAuGA3JMxvfmwry/YEK7ej227UUyRev
	yM/3rwbvDoTkFWxf+At5AxrxZ5scz/06LlfUriNRMnm1wI3hnB+x3Yip7CSdm5mwrsEtTCCkmAO
	Zxt1KEn4W87Ddpebbfmg2c=
X-Received: by 2002:a05:690c:93:b0:862:65f4:c8bb with SMTP id 00721157ae682-86265f4cb64mr46763897b3.3.1788188402897;
        Mon, 31 Aug 2026 08:00:02 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:f6fc:b424:b1bb:6ff0])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e58666e15sm53903827b3.0.2026.08.31.08.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:00:02 -0700 (PDT)
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
Subject: [PATCH v2 05/15] lsm: Add the bpf_lsm_policy_from_fd kfunc
Date: Mon, 31 Aug 2026 10:58:47 -0400
Message-ID: <20260831145858.3869191-6-utilityemal77@gmail.com>
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

