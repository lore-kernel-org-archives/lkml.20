Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AB3534475
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072516; cv=none; b=kybO9GD+Kixa1NvA9S3m4sJp3DP8lALi8TNI03eTm1qNyxv6Zb+rmcwIGycKntAhEUAxQBdu4snwfCskQ9ICLkxdzGLoXJ8tX1hMLdDQYOVUp1LTa4v7QJCYzCWA40Ntr582jV7Ll6uFUt812wfwcBXQVAiTP6HrPJpM39qcxUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072516; c=relaxed/simple;
	bh=PB10iJXwaQiQpgWMplLuUrRqupycNcSJ1CXoBYEhb+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ltu4pNRaQTrB7zToLH+vk25uVHXXO9nRBEzveBAv1CxfqODgkVCDyEAguf3py9g16Yqdeyr/uZjAcuqmhJ1gZwFH+W0YSQTIr0ACc0J7MBYYlqgkMsJP65LW+Of3LUQXLaoCXHb32C4wcbbjJJHRbE9QrS1oXKFJs5HTCYgkyOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OPbXZCfz; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OPbXZCfz"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-87ac7657a24so901873b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790072514; x=1790677314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qRPMgMOIc56QBWBupM6kM1mJ5Xh3d/f5V1FOIpaRUQI=;
        b=OPbXZCfzQZP1oVGJov0EJw0DExrIWsm7ae46C/Tl/dObdQcbZWZDaig2wbiOj3gijb
         hpnYkk0uPL9kjiwo+CHPaTWJBx8t5zzDG6rowGz4iOZIUPS8AX5xaq9+KJTElkRDbWcm
         NGIUWpCPy+e5MTTioFN+/DiFr3bBGH3L1as/1gMZqD53HgYiEnrWkavWG44GAjNX+lAd
         z6W5FDgIS7AOMHLG/1jq+4Qid5o2B9o0zhxuYbP130DrMtujacKt4wcQ/mvFRW/GbjEW
         1DPP2tuvjj8W385ckE6scdYUljmAx8DVmiiWi3d+2UBK7ZTmq2vCSQsVMufWaZJKx7Q9
         Zo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072514; x=1790677314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRPMgMOIc56QBWBupM6kM1mJ5Xh3d/f5V1FOIpaRUQI=;
        b=oLkv81b2851+wsYhgqI7o4FPbZHJtkSWHUJxsCAlQXdtJbQe9lr5Jxc3L9XS+vfXW1
         ijq+w/NAh9Ad/iyGheLlt6xok8n3eVkJDZymm1xvKHR2F/a1l46QeJ/W8OEzPgMt1E9e
         D1m4MOMz/KLlQzqePGaY+uq7c4/afzun2RXyOZRNGbYj1ui9P2ozF8th32t/dXC7QROt
         THQSlLg4el2RebGp0Ddzz+xW8Man5369p/+7XScdVRWY77OoLRNXWzrjypKpPikn50xl
         Nycx1oeCbeKtm7XJmqhTMoLDd/tg2acC6LIUu5Zxjll6ZXKftT2sWmlDeo7s8W1/m2Z/
         V2aw==
X-Forwarded-Encrypted: i=1; AKwUvBwUCnkDY/68kGL6ttjRl6DX1u9+rJ2zGytv7cEF24/vETjGO0ZmUVuBZmf1SCA9IgPiy4EUtsDK8ubXbGk=@vger.kernel.org
X-Gm-Message-State: AFuF++mKegW9HY9yKIRKhSvBsRmRn76b56/VRvuph0ULGtxPG/qcOkw2
	9ibQZQeGCy+CkuwNym0nESLOtaLEyTTxsGs5x1t8906denOIfIh485i3
X-Gm-Gg: AYBFou1WDpcWFYuYENXLfUDBFhYE/fW11U4q+ri0mlkuNIH3XMwPnRwJ7sYCnXql0+t
	H/a7eSuW/3IJNpLQMCjGQv48/HGxHYSY5hJOPjO0txLDWpgV2RQuM4q7J1fW2tOyUPLmBlV1FC3
	b0q8geovnnclh1ox6RDBQDicEqUse6KL560O7OWS+x8alB15nk6hPZ+4ikpQHRK4fjzxpriuxkk
	fvraiPSobALhTv2VXFHoSykzhrnevrHYxjPmtcDkHDvhKJSs1x50QvqRukfIKWKR+HJt4YKhnRt
	guasakafxJzpP49nMSEmGZyGw4KAm8W91/GM6AglRf7VkXcW/TgnTn9tw0LtT2iq717LbjG3zMo
	Uq18MvCuphDNquXY5AHnvxpIOIxcdaaUpF2QDGdi5lrrZdEwhCYWoktxJEARX6VhwdWfy+JtF8K
	4K90wJU85KwTBGfY/oL93u/7PxHvkr5J2ycL2YpVR8t1YYjT0ZWFQNgZ7xn8/QL11dB+H/O8KSd
	gc9n1kS4f2H6yniX//bmj4qNJjzNvCEiw+5tYf1RBGgH/Dm
