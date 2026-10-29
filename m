Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793244520;
	b=uR9tAo3YFhQPnkyzXJO6CXqGZuWlHWd/Fxp0K/Xd+rE2JShmpAgo8k7QjULoH2nR460a
	 ccmmxLV+ki2JD3TpFYRZyxOntltOAt4WwNlKMkq7H84aEOgQWaWRwPa5i7GvrfeX3ESwX
	 JrmuwY4pBi1BLjH3eLPHHUg2HkTnZRv8U1Obyt+WxNhPxTP9ah212bWabrvYZZ+SMjVT2
	 QYYkLlMB/YvDCJQMQXcY3I034J69cO+ZGEzZQA3i917/V1Q+mTRQHH2okpS5yeO/hU6zl
	 ce9jElzi5lPoZYtMuLMjJPaZR6h9LKLC6ENrR9o5rMymbBE4NDhDl3dhYfWVSdrzG1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793244520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=i4njzMDCwe0EBzmqxjvfeIpG9o+lOwEDSvxV46zSd2o=;
	b=Ypej41svEcQ3nrc5o2q1wVbJzQJD2piNCg2XZRBwnmR/zCYSgReB6HV1Xu11GdPBXixW
	 TQf+urzkfkvaZOX+tAQ8ISSXo3WW8AfWAJcYGwmWNUtf5hHZW+HdRcE1Y3Nt4Uv+Ch7UH
	 J1XgF5VH7C0sgcN0HwDF+0AhFyvFOWP5g4Iv9eVGTQrFsr3xmBTHatTCIPS9MrHPXcrqx
	 zwBDkSqs21O9vXHln+vJ9hJEgInQwF/ZTmmkqRHp7NXTlADgYwzaER6YM/TWHE7IfNHXa
	 qy1a2m2vpoBLeWZB4T+qw4ZgA0xVbrjRBwaeRX4Ibv/D/dTb9lT3DaaXR80c9l31niw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--bcochrane.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OWZNVzVW;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BE3606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1BE3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bcochrane.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OWZNVzVW
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3039901eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793244519; x=1793849319; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i4njzMDCwe0EBzmqxjvfeIpG9o+lOwEDSvxV46zSd2o=;
        b=OWZNVzVWG0OTdPxuQdpZXaCECPLqYjHA2Nw+gJ9UvDWnGTU3KVkiads99jx/4MVvOz
         FjcOOBgefpAaiGW6RDkhG1UEO06jy8FdkRSr7imRET9H0T8YMN6OxUmAce37PqHLlI49
         ZSCa5I75cJZXoeS9lNl6uRv0kvMzOL/WU9AZ1x6We1Y32aufTO/Mk0e0HgOC7BevMWQ7
         vtwzR/ScxF2jaqxSybXa3dA/bqRgxj4neGx99Q+2aVEM7fUll4XtYk5a6HN7o85lYAN8
         517p+oY8P5g3cpEzjllg7u0PNgIUV/4bKzH8iDEfuTsZ+O1L/wfBUwz/m2PD8unJLJtW
         dICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793244519; x=1793849319;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i4njzMDCwe0EBzmqxjvfeIpG9o+lOwEDSvxV46zSd2o=;
        b=AieNItbU2yah30Y/YU3N5MnrQqh+5morUWoIzlaSIZrnAFy/OpsJABLkMKdwFMFdop
         B3ae6j8B1X+p2U5V4CznrUmJPi225kATTvUIUcW9lr/bMQS/Rji3NGzbry+RT/TUbyrF
         E6FVYATG08/tBc6iAgtURFhWpE/sD2xYs80plKmBVP69Ri9oUUEG4f57mxCEGl24cd/z
         nOMR6AgrLDa1sUmDuOqNHh8Oa+AWqOmGRKH+xZBTeg6O4+kn65lFTEBc7/VuhszAM+8i
         Ek7D0WArN77Qsq/Mp3QZuYLN7fBD2qJ3ZcwZ12Adr65kJQZCsD15xZC40CRlinkILJFw
         t9qA==
X-Forwarded-Encrypted: i=1; AKwUvBxZi4kl2fuP8TTeNsFQseoVNVyQg7yinylF/1d4WAuR+LdjMSWY8foCIOuoBpf+MRkkFR008ZPTRk39PGw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrMSgZvBZtXehuZathrKsIZJk423MDDAwb+Z7hb3d2F8Zuvscl
	ZtM4TRYppfT03P6Wk4EoD+vLznGwtVWyjPLm+p4RT/FLHhHA/1rzEAlPySEa/DGhZLNmkWsNVuw
	xhbUPHR3OJNg33yA2Gw==
