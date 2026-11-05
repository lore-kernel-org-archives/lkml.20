Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891764;
	b=ybvhGbtSke7Waov7AJ6ztQgL4CCsqfcI3gN1vbXQ2LiAN00TKz36WQva02ukowhKMYbl
	 6XSNd+8cDBpvl1EYV7dvzplCKICd0lHTqDJbSo/ZfNewJJQA6uwI+dzS4rJuQJxsuqFl/
	 XeP6aiLHErwuUZhPZ/VCNfYBgOFJwVNJ0bn7cfn5sRAI6JlenvFsF4lfTeW/BfIDzUeFr
	 j9Bq0pdJ0caYhfsl0hzuTssnFHaaEFVm6BJQ8Ta2lZaCRYvCLSl0J5aokukxrhak7V+lF
	 cmS0ouZ0MfNZZ/Ktg4Vz4JZpuJWkiHwaNNS2WtubfizMWhfIT2rMfZ/1z89hZQiVA/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=H4Mer0Lga1IOizNWXuhoug2hQz4DJn4K5PpD2JnRSys=;
	b=g3IiA4sx4vjo2UFfsvJNbAxAdURA6wpSjqV+ngb0EzpoSNHrDEDtTDhyqwiJPUI20CF6
	 KDYPPyDFzM+/dLwpBdj+5F3sPgB1oCNfRMAsm2WhnK+5zDAiB/VOSqYMFYVNNFRN8QB1y
	 RGQJoTV3S6/OiA9G8CJ6ceWh5peneD1iXVSAiMnfeSm1Sdnm9ZmTWeeZsDASnyZkTK7zB
	 9j/kfEztvbLDS3oDVouAFiDkLlWMtpoXE3CYt0gUSnDF2llSqPfm7z/ovzQs53R8ZZiK9
	 cUoqwqhcPNFh7Q9SSC/3wuL5g7kXKPoUpNK3R95oH1JzbTuZO1VPCOVtbAcR6/lPLJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=q0tMP3G5;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912C1606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 912C1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=q0tMP3G5
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93f22a8515eso185292685a.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793891762; x=1794496562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H4Mer0Lga1IOizNWXuhoug2hQz4DJn4K5PpD2JnRSys=;
        b=q0tMP3G5TNwHLj0e92cF2/sGUzL0yaOkWUtG/jxiVXHh6qCvrroPpFtyNkrn2crsXE
         cx+0RrqC429hBqC8qKyYQs9ImXPCn9e/Gom2P16SBM8/PTmrbiNeYJkgcCVu9rNBytrQ
         EmKfgrJL2Fcnh86KAvc9pLN5D0RAWREwCiyU8QmahV5aeCHNCAElRKfIJOia+9L7UCb1
         6D5lUMiThI8NlU5z3x8f8+UrBNtNRJb1AzRNeJuxa+F7irdO2Mk7Jla3suaHWX1FJfF2
         gMCCO6LtiK8/iCzhC6Z4eHccr+9nGz7c1WOhn78NXn4GdW0W3N0JGjJnbZ9Ai1yIrm7X
         jhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891762; x=1794496562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H4Mer0Lga1IOizNWXuhoug2hQz4DJn4K5PpD2JnRSys=;
        b=Usbp/LBzH/gUnZ5Yo55xS74M4geRLl7Slo+ENK5EeurPEW5Zjtftkh2xs2+6DgNlDV
         6CWR15S0QghvIyeT7QF9Wktg7XnV9KHZ4xSjZUnYXiotsN8UFtRJioQqZY5H7mOgzUYE
         Xgz7gq5WdJkqaZaHvUQTNNlG3nqJ9DH3pRO4Xw8Mek6zpKCMNL5u4X2FJiFwjqNbzOQi
         lHx8RBXX9dLENZJClB1daSrpA0ZBL0ThInNl/D6k0JgADKDGqiTExDv/rocOukpVjrgj
         ZtFgE5Zm6HQSPOeCJAJAJjyfW2HuSS3OKSTv/7dwsmzNWsYYmdFH18pgdjts3UDb9AsK
         1+bQ==
X-Forwarded-Encrypted: i=1; AKwUvBxC/2xH66JaNaJtBwJ2lAuKOqukN7HoaLQBuF0HxzsVXXtK2sFYfJWPGetbeFo3En4TnFEdIahev1wWCHI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8615K3aTFfwGziphFyLNo9LJ1WFCC/C/IADfC5G8bL75/jcxMk
	pCYtSAeWU1+h1VGe/nodptu+hygavBcVDNwCwTgCZGYKQXv7teXYppKZmtzEP0M7Id4=