X-Received: by 2002:a05:6a20:4303:b0:3dd:a195:dd68 with SMTP id adf61e73a8af0-3ddec8a09d8mr755808637.74.1790072513951;
        Tue, 22 Sep 2026 03:21:53 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:4d0:75ae:9920:3973])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc756a34691sm682623a12.17.2026.09.22.03.21.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 03:21:53 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH v2] nfc: nci: ignore unexpected CORE_RESET_NTF and CORE_RESET_RSP
Date: Tue, 22 Sep 2026 18:21:44 +0800
Message-ID: <20260922102144.39689-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit bcd684aace34 ("net/nfc/nci: Support NCI 2.x initial sequence")
added handling of CORE_RESET_NTF in nci_core_reset_ntf_packet(). When
received, it updates ndev->nci_ver, ndev->manufact_id, and
ndev->manufact_specific_info, and calls nci_req_complete(ndev,
NCI_STATUS_OK) to finish the pending reset request.

However, unlike other notification handlers in ntf.c (which validate
ndev->state before completing requests), nci_core_reset_ntf_packet()
does not check whether a core reset request is actually pending.
If an unsolicited or delayed CORE_RESET_NTF arrives (e.g. after a reset
command times out or from a misbehaving NFCC), it unconditionally:
1. Completes whatever request is currently in-flight (such as CORE_INIT,
   RF_DISCOVER, or CONN_CREATE) with NCI_STATUS_OK, leading to kernel
   state desynchronization.
2. Overwrites ndev->nci_ver and manufacturer info. Because
   ndev->nci_ver is used as a selector for subsequent packet formats
   and parsers (e.g., in nci_open_device() and nci_core_init_rsp_packet()),
   unexpectedly modifying it can cause protocol format confusion.

A similar issue exists in nci_core_reset_rsp_packet(): an unexpected or
delayed response packet can prematurely complete an unrelated in-flight
request.

Fix this by ensuring CORE_RESET_NTF and CORE_RESET_RSP are only processed
by the core layer when a reset command is actively awaiting them:
- Set NCI_RESET_PENDING in nci_reset_req() when sending CORE_RESET_CMD.
- In nci_core_reset_rsp_packet(), ignore the response if NCI_RESET_PENDING
  is not set. If set, clear the flag and complete the request on failure
  or for NCI 1.x (checking skb->len >= sizeof(*rsp)).
- In __nci_request(), ensure NCI_RESET_PENDING is cleared upon request
  completion, cancellation, or timeout.
- In nci_core_reset_ntf_packet(), skip power-on notifications (trigger
  0x01, identical in NCI 1.0 and 2.0), then check and clear
  NCI_RESET_PENDING before updating device fields and completing the
  request. The CORE_RESET_CMD trigger value is revision-dependent
  (0x00 in NCI 1.0, 0x02 in NCI 2.0), so both are accepted and gated
  on NCI_RESET_PENDING alone. If unexpected, log a warning and return
  0 so driver-specific handlers (such as fdp firmware patch handling)
  still receive the notification.

Fixes: bcd684aace34 ("net/nfc/nci: Support NCI 2.x initial sequence")
Cc: stable@vger.kernel.org
Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>
---
v2:
 - Do not abort the notification pipeline on unexpected CORE_RESET_NTF (return 0
   instead of -EINVAL), preserving driver-level hooks (e.g. fdp firmware
   patching) per Simon Horman.
 - Skip power-on notifications (trigger 0x01, identical in NCI 1.0 and 2.0)
   while gating both NCI 1.0 (0x00) and NCI 2.0 (0x02) command-triggered resets
   on NCI_RESET_PENDING alone.
 - Check NCI_RESET_PENDING in nci_core_reset_rsp_packet() to avoid completing
   unrelated requests on unexpected responses.
 - Explicitly check skb->len >= sizeof(*rsp) in nci_core_reset_rsp_packet()
   for NCI 1.x handling.

 include/net/nfc/nci.h      |  5 +++++
 include/net/nfc/nci_core.h |  1 +
 net/nfc/nci/core.c         |  3 +++
 net/nfc/nci/ntf.c          | 17 ++++++++++++++++-
 net/nfc/nci/rsp.c          | 24 ++++++++++++++++++------
 5 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/include/net/nfc/nci.h b/include/net/nfc/nci.h
