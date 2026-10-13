Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7F84FDE5A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791893142; cv=none; b=HIuFuEEULrPyCsAZ1DTv+zNEiLYTwyjhZO+YHPAzPOnLUn4c/mDXdUCkmciZ4HltOcBYMYPPfErM+Whmz3qrqfsmf/sxIQBply51O9Q7x7KQI21MiafWh80O146KsJAkqjx0JrLtQjsxmic/VOFRwtidn+ICu66y18ZjHlz1IXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791893142; c=relaxed/simple;
	bh=WBpETlJAu4LzRE6306m7fvpnXID4MXuxdtI/fwrynjs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AdIHd7bNetqJHlYYc71VWqaq/56K7fFyXHllJTL040Tn9bZGFxoS2q9T+PHY+sStv5apKAJ3TNfut5Jflx6L0mZljOAhTj3JhfqWdeDA3RuYn7XOfu4DoywDaJxBhd2OQVMFJ+ucvqs4ddUdd/DPm2f8sVzCz5Fc3wVjBs+9DE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxL1HhXI; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxL1HhXI"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e901e114fdso6111225ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791893139; x=1792497939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yQe/2g1WG+euTajMh6TueRGLUyRtyPnNyRQAOr8Frkw=;
        b=jxL1HhXIIz49ZqjqEALbx99yR+XfcwXIOnyflOrCwsW+tvezyXCsI9xEIzj9BrTjDG
         Ahk2H7AUZ+aR78thse64xFnHFy9kFseKY6wi/MSWS7FFg8Dy15jeIfcV4hozRYFwX7go
         lV4n8yEDIWzw1bccb8wp4LD8UZO3bYG5kOEmToRH0qxtp+vtdLjRSC7yXVceH2mtWy9W
         lFiWI8BakbGqp5+Yzzx/l74aCE5TaisQe9CKmRVHx6ZRTVR90SiotUzhTzKU5nmPqnwC
         qNcYnij+HwL6Q4dR5vCNxPFUbMbmh6rKdQXG2VCQ3vk1zoKVz5G5FRmunrpmV2779sb5
         LDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791893139; x=1792497939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQe/2g1WG+euTajMh6TueRGLUyRtyPnNyRQAOr8Frkw=;
        b=Y9nXLy8KJJSY1UCm1XWXTxAkmXq9y1qHSvarfGnUEyn+egthLtvROv0ptk8GlTP7lg
         j/8w7KsYX3Hb9VPC4ZqJUb1w0jIK1Qy11IZHwr13rw75g2jIww8I6KVkt4IFiHsY7psV
         BFI+vDG0W+11qNf/GLgyfSU7JxBD9QrMM5fhkMKXxqR39JBbL6XbfIBx/7BplgPCn1Ny
         yNG+ebCZHzwPAfxYN15uOql/oltCeUFbj3+I+KSIRfxbeI+5sykxYHBYpu7bnpWh42o7
         OJh9788Ia0gFcO5hvBPo+xBEuyK1nFFRsbEAQjBDkW4aN/5Ic3dyo9560k3tCtLXdsez
         GXLw==
X-Forwarded-Encrypted: i=1; AKwUvBwVwMV3dtyNKEutthJVOARynQYrMeuz3HyU+X8JOSoQP76G+clw93z4Jc9r3AV1yeV8tWKieO9C8ZzNrBQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+O42UUtrMHXXumjjHo4Ogph+X6PAWuvyHUjVMpmmGfGUc2TTR
	ojCKiN6H2tPBdwhVRB8kNwA6ajgfxMOVLkwAAUJrfAQC0tjsPeS0Bg/c
