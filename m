Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464FE49F134
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999036; cv=none; b=jmsn1K7f/Vk4z9UGEfanpCHzZmVqMXH4O4oX0sJbTN+slTtrqHaX0AAR8T8J1pi+ArHegqvmhRInwznE1IE0Uk/3sk43zlYzmiWEKx6abVqbPH74lyCOXdNyYwsWoIeIq5zW7r6oUlZhHwVz1T4Whirh8vM5Z8we/Z3Ddnr4U6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999036; c=relaxed/simple;
	bh=5KhJ7Zg9R8t/i/clFO6bwYjYMFQenzv/pH6dLTfsQeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jxMlYlGioiIDY/t9e6I7IBWoWyNkP6SgJyD0OXVaiughSi/vY5QyFeUm5uowjFLEospTVu26f+K7GnuoVz/z2rt2OtkvYVpnxmLyIDuFtaclSgSves9Acjg92NhaDZ8Hvkph5cWcMdSPe0lCAMVG0TXzfGTNNqQ0bnikVRY95UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jZPOr1nG; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jZPOr1nG"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E2061CE0;
	Mon, 21 Sep 2026 06:57:10 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EF9A93F528;
	Mon, 21 Sep 2026 06:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789999033; bh=5KhJ7Zg9R8t/i/clFO6bwYjYMFQenzv/pH6dLTfsQeY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jZPOr1nGPUEflXtUV/wNu7a5klt/H6AVrd2IhOWtOHBrA6TvZqBYY4s/MvGGsTC8t
	 b03jN8b+vp+D2S6SJDEpofvnUEsPyhv/S+hzOp+zk05b4PGREWHAxtGZ1NdQf2P3r9
	 mfJyRCeMcktLGuoKaP037+PCTSBUmP+l+I6Nkh/k=
From: Ben Horgan <ben.horgan@arm.com>
To: reinette.chatre@intel.com
Cc: Dave.Martin@arm.com,
	babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	fenghuay@nvidia.com,
	fustini@kernel.org,
	james.morse@arm.com,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	tglx@linutronix.de,
	tony.luck@intel.com,
	x86@kernel.org,
	yu.c.chen@intel.com
Subject: [RFC PATCH 1/3] fs/resctrl: Add schema_name to struct resctrl_ctrl
Date: Mon, 21 Sep 2026 14:57:00 +0100
Message-ID: <20260921135702.2874931-2-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921135702.2874931-1-ben.horgan@arm.com>
References: <d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com>
 <20260921135702.2874931-1-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to properly align the schema in the schemata and size file the
maximum of length of all the schema names needs to be
known. resctrl_resource_ctrl_max_len() makes this calculation but stops
short of actually constructing and storing the schema names. As the schema
name is based on the resource name and the schema name with some special
cases for legacy controls this leads to a lot of conditional formatting
when displaying the schema name.

Construct the schema name and save it to struct resctrl when mounting
resctrl. This makes displaying the schema name easy whilst control of the
naming stays within resctrl.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 fs/resctrl/ctrlmondata.c | 51 ++++++-----------------------
 fs/resctrl/rdtgroup.c    | 69 +++++++++++++++++++++++++---------------
 include/linux/resctrl.h  |  1 +
 3 files changed, 55 insertions(+), 66 deletions(-)

diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 675531009136..efeb36e0db25 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -379,6 +379,9 @@ int resctrl_prefix_width_adjust(struct resctrl_ctrl *ctrl)
 {
 	int len;
 
+	if (resctrl_ctrl_is_default(ctrl))
+		return max_name_width;
+
 	len = max_name_width - 1 - strlen(resctrl_ctrl_name_str(ctrl->name));
 	if (len < 0)
 		return 0;
@@ -456,33 +459,6 @@ static struct resctrl_ctrl *resctrl_resource_ctrl_get(struct rdt_resource *r,
 	return NULL;
 }
 
-/*
- * Return length needed to display longest control suffix.
- * Add 1 for the "_" character when control name exists.
- */
-size_t resctrl_resource_ctrl_max_len(struct rdt_resource *r)
-{
-	struct resctrl_ctrl *ctrl, *em_ctrl;
-	size_t total = 0;
-	size_t len;
-
-	for_each_resource_ctrl(ctrl,r) {
-		/* Remove duplicate code. */
-		len = strlen(resctrl_ctrl_name_str(ctrl->name));
-		if (len)
-			total = max(total, 1 + len);
-		if (list_empty(&ctrl->emulated_by))
-			continue;
-		list_for_each_entry(em_ctrl, &ctrl->emulated_by, entry) {
-			len = strlen(resctrl_ctrl_name_str(em_ctrl->name));
-			if (len)
-				total = max(total, 1 + len);
-		}
-	}
-
-	return total;
-}
-
 static int rdtgroup_parse_ctrl(char *ctrlname, char *tok,
 			       struct rdtgroup *rdtgrp)
 {
@@ -595,14 +571,8 @@ static void show_doms(struct seq_file *s, struct rdt_resource_final *f,
 	/* Walking ctrl->domains, ensure it can't race with cpuhp */
 	lockdep_assert_cpus_held();
 
-	if (print_ctrl) {
-		if (resctrl_ctrl_is_default(ctrl)) {
-			seq_printf(s, "%*s:", max_name_width, f->name);
-		} else {
-			seq_printf(s, "%*s_%s:", resctrl_prefix_width_adjust(ctrl),
-				   f->name, resctrl_ctrl_name_str(ctrl->name));
-		}
-	}
+	if (print_ctrl)
+		seq_printf(s, "%*s:", max_name_width, ctrl->schema_name);
 	list_for_each_entry_rcu(dom, &ctrl->domains, hdr.list, lockdep_is_cpus_held()) {
 		if (sep)
 			seq_puts(s, ";");
@@ -638,18 +608,17 @@ int rdtgroup_schemata_show(struct kernfs_open_file *of,
 	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
 		list_for_each_entry(f, &rdt_resource_final_all, list) {
 			for_each_enabled_ctrl(ctrl, f->res)
-				seq_printf(s, "%s%s%s:uninitialized\n", f->name,
-					   resctrl_ctrl_is_default(ctrl) ? "" : "_",
-					   resctrl_ctrl_is_default(ctrl) ?
-					    "" : resctrl_ctrl_name_str(ctrl->name));
+				seq_printf(s, "%*s:uninitialized\n",
+					   max_name_width, ctrl->schema_name);
 		}
 	} else if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED) {
 		if (!rdtgrp->plr->d) {
 			rdt_last_cmd_puts("Cache domain offline\n");
 			ret = -ENODEV;
 		} else {
-			seq_printf(s, "%s:%d=%x\n",
-				   rdtgrp->plr->f->res->name,
+			ctrl = resctrl_resource_ctrl_get_default(f->res);
+			seq_printf(s, "%*s:%d=%x\n",
+				   max_name_width, ctrl->schema_name,
 				   rdtgrp->plr->d->hdr.id,
 				   rdtgrp->plr->cbm);
 		}
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 416b73c57016..deb47edb2e87 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1850,13 +1850,7 @@ static int rdtgroup_size_show(struct kernfs_open_file *of,
 		type = f->conf_type;
 		for_each_enabled_ctrl(ctrl, r) {
 			sep = false;
-			if (resctrl_ctrl_is_default(ctrl)) {
-				seq_printf(s, "%*s:", max_name_width, f->name);
-			} else {
-				seq_printf(s, "%*s_%s:", resctrl_prefix_width_adjust(ctrl),
-					   f->name,
-					   resctrl_ctrl_name_str(ctrl->name));
-			}
+			seq_printf(s, "%*s:", max_name_width, ctrl->schema_name);
 			list_for_each_entry_rcu(d, &ctrl->domains, hdr.list, lockdep_is_cpus_held()) {
 				if (sep)
 					seq_putc(s, ';');
@@ -3375,11 +3369,28 @@ static int rdt_enable_ctx(struct rdt_fs_context *ctx)
 	return ret;
 }
 
+static void update_max_name_width(struct rdt_resource *r, char *name)
+{
+	int cl = strlen(name);
+
+	/*
+	 * If CDP is supported by this resource, but not enabled,
+	 * include the suffix. This ensures the tabular format of the
+	 * schemata file does not change between mounts of the filesystem.
+	 */
+	if (r->cdp_capable && !resctrl_arch_get_cdp_enabled(r))
+		cl += 4;
+
+	if (cl > max_name_width)
+		max_name_width = cl;
+}
+
 static int final_resources_list_add(struct rdt_resource *r, enum resctrl_conf_type type)
 {
+	struct resctrl_ctrl *ctrl, *em_ctrl;
 	struct rdt_resource_final *f;
 	const char *suffix = "";
-	int ret, cl;
+	int ret;
 
 	f = kzalloc_obj(*f);
 	if (!f)
@@ -3409,24 +3420,32 @@ static int final_resources_list_add(struct rdt_resource *r, enum resctrl_conf_ty
 		return -EINVAL;
 	}
 
-	cl = strlen(f->name);
-
-	/*
-	 * Maintain tabular format by taking into account the names of all
-	 * the resource's controls.
-	 */
-	cl += resctrl_resource_ctrl_max_len(f->res);
-
-	/*
-	 * If CDP is supported by this resource, but not enabled,
-	 * include the suffix. This ensures the tabular format of the
-	 * schemata file does not change between mounts of the filesystem.
-	 */
-	if (r->cdp_capable && !resctrl_arch_get_cdp_enabled(r))
-		cl += 4;
+	for_each_resource_ctrl(ctrl, r) {
+		if (resctrl_ctrl_is_default(ctrl)) {
+			ret = snprintf(ctrl->schema_name, sizeof(ctrl->schema_name),
+				       "%s", f->name);
+		} else {
+			ret = snprintf(ctrl->schema_name, sizeof(ctrl->schema_name),
+				       "%s_%s", f->name, resctrl_ctrl_name_str(ctrl->name));
+		}
+		if (ret >= sizeof(ctrl->schema_name)) {
+			kfree(f);
+			return -EINVAL;
+		}
+		update_max_name_width(r, ctrl->schema_name);
 
-	if (cl > max_name_width)
-		max_name_width = cl;
+		if (list_empty(&ctrl->emulated_by))
+			continue;
+		list_for_each_entry(em_ctrl, &ctrl->emulated_by, entry) {
+			ret = snprintf(em_ctrl->schema_name, sizeof(em_ctrl->schema_name),
+				       "%s_%s", f->name, resctrl_ctrl_name_str(em_ctrl->name));
+			if (ret >= sizeof(em_ctrl->schema_name)) {
+				kfree(f);
+				return -EINVAL;
+			}
+			update_max_name_width(r, ctrl->schema_name);
+		}
+	}
 
 	INIT_LIST_HEAD(&f->list);
 	list_add(&f->list, &rdt_resource_final_all);
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 54fec07bd173..5be8991d45eb 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -437,6 +437,7 @@ struct resctrl_ctrl {
 	struct list_head	domains;
 	enum resctrl_ctrl_type	type;
 	enum resctrl_ctrl_name	name;
+	char			schema_name[32];
 	union {
 		struct resctrl_ctrl_bitmap	bitmap;
 		struct resctrl_ctrl_scalar	scalar;
-- 
2.43.0

