Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5C2432BF4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751569; cv=none; b=pzDKMfKKSoDu6L9C1XfF0tzcsI7Y3SHI86olSlVfA8QAYOwagtO6RUTMZKIly6kFcQ/r8oZr8uycH6WN8oMW15fMWC95uY1INtZKkROBjmnlsZQVx5VVdJHDgyQQVS1b6uBT1fokZ9GezwhS9XYdUUHzGGaF50TU6u8GQh3ufvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751569; c=relaxed/simple;
	bh=tK+c0krWHh6O73tw31MVp5gyMALoBSTzTvtq8Lm++2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sHKnyWcEUaY7tLty9oQMp+bxya5dm7zmWSt60epwlVMw/9Qgmon60oUILxlGFSv+92mqoYl1sYi1NK70DC1IJ1EqQ5rsLLPOPExst2fywF4gBNlnhlOa3Qmx4FHCoDdUD4S949JtnQyQUv3iHbvY4Zm08bZ6nerhUKXmgVNQW6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnupSoWJ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnupSoWJ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so23854495e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751547; x=1791356347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3hIjYJMajezV+sDqkSmD0y2RNrwAHxMDlFZcFTj1lfM=;
        b=ZnupSoWJY8xdG5tGT/DqFeH9/8TusXpD4YSg+WUF0P0VtFXDU2w1YBN5SbqQhkClLC
         eDfqPMpZpa44gblXPcNZOZ+zqfhw42uSlNJHt0qVsc6c2Sv+pNc5A/Uqf/7oBKfN6D19
         BAmsTxJQT+BG59qz1SciniE1AANBRgWUf/zxlxCIGuAtEHm3UJNXGjscM4oYU0TB5vmK
         IyLhAEY1CtpEKa1DxZkkNNA5WoXIBAocpL0/nxR/tHmgpmbSkUf9hhIR+GBnuPDev34M
         VPT0Q9TTGD0W7ZAqHc2bZ6OE2PpWffoirSEXg3ze8Lu817wOugjZLEbtp4JDtFOpgZb1
         UBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751547; x=1791356347;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3hIjYJMajezV+sDqkSmD0y2RNrwAHxMDlFZcFTj1lfM=;
        b=gIFqi5/vZsMLw3Zf++Xd3kUZWq1ocZ2RT2VmKmrKKJqr91LKrukxISVxgM4XzUBqP3
         w2AQTHlc7FF89s3PtaBYlueUJvzBIeThnVksXVXvJOJwHxy4mZEc7wZHGyxGl7iLxglJ
         6EKtfZdT64cB/kbd+s2T4aRycJjspNtG6Jau4nwwlyNX/4PSkx/A7GPkxDBvminO73At
         W/zf4/EXd/z7kBooBUT1aVT5Nm2rbV3I/Z3YWOijn49I6HEA+7QbMXyTHaIDPmWTrxCK
         n6S+lBvKcVCUiJXe4l+1YEk/6qchaP5MqEQotGZYAWGce9F7RU72h5wuDlNsIt032QfV
         p5ZA==
X-Forwarded-Encrypted: i=1; AKwUvByPJzo6G0ZmYI6fj0jLz6/TqomK+fwmknsVE3BEVvtUucC3cpC8d1SkrbO0LEWS3+W34cfS6zQrjUyFyvI=@vger.kernel.org
X-Gm-Message-State: AFuF++kiuk7+FwGAwkGcHCCEJf0qbY241a7HHteqH6Bt3NsORgsb+CsI
	D6kCbJNrzu9I2IUuqlMDRUmQQp+rrx0WpZHSC4lckqZMRp3WVnPQE83b8eqvDw==
X-Gm-Gg: AYBFou3ax2VV780Va181zTPRv6LMaWPI9+tTpBOdksFZhjfsZ8Ch3mSwAwclN7iTwNh
	33TmT/2o2QqHlTzaJtywjuVbLOCLcUJfxNpyD9sjgVQ10cJ52bjTG3OTNShjNgQVaseX2yAVGS8
	RVbUMWaoNnc8B544O/ltmioRxRzG4E//gZtGb1zTbKPbGczfccHa8bTU0gMtgqI6EOI5rdcR5/s
	n5aiGHHhLC+8g+kqLl3y2oOHYzER6plSTx72E3ayRmPyrt9MM110+iOYAkeusejaEwV1nVhohQm
	4tl1a8FNOndeDJh8uLVBt0V6pjLMwslRGeG8g9C0qpxZrNRoCLmtLZshnYhyK2ruinr1eo33U5T
	tjgJ0KBwfcO8yrd1xiO+WC+DymcepYRptGylUz1FVYtXIiqFguFoAj4BWikT0JQaWFF03gGqlZ0
	XXbYJPS7PEnIPZv0hUnr+GqcB6Y8IugMaBwwuX8gCJowJL1qfC7ymbjZ9sdtV3PT1i5mhhJZ7tT
	rfRdLwIwzVGHs2BcyTh4tE0KLs4U0ti+oBljxBZ+sZn8aRwdTXU11i2DCg1DgoP
