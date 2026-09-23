Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7657576EAE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194818; cv=none; b=iq+bofOUQ3mNmWoV4h1lKWvA5anck+FbQieMbU1XZHT+RJb441cT38nIyqfDFPUgIqlH1NB/3RCR162WPXZyNY2tbb6gCTklP5ftpuCFVCr5qAtzohEXrGPhqP2DP1nxlcrH++PESDUJAVrE2yZX5HCy5IO967zzrX5D+3Da8kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194818; c=relaxed/simple;
	bh=rkXot5HGhjZOPZR33I4YIFnOTxk7DvG0maljEkvCoQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tq6sgta6aPajHbfsQyn4az8vX+5a7dqtjk3b8WZVvwdlQunQZxrD9+efjY2K7vIv2fcsV5/RUTWSAQrshYRmgyaPDhlzpSQRsKUi6sHlU6CxkE9m52Ukf8tt+7B00DlQrwXU1BL1cwRMIrwweBb+FQTb7fZeTPex+6Nl5g/HFA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OWul9Tys; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OWul9Tys"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790194813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DmWiMwtjUNhE7pDI46zh3hWGMwkIrcVg32ax/z+GaCQ=;
	b=OWul9TyswGwLzsthxhNV2UbvFC1rXRpRar5F1lqb8ij8LsTajUKuYvCGzRXlzZjEnA5+YA
	pp51A0YtueBdB60ANhCred3f4SXFasQLdQAjK9CzsoB80+sQdaPUhdjbSydrZTXhoqMLE4
	1FUUQ81U14LY/n0pD9uDRjrN6Uj2FlQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-26-M_l4EBVtMFOSErBqp6mH1Q-1; Wed,
 23 Sep 2026 16:20:10 -0400
X-MC-Unique: M_l4EBVtMFOSErBqp6mH1Q-1
X-Mimecast-MFC-AGG-ID: M_l4EBVtMFOSErBqp6mH1Q_1790194808
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F0CDE1954236;
	Wed, 23 Sep 2026 20:20:07 +0000 (UTC)
Received: from jtaubepe-thinkpadx1carbongen12.ibmlowe.csb (unknown [10.17.16.153])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 10F1D1953948;
	Wed, 23 Sep 2026 20:20:05 +0000 (UTC)
From: Jesse Taube <jtaubepe@redhat.com>
To: linux-nvme@lists.infradead.org
Cc: Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	John Meneghini <jmeneghi@redhat.com>,
	Chris Leech <cleech@redhat.com>,
	linux-kernel@vger.kernel.org,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	Jesse Taube <jtaubepe@redhat.com>
Subject: [PATCH v2] nvmet: Add traffic based keep alive support to configfs
Date: Wed, 23 Sep 2026 16:20:03 -0400
Message-ID: <20260923202003.1776271-1-jtaubepe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Add the ability to turn on and off tbkas (traffic based keep alive
support) via configfs. This is useful for testing and debugging.

Signed-off-by: Jesse Taube <jtaubepe@redhat.com>
V1 -> V2:
 - Add tbkas to nvmet_ctrl
 - Force reconnect controllers when tbkas is set
 - Use ctrl->tbkas in nvmet_execute_identify_ctrl and nvmet_req_init
---
 drivers/nvme/target/admin-cmd.c |  4 +++-
 drivers/nvme/target/configfs.c  | 29 +++++++++++++++++++++++++++++
 drivers/nvme/target/core.c      |  4 +++-
 drivers/nvme/target/nvmet.h     |  2 ++
 4 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
index 7764a3c0195c..26028be8fe4d 100644
--- a/drivers/nvme/target/admin-cmd.c
+++ b/drivers/nvme/target/admin-cmd.c
@@ -696,7 +696,9 @@ static void nvmet_execute_identify_ctrl(struct nvmet_req *req)
 
 	/* XXX: figure out what to do about RTD3R/RTD3 */
 	id->oaes = cpu_to_le32(NVMET_AEN_CFG_OPTIONAL);
-	ctratt = NVME_CTRL_ATTR_HID_128_BIT | NVME_CTRL_ATTR_TBKAS;
+	ctratt = NVME_CTRL_ATTR_HID_128_BIT;
+	if (ctrl->tbkas)
+		ctratt |= NVME_CTRL_ATTR_TBKAS;
 	if (nvmet_is_pci_ctrl(ctrl))
 		ctratt |= NVME_CTRL_ATTR_RHII;
 	id->ctratt = cpu_to_le32(ctratt);
diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
index 6286e38436dd..2b879b1d4c3c 100644
--- a/drivers/nvme/target/configfs.c
+++ b/drivers/nvme/target/configfs.c
@@ -1369,6 +1369,34 @@ static ssize_t nvmet_subsys_attr_serial_store(struct config_item *item,
 }
 CONFIGFS_ATTR(nvmet_subsys_, attr_serial);
 
+static ssize_t nvmet_subsys_attr_tbkas_show(struct config_item *item,
+					     char *page)
+{
+	return snprintf(page, PAGE_SIZE, "%d\n", to_subsys(item)->tbkas);
+}
+
+static ssize_t nvmet_subsys_attr_tbkas_store(struct config_item *item,
+					      const char *page, size_t count)
+{
+	struct nvmet_subsys *subsys = to_subsys(item);
+	struct nvmet_ctrl *ctrl;
+	bool tbkas;
+
+	if (kstrtobool(page, &tbkas))
+		return -EINVAL;
+
+	down_write(&nvmet_config_sem);
+	subsys->tbkas = tbkas;
+
+	/* Force reconnect */
+	list_for_each_entry(ctrl, &subsys->ctrls, subsys_entry)
+		ctrl->ops->delete_ctrl(ctrl);
+	up_write(&nvmet_config_sem);
+
+	return count;
+}
+CONFIGFS_ATTR(nvmet_subsys_, attr_tbkas);
+
 static ssize_t nvmet_subsys_attr_cntlid_min_show(struct config_item *item,
 						 char *page)
 {
@@ -1706,6 +1734,7 @@ static struct configfs_attribute *nvmet_subsys_attrs[] = {
 	&nvmet_subsys_attr_attr_qid_max,
 	&nvmet_subsys_attr_attr_ieee_oui,
 	&nvmet_subsys_attr_attr_firmware,
+	&nvmet_subsys_attr_attr_tbkas,
 #ifdef CONFIG_BLK_DEV_INTEGRITY
 	&nvmet_subsys_attr_attr_pi_enable,
 #endif
diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index 43871a8f56ca..6b4bda231bd9 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -1227,7 +1227,7 @@ bool nvmet_req_init(struct nvmet_req *req, struct nvmet_sq *sq,
 		goto fail;
 	}
 
-	if (sq->ctrl)
+	if (sq->ctrl && sq->ctrl->tbkas)
 		sq->ctrl->reset_tbkas = true;
 
 	return true;
@@ -1677,6 +1677,7 @@ struct nvmet_ctrl *nvmet_alloc_ctrl(struct nvmet_alloc_ctrl_args *args)
 	mutex_lock(&subsys->lock);
 
 	ctrl->max_qid = subsys->max_qid;
+	ctrl->tbkas = subsys->tbkas;
 
 	ctrl->sqs = kzalloc_objs(struct nvmet_sq *, ctrl->max_qid + 1);
 	if (!ctrl->sqs)
@@ -1865,6 +1866,7 @@ struct nvmet_subsys *nvmet_subsys_alloc(const char *subsysnqn,
 	}
 
 	subsys->ieee_oui = 0;
+	subsys->tbkas = true;
 
 	subsys->firmware_rev = kstrndup(UTS_RELEASE, NVMET_FR_MAX_SIZE, GFP_KERNEL);
 	if (!subsys->firmware_rev) {
diff --git a/drivers/nvme/target/nvmet.h b/drivers/nvme/target/nvmet.h
index dbda55895f4f..2bc0e87ea981 100644
--- a/drivers/nvme/target/nvmet.h
+++ b/drivers/nvme/target/nvmet.h
@@ -270,6 +270,7 @@ struct nvmet_ctrl {
 	u16			cntlid;
 	u16			max_qid;
 	u32			kato;
+	bool			tbkas;
 
 	struct nvmet_port	*port;
 
@@ -343,6 +344,7 @@ struct nvmet_subsys {
 	bool			subsys_discovered;
 	char			*subsysnqn;
 	bool			pi_support;
+	bool			tbkas;
 
 	struct config_group	group;
 
-- 
2.55.0

