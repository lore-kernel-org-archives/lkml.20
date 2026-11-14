Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625554;
	b=4lNSQJWWvnwcXQdqOlMqvIAg2gOP3Uy7XI/6Tu4evYTsKpkNkjkFEBpxB7Lbn0xbMLCr
	 RfE4UU9aN3kRtoe9dk+zNQwCmcazl9F4YM/DWi/JsnsHevzbigXa3vvhQYPCNePXGUB8T
	 VOLhqoZlYQjO9rZyTK/ecu+WfQzIqTZPzoN6XjHYgTEP4ieSwrKrBhO9nJj8ylAiTg00W
	 Ip/txpYwN511NrrA6m5+pWMkOK7OLb9DJ2ilHUIEyMnAXVYubkUg/USivkHhd3JkAMCh6
	 SqrE1FoNHpleGu7k0i0+u/V4lgmIhAPVkYcTh0OH7/mML94jdIdVu0WK2Vw+tvtyWdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cNitPS2mKtkkWvG3Koj/BsDrCRsqIPAWTzui6Y3UlPA=;
	b=E46cMZMI1E/IeveU2G61W2U83CZ464wvwyC42SblJbgXrPLlHtX26vgrDE6PVeDCIp7/
	 yjhGfWDqx/w8olyBGDrZNO0QA1fLQ7gibx6Y/+9ifc11EsFP1bdm7m6WbEX3WrXxgfkUi
	 DQhO2PZKVVN3r39SsVQ48r9PLtB9wy/mGut14KVM3zR3gE3nH60qsDBDyjvLwCBv9v/Ls
	 AyMfnbqDDcpGUZxuzSBJ1ezY5J2YcZJheHxee6p7V8dhZqMSaL7yssklG/mvHDO+dDZE0
	 QBlOudaHbx43+lM3tN2gmDnon/qe2dO6xQ49Xe9vf+3WnTi5g9a7Xf0tRqwATa9quQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b="eg02osW/";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D7A606A897
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3D7A606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=eg02osW/
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3720addb068so2604359eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794625553; x=1795230353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cNitPS2mKtkkWvG3Koj/BsDrCRsqIPAWTzui6Y3UlPA=;
        b=eg02osW/N0j6Vll5BHRAk3xTowb9P7gpiae8E9OE8djefJ09K8SocKsqGQJOGk1uZE
         adDlBG7+6nvlSSBPe6zUFE6ADTPWY0nZwbr4LQ6782f2UBDbih8a9vd3gL5IYDNjbQJj
         TChQW2/0ytoRjyCtfVCghQUyY1fLucgck05CI1i/mdXjokx+Yqn6Kjl0QKZyxPBx0DGw
         bcTP+7iIVTV9FD14L12hZ+mKnmRkvtGnznWxgIsY2dzoh/+TT/cChEbHv88kPJaftm0z
         kqqnp0RmQCmRxWbiGxGi0celKm2/8hHgACjb283jqwG1SDjMmoOC6Prg9GG0DI5wikvU
         3Xqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625553; x=1795230353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cNitPS2mKtkkWvG3Koj/BsDrCRsqIPAWTzui6Y3UlPA=;
        b=2FM87UqDBFzUM+EdZPSB5rcIZmkMbB2kw3Uce2QwGprepqXBmuiUJlNKG8l7s/3oki
         h6eLkga4MlMSjokfUW6/LAwFqpgVgBt3kLCeFqoopTp0tB8954U4BMeBvOl25xZurJcL
         RkhcYGHcEKAAoXad4zHRb3zg/Ll6IxEIjOi3H7L969epxelZEESfjkklFQYXBKf1VjeU
         zZ2Ev+RagFCuQKkbwU0+RB5xOUUpsYgEgf+4NoM9aqwOMvnYGp0L36WKeSOA4s7/wx2P
         vFxSL9bo5H/lVJUQCibXOHPYn9uV42RX08ZL0ZjWwzBqX7LL7/C+QSsrco+oTqPTIxhP
         xo6g==
