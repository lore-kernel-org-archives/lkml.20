Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577619;
	b=tFsm3M5TZpxD097YV/yHZ2736M9+qDG1nq9GI7KB0USsHsdc9Yv0aVRBO9VX/JJm5nQG
	 NkojuEtDE6h66Eqh3YmVs44UxTZouI9Xue4fDWCa/oErx+17rd9oARAi27fNubwhGQi9G
	 Vmk5faYT2VBhWXTR8ixFlKeVgvNkGUz36FzGRT3Tq0f56RmhJdlxeFlYk0Wvm9xjHeBP3
	 Xw9v2pl/dEEzplUYU4qy7wlDGIKmtQksHaZJb4/5HR2/rUovch+uDbVWn+iEDoxUuSaPh
	 M6FrgX1WHNvHFos/j8vO+GbgNZHtJ2g8KqyY2RdyVnc2TcZS1jTMt97KjcXTD2yapoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XfVE0hbb4GW27nGRfsqE2etlUF0AV1nyBAOQ1sm5WW8=;
	b=pCsbJDrXs84gTfQxgvjGMfJbEsohdTt6kucZ6eAb/5h4g5u9JQy0zjV2JYI6CNN0Kyyn
	 vd2wiHmRsLbbSwm0DaTgTYjL8xhQyzABfYdYKdIS2d1diP0BtKlnVgkEaRxEWqzsNldP+
	 elKju+tGHcF4tDl2qzdF7C6dInu0fqYR1DDv8RgZubkJEbqx7F7ksS/ySH1sqGATuIzdT
	 33EWFkITclibTVG+CBfNkgrVX6ibELCjo1P22lEls6p0vlwPLI1Mn/TLt9XN2MKmyl/wC
	 MWCo0TpumnvwP/dwlnB33aLcCjWi+CMGLp4+A/E5dZxJRGgdohw2rL04913Ky3bxEkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qLbNoJH7;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6AC606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C6AC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qLbNoJH7
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so3767135e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792577617; x=1793182417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XfVE0hbb4GW27nGRfsqE2etlUF0AV1nyBAOQ1sm5WW8=;
        b=qLbNoJH761XEyD0OcimM+kAc5lJyrQkDumpg028gI3IwdNbDZSo5I1a0ILDMErwCg0
         vxAPb0Di9uhwg7MrKh022qYQ0Nybacr1eVOnRG/KchTRQU3OJ8G8PbpwkdkycJMfPen7
         spT0cbzYq21nQqKGoCxJqz1FnZ34x6oOYi3IQZLQSJvllTu4MduDc8JbCNsEmOQaNWAJ
         14Au1U2EpPX7bcRJMr9MK+UlrTjAx+Im7h0DEtOo1KuKTb3+cXOKG/1n6ENIqhSCkV53
         bWBzOMfvKjr3fSbXQFatRcqe0daN2lYEgxgucJItEAU/bj5r23cMZBt1llFMFxEkW5hU
         KKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577617; x=1793182417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XfVE0hbb4GW27nGRfsqE2etlUF0AV1nyBAOQ1sm5WW8=;
        b=Y9fJaOfSyn0rhpekkEOrTMsBaF+fuZg8bqyp5YftRJcyPQmJdYML00GJr0eU1Yut3C
         bK8BowZjD7CG3VsmuwgPehCLqCAtKAAIG+OyPATxzKjXj/j+k8gP1LzDEe4A+JIZdMdP
         evBkFzeXBOCyc69STPEoeL5WBwcuH1iT748QT7oqoyHoUZHt+wCLOB5JQaALSYGkOz9q
         2K19fhTX/mDUN7sldyuAAn721kcpp9SLkhKGhnk+eTPA6MXgYduC87rUVKCd2u61Ddxh
         KF90vmMnJ1PT31NYmb5Wgc8ywLKkmA63heUzrfjHpfICN18o2+xeLnQGWLK0kfayVqgW
         01Sg==
X-Forwarded-Encrypted: i=1; AKwUvBz7BdtG9ojdYs6ihDeUex5yUljXEtICZrnH5hnXjzKTSIa0gum9kCUpIFnTKLJzTiBi4yf2P+UVxG8lU9A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpQXRvSMl9GY5i3uBTPiynFe4xt4/I26dzpCQ2dBdtrpyrHdIW
	Rz63dkAK6rAO2E67/edvEV0GJaspXOkdEZjIN9H2gRULGre/i5SeroJVC+6NXQ==
