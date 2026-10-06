Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70074A0153
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301497; cv=none; b=kEyHBnXxhG0ZJWglwdjtxilwNisuy134gN0XzAFPfoV4vxGK/8kJ8pEMd8wdfxiwAfFdZ11SJ+3KdqAgbwWIIv98ejXZWmkwJTOZDI5sGXhLcCDVxND+gG4+tpAGaX8zP6SKtkeA9iEfbOzOPqqK2teTjrmj+e6pmwbih4+jxRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301497; c=relaxed/simple;
	bh=8vkzyF59g32RtfmPZXkdpM3bmDGASCtX3QXPvfTT0t0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WxjmrFmjXmJHQhpuHyT226JF7Su6DhgWpqcEO68byscx1E3sP0pman0EwiD7q+LYbYxsn//WAFR/COCFBFMv2bRHZR8/7lfV1f4/f+gAKk7ssxr0dCAYwaiB0vhWBYY7EXlGVxVAbSVwRgKKcUzZoa5zUlwLSht5+zwryTTys0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=OS/v21t2; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="OS/v21t2"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93e762768f3so58986285a.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791301492; x=1791906292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/k5W5gRBGKOnv0GDUCR5h+EZBe1kD+dGC7pkS9kRVb8=;
        b=OS/v21t25O6jQ72j2LBDZjZ8jz044uYh7yz3bYrMBeyNcGKFYyn9gWledD6gwEXQkt
         MSsaLHB3Ugl7MWDi+OQ6YF8F2UYeB47TDLpaZtGiVEXh26OHWJhV9cypO4aEbp1+JDzN
         BN/uUSjV6oRreqABPwygMn2LoJaXl3TXWTn27gurXiDMKjihDxFXLn9Cd0DqOhIp273T
         DPdDz3vkEXjU7rFSujovkgNKGzOrBNnf3WnexeseBx2+X8Lf5N7TvJklAPeBk0uAqEby
         Pu1phf3ec6qz3woHq0B1cjItldyGstAAboyuyU6iHAcDut1HCWtrlQwy/sOchQXAoSJm
         jZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301492; x=1791906292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/k5W5gRBGKOnv0GDUCR5h+EZBe1kD+dGC7pkS9kRVb8=;
        b=K4hE4RTL6qV8OojAkocIGTCzlYTbhpmy+8ltziBAQb+tINdQHKazvCSqLUsdD03l4E
         7rvti2ibyeknzVjr11bdvFZWBksF0fENlDZ3p2h7/psffnzBxasPrdFZwXXIuP/e1sp0
         zct3/NSh0+FvZN18cZlJ4jx2K4EgrJT1fzwX67b6+exs28/n/KahezQUXcg69JEfyZty
         c/Pji95lybFoBBfS3L5kEb4wSpUskV3YH+PIWSFpVErMG88LZ1YfEA2OXG8zGizRcGFf
         y9lSqUg0l/eCjl3hDIsyPNYiiPCi5Mn3mQchbsrL5rzazIzGN+aQHdZhqe1v9YSjHdIf
         HvzA==
X-Forwarded-Encrypted: i=1; AKwUvByckKR9y3jw5YQekRAS17Sh9OInxZeeX92fPNXROVzRcV60sBGaByLE1zVApuAGcdolEvAU6hiB5sFjzS8=@vger.kernel.org
X-Gm-Message-State: AFuF++lkGQOP4j5OWHKpUeWU9iX57S69DMe5WoCVVsdFxSXllJeUNokH
	+BYAUAGa5Hvq8rRtscxG8fDz5VZRDzuExVP98BK4fZzCfP3UGSMBZXx9waGGGCRmjdPgNSWlT3y
	874vg
X-Gm-Gg: AYBFou3ZKvPUgwh+wa9/LyXBt6No2dCIIPR3u53A7ROHE3be76Xjzh/IzhxuMG/eT0D
	Gfb59Li2A0hCxmJG15NHZ4Q/INX9qDxGOE/dVpohPsGNa79qQwO+OZXbwcl0ptgnXnjarfAKrqp
	7vmWTIUROKX/6JG4km9Da6/hzaCTSQgXnNmVKlw6zxN5sNU7cyCxJbct7sDlCQOmJZChfGYNGcT
	JKjrQ9v7bNVuoIGFBuRAyVwcvXziOrzDPK641nzuujK1ZHZY6GlT07rypNSedeYXhiXGzqqBF+j
	jDmo9hPDpbT2vC1kVCtzfKfrGYCiHPg2ZNs97hrElPzdOF7lj2KQ5+kr9lhdb6JzM/aqGYeWx3E
	rVO/8zZshzVkMmPD0e9AAA2ALdjBpxOvYZr6Anr4VHfAgkSlF63Qm9lf6F8s/3jDUPkKrf4AVLC
	Z6eLujr9Q4smOt7KZ1rA77EK7W7zjZshW+q+UHMY+uypLGu90N08uztBePXq4NIVZVVPfYV5cY/
	onXFQlDL4QvhOY=
