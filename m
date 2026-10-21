Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615064;
	b=GrWCJ8Bq0Ma+oxgHuui4rkkF7spNzvns8qr1x1IWiWLqxss59hRzRhrxERqnMni3C/GG
	 m5VH1KvutmCTyZpS8CGgWnWtOgJpJlvzooA2ODDQ6ndrnNvKw8mR74Oou+94XSPLMdPwV
	 CO3ays5maWjahUQPY5nl2jPLIZ4lV2Lt/8oXirCB+MSRusDmOOg1d9h6oNRJF1ktfvM5c
	 il/cGdY/rHP5fjP1G7+8ryqmqMjZkhBuO96AkwNPjYCJA2JAd9/rb2lPDFlk5PYRn905D
	 /xXiF6kD00u3EqLVp9QuWzOhSZQsVzyrH+JO597rSec0C4vD9eLFxbPzdyAUkmkU3fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Qz7r+A/D6KnqK0PO5YdI2E3CPVQcCuCNvAghnich9pU=;
	b=CPxNOuISZOyIr+VOd/8/WQoTi0zwOUYJ3Z55jBdM+MSfZAsWxGHqGG4e7xUCuYfgl9F2
	 9p50zhBhU0exgkOM+rarwG0epYd/T5vL9ONMN5phIAXhwfHjAbaOC+cZV+4zBZE5pOFSn
	 L1WyYi03uk4l1QpspUDOhozoBWSJaiw2yz+MbTcNOqtYpOEVLzTTNJbmwWwBc6wduVeuj
	 GGxBUuoYENjklmNE+Od00UhMCLyay230SYrAa/vcI8UuqmrndJ2pkSTcxZjvvLwQhb938
	 eOK1weWkK/QNS7SU9zv5xfs1KLK5pV2fDpV+VVKSGsHT3gD6oq6tOUtBtrIZ6VvqKCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Vyr9Ej4Y;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDED606A337
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BDED606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Vyr9Ej4Y
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91b8b456dbeso11872696d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792615063; x=1793219863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qz7r+A/D6KnqK0PO5YdI2E3CPVQcCuCNvAghnich9pU=;
        b=Vyr9Ej4Yqcprk3WG6+TyjpghfpCld3UFXXz5MTV+9u54EvPhJ5Dm8U7OM2xPyJ5Ajf
         sKoAk1v8T8XPmdy8Pczk1OKaxmc7myCh8ylTNSozIm8pbP3xAjtvzBnK+F0nXrwrEEJw
         XVj1VaB2bF3byFB/q1Kra4xxL/Eo+GWqLOnZBtR1VTjDoA8fqn50NvwyyYTFWehTjWPO
         G55Z4nYeca34fm598MfoZnvYDikR90viUKoE7Rb3jOX7BrF1h/mLRT9xDgAwnFKIHsOs
         2+DYVoIC8OGZqc5lWLQKgITnjnCpK/hQk1ZeNpI/JmalW98BD5o6ELrjK/Hb0aEr8IQ7
         ExFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615063; x=1793219863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qz7r+A/D6KnqK0PO5YdI2E3CPVQcCuCNvAghnich9pU=;
        b=HErphdrbreWeRyWUbezQhM1S9rT4djd5rFruGugjxWbXf+P7e/m+6wNLilMnktyGPa
         CB2l4zotk0Yi/5QtMxTBz+86d5t7r90VFMCMwGVQn4QvmU+DnIQ1OUBKpI+oOkab7BbF
         OwPWiBZG0nSMlB2GVF/4Epza0N0C0JVK6DQjL9tiIw4UJ0D/G5MXHrEuDZexKvBfG+6/
         qAVXAH4SNNYiDtiNOicd39tqzdHYMGvzbv6ZqKy+71yg5x7em38ERrRhGeE+3fvBkC8b
         NIFqyqRusEAfGVMr0dlhp9KI9rQH/HfzWbnwGKh1cixWNWOPkn3IlRaPW69VehIoBxUv
         Wr9A==
X-Forwarded-Encrypted: i=1; AKwUvBxyYh/byazFn/Rme8lDeRlvVAaX8GUO3RYw2PxJ8szg3bPhnXG8Xx9vkri7GeeVU/+JoKUD+1e6yw3iZ/E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeICMIvM05Dsds3+xzJOYVOuEK1I9XCjkFmY/0EJOZhRiwOArA
	3G13bcsJiWoWV2Jc/GA9AmjBwjdPgTMeb/tftD2eV4pxKbAk8Kiq3tVtHW/GkAtoSYk=
