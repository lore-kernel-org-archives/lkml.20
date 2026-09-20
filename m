Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC1D471425
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929019; cv=none; b=Mo5PgaURTH5zgd/uzuek1eT++u0kWsdpCPSG7qNr68OIke6DXtqr4xnL4NzAV3t1RsARicRjJTuamnbSO6uZtv9YTajt+7RBaEJ4QhgWDmRI1V7tEYG3oZIKUdffiWuwDoKpViIsDnlDUG/8YCd24PpD+8e7ta1+GD+hocFx+Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929019; c=relaxed/simple;
	bh=ts9kK/iCxfz8B6jDbz11N/MxkQs9h9VuTTCL0S0YsFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=re0nG8xD5WLolQd+koh5EoPTtOf85pAJ1YnF9gJlsL7RDNt5BnDAnixSOZgKz+dFjQDOhj1E9ortNoilVPjpwdCvGLR1Lk2Z5FX8dp/szoOsyB99Ngn8kYUSlA/zqKgRMLIpcaLFkp7eJdKrJlbtNgxenuqU1BoaV3x3BsVanqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=gWFmmtEs; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="gWFmmtEs"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so2431651a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789929017; x=1790533817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+O4TueAKYiHtgRqWfBMj1NI12Pv4z04h49FFgSbHBPc=;
        b=gWFmmtEsVK2Ldf/zmaENb36BH6rx/OjijHr50EptxxuoLdkMqmc2uUHkrF8EelPLjr
         zsO61cJoYkqE1ru+KUYv81N83kpE+QXiKsrxR/3GnCpA+3uM4m/w+hmF7yRXnh/3921z
         l64k/HT6hOz6E+3QDKm7qDMA+gfpZsXiGTOknDNLoIEe8kbh0+sVYY2fiScGvRq2YYoc
         UZVs9ahZSA3Qe0goMBORIp6Oh35qg/dTPDQpFolpADiRksfOuzCD3NIuNkM/SrCmZK/Q
         9GnML6dWhtQTDSmyQSSGQnNvkM6V4gvWxp/JcHSUB2ZjSYW8m/jU6uife43gZOvrG6WU
         xV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929017; x=1790533817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+O4TueAKYiHtgRqWfBMj1NI12Pv4z04h49FFgSbHBPc=;
        b=Ijvt3gkXFwkQBSCot6mU9f1HcRtDPQA1vEA/tvkDvK6G7lmNPetmudHcWr86MY3/s4
         TlvnUgSD+BaaVJccebbK3fWnOqiqMrlTNxFT7yTm26D7VxRv19K3MNz/zI1Cx8EKbbXO
         vPAk8gkAXcjsEYhXY+qTkTFmdhAzHFtB8qoV1lPCjmBNiaCRVGc4C1aM3mIxsiMy8h70
         B/+K0e0lC39fHCTX9Q1t4YPGiJ41N4SMmioqeQxTsBq2PT0k7aLCzv5kZ0XV6wC6Hy83
         cz1t8Iq6lMACZZhJ8+6WL0n8S67RmviCfR2vCEBxNmX89xlEfmMhtqW7yajm/efIehOq
         XTiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOJrb2V2iYbxp7ER67ta5lk5puUBb8ARwq1wngPq6KildeV/EpXWCOzcIr3Cvm/HdNNp1xiuhziZeaXaQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n8zuLUxxNuLGNhTWD/uqf9+vYWp2UK8wpb7ZUyhXzegC5kmHeP
	RuJsu9RWcPbbzIi90Z+D34AQhx00QwxDrJQOPrFkKqZctXjmB149zOQEj/DUmT6KgOA=
X-Gm-Gg: AYBFou0wDp2Y6LZcpxlZhE4DeQBzykq3+SdwxjLb6jJdLs7wi6k2NfIc3rTaYmG4jaC
	jowGsIMcua/0My7k9aFgQAYve+/Czm1YobBJEpJ+pDjn+nyPeLWTPxepqzfpjVQCpXR3V9gWCMk
	Mwzkl8LyMdMR+xlS0+GKZp/w72xNdTs0YuKIWr7tgt1iBxy7QJOWUO0HYFOSiAedzAPqv0u+71c
	xpA2jNXFia5fJy8kAvEGcYEU76+YlaiuoC4vfHk8xf3W2QeTF8SQwLisz8Yr0GAfdVcP0Vsqwaq
	Yw0ITS1/0FtT4MD0F71mKDUGziNchLl6hAtZWQ4sYPTjhf2rsr8tbGBQjBUWHmYEejyfPZuHytP
	h47TfWdW44zS/YOlqw4KbjTDu80LlKkHvpG3O7nqiLiSL/9t4neaw2nwh1CSo4xaXuQgxu7hk5m
	5tffCz8bKHs4Rj9Y8wlQhVga1iaJRC5Q75Pj3l4ZGUBZaeEtYVL8j5XmSh
X-Received: by 2002:a17:90b:1cd0:b0:396:7c01:553f with SMTP id 98e67ed59e1d1-39e36106b85mr17159180a91.21.1789929016695;
        Sun, 20 Sep 2026 11:30:16 -0700 (PDT)
