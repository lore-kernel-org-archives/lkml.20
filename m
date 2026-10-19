Received: from r3-23.sinamail.sina.com.cn (r3-23.sinamail.sina.com.cn [202.108.3.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9921351C11
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792374718; cv=none; b=Wp60P8A3CSyjAi0glCjN+ywhwg51qIH4NuBbRoQwPbGpMTqGPKBlkHx+gCxKeulMqvZfrfMX0U0aPDli8VZBw30ScZgVgYYTl9w+1QZketgCVw1gPHc03tYukbav4jcIcV+ZCJR91RjyQ8TEDdr8qI3N9JTnbJMQPGi1p1PR3uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792374718; c=relaxed/simple;
	bh=MucjX2DcjLbLvqlL44FgAp7DRiOfZY5eN/jAuVAEh1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HXiCf0XFRK7pdE180jPpnzUy1sj38C3SAlDX/GBbKKGsu9qwKvi42Moq1fEBY+++rZWhX/a1MJarOtR3jG+19kRdKkNE5/8BPwNR0sMr5lEwQ1wF4doGVqCNK8qYXFU1mu7MsNzwkQ1Qxeg4G8OxSKhONtgbl/ly+zIYlu7L7y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=w+jr3iQ2; arc=none smtp.client-ip=202.108.3.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="w+jr3iQ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792374714;
	bh=FALiitUgb2nKvUH1tR15Q5+aEgUtd6wsrOWaEs5DNHA=;
	h=From:Subject:Date:Message-ID;
	b=w+jr3iQ2nhL2+nIrYjMMyS84EgkjcTxkG3PDOErg1nBZV+0bJjyslXB3kscYW691C
	 UHz2T0mautDx4q+KKbBj2Hh9856IOzXe/xYcOPrMroI6RXEevmNZRVjQGrkpstbnUL
	 WQIGnn+EerY4gxSwpq54ocXkOXZXH45nRnNV3pWc=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.254.0.170])
	by sina.com (10.54.253.31) with ESMTP
	id 6AD577B3000038B2; Mon, 19 Oct 2026 09:51:50 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 5048276815932
X-SMAIL-UIID: 1CA32C8385104A238281AA00CC121B2E-20261019-095150-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+ccdb5058c3df2d94811c@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [rdma?] possible deadlock in rds_trans_get_preferred
Date: Mon, 19 Oct 2026 09:51:38 +0800
Message-ID: <20261019015139.806-1-hdanton@sina.com>
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

#syz test

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
