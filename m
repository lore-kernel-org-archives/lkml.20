Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625550;
	b=LSszBZJIaCC9MUFL5ERnat/cmKRvpjJ+7MNwwTMEi+P0Pl8bhnbHUbm7ZMwxHsvkdJgh
	 oI1w8OVq0kZdCl23TUBky4oYVz6TaBIeLBEZlz6cRQ5pa789mjtzbkav3H7Y4HfE+hA3h
	 NjGEUBZm6oT2fWQ6vC42eWn8G3rOCQtfNq24Jv1J7s8OEqXDb2Q9hYM2MqXDdYuyPOgYA
	 iiO7s8r0oncbgIQROjXKTmyL9TIPtsw41SeOHbjeTZghTbWDan/Y+vKZsGKEPoM+o+zwA
	 zl0f7JSHlXoOoMRdkltjKq9+8QNp+9AD9Uk3uagyromuk7An92mV/czwTkUmokNOK+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d5uxBhNS/GnIJw/zYouuj3Fh1xUn/nB9F/ugzp6g0YM=;
	b=OIgbw/cEf30P6PMNsdH7SE9b9Xoln+fB0grrMsL2dDfgtmdRYbxhPqOAVaqt437kq8aM
	 uhSpv9atrWI3Vyw9pP2eIqCeTzdCbV0H2/V5SOkrGgxOfDIQ4ldqhV27Kim9bBAKPBfbr
	 Xbb370HyUHy8R52syfSw1BNrgAwr4bnN3q+hWdvPmpOIz9pf6k/v6RqDqxt6yNhCXkmAC
	 0dyTCbOLpAPliOs1VquRwRBt7Fip9bYjAUuueAAI7BNQ5ANlNuZLtr+RsoC9NI0McWX0y
	 nye3DWh3HEIAj7/4MDuCME99VN/+gtXBcjUArmy3kWm66WteBXD8gdpjO2B8KAgz9pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=CxqMUG69;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF5C606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBF5C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=CxqMUG69
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso2009775c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794625549; x=1795230349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d5uxBhNS/GnIJw/zYouuj3Fh1xUn/nB9F/ugzp6g0YM=;
        b=CxqMUG69aMeG9KNmxo4P2Nb9ufQsyfqWLLE9flU1ko3lbUvlDb8jT+oj+UuABbB5sm
         Lhn6/sHs+XAjlB6fzYgDSaoIAHl13OpkL3mtNhXWs5WmnRm59LyMnqry2pfMaP7zp5e1
         UH3JrKrFTB4W3LG4xvYjIEEfcLeN+s32D26JLv6PJWHoHRsz6+jb9x343LekvGZVPAa0
         kOagbXktnWhqZWqMqP7xXXJGbcxyN9+vdufCWSxk2wgNypLgxN2J3DpmjzGou6hJEC4J
         HaxO33+Viq5qyYz+AXSAINEUf72drnHhqNvPw36CvXQ7TsHz/Th3+fGl4hoig5QUXLGb
         VK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625549; x=1795230349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d5uxBhNS/GnIJw/zYouuj3Fh1xUn/nB9F/ugzp6g0YM=;
        b=KtEJxit6O6NcEf+Kkl5XXM87gvH9TfimFG5CQhoQkw7Wu3sWhyCZmQTEykZA+zhlX0
         1GtCfl1qrcsWS+GmmYlgRgKTvhbY6ejz9zu6tQf8rIYA7LIl0RfKLdKNZ9xka5VluJVM
         hBHjWTQ64IR0LD7JTbzbwd0p+rKXtFiYVCrCY0+amwvYCDEGfocgeVA0IMH0x1HLW5z/
         q7VWbru31s79q/kVkCZAMxTfcm05ycAmfPnec7pk6jwUw/f5Bg6Q1UG3r+lpr6yRoEFL
         aBHNVWJ2Lehnzr5cia9vfpEk7jIsGOb03zDijIMbRvSoq/WncVjZZNp0Xh8nxse43Hc3
         4qrQ==
X-Forwarded-Encrypted: i=1; AL+hErFhJgL2GUroZI5VV66dDpGOUr0wBCdkSmICqxkPROkvieRhTaXaDrdXsPjQ9T/FzloZYXo0KR9WqmgUTws=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xxzHV2uI6iOUZqq2wIbzHMs/ajdzDMaLRXZM0lmkSMZTh2AZO
	UcJVCeCm7YJF9UBz7evMIlsLFvWuVndKaEQObbtpt17+kv5lIY7jqL8xl9/ljjZ5hOY=
