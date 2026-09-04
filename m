Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E56423E98
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522941; cv=none; b=l+xQd7C0UsUedcFya/+TjnYu9+fTqxL0AnVtrfxCFJmR06HzhNavOCmMhO5qNVG51mYs1dxeVYSIVJ4euy0TcaGaHRo1lBpCW1grUm7g9T+aJSWy2Ks+V5mILDFpy1HvPOBPV0l883QAOC8JeLIt2ppPN5ZMUrI7Emg7tH78kbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522941; c=relaxed/simple;
	bh=z8iIzs5DDnWzQtw2LUYeiEuFEzPHhCuXMUc1+Axn0VU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IJE+MZe221uc+87qbclfCiahXYZUqUHuKDEMgBDoCPxCfNuvgwWqQT9WkZLLfQlENMSfkYAXAidewm2776WpwPX2jVR8sq7Xunq1vNpssRWsmxwMeJCpG5N8HhyFM26IafD7ZlzEWaxSANZQcXuMj3QGiGNhvnBH7niG41SQLps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvXmmnOa; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvXmmnOa"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d6e954afbdso5877115ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522940; x=1789127740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xdr1Kg5gJsWYJr/v5Af5lr5k6jYnKDbP79UXMnLtwuM=;
        b=SvXmmnOaPnZEz2k7Tmbq9GY0Uedt57A5MkQqqwpFpIr7+JWb8nEq04iev9PqJw6T2Z
         HA7FQyVQM3slEXNUuG41uE/yUfy3f0MD6tS/whueLddOvCrvxAeN2Ob61rsmPK75rOWN
         vJLSxvCyE6cb2Ho/bmZTfQnXTuO10fVR1JNCQ2KghIwKEQb9uo29+D7/mltKGj9LsAri
         uJmRrT/BNAQMhvOh0whQFp89F6anmj1ldQve4i/Lu2+UXLU5l6H0Cxc0JyCaQGS1T6x0
         T5e6pBnx8WXtxAf92tCshM5c7Ee9hvmbwCUIwLDGj/13HYV2QZzb+OeeBczPpaobauSB
         ObQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522940; x=1789127740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xdr1Kg5gJsWYJr/v5Af5lr5k6jYnKDbP79UXMnLtwuM=;
        b=VOzqrE9k/HdpHnIElprMqS4jBOp9bxL4HezYCemIDd2RObwZn0gfodKCj7Bjsb42Um
         pmmPXtNIr6+yiZ0h1XjyBil2XofBpJ5SeGa+tkCp0Z5yw0Cpb55pduFQsdDeJ+QFOzbY
         dceaa6tgq6K4jDfEFl+C4L4ik+9GySvd7MM9u/5LiNijVftICqCdrnpdZxlgXOPPOwMK
         uxXxi7Q++SQIQu1sVR38fRxWOtPNygz4yPbgfdHixgRyjnvMBrw4lM2nsmROBTITpRS0
         dTYJRbzMmXn7xe+Hid6IfwBpNd0weuLf8ZghpkmrkUaZz6XoKEwo6IYCQcYjNprnY5VD
         D0cg==
X-Gm-Message-State: AFuF++lvYHkl4ltbpw9F0fpoiRDaA4Eeq3KJj61z2cjQj1SAuaXM+2OS
	XdHU9C7waIC2S9CjBqIFSDPrRnmpc9Roope0vmbWRaiZNh6YExhUcZq0riJyccCPNZc=
X-Gm-Gg: AYBFou0bRz41nZfiVHOyZAEAAwFR4woEfOjx3SknH+U0sXJXgnLQzuGzDWsQKdGmXbz
	wEiH/zuwWtr/RNUeOA0h5P8p7ob6OzrL5gt+y4NHmvWvUVs06Ceno5qYNA5V33T7AgwkGqd2Qga
	+tTVPsK5KuCOPjmvN3Jjw+yG976ud3pg6rqHH309wcb4wsIrMokt1/M7O4Xwz1FV7VPmKiWTSgz
	T24IHYqSp2Mflt2CpkU/xdARPZBpX2AYS+PmiRbQwSPWFD9XMCQUnBGNGi9JZAHSXC+XYHLNdMN
	KjGFrZYozPX2byNdflTvWpqN5eacb3s//9lWzXvKWvh0EcNObl4AAqdgbXqMHSEC3N8Yym60irg
	ZfLG5BKUSdrgROowyP0NwGhWdAJDnhc5yuaVPlZTB3gaoRSkZYSAJfHeTU3AdRetNGljDd7hkB2
	mrJ+f3hkTVGe8dgA2RprQ8HORY1kS6EJTC9MTLCqHFoiOOAM2mQX59TsYnHXz3M6BdKqZzupNLF
	ZdBWXev30gDcdo=
X-Received: by 2002:a17:90b:2749:b0:398:d292:e6d5 with SMTP id 98e67ed59e1d1-39b26304385mr9396199a91.24.1788522939620;
        Fri, 04 Sep 2026 04:55:39 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm9246445eec.16.2026.09.04.04.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:55:39 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	ntb@lists.linux.dev
Subject: [PATCH] ntb: fix typo "atleast" in comments
Date: Fri,  4 Sep 2026 17:25:33 +0530
Message-ID: <20260904115534.11165-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "atleast" to "at least", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/ntb/ntb_transport.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ntb/ntb_transport.c b/drivers/ntb/ntb_transport.c
index f9caa1a653c5..47585dc62eb7 100644
--- a/drivers/ntb/ntb_transport.c
+++ b/drivers/ntb/ntb_transport.c
@@ -611,7 +611,7 @@ static int ntb_transport_setup_qp_mw(struct ntb_transport_ctx *nt,
 
 	qp->remote_rx_info = qp->rx_buff + rx_size;
 
-	/* Due to housekeeping, there must be atleast 2 buffs */
+	/* Due to housekeeping, there must be at least 2 buffs */
 	qp->rx_max_frame = min(transport_mtu, rx_size / 2);
 	qp->rx_max_entry = rx_size / qp->rx_max_frame;
 	qp->rx_index = 0;
@@ -1195,7 +1195,7 @@ static int ntb_transport_init_queue(struct ntb_transport_ctx *nt,
 	tx_size -= sizeof(struct ntb_rx_info);
 	qp->rx_info = qp->tx_mw + tx_size;
 
-	/* Due to housekeeping, there must be atleast 2 buffs */
+	/* Due to housekeeping, there must be at least 2 buffs */
 	qp->tx_max_frame = min(transport_mtu, tx_size / 2);
 	qp->tx_max_entry = tx_size / qp->tx_max_frame;
 
-- 
2.48.1

