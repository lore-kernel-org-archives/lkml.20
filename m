Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285761;
	b=yV8/cwjYsJU3YECSx69vfksC44VTHIik7h59lY4oGb7S912YZ5ncfQtJFXsBpvXTZu4G
	 JCDd0dLtopccA4rTJ6HU6H4DKJFz2DaGG37SSbGr4F2Wgr3+wHS1QKGfKofiFq1tj/kX5
	 7MuZcfG/2StK0RWVIC9XVJ3V+SpQ5rElxYo1egzWSHo3W1QWUcA90oJDtYDqeC8H+1N5a
	 7AqxXC93FSeJPNfQrVYDJFdj2MUepTh5AgBGY9teBy8a5RRcB+ux4oiOrgRv9mAHCg6bD
	 0vtudttfwZ5XZedXXBH/x/W6zO+n2dP3+gYSMoJg/1ky6/yvN0QGzNT477i2ynkWxKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=zjN9AV5mzraDlHKgRwS5EnbdBlxMZ/ilvo3TRXjmvng=;
	b=CT+tX+kYG66BI4//hhHmI5RK5I0C4aKjg9/nTL7nQTk07GFLACse47G2lXzt7gMqy/D/
	 UoknEchhI+qLBeHdwB+BwmrIl4xs7JQXODUIVSBKWivV1gWopOGXMwWkn33ZTUkNT/msm
	 ITpbYoEe6Gf8kDO3E3Pj4LGlIDijc86eRr/C3YsfJAlAi/jTOWdq0vB2UpsfKFMhVb1hA
	 c+NfLW1j6aRN0AdsfMkfXs79aPqx9N2w+z1HG+nKuISVob0JDm0Qd4gUYNAw7ut7uG5tA
	 o09IdUJslEZVxJLUaypCuUjpK8KvPwy1pUFuyzvK40Vk1b8a8HQNonn4FseK0GaNZ5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--bcochrane.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="WI/UlvPU";
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781DB606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 781DB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bcochrane.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WI/UlvPU
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3449744eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794285761; x=1794890561; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zjN9AV5mzraDlHKgRwS5EnbdBlxMZ/ilvo3TRXjmvng=;
        b=WI/UlvPUiH99hwfokb7hBw4ILgHuJUtg5j2pqsIyI1BJqcDVjWQWQTvgH9O8TnZNX6
         Uhfn9wE1UhN3+94cOVss869k0nZluI1Vl1NNaSjwu+0mwF198zMDNOyArHZaIeVwcTVQ
         KfHCUKRUEo0hM5VolgE/r9bT0149vDH3GBHM6PUqEPqE5LDOTYGMN53nH3qSy1Sfuunn
         SVbLvjRDfVA4qXLvAZJmrI4X9wpIbyS2rIuwzAw2Xsr41/1VLXb1/UuwWNO+b7JYLhJZ
         17uAUa4Htg4OGFuYQc4cTqxXX0XntrGvIbyR3ZH+ZlNfV/c9T4KnPBS4+Itm41Gry+SQ
         HmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285761; x=1794890561;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjN9AV5mzraDlHKgRwS5EnbdBlxMZ/ilvo3TRXjmvng=;
        b=n+/R26639Bfv53Zr1PuOzDmSJHG6/tex1Gz9f/v3OsZ4E8WHnn9rgo+lQTv3zElmhY
         vSnOF2p0kkvIeTZYOvOu4btlvKiVmFB5D3Oun866+S1y4VIEYD0awkyRWoLezZUOCexi
         2z65X+w7nXEYi1uEzPDJxJYNnORwt5XRfScG+k4UK9Aiw7z9ja5VahGHMr326+dC6X3x
         La4UZcXrkgXSH4d3MT0iepXUdD8v+CEKIuDLXV7vBnChmOwdsIFdMKDpajHQ0YAHjbTB
         stOAIOZYzHwHx6aTDMS3rJbAwS5Fkpvib+qchC68g15XSa7KrVQlhfC3AD6253wTVK3v
         EykQ==
X-Forwarded-Encrypted: i=1; AL+hErFHU5olIl3P8NvLKB8M6H1LKuhSWF5LBt8czCebZagrH8xAq9L5NWjgqq1m9voVHxbV/AdDs0EvhFGXp6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ziZWUMBubiT1EAtC18jzHLibyFoDTk0rsrlID0XoYewr1GT/E
	8Hskb4uEUkB/GhwkfA33ym7PRNYtR6ApJjr+6ulD+96hri5XN6YWjTRCgrCKGZGIX3cfMTplq2O
	vaXOEB4ZLuoEJkszrPA==