X-Gm-Gg: AYBFou3jSiBbZwyH7xV3ZbB/N1U79RtwUBuiLQHrt/8/EO3/5a5tous+2KWWX5DV6Pg
	nd37902hQ7veP2gpU/e/UYuMuh5ka8jL9t2Tp0v+uiT9MKCJzm+fUidvOL1NFSuqiKqfL2Cfty7
	Z5YxNBJz3lOO+FMb8OR1fdnL/M+ubuoUV8HhTroFR6JGDELD+huJ2US9o567WRY74myshWsROIz
	ZpbuhYBKIzPYNTzoT78Dye20RwDvQ3MSd/LVkpU/492xW8SfKlg9wfVUAcIyngiGupvPz+/wMPx
	CCJ0yiaYIguycty4WMQyY+p+3Op6Q+D6cSGsFogl61Ov1Re9Pr5/1/tW4/LWiDcfXa0cykPHI7O
	nM77gH7zk4rzHugDRK1HEHFSYB0CfyBl1b3DWGy338ddncxMBAabR8ebMM7sqQb++YIQOEWWFEx
	swsy8kWxdQQYtf6HRzSh9l9rMi9YpiM099hMHfzzHgZTK94CeFPMaPLrkiJtyOOdYzMwmibPbZA
	r1g5wCpomM72aJ0cNBF+AUEKJXzr/gPxsRz18InweSfCS07FbdBWC1wuKID22coFyShzQHoOS0z
	nqlM9tGnA0B2alCX9oZu3gskRFs2U5bOGTRrTfivfHOARg==
X-Received: by 2002:a05:620a:1a08:b0:93c:9d56:a860 with SMTP id af79cd13be357-944217439e4mr3208698385a.19.1793891762448;
        Thu, 05 Nov 2026 07:16:02 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.245])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d468c574sm478328785a.6.2026.11.05.07.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:16:01 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:35 +0000
Subject: [PATCH RFC v3 43/90] pidfd: let pidfd_configure() set credentials
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
Message-Id: <20261105-b4-cells-v3-43-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890934; l=6052;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=xCOzpfBWllVdE4yMVFqvejvqNl2LulCdnNMFvhJsFR8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIDvwxZxncMYV40si2e99c3SO8+1/aH1vOhFmxmw64uRXS+2sj/KslaWVYs6FVtmRBEV6htKg8y
 WHl1V0Uc+WQ0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A task that is spawned into a cell starts as uid 0 of the cell. Add a way
to start it as another user. PIDFD_SET_BINARY with the key "cred" takes a
struct pidfd_cred that holds a uid, a gid and supplementary groups, all
given as ids of the cell.

The credentials are applied in the context of the new task. The task loses
its capabilities in the process, as it would with a setresuid() away from
uid 0.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/uapi/linux/pidfd.h |  10 ++++
 kernel/embryo.c            | 116 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 126 insertions(+)

diff --git a/include/uapi/linux/pidfd.h b/include/uapi/linux/pidfd.h
index c01bce5e17ad..e1f6d27bb220 100644
--- a/include/uapi/linux/pidfd.h
+++ b/include/uapi/linux/pidfd.h
@@ -24,6 +24,16 @@ enum pidfd_configure_cmd {
 	PIDFD_SET_FD		= 2,	/* The file to have at number @key, from fd @aux */
 	PIDFD_CMD_START		= 3,	/* Make the task, apply everything and exec */
 };
+
+/* pidfd_configure(PIDFD_SET_BINARY, "cred"). Ids are those of the new task. */
+struct pidfd_cred {
+	__u32 uid;
+	__u32 gid;
+	__u32 ngroups;
+	__u32 __spare;
+	__aligned_u64 groups;	/* pointer to @ngroups __u32 gids */
+};
+
 /* Flags for pidfd_send_signal(). */
 #define PIDFD_SIGNAL_THREAD		(1UL << 0)
 #define PIDFD_SIGNAL_THREAD_GROUP	(1UL << 1)
diff --git a/kernel/embryo.c b/kernel/embryo.c
index 2c65a99eaeea..0ad85cd2b865 100644
--- a/kernel/embryo.c
+++ b/kernel/embryo.c
@@ -69,8 +69,14 @@ struct embryo {
 	struct embryo_fd	fds[EMBRYO_MAX_FDS];
 	unsigned int		nr_fds;
 
+	bool			have_cred;
+	kuid_t			uid;
+	kgid_t			gid;
+	struct group_info	*groups;
+
 	struct pid		*pid;		/* the reference alloc_pid_struct() returned */
 	struct cell		*cell;		/* where the task is going to be */
+	struct user_namespace	*user_ns;	/* likewise */
 
 	int			result;
 	struct completion	done;		/* embryo -> starter */
@@ -124,6 +130,9 @@ static void embryo_drop_config(struct embryo *e)
 	embryo_strings_free(&e->argv);
 	embryo_strings_free(&e->envp);
 	embryo_put_fds(e);
+	if (e->groups)
+		put_group_info(e->groups);
+	e->groups = NULL;
 }
 
 static void embryo_put(struct embryo *e)
@@ -132,6 +141,7 @@ static void embryo_put(struct embryo *e)
 		return;
 
 	embryo_drop_config(e);