X-Forwarded-Encrypted: i=1; AL+hErHOJSmykoENdyM0h1sseis3Rp1maZtDIJWvqu1+LaHUS3gVTJZ5Cf3/fg/t2pJdkcEll7wozfviVyBdCKU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SPLm0yRw+GA4p7gJENcGuIUlxx0Xcdu10J/jgNpGz3S8br0u+
	FkdGQ5Qb2pdkAXwvPGRkvN79krkX0Nq/nBO08JeOI5JTpOi3HWkaT3V2030g8UbeFxE=
X-Gm-Gg: AYBFou2ZpBCwfF1/Bbv/67pA6yKptL0FWRGHfaTkI4FyimcLIq2BSLBw8twKcqNLwVK
	AudgiTP79FN6j47zuX+pxQN5jDVjjwBluidOCLl10j1F9szuuXWXBMvd7F9Zc5y272r98DYTIcp
	tR3q+qGxoBlgl1OOvComefy67M96m2ibdeEkyzuyWs38lGCk5h3EkJHxWDppvAfHQnLhVtrYRC6
	wzVST5RUPTNMTGkX+y/j2y8DbD1TxJTAuzb0h2Mn1OJtHjfmVBn8Pyh84GraN5owHht3OpmUvRo
	mQwfPbGwwx903lHgSs5YZYJm15WKaveo/PKiSCnPcn83zFPETo6H50hQS67fpBQ/blDW7s+EYa+
	vs5NaJv69Q1Vo8LSdUWWzJEQDyX31IGcdAZ2Mh49KJtfRtQvJmwkjCiAdXedKyqYiRC7LNROjy/
	VR3j+1EptvDtQdVSOviJvuk5jnjWjmwN75eSvydqYuyXJhmJX3MANAjK7zuFcUpF1x6nJm1jdQZ
	ZS9wKbIn9YudttHmC5redjixVKwe43oj3WRhTlAPWz4IiR4IuWWfKaJ9D+gNWDAF4kpOEjr5RbJ
	xYtSlgJRW3IyPULPWwUqed0YTPW8y3+YMRHkeO5hjtINTC9aNLnKOS+SmC4cBf+JIcbtM+wXBg=
	=
X-Received: by 2002:a05:7022:b056:10b0:1b5:1a6c:af64 with SMTP id a92af1059eb24-1b51a6cb8ebmr564905c88.17.1794625552354;
        Fri, 13 Nov 2026 19:05:52 -0800 (PST)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b50316e008sm10829382c88.6.2026.11.13.19.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:05:52 -0800 (PST)
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
Subject: [PATCH v7 04/17] nvmet: Implement CCR logpage
Date: Fri, 13 Nov 2026 19:04:18 -0800
Message-ID: <20261114030454.2836543-5-mkhalfella@purestorage.com>
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

Defined by TP8028 Rapid Path Failure Recovery, CCR (Cross-Controller
Reset) log page contains an entry for each CCR request submitted to
source controller. Implement CCR logpage for nvme linux target.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
Reviewed-by: Daniel Wagner <dwagner@suse.de>
---
 drivers/nvme/target/admin-cmd.c | 43 +++++++++++++++++++++++++++++++++
 include/linux/nvme.h            | 29 ++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
index 3df9db454db9..25c320752d2a 100644
--- a/drivers/nvme/target/admin-cmd.c
+++ b/drivers/nvme/target/admin-cmd.c
@@ -220,6 +220,7 @@ static void nvmet_execute_get_supported_log_pages(struct nvmet_req *req)
 	logs->lids[NVME_LOG_FEATURES] = cpu_to_le32(NVME_LIDS_LSUPP);
 	logs->lids[NVME_LOG_RMI] = cpu_to_le32(NVME_LIDS_LSUPP);
 	logs->lids[NVME_LOG_RESERVATION] = cpu_to_le32(NVME_LIDS_LSUPP);
+	logs->lids[NVME_LOG_CCR] = cpu_to_le32(NVME_LIDS_LSUPP);
 
 	status = nvmet_copy_to_sgl(req, 0, logs, sizeof(*logs));
 	kfree(logs);
@@ -617,6 +618,46 @@ static void nvmet_execute_get_log_page_features(struct nvmet_req *req)
 	nvmet_req_complete(req, status);
 }
 
