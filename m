Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.74.67.63
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676991;
	b=GYnra4txmFKRN/fwuGPM4KVPNI8B1+LzPFvayQ2CD//THKZZKzOzLd0sIeUqJM2PCHrF
	 A2BfZPMr0TeRXJKEKkt2F5+CxK0mFt19tbASJVUdo9zSUDjUHytaVXOAOBnB4pM3ho4J2
	 GMqq4xmCd5/Dr/R2nW72f/SLIdikAv5oLKmiVJosgofrezOIqWRCRpwuNt49ORGLfs+UO
	 G7fTrtIJFsZcS3oFyp3W+Mvf1/iDTsyuffhvSwmZF+WETyAp7uXQ5oXk/2T8g5lSwwVYR
	 truQywe7paTFekqiV8udUMsph16KwhZwwviqRKtf66Z6EVbfhEsKz49iBd5pUCfVNMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676991;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:DKIM-Signature;
	bh=6bJcvQHtL/4UbYgJFe6NESmKZgTL+XZ+piSAggxPAJw=;
	b=K9QuW+loGk78+ok2811XVeIcPuWDBBVCSWff/6fR6ioLiepfrNzHtJFEu1Mm8GOWZa4G
	 KABcfQNxfZUiKEZiDiME1F9SwnnerltsX5xmHXdpgHmGPDpJ3Q9sECDSGYmL8J3PKLTK3
	 Njzd6ifMpxZpFxgooLQgMT5gPLzEXyEg4bVZLD3fZJ1feIdixU1BUeihxkyWE6NDDIu7T
	 MxwICT+Zj4ZqJML3b7O58Zv8EAf9DThCqzfN+tfqXw81tuov1kBVNCfGJiTO8YZQb8KGc
	 k9KGC3EKhP62PUi5/SHfxQQK8WOBSb9QxTvNxG7UmXk6sBq1EycXaXnTLa8BjqiP/dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=poczta.fm;
	spf=pass smtp.mailfrom=poczta.fm;
	dkim=pass header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b="j55kopD/";
	arc=none smtp.remote-ip=217.74.67.63
