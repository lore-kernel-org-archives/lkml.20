Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F17B499F35
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791303842; cv=none; b=JMFGMMdwsiVCiMvXtkJqTP7Lle2XpYX16MCEvf6cBYesSV5P+u8HWqanHCrlkhi4FK0IbA+/0+Wck7dsOwUo+utn7MDPGBk7CxMYgCoLU3U/IFmb2NzlxhEvUtbKJ/PBVATiGfQkP9Ovk+Dy5Sh2hlBfUOBdoRUNt5bQFjC4+dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791303842; c=relaxed/simple;
	bh=6cmN/qwkD8ab61iBdsCMwN0wwf/+T1bgiKqzPXzdJxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FNxGBQ7EDk/qLIT9FG1qmq0CDBWTgz8iG0WrwpRFIUT8nU9C48zA7Esbwfm1mQDUNUtzvuSbFs+VkZ7RYGWt7UNhQQUyo8LrW2mk50im3fVqYppGcG3SpwQzeCXyChH7jn7z5eR2+CmvoZAC+l9AOnp9QcjBGPi6EtMfnWGTXpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bqJmwCzE; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bqJmwCzE"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3a865731ee4so789848a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791303837; x=1791908637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O9o4IvyhfjrWzzCJjzj8Xul7I3SwiYZGMT3QQaUEesk=;
        b=pIRtywROkzGX1aw1vTgZz0+qWa9N72lFOvGbXafkM/1dmHf52hndAGzMbpTuCyM44h
         1NkLFhEpZGsL7Oq/ctGkOx/84Cy60/K5EyyNy6jawUQg/Lc3ULc8Hv5sqd5e4SyGhlRV
         QIHzxk2tHAF4H2nHDCMOhFClo1T+pxFW9DMZER8GSEtJ7xd9HsyUixBdPOwsFLph1bbr
         uf4uVjziWoKkKokyT9YHx/rQ1MLkc66pyhUHAosvGWDVexEu4wpiW96EpMVi8md+WROk
         qIOezwA9No2gs8EmU2VNsr4abdqoPYEuUnKLKpHtBUsGoQCd0i+dHkJGH60QcT2WRBl4
         TweA==
X-Forwarded-Encrypted: i=1; AKwUvBy7nilFN+2UC5Ju650NHWbG4OdBkcBycZhH0a0jnOJcmy7Cgg584V4jloyyfFW6xyW6w7Q9TQIHHAbZPgU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2Iqde16riUVzIwF87VrlwZY8QkYZANmBKejFWkNIj3lC50FqU
	+xoU2/4uPsh6DqC++w9j3ZZKYTSaxigT7PSalaXubxeX9wPTUo/8j5IA/lQW8ayNePsjgT3xtlR
	CrFq2CaglvGGe6jl6XtsXf7qT9gU4GCQJiBFTl4QaZeNfkTdt+48mqVtdW/zKQmeiQAWxGoeN+b
	qkabj5jN3QI7qseiiw7NcRP2D2F/o1tTvva4iuDeW/rmzNMh9N2Hace9dSfBMDTmVCLgnXp0ChS
	dQi+m4bg5NlEzfZ3dgG
X-Gm-Gg: AYBFou2we1PW5P2dWE/c3SZmHiYx3mSN3U4mganDPqSHMCtQ+RjbnxckwZHS2NFzl0R
	h8H1tNFKOBEZsn+Uyia8DhmvfyjuU5Z/7RmmTAMtHDCBQlwVDSKZWYly7BryCY9ats0Hyl7Ycoe
	dFnKekNzrEo5rmooqcIhQjjZkOyxpqVyUxQNb93tx+BdE1XwsPL6ZVzfwJ9BzugKa5jwoTCUze4
	dcW0il1+w9cyUm4ks8Yh6mh+Rh48kv37AmCN19ahCvRVt3J/9F/j5LJZv3eGZaWVaDgTIYFoXDz
	03uWLbURRqRDcPfAk70WGGI/Ep76FRAP3CrG3TSq2z27wEkGUUhu5WkcAqolwNaHlivBalopCCk
	VY5Ayzoi4T4iUZ0yBZHAOSb+hyGT2f04zw3KEFHANOOI+BjjRYJnTBP4XTwXTXRrgR8/C4B2ako
	Wjp8BjRseLOw4NxCaZwHaI4AWqz19u7UzrJ+VS
X-Received: by 2002:a17:90b:2d86:b0:3a8:d71:5fda with SMTP id 98e67ed59e1d1-3a80d7165f3mr5373209a91.63.1791303836724;
        Tue, 06 Oct 2026 09:23:56 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a897a1e0dasm84319a91.0.2026.10.06.09.23.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Oct 2026 09:23:56 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-533928ef33aso38970991cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791303835; x=1791908635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O9o4IvyhfjrWzzCJjzj8Xul7I3SwiYZGMT3QQaUEesk=;
        b=bqJmwCzEH39dHvmIJvZ9nRBDHmSS6iFUyhAWL5JbfzbS4L2Og0xqwgB7zECNeKp6Vd
         uEwCBkoprfDlhlqKFqNGatP5GP/kZ+aTO79gD+df3425lzUGoZanexwdXA6AoP5v/TFG
         7cBAyMxsW7wFnDErZCo7oXnhO4MxV/ZMX2HlU=
X-Forwarded-Encrypted: i=1; AKwUvBzi4vDDUcUNatdbTuv3gIkHuNH+saVxa1tIYSY2j7tdT9F+gZLHaTjBei7y6YE3SLf6KYPfxh1pPpDnqvY=@vger.kernel.org
X-Received: by 2002:ac8:7f52:0:b0:535:10be:7d5e with SMTP id d75a77b69052e-53511ea8900mr203895161cf.46.1791303835222;
        Tue, 06 Oct 2026 09:23:55 -0700 (PDT)
X-Received: by 2002:ac8:7f52:0:b0:535:10be:7d5e with SMTP id d75a77b69052e-53511ea8900mr203894401cf.46.1791303834410;
        Tue, 06 Oct 2026 09:23:54 -0700 (PDT)
Received: from mgmt5.dhcp.broadcom.net ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5356b860df8sm9020961cf.14.2026.10.06.09.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:23:53 -0700 (PDT)
From: Siva Reddy Kallam <siva.kallam@broadcom.com>
To: leonro@nvidia.com,
	jgg@nvidia.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: vikas.gupta@broadcom.com,
	ajit.khaparde@broadcom.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	Saswati Das <saswati.das@broadcom.com>,
	Siva Reddy Kallam <siva.kallam@broadcom.com>,
	Dharmender Garg <dharmender.garg@broadcom.com>
Subject: [net-next v2 2/3] bnge: Update HSI
Date: Tue,  6 Oct 2026 09:12:55 -0700
Message-ID: <20261006161256.1493672-3-siva.kallam@broadcom.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261006161256.1493672-1-siva.kallam@broadcom.com>
References: <20261006161256.1493672-1-siva.kallam@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Saswati Das <saswati.das@broadcom.com>

Add support for 64-bit doorbells and Mid Path Channel (MPC) firmware
commands/completions.

Signed-off-by: Saswati Das <saswati.das@broadcom.com>
Signed-off-by: Siva Reddy Kallam <siva.kallam@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
Reviewed-by: Vikas Gupta <vikas.gupta@broadcom.com>
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

