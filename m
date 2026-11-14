Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625569;
	b=ffr+EpBbhzUs96hMt5xK8mNKHkekBNzf/e7nCTWx+ODr+da8wqjrdtcmEuaHEXYFog4X
	 sWaNegWjQrm6zpCbtqkOasQ4OPCiEaCgaFkkmSXTxHPGG4Nk/HmRiCJ6Vv8Pa+CPA98xs
	 PUo/hFIBaZyuGx/tlgLkg93pDrMdUOLoYeZUAkyc2KqkTI1tDNrOIsu2zXIHJKXJPNEJc
	 Z1TqUv5WZCcZAAg8XVJBOxHirP6xE//wQ6lXP/zng2QXml05Pw371O4a4bRTOBr28/fXd
	 8GDXy2n1WukBoTba0rLrA7mWlqDXnPtAyZQ+SDaP9McN6MbKzsS0s015BAsCGdPhYQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WF8tz2VGzlxmux7qLESvzI2gEtLFPUubLy0lnNhCQvw=;
	b=cOUWHh7lHp5ZfPS+PepTy/VnECceGW9zlhihwqSK9xpqDtFRCVDI03boNXB1/KhTanKX
	 FNC0ymgdq5Qph7BvxHpTazYZT6m/9+CVBWIvFzNLqXJTpQp2PnlNseMi/92P1+cOd1Y4J
	 xItmdoU9CNO7yupTAN0//Rj2H2y8DBZImm4Q5+Mgq2A4JBJe5b4B/w7YSU/Y3hF40mQNo
	 uY8ml1XDJdnHYhwRZB2WAnurrmVojnb9eUOGMl/ZB1k/wZZMron+PlG9j0kKcEiKa4/bs
	 Xo80NeY4Hfs4Snbo7TaJIPF908KJJMQIQnrkMIAWl07+E72V6F2dmGUb2pHUNTzAfHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=DPlyv+A9;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06745606D4CE
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06745606D4CE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=DPlyv+A9
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b244fb7fffso1860836c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794625568; x=1795230368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WF8tz2VGzlxmux7qLESvzI2gEtLFPUubLy0lnNhCQvw=;
        b=DPlyv+A9W+QtcySw3VuNzrEYkh50FtJAG18ysyr+bvzBLLilPQjW95mg9fqJT6ribv
         hDczpcuyRKNRu9P3ZmEZXOF5pIDQQU99N1dU9yy4y2PmccOFCObhZgYzyQ9hPuWxlDmf
         Umo8NUUbPZDwqzqA7bRIqCGQ7AqhQBbaRYVWCGBJ/KXm1H824CBF7KRdV1mjO/mfwZiR
         AFfCYJm1WF/d1OwLb02+uWA/nujxfGvRNgY3m803/FT7Eoi2tonlLEBz50p6zSHNfjxX
         0qtt8wHAXarSh5oP3YPXKJOtdq73MRDE97ZfJV+L1qAkqrPmE4lu2L8UCTQtaD7yVxpI
         Y5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625568; x=1795230368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WF8tz2VGzlxmux7qLESvzI2gEtLFPUubLy0lnNhCQvw=;
        b=Atruc3AdM8cmfgm+EwgRRtNN5Yx9okJGrvAhHqI8pyFq5hc0wm9g0wLScOeOq8JFsU
         Fye33ukqC3A84IeXDtoPES/VRlA0hVb4mOe0K5GxLZiw0GoCVv5mQPKnFtKFJYsDq787
         hV90Qyl0he5e6XD4Vpku3YnccpUHana9V5yOHeWyZY2gXFy78YA7pI3ES9ksRLsZ1SFG
         S7mwPKwVueh9c/Uz3c9HytE/kU5NryiPDALFF0zYueq16JJkPgxxsnqsI+k5h45Gh4Id
         4CX0DgB//aMtjtawZqD/agZOck7SgDvupEY8OoQScPj+SXj/2BvDQuRSaOTndKIiAH9H
         mY1w==
X-Forwarded-Encrypted: i=1; AL+hErHxLRYW/wcuEVqZytykAPtmujNtPfOr5n0DiPyl2ewT4kJ/I0tGtqwQpoZaHYHj9zDb9VjElZVqxDdlinQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z85qU4AkMUZgRLSBVw4+tHF6qojpUND7lfMB85ftBzKnphk/xzY
	2Hpc1cShaq0m973nGzlfXFgtATpJqMobdmis0svtFaMr7Dav/JYGOlnkPrY+ayFmLBU=
X-Gm-Gg: AYBFou1CKlv8pUXw4T9VhbKZPKg7mPuDFWmaWBq5xpp8mgcmq3ltqdiT4hTDP1HZILI
	yidNWJiD7bLeA2P7O1dNbCtL8xRImTNYwHjKxtaQRmxMbCiVbXAzsgYPYlCrEvjwJbRJiaGkU//
	fiIBFIpCxQAtGuRj7GoVVwlYo3oCqBWUszB3e0vq97EMCWnzV4DJnNeWSqxUabvr/MkDBmaYndl
	8v19qnkHsgCP8RxmFGthw0+JyBY0rx6o/5o2onmJ/kFoL6yG0J76ew7ydYtcxJWTY/fkCnsjmvT
	iuUhN7f2zQVe11xiDCorn2UHhbMSvk+Oe7lqoGYof1UhWQdw9INL3jsrE+TJ7HBbwxl3bKuZ2ok
	bCWU+oiRUM4VgW7TdGdVsX3nMHlb01nRco2DfZeUb7VVec3tPTtoBq9wDvFTLCEX/KDcRx6Se7G
	DzZ0Thu/5KtZVI2dAlNP0UBJCf8ZOOhVHWgy13WMMQCbPkPNglLtQtUYJdJmVV5dtv53jtxOJ6r
	75/o5o/oJ/dgggDsb7fGjhDKkmI+NQsT05gG+dRn1zoCEc7Sw9wneYzuNZfOeYrkL2ClrBE/cZF
	3wkq1DATR5LKFp0i4BisqlWbQy6ljduJRgdoEcEmp3qBZF6hK4biAA==
