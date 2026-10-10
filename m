Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E244B3373
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791660725; cv=none; b=So7XUBbxmfVTKzCCtMZCg3rViMdrvKN8pQs4628yFDEJMHiR+cIkbg5tPKcPxhVQ66kv8piNmu7CEla1OG0ZGfuQo3R3yhhmjIEJkgbgvwlKXGPM62s+iPqWIjScd0/Siq0ctoR7FRj1B7icxC48MHPdI4aDwkcP/yLeWn09e8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791660725; c=relaxed/simple;
	bh=F1D4iukY4nyVTtimKuBfEcunfvHRFpiZ1VWWXmphPtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HrRpVkQ7CepeCxnViOjhPiW5/P4dbVjfOz4+WnyInbVeqHYGN0PqWSDb2QPm8czggZWQxRgxuioVINHN2ifv8ZNgukN7u+ti0Mln5PP0hz2we0YVPUG4LS7BHXA8n8D0tRLHlnIByPlcMxLos2r7BGpUqONKE8E1QxW/s+/E098=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rBizblaz; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rBizblaz"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so7204845e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791660722; x=1792265522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HpFsl06GKj3/HmCfxz07Pc541DBxtIMKfhoqnvBoI6I=;
        b=rBizblazRS4sAo7J/4dBuvgGncpW/xwWmXvlaTHKYyMAzAku5JdRDe+CupFAE2QAM9
         +PICZkCfiot6wbQeEpMd5TYN+16J6OEhobKd/a7qdiO6XCcUG5QsDRA4NAEuihjM3M6W
         f5VkQN2p5ZAZYbm/cv+EU7NW0yBeGZp2LyrYsCsjLb0R49HXLCmGKs4HnyFC++SJPePs
         TsxS9W13NHmhCoo6xbjNuru2dz6v2OWqI2LK4n0Jh1wdObnSlSNoU3s7Tkpd0Titac/+
         mQ2dDGweIm0MeLxenpDAnP5hTE1foY3BG3hovLxvd9AzyvQs0RI9/V37QCdBMT/B39Xg
         vsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791660722; x=1792265522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HpFsl06GKj3/HmCfxz07Pc541DBxtIMKfhoqnvBoI6I=;
        b=wfzqVkKc1y6VWESX1XgsRjTDofPwk3N9SDU+4D2wqCfG0L85LuJmdZHyDyXCsdyzrN
         V1brHtRlMKz4TDsX7oH6rKDh+5MbPtldpPPKoqh6LCF06Go9hJH7gmSfwwzE3+Dgc6we
         d29D6pFbYlSG/6TDujdYypaOQFscQY76psOwJal3dwqb+lHTw1hrQn7eNgC5asM+i34P
         UE3aa2AoZUggBfJsMzuHEWVfRu1cpdEAUt8ZEANSiAoIE0AJt4WZSRtEofn+JYNu/IVx
         nOt3DZ7WigoB6niadPWE+tb8Ww2pBQXtqQW1f3bohnES47Un/nDasihX2m42N1IRzBqg
         6Bsg==
X-Forwarded-Encrypted: i=1; AKwUvBykx/PgQixjvAUJvF4EQWiaeccCn8nVci8qpw0I/5S5Gp9D9dordaTDdKFRVhjdbR2AUYCh6SFSU8dGCEk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaVk1LSF0Kphr5Cx/5ozRgMbiGQRWVPX6A1GTXQNxrxaN2XKtk
	2yUBNIP6R164RPfHfK3KtLf0+fhHPSmare8qTWKABBtUhdY0lhFaHofq
X-Gm-Gg: AYBFou1ETuRj51uM52CwD6+9K3kAUbiZDF7k4GxAaKo7M9pMjyJosU+TqHlMHGN579F
	J6F+yJWpSzi+ncJnvDUPBdx2hYdwe9sHtXrEejoqDCJzK3VSmNB7P4e+G0EWySVxlb/GAKE74VJ
	o7Qd6BgqGA6C+I6wHkk62ViXvo5LEMD7u+nOJ94f9PryfgcqNEj9K7Q3eRMsPumfCUSExbmeRnj
	c2CdO09a7M+bCAUeGc0nCLkSaOfYQh69Sp03BvM3CyiGSE/1LwSiwu8xPgyEyRsqLN9gv4hA0kR
	/2Ga7KWywGWI0i5JMyOVCova+KuscA5QfJkeFuTCUDYHgyuCNcdK2CUb5vc729+mqGkMMpKGmjN
	8QpCDEBJz3KLVY16Sz6MUeDFkW0DrgLNrrfHAB4HfSpQZcEZCWlCPy5+Rku0gqvqwoIgCkgUv+L
	4cEZRwsTAa1ETatKrgJ9AyE+O6r208O7Bj2HOxBef4Y2F5BiICo3un4jWh5NsQ+iRpIUniNuCdr
	xWbHQCGdHH6CDOzI6OJAmqkpqjHEJCn1m46pGvtSf5vkSRrjkrOmEYpUgWoCPU10XBPeibIb2nS
	aTMkH9UImEGGs6ccP5qLJg==