X-Gm-Gg: AYBFou285+Z1WWI3Eh6xQxbnDcsLq1dsnEDCsJ9Fbvn56u6A8ORHUwDYoDqpExM39PT
	48z5j2Nej8Ol8V5wy83vn5jP74RYuGbddy85P92L+TSbkx+fP8qyajjufr4Y2q5xAGcbRvCkWxO
	dDo9t6ezto0GDx9uBdliSDu20+HSl0rixoyrZQ/nD+6K+uCvbGsgSN/9Ze2DXVhSeA0spLoH/t6
	HUObIcknJynDBD+uZnXh9d4qRnbWV0qkRnfRFZjU48+5PfHuLeg7guWRTmpaey5+LGyo5O246Mw
	bX/U2EzcKlq8Or600hJ91HTsIaIsNKwOd1XamSa2NRbpze7cfxZNx8wcJb3LBdbcFSisUJ4nwdB
	Kgs1z8+VKrLJb+s83Dh5tTBizPllhm62WrvQktGh7ot+9WmsZ7bcJhoLXuAI7cTY9C4repOMqPW
	p+n3P3S8IsyxXzjCHLeQLTPHZJHn7h2XKByqnz97c5eCaJVHMANGjOLbSChXBB9RPQclvwhqB1n
	ndp7zeM9hqgWb1y9/DipSLwSvcy7T4U6WnGsj0tN7JQvqB6L3G9NShx8iogyjW5hGXCS0OVxvBQ
	vPUs/KLUQqAZCiEX6zZSb6a4qlLE/1OLRofzlP9Ikmy+EUho
X-Received: by 2002:a17:902:e842:b0:2df:8733:f229 with SMTP id d9443c01a7336-2e84eef2b9emr101557105ad.24.1791893138781;
        Tue, 13 Oct 2026 05:05:38 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a04012sm55312855ad.1.2026.10.13.05.05.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 05:05:37 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mike Christie <michael.christie@oracle.com>,
	Dmitry Bogdanov <d.bogdanov@yadro.com>,
	Yu Zhang <yuz08559@gmail.com>
Subject: [PATCH] scsi: target: fix demo-mode dynamic ACL dev-entry UAF vs LUN teardown
Date: Tue, 13 Oct 2026 22:05:28 +1000
Message-ID: <20261013120528.37749-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A demo-mode (generate_node_acls=1) login that allocates a dynamic
NodeACL populates that ACL's per-LUN dev entries in
core_tpg_add_node_to_devs() *before* the ACL is linked onto
tpg->acl_node_list by target_add_node_acl():

	core_tpg_check_initiator_node_acl():
		...
		core_tpg_add_node_to_devs(acl, tpg, NULL); /* builds deves */
		target_add_node_acl(acl);                  /* only now listed */

The LUN teardown sweep, core_clear_lun_from_tpg(), enumerates only
tpg->acl_node_list:

	list_for_each_entry(nacl, &tpg->acl_node_list, acl_list) {
		mutex_lock(&nacl->lun_entry_mutex);
		hlist_for_each_entry_rcu(deve, &nacl->lun_entry_hlist, link) {
			if (lun != deve->se_lun)
				continue;
			core_disable_device_list_for_node(lun, deve, nacl, tpg);
		}
		...
	}

so a dev entry whose ACL is still in the window above is invisible to
the sweep and is never disabled.  It is left on the
se_lun->lun_deve_list after core_tpg_remove_lun() frees the se_lun.
When the same unpacked_lun is later re-added and the se_lun is
reallocated at the same address, the stale dev entry is rediscovered by
target_nacl_find_deve() (which matches on mapped_lun) and
core_enable_device_list_for_node() takes the replace branch:

	spin_lock(&lun->lun_deve_lock);
	list_del(&orig->lun_link);	/* corrupts lun_deve_list */

corrupting the freed/reused list.  With list hardening this fires as:

  Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
  RIP: __list_del_entry_valid_or_report+0x105/0x140
  Call Trace:
   core_enable_device_list_for_node+0x5ce/0x880
   core_tpg_add_node_to_devs+0x169/0x190
   core_dev_add_lun+0x146/0x190
   target_fabric_port_link+0xe9/0x1b0
   configfs_symlink+0x381/0xae0
   __x64_sys_symlink+0x55/0x80
  list_del corruption. prev->next should be ffff888005d7ba80,
    but was ffff88800249a580. (prev=ffff888006e23820)

The demo-mode login path that drives the ACL/dev-entry creation is
reachable by an unauthenticated initiator (the work runs during
first-stage login negotiation, before authentication); the colliding
LUN add/remove is a local configfs operation.

