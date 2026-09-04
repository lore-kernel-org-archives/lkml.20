Received: from r3-19.sinamail.sina.com.cn (r3-19.sinamail.sina.com.cn [202.108.3.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA2436D9E7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788485548; cv=none; b=qm13y/+OxPGBbWelFwVGctI0ou14BT+PEifyiO4jXKkmyAGFy6MlB5CnRByfaz49CKRww/6gcCA+FGIE8w67LObOydWst9JGZb7nTygjWuV93IA5u1IYIFos5Bim5pp8cmW3tZCB34/fZFdMIT9r7LTDFuYkiyZVfag8pNQ6uAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788485548; c=relaxed/simple;
	bh=TTVXc2AWzcWPnl0L0Hv1ZtAJrPN4xEhDzyu/5s2D/bQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZI4VmckqkJg9iWpB1U9Hx1dWPanPEJPYad2VbMuyIdp13x5ahepOEQRP3SMD9D7WHX1rmhva7v7a9eEtgIW0gB1tTGNhBIUj7TYR00/cY4ZrVdEe1d68G1lWkdGF2twvU+0sPXlZLC/Nh7vCw34IdsLFPkwsQPWkrQjCbwGAs0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=xCekR6NW; arc=none smtp.client-ip=202.108.3.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="xCekR6NW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1788485544;
	bh=8hZ//X7DPMAvHOt+s+ezgZcbsunUPEZNrcuRE8W+05Y=;
	h=From:Subject:Date:Message-ID;
	b=xCekR6NWgMRdl8+JVIscOoyOciD/jU5e98E7+7ZRnjp9LW3XgduX3K3owSvDtDgml
	 kTvxWW22nGlJe/XG2vWyPMw+rE7UcUrZJPa4aL3oI+sEcl4efHcygFc4wMqVb1ZuK5
	 lcVPeDrAh8NN5RGfu5X9rvtz2V9vBD6u5+xwlQq8=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6A9A1F7300003A3C; Fri, 4 Sep 2026 09:31:33 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 8961904457251
X-SMAIL-UIID: 0B59C65336A24BB3B8344B7A00C94136-20260904-093133-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+fefa0af09f7891b1800e@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [block?] general protection fault in blk_mq_quiesce_queue
Date: Fri,  4 Sep 2026 09:31:31 +0800
Message-ID: <20260904013131.574605-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6a99dfb2.9266084e.bf0d7.027c.GAE@google.com>
References: <6a99dfb2.9266084e.bf0d7.027c.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: upstream 940de590b839

diff --git a/drivers/nvme/target/loop.c b/drivers/nvme/target/loop.c
index fcb1f8186fdd..ec56085add72 100644
--- a/drivers/nvme/target/loop.c
+++ b/drivers/nvme/target/loop.c
@@ -561,8 +561,6 @@ static struct nvme_ctrl *nvme_loop_create_ctrl(struct device *dev,
 	ctrl->ctrl.opts = opts;
 	INIT_LIST_HEAD(&ctrl->list);
 
-	INIT_WORK(&ctrl->ctrl.reset_work, nvme_loop_reset_ctrl_work);
-
 	ret = nvme_init_ctrl(&ctrl->ctrl, dev, &nvme_loop_ctrl_ops,
 				0 /* no quirks, we're perfect! */);
 	if (ret) {
@@ -593,6 +591,8 @@ static struct nvme_ctrl *nvme_loop_create_ctrl(struct device *dev,
 	if (ret)
 		goto out_free_queues;
 
+	INIT_WORK(&ctrl->ctrl.reset_work, nvme_loop_reset_ctrl_work);
+
 	ret = nvme_loop_configure_admin_queue(ctrl);
 	if (ret)
 		goto out_remove_admin_tagset;
