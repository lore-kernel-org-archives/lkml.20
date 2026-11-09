Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253771;
	b=OqJmKGPwbUdhh7rmKSdaVnf2v/a8kLyafTsbZ9peS7gZMo41Zthkgbqe21N8FGYVENiS
	 tMDJqv3S3h2uD5EAz/oKhkdq+JezeDs2akU9opQFHlYGDxpj3gwuelcNc7UMja2x+2SKQ
	 6/b3wb1bVQ/FGucz7DOado+trKbTp0rXhDiAvTWuT2zMZUJbrDHuKnZWZ0yw2Pz2eKAYr
	 11kt5+Wah7LsMMTWqjUhtOWQFDE3tUZRWBpHcFKkj+EGffydBOq2sunj6mxfU+5Ggohw4
	 sW8S7DBYqRSSEmhJOfbBAIKqcMtaBV1HsHhdD5w1ANYNbygXvY1dbBL10Mc96R1B2yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=uAhDYlvK2+3qASZfUSpUAqvVOjwzZmifCoWceYJJL+M=;
	b=WqiubQQigQLMS8evqFqofio1rrdbS3YdmQXLIJ9gcDhTNrlZzvf2lE9dRGcKFK+h5sj4
	 f8XURHGzDS22FZhUNmjJojD1aDl1ZzPMdZ1yQnFovqDxsSau/T3FGdzGj8NgQuvv5N8vE
	 9RvIBQ7v8fkxkgzfZBGQvK8LJSZlO7wb9M5YPOmCT3IjmXvZmahYU8wYKZMExd8tbIKEE
	 jBGJG91VhztIOewvCrbLsNtrho2lSnNDmvtAN9Aa1+0k71NOpawFFapQn3Pf+ezrmw+WR
	 8CnUhVrimso19b0KD/XnMkftUawe1rGUHIBTXPXdUVY527mX5Ep1gUMsa7YlegdVnTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=kLJWX1rn;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AC160A2612
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37AC160A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=kLJWX1rn
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-536717a4d83so10532521cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1794253770; x=1794858570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uAhDYlvK2+3qASZfUSpUAqvVOjwzZmifCoWceYJJL+M=;
        b=kLJWX1rnQ4huf6ru90hKR94H2MqoKMZQcLtp76N3m8CiAgzT9SoQmLSZFX3ANeltSP
         a0pC4kHpj+YUiKTTqalVcFKVjLdBTd5Yifmjld/3iG9UHYdkpkU6mr9sb1eRuSMxXcNU
         +VyF4Ofs0bWCTVxmC/OKXAweMbee8q1LPfgV4wcyP4HM8HJnW2B3HZInJDReW9bVKUZE
         Dpb/NUCKucpgfYwzJIr+8mc9APTETTGtZBQb0Zs8n7IHmHjK0lsE9HPKrXkiARRwHSF9
         GynzBH18Ec7hrszmXEtIMfJOvwIqivK/ZDqUrZxO85oEglZp0LKjEdJYfOZHyNUxdvti
         Zd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253770; x=1794858570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uAhDYlvK2+3qASZfUSpUAqvVOjwzZmifCoWceYJJL+M=;
        b=MNjofWEStNt5kUTTbj3lGzXMESiY/gPiBre9x38Aadx/BBykcLTazWmnSZOaIyVwzA
         11epMiAgDaJ8xbF7gkC8GBlNFtPaGaPeJvWvGwOuzOAosN+uxTeeMtACOu3GvBMDrun8
         Ix/uIZ7HYIVB/cdyZ0L+Tk9mDvom8RV86H7fU7qMfG4ZZyl/PqtJUr0P/0ocZnjiy8hn
         Bn3DUVj5HF8GWevUGNa8aF9NaqYPE9mjfxQhnmKtL+JPASwimzYYVV2Pxb1wZH4UcGcj
         lNXoxu8VTghUSKb+5I5dj7YsFP5lzPdyz/h2ww5IM+GvMJC9kOgY5fUhtU+8B7fOKzOW
         r1kg==
