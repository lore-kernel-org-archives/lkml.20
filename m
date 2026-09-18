Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8841151EE02
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755439; cv=none; b=imhLsDjHWKHTrjzIbcC3BndLwnkm4wc/Oft+6FtPFGLuBX5IQafs3AE+2hlcJkzQhOOusGtTjKLOUIAY1qEx7BBEf0yoyPrLJ0Xpm2UYwgDQ6EOZR813t7bma6qMXcPkKqbfoLInAhT6EFwCGSVhuyuPn5rjTHELRLfM1hDpfHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755439; c=relaxed/simple;
	bh=kJlZAJC5w8Y6rxPPy96a2gpbq9yTsgzYHypSB80iKmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u8TUoo+dPmDmEoqomQIjrDqSOQG/MrtJE1PQ+oV+92RGHOuS0rrL5pKNriYeciWaCEX2Bjssz0R1Rve8O4DStSeqBeeuqslQqqeDVE+IGz68CmEvEWg1F8gc2bN7fyf/24NGTz2II4ZePs21isJpJEiuIFQ6j7U8igYRYQTwo0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=OtuOdH9c; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="OtuOdH9c"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb65437so926354a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789755437; x=1790360237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AW01tuh8hRVQtK4qarvblwO+ofGvSgZdhu/67l8Xj60=;
        b=OtuOdH9c4rWDpDQiilL1JUY/4XrxXbfDzZriUB5e4GFzC9NclgSaZVh98d+brcAWw4
         KWeuo6d/LL0blCw+MEX8+WssWc3+ubvhAaJTNkSxTEDG8/TLfGr420ALXLBQ99pUbuP7
         NdbZJ6dXAuGdkjtAjuNEa3ys1UMZ9kRNinctXFarjsQZYN7zTBhn9SW1DzkoO+AeewWD
         3BSuWoJ12aDTeBf0p5JTFOcoMk9TZEnuicIqi5IISegxxMOHlUX5JDqbBJ4f0ywg74es
         4eF1U7qKlgK+X28h7qBNBDbc0tN+hGltLIgvdc4A0FS21UGIQkpSMzCz834xaeffal+S
         pe/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755437; x=1790360237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AW01tuh8hRVQtK4qarvblwO+ofGvSgZdhu/67l8Xj60=;
        b=KPbQA9njHabEXg6iMsbdsxiEJ2hwxsfxZTaEs040YirMy8H8OZAUkTHClVW2jOMuVi
         lEBOd2oGwu7WGegTMzCMTa3ziiXQjpGXGp0tfKNYutPDHSd6uY2Ju7EpPcDSyu8Vba0o
         iwGMVQshYFPgqwGT2YYRoPonP3+L4yycs4e31A0bI3r5Qs2RIttaf/prwzVOnPWpG6oU
         mVXtV+ZrvAL6fRzgQRXzCPLrTIvQchAs3eKlT6wYUrB8zkIuqIcq89rZD+AAAQniB37a
         dm5yiHT8QrUVVSyd7O+ty0EVMj5kbdT9ipp5Pg/zNWy0/KsZNp5G/yWE3mKd1HTwjHOI
         e8CQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4rk+RSsOMtmmTlVnaMHkz/ylTsT/Fnqj1HN2eVeN8P0ZUbI5+/kgc2tyMy5XC+wFai2zd2IqmHLp52jA=@vger.kernel.org
X-Gm-Message-State: AFuF++nqMBzCqpWBk2ZoEHjUPzNi1Uj/9QXwfc7lerlkvuWDyBC9Jak2
	JDvYhSvrYHRVLOGjr57qF1eK0F3VrPeHB1lQ13DCWIeYypDjxSh4Gh0kaM3Nq2o8qCsI3LIgvOY
	fbRT0
X-Gm-Gg: AYBFou0QM37mJS7sfS5BdUCLO0uE3RgNNTaK5Q/Gn5ajJHU08Enik5OgttofC3WMN8i
	oVSqc1tw3WvYPdkXzxnylStPRdM2ML24xfog34QcLOCu0CtzwlUF4nfTmfwNBgmZF4QtAJr+13n
	h0QW7mpstJ1KGlaoNDRlSO85InjK1sqNT42nGz9z+FPsOSFHryucet/I+aRd4sjbS+fCYqmim6H
	TOG94P9tkYwpLu6yrjJAQHJ0oSV/QhNsGqInoa7YMs6cZ0LacyXokMUR98BRlKonTwNpW6aUbfO
	stWa19oXzdPx1xvckmj3ece2+fNmxcHSCRq3hjhHRa3jpqji2wmmjr28dJD9w6xH04eV8rEVyFn
	JmDa2cTzIh/HkRffmUL8qQKAz2ROwg8a7YBjPCOscw9pN8cwGLsgR7r9hCnaqqicwALuQMIfd3a
	kZUl7o361WOrl8K/LJYlW3/EVFnWM8u/9YMePh/cpEGmR9ifAZzi+os4o7hL5sxkdBgABGQgOo3
	kNU+Fg1KdCSpPt5ZsHs0A==
X-Received: by 2002:a17:90b:4ac7:b0:39e:6c6a:4b6a with SMTP id 98e67ed59e1d1-39e6c6a5812mr574016a91.52.1789755436728;
        Fri, 18 Sep 2026 11:17:16 -0700 (PDT)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33c331aeeddsm335107eec.24.2026.09.18.11.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:17:16 -0700 (PDT)
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
Subject: [PATCH 16/18] nvmet: Add support for CQT to nvme target
Date: Fri, 18 Sep 2026 11:14:16 -0700
Message-ID: <20260918181614.3947933-17-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918181614.3947933-1-mkhalfella@purestorage.com>
References: <20260918181614.3947933-1-mkhalfella@purestorage.com>
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

