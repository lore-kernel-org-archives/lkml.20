Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048446;
	b=sAEo0H2DuqqA2t7Dj2AgV+XpdTAHvO+ZsgEDV9zGcfNMA/FRlu6EYr1OJ/INOAMfAFvZ
	 5x0w60RgbJENgiU6FXehqkv5byEpYjlv/cYc2Q0hfbR+cChIyYhi28hbom268B/pMQwXi
	 cwrOSgIbrhESHfDrXLtFl27kZtVmIdUyP3MLgbCPcZLWfvpJOnT8v5NGc/gwMY9QkV5h2
	 5RJ+TGc6Zf5JUNe8NaCOHkxOUblIeKjxFPZQsJ1AYtMmtda46wk4s8pR6QVp2Z9gBsTd7
	 MHeyqBvhi/XvDZcJwbUznhSK60wmBKQbq4Dxg8SPF/f0wEIH/qrhxEwewS0ipoOvxQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=SlE+GD6loY7SaEz5ltXlb5NxzrPftLvvYozFrshERGY=;
	b=v9i3c4IakoTWm+Tw+FSGvgglDJLXxH6h4Zv8SdjdMpHPB201HWaHmyzKxp8xUpu0r9FZ
	 xwfPVd1DYuduEPT4L9V4YB51epNNqkLvnWAMIlsA0u22k9pInXWpQya9O5xzVs4dHYQA+
	 u1fvvyvki1hRTpW38vEouPkdK8n/yeY8ERbo/Fxp0jXjHwJUAHf7WL1PogCZs3Lo2aJgk
	 pw+l8gl8EoG4i9z+5jPydotK788Lx7u8cT/X/caYf7mwBB2RcLRQm2ZgAMairjD9wg2Ds
	 FzsVOR4H5GYBa04mjBvIhYl9coBQEdLShE4LENleVTDoPc37E7d9QtpEaI2nO69pQqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=jHYdzlhf;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BA160A2614
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78BA160A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=jHYdzlhf
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-53634b8328eso23821101cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793048440; x=1793653240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SlE+GD6loY7SaEz5ltXlb5NxzrPftLvvYozFrshERGY=;
        b=jHYdzlhfYYPEdR4vNyE+g9h3wo0O54pAOuVmlJZlckU3IL5ETxNoipPxDppOopxm3U
         Mh/UJVF0tJ2/zTZD5sHcGGOLRGYl2EZD8hspDVbg+vYGoPA5KIDvtNiNBS13CCQ658f8
         CWKUo+/b1iiV6UceUjNkhSSiOzPMO3nVm2C8PmwTibBb2AuMPDQsuF/Jn4ZYlYe1scXw
         HKngrfvViR2/p6FihmAbImV5Cwx2dqLvm3LDSmNc9z88bHVh8ANN+88FvdKeWHbFdhzY
         xGnzO/1EB1S/yEenC4uhWYxxQiJgJQt5uDHnqJl1y6b9c3rH6P11RdUTN+utcfwq6po3
         Nb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048440; x=1793653240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SlE+GD6loY7SaEz5ltXlb5NxzrPftLvvYozFrshERGY=;
        b=FLzvRlA9lc8FhDP3PNSL8V2inZFrY1YU4EywmInSznF7Uu7fS3QIXtm9r8u6B0rgMO
         aCu9tRUPpDSnkPmsIObmxMJ7XLJNls64xXPqzmJEBGZYElwG2sHFQ7mus28hprpKz3iv
         RzHJZ9xpDjC7gDtePsEopp+YUb42gPuzax8J8hclmH9dzC5IFz31kTzlxrrIUuTxIe+J
         8Rvu7hVMitPIzjwYwMypCdt2q7ZBuGTt7a8F1AYhfe6EniBS+QtTHO5FeGipgHgD9ZGH
         4hUGT17uqb2jPwnfL19Mj4qHpta6bGguAgjlnzeK2JYbQSAcy71mX3fYJ4VUQL3bFOFP
         3RVw==
X-Forwarded-Encrypted: i=1; AKwUvBy33Ppb56CNyuC/52K7Yt2FD64uncDmRdBs7uRstu71du1eIzZJ3TGvocPcp1FMe2yR4MDl1UrAlNgCZ5k=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4DsgVDu56753qrl5TYBAnJpMkuZlfNIgtxSPqGk3+xap25rIz
	kAVdJq5/zBkE2N/VUFJzUY8bci60wBMkdGoJwI1j2OhyvmUgWvici1G+jsPmqlYU1y4=
