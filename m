Received: from r3-24.sinamail.sina.com.cn (r3-24.sinamail.sina.com.cn [202.108.3.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF80390986
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788489534; cv=none; b=RAhCIupBqdjSj30nB81MMQLxCgAYIJXAT6tplB4ZIITxlAhlMKOTiP+/UNp47DLveZ4+b77YF2e0oW8vu4CodEd9lee96Q2cpEBXazIDgB0Zvkm7AStk4Z1+h3jBFkG47rOtcOfkiod7GTeu2AGLOublnAuMswZe6I3R13o65P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788489534; c=relaxed/simple;
	bh=Hsd/5FC7sbiEtYgDatWLIsSzAmxiA8DdnHC+LUdQIB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ePb+XL6l2ZZjag0baHK0jMVuDy9J7C3poN/yVqZtMmRE6x/xsHLRaIPnNg3XYY+zyiRnNH6gA2bTQ/1YMAUyi8mlCYsy8bdvt4vEP+B4QUY5LIu5QTiQLrjlitg2IAdY76kosz+F04WsFtBLiTsesL2apfdd5aRGoBt1H9QUZYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=ZU0Lnmo9; arc=none smtp.client-ip=202.108.3.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="ZU0Lnmo9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1788489530;
	bh=+8f5m1XWc6HOuUHKr9SzWa28zLAfUJo/cwQRkv4QAsg=;
	h=From:Subject:Date:Message-ID;
	b=ZU0Lnmo9Itrp7KzBJVO29cKJNUWaYt9YNP1CK6EyLwczM62LtEixOyFHhPL6wcAki
	 GYNBS6bicKj2AXO0enzHkhQ72PF86Cv0VY09AImzVwb952GvJaU4DLRxx2gzZ3rhBr
	 eMNOZ2foyyOZJAjWzzUMGNCBuZOI4kVDRItxNiD8=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.31) with ESMTP
	id 6A9A2F2E00004EE1; Fri, 4 Sep 2026 10:38:40 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 6082806816756
X-SMAIL-UIID: 3BA50CE6E48D494A9ADFC0BDE05EAC4A-20260904-103840-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+fefa0af09f7891b1800e@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [block?] general protection fault in blk_mq_quiesce_queue
Date: Fri,  4 Sep 2026 10:38:38 +0800
Message-ID: <20260904023838.579889-1-eadavis@sina.com>
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
index fcb1f8186fdd..31f310904412 100644
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
@@ -574,8 +572,11 @@ static struct nvme_ctrl *nvme_loop_create_ctrl(struct device *dev,
 	if (ret)
 		goto out_put_ctrl;
 
-	if (!nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_CONNECTING))
+	if (!nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_CONNECTING))	{
 		WARN_ON_ONCE(1);
+		ret = -EINVAL;
+		goto out_uninit_ctrl;
+	}
 
 	ret = -ENOMEM;
 
@@ -593,6 +594,8 @@ static struct nvme_ctrl *nvme_loop_create_ctrl(struct device *dev,
 	if (ret)
 		goto out_free_queues;
 
+	INIT_WORK(&ctrl->ctrl.reset_work, nvme_loop_reset_ctrl_work);
+
 	ret = nvme_loop_configure_admin_queue(ctrl);
 	if (ret)
 		goto out_remove_admin_tagset;