X-Gm-Gg: AYBFou3U4JrM543KJcWdTpnCVsU/oHaR8AmbmfJshpS4rxrAUIJ1Rnzke3rq59TZfQF
	hYf4fjqZzfQKMFm2yhVTy1BwrqGKaEMEXp8jhNuW46d+BH8ymGwW90GzhDJBU6pVqlY00nf542F
	F8yCF1DmnmwpFJPotIEWue8rxIlq8GW+JD/aLcXibGVRzWTXIP9IW3uGO0rgYh/5jObBstdDu8B
	xSm8zcll+1LbTanus8QSZKVkUCipQx7fLS5AVL30cpGDSqYHBwPxehbvFmJhj2d0r+n3hSaQvb7
	l9ZqZPZGnRehfLB8mR0/yvzOkflHJ14jLLPEheovHsC+znKUrLoo6zLEqZojd9ubLwDFEgXmV4w
	uAkf1+lAi88TIw63M1uYDzm/BFFoNVzi7P5TuCuktFcbhGq1izd7jhgLWtsiEN4/rNzD5TQwu4z
	dUFNc6fapg43ZW4WG5Yg+MIfAaGO2VgxTUSrEx28k1+PNi8F5oCFohm1uG3nSwXu1/q95YhIDv4
	F4nTxHrQzCHbC5vIo/NkkFCmnOE4s+dbpoJMlyuX7t0CsawlDsr/0mYTKguWGbeCPTcXdppEfF5
	Xq307XdNLOgrzcyUrdzPBkVEbi6wirPnHkN8F9MYvUUWi9JbC3gFpz3b7B1a97caWbeeQ80ZBW4
	=
X-Received: by 2002:a05:701a:815a:20b0:14a:8cff:fbb8 with SMTP id a92af1059eb24-1b5030bd61fmr3897546c88.28.1794625548645;
        Fri, 13 Nov 2026 19:05:48 -0800 (PST)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b50316e008sm10829382c88.6.2026.11.13.19.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:05:48 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH v7 01/17] nvmet: Rapid Path Failure Recovery set controller identify fields
Date: Fri, 13 Nov 2026 19:04:15 -0800
Message-ID: <20261114030454.2836543-2-mkhalfella@purestorage.com>
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

TP8028 Rapid Path Failure Recovery defined new fields in controller
identify response. The newly defined fields are:

- CIU (Controller Instance Uniquifier): is an 8bit non-zero value that
  is assigned a random value when controller is first created. The value
  will be incremented when RDY bit in CSTS register is asserted.
- CIRN (Controller Instance Random Number): is 64bit random value that
  gets generated when controller is created. CIRN is regenerated every
  time RDY bit in CSTS register is asserted.
- CCRL (Cross-Controller Reset Limit): is an 8bit value that defines the
  maximum number of in-progress controller reset operations. CCRL is
  hardcoded to 4 because TP8028 recommended a value no less than 4.

These fields are set for non-discovery subsystems only.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
Reviewed-by: Daniel Wagner <dwagner@suse.de>
---
 drivers/nvme/target/admin-cmd.c |  5 +++++
 drivers/nvme/target/core.c      |  9 +++++++++
 drivers/nvme/target/nvmet.h     |  2 ++
 include/linux/nvme.h            | 10 ++++++++--
 4 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
index f12d83098644..5710ae53eb83 100644
--- a/drivers/nvme/target/admin-cmd.c
+++ b/drivers/nvme/target/admin-cmd.c
@@ -702,6 +702,11 @@ static void nvmet_execute_identify_ctrl(struct nvmet_req *req)
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
index cc1955bc8c84..9c9ad4d9b292 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -1429,6 +1429,10 @@ static void nvmet_start_ctrl(struct nvmet_ctrl *ctrl)
 		return;
 	}
 
+	if (!nvmet_is_disc_subsys(ctrl->subsys)) {
+		ctrl->ciu = ((u8)(ctrl->ciu + 1)) ? : 1;
+		ctrl->cirn = get_random_u64() ? : 1;
+	}
 	ctrl->csts = NVME_CSTS_RDY;
 
 	/*
@@ -1729,6 +1733,11 @@ struct nvmet_ctrl *nvmet_alloc_ctrl(struct nvmet_alloc_ctrl_args *args)
 	}
 	ctrl->cntlid = ret;
 
+	if (!nvmet_is_disc_subsys(ctrl->subsys)) {
+		ctrl->ciu = get_random_u8() ? : 1;
+		ctrl->cirn = get_random_u64() ? : 1;
+	}
+
 	ret = nvmet_ctrl_init_pr(ctrl);
 	if (ret)
 		goto init_pr_fail;
diff --git a/drivers/nvme/target/nvmet.h b/drivers/nvme/target/nvmet.h
index 2c2460ef5e2b..fba4d320f907 100644
--- a/drivers/nvme/target/nvmet.h
+++ b/drivers/nvme/target/nvmet.h
@@ -274,7 +274,9 @@ struct nvmet_ctrl {
 	uuid_t			hostid;
 	u16			cntlid;
 	u16			max_qid;
+	u8			ciu;
 	u32			kato;
+	u64			cirn;
 	bool			tbkas;
 
 	struct nvmet_port	*port;
diff --git a/include/linux/nvme.h b/include/linux/nvme.h
index 6248711784b3..a3c1b1713b4f 100644
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
2.56.0