X-Gm-Gg: AYBFou3ROXl6EMzvZdiJuPl5gn5yq8TNLgj/w0UXRJz3aEUBf5KC0i5H8MfTh9Q7SCv
	Fzlw9rHXquFPE9/s5Lkscbl5mbSaI/pz/O6a56kArEVi3OFuhw2Ty6Hl3qsj9tzHxFQvXo1aDTr
	IHKHysxZJ57LO7rTo3fF9Y/SHrki5P9XG5tLlFkhfkvlawU6+2hvjCcVHChFZhkRf5fkwly1T7a
	Qi9a6ez44dnTMgeHGohFpe2tuu9wGa3CbLOi8ZfFfYoCuWAUrHbAeDV3DWhELqSSDQBpASV0d7y
	zhWp0mS74XeYJxN8G1SXXlSYmCpvyEhHDcOQqU7tOgxt7psuO3l4lK2EJMZrUYjdbq0Aso9Ac+f
	URxDIB5Rk+2Aezej0wQqRhLsv+F5DcrBvi05un3VmO3Bl/QnMdt+THlaeejZlT24mINq6GZIjbu
	4qIQWjCZeXn6oHYzLRnOXRjxWPrkfdDgYKVS56+Kag/ZoI6rc7zxcs6Yg5fff3jpcvNjQeIzuis
	C/kUE/A75VG5zPypDL+VGGZSpkzn3YEIwmgaHAckO2UpZnF9oEIAgQc5wvof3ofCVVOzsl8sVTe
	4T7w+6PVhrdbfpuuPw==
X-Received: by 2002:a05:622a:44a:b0:533:8900:4eab with SMTP id d75a77b69052e-5383b4a973emr130240711cf.16.1793048440239;
        Mon, 26 Oct 2026 14:00:40 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c4399fsm83319636d6.22.2026.10.26.14.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:00:39 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 26 Oct 2026 21:00:22 +0000
Subject: [PATCH v7 4/6] capabilities: limit fscaps to where CAP_SETFCAP
 reaches
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
Message-Id: <20261026-b4-setfcap-userns-v7-4-bf8a576f7259@toxicpanda.com>
References: <20261026-b4-setfcap-userns-v7-0-bf8a576f7259@toxicpanda.com>
In-Reply-To: <20261026-b4-setfcap-userns-v7-0-bf8a576f7259@toxicpanda.com>
To: Serge Hallyn <serge@hallyn.com>, Paul Moore <paul@paul-moore.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, "Andrew G. Morgan" <morgan@kernel.org>, 
 Serge Hallyn <sergeh@kernel.org>, linux-security-module@vger.kernel.org, 
 linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
 linux-kselftest@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793048427; l=5703;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=FDChG0bx+cXxkkBT6UYSsvtNifUZi0Mew1bpibNMRUo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCb0Jl+OxscNq+G5hjgGZclIM+7B63jlR0/vz8V+m/BDMIKKC5bAz9yM3XgwcSvpCZ+i1rmVoKI
 0HJmLTF//9Qs=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Commit db2e718a4798 ("capabilities: require CAP_SETFCAP to map uid 0")
keeps a root process without CAP_SETFCAP from creating a user namespace
that maps uid 0, in which it could attach capabilities to a file that
are then honoured outside.  But the map doesn't have to be written by
that process.  A privileged task can write it from the parent, and the
file capabilities are not checked against the outside at all:

  task A: uid 0, full caps          task B: uid 0, no CAP_SETFCAP
                                    unshare(CLONE_NEWUSER)
                                      ns->setfcap_level = 1
  write "0 0 1" to B's uid_map, gid_map
    A has CAP_SETFCAP -> allowed
                                    setxattr(file, "security.capability")
                                      rootid = kuid 0
  uid 1000 in the initial namespace:
  execve(file)
    file capabilities apply

The map doesn't even have to show uid 0 of the parent as uid 0, since a
v3 xattr can name any mapped uid as the root user.

Check at the place where it matters, in cap_convert_nscap().  On an
idmapped mount the root user named in the xattr has two identities: the
kuid seen through this mount, and the kuid that is stored and seen
through every other mount of the filesystem.  If either of them is the
root user of an ancestor of the caller's namespace too, CAP_SETFCAP has
to reach up to there, which ns->setfcap_level tells.