X-Received: by 2002:a05:600c:4f92:b0:4a1:6dc3:f5e2 with SMTP id 5b1f17b1804b1-4a18e4f6668mr94394465e9.33.1791660721428;
        Sat, 10 Oct 2026 12:32:01 -0700 (PDT)
Received: from omarchy ([2a02:ff0:1e10:93f:ce47:40ff:fef1:ce77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4a3b4asm279544955e9.5.2026.10.10.12.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 12:32:01 -0700 (PDT)
From: Abdurrahman Karadag <abdurrahmankaradag19@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: pkshih@realtek.com,
	linux-kernel@vger.kernel.org,
	rtl8821cerfe2@gmail.com
Subject: [PATCH rtw-next v2] wifi: rtw88: pci: wake the TX queues when the rings are reset
Date: Sat, 10 Oct 2026 22:31:36 +0300
Message-ID: <20261010193136.294816-1-abdurrahmankaradag19@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a TX ring fills, rtw_pci_tx_write() stops the mac80211 queue and
records that in ring->queue_stopped, which is cleared only by the
completion loop in rtw_pci_tx_isr(). Resetting the rings rewinds the
indices, so nothing that was in flight can complete and run that loop,
and the queue stays stopped over a ring that is now empty.
ieee80211_restart_hw() does not release that stop either, because
ieee80211_reconfig() wakes only IEEE80211_QUEUE_STOP_REASON_SUSPEND.

Release those queues where the reset happens. The stop side is the one
that matters: rtw_fw_recovery() reaches rtw_pci_dma_release() through
rtw_enter_ips() before it calls ieee80211_restart_hw(), so that is
where a queue stopped before the crash is still stopped. By the time
rtw_pci_setup() runs the flag is already clear.

Wake all the queues, but only if at least one ring had filled. This
cannot tell one DRIVER stop from another: rtw_pci_io_err_detected() and
the hardware scan paths in fw.c stop every queue with the same
IEEE80211_QUEUE_STOP_REASON_DRIVER, which mac80211 keeps as a single
non-refcounted slot per queue. Gating on ring->queue_stopped at least
keeps the resets that stopped nothing out of it.

On an RTL8821CE, a BE ring held until rtw_pci_tx_write() stopped its
queue did not come back from the restart. The ring itself was reset -
0x3a8 read 0x00000000 and REG_TXPAUSE was clear again - but BE's
mac80211 stop reason still read 0x1 three minutes later and TX never
resumed. With this patch it reads 0x0 and TX resumes within 2 s. The
ring was filled by writing REG_TXPAUSE 0x0f from debugfs under load,
and rtw_fw_recovery() was called from a debug build.

Signed-off-by: Abdurrahman Karadag <abdurrahmankaradag19@gmail.com>
---
v2:
 - wake with ieee80211_wake_queues() instead of recording and replaying
   per-ring queue mappings (Ping-Ke Shih)
 - drop the Fixes tag: the bug only bites once a recovery path exists,
   which the blamed commit predates (Ping-Ke Shih)
 - cut the commit message down to why and how (Ping-Ke Shih)
 - say which of the two reset call sites fires during recovery, and
   that the measured stall was induced from debugfs
 - patch 2 of the v1 series is dropped rather than resent, while the
   cause of the stall is still open

v1: https://lore.kernel.org/linux-wireless/20261002231013.11792-1-abdurrahmankaradag19@gmail.com/

 drivers/net/wireless/realtek/rtw88/pci.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/pci.c b/drivers/net/wireless/realtek/rtw88/pci.c
index 66d2e5f..4d3524e 100644
--- a/drivers/net/wireless/realtek/rtw88/pci.c
+++ b/drivers/net/wireless/realtek/rtw88/pci.c
@@ -475,7 +475,29 @@ static void rtw_pci_reset_buf_desc(struct rtw_dev *rtwdev)
 
 static void rtw_pci_reset_trx_ring(struct rtw_dev *rtwdev)
 {
+	struct rtw_pci *rtwpci = (struct rtw_pci *)rtwdev->priv;
+	enum rtw_tx_queue_type queue;
+	bool wake = false;
+
 	rtw_pci_reset_buf_desc(rtwdev);
+
+	/*
+	 * The indices are back at zero, so nothing that was in flight can
+	 * complete and reach the wake in rtw_pci_tx_isr(); a queue stopped
+	 * when its ring filled would stay stopped for good. Only wake when
+	 * that happened: the stop reason is shared with the AER and scan
+	 * paths, which wake the queues again themselves.
+	 */
+	for (queue = 0; queue < RTK_MAX_TX_QUEUE_NUM; queue++) {
+		if (!rtwpci->tx_rings[queue].queue_stopped)
+			continue;
+
+		rtwpci->tx_rings[queue].queue_stopped = false;
+		wake = true;
+	}
+
+	if (wake)
+		ieee80211_wake_queues(rtwdev->hw);
 }
 
 static void rtw_pci_enable_interrupt(struct rtw_dev *rtwdev,
-- 
2.55.0

base-commit: 83de3a16c7b37064a59305040ba9b0f93b832794