X-Received: by 2002:a05:7022:92a:b0:192:74cf:1db2 with SMTP id a92af1059eb24-1b5030e9a6emr5924881c88.11.1794625567732;
        Fri, 13 Nov 2026 19:06:07 -0800 (PST)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b50316e008sm10829382c88.6.2026.11.13.19.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:06:07 -0800 (PST)
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
	Daniel Wagner <dwagner@suse.de>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 16/17] nvmet: Add support for CQT to nvme target
Date: Fri, 13 Nov 2026 19:04:30 -0800
Message-ID: <20261114030454.2836543-17-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114030454.2836543-1-mkhalfella@purestorage.com>
References: <20261114030454.2836543-1-mkhalfella@purestorage.com>
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

TP4129 KATO Corrections and Clarifications defined CQT (Command Quiesce
Time) which is used along with KATO (Keep Alive Timeout) to set an upper
time limit for attempting Cross-Controller Recovery. CQT is added as a
subsystem attribute that defaults to 0 to maintain the current behavior.
Changing attr_cqt disconnects the existing controllers of the subsystem
so that hosts reconnect and read the new value.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Hannes Reinecke <hare@kernel.org>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
Reviewed-by: Daniel Wagner <dwagner@suse.de>
---
 drivers/nvme/target/admin-cmd.c |  1 +
 drivers/nvme/target/configfs.c  | 36 +++++++++++++++++++++++++++++++++
 drivers/nvme/target/core.c      |  3 +++
 drivers/nvme/target/nvmet.h     |  2 ++
 include/linux/nvme.h            |  5 ++++-
 5 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
index e13ffd17669b..76d65cca25dc 100644
--- a/drivers/nvme/target/admin-cmd.c
+++ b/drivers/nvme/target/admin-cmd.c
@@ -748,6 +748,7 @@ static void nvmet_execute_identify_ctrl(struct nvmet_req *req)
 	id->cntlid = cpu_to_le16(ctrl->cntlid);
 	id->ver = cpu_to_le32(ctrl->subsys->ver);
 	if (!nvmet_is_disc_subsys(ctrl->subsys)) {
+		id->cqt = cpu_to_le16(ctrl->cqt);
 		id->ciu = ctrl->ciu;
 		id->cirn = cpu_to_le64(ctrl->cirn);
 		id->ccrl = NVMF_CCR_LIMIT;
diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
index bde94656e4b7..babc4c7101f5 100644
--- a/drivers/nvme/target/configfs.c
+++ b/drivers/nvme/target/configfs.c
@@ -1770,6 +1770,41 @@ static ssize_t nvmet_subsys_attr_pi_enable_store(struct config_item *item,
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
@@ -1812,6 +1847,7 @@ static struct configfs_attribute *nvmet_subsys_attrs[] = {
 	&nvmet_subsys_attr_attr_vendor_id,
 	&nvmet_subsys_attr_attr_subsys_vendor_id,
 	&nvmet_subsys_attr_attr_model,
+	&nvmet_subsys_attr_attr_cqt,
 	&nvmet_subsys_attr_attr_qid_max,
 	&nvmet_subsys_attr_attr_ieee_oui,
 	&nvmet_subsys_attr_attr_firmware,
diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index 12ab522ea5a1..8a3e51d573d4 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -1794,6 +1794,7 @@ struct nvmet_ctrl *nvmet_alloc_ctrl(struct nvmet_alloc_ctrl_args *args)
 	ctrl->cntlid = ret;
 
 	if (!nvmet_is_disc_subsys(ctrl->subsys)) {
+		ctrl->cqt = subsys->cqt;
 		ctrl->ciu = get_random_u8() ? : 1;
 		ctrl->cirn = get_random_u64() ? : 1;
 	}
@@ -2022,10 +2023,12 @@ struct nvmet_subsys *nvmet_subsys_alloc(const char *subsysnqn,
 
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
index 2cdfa1165292..911ad2b997f7 100644
--- a/drivers/nvme/target/nvmet.h
+++ b/drivers/nvme/target/nvmet.h
@@ -275,6 +275,7 @@ struct nvmet_ctrl {
 	uuid_t			hostid;
 	u16			cntlid;
 	u16			max_qid;
+	u16			cqt;
 	u8			ciu;
 	u32			kato;
 	u64			cirn;
@@ -366,6 +367,7 @@ struct nvmet_subsys {
 #ifdef CONFIG_NVME_TARGET_DEBUGFS
 	struct dentry		*debugfs_dir;
 #endif
+	u16			cqt;
 	u16			max_qid;
 
 	u64			ver;
diff --git a/include/linux/nvme.h b/include/linux/nvme.h
index 96b71aaad630..6d413f2ca3d5 100644
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
2.56.0

