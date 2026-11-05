Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890708;
	b=wbh604K7auiafZx4VU547l229UKwENPXBQkD/ePeGN6McBP+DAqY0/wKtXnzL0V4uBQd
	 uDcMeVUGFiQf1W2Fa2sMTCPfph/leZ6ZpIqC16On9p26hdy38TptHwvRjfG9s9jBFAOjn
	 2nxP0GqLDwTyXYomNigBLUu82zpj59+6Io/uvpNXzbUCIsVPZJj0L8dj+ACtleUhm0B9V
	 oUr7ErBu5OqDfsniXcNiCHRkJeN3VdmKI3ELCBZLeTqtrP+HTqMgPUbm2nJ6JSwSShsIg
	 sBCdk6K7W7mmrFr8ekCacE531gQ+S7+sFzZhABE2D7m37NHXuHsHjYm3Im9uB5aRgyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=fv6eADMIHqv2yZnT+NZGhgBiOZjVmoiBo8vKGIylhO0=;
	b=5iiV6M2g6mZZKGt8iXSsjqkihpdCuCv58zQa6+pICUB98xgOsu+yu2vlx12WlW7Iflkz
	 3rDLQTzaKkHzhBUEy4yW1G6zI74MRu7JZcH5Wirreo69U+Oc6QZ8/KrI9Ig5FlVk+1HVh
	 mIkqV2XTVMNnrLgZDWtIRV7vkUu/e3NFjeKFJWzc7qe3xUBr3ph9pLLbez163UPHCG81W
	 H9iGQwvQLmhZa+7WBc2iOQyp89g39iJDQj7mo/0gClOGS7YsNtguauqfqNpsj48yP68Ur
	 HIZwluOq2U0t/m2RVGvsW3iORwl5UWuAFjCrKSNNjl7FzuC0Y50iAIFXEeou6GMVcYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=n+kU9QzN;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FB7606EEAA
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5FB7606EEAA
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=n+kU9QzN
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6aa9606ddadso1324424eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793890707; x=1794495507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fv6eADMIHqv2yZnT+NZGhgBiOZjVmoiBo8vKGIylhO0=;
        b=n+kU9QzNJs6GZkPG6kvTb9gSmT068vQDoCHYqKSDCmFfQ0ml/auy4uqaCOyc9//8CV
         aszFqHKOaQrNKkwAz6PcCseXcncmCcRYSsL+BRtnkw1Mkam/C4HVk1+oPULhi36IWn5X
         f9tzR2FD/jzQ9zlD9zBHAbnEZmdz4TAgufWMI9MpYH5VQPuzE9MzFN+PFqkXB0gusWNI
         rqw+D/Q2euOIngFKfpZ1kKqgTUCKurgXoSh1vit+AGUiQ4+KDsJPG9bdDUFR5Wtr47My
         Lhl+su7HCy37KUa06rS8torOz9e0itF4opjycqJ2xmMuBywf+xrpv+ic9ExwM7EgVm2V
         cdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890707; x=1794495507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fv6eADMIHqv2yZnT+NZGhgBiOZjVmoiBo8vKGIylhO0=;
        b=WsTrmUFfKnz/xp3pWVyQpilO8py/ylRgYcmlIrUz4hJw0/0x9T0OBwT6xqqtSy+IDi
         UqbsQdOWO9eK43kCrTqvhoyeN46JFMHTf1n4WjZupiqw2io4f7rCQrQUk+0C/WcIPCHZ
         q27tw8sp/jdyNceNtQUcyacnulKe9zf21WovT6wLS5Kv1KvcvdAnLpi1m6VqFRbgCXCA
         zsscKbMty5PpUoYBQPZXpiRhdh2+EFhk+n4asrmQSzOq2C3WTyP3PrZ2Pt7WDjTDgvSm
         8DdWi3nhO30uZruYGglTdd22RygnnbLhQtZNvCn5IvXNlfWbAJLwib63dbceHpg4nIuJ
         Zuxw==