A v2 xattr skips the conversion when the writer has CAP_SETFCAP over the
filesystem's namespace, and belongs to that namespace's root user.  It
gets the same check: if that root user is out of reach, the xattr goes
through the conversion instead, which names the root user of the
writer's namespace and refuses it when that one is out of reach too.
Otherwise a task that unshared without CAP_SETFCAP could mount a tmpfs
in its namespace, write a v2 xattr on it, and have it honoured through
an overlay mounted from the initial namespace.  If the filesystem's
namespace doesn't map uid 0 at all, the v2 xattr has no root user and
nobody could run the file with it, so it is refused with -EINVAL instead
of stored.

Tasks in the initial namespace, tasks in namespaces created by a task
with CAP_SETFCAP, and file capabilities for a root user that only exists
in namespaces within reach are not affected.  That includes everything
an unprivileged user does in its own namespaces.  The rest gets -EPERM.

Fixes: 8db6c34f1dbc ("Introduce v3 namespaced file capabilities")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 security/commoncap.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/security/commoncap.c b/security/commoncap.c
index 8a9d998b1897..4e0b00b7b1a3 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -216,6 +216,29 @@ bool cred_may_setfcap_userns(const struct cred *cred, struct user_namespace *ns)
 	return !top || cred_setfcap_reaches(cred, ns->parent, top->level);
 }
 
+/**
+ * cap_root_level - Find the topmost namespace in which a kuid is the root user
+ * @kuid: The kuid to look for
+ * @ns: The user namespace to start from
+ *
+ * Return: the lowest ->level among @ns and its ancestors in which @kuid is
+ * uid 0, which is how far up file capabilities with that root user are
+ * honoured; INT_MAX if there is no such namespace.
+ */
+static int cap_root_level(kuid_t kuid, struct user_namespace *ns)
+{
+	int level = INT_MAX;
+
+	for (;; ns = ns->parent) {
+		if (from_kuid(ns, kuid) == 0)
+			level = ns->level;
+		if (ns == &init_user_ns)
+			break;
+	}
+
+	return level;
+}
+
 /**
  * cap_settime - Determine whether the current process may set the system clock
  * @ts: The time to set
@@ -671,19 +694,46 @@ int cap_convert_nscap(const struct mnt_idmap *idmap, struct dentry *dentry,
 		return -EINVAL;
 	if (!capable_wrt_inode_uidgid(idmap, inode, CAP_SETFCAP))
 		return -EPERM;
-	if (size == XATTR_CAPS_SZ_2 && (idmap == &nop_mnt_idmap))
-		if (ns_capable(inode->i_sb->s_user_ns, CAP_SETFCAP))
+	/*
+	 * A v2 xattr belongs to the root user of the filesystem's namespace,
+	 * which may be the root user of ancestors of our namespace as well.
+	 * There may be none, then nobody could ever run the file with these
+	 * capabilities.  Only write it unconverted if that root user is
+	 * within reach, the checks below handle everything else.
+	 */
+	if (size == XATTR_CAPS_SZ_2 && idmap == &nop_mnt_idmap &&
+	    ns_capable(fs_ns, CAP_SETFCAP)) {
+		kuid_t fsroot = make_kuid(fs_ns, 0);
+
+		if (!uid_valid(fsroot))
+			return -EINVAL;
+		if (cap_root_level(fsroot, task_ns) >= task_ns->setfcap_level)
 			/* user is privileged, just write the v2 */
 			return size;
+	}
 
 	vfsrootid = rootid_from_xattr(*ivalue, size, task_ns);
 	if (!vfsuid_valid(vfsrootid))
 		return -EINVAL;
 
+	/*
+	 * The root user may be the root user of ancestors of our namespace as
+	 * well.  CAP_SETFCAP that we got for entering it doesn't cover those.
+	 * On an idmapped mount the root user is vfsrootid as seen through
+	 * this mount and rootid as seen through every other mount of the
+	 * filesystem, so both have to stay within reach.
+	 */
+	if (cap_root_level(vfsuid_into_kuid(vfsrootid), task_ns) <
+	    task_ns->setfcap_level)
+		return -EPERM;
+
 	rootid = from_vfsuid(idmap, fs_ns, vfsrootid);
 	if (!uid_valid(rootid))
 		return -EINVAL;
 
+	if (cap_root_level(rootid, task_ns) < task_ns->setfcap_level)
+		return -EPERM;
+
 	nsrootid = from_kuid(fs_ns, rootid);
 	if (nsrootid == -1)
 		return -EINVAL;

-- 
2.55.0