X-Gm-Gg: AYBFou1Si0fPVaeB7NmtqQw1qb6if56uMCpTjryOYUSMV7HGrt4hKLM6bE3I/0xN0Zb
	CN3zYf/x4Iu6dmQmqwCd6FnzcPGjhDAZahWjoMdv6Qy9U9d9mImy2oDyeljYuQhgK9Y8/eseC4+
	xLKiESu8ND30oX+X+/G5rgZKj7WJmjcoQJM7pkLUB+LU6CU9mcYvq7SzkekQZl8dRWqL8ZWZbi2
	4S/2OvzM2CMH3vHWdQ1Si+idwd6t2fh0ItTJJSSZ/h9084iF1X3WivML/mNOIdGWzF3JDm2gXsQ
	0wpZxo0Bz6JbA6Iv7BRdUkrQC9B0mv3UGpRhcOvBe8zymCZXEGXwpaEf8aLvU8msZe324HI13F4
	yHE4/wQAf1+hny1JSlDxcbTBvWJ3/XECgjsenj4+4tN5kN8eD5o2GRnUCP5wE/Es8d8LszL+j/W
	jsIFa5nKAiEInkhr3Lg9zf/sn1twx+kqZb2yTayLvbmSnlWBYSJMc5yzVuQxsy2/fJMHbYzYUIC
	Hg+9iVs7UBm08gSt8uMPDznM0DPqd13jUIAXjeWwZUrf6CM2YvEnVSb54hRFkVcz5PKtDoBAZ5V
	QN/DVDYrLxzns1mO3N2ZH2/tt6j+Cz9pq0+QQEB7kfxunRxtNFMCRHwsQl/O9aI9YkWHzoetl1a
	Bjw==
X-Received: by 2002:a05:600d:4446:20b0:4a1:dfd4:9429 with SMTP id 5b1f17b1804b1-4a1fdd3a206mr23422485e9.31.1792577617090;
        Wed, 21 Oct 2026 03:13:37 -0700 (PDT)
Received: from omarchy ([2a02:ff0:1e10:93f:e71c:400:f186:eea4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584afe1sm4869467f8f.56.2026.10.21.03.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:13:36 -0700 (PDT)
From: Abdurrahman Karadag <abdurrahmankaradag19@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: pkshih@realtek.com,
	linux-kernel@vger.kernel.org,
	rtl8821cerfe2@gmail.com
Subject: [PATCH rtw-next v4] wifi: rtw88: pci: wake the TX queues after restart_hw and interface up
Date: Wed, 21 Oct 2026 13:13:15 +0300
Message-ID: <20261021101315.1974894-1-abdurrahmankaradag19@gmail.com>
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
rtw_core_start(). Wake only when a ring was recorded as stopped:
mac80211 keeps a single non-refcounted DRIVER stop per queue, so an
unconditional wake here would also release the stop that
rtw_hw_scan_start() takes before it reaches rtw_pci_start() from idle.

Signed-off-by: Abdurrahman Karadag <abdurrahmankaradag19@gmail.com>
---
v4:
 - reset the flags and wake from rtw_pci_start() instead of
   rtw_reconfig_complete(), so an interface down/up is covered as well
   (Ping-Ke Shih)
 - name restart_hw in the subject (Ping-Ke Shih)

v3: wake from rtw_reconfig_complete() on RECONFIG_TYPE_RESTART
v2: wake from rtw_pci_reset_trx_ring(), gated on ring->queue_stopped
v1: https://lore.kernel.org/linux-wireless/20261002231013.11792-1-abdurrahmankaradag19@gmail.com/

 drivers/net/wireless/realtek/rtw88/pci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/pci.c b/drivers/net/wireless/realtek/rtw88/pci.c
index 66d2e5f..fd84ace 100644
--- a/drivers/net/wireless/realtek/rtw88/pci.c
+++ b/drivers/net/wireless/realtek/rtw88/pci.c
@@ -571,12 +571,20 @@ static void rtw_pci_napi_stop(struct rtw_dev *rtwdev)
 static int rtw_pci_start(struct rtw_dev *rtwdev)
 {
 	struct rtw_pci *rtwpci = (struct rtw_pci *)rtwdev->priv;
+	enum rtw_tx_queue_type queue;
+	bool wake = false;
 
 	rtw_pci_napi_start(rtwdev);
 
 	spin_lock_bh(&rtwpci->irq_lock);
 	rtwpci->running = true;
 	rtw_pci_enable_interrupt(rtwdev, rtwpci, false);
+	for (queue = 0; queue < RTK_MAX_TX_QUEUE_NUM; queue++) {
+		wake |= rtwpci->tx_rings[queue].queue_stopped;
+		rtwpci->tx_rings[queue].queue_stopped = false;
+	}
+	if (wake)
+		ieee80211_wake_queues(rtwdev->hw);
 	spin_unlock_bh(&rtwpci->irq_lock);
 
 	return 0;
base-commit: 9b0be45d4d52fd223994e151f169743a97abd290
-- 
2.56.0