X-Forwarded-Encrypted: i=1; AL+hErHP/5Cq5eZjDs8RfIaDnzYUKoEl2I00+C7487P2pGWGO1NOMK/3lWnYC6ssvoW4Q7fzF69bcitu65xO6p4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Qp9T0QfGkHFzvocFei+hr6gyukCMcsBUGtPjg/A6YJOB+ptv/
	mOIpOtS+8l+HoIEHQX8ffsG8zDvU/jYwsib9o4ZtlZowBiZAQJQRY0Dg1hYgQ6BCadY=
X-Gm-Gg: AYBFou0REv6G7W9ZrwY/tTPgR5veiusJFaTgpztZNYQCO67hjCZ1IwNWcmbuBHY8NPZ
	BlWSEC19JwMrC4zli4qQN5HQ0RCz3toW6bdlJq6/Qso6MP9c32zEmm/Nt15tKK8awgNAyiSkD4Y
	gHN8gMqB6oG+FojuxkZUP7aSlIr9Ev49MuyijIq4F26pb94tllGhfuugNpoF1usjlpgaIDNOEkT
	U9mIEXkRTUl67zFq523Uh4ibKvvj6LQscjcM09WckNWCGqYapNt+ogXQmSHhlj5r2ezkjp2wifA
	dEwUFmayRLhNtVOKhpmuAG+rnGLw2oHnAM5PUW8X4r7S7E6Pd4pirGZtAjBevw1EIns4vjIXqFk
	reQSZt2acZPX5SV9IVCSvyXmxWUGRkLZbBuAeP1cpCbwKQBMXXDEFPMsyGwIYi8pBGM1ZU5XAuq
	cMGGu/KdXabqNyOj4eLTQjeuvKLbqbeqloVmKtkuGTajwF1Xez/iO/8wwOj5D0vQopcrGBz3a7e
	q0SjgC/sM+cuqomUWcwwi9/gh1c4Qt6hMuovpC6Xwq3G2TShwA00m5VOEkKTtGN3vOmMcjISX6k
	4SNLSgapVR7wWc+05cVJgMHfgy2e0/v0iNeUCBImeFw4Jg==
X-Received: by 2002:a05:622a:299b:b0:535:70b5:806 with SMTP id d75a77b69052e-5552b15e49amr5380961cf.62.1794253770039;
        Mon, 09 Nov 2026 11:49:30 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-555091eb7f5sm5387711cf.1.2026.11.09.11.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:49:29 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 09 Nov 2026 19:49:11 +0000
Subject: [PATCH v9 2/3] capabilities: don't let ptrace borrow CAP_SETFCAP
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
Message-Id: <20261109-b4-setfcap-userns-v9-2-0d3f00976ce2@toxicpanda.com>
References: <20261109-b4-setfcap-userns-v9-0-0d3f00976ce2@toxicpanda.com>
In-Reply-To: <20261109-b4-setfcap-userns-v9-0-0d3f00976ce2@toxicpanda.com>
To: Serge Hallyn <serge@hallyn.com>, Paul Moore <paul@paul-moore.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, "Andrew G. Morgan" <morgan@kernel.org>, 
 Serge Hallyn <sergeh@kernel.org>, linux-security-module@vger.kernel.org, 
 linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
 linux-kselftest@vger.kernel.org, Bradley Morgan <brads@mainlining.org>, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1794253763; l=5442;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=lQ7qdUcZnQWLmwtfdxuLRnWVpPjrrhXHWgXwETwVEx0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGRzRC7SrJKU30VGPsSGvEfeY4y1dbq+wHdy6wOSjMoKv/0Mz2Vww/Nf+w56aBPHQqRQZSS0a6e
 AAvhgPwfF3gM=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A uid 0 task that gave up CAP_SETFCAP and CAP_SYS_PTRACE can still
attach to a task in a user namespace that another root task created,
and have it write file capabilities for its root user.  For a target in
a child namespace cap_ptrace_access_check() asks for CAP_SYS_PTRACE over
that namespace, and cap_capable() grants every capability there to a
task whose euid owns it, whatever it gave up:

  task A: uid 0, full caps          task B: uid 0, no CAP_SETFCAP,
  unshare(CLONE_NEWUSER)              no CAP_SYS_PTRACE
                                    ptrace(PTRACE_ATTACH, A)
                                      euid == ns->owner -> allowed
                                    make A write "0 0 1" to its uid_map,
                                    or set file capabilities

