Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792694199;
	b=SoudSgHszED5Yb3jhJT5IC5qcnExy12eiNTaC6lS0oCEf5icRJiZRXwGuSeAEqbqNrhr
	 b+/NwaHvYAKcgXozq7TdiAIGflCVELCcrGbxHIsQmgX17i7mWuqlFxXMoMj5wBreRw7AX
	 m4QAsd8Mqj4Thtwwhc6pDy91/pkNRGYjZIk36sV488aGBxDmcUfKz2pAY3RHGo7EBLpMi
	 8d4anZdPYBGEABK6TLtQGlfdvNhVyqgj0UsIwiF33gvSH72Qj/QlMgNPqm8WTsD69q6y3
	 PPdzaUJ4Q8EQW6d1YNW73g/I7V953C1LLBRDNCP7yqDZjd25oLkpBBdYC8nNd41zlIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2HByHUi2YpmsLQonsK5yG9lvFZV5+xRUKZvYtQ5pzKU=;
	b=AWnxhQgVTkN+om0I8AEwf9BBe6ir4/S6SMaqP8eUjgzbAg4UvhfqmpIoE8k9NjrFkdml
	 UcL4T+nQcFHhdf/f9QYf9gBVjj1tfSYmJOwg8feEfNiWu+94fDmoYesiOVb1HViZmCHwU
	 yRpbfT2gcA1qYZO7hDUdYNRN6Aqu9I2dBpDa7CExve5k/72O+uYL02Na4lsD+ZpcqN3mP
	 fkKSluPaS83oSc5f1Kn0sVQ8kV4WR+/dHVe/CqL4D+66e2N0MY5XF0MmEsWfglGBTAV7J
	 lboj6R6Fs6/dmDSZBXeklc8A0czUFeY1pg46gYSEZwBbDw+BPuwHR1ULv87uBvDftmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=mt6hYE5Q;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3BA606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F3BA606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=mt6hYE5Q
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93e63ee7b4cso7198385a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792694198; x=1793298998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2HByHUi2YpmsLQonsK5yG9lvFZV5+xRUKZvYtQ5pzKU=;
        b=mt6hYE5Q7AhhNwO4S9N8tsyDK3PkX6HKFcbPXq/1lIAC9MK0t/JIQe4AIFPRUceKoz
         7XO+iQt+2sVnngQlwPD9BJPUdmpkz4T6QK12SBOUPRxqIMrOOTtwvYKQOPBWSNYSiKUc
         Td61bCvdpSsRJT6rEKukX+FOfjXZtIQkPbVDTN5PQKR33o0egYr8ncFP6VpAkZ7UI5ZF
         sEMos3/aerBZ+4cWHsWFSd1JMiHcTOM6ejum7T4ObjRRGjRk2AMYZDE7U9AHo6SgyX7Y
         cUjdxzu7XN5BpweLSVPOaHJxBpu2dy4JGz3qRMFsQG/jFb0b9lPiKXllErHu/dNRgmRH
         /rGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792694198; x=1793298998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2HByHUi2YpmsLQonsK5yG9lvFZV5+xRUKZvYtQ5pzKU=;
        b=d9BmpG7nxTRHYHojRkVl7awaPXgx5VeEbWRMkdrqV5KjPGxlumET9TJ+H1KKNGckC+
         /eFZC8IANXaUUDkKTFci+s9R2w1OnMMKHKxhDldGnzEFFK5rnzEYATQSieCwZ8K0dZVz
         mKOCqCznFOl0c81rJMgeRzR6Zz2YQQpEROen+WhHAjCYdU0UaSWKk9KTapK2dxqDiTHq
         lg+aXkRXpVcUkS8Zn4dC0IGRbTmKQ9EYEGKAgEWT51S+ZDRpRgEsOnpFiDimX60J9rHD
         VNCiA2r80OraJARoSEinJmnwhsB1A3kpbhpTtS+s0N/bbkMQ3pU+l/mrCFI7zTvcX6wi
         lBPg==
X-Forwarded-Encrypted: i=1; AKwUvBz2TrHWWcj0W5VlSwHyLva30pz4ZFardk5GT/HbYQcY+a+dU0Rs9B97AO7i9WmmHQWu5urC6DeIAEMAj5E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlQGtjMJ/lpy0/66Dxb9PHmEPI0+DMDzbyshF3v+RxgLKDpXjD
	7yvwfLohdgAuLj0KvDg3eYR12g/bXnL70ZEWy9dgbEY5p66LcRNe+EBBYGQizv7EpFs=