X-Gm-Gg: AYBFou3CvmsSIxK3/eQ0OI8/Lbkx7/fVXPAWPykoj+A563wbpNj63yOyIiIxSRl9U+5
	HaymPPtyYuGED5ra0ATA60uTam2Y1iXSdcohX0zerwGYnes+1O6Q+arkzIaMsd32DiEUB2//SpL
	8drlF2rLnhb+Oc/l6zNPZ34r1HY59NuLm61Mt37ZNJ8e5Vfs8HrVFODGMk2cR390sNXeZyGfRS5
	RqagJc7H3hXwdXAleDXZ4jiheee73xnpJdCIwWmWfJzxxlBQt9hZFPkqS9zHk4S06sn2gkeN5Yd
	eqNX/ZW7xXWYhMAHn5LcdOy5OBa0h7+zMbVlIK/lxU+34IjlQW8yn3uSk8wZRp16tg+DLHJu0UU
	T29fkQzTYMNZvgwnOS7cktbik99jGMMLwOt7/h3AiG8zQ2KRzvbu+LW8kPHM5ASfjO5h19h2jj2
	tpjOeXNDVHZG9eHTwY+00fOP4L7PwhFuJSDWFLMcWQZBo+GE37v15z0xy0aDrnFVoVQ6e2uV4NK
	6A5XO5RdlIv4tQMJ/Mzuxgk0lm0Nvm2Dap+Sq4qx30XW3OURUnsefrg9oPdXsgNe1yXn1ce
X-Received: by 2002:a05:6214:1307:b0:91b:895f:1a70 with SMTP id 6a1803df08f44-91c12edd4a2mr53460076d6.13.1792615063292;
        Wed, 21 Oct 2026 13:37:43 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10c45747sm33392256d6.39.2026.10.21.13.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:37:42 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 21 Oct 2026 20:37:26 +0000
Subject: [PATCH v3 2/5] userns: don't let setns() lend CAP_SETFCAP
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
Message-Id: <20261021-b4-setfcap-userns-v3-2-97c7ed4e43e1@toxicpanda.com>
References: <20261021-b4-setfcap-userns-v3-0-97c7ed4e43e1@toxicpanda.com>
In-Reply-To: <20261021-b4-setfcap-userns-v3-0-97c7ed4e43e1@toxicpanda.com>
To: Serge Hallyn <serge@hallyn.com>, Paul Moore <paul@paul-moore.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, "Andrew G. Morgan" <morgan@kernel.org>, 
 Serge Hallyn <sergeh@kernel.org>, linux-security-module@vger.kernel.org, 
 linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792615055; l=6171;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=n4GgDASw93W0W4hVR9BfgOUvZQHADy8KOEbGO3+EfSU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QM4P3KlqYurlWT3jkkLXjsgK30Pnk6OhCditFT1YkDA0ERB0Bbw2JzYks6wrcXMC976EgYglCcs
 uvVq02w6ahQQ=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Mapping uid 0 of the parent into a user namespace requires CAP_SETFCAP,
because a task in such a namespace can write file capabilities that are
honoured in the parent.  A task that is already in the namespace has a
full capability set there and can't be asked any more, so
verify_root_map() goes by what the creator had, now ns->setfcap_level.

But setns() lets other tasks in, and they get the full set as well:

  task A: uid 0, full caps          task B: uid 0, no CAP_SETFCAP
  unshare(CLONE_NEWUSER)
                                    setns(A's user ns)
                                      allowed, euid == ns->owner
                                    write "0 0 1" to /proc/self/uid_map
                                      ns->setfcap_level is A's -> allowed

or, if A's namespace maps uid 0 already, B sets security.capability on a
file.  Either way B ends up with file capabilities that are honoured in
the initial namespace, which it could not have written there, nor in a
namespace it created itself.

Refuse setns() into a user namespace whose tasks can write file
capabilities for the root user of an ancestor that the joiner's
CAP_SETFCAP doesn't reach.  That is the case when the namespace maps
such a root user, or has no uid map yet and its parent maps one.
cred_may_setfcap_userns() checks it, and cred_setfcap_reaches() is the
comparison it and the later checks use.  Then every task in such a
namespace is entitled to what its setfcap_level says, and the checks on
the way to file capabilities can go by the namespace.

An idmapped mount can store a root user that the namespace doesn't map,
for example a "0 100000" container whose rootfs maps 100000 to host uid
0.  That is a deliberate setup and up to whoever creates the mount, so
it is not considered here.

The change in behaviour is that a task without CAP_SETFCAP gets -EPERM
when it tries to setns() into a user namespace that maps the root user
of an ancestor, and was created by a task whose CAP_SETFCAP reached that
far.  Containers that don't map host uid 0, tasks with CAP_SETFCAP, and
unprivileged users joining their own namespaces are not affected.

Link: https://lore.kernel.org/all/20261021-bioenergie-allheilmittel-undurchdringlichen-35666eb62cff@brauner/
Fixes: db2e718a4798 ("capabilities: require CAP_SETFCAP to map uid 0")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/capability.h |  3 +++
 kernel/user_namespace.c    |  6 +++++
 security/commoncap.c       | 58 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+)