Commit 49cb77e297dc ("target: Avoid mappedlun symlink creation during
lun shutdown") introduced se_lun->lun_shutdown and guarded the
*explicit* ACL MappedLUN path (target_fabric_mappedlun_link()), but the
demo-mode automatic path, core_tpg_add_node_to_devs() ->
core_enable_device_list_for_node(), was never given the equivalent
guard, and the publish-after-populate ordering in
core_tpg_check_initiator_node_acl() was left unchanged.

Fix both halves, which are each necessary:

 1) Publish the dynamic NodeACL onto acl_node_list *before* creating
    its dev entries, so the teardown sweep can observe them.  On its
    own this still races: the sweep may pass the ACL before the dev
    entry is added.

 2) Refuse to attach a dev entry to an se_lun that is shutting down,
    checked under nacl->lun_entry_mutex -- the same lock the sweep
    takes.  Because core_tpg_remove_lun() sets lun_shutdown before the
    sweep, once the sweep has passed a given ACL any later enable for
    that LUN observes lun_shutdown and skips it, so no dev entry can be
    left dangling on the lun_deve_list of an se_lun about to be freed.

core_tpg_add_node_to_devs() already ignores the return value of
core_enable_device_list_for_node(), so a shutting-down LUN is simply
skipped.

Note: moving target_add_node_acl() earlier makes a concurrent lookup
for the same InitiatorName observe the ACL slightly before its demo
MappedLUNs are populated; this transient was already possible between
the two original calls and is harmless, but flagging it for review.
The precise lock chosen to publish/observe lun_shutdown is open to
maintainer preference.

Fixes: 49cb77e297dc ("target: Avoid mappedlun symlink creation during lun shutdown")
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
Tested-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/target/target_core_device.c | 13 +++++++++++++
 drivers/target/target_core_tpg.c    | 10 +++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/target/target_core_device.c b/drivers/target/target_core_device.c
index 1111111..2222222 100644
--- a/drivers/target/target_core_device.c
+++ b/drivers/target/target_core_device.c
@@ -349,6 +349,19 @@
 	new->attach_count++;
 
 	mutex_lock(&nacl->lun_entry_mutex);
+	/*
+	 * Do not attach a new dev entry to an se_lun that is being torn down.
+	 * lun_shutdown is set by core_tpg_remove_lun() before its
+	 * core_clear_lun_from_tpg() sweep; checking it here under the same
+	 * nacl->lun_entry_mutex the sweep takes guarantees that once the sweep
+	 * has passed this ACL no dev entry can be left dangling on the
+	 * se_lun->lun_deve_list that is about to be freed.
+	 */
+	if (lun->lun_shutdown) {
+		mutex_unlock(&nacl->lun_entry_mutex);
+		ret = -ENODEV;
+		goto free_stats;
+	}
 	orig = target_nacl_find_deve(nacl, mapped_lun);
 	if (orig && orig->se_lun) {
 		struct se_lun *orig_lun = orig->se_lun;
diff --git a/drivers/target/target_core_tpg.c b/drivers/target/target_core_tpg.c
index 3333333..4444444 100644
--- a/drivers/target/target_core_tpg.c
+++ b/drivers/target/target_core_tpg.c
@@ -267,6 +267,15 @@
 	acl->dynamic_node_acl = 1;
 
 	/*
+	 * Publish the dynamic NodeACL on tpg->acl_node_list before creating
+	 * its demo-mode MappedLUN dev entries below, so that a concurrent LUN
+	 * teardown sweep (core_clear_lun_from_tpg(), which walks acl_node_list)
+	 * can observe and disable those dev entries.  Otherwise a dev entry can
+	 * be left on an se_lun->lun_deve_list that is about to be freed.
+	 */
+	target_add_node_acl(acl);
+
+	/*
 	 * Here we only create demo-mode MappedLUNs from the active
 	 * TPG LUNs if the fabric is not explicitly asking for
 	 * tpg_check_demo_mode_login_only() == 1.
@@ -275,7 +284,6 @@
 	    (tpg->se_tpg_tfo->tpg_check_demo_mode_login_only(tpg) != 1))
 		core_tpg_add_node_to_devs(acl, tpg, NULL);
 
-	target_add_node_acl(acl);
 	return acl;
 }
 EXPORT_SYMBOL(core_tpg_check_initiator_node_acl);
-- 
2.43.0