index 09efcaed7c3f..2ac45adba088 100644
--- a/include/net/nfc/nci.h
+++ b/include/net/nfc/nci.h
@@ -140,6 +140,11 @@
 #define NCI_RESET_TYPE_KEEP_CONFIG				0x00
 #define NCI_RESET_TYPE_RESET_CONFIG				0x01
 
+/* NCI Reset Triggers */
+#define NCI_RESET_TRIGGER_ERROR					0x00
+#define NCI_RESET_TRIGGER_POWER_ON				0x01
+#define NCI_RESET_TRIGGER_RESET_CMD				0x02
+
 /* NCI Static RF connection ID */
 #define NCI_STATIC_RF_CONN_ID					0x00
 
diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 664d5058e66e..504ea91ddf27 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -31,6 +31,7 @@ enum nci_flag {
 	NCI_DATA_EXCHANGE,
 	NCI_DATA_EXCHANGE_TO,
 	NCI_UNREG,
+	NCI_RESET_PENDING,
 };
 
 /* NCI device states */
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 5f46c4b5720f..5a90591cd9af 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -134,6 +134,7 @@ static int __nci_request(struct nci_dev *ndev,
 	}
 
 	ndev->req_status = ndev->req_result = 0;
+	clear_bit(NCI_RESET_PENDING, &ndev->flags);
 
 	return rc;
 }
@@ -163,6 +164,8 @@ static void nci_reset_req(struct nci_dev *ndev, const void *opt)
 {
 	struct nci_core_reset_cmd cmd;
 
+	set_bit(NCI_RESET_PENDING, &ndev->flags);
+
 	cmd.reset_type = NCI_RESET_TYPE_RESET_CONFIG;
 	nci_send_cmd(ndev, NCI_OP_CORE_RESET_CMD, 1, &cmd);
 }
diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index f5c9a8ab7ec1..57f99bf46a22 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -36,7 +36,22 @@ static int nci_core_reset_ntf_packet(struct nci_dev *ndev,
 	if (skb->len < sizeof(struct nci_core_reset_ntf))
 		return -EINVAL;
 
-	ntf = (struct nci_core_reset_ntf *)skb->data;
+	ntf = (const struct nci_core_reset_ntf *)skb->data;
+
+	/*
+	 * A power-on notification must not update core protocol state nor
+	 * complete a pending request.  The CORE_RESET_CMD trigger value is
+	 * revision-dependent (0x00 in NCI 1.0, 0x02 in NCI 2.0), so both
+	 * are let through to the reset-pending gate below instead.
+	 * Return 0 so driver-specific notification hooks can still run.
+	 */
+	if (ntf->reset_trigger == NCI_RESET_TRIGGER_POWER_ON)
+		return 0;
+
+	if (!test_and_clear_bit(NCI_RESET_PENDING, &ndev->flags)) {
+		pr_warn_ratelimited("unexpected CORE_RESET_NTF\n");
+		return 0;
+	}
 
 	ndev->nci_ver = ntf->nci_ver;
 	pr_debug("nci_ver 0x%x, config_status 0x%x\n",
diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index b0ab4f5acbce..3a2491497e4b 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -32,14 +32,26 @@ static void nci_core_reset_rsp_packet(struct nci_dev *ndev,
 
 	pr_debug("status 0x%x\n", rsp->status);
 
+	/*
+	 * If no reset request is pending, ignore unexpected responses to avoid
+	 * prematurely completing an unrelated request.
+	 */
+	if (!test_bit(NCI_RESET_PENDING, &ndev->flags))
+		return;
+
+	if (rsp->status != NCI_STATUS_OK) {
+		clear_bit(NCI_RESET_PENDING, &ndev->flags);
+		nci_req_complete(ndev, rsp->status);
+		return;
+	}
+
 	/* Handle NCI 1.x ver */
-	if (skb->len != 1) {
-		if (rsp->status == NCI_STATUS_OK) {
-			ndev->nci_ver = rsp->nci_ver;
-			pr_debug("nci_ver 0x%x, config_status 0x%x\n",
-				 rsp->nci_ver, rsp->config_status);
-		}
+	if (skb->len >= sizeof(*rsp)) {
+		ndev->nci_ver = rsp->nci_ver;
+		pr_debug("nci_ver 0x%x, config_status 0x%x\n",
+			 rsp->nci_ver, rsp->config_status);
 
+		clear_bit(NCI_RESET_PENDING, &ndev->flags);
 		nci_req_complete(ndev, rsp->status);
 	}
 }
-- 
2.53.0

