Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110995;
	b=TpToh5Zo8thgX2dMWLlD/aVsGDm4/Cz8P0JBUBbMHq3fpucdfilbEHtP460/9xBLK/Yv
	 SkLR2YIwcKxJsrxwsfB7A2WFG1rQ9bvDLRyuLVZnLmR2ddUMEcBbHZqQiFWOsWPk5elTC
	 cgJJdF3bwkM8v9KnycAfhVzkDBvH+gKLtXz4b7+Yanm5T2MP42BVV8X++c9wfvUuj7WCu
	 KqHc1NLoQ6IjcuFWHOu2XXOG1haGtuaiKdLwDYNYLOtEPcXvpD/UePRfcFCahSVpflSf3
	 a7NNatU0cpsW/EUesxjGK6VdR372SsKYbvPm7/XtW0K3HC9WhtsxDf2jmGueiRg777g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Qz7r+A/D6KnqK0PO5YdI2E3CPVQcCuCNvAghnich9pU=;
	b=LJ0ESBotY1uvEF2C8VhVm+qdE4yvxe9BCFEfv+d/cO7A67cbJt/BEkCrgyxk+vaUVRy/
	 SIlO0kyGiH/1FTRdv2L4nbbJQa6SyWB8u2w3VHp+WX9XhU87azV/YblHBPjcLJIr+7MRe
	 eeOFhd7/1UShxiR5cdQzSYxDb2OG4QgWRoNUQlPeEUxcjCpjO07CRFAnp+yZd5Tt4Oaq8
	 s40xhXNKHvg4vQxqh/24XaZubH2L9lfEa3ma3hiPiXuCjg38vYCkBYOV3ltpRNRqw2K+Z
	 BgZNGg5KYjANTXIBIBC2TcfA3dTELkDIjDYxdYpdxNo3W7GXnFoCrrM5M40E6Z8Rkag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=jiWPU7pp;
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF41B606A334
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF41B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=jiWPU7pp
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7c19c6721a3so404287137.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793110994; x=1793715794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qz7r+A/D6KnqK0PO5YdI2E3CPVQcCuCNvAghnich9pU=;
        b=jiWPU7ppnvRtWpZrn4UMSCSJDegLme7WwqDxmIwaTL7bzz2dK2FzkScNiXH07+Ama7
         NRYTSS0NYUgDD2gUrSCkG40gc2RsSVdP8rZeaFYQCFLWwZBSKGvAcxHEo2DKOAIfyWyF
         z6yyAapyWbLbtSXuE+3x/a8wl41t2418mZrBAXdotb27EeuoT5foMkU2atHebZ9Loywk
         /nQ+BwxzSn1969ZBE3qQTamnxNvrLTqa7tO7Jj1wIWKBoSmpmNiyMPDypUr0hJirIz7P
         OsfixIw3mMi/6IUNenJAPVo5ZFPIPb72qB6Pb6AtbCj0kSpRlskoiPwLH0S3y6fbtS8+
         RlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793110994; x=1793715794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qz7r+A/D6KnqK0PO5YdI2E3CPVQcCuCNvAghnich9pU=;
        b=uRWjjfAj4CUvRQ8XEtkORm7kDG6q0oq6fY4QkeJyvENjpTc6YzWSknQjQX2za5thbF
         WG47iAya3k0nmcX31Li9If8Ftcmu9yjyt6gtUJY0d8HeTDy2FguZUbWTizxdhBkJ58e2
         h+iWWqBO/tNkbcetLOxTQoq13HhL5dynnWQgSJWC6M5xKZr65YnFYNo/qE1YiHTXTKI+
         FdiwT+JpvFHWTPZieH0kiqtRZFjSwAYt0iGlvv+hOwZ09cYwA4AH+pjr0yeonbceZ2hv
         uh+DwifLKKNnfuDXUuFUyMoUPjYJ5pMuyZQro5+4vckTPDC2ylRf9LnI2ZLN5U4AA1G3
         uW7Q==
X-Forwarded-Encrypted: i=1; AKwUvBy6DBh97QSrsi8V+p7pPFPafJQSoCdHPWmGIRJ69e9n73CPHY0Hwb9L6BBC1xTi+UjXtZWP1yHiq1Up8ak=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfFyukCEyALk2FpOriRBY6c913kQKIMZdIH8XDpps36UJ2adzv
	ZOrrjlHyFRu5mfTU61JgLqXSedzd5CDGHdc+wcBX7FSJIlWPnSj0p25eTcTvYCFU2Cs=
X-Gm-Gg: AYBFou0/raMIO8xULqB0hP/2epWFYLkauFI+h5HEdWMNB21rms9ICrvD9I/eUDasjP8
	WIlnY/zg3ULQg/Gy0sDyMPdYoYds24057DIkFQ/Vy8QpXzLWnR2XIxY1iNfbrXlB313J7VBWwX2
	AMpgKgpyLbCIk6NoKT3Y2v1IAuVkKm7Hu+zC7kSuVL13lSVgX2+dfBIH0k/lyG6sHBmwxFp5FtT
	u4J/VgL2JOT4V5vsPIkjAtw0GF8xByDpwikiuQ4GpfYbtD+D8nS+hmyEPanHi2gaHmEDHR7c/Js
	+xQCZ1C2P/A4AlnW/rKHNQy90L5dgxeRuudWljdO5jkSIF+xvWKetfvgkmh2vqTbiu2rp/ZHzYt
	f5VsfXq+fLlQb/etqX80x71hpwMXR8TzRJgz5Ju9kutw5F4r6gfXA1rSHe3E/QgjJg/vgcIvf8K
	dWiHAZhKBVIiMuZCa8rti4XqTVX+3JvEKA5X21gUmzg0G6zuueMBEYH8ABmEPKpmFxmR6il7BZn
	EwM126nJrgstT+j6CxjxYA0uQ6RFmAkmfUSGwICJQP8mljKBTqBVHnld6pybYW3ccRQLt/L
X-Received: by 2002:a05:6102:5486:b0:7cb:bda3:27ab with SMTP id ada2fe7eead31-7ce5cc70a5dmr4320157137.13.1793110993805;
        Tue, 27 Oct 2026 07:23:13 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.251])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3d7a868sm2627350137.11.2026.10.27.07.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:23:13 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 27 Oct 2026 14:22:50 +0000
Subject: [PATCH v8 2/6] userns: don't let setns() lend CAP_SETFCAP
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
Message-Id: <20261027-b4-setfcap-userns-v8-2-2674adc63f3c@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793110987; l=6171;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=n4GgDASw93W0W4hVR9BfgOUvZQHADy8KOEbGO3+EfSU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCAucrZfi7FK92VQAX7uWopK0W6qCXAZHmLS0BgtRy/+GbM9u1OOCqetS9tKG97Xbh1YmoqUwhs
 uSckxNuNLwAg=
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