X-Received: by 2002:a05:600c:1f8b:b0:4a0:108:3b48 with SMTP id 5b1f17b1804b1-4a01addee56mr5091765e9.7.1790751546607;
        Tue, 29 Sep 2026 23:59:06 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a0174fb304sm27802115e9.11.2026.09.29.23.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:59:06 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Leto=20Liu=20=28=E5=88=98=E6=B6=9B=29?= <Leto.Liu@airoha.com>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH net v6] net: airoha: Add retry mechanism to airoha_qdma_set_trtcm_param()
Date: Wed, 30 Sep 2026 08:58:48 +0200
Message-ID: <20260930065855.46171-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Leto Liu (刘涛) <Leto.Liu@airoha.com>

CPU accesses QDMA via the bus. When multiple modules are using the bus
simultaneously, CPU access to QDMA may encounter bus timeouts and fails,
resulting in QDMA configuration failures and potentially causing packet
transmission issues. In order to mitigate the issue, introduce a retry
mechanism to airoha_qdma_set_trtcm_param routine in order to ensure the
configuration is correctly applied to the hardware.

It's enough to try a second time for the TRTCM config to be actually
applied to make sure we are not in the middle of bucket handling as it does
operate on fixed time slot internally.

Fixes: ef1ca9271313b ("net: airoha: Add sched HTB offload support")
Signed-off-by: Leto Liu (刘涛) <Leto.Liu@airoha.com>
[ improve commit description, drop memory block, apply better loop logic]
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v6:
- Out of RFC
- Fix to correct Author (confirmed by Airoha)
Changes v5:
- Drop memory block (not needed)
- Loop only 2 times
- Improve description
Changes v4:
- Rebase on top of net
Changes v3:
- Init data
- Use continue instead of negative error for poll
- Add memobry block after CFG_PARAM

 drivers/net/ethernet/airoha/airoha_eth.c | 32 +++++++++++++++++++-----
 drivers/net/ethernet/airoha/airoha_eth.h |  2 ++
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 21ac80bdd084..b164a78ddac9 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -3120,14 +3120,34 @@ static int airoha_qdma_set_trtcm_param(struct airoha_qdma *qdma, int channel,
 		     FIELD_PREP(TRTCM_METER_GROUP_MASK, group) |
 		     FIELD_PREP(TRTCM_PARAM_INDEX_MASK, idx) |
 		     FIELD_PREP(TRTCM_PARAM_RATE_TYPE_MASK, mode);
+	int i;
 
-	airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
-	airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
+	/*
+	 * HW might be in the middle of bucket handling and might
+	 * require an additional try to actually apply the new TRTCM
+	 * config.
+	 */
+	for (i = 0; i < TRTCM_CONFIG_RETRY_MAX; i++) {
+		u32 data = 0;
 
-	return read_poll_timeout(airoha_qdma_rr, val,
-				 val & TRTCM_PARAM_RW_DONE_MASK,
-				 USEC_PER_MSEC, 10 * USEC_PER_MSEC, true,
-				 qdma, REG_TRTCM_CFG_PARAM(addr));
+		airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
+		airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
+
+		if (read_poll_timeout(airoha_qdma_rr, data,
+				      data & TRTCM_PARAM_RW_DONE_MASK,
+				      USEC_PER_MSEC, 10 * USEC_PER_MSEC,
+				      true, qdma, REG_TRTCM_CFG_PARAM(addr)))
+			continue;
+
+		if (airoha_qdma_get_trtcm_param(qdma, channel, addr, param,
+						mode, &data, NULL))
+			continue;
+
+		if (data == val)
+			return 0;
+	}
+
+	return -EBUSY;
 }
 
 static int airoha_qdma_set_trtcm_config(struct airoha_qdma *qdma, int channel,
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 286f73e2e1e0..d270729e22ff 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -184,6 +184,8 @@ enum trtcm_param {
 #define TRTCM_TOKEN_RATE_MASK			GENMASK(23, 6)
 #define TRTCM_TOKEN_RATE_FRACTION_MASK		GENMASK(5, 0)
 
+#define TRTCM_CONFIG_RETRY_MAX			2
+
 enum airoha_dma_map_type {
 	AIROHA_DMA_UNMAPPED,
 	AIROHA_DMA_MAP_SINGLE,
-- 
2.55.0