X-Received: from dlbvv9.prod.google.com ([2002:a05:7022:5f09:b0:195:23bc:a608])
 (user=bcochrane job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:4396:b0:15c:20b8:796e with SMTP id a92af1059eb24-1a6ce208ad1mr7404810c88.22.1793244518347;
 Wed, 28 Oct 2026 20:28:38 -0700 (PDT)
Date: Wed, 28 Oct 2026 20:28:32 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261029032832.1511180-1-bcochrane@google.com>
Subject: [PATCH net] bnxt_en: Take RTNL before netif_close() when aborting FW reset
From: Bryan Cochrane <bcochrane@google.com>
To: Michael Chan <michael.chan@broadcom.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>, 
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Joe Damato <joe@dama.to>, linux-kernel@vger.kernel.org, 
	Bryan Cochrane <bcochrane@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

netif_close() must be called with RTNL held in addition to the netdev
instance lock: __dev_close_many() asserts it, and the NETDEV_GOING_DOWN
and NETDEV_DOWN notifier chains it runs rely on it for serialization.

Commit 004b5008016a ("eth: bnxt: remove most dependencies on RTNL")
replaced rtnl_lock() with netdev_lock() in bnxt_fw_reset_task() and
bnxt_fw_reset(). That is sufficient for the paths that only tear the
NIC down internally with __bnxt_close_nic(), but the abort paths close
the netdev via bnxt_fw_reset_abort() -> netif_close(), and the error
path in bnxt_fw_reset() calls netif_close() directly. Those now run
without RTNL and trigger a WARN_ONCE() cascade when a firmware reset is
aborted:

  RTNL: assertion failed at net/core/dev.c (1740)
  WARNING: net/core/dev.c:1740 at __dev_close_many+0x1be/0x1f0
  Workqueue: bnxt_pf_wq bnxt_fw_reset_task [bnxt_en]
  Call Trace:
   netif_close_many+0xb5/0x190
   netif_close+0xa2/0xd0
   bnxt_fw_reset_task.cold+0x8d/0x213 [bnxt_en]
   process_one_work+0x19d/0x3a0
   worker_thread+0x1af/0x320
   kthread+0xe3/0x120

followed by the same assertion from call_netdevice_notifiers_info(),
fib_rules_event(), inetdev_event(), rtnl_fill_ifinfo(),
devlink_compat_phys_port_name_get() and ip_mc_down().

This was observed on a machine in real use with a BCM57504 (4 PFs,
FW 236.1.153.0) running v7.1.6: the firmware crashed, announced a
"Fatal firmware reset event" and then failed to come back within the
advertised max wait, so bnxt_fw_reset_task() aborted the reset on all
ports:

  bnxt_en 0000:c1:00.1 eno16905np1: Firmware reset aborted
  bnxt_en 0000:c1:00.1 eno16905np1: fw_health_status 0x448100

Take RTNL (before the netdev instance lock, matching the OPENING state
which already uses rtnl_trylock()) in the fw_reset_abort path of
bnxt_fw_reset_task() and route the POLL_VF abort through that same
path. In bnxt_fw_reset() go back to bnxt_rtnl_lock_sp() so that its
netif_close() error path is covered as well; bnxt_reset() and
bnxt_rx_ring_reset() already take RTNL from bnxt_sp_task() the same
way.

The bug was found by inspecting the kernel log of the affected machine
and the driver source; the fix was prepared with the help of an AI
coding assistant (Gemini based) and reviewed by the submitter. It is
build tested (allmodconfig with W=1, plus the same change on top of
v7.1.6 built as a module for the affected BCM57504 host). The aborted
reset path itself only runs when the firmware fails to return from a
reset, which could not be reproduced on demand.

Fixes: 004b5008016a ("eth: bnxt: remove most dependencies on RTNL")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan Cochrane <bcochrane@google.com>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 0682060b048c..0f37639b70ba 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -14798,7 +14798,7 @@ static int bnxt_get_registered_vfs(struct bnxt *bp)
 void bnxt_fw_reset(struct bnxt *bp)
 {
 	bnxt_ulp_stop(bp);
-	bnxt_lock_sp(bp);
+	bnxt_rtnl_lock_sp(bp);
 	if (test_bit(BNXT_STATE_OPEN, &bp->state) &&
 	    !test_bit(BNXT_STATE_IN_FW_RESET, &bp->state)) {
 		struct bnxt_ptp_cfg *ptp = bp->ptp_cfg;
@@ -14844,7 +14844,7 @@ void bnxt_fw_reset(struct bnxt *bp)
 		bnxt_queue_fw_reset_work(bp, tmo);
 	}
 fw_reset_exit:
-	bnxt_unlock_sp(bp);
+	bnxt_rtnl_unlock_sp(bp);
 }
 
 static void bnxt_chk_missed_irq(struct bnxt *bp)
@@ -15495,9 +15495,8 @@ static void bnxt_fw_reset_task(struct work_struct *work)
 		bp->fw_reset_timestamp = jiffies;
 		netdev_lock(bp->dev);
 		if (test_bit(BNXT_STATE_ABORT_ERR, &bp->state)) {
-			bnxt_fw_reset_abort(bp, rc);
 			netdev_unlock(bp->dev);
-			goto ulp_start;
+			goto fw_reset_abort;
 		}
 		bnxt_fw_reset_close(bp);
 		if (bp->fw_cap & BNXT_FW_CAP_ERR_RECOVER_RELOAD) {
@@ -15630,9 +15629,11 @@ static void bnxt_fw_reset_task(struct work_struct *work)
 		netdev_err(bp->dev, "fw_health_status 0x%x\n", sts);
 	}
 fw_reset_abort:
+	rtnl_lock();
 	netdev_lock(bp->dev);
 	bnxt_fw_reset_abort(bp, rc);
 	netdev_unlock(bp->dev);
+	rtnl_unlock();
 ulp_start:
 	if (!rc)
 		bnxt_ulp_start(bp);

base-commit: fcc00b15cb21a6de76826e5012b2c758505f5e65
-- 
2.56.0.313.g2479322e68-goog

