Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D2D3955CA
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791773296; cv=none; b=nQ60IsO81HO4RkFBpEL7mbEcX/P5/OKVk3V13Lunm+8k2cKcR5x954hPxU4smawfMwH9Se64pi+JjIxJAMO0pIQlKa2Dcuw3iIXL1c9/nUYq1q+I1tB7h8/Qj2zT9y/iUS2hw0I+3my03oXeBxqEr9/DYH7hxgwsJLijeN/e++o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791773296; c=relaxed/simple;
	bh=2c6FHbDogfBrduXCCI7VOAy1VXH01LnCKza655W09L0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=pD3sFcq7bagc4wCZ51Afzm49NJcc+HVWgkSPdd83YjqXIbcGXFrcJORk7gE1p2zVtKfg1ftaNRdT4lw7iKPVySmpKAVlHth1ivO/FRR9r1WkFZTQBl9OcMu7+Roa/uu373s5+RhIW/kYiNUXDRBBKtQHkhn9Yjuz9OfP5qBhA3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C404R0Tx; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C404R0Tx"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so1193333a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791773293; x=1792378093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5g4EDtnT5ijGyh+VblMsYr8mjS4n2s4T1B9NBY7siAo=;
        b=C404R0Txg5LJTclrmqbWAFC2mPv6bTL8bpLvTcAIEm7Lw5DH/8TNyQctkdoKiYcJGy
         Rjxyv8+ZE6Nz+72fmzq8Fu/I0/xVJtiQedwrMp6kZqs7rEEd/Do0bN347X4jYGmZbmS1
         UrKq5DidmE5p213e7hw0B8fC1IU0E1J43EmyglU4LHGcTWAnRn6qC2e1E0UzYLXc9d4F
         OKvv2UDNKnJPZuPa17s5h8C4ervdBtCJptbiL8khahS0xF1OkiL/LDf54ikXjWCh5BTz
         p5dIP9EAn5RnsOrPmXPfzDkplv4FMr5OBkOdQd52qw6/JldDORKziQdLwVrMe7KHzzfU
         A3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791773293; x=1792378093;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5g4EDtnT5ijGyh+VblMsYr8mjS4n2s4T1B9NBY7siAo=;
        b=0/eIvIjBltUGrBgmQpeidfA31bORbYGfTie/czdawuY9uP0jzrX/gCHV0UCTx1w+71
         dQcM9lkWbXqrS8mv6JBmi+sIo0KDsKy+1LvVmYkcieBn35/bV47LdlduYnOOHAN+Hbf8
         ZakIhNdLxs77GQg+CEdWFttyQTDHonDVE3roPDSVZCp549M6bAQ3Z4LQ5roCh7DtiI+O
         ZlOuoN5mTvmasKVTkugTtuMa1oTOCC+74HWvVqPJAoB0Q9r5pCTWT54LKhDzKwRYdM+l
         85YxuVXnT1k5h3i47d9rh2tXllD2oOLueLEYNbzs6DwGEf0gNhR465G6WqXUBnfKKrZc
         zDag==
X-Forwarded-Encrypted: i=1; AKwUvBxXX5FaHR/KfKH+dM8V58wpowp9qoCryDi19MAiO4R37/8ZslfWfTMLK/nY4IqDIEGLg3VXklW6uLg65+M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHqpqO0qJLbkRhWamYRUauddmcVZyUFF4tpNTn7iWK7YhGSr3W
	W10R4kUr7CKKXVnnaJno/JJBXowB/LIIEFY8tF4pxPvmdeLJdBYPwtTm
X-Gm-Gg: AYBFou0YP2Ic/ZJmc82BjU4sLfCMr5h4hYShQtetrI5VqMtKbPkED7xqP09z69DKALG
	bzsfeiJPN+/kqhND7loMVyYkYdXgETbWOaVxiQ7Dt3Rmf3EJ8W/cxqw/3/sBh/HnWWlqUZ7NZg3
	OTU69AVuFKOum3QEOWMFvfA5oQSSKz94QXHq8lMODyoWXD91S89XTJ331gadS6jqnPLIZcxFKhI
	Q4F7zQuXSdNmhf1yAeivi8QxMMpIFP7paQtI0AZkfJalW9sV7HUQxszTiYyx0ZwR2vjzk7CFR1/
	GVPG3ZATFJ/Fb6db7OijxlXCOu/6D4U5ZkB5S25bqrIifmrg+BqJTjf00Onf13hlro2f1SebQXY
	QklGcMSJekNy/hxuhIzutm/Ryl4teRQFc7CGxNEVgV46R6xuqfnajUEaTDnAwR4sYDWIkXcpMg3
	89srOhlf0bWGYcZxf+iGLT2+AIfcM1Sy0qsYADATYuYs5sUHM8YWt633duMWyo1P628w==
