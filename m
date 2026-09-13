Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB11F4A35
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789335264; cv=none; b=buaKh9uRPubaVXiDTtkWnptqiohpVS7Tx/khqVkSYe05gdFsAbHggNPPn7tCWsinJwFWyuhw3UWCAGwAI1yKtQIKrWVWLUGz75eC0XuiBpTJEfeshLIhoFoZ02T0P4Mulz2XFes/pSbUmBsQrel41IpKKNDAoTBCDU797blOpic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789335264; c=relaxed/simple;
	bh=7k1hisha0SaAstxzyShuH8xYn1U2H6VgoJ/ZkYLYQIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ToFQ5xrNo6WDqQr8pseUPhFlhLuXwYJMKqQ5zD5bROyeJ1QWDSPV6Pu/SL4Y8sTq24IMt3fCQxSKiih2Zum1Ahy2P2zmBEkvS0EiGTkeJNYd48AJAV+lkQzV6B9k0eJTEx5diRCM2y37K7cqlYWsAc+4UAGSC1HNg5cA1tjtmHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiXYoa9y; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiXYoa9y"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e25187so1022421b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789335260; x=1789940060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eHfVEcK3sauaFk2XrUxZ5yLnrxF9PTr4AtCY8Hi4Vvk=;
        b=SiXYoa9ygv70bKNPtATzerafsD2WF+EPC+DoouSRLhJG5q/xLyByZggyovwMej9Lfy
         SAx3q5xkyhN5PJgAwKjJBZvrMb16t6LEJqd1UNuMauNV3u/yZ+lx7qzungx7ZOGmdevZ
         +BO+TPCpEzlBZbyh4v2xly9AQxMj7iKWe+fFyuSUoCMT+U2k6Aw9i7rqDrKabH7ikyeM
         V10M5W79NrJhVyx3UhEPhM624ScJTJnSHz+wDPPbivXibpdCVdSGKzHcsYD3IFMRJh9g
         306xgigUaSnsnAn78qxiMZBmkxv9ZzZJNsA0YwUkgK7eZl/h9gsvyLJcUdgYsG44/V23
         dByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789335260; x=1789940060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eHfVEcK3sauaFk2XrUxZ5yLnrxF9PTr4AtCY8Hi4Vvk=;
        b=cbK0RqYVubjjXMNFFrmW6L/EzrdLdkNa0RZYUTbpHGsWyRVsxg35u8yT4H6CL3L3OF
         c0Nbfp/tkerljMvTxzL/S3XzngZ81rJCwwWF+lniR5o5AJewBWq3b3Yzcm8KPMHP/rww
         ogHP9nOAV+OiGjWpAzNejiRIPSMWaoD1MVNmWa7+zhAJmJ/ScZOlOjVsWpT9Cspn5QRQ
         95aRT5XlszBoymA77a9fCgfNa8O9th2cJYydSGheaLSIeWivwBnh4B7OBZn+2bEPH03w
         YySivGFRQ5aIqCNUCighTNkTBuVqUbqJ7LDQAMQvqmmLmcQC+JzCjYFS6VlQaENmVXeY
         Zc0w==
X-Forwarded-Encrypted: i=1; AKwUvBwu6ldkD/sarkWAsfyilQfdL+T0o9WOpsQUPpdGmoAGdzGcs3mQcrPtUdJ135KwLx1JK78KywcKZ7ctMLg=@vger.kernel.org
X-Gm-Message-State: AFuF++m/TDCMpD1ogrI4G2A44wD/4HOIJ7SppUEciO2VpWfOa8Ixpcbi
	9ynFP+F262TPxGl6PK9akMQ4hN96w8kQ44Twxtm4zCNqa7qOWnd3vUKF
X-Gm-Gg: AYBFou0KACmGA3mbTt6r/Yi1Oehpvt3ETHnDgyWcjdTI55ZRBBBl1eULMrkCxeOcSif
	neu3rVtLqHhp7MwZoNA+XFreOP1RZ8SUjc6O9zltS5l4MECf6C4ahxs0ecFnabD7dQB0XOna13w
	3j1A9r6wSLZEHDYo7bZYNzUCTYLL50hezzAoIEqzO1ZM2tUc7nUn/H7OigV8TrU0iGRwfV7Wtf6
	3jmTaVQBMgbVBIcb/J4kYqx5RnydcqqvYt+XoZucAkXUeP5v/VS4Pg/7EDZ/nEohNCE/oyesEsD
	O4N2mSPoFh3u7gyTSwPKczq4nBzi3olZKiwC0aV4fM/RFIUkQ9HqkRJUdeZVkJjINb9sJAre+gE
	4/pO69cp2L+UK6WJn2RlpJrk/+8rg76o5lYL6fICedYTpDL7R68kgqHsyg3dvmDual7ElLeyB1t
	aLBhT2RWfK1b1RWcU/IJaZLBaiPoXrDcYDKW17X1pCZ7Z/UWNg/NFsAsxePoyXMeN1wZZFsl3WB
	Z1ycXT7KFKy9sNuC+29rLdna+svw+l0nFA33enHfkulePuQcjdL8EMahu/mPNtLSXRcs8zcJ3CP
	Mdcbiprb6/cNYbIkp0eeinMSraRCofoC4kSFyABxeExaVg==
