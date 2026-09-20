Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18C9296BBC
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929046; cv=none; b=Gkgxfgc0N7euCudraFh9BAfMjgesWVZyMx50jhioCMtk+w4O5nnnAROXGZoBBj4t6GpM1+3q8d0Zlom1w2I0MJcwlYb8BIyahKtIc5k3aNyw+5dETd5i9bb0DzZ6zOBRiDuUBZ5oD4yNh5awVQXJhEcedd0p0P+kvoi129QID+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929046; c=relaxed/simple;
	bh=kJlZAJC5w8Y6rxPPy96a2gpbq9yTsgzYHypSB80iKmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DBCzyJIV0x6lKuihRTmSHkre+vXVktbyU9lJl6gyohS1qVr2yXD2qNZi7RVIqCn1jsm1wmVY9CWUUoCiiw/0VYzgI9jD42jK7nEH3KJj7G8xLlheSOznppKREusq2VUt4rC3v2ROWROkLCnYP7R58i5rakFkbn3eoCtcphpWolA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=gUZtZG1/; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="gUZtZG1/"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db1ca069c8so22982315ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789929041; x=1790533841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AW01tuh8hRVQtK4qarvblwO+ofGvSgZdhu/67l8Xj60=;
        b=gUZtZG1/GHtq4Tq7n3iwEJzL4k/rzOw8m2gWXw1kUbFtRvyzVsysY38oxnooKmzZHW
         yS2/WjYrfEdIjbK2qYrm5ok0ZdLhQTCkMSFrmQVhFflXuJ7oGq7DYwmABaoN7ORrFAPO
         JjKRDs2y6wOOib9YFfiWtAXqE/1GgTg8t+pndqd3ZXbQHwvqaoX5B+f45u6T/ur2E6+g
         7o8idRm1eDP6vnMdre8j2mse4xdCGRsreimRjybK05Oxj6DtRxbcDZSdTlyUCM+SACiH
         Q/QdMgwM23NAd40AvxFcHDSeh4n/Xjjt7brSZ50pY5y0R7bEJN5Txdoat4iW3+2+fTmV
         ssNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929041; x=1790533841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AW01tuh8hRVQtK4qarvblwO+ofGvSgZdhu/67l8Xj60=;
        b=GgCJ0ncIw9yc+S1C7xc8gNy5T53YOzY29L8pSt+WRfiipILLQVwcnG9S75+raehU3M
         1N9BS0nffwXvSjVTz2aE9BMPif6fbSg6eesiPhJ5l+7qWs/3FPjHK20mPl7s29mFdp6u
         MJ++veGRcX7w3O0FbGucQRiG9Ke7y4Oz980wYyjWHKzaiJJnebppzFPNW2oJ/jtSKkd9
         7yOl65UmOkKtaD+HSwtIsHE2mtR2i0dilo5sVBM7/KC0F/H/J4bVH/oLqR8hyN1PeJSE
         FdZ7P5JJ436pfh6AUB2hGLr9Fyzxf7gkvTRzbge+7SgZPRg8QUGLEodOW8nRlw/phe6V
         9Aug==
X-Forwarded-Encrypted: i=1; AKwUvBxtaGxx33Xy469YuRdePEQ72Mde6GdMoGP7Vz2opJKMZVHEfXyIMrOKoCqG50ha4+frjae+ZRTPxhp5FpQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kKZt3nykkeEY3qAz5VTfTKJlb0l4FWYfbP4gvLqCCgfnIsv9PR
	bvDKFY8E4yd+dce6XbgEsvAXsF9tOAGzc8nze6Aom1Ej4KOjtX/iNNqnpoAYakulnj4=