X-Forwarded-Encrypted: i=1; AKwUvBwPpk1p8RSzc44hyjNhze8hTiRgdrYFqmdQ3GazXG8ZDSymytTtXE/wccD0g4CoOgW8rQya5Qpc38oEIY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XITdXiXkN1vPAvUYp+oBzQcbOx9TGmG5Oo7BVr7c8K5rzR0/e
	g1iH+oxuw5yKBx9DlgZRKeyfQZAnIfMOwnJ7PX4dgEG+rFNmxaQuORW5p3feUnOwcF8=
X-Gm-Gg: AYBFou1E+QujpIakg8UG+5JGSPRifmYHUv1GuCjcq3p/KFvMQH62TAFp/6UUfHM2tu5
	+9Nn9PXIYrspKd7liD4ZEYlnVWPzzcHRk3Kd9PRwxeCIrEStEMUpqS+iKycsQb9phxq0l6Aowle
	aD02Ny5qTzUI2PhGdwt86O0AFSFTlAb21PBzQFdqcjwmL48ASVtRfPQ4R50RraNXp+BE0xqZKdm
	mdPFlkpHZvd99aI6W//31xvat/wf8Qwv8s7OK6iHwqx4/hzKK6Df6GkMIHw9j37bP9TrUNadeIm
	l+gXJI9bB4lGH+ykJa/gVfk8ikWERUvKTsJ091jAE7s20MaUa0i+OuubJ+tlIl/5hDVZu/iU7be
	I2/BBny74aNlwAUH/bHh0BcVhobJrNzMM2o+cqJ+CHjBn6G/8MZzU+VI6gz8hHn6i645Mgd2AFc
	OB2ukx6g+KGBb8Xb/jcoYgVAZAlDsE3RbG7DywhqXRnQ5VEOx1IYPy25oMVLND9PT8uMAD4vTFk
	LBXH8f170GXvyK11zFPNVr62DtYOZyF99YAVLLuXy/anAPn/g8AcZ7DeBpbo8nC3BgLT0L0LV/v
	2+VZCk1C6nDzR1lExcOLxHfD7B+qVUkkizvmF9oX9ILTew==
X-Received: by 2002:a05:6820:a28f:20b0:716:c34d:c2b4 with SMTP id 006d021491bc7-716c34dc90bmr2346309eaf.78.1793890706669;
        Thu, 05 Nov 2026 06:58:26 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acd5293de9sm4626402fac.2.2026.11.05.06.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:58:26 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 14:57:07 +0000
Subject: [PATCH RFC v3 16/90] cgroup: let a cgroup become the budget of a
 cell
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
Message-Id: <20261105-b4-cells-v3-16-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890670; l=4775;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=HX8kVvVnrGiQT8dJrIDTJrXEajtmPQU0c9iSmryWYsU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOnQJhxy6HQSuRz2MuMdttF8jocsXSsbmkFD4sB1nJg5XaS0yqjv3C5z1EWxXcu8Eh0Z5Ny7LZC
 fb21PvQgNFQM=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A cell needs a limit on the resources it can use, and a way to find every
task in it, including forks that are in flight. A cgroup provides both.

Add cgroup_cell_budget_get(). It takes a cgroup2 directory as the budget
of a cell and marks it with CGRP_CELL_BUDGET.

From then on, holding the cellfd is enough to put a task into that cgroup.
So the caller is checked here instead. It must pass every check that
moving one of its own tasks into the cgroup would require, and it must own
the directory.

Killing a cell kills everything in its budget, so a budget can only belong
to one cell. The cgroup must be empty, must have no children, and must not
be the budget of another cell or lie inside of one.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/cgroup-defs.h |  3 ++
 include/linux/cgroup.h      |  2 ++
 kernel/cgroup/cgroup.c      | 82 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 87 insertions(+)

diff --git a/include/linux/cgroup-defs.h b/include/linux/cgroup-defs.h
index cbfe8937647c..4626adbf45d6 100644
--- a/include/linux/cgroup-defs.h
+++ b/include/linux/cgroup-defs.h
@@ -72,6 +72,9 @@ enum {
 
 	/* Cgroup is frozen. */
 	CGRP_FROZEN,
+
+	/* Cgroup is the budget of a cell. */
+	CGRP_CELL_BUDGET,
 };
 
 /* cgroup_root->flags */