Received: from ceto ([2607:fb90:9c20:5ac0::1d8c])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-144da432647sm20924589c88.5.2026.09.20.11.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:30:16 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH v6 01/18] nvmet: Rapid Path Failure Recovery set controller identify fields
Date: Sun, 20 Sep 2026 11:27:59 -0700
Message-ID: <20260920182936.2317916-2-mkhalfella@purestorage.com>
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

TP8028 Rapid Path Failure Recovery defined new fields in controller
identify response. The newly defined fields are:

- CIU (Controller Instance Uniquifier): is an 8bit non-zero value that
  is assigned a random value when controller is first created. The value
  will be incremented when RDY bit in CSTS register is asserted.
- CIRN (Controller Instance Random Number): is 64bit random value that
  gets generated when controller is created. CIRN is regenerated everytime
  RDY bit in CSTS register is asserted.
- CCRL (Cross-Controller Reset Limit): is an 8bit value that defines the
  maximum number of in-progress controller reset operations. CCRL is
  hardcoded to 4 as recommended by TP8028.

These fields are set for non-discovery subsystems only.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/target/admin-cmd.c |  5 +++++
 drivers/nvme/target/core.c      |  9 +++++++++
 drivers/nvme/target/nvmet.h     |  2 ++
 include/linux/nvme.h            | 10 ++++++++--
 4 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
index 7764a3c0195c..bf7c5f5927e3 100644
--- a/drivers/nvme/target/admin-cmd.c
+++ b/drivers/nvme/target/admin-cmd.c
@@ -693,6 +693,11 @@ static void nvmet_execute_identify_ctrl(struct nvmet_req *req)
 	id->mdts = nvmet_ctrl_mdts(req);
 	id->cntlid = cpu_to_le16(ctrl->cntlid);
 	id->ver = cpu_to_le32(ctrl->subsys->ver);
+	if (!nvmet_is_disc_subsys(ctrl->subsys)) {
+		id->ciu = ctrl->ciu;
+		id->cirn = cpu_to_le64(ctrl->cirn);
+		id->ccrl = NVMF_CCR_LIMIT;
+	}
 
 	/* XXX: figure out what to do about RTD3R/RTD3 */
 	id->oaes = cpu_to_le32(NVMET_AEN_CFG_OPTIONAL);
diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index 43871a8f56ca..4c8f30c5ff7e 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -1412,6 +1412,10 @@ static void nvmet_start_ctrl(struct nvmet_ctrl *ctrl)
 		return;
 	}
 
+	if (!nvmet_is_disc_subsys(ctrl->subsys)) {
+		ctrl->ciu = ((u8)(ctrl->ciu + 1)) ? : 1;
+		ctrl->cirn = get_random_u64();
+	}
 	ctrl->csts = NVME_CSTS_RDY;
 
 	/*
@@ -1695,6 +1699,11 @@ struct nvmet_ctrl *nvmet_alloc_ctrl(struct nvmet_alloc_ctrl_args *args)
 	}
 	ctrl->cntlid = ret;
 
+	if (!nvmet_is_disc_subsys(ctrl->subsys)) {
+		ctrl->ciu = get_random_u8() ? : 1;
+		ctrl->cirn = get_random_u64();
+	}
+
 	ret = nvmet_ctrl_init_pr(ctrl);
 	if (ret)
 		goto init_pr_fail;
diff --git a/drivers/nvme/target/nvmet.h b/drivers/nvme/target/nvmet.h
index dbda55895f4f..e3e414ef68d3 100644
--- a/drivers/nvme/target/nvmet.h
+++ b/drivers/nvme/target/nvmet.h
@@ -269,7 +269,9 @@ struct nvmet_ctrl {
 	uuid_t			hostid;
 	u16			cntlid;
 	u16			max_qid;
+	u8			ciu;
 	u32			kato;
+	u64			cirn;
 
 	struct nvmet_port	*port;
 
diff --git a/include/linux/nvme.h b/include/linux/nvme.h
index 91ce434a7e8d..cbaf02b0cf07 100644
--- a/include/linux/nvme.h
+++ b/include/linux/nvme.h
@@ -21,6 +21,8 @@
 #define NVMF_TRADDR_SIZE	256
 #define NVMF_TSAS_SIZE		256
 
+#define NVMF_CCR_LIMIT		4
+
 #define NVME_DISC_SUBSYS_NAME	"nqn.2014-08.org.nvmexpress.discovery"
 
 #define NVME_NSID_ALL		0xffffffff
@@ -328,7 +330,10 @@ struct nvme_id_ctrl {
 	__le16			crdt1;
 	__le16			crdt2;
 	__le16			crdt3;
-	__u8			rsvd134[122];
+	__u8			rsvd134[1];
+	__u8			ciu;
+	__le64			cirn;
+	__u8			rsvd144[112];
 	__le16			oacs;
 	__u8			acl;
 	__u8			aerl;
@@ -389,7 +394,8 @@ struct nvme_id_ctrl {
 	__u8			msdbd;
 	__u8			rsvd1804[2];
 	__u8			dctype;
-	__u8			rsvd1807[241];
+	__u8			ccrl;
+	__u8			rsvd1808[240];
 	struct nvme_id_power_state	psd[32];
 	__u8			vs[1024];
 };
-- 
2.55.0

