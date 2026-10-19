Received: from r3-11.sinamail.sina.com.cn (r3-11.sinamail.sina.com.cn [202.108.3.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9017240D578
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397124; cv=none; b=f2IcrpXgvjSnlH3h9TAcgwaY8aRNeGbqiobXqJUIjbY3tAmQ+X2OiFr+MYzZJ5/ZV8HfcJf/oR9cWMTORD55ZkGoYYmoyGj3CsZ051dXVoQkyOuzsZNoiGANfyMwibWlTMEaDIuqu6kDXxOxc+8D6HvDLAtZMCe9tQLwa3kYAUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397124; c=relaxed/simple;
	bh=UxHA2ViBUPJPs8QAFjW2TFHRP+YettFPLFr2WtSuAtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=au93sI+1QASpU9otZNek0oRYVT9Jnw34xCsCht3YJXncaE2hjXuAPFpja1hAaSEzlhqE02V0z+jnMTMaSDioVpwY1H8iklRlorX1g33qTMz1kTFXdgHE191c08XEMFS9mtdZNZUynvGieglCwhL6cKvb512HTSLvziWEDfsa7ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=jbJg/yE9; arc=none smtp.client-ip=202.108.3.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="jbJg/yE9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792397120;
	bh=KKDk1Wod3l98b/0ehATI1KJdre+hP3j/8BEJ8KuHDg4=;
	h=From:Subject:Date:Message-ID;
	b=jbJg/yE99/G/4DkX1YVoWL+6+nPbvZX5d/2u2L8FC8u3hs2ss9xda+WdjqHPUPhMA
	 zIzep6DwmhiY7gTtpi3duVjZc04FNLBbKhNfrcH2lMdIHl7RfZ2+62NQ8O+VBIfIR+
	 SXaM1GKV97L7c37o4yZ3+doHCEfks4Z8WTerSGuM=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.254.0.154])
	by sina.com (10.54.253.34) with ESMTP
	id 6AD5CF3400004501; Mon, 19 Oct 2026 16:05:11 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 2706276292179
X-SMAIL-UIID: 3F4600DD094242C69B357DF942873D81-20261019-160511-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+ccdb5058c3df2d94811c@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [rdma?] possible deadlock in rds_trans_get_preferred
Date: Mon, 19 Oct 2026 16:04:57 +0800
Message-ID: <20261019080458.821-1-hdanton@sina.com>
In-Reply-To: <6ad51a9c.a6d1a155.34a93f.00bb.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Sun, 18 Oct 2026 12:14:36 -0700	[thread overview]
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    70dd4ee72eb2 Merge tag 'pinctrl-v7.3-3' of git://git.kerne..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=1271a69c580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=44ac479246d4559b
> dashboard link: https://syzkaller.appspot.com/bug?extid=ccdb5058c3df2d94811c
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> userspace arch: i386
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15b9618e580000

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 70dd4ee72eb2

--- x/include/rdma/rdma_cm.h
+++ y/include/rdma/rdma_cm.h
@@ -167,6 +167,7 @@ struct rdma_cm_id *rdma_create_user_id(r
   * asynchronous operations associated with the id.
   */
 void rdma_destroy_id(struct rdma_cm_id *id);
+void rdma_destroy_id_wq(struct rdma_cm_id *id);
 
 /**
  * rdma_restrict_node_type - Restrict an RDMA identifier to specific
--- x/net/rds/ib.c
+++ y/net/rds/ib.c
@@ -486,7 +486,7 @@ static int rds_ib_laddr_check_cm(struct
 		 cm_id->device ? cm_id->device->node_type : -1);
 
 out:
-	rdma_destroy_id(cm_id);
+	rdma_destroy_id_wq(cm_id);
 
 	return ret;
 }
--- x/drivers/infiniband/core/cma_priv.h
+++ y/drivers/infiniband/core/cma_priv.h
@@ -110,6 +110,7 @@ struct rdma_id_private {
 	 */
 	struct rdma_restrack_entry     res;
 	struct rdma_ucm_ece ece;
+	struct work_struct destroy_work;
 };
 
 #if IS_ENABLED(CONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS)
--- x/drivers/infiniband/core/cma.c
+++ y/drivers/infiniband/core/cma.c
@@ -2126,6 +2126,25 @@ void rdma_destroy_id(struct rdma_cm_id *
 }
 EXPORT_SYMBOL(rdma_destroy_id);
 
+static void destroy_id_work(struct work_struct *work)
+{
+	struct rdma_id_private *id_priv =
+		container_of(work, struct rdma_id_private, destroy_work);
+
+	mutex_lock(&id_priv->handler_mutex);
+	destroy_id_handler_unlock(id_priv);
+}
+
+void rdma_destroy_id_wq(struct rdma_cm_id *id)
+{
+	struct rdma_id_private *id_priv =
+		container_of(id, struct rdma_id_private, id);
+
+	INIT_WORK(&id_priv->destroy_work, destroy_id_work);
+	queue_work(cma_wq, &id_priv->destroy_work);
+}
+EXPORT_SYMBOL(rdma_destroy_id_wq);
+
 static int cma_rep_recv(struct rdma_id_private *id_priv)
 {
 	int ret;
--