X-Received: by 2002:a05:6a00:a16:b0:86d:9ade:13f3 with SMTP id d2e1a72fcca58-86d9ade2b9amr8504968b3a.19.1789335259818;
        Sun, 13 Sep 2026 14:34:19 -0700 (PDT)
Received: from 0xiviel.ip (122-63-135-80.mobile.spark.co.nz. [122.63.135.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b291c5e8dsm3477094b3a.32.2026.09.13.14.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:34:19 -0700 (PDT)
From: Eva Crystal <0xiviel@gmail.com>
To: min.ma@amd.com,
	lizhi.hou@amd.com,
	Min Ma <mamin506@gmail.com>
Cc: Eva Crystal <0xiviel@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] accel/amdxdna: clear the mailbox channel pointer when starting it fails
Date: Mon, 14 Sep 2026 09:31:55 +1200
Message-ID: <2fcf0eca215090dbbd95cb86e1bf5076056d3818.1789334558.git.0xiviel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1789334558.git.0xiviel@gmail.com>
References: <cover.1789334558.git.0xiviel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

aie2_create_context() allocates a mailbox channel, starts it, and on a
failed start frees it again:

	hwctx->priv->mbox_chann = xdna_mailbox_alloc_channel(ndev->mbox);
	...
	ret = xdna_mailbox_start_channel(hwctx->priv->mbox_chann, ...);
	if (ret)
		goto free_channel;
	...
free_channel:
	xdna_mailbox_free_channel(hwctx->priv->mbox_chann);

hwctx->priv->mbox_chann keeps pointing at the freed channel. That
pointer is the driver's own test for whether a hardware context has a
usable channel: aie2_destroy_context() returns early on NULL,
aie2_sched_job_run() refuses to run a job on NULL, and the message
helpers return -ENODEV on NULL. A stale pointer passes all of them.

It matters on the restart path. aie2_hwctx_restart() calls
aie2_create_context() again on a hardware context that is already live,
after aie2_hwctx_stop() has torn its channel down, and the context
survives a failure there: aie2_sched_job_timedout() discards the return
value entirely, and aie2_hwctx_resume() only propagates it. What is
left is a live hardware context holding a freed channel, and every
later user of it takes the non-NULL branch:

  - the next job submitted reaches xdna_mailbox_send_msg() on the freed
    channel, via the !mbox_chann guard in aie2_sched_job_run(),
  - a second command timeout reaches aie2_hwctx_stop() ->
    aie2_destroy_context(),
  - closing the device reaches aie2_hwctx_fini() ->
    aie2_release_resource() -> xrs_release_resource() ->
    aie2_xrs_unload() -> aie2_destroy_context(),

and aie2_destroy_context() then calls xdna_mailbox_stop_channel()
followed by xdna_mailbox_free_channel() on memory that was already
freed: a use-after-free, and a second free of the same channel.

The AIE4 management channel already does this correctly -
aie4_mailbox_start() clears ndev->aie.mgmt_chann right after freeing
it. Do the same here.

The create path itself is not affected: when aie2_xrs_load() fails,
xrs_allocate_resource() removes the solver node without calling
->unload, and aie2_hwctx_init() frees hwctx->priv, so the stale pointer
never outlives the structure holding it.

Starting a channel can fail today without this patch: the ring buffer
sizes firmware reports are rejected unless both are powers of two, and
request_irq() can fail.

Fixes: d5b8b0347fa8 ("accel/amdxdna: Split mailbox channel create function")
Cc: stable@vger.kernel.org
Signed-off-by: Eva Crystal <0xiviel@gmail.com>
---
 drivers/accel/amdxdna/aie2_message.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index b4c49259a1a2..f658760c3d48 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -277,6 +277,7 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
 
 free_channel:
 	xdna_mailbox_free_channel(hwctx->priv->mbox_chann);
+	hwctx->priv->mbox_chann = NULL;
 del_ctx_req:
 	aie2_destroy_context_req(ndev, hwctx->fw_ctx_id);
 	return ret;
-- 
2.53.0

