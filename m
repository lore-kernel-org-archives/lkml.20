Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B7238333A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439443; cv=none; b=XBZ8BYXTKJmZLwDf4shZUTgGGXcOrXpZPdZ1tYrmIwQYwcJ5oC0+iI1JKBwfeZ2CC+h8/vJ9nd2Rb6mjqrum3x/VGKe1kKC06L/Bw/BnaMA7YbYjhJykS6ek9IFn8vRM0hYNBdo3NGUQHVbe92TJaeaIaZls1TK79VzxpStrgzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439443; c=relaxed/simple;
	bh=PcW31aLcf7QLC4AFyS3qRN9LhPHMzg2IsGPcFvZQ/B0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=RTQsTTfC12TTvb8ejVbBssw4qI3GKimJZ0p/9J9CEFG4TGE3k4k+jNZ6rW6pBhkbHY6A8YU2nqHPg9yTvaoZmWcB4W9qjU6JdJ4yXcMNI4vqTBB2/OcwimrMU7QMgyn3cC1b2tE3Yw6W5NPnNVxELMX55+ai0U9rusfe6+YcGc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boekfo6q; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boekfo6q"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso1737869a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791439442; x=1792044242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vVfVT+UFtA5oYCaZRmFTBLRBViF4NDwZkeVmLB9yJho=;
        b=boekfo6qv/pvKGqXukdDZOIGXAEYcAewXA0vPEIQ4xwSZUf2nIT38jQxZAgQkYrxj8
         D/aEApqm9/4JQL2w+QvpPq12bAOnK12IhdkK4J8+zbksdAX3irP4jO8M9aAaHbJF4t34
         wYC/xwfw2dk0r5/G2/FLF4feidpxWhbFJNC1urPi6rb8ssQNuXC76A59TU4fO2s6IQb0
         SCQa0iyqpkg0S7GTDwozs4LDmdrg0sdFAinFGvvzGjHOhfvirGQJ792vH82zvoDEwbZr
         uSDDLjVkSk7l7OYV++JKJcgtrdqQEuRab1y5hjLNLVwf5R60GilgLyvoLbCuAJr5YHmK
         BFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439442; x=1792044242;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vVfVT+UFtA5oYCaZRmFTBLRBViF4NDwZkeVmLB9yJho=;
        b=J9jstdLvgJ2effaZ2AwgJ8N2Wx0TruV25e3PDVNIneykTz6f/2Ri/iJslPvrHWAQrN
         Smx5K4ZRK1yS/5Dq7uadGKqpppuUu0Ju7K1pU0O/vosPN8XSdBiWvMvxljUZrgji8nEB
         pYGDAv7P/lUFqomHsrNqHglVdpoUu2ZUFFiHP0x3Ml5OWneolopP97kw4czDA1ddhBkU
         xfluujKrA5AsAKalGvLZyt5TE5ki3SqN9O+2akh+W+mPUZRgmhhD8c7SMAB+5ZvJ1m2X
         ugA9RY/QwRupmPArzxnibflckFGCztZSk3KBpBCW84lvpqMB3t8NpFUt3lcaS046kA6X
         FN5A==
X-Forwarded-Encrypted: i=1; AKwUvByuQ9uodv3klVJTy9JOq6yt8CIAtiP/6lnt3cZzAbf5USawZkc8FkIBwXS2TVI9f7FHawHWW4djpeBPA+0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKz5bkAIWKtbVKr5/xA1eFFs6Ku68H+01Owd1Mc+HzkbNhDYp/V
	KUWs3BRQeKijG70GFi3ukTFZxVpDqp74/6M0M1pmqk4Epb9KjQ+IfohN
