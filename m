Received: from smtp153-168.sina.com.cn (smtp153-168.sina.com.cn [61.135.153.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A727E3F889E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 04:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788496879; cv=none; b=CksaRCsEX805b+mYEGpbpsDPocS1y1cGZxjTlCoVodIF/2DdPdSXdnvoWDrB6FhcUtHsm0mqlYWAdOJE2rtclXBuJcdFoP+Cd+mmp/Eel1MEz2ZkuPcabqTrTESAjSFouDNyUeN8EahcsdeZQ7M1HdFK1HvErTrcDh6TrRUYUgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788496879; c=relaxed/simple;
	bh=rYUBkWyro39QegvFv+h3QeCT4r/ln8AGtHcMKAmpU3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jLzCnFxJsGtSX9vpLwgJ+G1EPOQ6So5Thr5ruUsFRhWRQotysVseI91bVaRXHpBkQJpNhqXVnMPOs4j3kvYiAu6e7nA3OEtsG3ocz4gE1JZzm5/F//3IHQcx7cshdVp9U9dkY1LLefCmRTAsxAqIFjKMdY47+Tn96nXxE4jFgqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=P9H9gpK3; arc=none smtp.client-ip=61.135.153.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="P9H9gpK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1788496872;
	bh=wpm/9FAdbtiEY7qR+EPI8vzxNJXvAaY7sS0BzvMObic=;
	h=From:Subject:Date:Message-ID;
	b=P9H9gpK3Xw1d8/AjBRAi/vn6iNwT/NFuUeMmY2OV5sfsq6yBH67xGvuvYp4aGCXL0
	 xZoZdoNYKiI+q4qTGw2bm2jY9nECNpjhtZakqPvDqRxsDgfQN1fmOjaU2QJ1btrgDY
	 fDhO4AiRqmRChMgKGsFeblf1bxn/Fg4YGVivS3Zc=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.33) with ESMTP
	id 6A9A4BE100000E71; Fri, 4 Sep 2026 12:41:07 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 6333736685234
X-SMAIL-UIID: 789CD9CC659B4797A97B925D3B99215E-20260904-124107-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+fefa0af09f7891b1800e@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [block?] general protection fault in blk_mq_quiesce_queue
Date: Fri,  4 Sep 2026 12:41:05 +0800
Message-ID: <20260904044105.588878-1-eadavis@sina.com>
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

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 1322c678f4eb..0ad905d62e72 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -600,7 +600,6 @@ bool nvme_change_ctrl_state(struct nvme_ctrl *ctrl,
 		break;
 	case NVME_CTRL_RESETTING:
 		switch (old_state) {
-		case NVME_CTRL_NEW:
 		case NVME_CTRL_LIVE:
 			changed = true;
 			atomic_long_inc(&ctrl->nr_reset);
diff --git a/drivers/nvme/target/loop.c b/drivers/nvme/target/loop.c
index fcb1f8186fdd..685f5e8f5302 100644
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
@@ -570,12 +568,16 @@ static struct nvme_ctrl *nvme_loop_create_ctrl(struct device *dev,
 		goto out;
 	}
 
+	INIT_WORK(&ctrl->ctrl.reset_work, nvme_loop_reset_ctrl_work);
 	ret = nvme_add_ctrl(&ctrl->ctrl);
 	if (ret)
 		goto out_put_ctrl;
 
-	if (!nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_CONNECTING))
+	if (!nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_CONNECTING))	{
 		WARN_ON_ONCE(1);
+		ret = -EINTR;
+		goto out_uninit_ctrl;
+	}
 
 	ret = -ENOMEM;
 
