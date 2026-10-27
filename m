Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111000;
	b=5bIuKHz2mTBEYKbqb4d4fi5uP4VA7Yj7SnXGYMnqHhWHr/sACZ5aAKoqjJf8kGpcQH2v
	 R0e2SeJlIsla7MB53tWkVzWlybYCa0X50pTDiHtCOe2NBQXgdh03PAgrH+ofBvDJ3Izyo
	 GKsZ4yfX1WT5FptTIpW2LhODuvgljk27x1PQVICOElRa9G6S+Crm31GYFI/JuOztOl2yE
	 Zp8oDkBDg/QkfXFoRXo8twBpehHjzqxDPhhmvpPhGPs/nrV0j29yhe6G9j8ResA0RcJia
	 oVfqUTboHG6SIcwBGVxQvgwNWC3qb4w2awbr8YLvLiuqzkKJGc2C8iHPwRm+f168szw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/QAf07cAiyxBwSWgq7Tjim9fLXjZh7SPBHX/IjDGa5I=;
	b=eZJgv5GTCdPE+NfLpnQa2V3zxwf/+zjRd2wLRzgeIGrb/PD3SCuAtIQ6Jy3zJbIfMC+V
	 azuJpV6GdiORKSobCVSEX/tC5NEOcVC/Y9X6NVY0eGeAgBahoJiIvLzN54Z1Cw78KC0VO
	 t0Z8unguH6SCzKy23kLoTQerYiC0R52fhhC+Xb9IbdtG25Jyuu9QgmznbjDfu7j9D6tVe
	 uf9A8c0DwwWf0qOL4w9/EDsFNs2ouwJk2K869vhV0xSaKroz3yCMC/BruEEt1Djjzv/ol
	 QO/wZbZz2q/Hy5GNA8owfzn8HWhafKTF9kohtVvW7W1jUykBz95ltHBq6PfTGxJ6uTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=pQp+LsHR;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D83260A2616
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D83260A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=pQp+LsHR
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-98c7798ce74so1143242241.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793110999; x=1793715799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/QAf07cAiyxBwSWgq7Tjim9fLXjZh7SPBHX/IjDGa5I=;
        b=pQp+LsHRW4clLO4IqBxtiBBgl2cYYc7Eg5+mkgU3O5XmPgucEl7TZQeZSOMwUOwhdx
         w91gPCCAjq26boBBcI20XapQNSCc4FdhLV7MMvw34D6ZCtBKobyFR4xkkeMrPD8wtkeo
         spLFyeTqvAqWSPSNdqNZs0dWKmBkW02IfzIM18Dkt0PSQyARDzY/BDewahMPWt37aVxu
         SNcPWJ8/q0bYJjfYgyAgewcYAcdL1yvAfFHSlxOHJwGEmAxemiijn/6f5E8LpmTAcOPj
         igUGt18d/1ORUom+1m54n/+pkgWXnrRGSSP6B7fiQ9PNv2FHfykIrP2z8UZnxDds+BwX
         wHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793110999; x=1793715799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/QAf07cAiyxBwSWgq7Tjim9fLXjZh7SPBHX/IjDGa5I=;
        b=N5n+hzXrdX/w4ZsX+fr41fL/TVvLkW6fkTNrmQ0gLEvd18/1nLFyaMbCOcMiZraQtF
         L6MC78ej0TJxAx9F1eOYT7FQfbwUmG8arM7A+tn+207jNZkVtuUe/HF9r0JYKdqKxxCj
         CSPnSWXfGw/oILl4Not0+OaD/namJuCPNJ3YW5uLRp0Q1kD1g0gbyHI5IqkUm6C47jpD
         Amqin9jqKvTOVLLEYJ8rxW49Z7PVAVGNN+bF7hZJ5ZtkEWqm0i2ShU7W91qUtwvMP1eO
         /A62Kd3cYOgxnnkw8g3xZEi1XtWi/YWN9/j9UQrJYEBlPQyJKUdcxrruaeQuHbxVWklK
         fJdw==
X-Forwarded-Encrypted: i=1; AKwUvBxJykuuG7tO6EdfCfwPVDscsYnyP64giViIEVelCGEDqSz5haFE7VQtg8DNf8YpTQtZ3O/vBbKS7HfzR8s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAe+0Be8K4oet7OfUdkpgM5JtRwuGnEGREqDFBEQk5fG+xzsO5
	nDN43hYniTCD8YBOwngO4SXm/aYs+/ccEA4/aYv//5pkbj9j7kY84gcEGsxMs8CwCX4=