X-Gm-Gg: AYBFou3ydMjCMhLj0pXHjWwh30NpooIPG/Pt4M0+1amkijkXNelZmH0F4YbbsgFdPSH
	6sqg2o49maKM0k3q9CtZBgFAujpCx21IEcvC6MjGBFNrT9T8atT5b8mKlXKJPfs1bQny0SVR/9h
	BojNMLm442MhLS0tsb+GAwFe++d21mhO8VkwgXsTA6Ke5jylShJK0hWClEt6WFIStDNU+3clp+/
	G0TG4IhbrilkHamdXhiHYWHePfjTmaW7FGU0mulWufgCtjMViIG4enB6BcoGzFxRrOba0FbaAeO
	x2scNkfBFC1KhEtu2SopQ+bj/ycvsvPuA0dT5MYPM3TZA+DLyzfLO9jzH02mpY4MP4M7ZeB+eOv
	RGT3MZMiGzqnskuwai9/sjzh3VK/Lj5uiLpJM2Mfkxbx6K5DHA1cYvof3nHgPk477C7de+d4Gky
	4mKnPm6VE7jQgj4K7AMSI5fAhBfWKR67YFLW40o3xQ67K4qMuFrJ5dURbBObHYdQJ/D4eae5qu7
	VlMh/BNATY3P6mS+6vvIqVb1x9WebQkZ7Y4mwadPJCzy8VMLb+7UhEgJaa+7VxPgolH2Xe/
X-Received: by 2002:a05:620a:261e:b0:93e:a51e:7ffb with SMTP id af79cd13be357-93f6f54da56mr69362185a.2.1792694198543;
        Thu, 22 Oct 2026 11:36:38 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.253])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f6fc33098sm17185585a.35.2026.10.22.11.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:36:37 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 22 Oct 2026 18:36:19 +0000
Subject: [PATCH v4 1/5] userns: record how far up CAP_SETFCAP reaches
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
Message-Id: <20261022-b4-setfcap-userns-v4-1-88aa0ffaa08f@toxicpanda.com>
References: <20261022-b4-setfcap-userns-v4-0-88aa0ffaa08f@toxicpanda.com>
In-Reply-To: <20261022-b4-setfcap-userns-v4-0-88aa0ffaa08f@toxicpanda.com>
To: Serge Hallyn <serge@hallyn.com>, Paul Moore <paul@paul-moore.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, "Andrew G. Morgan" <morgan@kernel.org>, 
 Serge Hallyn <sergeh@kernel.org>, linux-security-module@vger.kernel.org, 
 linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, Bradley Morgan <brads@mainlining.org>, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792694192; l=5250;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=8IuY/d3QkcyzNsZWg+ftGcwOPwv9NKh0B+T0u35iHR4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGePxagh+fbAEyc1wz/hoXXG8Q9CM8gkmQHGJtfvXx4v5PnFeI78R27OfkrwTMlImXDAKQ6r4pZ
 z3pIr5riTFwA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

create_user_ns() records in ns->parent_could_setfcap whether the creator
had CAP_SETFCAP in its effective set, and verify_root_map() trusts that
when a task in the new namespace maps the parent's uid 0.  A bool only
describes the parent, though.  File capabilities belong to the kuid of a
root user, and a namespace that maps the parent's uid 0 shares that kuid
with the parent and possibly with ancestors further up, so what matters
is how far up the creator's CAP_SETFCAP counted.

Replace the bool with ns->setfcap_level: CAP_SETFCAP held in the
namespace counts there and in its ancestors up to the one at that
->level.  cap_setfcap_level() computes it from the creator's cred.  A
creator that holds CAP_SETFCAP passes on the setfcap_level of its own
namespace, one that doesn't gets the new namespace's own level, and the
initial namespace has 0.

verify_root_map() keeps checking the same condition: the bool was false
exactly when the level is the namespace's own.

No functional change.

Reviewed-by: Bradley Morgan <brads@mainlining.org>
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/capability.h     |  3 +++
 include/linux/user_namespace.h |  7 ++++---
 kernel/user_namespace.c        |  4 ++--
 security/commoncap.c           | 27 +++++++++++++++++++++++++++
 4 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/include/linux/capability.h b/include/linux/capability.h