X-Gm-Gg: AYBFou0kbyzfNwzsMvRbG+ua1tYkmPgSNCJ0iCXtbyzkWp34W/6PBYuI+1GH6osdHGZ
	kpPrpriMMNZbS5J7r1qNjAXzCCQQvKQ1NVcKbRth5dxjzc9uGEqjbbsaf2j8bYoRBgkqMz2pNEW
	bNUNK+BSBQuxnEABZnvzq4yoDzyBNn3a+z8k0KNTtz2Nk3Ql8p3+deA9es+tjEQKCl7u0P1+miK
	aFzRNRmhsCURyHFl0lHoPzAN138ijNrirIMe8dYmZOSzne/VQLvtUct6HEkCGXx6T2TLMKNmbyP
	2XaekBi/WKmmzavqE23eBprXXlT6Hn11XiKw60aQaaQucKLKuscYagBqwW1oaaEU94d4ytkEb0J
	k4IDiFY8IBdv47j3g2ZB3biz850QLCvtlv+B+GwmhvHTl8i9s9Gkv6ZS1vW9+/u/6YBlKEDFG+0
	sdg0Xex58VWlXaVyUeH6UXUuj8PFEW9mYUbZZhxxf091j6swidPmkuo11w
X-Received: by 2002:a17:90b:5281:b0:39e:4c7f:8b17 with SMTP id 98e67ed59e1d1-39e54cf8bc1mr14650246a91.28.1789929040984;
        Sun, 20 Sep 2026 11:30:40 -0700 (PDT)
Received: from ceto ([2607:fb90:9c20:5ac0::1d8c])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-144da432647sm20924589c88.5.2026.09.20.11.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:30:40 -0700 (PDT)
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 16/18] nvmet: Add support for CQT to nvme target
Date: Sun, 20 Sep 2026 11:28:14 -0700
Message-ID: <20260920182936.2317916-17-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920182936.2317916-1-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TP4129 KATO Corrections and Clarifications defined CQT (Command Quiesce
Time) which is used along with KATO (Keep Alive Timeout) to set an upper
time limit for attempting Cross-Controller Recovery. CQT is added as a
subsystem attribute that defaults to 0 to maintain the current behavior.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Hannes Reinecke <hare@kernel.org>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/target/admin-cmd.c |  1 +
 drivers/nvme/target/configfs.c  | 36 +++++++++++++++++++++++++++++++++
 drivers/nvme/target/core.c      |  3 +++
 drivers/nvme/target/nvmet.h     |  2 ++
 include/linux/nvme.h            |  5 ++++-
 5 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