X-Gm-Gg: AYBFou1JaZGl/1ayzWP18siHIKcDNqeHzCt+woKHxczuh1stGPUyN33LzC6fEbCXoVm
	5WDExrs9wPUyzehtc+EdOHNT4/faXUOrE5h7psT0YODrPlQ28LChjefpTkIunRU3YEjKHfT6tGC
	w2uVHg3D81x5EbmS77IJ6kWQIBCqcD901VWou+G+fEu7NFYh/sxCHJ5xlAx4HexQ3RSji91XcML
	JLMzo8IRXsFWLf2giBBeARz/ICQfM7ZbZzxjl0EnfExd/pSr/NhSnj8f/ANW7mfbVzxEsV9A9Fp
	nKc8X1/A2i++DdRgOxkWMSsNjnovQsVfrQEU731HYUZw08oR92PK7FOZ6kbR3oJva5I31R/N7dj
	60zSKu2Bbml1atSLPqwdF9VSK1deE8kmCCdMGu8v+5DcFzC4PSs73j2SKxMhOPYm+e9VL2sbeuo
	B743kpniJPR66J6IFCpfl7cAQ+wBivvGnNWirzAERsg2IhXD2M+h2vZ2ao4ej8GrfFTs5GsI0MI
	WjzZ1hX+fTX1u25u6kVrgL1OFId4Ab5ygEa1wl8jLU7d4j5519OxSUwcUATXY40znIwizUctoaF
	c9Kt0ymgcv09Hv8DGQ==
X-Received: by 2002:a05:6102:c07:b0:7cc:2cef:b341 with SMTP id ada2fe7eead31-7ce5ca7cbdfmr3316188137.4.1793110999029;
        Tue, 27 Oct 2026 07:23:19 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.251])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea367d328sm2728441137.0.2026.10.27.07.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:23:18 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 27 Oct 2026 14:22:53 +0000
Subject: [PATCH v8 5/6] capabilities: don't let ptrace borrow CAP_SETFCAP
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-b4-setfcap-userns-v8-5-2674adc63f3c@toxicpanda.com>
References: <20261027-b4-setfcap-userns-v8-0-2674adc63f3c@toxicpanda.com>
In-Reply-To: <20261027-b4-setfcap-userns-v8-0-2674adc63f3c@toxicpanda.com>
To: Serge Hallyn <serge@hallyn.com>, Paul Moore <paul@paul-moore.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, "Andrew G. Morgan" <morgan@kernel.org>, 
 Serge Hallyn <sergeh@kernel.org>, linux-security-module@vger.kernel.org, 
 linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
 linux-kselftest@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793110987; l=5986;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=sZPBiHwnYa3YycPMYlN3oxrwhjCY5GQuMbx5FDiasfw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOWacpFAY2FbkIXf5D0ycjwnIoU/XCwTlmKvGuF6WW8wwJ+r7fluka/NTRGO3YXrAJWqdIHm9TZ
 VMyNdcYoX7wA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Tasks in a user namespace created by a task with CAP_SETFCAP may map uid
0 of the parent and write file capabilities that are honoured there.
That is the one privilege they keep outside of their namespace.  setns()
no longer lets anybody in who doesn't have it, but the ptrace checks
don't know about it: for a target in another user namespace
cap_ptrace_access_check() is satisfied with CAP_SYS_PTRACE over the
target's namespace, which the owner rule hands to any task with the
right euid.

  task A: uid 0, full caps          task B: uid 0, no CAP_SETFCAP
  unshare(CLONE_NEWUSER)
                                    ptrace(PTRACE_ATTACH, A)
                                      uids match, euid == ns->owner
                                    make A write "0 0 1" to its uid_map,
                                    or set file capabilities
                                      A is entitled -> allowed

The same goes for /proc/<pid>/mem, process_vm_writev() and pidfd_getfd().

Require for PTRACE_MODE_ATTACH and PTRACE_TRACEME what setns() requires
to get into the target's namespace: CAP_SETFCAP of the tracer has to
reach the root users of ancestors that tasks in the namespace can write
file capabilities for, or the tracer has CAP_SYS_PTRACE over the topmost
of those ancestors, which gives control of tasks there that have
CAP_SETFCAP anyway.  As in setns(), root users stored through an
idmapped mount are not considered.  A tracer in the target's namespace
got in with as much and always passes.

Targets in the initial namespace, in namespaces created without
CAP_SETFCAP (what unprivileged users create) and in namespaces that
don't map the root user of an ancestor (the usual container) are not
affected.  What remains is a tracer that gave up CAP_SETFCAP and
CAP_SYS_PTRACE and a target in a namespace that maps the root user of
an ancestor and was created by a task that didn't give it up, which the
tracer can't setns() into either.  PTRACE_MODE_READ is unchanged.