index 622137f66f09..026974a5111b 100644
--- a/include/linux/capability.h
+++ b/include/linux/capability.h
@@ -34,6 +34,7 @@ struct cpu_vfs_cap_data {
 #define _USER_CAP_HEADER_SIZE  (sizeof(struct __user_cap_header_struct))
 #define _KERNEL_CAP_T_SIZE     (sizeof(kernel_cap_t))
 
+struct cred;
 struct file;
 struct inode;
 struct dentry;
@@ -222,4 +223,6 @@ int get_vfs_caps_from_disk(const struct mnt_idmap *idmap,
 int cap_convert_nscap(const struct mnt_idmap *idmap, struct dentry *dentry,
 		      const void **ivalue, size_t size);
 
+int cap_setfcap_level(const struct cred *cred, struct user_namespace *ns);
+
 #endif /* !_LINUX_CAPABILITY_H */
diff --git a/include/linux/user_namespace.h b/include/linux/user_namespace.h
index 91232053775d..f3753b6b6d29 100644
--- a/include/linux/user_namespace.h
+++ b/include/linux/user_namespace.h
@@ -86,9 +86,10 @@ struct user_namespace {
 	kgid_t			group;
 	struct ns_common	ns;
 	unsigned long		flags;
-	/* parent_could_setfcap: true if the creator if this ns had CAP_SETFCAP
-	 * in its effective capability set at the child ns creation time. */
-	bool			parent_could_setfcap;
+	/* setfcap_level: CAP_SETFCAP held in this ns counts here and in the
+	 * ancestors up to the one at this ->level, see cap_setfcap_level().
+	 */
+	int			setfcap_level;
 
 #ifdef CONFIG_KEYS
 	/* List of joinable keyrings in this namespace.  Modification access of
diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
index 50c374ed4687..a5a94367600d 100644
--- a/kernel/user_namespace.c
+++ b/kernel/user_namespace.c
@@ -125,7 +125,7 @@ int create_user_ns(struct cred *new)
 	if (!ns)
 		goto fail_dec;
 
-	ns->parent_could_setfcap = cap_raised(new->cap_effective, CAP_SETFCAP);
+	ns->setfcap_level = cap_setfcap_level(new, parent_ns);
 
 	ret = ns_common_init(ns);
 	if (ret)
@@ -921,7 +921,7 @@ static bool verify_root_map(const struct file *file,
 		 * the new namespace.  Verify that the parent had CAP_SETFCAP
 		 * when it unshared.
 		 * */
-		if (!file_ns->parent_could_setfcap)
+		if (file_ns->setfcap_level >= file_ns->level)
 			return false;
 	} else {
 		/* Process p1 is writing to uid_map of p2, who is in a child
diff --git a/security/commoncap.c b/security/commoncap.c
index d47ab3022343..4f49dba65426 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -131,6 +131,33 @@ int cap_capable(const struct cred *cred, struct user_namespace *target_ns,
 	return ret;
 }
 
+/**
+ * cap_setfcap_level - Determine how far up CAP_SETFCAP of a cred reaches
+ * @cred: The credentials to use
+ * @ns: The user namespace to look from
+ *
+ * File capabilities belong to the kuid of a namespace's root user, and the
+ * same kuid can be the root user of ancestors of that namespace.  Every task
+ * gets CAP_SETFCAP when it enters a user namespace, so having it there says
+ * nothing about those ancestors.  user_ns->setfcap_level does: it is taken
+ * from the creator when the namespace is created.
+ *
+ * Return: the ->level of the topmost namespace, from @ns upwards, for which
+ * CAP_SETFCAP of @cred counts; @ns->level + 1 if it doesn't even count over
+ * @ns, which includes an @ns that isn't @cred's namespace or a descendant.
+ */
+int cap_setfcap_level(const struct cred *cred, struct user_namespace *ns)
+{
+	if (cap_capable(cred, ns, CAP_SETFCAP, CAP_OPT_NOAUDIT) != 0)
+		return ns->level + 1;
+
+	if (cap_raised(cred->cap_effective, CAP_SETFCAP))
+		return cred->user_ns->setfcap_level;
+
+	/* All we have is that we own a child of our namespace. */
+	return cred->user_ns->level + 1;
+}
+
 /**
  * cap_settime - Determine whether the current process may set the system clock
  * @ts: The time to set

-- 
2.55.0

