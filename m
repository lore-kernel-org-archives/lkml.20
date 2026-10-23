Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752127;
	b=ra4YuhB4v95WyLNCD8AaUpnTJoJmv81UWm/KrSrSXT5YKxC6frAhuCLsRgf+Qjm5nyfy
	 v3tZHyBRiGHwmZef0jefvP6SXoHqfiw2iSPNT8jdKwlga9YNvH+mHEVCQx3KOtCkDzjhi
	 T/HN0R9Pg8acvyDWrjjgDhOwHkZUYlPIhkkPfMVC19tAKNq4rKldjwVxIX4w6flI/BFAZ
	 mIA33U6Od56Ks6uvVH3Bqt8vdogozKFphnKRhNJaAh+rj1XMFOVgoVs8QLLr7QvniTj3v
	 nZjHbhqKZXK/To1pygJBxzdUWt5eIAgCLtNMlMD83ZXE7P1XaKAIqUWKsXbmRdCeDiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/NFK43oOzJfr8L2hy16WF2YSsrjDDXnWtTpY4uSA574=;
	b=VJkQtoh4xkDDrrcW52Ifj9iubLURiWRLLtyMRox+MXjEyvHAzIAWdyPgS3gtYh692RJW
	 SXOZFS7AwlKz/X4hBoD6qsDomiizy8W1dQ0xnyGOXLpffZbDXja9t/EKQ5cnG5gMm7zve
	 UKPG11A/Q9R34rBG+laCLCANcus5qYrzEcfedEiUQ2Cf4xN3LGAxbsrvY8LjUAxy3jqXI
	 myx+Wzcs8ubOBuNVQzw9KbnmyLooMNDZprvQ/jMcutJUUZKJhVXshAOi0auauXJncjC4O
	 Tjet+FF4Rm4tjVwgwq49XIuv4L4bo/pckCD/opAAyJ+v0dP4AswpEqrukEyblkldwLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gpceg3xr;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B04606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06B04606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gpceg3xr
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so6444395e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792752125; x=1793356925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/NFK43oOzJfr8L2hy16WF2YSsrjDDXnWtTpY4uSA574=;
        b=Gpceg3xrXgFA+DKsoVAbMos73W+cLVI9xIoWVPYxVJtjtNr05ux7SDs23k+/70PzsI
         6ojDF3R00BDPYS0HvJYtimBpCN+l2kUwu9tllEhhcdKwfSTk2Rx4U14HZ4s+4U/3fdnd
         OGKxYRQnVFE5aLUPoK7dDOTxd4+QVhVFCeIJon8rWJk5Me1dblZKt0txLZakfXBBS9k7
         ZfxhPQHHGCs/ZyZtF5p9lXvG+neWFtVPae+jykx5xJoqMMj305iNRdGTcIt7DYIVFjhf
         +i2yhCG+5hUo+QhTr4xxTi3uy9myDX0ycuQP/1yTm1BNExVoPRxPfsseCyVgxXFw3gfv
         +mXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792752125; x=1793356925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NFK43oOzJfr8L2hy16WF2YSsrjDDXnWtTpY4uSA574=;
        b=xntQuqUSxt5ATKK71Vau13ZlW5sF+osnWCIJ3SYK5NMa81LEjBb6OZc797MAk3I8Dy
         qiwPZAd8Qv4tvLffcFbzCFL9u9KQOpcr5Hmnqz2jDPtKq7QdoTalLaASgEnFMTS+1VSk
         3+Rncz9xnWvM008LHzH33v6DcBhSfWAJNO7XQw8S7VTdF+kOGEcwm5zMNw42YaD1hCqB
         JXvUwOHrQr/8c5UEDBoHuwvZM1C9HW4+lzA3qxjnerjQH584RzhZT1G/67hwMB3fStP/
         K3IdbROgZ7PpOy9otRLX+8d7EIOiL3aFJ0jYQpxmgRmLJtRRT1cmyq6RY3u9Yx0Qeg7E
         9g5g==
X-Forwarded-Encrypted: i=1; AKwUvBw/4jiL3BCtHBXZ+LkGR7+3CLqWwToeaTsgzI3NH04FZiY4+4x78oeQCbSH4ICCxmJ0stlFCbk7CszzBW0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGQ0tJ5cnwmXe/6sENNflK/v0R++MY5QkhL0YAENaxAzV5B1F4
	+FaU+QtDhYbsnzsrLT6l8MOi+rDqh1+NC6a6o3j5sQC8xdPc06O14clLj/i61g==
X-Gm-Gg: AYBFou2UTaaKlqlgTXa40Duw+tCu8ljJ7OARAyonV1rdobS04YKvqfOmgqGFMcEE6Qh
	ehJRJq78MsXHE59Gn3UADATh14xsDspCckVnifEhbM9/zEeXz8dc+spi4EBElat01gye4H5uawC
	ePfsUORmWg804cJsyeBfJeSLUXPEHUbEiis/DLXthYricZUDSmr6961vft5aT45MtRevwOrhXeV
	XuiZMyhSXewuF20l1bpiEt6gYhZ68lcEUCad5otpWtUh8bHCfhrLWdzZ41kp4YjFq49AZHfNDsw
	kSoU/03mgvXCoUjuDz0bnfjrMP2N4wTmCzhDHRqE77NfdpnFk9o5O3cm9+vrm87J9B7wyVU18v8
	TEX1cp5oPJH1redsGqpgg2+aXzjLws0I01V/yt5oSc8KBqRdmQmcLNaO9YVlXyMdfkQMDPep/SX
	4r/nXTVbK3ATROMslBOYDsXQkxm2Moj36c0MJtQmmb+apPTdsUPsjDSCxHXw+QiLD9RbMnFw0Ed
	0Qc0UMkVGJFFakbSpkZCs6wsKlquh5+U6XIOARUJa0V2F9AFH/SAS+W0m1K/B7IVagMO4rFkhUr
	MtpIf5KvnadBVx+DoMoiBbRLXorDIrGiJlRLTSv8oAUtKT71T8dFzRatCi63F1fJP1+klKjLD1N
	mIzE=
