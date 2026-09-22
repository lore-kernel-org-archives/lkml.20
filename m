Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610AA4C77C8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108612; cv=none; b=Beap9Eo+1KrXZoedsfsijZxd/lszEAuAxHLbTL6GSH7JbruCx2HX+0P+afnj1A54njVghJoS7ILyXhbvr5QNzK3pDzbeXFyb91EDr3rrvsjWDUEFVsCYu7cx1kSUV7ZQCGy0o0MGfU+WOCRPSX0Q3COeCkuGSdLv9GV4SLN3Lh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108612; c=relaxed/simple;
	bh=9O0vtjT/U6/YE+0Jgj6Tpu6ru4Q4umlvAYDUX3TvRaU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NcKzMnCWqw1nQuWSn+ydzmN/cCAQ8BLzUsEiw8CrIPCGcWVkHB3uOmxuJXTENFRHV780cZ9AIxQrfD2JJJAIUhNKl5+M9zC6RTjrz13Dg2kxTE+wU8ATyOV3UBZ5x5ZWb1Hc0+F70Oj5bibna5H9rfrb7vmvhYdtPNQWnHUrozA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dPGAgcXK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dPGAgcXK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790108588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=f7WaOHgKg8Vd0Ib9aySxYndrKCmtGTXszN0D/8f6w8s=;
	b=dPGAgcXKsDFQzcmqApaJpPXxbGHfaGNenLeFRMULOtsh3OL//Qo2mBDJdy6jovgURtz/Pe
	ju8me0E2lJr2nc2NbS5OF6m7TNNWp1vmiuVygT0dqbljvaN2T6HT+aY5cVItnMpTcjggQv
	1W55orUlF/24nHTSbSnq+2HOYiEJ/M4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-483-ax_MA_zrP2OKe7MhJAu_Ig-1; Tue,
 22 Sep 2026 16:23:04 -0400
X-MC-Unique: ax_MA_zrP2OKe7MhJAu_Ig-1
X-Mimecast-MFC-AGG-ID: ax_MA_zrP2OKe7MhJAu_Ig_1790108583
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 90AEE1800626;
	Tue, 22 Sep 2026 20:23:02 +0000 (UTC)
Received: from jtaubepe-thinkpadx1carbongen12.ibmlowe.csb (unknown [10.22.64.21])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7185041B;
	Tue, 22 Sep 2026 20:22:59 +0000 (UTC)
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
Subject: [PATCH v1] nvmet: Add traffic based keep alive support to configfs
Date: Tue, 22 Sep 2026 16:22:56 -0400
Message-ID: <20260922202257.1434980-1-jtaubepe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Add the ability to turn on and off tbkas (traffic based keep alive
support) via configfs. This is useful for testing and debugging.

Signed-off-by: Jesse Taube <jtaubepe@redhat.com>
---
 drivers/nvme/target/admin-cmd.c |  4 +++-
 drivers/nvme/target/configfs.c  | 27 +++++++++++++++++++++++++++
 drivers/nvme/target/core.c      |  3 ++-
 drivers/nvme/target/nvmet.h     |  1 +
 4 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
index 7764a3c0195c..e734e4b68784 100644
--- a/drivers/nvme/target/admin-cmd.c
+++ b/drivers/nvme/target/admin-cmd.c
@@ -696,7 +696,9 @@ static void nvmet_execute_identify_ctrl(struct nvmet_req *req)
 
 	/* XXX: figure out what to do about RTD3R/RTD3 */
 	id->oaes = cpu_to_le32(NVMET_AEN_CFG_OPTIONAL);
-	ctratt = NVME_CTRL_ATTR_HID_128_BIT | NVME_CTRL_ATTR_TBKAS;
+	ctratt = NVME_CTRL_ATTR_HID_128_BIT;
+	if (subsys->tbkas)
+		ctratt |= NVME_CTRL_ATTR_TBKAS;
 	if (nvmet_is_pci_ctrl(ctrl))
 		ctratt |= NVME_CTRL_ATTR_RHII;
 	id->ctratt = cpu_to_le32(ctratt);
diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
index 6286e38436dd..5766e594e724 100644
--- a/drivers/nvme/target/configfs.c
+++ b/drivers/nvme/target/configfs.c
@@ -1369,6 +1369,32 @@ static ssize_t nvmet_subsys_attr_serial_store(struct config_item *item,
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
+	bool tbkas;
+
+	if (subsys->subsys_discovered) {
+		pr_err("Can't set traffic based keep alive support. %d is already assigned\n",
+		       subsys->tbkas);
+		return -EINVAL;
+	}
+
+	if (kstrtobool(page, &tbkas))
+		return -EINVAL;
+
+	subsys->tbkas = tbkas;
+	return count;
+}
+CONFIGFS_ATTR(nvmet_subsys_, attr_tbkas);
+
 static ssize_t nvmet_subsys_attr_cntlid_min_show(struct config_item *item,
 						 char *page)
 {
@@ -1706,6 +1732,7 @@ static struct configfs_attribute *nvmet_subsys_attrs[] = {
 	&nvmet_subsys_attr_attr_qid_max,
 	&nvmet_subsys_attr_attr_ieee_oui,
 	&nvmet_subsys_attr_attr_firmware,
+	&nvmet_subsys_attr_attr_tbkas,
 #ifdef CONFIG_BLK_DEV_INTEGRITY
 	&nvmet_subsys_attr_attr_pi_enable,
 #endif
diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index 43871a8f56ca..20aeb9624be0 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -1227,7 +1227,7 @@ bool nvmet_req_init(struct nvmet_req *req, struct nvmet_sq *sq,
 		goto fail;
 	}
 
-	if (sq->ctrl)
+	if (sq->ctrl && sq->ctrl->subsys->tbkas)
 		sq->ctrl->reset_tbkas = true;
 
 	return true;
@@ -1865,6 +1865,7 @@ struct nvmet_subsys *nvmet_subsys_alloc(const char *subsysnqn,
 	}
 
 	subsys->ieee_oui = 0;
+	subsys->tbkas = true;
 
 	subsys->firmware_rev = kstrndup(UTS_RELEASE, NVMET_FR_MAX_SIZE, GFP_KERNEL);
 	if (!subsys->firmware_rev) {
diff --git a/drivers/nvme/target/nvmet.h b/drivers/nvme/target/nvmet.h
index dbda55895f4f..241eac4fa969 100644
--- a/drivers/nvme/target/nvmet.h
+++ b/drivers/nvme/target/nvmet.h
@@ -343,6 +343,7 @@ struct nvmet_subsys {
 	bool			subsys_discovered;
 	char			*subsysnqn;
 	bool			pi_support;
+	bool			tbkas;
 
 	struct config_group	group;
 
-- 
2.55.0