X-Received: from dled18-n1.prod.google.com ([2002:a05:701b:42d2:10b0:1b2:4d89:1614])
 (user=bcochrane job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:b90c:b0:1b2:471f:c4c with SMTP id a92af1059eb24-1b3b607b931mr2215434c88.19.1794285760256;
 Mon, 09 Nov 2026 20:42:40 -0800 (PST)
Date: Mon,  9 Nov 2026 20:42:35 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261110044235.204386-1-bcochrane@google.com>
Subject: [PATCH net v5] bnxt_en: Take RTNL before netif_close() when aborting
 FW reset
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
path.

In bnxt_fw_reset(), only a PF can reach the bnxt_get_registered_vfs()
error path that calls netif_close(), so take RTNL up front via
bnxt_rtnl_lock_sp() when BNXT_PF(bp) is true and keep bnxt_lock_sp() on
VFs. That avoids dropping the instance lock mid-reset (which would
expose a transient BNXT_STATE_IN_FW_RESET and let a concurrent devlink
health recover set BNXT_STATE_IN_SP_TASK), avoids racing with
bnxt_sriov_configure() updating active_vfs outside RTNL, and keeps VFs
from contending on RTNL during recovery while PFs already run on the
single-threaded bnxt_pf_wq.

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
v5:
 - In bnxt_fw_reset(), take bnxt_rtnl_lock_sp() up front when BNXT_PF(bp)
   is true (keeping bnxt_lock_sp() on VFs) instead of dropping and
   reacquiring locks on the bnxt_get_registered_vfs() < 0 path, and drop
   the bnxt_in_sp_task() change from v4. Dropping netdev_lock mid-reset
   exposed a transient BNXT_STATE_IN_FW_RESET, while guarding
   clear_bit(BNXT_STATE_IN_SP_TASK) in bnxt_[rtnl_]lock_sp() risked a
   deadlock with devl_lock during devlink health recover (reported by the
   netdev Sashiko review). Using BNXT_PF(bp) rather than active_vfs avoids
   racing with bnxt_sriov_configure() while still keeping VFs off RTNL.
v4: https://lore.kernel.org/netdev/20261108222942.1233295-1-bcochrane@google.com/
 - Return to the synchronous close in bnxt_fw_reset() from v2, using
   netdev_unlock() + bnxt_rtnl_lock_sp() as suggested by Michael Chan,
   and guard BNXT_STATE_IN_SP_TASK in bnxt_[rtnl_]lock_sp() and
   bnxt_[rtnl_]unlock_sp() with current_work() == &bp->sp_task. Deferring
   the close to bnxt_fw_reset_task() in v3 still hung when entered via
   bnxt_fw_recover(), raced with bnxt_hwrm_if_change() clearing
   fw_reset_state, and marked the reporter SEVERITY_FATAL (reported by
   the netdev Sashiko review).
 - Omitted Michael's Reviewed-by and Stanislav's Acked-by from v2 due to
   the new bnxt_in_sp_task() check.
v3: https://lore.kernel.org/netdev/20261104045534.79783-1-bcochrane@google.com/
 - Do not drop and retake the locks in bnxt_fw_reset(). Route the
   bnxt_get_registered_vfs() failure through the bnxt_fw_reset_task()
   abort path instead; this also restarts the ULP after that abort. The
   v2 unlock/relock window let a concurrent devlink health recover set
   BNXT_STATE_IN_SP_TASK via bnxt_unlock_sp() and hang the close
   (reported by the netdev Sashiko review).
v2: https://lore.kernel.org/netdev/20261103042210.2984373-1-bcochrane@google.com/
 - Keep bnxt_lock_sp() in bnxt_fw_reset() and take RTNL only on the
   bnxt_get_registered_vfs() error path, to avoid RTNL contention when
   many VFs recover at the same time (Michael Chan).
 - Dropped Stanislav's Acked-by because of the change above.
v1: https://lore.kernel.org/netdev/20261029032832.1511180-1-bcochrane@google.com/
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 33c4cacc8ffe..8b7ebf2eefaa 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -14838,7 +14838,10 @@ static int bnxt_get_registered_vfs(struct bnxt *bp)
 void bnxt_fw_reset(struct bnxt *bp)
 {
 	bnxt_ulp_stop(bp);
-	bnxt_lock_sp(bp);
+	if (BNXT_PF(bp))
+		bnxt_rtnl_lock_sp(bp);
+	else
+		bnxt_lock_sp(bp);
 	if (test_bit(BNXT_STATE_OPEN, &bp->state) &&
 	    !test_bit(BNXT_STATE_IN_FW_RESET, &bp->state)) {
 		struct bnxt_ptp_cfg *ptp = bp->ptp_cfg;
@@ -14884,7 +14887,10 @@ void bnxt_fw_reset(struct bnxt *bp)
 		bnxt_queue_fw_reset_work(bp, tmo);
 	}
 fw_reset_exit:
-	bnxt_unlock_sp(bp);
+	if (BNXT_PF(bp))
+		bnxt_rtnl_unlock_sp(bp);
+	else
+		bnxt_unlock_sp(bp);
 }
 
 static void bnxt_chk_missed_irq(struct bnxt *bp)
@@ -15547,9 +15553,8 @@ static void bnxt_fw_reset_task(struct work_struct *work)
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
@@ -15682,9 +15687,11 @@ static void bnxt_fw_reset_task(struct work_struct *work)
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

base-commit: a45dbf182137275f44ad7c8bc8acd23f7af6b2cf
-- 
2.56.0.506.g506a7eabc5-goog