X-Received: by 2002:a05:600c:4e55:b0:4a1:d41b:5060 with SMTP id 5b1f17b1804b1-4a211ed013emr27247015e9.22.1792752125001;
        Fri, 23 Oct 2026 03:42:05 -0700 (PDT)
Received: from omarchy ([2a02:ff0:1e10:93f:e71c:400:f186:eea4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a210487d16sm66719955e9.15.2026.10.23.03.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:42:04 -0700 (PDT)
From: Abdurrahman Karadag <abdurrahmankaradag19@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: pkshih@realtek.com,
	linux-kernel@vger.kernel.org,
	rtl8821cerfe2@gmail.com
Subject: [PATCH rtw-next v5] wifi: rtw88: pci: wake the TX queues after restart_hw and interface up
Date: Fri, 23 Oct 2026 13:41:54 +0300
Message-ID: <20261023104154.2755289-1-abdurrahmankaradag19@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a TX ring fills, rtw_pci_tx_write() stops the mac80211 queue and
records it in ring->queue_stopped. The completion loop in
rtw_pci_tx_isr() is what clears them, and it needs a descriptor to
complete. If the device goes down first, rtw_pci_dma_release() rewinds
the indices and frees what was in flight, so nothing is left that
could. ieee80211_reconfig() does not help either: it wakes only
IEEE80211_QUEUE_STOP_REASON_SUSPEND, and an interface down/up does not
reach it at all. TX then stays dead although the device came back.

Reset that state where the device starts, which both
ieee80211_restart_hw() and an interface down/up reach through
rtw_core_start(). Gate the wake on ring->queue_stopped so that a
start which stopped nothing leaves the queues alone. The wake cannot be
narrowed to the queue the ring-full path stopped: the flag sits on the
ring, and rtw_tx_queue_mapping() puts management frames and multicast on
rings of their own whatever queue they came from, so a flag there does
not name a queue. mac80211 also keeps a single non-refcounted DRIVER
stop per queue, shared with the scan paths in fw.c, so
ieee80211_wake_queues() releases whatever holds that slot.

Signed-off-by: Abdurrahman Karadag <abdurrahmankaradag19@gmail.com>
---
v5:
 - reset the flags before rtw_pci_enable_interrupt(), move it into
   rtw_pci_reset_tx_queue_state(), and add the blank line before
   running = true (Ping-Ke Shih)
 - justify the gate by what it does on a start that stopped nothing,
   and give the cannot-be-narrowed note its actual reason (Luka Gejak)

v4: reset the flags and wake from rtw_pci_start() instead of
    rtw_reconfig_complete(), so an interface down/up is covered as well,
    and name restart_hw in the subject (Ping-Ke Shih)
v3: wake from rtw_reconfig_complete() on RECONFIG_TYPE_RESTART
v2: wake from rtw_pci_reset_trx_ring(), gated on ring->queue_stopped
v1: https://lore.kernel.org/linux-wireless/20261002231013.11792-1-abdurrahmankaradag19@gmail.com/

 drivers/net/wireless/realtek/rtw88/pci.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/pci.c b/drivers/net/wireless/realtek/rtw88/pci.c
index 66d2e5f..c7ccde8 100644
--- a/drivers/net/wireless/realtek/rtw88/pci.c
+++ b/drivers/net/wireless/realtek/rtw88/pci.c
@@ -568,6 +568,23 @@ static void rtw_pci_napi_stop(struct rtw_dev *rtwdev)
 	napi_disable(&rtwpci->napi);
 }
 
+static void rtw_pci_reset_tx_queue_state(struct rtw_dev *rtwdev)
+{
+	struct rtw_pci *rtwpci = (struct rtw_pci *)rtwdev->priv;
+	enum rtw_tx_queue_type queue;
+	bool wake = false;
+
+	lockdep_assert_held(&rtwpci->irq_lock);
+
+	for (queue = 0; queue < RTK_MAX_TX_QUEUE_NUM; queue++) {
+		wake |= rtwpci->tx_rings[queue].queue_stopped;
+		rtwpci->tx_rings[queue].queue_stopped = false;
+	}
+
+	if (wake)
+		ieee80211_wake_queues(rtwdev->hw);
+}
+
 static int rtw_pci_start(struct rtw_dev *rtwdev)
 {
 	struct rtw_pci *rtwpci = (struct rtw_pci *)rtwdev->priv;
@@ -575,6 +592,8 @@ static int rtw_pci_start(struct rtw_dev *rtwdev)
 	rtw_pci_napi_start(rtwdev);
 
 	spin_lock_bh(&rtwpci->irq_lock);
+	rtw_pci_reset_tx_queue_state(rtwdev);
+
 	rtwpci->running = true;
 	rtw_pci_enable_interrupt(rtwdev, rtwpci, false);
 	spin_unlock_bh(&rtwpci->irq_lock);
base-commit: 9b0be45d4d52fd223994e151f169743a97abd290
-- 
2.56.0