+	put_user_ns(e->user_ns);
 	cell_put(e->cell);
 	kfree_rcu(e, rcu);
 }
@@ -143,6 +153,52 @@ static void embryo_detach(struct embryo *e)
 	embryo_put(e);
 }
 
+static int embryo_apply_cred(struct embryo *e)
+{
+	const struct cred *old = current_cred();
+	struct user_struct *user;
+	struct cred *new;
+	int ret;
+
+	if (!e->have_cred)
+		return 0;
+
+	new = prepare_creds();
+	if (!new)
+		return -ENOMEM;
+
+	new->uid = new->euid = new->suid = new->fsuid = e->uid;
+	new->gid = new->egid = new->sgid = new->fsgid = e->gid;
+	if (e->groups)
+		set_groups(new, e->groups);
+
+	ret = -EAGAIN;
+	user = alloc_uid(e->uid);
+	if (!user)
+		goto err;
+	free_uid(new->user);
+	new->user = user;
+
+	/* Leaving uid 0 behind costs the capabilities, as setresuid() would. */
+	ret = security_task_fix_setuid(new, old, LSM_SETID_RES);
+	if (ret)
+		goto err;
+	ret = security_task_fix_setgid(new, old, LSM_SETID_RES);
+	if (ret)
+		goto err;
+	ret = security_task_fix_setgroups(new, old);
+	if (ret)
+		goto err;
+	ret = set_cred_ucounts(new);
+	if (ret)
+		goto err;
+	return commit_creds(new);
+
+err:
+	abort_creds(new);
+	return ret;
+}
+
 static int embryo_exec(struct embryo *e)
 {
 	static const char * const no_strings[] = { NULL };
@@ -150,6 +206,9 @@ static int embryo_exec(struct embryo *e)
 	int ret;
 
 	ret = embryo_install_fds(e);
+	if (ret)
+		return ret;
+	ret = embryo_apply_cred(e);
 	if (ret)
 		return ret;
 
@@ -286,6 +345,7 @@ int embryo_pidfd_open(int cfd, unsigned int flags)
 	}
 	e->pid = alloc_pid_struct(cell_nsproxy(cell)->pid_ns_for_children);
 	e->cell = cell_get(cell);
+	e->user_ns = get_user_ns(cell_user_ns(cell));
 	cell_fork_finish(cell);
 
 	ret = -ENOMEM;
@@ -389,6 +449,60 @@ static int embryo_set_strings(struct embryo_strings *s, const void __user *ubloc
 	return 0;
 }
 
+static int embryo_set_cred(struct embryo *e, const void __user *uvalue, size_t len)
+{
+	struct group_info *groups = NULL;
+	struct pidfd_cred tc;
+	kuid_t uid;
+	kgid_t gid;
+	u32 i;
+
+	if (len != sizeof(tc))
+		return -EINVAL;
+	if (copy_from_user(&tc, uvalue, sizeof(tc)))
+		return -EFAULT;
+	if (tc.__spare || tc.ngroups > NGROUPS_MAX)
+		return -EINVAL;
+
+	/* The ids are the cell's own. One it does not have cannot be named. */
+	uid = make_kuid(e->user_ns, tc.uid);
+	gid = make_kgid(e->user_ns, tc.gid);
+	if (!uid_valid(uid) || !gid_valid(gid))
+		return -EINVAL;
+
+	if (tc.ngroups) {
+		const u32 __user *ugroups = u64_to_user_ptr(tc.groups);
+
+		if (!userns_may_setgroups(e->user_ns))
+			return -EPERM;
+		groups = groups_alloc(tc.ngroups);
+		if (!groups)
+			return -ENOMEM;
+		for (i = 0; i < tc.ngroups; i++) {
+			u32 g;
+
+			if (get_user(g, ugroups + i)) {
+				put_group_info(groups);
+				return -EFAULT;
+			}
+			groups->gid[i] = make_kgid(e->user_ns, g);
+			if (!gid_valid(groups->gid[i])) {
+				put_group_info(groups);
+				return -EINVAL;
+			}
+		}
+		groups_sort(groups);
+	}
+
+	if (e->groups)
+		put_group_info(e->groups);
+	e->groups = groups;
+	e->uid = uid;
+	e->gid = gid;
+	e->have_cred = true;
+	return 0;
+}
+
 /*
  * The file table of the new task is exactly what is put here. After this
  * nothing crosses the boundary of the cell any more, so this is where it is
@@ -576,6 +690,8 @@ SYSCALL_DEFINE5(pidfd_configure, int, pidfd, unsigned int, cmd,
 			ret = embryo_set_strings(&e->argv, uvalue, aux);
 		else if (!strcmp(key, "envp"))
 			ret = embryo_set_strings(&e->envp, uvalue, aux);
+		else if (!strcmp(key, "cred"))
+			ret = embryo_set_cred(e, uvalue, aux);
 		else
 			ret = -EINVAL;
 		break;

-- 
2.55.0

