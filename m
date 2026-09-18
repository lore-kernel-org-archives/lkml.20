Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1C83BA220
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755423; cv=none; b=hyTDQnjb14SdaeKBC9/5gcSKOYwh+CcQGXKGx2X9eHt2K9/2BwzXFGi+2ud6ctkzxaXCt0RyXaK8KAVeHaJ17JAo5war3OoTKwCuAnJiJ0tuhrXkpbFvEX6ugG9CoElFFWmw5lgS3HGW1N9aZKN2aUbInhtDP8yyfHP6qFojoCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755423; c=relaxed/simple;
	bh=ts9kK/iCxfz8B6jDbz11N/MxkQs9h9VuTTCL0S0YsFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=trOhlFOoGJff5m+7/GYu8q8haLlrIx6l7YH2/F0BN2oql0Me7NEfb1LqsAyTYXPjp0YRZDUXFM+8Vn+iImcsMZX1Bfe3Vmjpd0b9KLGKZVkt43pVQMNXGY4x1DxPXQY7mGCW4ne8U8dWBEqswq02BWDTLuR+1Bl1gDnXf9kP5sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=IXWZY6Az; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="IXWZY6Az"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddb44ad1c1so11230975ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789755421; x=1790360221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+O4TueAKYiHtgRqWfBMj1NI12Pv4z04h49FFgSbHBPc=;
        b=IXWZY6AzPSmdIFXuuaUOw1gv1u0J7pO9SgdEKol1SSj41vNAsfQN3e90rv43VD6NGz
         ZKX8WrRy3iHqSmsIMREcv/7npGG3zq4UuIoV5VC6xSKHWWrWjHYnp+M35qXUQSqXZzPm
         pI2y5ZlgiVOE7mUrdQc6gOu1vAfs58lGMrnZi9++EyKYi6wEmnx1eblpnIxZWTPE5x/D
         llIyvx5kzRZsEqvEcSzDdMHG77J3FIRiuuxrT+8V9VB9GmvePyH1XoZBLCfRUDJGw5RQ
         9buu5UC5X0QkpxDOEbc++azVW43oed4hoUCgV+B42jIvWrj/nLHR1tLEPIvLOkqWlzPS
         uKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755421; x=1790360221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+O4TueAKYiHtgRqWfBMj1NI12Pv4z04h49FFgSbHBPc=;
        b=jFsBJ50oToc8jRxTaM4U5+nwLWPtXUg7twlB4MnCiH9pPDYIh4aNsPlmII1Pqnsuaf
         CAMON/Dzc80fTp+6cLhucyDNqezT/NOPcng9j/XK/Ffnal20GqUVeRZpz2UkND36Hddd
         YxDFYDYaZ7YW6P0kXNLPleFULk1Y+L6OpkoSSfR4HSV5R5qL5k2UNlXaM0r6YCRwlHK6
         vrnEqrBgqCf7X8+smaA64RbHgUNRpFb3BTBQ5khQpVJ7VCj3B63V1MhFupy0eWoTA14N
         iP+7nVDUAExlIE6In1qoPjbp9dUgxCNrCGlVcGS8Tx4gTj/msDIi/ixYTFb/ymKAGpr8
         xlsA==
X-Forwarded-Encrypted: i=1; AKwUvByOsAtzEqNkgTU5zRPEerux2DpX1KeuH3Zl8zn1yvlHtdggYoEoEuCABHSs91zTlMVUK5Aq990Az6iD1sU=@vger.kernel.org
X-Gm-Message-State: AFuF++kqPzHqisKnezVPSVVyK0+cuOT3tdmm72fr/76AhaTZKUuTFcsq
	kkCIZqupvrCAd79GM03vRZw1F1R6ZHCaS0otynPU9+X+re47pZwQwij5v+5FiNQ8GSI=
X-Gm-Gg: AYBFou0otqy5BdQYs84TjUOOvUentZ0ET3PF3zen/B5vY5qOY/buUlyVOBAO7cpnoYq
	cfk7PuaVlnA9+Ne5I7q+eWnXjmj2OvwaCOMFTQuzyZkzjV+Uhqm2L9CJB0kND9itmKbK17NDfV4
	lOPD20YbqgpmEpYpzS77RYcGeeL1Z7wLCGCTH7Y9Ues3djd5ZUNLsVcMABiguniHDKrTxziA0gq
	ITkH71/Zh4JilfKgFo8WQCkeDOkoW1NK6exVk5hkuES9xmTohQUzYkCjEbsrmcbWRfFOCi2ZtA6
	5k5scy1NDLMdaE5UhNv8vPw+UfuN951olsykbUC/KqJzNCOQEJvtEflY7CrA/7xhQyGD43aGa5k
	Tm4QyOIjqKkvbPO9kIkFoxyAZufmvs0AXW3QQ9APK6g90pX7A+Wuk2ozC0I9WI2F2hjvxBezy0O
	CaAhLY64bJ9IJchLhVFR0ungFGoZwPL6Driuk8/gPBJRfSm5FM+NUSemPeZYE79m3YOpOs1SD/l
	6u52gGB8PAOD/cVoRoMeXKO0vITKpAE
X-Received: by 2002:a17:902:f546:b0:2dd:c053:82f2 with SMTP id d9443c01a7336-2ddc0538461mr10467265ad.41.1789755420559;
        Fri, 18 Sep 2026 11:17:00 -0700 (PDT)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33c331aeeddsm335107eec.24.2026.09.18.11.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:17:00 -0700 (PDT)
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
Subject: [PATCH 01/18] nvmet: Rapid Path Failure Recovery set controller identify fields
Date: Fri, 18 Sep 2026 11:14:01 -0700
Message-ID: <20260918181614.3947933-2-mkhalfella@purestorage.com>
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