Received: from smtpo63.interia.pl (smtpo63.interia.pl [217.74.67.63])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C09060A5BE3
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C09060A5BE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=poczta.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=poczta.fm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b=j55kopD/
Received: from localhost (unknown [80.68.231.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
	Thu, 22 Oct 2026 15:49:45 +0200 (CEST)
From: Slawomir Stepien <sst@poczta.fm>
To: gregkh@linuxfoundation.org,
	andrzej.p@samsung.com,
	jiashengjiangcool@gmail.com,
	yun.zhou@windriver.com,
	zzzccc427@gmail.com,
	bigeasy@linutronix.de,
	nab@linux-iscsi.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slawomir Stepien <sst@poczta.fm>,
	syzbot+2799146a53c356f8017d@syzkaller.appspotmail.com
Subject: [PATCH 1/3] usb: gadget: f_tcm: take the TPG in tcm_bind() instead of tcm_alloc()
Date: Thu, 22 Oct 2026 15:49:24 +0200
Message-ID: <20261022134926.1125473-1-sst@poczta.fm>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.fm; s=dk;
	t=1792676988; bh=6bJcvQHtL/4UbYgJFe6NESmKZgTL+XZ+piSAggxPAJw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=j55kopD/6JFBVXTmYhI/Ph2rARHpZ4lxPwFDk0FWVX7NV7Lnc9WZwvNuyghjoKXdM
	 v6XUZAKmX1ED5MRum+mHlNm7TI8GtuKe6c0QEldD7vtEZw0GMSghsrYeKgoxwTkkla
	 x+K9+5bEl3y9E9YxaD5a05xAZECoX1heHjqF7ylA=

tcm_alloc() runs when a TCM function is symlinked into a gadget
configuration. It searches tpg_instances[] for the function instance
and copies the TPG pointer into fu->tpg at that point, under
tpg_instances_lock. This has two problems.

The function and the TPG can be set up in either order. If the
function is linked into a configuration before the TPG directory is
created, tpg_instances[i].tpg is still NULL and fu->tpg stays NULL.
Creating and enabling the TPG afterwards sets can_attach, so
tcm_bind() succeeds, and the first USB request that reaches the
target code dereferences the NULL fu->tpg.

Removing a TPG also leaves can_attach set for configfs instances, so a
later bind is not refused even though the TPG it would use is gone.

Store the TPG in struct f_tcm_opts instead: set it in usbg_make_tpg()
and clear it in usbg_drop_tpg(), under opts->dep_lock. In tcm_bind(),
refuse to bind unless both can_attach and opts->tpg are set, and copy
opts->tpg into fu->tpg there. Also clear can_attach in usbg_drop_tpg()
for configfs instances. The legacy g_target driver sets can_attach once
at module load, and its attach callback does not set it again, so
leave it alone in that case or g_target could never bind again after a
TPG is recreated.

With fu->tpg no longer set in tcm_alloc(), the tpg_instances[] lookup
there serves no purpose: f->fi already identifies the instance for the
item's whole lifetime. Drop it, and with it the tpg_instances_lock
acquisition. config_usb_cfg_link() calls tcm_alloc() with gi->lock
held, so this also removes the gi->lock -> tpg_instances_lock edge
from the following lockdep report:

  WARNING: possible circular locking dependency detected
  task is trying to acquire lock:
   (tpg_instances_lock){+.+.}-{4:4}, at: tcm_alloc
  but task is already holding lock:
   (&gi->lock){+.+.}-{4:4}, at: config_usb_cfg_link

  the existing dependency chain (in reverse order) is:
  -> #2 (&gi->lock):
         config_usb_cfg_link
         configfs_symlink
  -> #1 (&sb->s_type->i_mutex_key#24):
         configfs_depend_item_unlocked
         usbg_make_tpg
         target_fabric_make_tpg
         configfs_mkdir
  -> #0 (tpg_instances_lock):
         tcm_alloc
         usb_get_function
         config_usb_cfg_link
         configfs_symlink

Fixes: 4bb8548df632 ("usb: gadget: f_tcm: add configfs support")
Reported-by: syzbot+2799146a53c356f8017d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2799146a53c356f8017d
Link: https://syzkaller.appspot.com/ai_job?id=51e1f189-6d91-4321-a6ba-07d4eb3cd8cd
Assisted-by: Gemini:gemini-4-argon Gemini:gemini-3.8-flash syzbot
Signed-off-by: Slawomir Stepien <sst@poczta.fm>
---
 drivers/usb/gadget/function/f_tcm.c | 29 +++++++++++------------------
 drivers/usb/gadget/function/u_tcm.h |  4 ++++
 2 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 9e6d4f39900a..cc75d7e9792a 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1720,6 +1720,9 @@ static struct se_portal_group *usbg_make_tpg(struct se_wwn *wwn,
 
 	tpg_instances[i].tpg = tpg;
 	tpg->fi = tpg_instances[i].func_inst;
+	mutex_lock(&opts->dep_lock);
+	opts->tpg = tpg;
+	mutex_unlock(&opts->dep_lock);
 	mutex_unlock(&tpg_instances_lock);
 	return &tpg->se_tpg;
 
@@ -1760,11 +1763,14 @@ static void usbg_drop_tpg(struct se_portal_group *se_tpg)
 		opts = container_of(tpg_instances[i].func_inst,
 			struct f_tcm_opts, func_inst);
 		mutex_lock(&opts->dep_lock);
-		if (opts->has_dep)
+		opts->tpg = NULL;
+		if (opts->has_dep) {
 			module_put(opts->dependent);
-		else
+		} else {
+			opts->can_attach = false;
 			configfs_undepend_item_unlocked(
 				&opts->func_inst.group.cg_item);
+		}
 		mutex_unlock(&opts->dep_lock);
 	}
 	mutex_unlock(&tpg_instances_lock);
@@ -2300,10 +2306,11 @@ static int tcm_bind(struct usb_configuration *c, struct usb_function *f)
 	opts = container_of(f->fi, struct f_tcm_opts, func_inst);
 
 	mutex_lock(&opts->dep_lock);
-	if (!opts->can_attach) {
+	if (!opts->can_attach || !opts->tpg) {
 		mutex_unlock(&opts->dep_lock);
 		return -ENODEV;
 	}
+	fu->tpg = opts->tpg;
 	mutex_unlock(&opts->dep_lock);
 	us = usb_gstrings_attach(c->cdev, tcm_strings,
 		ARRAY_SIZE(tcm_us_strings));
@@ -2729,22 +2736,10 @@ static void tcm_unbind(struct usb_configuration *c, struct usb_function *f)
 static struct usb_function *tcm_alloc(struct usb_function_instance *fi)
 {
 	struct f_uas *fu;
-	unsigned i;
-
-	mutex_lock(&tpg_instances_lock);
-	for (i = 0; i < TPG_INSTANCES; ++i)
-		if (tpg_instances[i].func_inst == fi)
-			break;
-	if (i == TPG_INSTANCES) {
-		mutex_unlock(&tpg_instances_lock);
-		return ERR_PTR(-ENODEV);
-	}
 
 	fu = kzalloc_obj(*fu);
-	if (!fu) {
-		mutex_unlock(&tpg_instances_lock);
+	if (!fu)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	fu->function.name = "Target Function";
 	fu->function.bind = tcm_bind;
@@ -2754,12 +2749,10 @@ static struct usb_function *tcm_alloc(struct usb_function_instance *fi)
 	fu->function.setup = tcm_setup;
 	fu->function.disable = tcm_disable;
 	fu->function.free_func = tcm_free;
-	fu->tpg = tpg_instances[i].tpg;
 	INIT_WORK(&fu->delayed_set_alt, tcm_delayed_set_alt);
 	spin_lock_init(&fu->delayed_set_alt_lock);
 
 	hash_init(fu->stream_hash);
-	mutex_unlock(&tpg_instances_lock);
 
 	return &fu->function;
 }
diff --git a/drivers/usb/gadget/function/u_tcm.h b/drivers/usb/gadget/function/u_tcm.h
index 2cd15d9a1c0d..fa38d55c2a17 100644
--- a/drivers/usb/gadget/function/u_tcm.h
+++ b/drivers/usb/gadget/function/u_tcm.h
@@ -15,6 +15,8 @@
 
 #include <linux/usb/composite.h>
 
+struct usbg_tpg;
+
 /**
  * @dependent: optional dependent module. Meant for legacy gadget.
  * If non-null its refcount will be increased when a tpg is created and
@@ -23,10 +25,12 @@
  * @ready: true if the dependent module information is set.
  * @can_attach: true a function can be bound to gadget
  * @has_dep: true if there is a dependent module
+ * @tpg: target portal group associated with this function instance.
  *
  */
 struct f_tcm_opts {
 	struct usb_function_instance	func_inst;
+	struct usbg_tpg			*tpg;
 	struct module			*dependent;
 	struct mutex			dep_lock;
 	bool				ready;
-- 
2.56.0