X-Received: by 2002:a05:620a:1786:b0:93e:54d2:2285 with SMTP id af79cd13be357-93e8f37a03dmr301921185a.33.1791301491617;
        Tue, 06 Oct 2026 08:44:51 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca1a7a40sm1142936285a.7.2026.10.06.08.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:44:51 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 06 Oct 2026 15:44:21 +0000
Subject: [PATCH 5/5] capabilities: don't let ptrace borrow CAP_SETFCAP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-setfcap-userns-v1-5-f47e7ed66072@toxicpanda.com>
References: <20261006-b4-setfcap-userns-v1-0-f47e7ed66072@toxicpanda.com>
In-Reply-To: <20261006-b4-setfcap-userns-v1-0-f47e7ed66072@toxicpanda.com>
To: Serge Hallyn <serge@hallyn.com>, Paul Moore <paul@paul-moore.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, "Andrew G. Morgan" <morgan@kernel.org>, 
 Serge Hallyn <sergeh@kernel.org>, linux-security-module@vger.kernel.org, 
 linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791301478; l=6195;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=8vkzyF59g32RtfmPZXkdpM3bmDGASCtX3QXPvfTT0t0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHNGGw1vUwvXcplc29Z3TsCoIHmp/GbPMb9KUsV94Rc3EGWtTYg/cXaPnamHbE91Nwb4n74qJXR
 0+AE3tg1rkwU=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A task that entered a user namespace while it held CAP_SETFCAP outside may
map uid 0 of the parent and write file capabilities that are honoured
there.  That is the one privilege it keeps outside of its namespace, and
the ptrace checks don't know about it: for a target in another user
namespace cap_ptrace_access_check() is satisfied with CAP_SYS_PTRACE over
the target's namespace, which the owner rule hands to any task with the
right euid, and inside the namespace everybody has a full set.

  task A: uid 0, full caps          task B: uid 0, no CAP_SETFCAP
  unshare(CLONE_NEWUSER)
                                    ptrace(PTRACE_ATTACH, A)
                                      uids match, euid == ns->owner
                                    make A write "0 0 1" to its uid_map,
                                    or set file capabilities
                                      A is entitled -> allowed

The same goes for /proc/<pid>/mem, process_vm_writev() and pidfd_getfd().

Require for PTRACE_MODE_ATTACH and PTRACE_TRACEME that CAP_SETFCAP of the
tracer reaches as far up as the target can make use of: to the topmost
ancestor, within the target's setfcap_level, whose root user is mapped
into the target's namespace, or can still be mapped because the namespace
has no uid map yet.  CAP_SYS_PTRACE over that ancestor is accepted too,
since it gives control of tasks there that have CAP_SETFCAP anyway.

Targets in the initial namespace, in namespaces that were entered without
CAP_SETFCAP (what unprivileged users create) and in namespaces that don't
map the root user of an ancestor (the usual container) are not affected.
What remains is a tracer that gave up CAP_SETFCAP and CAP_SYS_PTRACE and a
target that didn't, in a namespace that shares its root user with the
tracer's.  PTRACE_MODE_READ is unchanged.

Fixes: db2e718a4798 ("capabilities: require CAP_SETFCAP to map uid 0")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 security/commoncap.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/security/commoncap.c b/security/commoncap.c
index 26798d62e6b1..7263c78b6397 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -195,14 +195,52 @@ int cap_settime(const struct timespec64 *ts, const struct timezone *tz)
 	return 0;
 }
 
+/*
+ * CAP_SETFCAP of a task can count in ancestors of its user namespace, see
+ * cap_setfcap_level().  That is a privilege outside of the namespace, so
+ * capabilities over the namespace are not enough to take control of the task.
+ */
+static bool cap_covers_setfcap(const struct cred *cred,
+			       const struct cred *child_cred)
+{
+	struct user_namespace *ns = child_cred->user_ns, *seen, *p, *top = NULL;
+
+	if (child_cred->setfcap_level >= ns->level)
+		return true;
+
+	/*
+	 * It is of use only for root users that are mapped into the namespace,
+	 * or that can still be because there is no map yet.
+	 */
+	seen = READ_ONCE(ns->uid_map.nr_extents) ? ns : ns->parent;
+	for (p = ns->parent; p; p = p->parent) {
+		if (p->level < child_cred->setfcap_level)
+			break;
+		if (kuid_has_mapping(seen, make_kuid(p, 0)))
+			top = p;
+	}
+	if (!top)
+		return true;
+
+	if (cred->user_ns == ns)
+		return cred->setfcap_level <= top->level;
+
+	/* CAP_SYS_PTRACE up there gives control of tasks with CAP_SETFCAP. */
+	return cap_setfcap_level(cred, ns->parent) <= top->level ||
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
@@ -223,11 +261,15 @@ int cap_ptrace_access_check(struct task_struct *child, unsigned int mode)
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
@@ -238,8 +280,11 @@ int cap_ptrace_access_check(struct task_struct *child, unsigned int mode)
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
@@ -255,11 +300,14 @@ int cap_ptrace_traceme(struct task_struct *parent)
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

