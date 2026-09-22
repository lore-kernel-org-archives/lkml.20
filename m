Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DD13F6C3E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055067; cv=none; b=EhslweDIgyd/hD8uEUzEpWXS3s8GG4h+A+c+nXeUoM+BXL1FkxnECu/xsWwr275XnkJ5XHEcSgEp1zEPxDa7GSTR6TU1QLr65Xe5LyCM2vx97KE3cLNVxLMX4aH88k3PHIX8Q0Jue6UC+AVau7RQ8mFTrikouX3HmTOF6hpFGkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055067; c=relaxed/simple;
	bh=HMr+FTKSXdaAvtfbSzFFav/sQ1dYA/aUy2gruEkZvXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nz+LlvwGmRf4WRvPlfzrw8KF2qgZgd10yua6L1Iiunrv5j0DY/3CgXjhb7erx0OzFLbs7fAg2pAyhtQh/j9DK0GRXWsaJ5+2zMYN2JOxDoB6bSxq3M1gYfPb+RNuENlg3sQ6Ul7CPg+UVk/4/+RJzNqxFd4b/Exy9UowM+HdDJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bOpFBKQd; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bOpFBKQd"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2d58efc7356so25082075ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055061; x=1790659861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6bjthBBm7uT2MkmTwxK/+W0UJNyCdyeJcyjZyefo08M=;
        b=vX1pWAIVlmFHOxmqGPnG3lYwhxdkgeJeMMoLozzWFe/zIylRcpDKFeuNdnqZdGGJ5h
         2rbpKOBcs5qW6Nycs9FY76dV+OFgA9h1ohqRoNmGuMEkKmHeUVEIhKnyX0BSDntdjMaY
         XqnOpuFIBJydRBz/zVLqm3QtCRmO4FRdRWJerGXlHcmmXsoMBp3out1n0TTqjp8QBrja
         MocYNyB8a5AKADENOu6Uik/VdJRTJaN9Uqplfdx2cIWG1Qc1Qa3W5TFuSaGd+Ugoydzo
         UMcLaAOVnwWoH9T6+WAfNNcLTGOmXkBa+ZV5I8pH+n5gZd0SfFSDpuhO/n+NzmfBkqha
         LHuw==
X-Forwarded-Encrypted: i=1; AKwUvBwoBAStFZw7J/ZRVnoiiEfGpZKUigGeK7uIGJ2BcZnx3+HkdE/pkZyz9x66QMafjFizf7xp41ONwtGy1W0=@vger.kernel.org
X-Gm-Message-State: AFuF++kQgcxT7Z29jvjZHGCBVYt7dLBzQtXqD6exZHthbHUSRZwGmHoG
	OJ361U8OtinXvP7Pi/s/b3FEQSZiZmNE9Q5Iq1/8l3WQjQEYLWYoqzoWJOPqZR+dQWhedD4TH1U
	p/lYOSGRHYZFcbh8d0dcHKMEvVUkhOaICEHaDMOtNf3HEWNzm4m8oVHWtmBI+VeSED8E2RImLjz
	t9inN12fjnMEF0KTo5wYhJRDPWMbRHGs+ungS5/LRYPn+ilRYjwvtgFjQVih2mYdYF+z4RDphci
	LSWYA729jfM64x4hoXOKe55Fg==
X-Gm-Gg: AYBFou2QSDIsKod35+U/WJn8aEIFLGiQtxGecGVKXe+Ui9SpID2c5Wao8G8lOyGWLkg
	od29JYS99YvqqRQr8Hz+hBOD80GRgkzHdt3kGCaM14KV/BVIHiQdlR2HB9vifMwhh+wACwyY6d+
	tNa/S7TpYIgu4Gvf5OaHTB3dDnOcNwtCCr9mcvNN4ufmivG5t5q/OTimiMDvHaqNXE1i5zmn+nK
	GuWRZkIcxQvNl3aR1dNQXvSYDufsmlB3kAt8eELB/xon0oiHEmTUEqx/Ihd2fLhgmJcdGNwO4RI
	UdmN1CaVg9KHckuARnKrEz++qTJZykijG3NnqKPk1eMMJmzxXnY1Y1+m22hEdT6qimo+kTrgrWP
	aFvXc4NIxgJfcpu9sxq4WGcsiKCNf0rFul/PbT79vM3qHOWbmEDT+wmypv/dGTUq+TgyVeDAOFe
	cz6kdUvaro1wbxQlB2TIX8/EVUMvoAKccQU/eL9WGYLqCk