X-Gm-Gg: AYBFou19YP9V3MR5sbn6w7vZf9St5w6IIQFNTenj97kzB4JKZ3/+BTjd23Wl4SEITHS
	FogJNRcmdO7qX7FNLOEJhQvZPgJnW9Y7DFbR0LKukZgq3cxmW6DcrX2EerLzVuOVbwjR2x6GckE
	iWyVht3kvWq2Dm8xLh8lv8cQyKxneD44dJIJLgbyW0DhQHlUKugTKg2S5L9cGHXcLIRBgD33QBJ
	dtwcvSb4otmjGXKweKNGn9V2uLxN4JhoSjLKW+2ODKBX7eGXX/quAA72ajuK593TfWoGJSXMXg6
	EVR4dRW+S+275pVdjsZOlQD2EJLVR2+qr0nx1qbz0tRQsRQVI0IpSBmlstzs/IzSmeAwEBtDICk
	9WJ6NfvEevEC+eqGgy1OTlmDuvCpfy/jodjirvQOu3g+Et//ex1pz2Mda6q1Xi3RbFoDdKGlAym
	Oynh3/H4Hso3r2jKP89eGrmFQiyUg2axPjNacv7kfN9bmkn/tqyK1MeTYo49I+XeuQkgqOS5aIt
	wNo
X-Received: by 2002:a17:90b:4a89:b0:3a4:f6b0:7de with SMTP id 98e67ed59e1d1-3a8a08515acmr4074044a91.22.1791439441844;
        Wed, 07 Oct 2026 23:04:01 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbccea3sm2622298a91.15.2026.10.07.23.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:04:01 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] Bluetooth: MSFT: Serialize handle map cleanup with event processing
Date: Thu,  8 Oct 2026 14:03:55 +0800
Message-Id: <pm-bluetooth-objects-candidate-0242-v6-e48e08db5265b66aeda9@gmail.com>
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

An instrumented kernel produced the following report:

    BUG: KASAN: slab-use-after-free in msft_vendor_evt+0x1906/0x1990
        [Thu Oct  1 15:01:51 2026] Read of size 2 at addr ffff888104df3602
    by task kworker/u17:2/502
    [...]
    [Thu Oct  1 15:01:51 2026] Workqueue: hci0 hci_rx_work
    [Thu Oct  1 15:01:51 2026] Call Trace:
    [...]
    [Thu Oct  1 15:01:51 2026]  msft_vendor_evt+0x1906/0x1990
    [Thu Oct  1 15:01:51 2026]  hci_vendor_evt+0x6f/0x90
    [Thu Oct  1 15:01:51 2026]  hci_event_packet+0x894/0xc70
    [...]
    [Thu Oct  1 15:01:51 2026]  hci_rx_work+0x3f8/0xfa0
    [...]
    [Thu Oct  1 15:01:51 2026] Freed by task 499:
    [...]
    [Thu Oct  1 15:01:51 2026]  kfree+0x307/0x580
    [Thu Oct  1 15:01:51 2026]  msft_do_close+0x238/0x750
    [Thu Oct  1 15:01:51 2026]  hci_dev_close_sync+0x546/0x1380
    [...]
        [Thu Oct  1 15:01:51 2026] The buggy address belongs to the object
    at ffff888104df3600
                                                                which
                                belongs to the cache kmalloc-32 of size 32
        [Thu Oct  1 15:01:51 2026] The buggy address is located 2 bytes
    inside of
                                                                freed
                                32-byte region [ffff888104df3600,
                                ffff888104df3620)
    [...]

Fixes: 145373cb1b1f ("Bluetooth: Add framework for Microsoft vendor extension")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
diff --git a/net/bluetooth/msft.c b/net/bluetooth/msft.c
index d9dd722db3..667c9951c3 100644
--- a/net/bluetooth/msft.c
+++ b/net/bluetooth/msft.c
@@ -681,6 +681,8 @@ void msft_do_close(struct hci_dev *hdev)
 
 	bt_dev_dbg(hdev, "Cleanup of MSFT extension");
 
+	hci_dev_lock(hdev);
+
 	/* The controller will silently remove all monitors on power off.
 	 * Therefore, remove handle_data mapping and reset monitor state.
 	 */
@@ -695,6 +697,8 @@ void msft_do_close(struct hci_dev *hdev)
 		kfree(handle_data);
 	}
 
+	hci_dev_unlock(hdev);
+
 	mutex_lock(&msft->filter_lock);
 	list_for_each_entry_safe(address_filter, n, &msft->address_filters,
 				 list) {