The same goes for /proc/<pid>/mem, process_vm_writev() and
pidfd_getfd().  setns() refuses B now, so ptrace is the way left into
the namespace.

PTRACE_MODE_READ, tracers with CAP_SYS_PTRACE, a tracer and target in
the same namespace, and targets in namespaces whose tasks can't write
file capabilities for the tracer's root user are not affected.

Fix by refusing PTRACE_MODE_ATTACH and PTRACE_TRACEME across user
namespaces when the tracer has neither CAP_SETFCAP nor CAP_SYS_PTRACE,
the target has CAP_SETFCAP or can get it back from its bounding set, and
setns() would refuse the tracer the target's namespace.

Suggested-by: Serge Hallyn <serge@hallyn.com>
Link: https://lore.kernel.org/all/fd159e68-c613-4c7d-bfba-8af0a3f3a96e@hallyn.com/
Fixes: db2e718a4798 ("capabilities: require CAP_SETFCAP to map uid 0")
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 security/commoncap.c | 39 +++++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/security/commoncap.c b/security/commoncap.c
index 0ece141c68a6..d550a4e5d36a 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -176,14 +176,35 @@ int cap_settime(const struct timespec64 *ts, const struct timezone *tz)
 	return 0;
 }
 
+/*
+ * See cred_borrows_setfcap().  Within one namespace the usual rules apply: a
+ * tracer with CAP_SYS_PTRACE can take control of tasks with CAP_SETFCAP
+ * anyway.  A target that still has CAP_SETFCAP in its bounding set gets it
+ * back from an execve() the tracer can make it do.
+ */
+static bool cap_ptrace_borrows_setfcap(const struct cred *cred,
+				       const struct cred *child_cred)
+{
+	if (cred->user_ns == child_cred->user_ns)
+		return false;
+	if (!cap_raised(child_cred->cap_permitted, CAP_SETFCAP) &&
+	    !cap_raised(child_cred->cap_bset, CAP_SETFCAP))
+		return false;
+	return !cap_raised(cred->cap_permitted, CAP_SYS_PTRACE) &&
+	       cred_borrows_setfcap(cred, child_cred->user_ns);
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
+ * For PTRACE_MODE_ATTACH, if we have neither CAP_SETFCAP nor CAP_SYS_PTRACE
+ * and the target task is in another user_ns, where it can get CAP_SETFCAP
+ * over our root user, then ptrace access is denied.
+ * Otherwise, if we are in the same or an ancestor user_ns and have all the
+ * target task's capabilities, then ptrace access is allowed.
  * If we have the ptrace capability to the target user_ns, then ptrace
  * access is allowed.
  * Else denied.
@@ -204,11 +225,15 @@ int cap_ptrace_access_check(struct task_struct *child, unsigned int mode)
 		caller_caps = &cred->cap_effective;
 	else
 		caller_caps = &cred->cap_permitted;
+	if ((mode & PTRACE_MODE_ATTACH) &&
+	    cap_ptrace_borrows_setfcap(cred, child_cred))
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
@@ -219,8 +244,11 @@ int cap_ptrace_access_check(struct task_struct *child, unsigned int mode)
  * cap_ptrace_traceme - Determine whether another process may trace the current
  * @parent: The task proposed to be the tracer
  *
- * If parent is in the same or an ancestor user_ns and has all current's
- * capabilities, then ptrace access is allowed.
+ * If parent has neither CAP_SETFCAP nor CAP_SYS_PTRACE and current is in
+ * another user_ns, where it can get CAP_SETFCAP over parent's root user,
+ * then ptrace access is denied.
+ * Otherwise, if parent is in the same or an ancestor user_ns and has all
+ * current's capabilities, then ptrace access is allowed.
  * If parent has the ptrace capability to current's user_ns, then ptrace
  * access is allowed.
  * Else denied.
@@ -236,11 +264,14 @@ int cap_ptrace_traceme(struct task_struct *parent)
 	rcu_read_lock();
 	cred = __task_cred(parent);
 	child_cred = current_cred();
+	if (cap_ptrace_borrows_setfcap(cred, child_cred))
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