Fixes: db2e718a4798 ("capabilities: require CAP_SETFCAP to map uid 0")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 security/commoncap.c | 45 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 41 insertions(+), 4 deletions(-)

diff --git a/security/commoncap.c b/security/commoncap.c
index 4e0b00b7b1a3..91ed4a5f4b25 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -254,14 +254,41 @@ int cap_settime(const struct timespec64 *ts, const struct timezone *tz)
 	return 0;
 }
 
+/*
+ * Tasks in a user namespace have CAP_SETFCAP that can count in ancestors of
+ * the namespace, see cap_setfcap_level().  That is a privilege outside of the
+ * namespace, so capabilities over the namespace are not enough to take
+ * control of such a task.
+ */
+static bool cap_covers_setfcap(const struct cred *cred,
+			       const struct cred *child_cred)
+{
+	struct user_namespace *ns = child_cred->user_ns, *top;
+
+	/* setns() only lets in tasks whose CAP_SETFCAP reaches as far. */
+	if (cred->user_ns == ns)
+		return true;
+
+	top = setfcap_top(ns);
+	if (!top)
+		return true;
+
+	/* CAP_SYS_PTRACE up there gives control of tasks with CAP_SETFCAP. */
+	return cred_setfcap_reaches(cred, ns->parent, top->level) ||
+	       !cap_capable(cred, top, CAP_SYS_PTRACE, CAP_OPT_NOAUDIT);
+}
+
 /**
  * cap_ptrace_access_check - Determine whether the current process may access
  *			   another
  * @child: The process to be accessed
  * @mode: The mode of attachment.
  *
- * If we are in the same or an ancestor user_ns and have all the target
- * task's capabilities, then ptrace access is allowed.
+ * For PTRACE_MODE_ATTACH, if the target task may make use of CAP_SETFCAP in
+ * an ancestor of its user_ns that our CAP_SETFCAP or CAP_SYS_PTRACE doesn't
+ * reach, then ptrace access is denied.
+ * Otherwise, if we are in the same or an ancestor user_ns and have all the
+ * target task's capabilities, then ptrace access is allowed.
  * If we have the ptrace capability to the target user_ns, then ptrace
  * access is allowed.
  * Else denied.
@@ -282,11 +309,15 @@ int cap_ptrace_access_check(struct task_struct *child, unsigned int mode)
 		caller_caps = &cred->cap_effective;
 	else
 		caller_caps = &cred->cap_permitted;
+	if ((mode & PTRACE_MODE_ATTACH) &&
+	    !cap_covers_setfcap(cred, child_cred))
+		goto deny;
 	if (cred->user_ns == child_cred->user_ns &&
 	    cap_issubset(child_cred->cap_permitted, *caller_caps))
 		goto out;
 	if (ns_capable(child_cred->user_ns, CAP_SYS_PTRACE))
 		goto out;
+deny:
 	ret = -EPERM;
 out:
 	rcu_read_unlock();
@@ -297,8 +328,11 @@ int cap_ptrace_access_check(struct task_struct *child, unsigned int mode)
  * cap_ptrace_traceme - Determine whether another process may trace the current
  * @parent: The task proposed to be the tracer
  *
- * If parent is in the same or an ancestor user_ns and has all current's
- * capabilities, then ptrace access is allowed.
+ * If current may make use of CAP_SETFCAP in an ancestor of its user_ns that
+ * parent's CAP_SETFCAP or CAP_SYS_PTRACE doesn't reach, then ptrace access
+ * is denied.
+ * Otherwise, if parent is in the same or an ancestor user_ns and has all
+ * current's capabilities, then ptrace access is allowed.
  * If parent has the ptrace capability to current's user_ns, then ptrace
  * access is allowed.
  * Else denied.
@@ -314,11 +348,14 @@ int cap_ptrace_traceme(struct task_struct *parent)
 	rcu_read_lock();
 	cred = __task_cred(parent);
 	child_cred = current_cred();
+	if (!cap_covers_setfcap(cred, child_cred))
+		goto deny;
 	if (cred->user_ns == child_cred->user_ns &&
 	    cap_issubset(child_cred->cap_permitted, cred->cap_permitted))
 		goto out;
 	if (has_ns_capability(parent, child_cred->user_ns, CAP_SYS_PTRACE))
 		goto out;
+deny:
 	ret = -EPERM;
 out:
 	rcu_read_unlock();

-- 
2.55.0