diff --git a/include/linux/cgroup.h b/include/linux/cgroup.h
index 2afb4cb2bb4f..a5ef01688e7f 100644
--- a/include/linux/cgroup.h
+++ b/include/linux/cgroup.h
@@ -152,6 +152,8 @@ struct cgroup_subsys_state *css_tryget_online_from_dir(struct dentry *dentry,
 
 struct cgroup *cgroup_get_from_path(const char *path);
 struct cgroup *cgroup_get_from_fd(int fd);
+
+struct cgroup *cgroup_cell_budget_get(struct file *file, kuid_t *uid, kgid_t *gid);
 struct cgroup *cgroup_v1v2_get_from_fd(int fd);
 
 /* Was this controller blocked from v1 hierarchies by cgroup_no_v1= ? */
diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index a284225f8dc9..c4bbb70f490f 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -7044,6 +7044,88 @@ static void cgroup_css_set_put_fork(struct kernel_clone_args *kargs)
 	}
 }
 
+#ifdef CONFIG_CELLS
+/**
+ * cgroup_cell_budget_get - take a cgroup as the budget of a cell
+ * @file: a cgroup2 directory
+ * @uid:  returns who owns it now
+ * @gid:  likewise
+ *
+ * From here on holding the cellfd is all it takes to put a task into the
+ * cgroup, and sealing the cell hands the cgroup to the cell's root. So whoever
+ * fills the slot must be allowed both: everything moving a task of its own
+ * there would take, and ownership of the directory.
+ *
+ * Killing the cell kills everything in the cgroup. So it must be empty, have no
+ * children, and neither be nor lie within the budget of another cell.
+ *
+ * Return: the cgroup, marked as a budget and with a reference, both for
+ * cgroup_cell_budget_put() to undo, or an ERR_PTR(). Among the errors are
+ * -EBADF if @file is no cgroup2 directory, -EPERM or -EACCES if the caller may
+ * not, -EBUSY if the cgroup will not do and -ENODEV if it is dead.
+ */
+struct cgroup *cgroup_cell_budget_get(struct file *file, kuid_t *uid, kgid_t *gid)
+{
+	struct super_block *sb = file->f_path.dentry->d_sb;
+	struct cgroup *cgrp, *anc;
+	struct css_set *cset;
+	struct kstat stat;
+	int ret;
+
+	cgrp = cgroup_get_from_file(file);
+	if (IS_ERR(cgrp))
+		return cgrp;
+
+	/* Also brings the inode up to date with the kernfs node. */
+	ret = vfs_getattr_nosec(&file->f_path, &stat, STATX_UID | STATX_GID, 0);
+	if (ret) {
+		cgroup_put(cgrp);
+		return ERR_PTR(ret);
+	}
+
+	cgroup_lock();
+
+	spin_lock_irq(&css_set_lock);
+	cset = task_css_set(current);
+	get_css_set(cset);
+	spin_unlock_irq(&css_set_lock);
+
+	ret = -ENODEV;
+	if (cgroup_is_dead(cgrp))
+		goto out;
+	ret = -EPERM;
+	if (!inode_owner_or_capable(&nop_mnt_idmap, file_inode(file)))
+		goto out;
+	ret = cgroup_may_write(cgrp, sb);
+	if (ret)
+		goto out;
+	ret = cgroup_attach_permissions(cset->dfl_cgrp, cgrp, sb, true,
+					current->nsproxy->cgroup_ns);
+	if (ret)
+		goto out;
+	ret = -EBUSY;
+	if (cgroup_is_populated(cgrp) || css_has_online_children(&cgrp->self))
+		goto out;
+	for (anc = cgrp; anc; anc = cgroup_parent(anc)) {
+		if (test_bit(CGRP_CELL_BUDGET, &anc->flags))
+			goto out;
+	}
+
+	set_bit(CGRP_CELL_BUDGET, &cgrp->flags);
+	*uid = stat.uid;
+	*gid = stat.gid;
+	ret = 0;
+out:
+	put_css_set(cset);
+	cgroup_unlock();
+	if (ret) {
+		cgroup_put(cgrp);
+		return ERR_PTR(ret);
+	}
+	return cgrp;
+}
+#endif /* CONFIG_CELLS */
+
 /**
  * cgroup_can_fork - called on a new task before the process is exposed
  * @child: the child process

-- 
2.55.0