X-Received: by 2002:a17:90b:180a:b0:39e:6c69:34d6 with SMTP id 98e67ed59e1d1-3a073308e97mr27601a91.58.1790055061138;
        Mon, 21 Sep 2026 22:31:01 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a06e246bbasm469616a91.1.2026.09.21.22.31.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:31:01 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so3097149a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790055059; x=1790659859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bjthBBm7uT2MkmTwxK/+W0UJNyCdyeJcyjZyefo08M=;
        b=bOpFBKQdchqGQicyko/Cf1vPzTkhguGRYD6IRIwAKuDTJKl5McTbo3QzcIuVgr9AJ6
         oetlthpJMOAuRoRvaK5XHntxFmyAvz6z5GaCHywccBeKgCnTaueXioWi4uDQmgoBZ23C
         7g1xeuvlWR+1hO1bNQb8YZm3YNLR5YsIu4wTg=
X-Forwarded-Encrypted: i=1; AKwUvBwXRTcfoquLE4Okab8pemH7VPtfRl6LY1Lk0hS7m4mvklHe2x3QUGdpcU98cMUArBrAPSTGGurxJGmO/u4=@vger.kernel.org
X-Received: by 2002:a17:90b:3950:b0:39e:6a81:5a8f with SMTP id 98e67ed59e1d1-3a07328562fmr29265a91.35.1790055059049;
        Mon, 21 Sep 2026 22:30:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3950:b0:39e:6a81:5a8f with SMTP id 98e67ed59e1d1-3a07328562fmr29239a91.35.1790055058553;
        Mon, 21 Sep 2026 22:30:58 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f29dc903sm2029025c88.3.2026.09.21.22.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 22:30:58 -0700 (PDT)
From: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	vikas.gupta@broadcom.com,
	Bhargava Marreddy <bhargava.marreddy@broadcom.com>,
	Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>,
	Dharmender Garg <dharmender.garg@broadcom.com>
Subject: [PATCH net-next v2 4/6] bnge: Drop obsolete bn->bnapi NULL checks in open/close paths
Date: Tue, 22 Sep 2026 10:59:02 +0530
Message-ID: <20260922052904.59237-5-bhargava.marreddy@broadcom.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922052904.59237-1-bhargava.marreddy@broadcom.com>
References: <20260922052904.59237-1-bhargava.marreddy@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Since bn->bnapi is now allocated during probe in bnge_netdev_alloc() and
freed in bnge_netdev_free(), it remains non-NULL for the lifetime of the
open/close path helpers.

Remove the dead "if (!bn->bnapi)" guards in bnge_free_ring_stats(),
bnge_clear_bnapi_queues(), bnge_disable_int(), and bnge_hwrm_ring_free().

Signed-off-by: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge_netdev.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index 367109dad496..9e606fd1a580 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -85,9 +85,6 @@ static void bnge_free_ring_stats(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
-	if (!bn->bnapi)
-		return;
-
 	for (i = 0; i < bd->nq_nr_rings; i++) {
 		struct bnge_napi *bnapi = bn->bnapi[i];
 		struct bnge_nq_ring_info *nqr = &bnapi->nq_ring;
@@ -1247,9 +1244,6 @@ static void bnge_clear_bnapi_queues(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
-	if (!bn->bnapi)
-		return;
-
 	for (i = 0; i < bd->nq_nr_rings; i++) {
 		struct bnge_napi *bnapi = bn->bnapi[i];
 		int j;
@@ -2382,9 +2376,6 @@ static void bnge_disable_int(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
-	if (!bn->bnapi)
-		return;
-
 	for (i = 0; i < bd->nq_nr_rings; i++) {
 		struct bnge_napi *bnapi = bn->bnapi[i];
 		struct bnge_nq_ring_info *nqr;
@@ -2576,9 +2567,6 @@ static void bnge_hwrm_ring_free(struct bnge_net *bn, bool close_path)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
-	if (!bn->bnapi)
-		return;
-
 	for (i = 0; i < bd->tx_nr_rings; i++)
 		bnge_hwrm_tx_ring_free(bn, &bn->tx_ring[i], close_path);
 
-- 
2.47.3