diff --git a/include/linux/capability.h b/include/linux/capability.h
index 026974a5111b..e4199b03668b 100644
--- a/include/linux/capability.h
+++ b/include/linux/capability.h
@@ -224,5 +224,8 @@ int cap_convert_nscap(const struct mnt_idmap *idmap, struct dentry *dentry,
 		      const void **ivalue, size_t size);
 
 int cap_setfcap_level(const struct cred *cred, struct user_namespace *ns);
+bool cred_setfcap_reaches(const struct cred *cred, struct user_namespace *ns,
+			  int level);
+bool cred_may_setfcap_userns(const struct cred *cred, struct user_namespace *ns);
 
 #endif /* !_LINUX_CAPABILITY_H */
diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
index a5a94367600d..7bd3692c2f3e 100644
--- a/kernel/user_namespace.c
+++ b/kernel/user_namespace.c
@@ -1390,6 +1390,12 @@ static int userns_install(struct nsset *nsset, struct ns_common *ns)
 	if (!ns_capable(user_ns, CAP_SYS_ADMIN))
 		return -EPERM;
 
+	/* Tasks in the namespace may have CAP_SETFCAP that counts outside of
+	 * it, so only let in tasks whose own counts as far.
+	 */
+	if (!cred_may_setfcap_userns(current_cred(), user_ns))
+		return -EPERM;
+
 	cred = nsset_cred(nsset);
 	if (!cred)
 		return -EINVAL;
diff --git a/security/commoncap.c b/security/commoncap.c
index 4f49dba65426..8a9d998b1897 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -158,6 +158,64 @@ int cap_setfcap_level(const struct cred *cred, struct user_namespace *ns)
 	return cred->user_ns->level + 1;
 }
 
+/**
+ * cred_setfcap_reaches - Check how far up CAP_SETFCAP of a cred reaches
+ * @cred: The credentials to use
+ * @ns: The user namespace to look from
+ * @level: The ->level of the ancestor of @ns it has to count in
+ *
+ * Return: true if CAP_SETFCAP of @cred counts in @ns and in its ancestors
+ * up to the one at @level.
+ */
+bool cred_setfcap_reaches(const struct cred *cred, struct user_namespace *ns,
+			  int level)
+{
+	return cap_setfcap_level(cred, ns) <= level;
+}
+
+/*
+ * The topmost ancestor of @ns whose root user tasks in @ns can write file
+ * capabilities for: within @ns->setfcap_level, and mapped into @ns, or into
+ * its parent while @ns has no uid_map yet.  NULL if there is none.  An
+ * idmapped mount can store other root users, but that is up to whoever sets
+ * up the mount.
+ */
+static struct user_namespace *setfcap_top(struct user_namespace *ns)
+{
+	struct user_namespace *seen, *p, *top = NULL;
+
+	if (ns->setfcap_level >= ns->level)
+		return NULL;
+
+	seen = READ_ONCE(ns->uid_map.nr_extents) ? ns : ns->parent;
+	for (p = ns->parent; p; p = p->parent) {
+		if (p->level < ns->setfcap_level)
+			break;
+		if (kuid_has_mapping(seen, make_kuid(p, 0)))
+			top = p;
+	}
+
+	return top;
+}
+
+/**
+ * cred_may_setfcap_userns - Check whether a cred covers what a userns can do
+ * @cred: The credentials to use
+ * @ns: The user namespace
+ *
+ * Tasks in @ns can have CAP_SETFCAP that counts in ancestors of @ns, see
+ * cap_setfcap_level().  Check that CAP_SETFCAP of @cred reaches as far up as
+ * tasks in @ns can make use of theirs.
+ *
+ * Return: true if it does.
+ */
+bool cred_may_setfcap_userns(const struct cred *cred, struct user_namespace *ns)
+{
+	struct user_namespace *top = setfcap_top(ns);
+
+	return !top || cred_setfcap_reaches(cred, ns->parent, top->level);
+}
+
 /**
  * cap_settime - Determine whether the current process may set the system clock
  * @ts: The time to set

-- 
2.55.0