X-Received: by 2002:a17:90b:57cf:b0:3a0:7cbf:b8cd with SMTP id 98e67ed59e1d1-3ab3a955de4mr7112549a91.14.1791773292612;
        Sun, 11 Oct 2026 19:48:12 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9633fsm18015138a91.6.2026.10.11.19.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 19:48:12 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	johan.hedberg@intel.com,
	mcchou@chromium.org
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2] Bluetooth: MSFT: Serialize handle map cleanup with event processing
Date: Mon, 12 Oct 2026 10:48:06 +0800
Message-Id: <pm-bluetooth-objects-candidate-0242-v8-0aec1bf7c46970eda23e@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

MSFT monitor handle mappings must remain valid while vendor events look
up and use them under hdev->lock. msft_do_close() removes and frees the
mappings without that lock.

hci_dev_close_sync() clears HCI_UP and drains the RX workqueue before
MSFT cleanup. However, a transport callback that already passed
hci_recv_frame()'s state check can queue a vendor event after the drain
returns, if no earlier shutdown callback has quiesced reception. The
driver close callback runs after MSFT cleanup, so event processing can
overlap the unlocked removal. msft_monitor_device_evt() can then
traverse freed list entries or read handle_data->mgmt_handle after it is
freed.

Take hdev->lock while resetting monitor states and removing handle
mappings in msft_do_close(), as normal monitor cancellation already
does. An active event reader then finishes before its mapping is freed,
and later lookups see an empty handle map.

An instrumented kernel produced this KASAN report (timestamps removed
and unrelated frames omitted):

    BUG: KASAN: slab-use-after-free in msft_vendor_evt+0x1906/0x1990
    Read of size 2 at addr ffff888104df3602 by task kworker/u17:2/502

    Workqueue: hci0 hci_rx_work
    Call Trace:
      [...]
      msft_vendor_evt+0x1906/0x1990
      hci_vendor_evt+0x6f/0x90
      hci_event_packet+0x894/0xc70
      [...]
      hci_rx_work+0x3f8/0xfa0
      [...]

    Allocated by task 499:
      [...]
      msft_add_monitor_sync+0x6a8/0x10a0
      msft_add_monitor_pattern+0x7f/0xb0
      hci_add_adv_monitor+0x1fa/0x2e0
      [...]

    Freed by task 499:
      [...]
      kfree+0x307/0x580
      msft_do_close+0x238/0x750
      hci_dev_close_sync+0x546/0x1380
      [...]

    The buggy address belongs to the object at ffff888104df3600
      which belongs to the cache kmalloc-32 of size 32
    The buggy address is located 2 bytes inside of
      freed 32-byte region [ffff888104df3600, ffff888104df3620)
    [...]

Fixes: 145373cb1b1f ("Bluetooth: Add framework for Microsoft vendor extension")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
Changes in v2:
- Format the kasan report.

Link to v1: https://lore.kernel.org/r/pm-bluetooth-objects-candidate-0242-v6-e48e08db5265b66aeda9@gmail.com

diff --git a/net/bluetooth/msft.c b/net/bluetooth/msft.c
index 6f4b7c38a2474..2559c5b1bef02 100644
--- a/net/bluetooth/msft.c
+++ b/net/bluetooth/msft.c
@@ -683,6 +683,8 @@ void msft_do_close(struct hci_dev *hdev)
 
 	bt_dev_dbg(hdev, "Cleanup of MSFT extension");
 
+	hci_dev_lock(hdev);
+
 	/* The controller will silently remove all monitors on power off.
 	 * Therefore, remove handle_data mapping and reset monitor state.
 	 */
@@ -697,6 +699,8 @@ void msft_do_close(struct hci_dev *hdev)
 		kfree(handle_data);
 	}
 
+	hci_dev_unlock(hdev);
+
 	mutex_lock(&msft->filter_lock);
 	list_for_each_entry_safe(address_filter, n, &msft->address_filters,
 				 list) {