+static void nvmet_execute_get_log_page_ccr(struct nvmet_req *req)
+{
+	struct nvmet_ctrl *ctrl = req->sq->ctrl;
+	struct nvmet_ccr *ccr;
+	struct nvme_ccr_log *log;
+	int index = 0;
+	u16 status;
+
+	log = kzalloc_obj(*log);
+	if (!log) {
+		status = NVME_SC_INTERNAL;
+		goto out;
+	}
+
+	mutex_lock(&ctrl->lock);
+	list_for_each_entry(ccr, &ctrl->ccr_list, entry) {
+		u8 flags = NVME_CCR_FLAGS_VALIDATED | NVME_CCR_FLAGS_INITIATED;
+		u8 ccr_status = ccr->ctrl ? NVME_CCR_STATUS_IN_PROGRESS :
+					NVME_CCR_STATUS_SUCCESS;
+
+		log->entries[index].icid = cpu_to_le16(ccr->icid);
+		log->entries[index].ciu = ccr->ciu;
+		log->entries[index].acid = cpu_to_le16(0xffff);
+		log->entries[index].ccrs = ccr_status;
+		log->entries[index].ccrf = flags;
+		index++;
+	}
+
+	/* Cleanup completed CCRs if requested */
+	if (req->cmd->get_log_page.lsp & 0x1)
+		nvmet_ctrl_cleanup_ccrs(ctrl, false);
+	mutex_unlock(&ctrl->lock);
+
+	log->ne = cpu_to_le16(index);
+	status = nvmet_copy_to_sgl(req, 0, log, sizeof(*log));
+	kfree(log);
+out:
+	nvmet_req_complete(req, status);
+}
+
 static void nvmet_execute_get_log_page(struct nvmet_req *req)
 {
 	if (!nvmet_check_transfer_len(req, nvmet_get_log_page_len(req->cmd)))
@@ -650,6 +691,8 @@ static void nvmet_execute_get_log_page(struct nvmet_req *req)
 		return nvmet_execute_get_log_page_rmi(req);
 	case NVME_LOG_RESERVATION:
 		return nvmet_execute_get_log_page_resv(req);
+	case NVME_LOG_CCR:
+		return nvmet_execute_get_log_page_ccr(req);
 	}
 	pr_debug("unhandled lid %d on qid %d\n",
 	       req->cmd->get_log_page.lid, req->sq->qid);
diff --git a/include/linux/nvme.h b/include/linux/nvme.h
index d31c9648af43..98961f80b173 100644
--- a/include/linux/nvme.h
+++ b/include/linux/nvme.h
@@ -1440,6 +1440,7 @@ enum {
 	NVME_LOG_ANA		= 0x0c,
 	NVME_LOG_FEATURES	= 0x12,
 	NVME_LOG_RMI		= 0x16,
+	NVME_LOG_CCR		= 0x1e,
 	NVME_LOG_FDP_CONFIGS	= 0x20,
 	NVME_LOG_DISC		= 0x70,
 	NVME_LOG_RESERVATION	= 0x80,
@@ -1466,6 +1467,34 @@ enum {
 	NVME_FIS_CSCPE	= 1 << 21,
 };
 
+/* NVMe Cross-Controller Reset Status */
+enum {
+	NVME_CCR_STATUS_IN_PROGRESS,
+	NVME_CCR_STATUS_SUCCESS,
+	NVME_CCR_STATUS_FAILED,
+};
+
+/* NVMe Cross-Controller Reset Flags */
+enum {
+	NVME_CCR_FLAGS_VALIDATED	= 0x01,
+	NVME_CCR_FLAGS_INITIATED	= 0x02,
+};
+
+struct nvme_ccr_log_entry {
+	__le16			icid;
+	__u8			ciu;
+	__u8			rsvd3;
+	__le16			acid;
+	__u8			ccrs;
+	__u8			ccrf;
+};
+
+struct nvme_ccr_log {
+	__le16				ne;
+	__u8				rsvd2[6];
+	struct nvme_ccr_log_entry	entries[NVMF_CCR_PER_PAGE];
+};
+
 /* NVMe Namespace Write Protect State */
 enum {
 	NVME_NS_NO_WRITE_PROTECT = 0,
-- 
2.56.0