index a60b2f271e98..c0cd233048eb 100644
--- a/drivers/nvme/target/admin-cmd.c
+++ b/drivers/nvme/target/admin-cmd.c
@@ -739,6 +739,7 @@ static void nvmet_execute_identify_ctrl(struct nvmet_req *req)
 	id->cntlid = cpu_to_le16(ctrl->cntlid);
 	id->ver = cpu_to_le32(ctrl->subsys->ver);
 	if (!nvmet_is_disc_subsys(ctrl->subsys)) {
+		id->cqt = cpu_to_le16(ctrl->cqt);
 		id->ciu = ctrl->ciu;
 		id->cirn = cpu_to_le64(ctrl->cirn);
 		id->ccrl = NVMF_CCR_LIMIT;
diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
index 6286e38436dd..88a59ac1e93a 100644
--- a/drivers/nvme/target/configfs.c
+++ b/drivers/nvme/target/configfs.c
@@ -1663,6 +1663,41 @@ static ssize_t nvmet_subsys_attr_pi_enable_store(struct config_item *item,
 CONFIGFS_ATTR(nvmet_subsys_, attr_pi_enable);
 #endif
 
+static ssize_t nvmet_subsys_attr_cqt_show(struct config_item *item,
+					  char *page)
+{
+	return snprintf(page, PAGE_SIZE, "%u\n", to_subsys(item)->cqt);
+}
+
+static ssize_t nvmet_subsys_attr_cqt_store(struct config_item *item,
+					   const char *page, size_t cnt)
+{
+	struct nvmet_subsys *subsys = to_subsys(item);
+	struct nvmet_ctrl *ctrl;
+	u16 cqt;
+
+	if (nvmet_is_disc_subsys(subsys))
+		return -EINVAL;
+
+	if (sscanf(page, "%hu\n", &cqt) != 1)
+		return -EINVAL;
+
+	down_write(&nvmet_config_sem);
+	mutex_lock(&subsys->lock);
+	if (subsys->cqt == cqt)
+		goto out;
+
+	subsys->cqt = cqt;
+	/* Force reconnect */
+	list_for_each_entry(ctrl, &subsys->ctrls, subsys_entry)
+		ctrl->ops->delete_ctrl(ctrl);
+out:
+	mutex_unlock(&subsys->lock);
+	up_write(&nvmet_config_sem);
+	return cnt;
+}
+CONFIGFS_ATTR(nvmet_subsys_, attr_cqt);
+
 static ssize_t nvmet_subsys_attr_qid_max_show(struct config_item *item,
 					      char *page)
 {
@@ -1703,6 +1738,7 @@ static struct configfs_attribute *nvmet_subsys_attrs[] = {
 	&nvmet_subsys_attr_attr_vendor_id,
 	&nvmet_subsys_attr_attr_subsys_vendor_id,
 	&nvmet_subsys_attr_attr_model,
+	&nvmet_subsys_attr_attr_cqt,
 	&nvmet_subsys_attr_attr_qid_max,
 	&nvmet_subsys_attr_attr_ieee_oui,
 	&nvmet_subsys_attr_attr_firmware,
diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index 69491e8e52ba..a93cf7e3a704 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -1753,6 +1753,7 @@ struct nvmet_ctrl *nvmet_alloc_ctrl(struct nvmet_alloc_ctrl_args *args)
 	ctrl->cntlid = ret;
 
 	if (!nvmet_is_disc_subsys(ctrl->subsys)) {
+		ctrl->cqt = subsys->cqt;
 		ctrl->ciu = get_random_u8() ? : 1;
 		ctrl->cirn = get_random_u64();
 	}
@@ -1980,10 +1981,12 @@ struct nvmet_subsys *nvmet_subsys_alloc(const char *subsysnqn,
 
 	switch (type) {
 	case NVME_NQN_NVME:
+		subsys->cqt = NVMF_CQT_MS;
 		subsys->max_qid = NVMET_NR_QUEUES;
 		break;
 	case NVME_NQN_DISC:
 	case NVME_NQN_CURR:
+		subsys->cqt = 0;
 		subsys->max_qid = 0;
 		break;
 	default:
diff --git a/drivers/nvme/target/nvmet.h b/drivers/nvme/target/nvmet.h
index 88fa11aa0587..ddf88c772938 100644
--- a/drivers/nvme/target/nvmet.h
+++ b/drivers/nvme/target/nvmet.h
@@ -270,6 +270,7 @@ struct nvmet_ctrl {
 	uuid_t			hostid;
 	u16			cntlid;
 	u16			max_qid;
+	u16			cqt;
 	u8			ciu;
 	u32			kato;
 	u64			cirn;
@@ -347,6 +348,7 @@ struct nvmet_subsys {
 #ifdef CONFIG_NVME_TARGET_DEBUGFS
 	struct dentry		*debugfs_dir;
 #endif
+	u16			cqt;
 	u16			max_qid;
 
 	u64			ver;
diff --git a/include/linux/nvme.h b/include/linux/nvme.h
index 3757d11ffea3..0b69ed53f347 100644
--- a/include/linux/nvme.h
+++ b/include/linux/nvme.h
@@ -21,6 +21,7 @@
 #define NVMF_TRADDR_SIZE	256
 #define NVMF_TSAS_SIZE		256
 
+#define NVMF_CQT_MS		0
 #define NVMF_CCR_LIMIT		4
 #define NVMF_CCR_PER_PAGE	511
 
@@ -368,7 +369,9 @@ struct nvme_id_ctrl {
 	__u8			anacap;
 	__le32			anagrpmax;
 	__le32			nanagrpid;
-	__u8			rsvd352[160];
+	__u8			rsvd352[34];
+	__le16			cqt;
+	__u8			rsvd388[124];
 	__u8			sqes;
 	__u8			cqes;
 	__le16			maxcmd;
-- 
2.55.0

