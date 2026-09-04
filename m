Received: from mail-vk1-f225.google.com (mail-vk1-f225.google.com [209.85.221.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9920B4779A4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519140; cv=none; b=PRHEsRBeDT3IPICMpk9+VXjye/rUEJUH+A3hUU9/jXvBOSUYhEF7CNADtJ1NqJ918IknLItfn4Wi0HFUdFB6GIeYBohByIsiNcBZJkAj/suw1a1zlAG+wFDqMsvi31Lx9qlhRVQ8izMFEUhkjf5JL55X2qXP2e4OjxG1cLyXOzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519140; c=relaxed/simple;
	bh=Q9X3M3Wf8MGeQE4ItnPZlZ4ZIVjjTw7BLduTW5Umjww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdGIICONLjMBa0VWfdZspVKQ8jROWIQdpi5xpalu8nID5tsfrGBXl1pu5DW78vRdWbqI7C75p3F863wAbYIiQKlCbwfrlsMzMqGVWZ8v4IJuBMVhw00DxT9tVdGY1iwtFRWeageK68IkgR+dyJ9sDVQ+RDnAn+jtkbVpLVO9syw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=cqnfw64S; arc=none smtp.client-ip=209.85.221.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="cqnfw64S"
Received: by mail-vk1-f225.google.com with SMTP id 71dfb90a1353d-5c7d65c83feso769943e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519137; x=1789123937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lsJVghgmykcDqujH5E/4jmjWzxYpohFscUPzleDQWcE=;
        b=MqHYW1elsnNgZ1CWPDfPd41gyb3X4Ogd/cnZPYFMUKtrniv+EkoFcrVZwVb+vnJVMC
         F2BSnso6iqml4JGbMLPwbuQCvNzvI6e9y7gtihq5o/qhqwQSnXLFpVZaxOWVADfP/Id/
         +gvEEDYFqqyvPJPhz3M6NV8C4qp8dYyFLsYf2pLZd6FwJGjaYaoDqsV8kLEXlVSQdKib
         PRU987Q1RKQ7usz8+TJGZLqMbK+L7T2q/zgKXUi2gOMHHaS9s71HFGW1+fyb28Rh5qq0
         0BYoKv+dRdvvogO/1pUmliYwdQFrEHiRY4CPpsnyisGwVN9Ee/vw+QFTZjiga6N4EmJT
         2Kvg==
X-Forwarded-Encrypted: i=1; AKwUvBy8ZJBgEt+NSddAGQOhE0IOMLOjZXFt/SqbWkqkYZpm+MAkISAbijCMw2C8bF6CTKNmzAJOEfjHoek6lqA=@vger.kernel.org
X-Gm-Message-State: AFuF++nXCa752BaZGZk+svVj5lN2oHfXWImyt5C+MyBWI66upBDduBSD
	9J98k79hRJUbU/OE1Vj8ePtlcRMoSKCuX+ba4JHR0/9l97OBi/LKWo2mUOQ2PvBbGvylbYxOx9B
	tUbEVx6b/mz6gjnbgmLGXf1DjRJIWIKtrf1EfXoPS1YCJd4gZo0xnFlc0xgAkfQTinXK67ucEJ5
	zyrK++Jqe/FlJnAqYQbn2slt+dpbBU9wsPptcykLHq184KAigTt+hjQ2s172YK6v3BWJWOukrq+
	4/yAhlukDT8nEXg85sW
X-Gm-Gg: AYBFou3AiHlp8T2uRgo4IozXk8S93wOoMrLCjrWEEZY4dvsnPgk3E/NxG2t5N7kPM7d
	VS/R4XQK4F9QJ7zDQtFZipWK06lZdgOePnehKzfIU8KnRaiVn9yXSrOGHKgtdklGds1Bqr9uEki
	pFr/H7+6RZ/XnKfWtWRlvgjgoR2MgH+eRl45QDQYBR8rPgkiP40A0Xi3gOhkRauvZ6xiSdSMpdL
	4r5A9FTEEyMbBLXi9+lR+2mPJcqgGMv5qCM8dbH6rpRVHgExkqvjF0bsFfXjZqvmRBqgZj43bLG
	sVdFd8Tfzov1I0BT38/cefBHEocRE0rz0MGN6sa2Ph+s+agnVl0n9puYnQj0M7o8hZC7PERDyJx
	htSFlvWMUsxn0I6LCKA6d+HrM8X8OYZPucf+0bMnMe/08M6gYBxfbapc8osJdk81VZbTHt4UHc1
	e8FrA6PBxn/7Ar2Rwi2fvg6oX1KNFA5PNr0w==
X-Received: by 2002:a05:6122:8f8b:b0:5c2:b01f:e503 with SMTP id 71dfb90a1353d-5c7ed81a4femr2421278e0c.7.1788519137394;
        Fri, 04 Sep 2026 03:52:17 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-9808ecc52aasm474738241.3.2026.09.04.03.52.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Sep 2026 03:52:17 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39533bb224cso1267850a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788519136; x=1789123936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lsJVghgmykcDqujH5E/4jmjWzxYpohFscUPzleDQWcE=;
        b=cqnfw64Shb7wrNqG9xnMO1FFoUvKbaNqqjPynkTRk9eLFp2uTZbX1nPLbZj/hQ+7vy
         Ebe08O6dIReZW+SsbFak0i6B42+yAgRL3dchwxeSLa4Wtk56JINU7uGP2FgqvWEgSV5w
         ex00wucEMMo+cbao945r/1i+amzChgXk8oBx4=
X-Forwarded-Encrypted: i=1; AKwUvByagznP50/JLNpd8M917iHD4FcwkhYUuguVmzoSEUEU3/qj4soDXN2xmThe1lG6XExTaAfc4V6mD03NaxM=@vger.kernel.org
X-Received: by 2002:a17:90b:39a7:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-39b26125efemr7361668a91.10.1788519135516;
        Fri, 04 Sep 2026 03:52:15 -0700 (PDT)
X-Received: by 2002:a17:90b:39a7:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-39b26125efemr7361550a91.10.1788519134658;
        Fri, 04 Sep 2026 03:52:14 -0700 (PDT)
Received: from mgmt5.dhcp.broadcom.net ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d0asm6171170eec.8.2026.09.04.03.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:52:13 -0700 (PDT)
From: Siva Reddy Kallam <siva.kallam@broadcom.com>
To: leonro@nvidia.com,
	jgg@nvidia.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	Saswati Das <saswati.das@broadcom.com>,
	Siva Reddy Kallam <siva.kallam@broadcom.com>,
	Vikas Gupta <vikas.gupta@broadcom.com>,
	Dharmender Garg <dharmender.garg@broadcom.com>
Subject: [PATCH 02/15] bnge: Add HSI definitions for 64-bit doorbell and MPC channels
Date: Fri,  4 Sep 2026 03:43:10 -0700
Message-ID: <20260904104328.763768-3-siva.kallam@broadcom.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260904104328.763768-1-siva.kallam@broadcom.com>
References: <20260904104328.763768-1-siva.kallam@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Saswati Das <saswati.das@broadcom.com>

Add the Hardware-Software Interface (HSI) structure and macro definitions
required to support 64-bit doorbells and Multi-Path Channel (MPC)
firmware commands/completions for next-generation RoCE:

- Add struct dbc_dbc64: Introduce the 64-bit doorbell layout along with
  field masks, shift offsets, and type/path enumerations. This includes
  queue types (SQ, RQ, SRQ, CQ, NQ, etc.) and paths (ROCE, L2, ENGINE).

- Add MPC Command Macros: Define the main MPC request types (ICA, RCA,
  PFVF, EVENT) and their corresponding subtypes used to manage security
  associations (SA enable, key rotation, SA stats/init), QP/AH
  modification/batching, and PF/VF commands (QP/AH creation,
  modification, and destruction).

- Add MPC Completion Macros & Structs: Add completion error codes for ICA
  and introduce the 8-byte completion header structure (struct
  mpc_cmpl_hdr) used to parse MPC firmware responses.

These definitions will be used by the driver to interface with the
firmware over the MPC/PRIMATE channels.

Signed-off-by: Saswati Das <saswati.das@broadcom.com>
Signed-off-by: Siva Reddy Kallam <siva.kallam@broadcom.com>
Reviewed-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 include/linux/bnge/hsi.h | 161 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 161 insertions(+)

diff --git a/include/linux/bnge/hsi.h b/include/linux/bnge/hsi.h
index 1f7bd96415a5..a3383f2c7381 100644
--- a/include/linux/bnge/hsi.h
+++ b/include/linux/bnge/hsi.h
@@ -12510,6 +12510,43 @@ struct dbc_dbc {
 	#define DBC_DBC_TYPE_LAST          DBC_DBC_TYPE_NULL
 };
 
+/* dbc_dbc64 (size:64b/8B) */
+struct dbc_dbc64 {
+	__le64	dbc;
+	#define DBC_DBC64_INDEX_MASK        0xffffffUL
+	#define DBC_DBC64_INDEX_SFT         0
+	#define DBC_DBC64_EPOCH             0x1000000UL
+	#define DBC_DBC64_TOGGLE_MASK       0x6000000UL
+	#define DBC_DBC64_TOGGLE_SFT        25
+	#define DBC_DBC64_XID_MASK          0xfffff00000000ULL
+	#define DBC_DBC64_XID_SFT           32
+	#define DBC_DBC64_PATH_MASK         0x300000000000000ULL
+	#define DBC_DBC64_PATH_SFT          56
+	#define DBC_DBC64_PATH_ROCE           (0x0ULL << 56)
+	#define DBC_DBC64_PATH_L2             (0x1ULL << 56)
+	#define DBC_DBC64_PATH_ENGINE         (0x2ULL << 56)
+	#define DBC_DBC64_PATH_LAST          DBC_DBC64_PATH_ENGINE
+	#define DBC_DBC64_VALID             0x400000000000000ULL
+	#define DBC_DBC64_DEBUG_TRACE       0x800000000000000ULL
+	#define DBC_DBC64_TYPE_MASK         0xf000000000000000ULL
+	#define DBC_DBC64_TYPE_SFT          60
+	#define DBC_DBC64_TYPE_SQ             (0x0ULL << 60)
+	#define DBC_DBC64_TYPE_RQ             (0x1ULL << 60)
+	#define DBC_DBC64_TYPE_SRQ            (0x2ULL << 60)
+	#define DBC_DBC64_TYPE_SRQ_ARM        (0x3ULL << 60)
+	#define DBC_DBC64_TYPE_CQ             (0x4ULL << 60)
+	#define DBC_DBC64_TYPE_CQ_ARMSE       (0x5ULL << 60)
+	#define DBC_DBC64_TYPE_CQ_ARMALL      (0x6ULL << 60)
+	#define DBC_DBC64_TYPE_CQ_ARMENA      (0x7ULL << 60)
+	#define DBC_DBC64_TYPE_SRQ_ARMENA     (0x8ULL << 60)
+	#define DBC_DBC64_TYPE_CQ_CUTOFF_ACK  (0x9ULL << 60)
+	#define DBC_DBC64_TYPE_NQ             (0xaULL << 60)
+	#define DBC_DBC64_TYPE_NQ_ARM         (0xbULL << 60)
+	#define DBC_DBC64_TYPE_NQ_MASK        (0xeULL << 60)
+	#define DBC_DBC64_TYPE_NULL           (0xfULL << 60)
+	#define DBC_DBC64_TYPE_LAST          DBC_DBC64_TYPE_NULL
+};
+
 /* db_push_start (size:64b/8B) */
 struct db_push_start {
 	u64	db;
@@ -12605,4 +12642,128 @@ struct hcomm_status {
 
 #define HCOMM_STATUS_STRUCT_LOC 0x31001F0UL
 
+/* MPC macros */
+#define MPC_CMD_HDR_REQ_TYPE_ICA   0x1UL
+#define MPC_CMD_HDR_REQ_TYPE_RCA   0x2UL
+#define MPC_CMD_HDR_REQ_TYPE_PFVF  0x3UL
+#define MPC_CMD_HDR_REQ_TYPE_EVENT 0x4UL
+#define MPC_CMD_HDR_REQ_TYPE_LAST MPC_CMD_HDR_REQ_TYPE_EVENT
+
+#define MPC_CMD_HDR_REQ_SUB_TYPE_ICA_SA_ENABLE                  0x0UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_ICA_SM_PSP_SA_INIT             0x1UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_ICA_SM_PSP_NEW_RX_ASSOC        0x2UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_ICA_SM_PSP_KEY_ROTATE          0x3UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_ICA_CM_PSP_SA_INIT             0x4UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_ICA_CM_PSP_KEY_ROTATE          0x5UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_ICA_CM_PSP_KEY_SET             0x6UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_ICA_SA_INFO_GET                0x7UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_ICA_SA_STATS_GET               0x8UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_ICA_SA_STATS_CLEAR             0x9UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_ICA_SA_RX_MATCH_RULE_SET       0xaUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_ICA_SM_PSP_SA_SET              0xbUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_RCA_QP_MODIFY                  0x0UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_RCA_AH_MODIFY                  0x1UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_RCA_QP_MODIFY_CMPL             0x2UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_RCA_AH_MODIFY_CMPL             0x3UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_RCA_QP_MODIFY_BATCH            0x4UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_RCA_AH_MODIFY_BATCH            0x5UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_RCA_QP_MODIFY_BATCH_CMPL       0x6UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_RCA_AH_MODIFY_BATCH_CMPL       0x7UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_RCA_MPC_TEST_CMD               0xc8UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_RCA_MPC_TEST_CMPL              0xc9UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_EVENT_RESP_CMPL                0x0UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_CREATE                 0x0UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_CREATE                 0x1UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_MODIFY                 0x2UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_MODIFY                 0x3UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_DESTROY                0x4UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_DESTROY                0x5UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_CREATE_CMPL            0xaUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_CREATE_CMPL            0xbUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_MODIFY_CMPL            0xcUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_MODIFY_CMPL            0xdUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_DESTROY_CMPL           0xeUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_DESTROY_CMPL           0xfUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_CREATE_FWD_REQ         0x14UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_CREATE_FWD_REQ         0x15UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_MODIFY_FWD_REQ         0x16UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_MODIFY_FWD_REQ         0x17UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_DESTROY_FWD_REQ        0x18UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_DESTROY_FWD_REQ        0x19UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_CREATE_FWD_RESP        0x1eUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_CREATE_FWD_RESP        0x1fUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_MODIFY_FWD_RESP        0x20UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_MODIFY_FWD_RESP        0x21UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_DESTROY_FWD_RESP       0x22UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_DESTROY_FWD_RESP       0x23UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_ALL_FWD_RESP_CMPL         0x28UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_CREATE_BATCH           0x32UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_CREATE_BATCH           0x33UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_MODIFY_BATCH           0x34UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_MODIFY_BATCH           0x35UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_DESTROY_BATCH          0x36UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_DESTROY_BATCH          0x37UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_CREATE_BATCH_CMPL      0x3cUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_CREATE_BATCH_CMPL      0x3dUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_MODIFY_BATCH_CMPL      0x3eUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_MODIFY_BATCH_CMPL      0x3fUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_DESTROY_BATCH_CMPL     0x40UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_DESTROY_BATCH_CMPL     0x41UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_CREATE_BATCH_FWD_REQ   0x46UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_CREATE_BATCH_FWD_REQ   0x47UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_MODIFY_BATCH_FWD_REQ   0x48UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_MODIFY_BATCH_FWD_REQ   0x49UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_DESTROY_BATCH_FWD_REQ  0x4aUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_DESTROY_BATCH_FWD_REQ  0x4bUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_CREATE_BATCH_FWD_RESP  0x50UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_CREATE_BATCH_FWD_RESP  0x51UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_MODIFY_BATCH_FWD_RESP  0x52UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_MODIFY_BATCH_FWD_RESP  0x53UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_QP_DESTROY_BATCH_FWD_RESP 0x54UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_AH_DESTROY_BATCH_FWD_RESP 0x55UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_ALL_BATCH_FWD_RESP_CMPL   0x5aUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_DRV_RGTR                  0x64UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_DRV_RGTR_CMPL             0x65UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_DRV_UNRGTR                0x66UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_DRV_UNRGTR_CMPL           0x67UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_BUF_RGTR                  0x68UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_BUF_RGTR_CMPL             0x69UL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_BUF_UNRGTR                0x6aUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_BUF_UNRGTR_CMPL           0x6bUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_MPC_TEST_CMD              0xcaUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_MPC_TEST_CMPL             0xcbUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_MPC_TEST_FWD_CMD          0xccUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_MPC_TEST_FWD_CMPL         0xcdUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_MPC_TEST_FWD_REQ          0xceUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_MPC_TEST_FWD_RESP         0xcfUL
+#define MPC_CMD_HDR_REQ_SUB_TYPE_LAST    MPC_CMD_HDR_REQ_SUB_TYPE_PFVF_MPC_TEST_FWD_RESP
+
+#define MPC_CMPL_HDR_ERROR_CODE_ICA_ERR_NONE                   0x0UL
+#define MPC_CMPL_HDR_ERROR_CODE_ICA_ERR_BAD_TARGET_ID          0x1UL
+#define MPC_CMPL_HDR_ERROR_CODE_ICA_ERR_SA_NOT_INIT_ENABLED    0x2UL
+#define MPC_CMPL_HDR_ERROR_CODE_ICA_ERR_HW_CMD_FAILED          0x3UL
+#define MPC_CMPL_HDR_ERROR_CODE_ICA_ERR_BAD_PSP_MODE           0x4UL
+#define MPC_CMPL_HDR_ERROR_CODE_ICA_ERR_BAD_SPI                0x5UL
+#define MPC_CMPL_HDR_ERROR_CODE_ICA_ERR_SPI_THRESHOLD_BREACHED 0x6UL
+#define MPC_CMPL_HDR_ERROR_CODE_ICA_ERR_ACTIVE_QPS_EXIST       0x7UL
+#define MPC_CMPL_HDR_ERROR_CODE_LAST     MPC_CMPL_HDR_ERROR_CODE_ICA_ERR_ACTIVE_QPS_EXIST
+
+/* mpc_cmpl_hdr (size:64b/8B) */
+struct mpc_cmpl_hdr {
+	u8	cmpl_type_reserved;
+	#define CMPL_TYPE_RESERVED_CMPL_TYPE_MASK         0x3fUL
+	#define CMPL_TYPE_RESERVED_CMPL_TYPE_SFT          0
+	#define CMPL_TYPE_RESERVED_CMPL_TYPE_MPC_CMP_SHORT  0x1eUL
+	#define CMPL_TYPE_RESERVED_CMPL_TYPE_MPC_CMP_LONG   0x1fUL
+	#define CMPL_TYPE_RESERVED_CMPL_TYPE_LAST          CMPL_TYPE_RESERVED_CMPL_TYPE_MPC_CMP_LONG
+	u8	error_code_mp_client;
+	#define ERROR_CODE_MP_CLIENT_ERROR_CODE_MASK 0xfUL
+	#define ERROR_CODE_MP_CLIENT_ERROR_CODE_SFT 0
+	#define ERROR_CODE_MP_CLIENT_MP_CLIENT_MASK 0xf0UL
+	#define ERROR_CODE_MP_CLIENT_MP_CLIENT_SFT  4
+	u8	req_type;
+	u8	req_subtype;
+	__le32	opaque;
+};
+
 #endif /* _BNGE_HSI_H_ */
-- 
2.43.5

