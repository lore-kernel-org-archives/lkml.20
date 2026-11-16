Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816362;
	b=wHVwK07R435FIL7XiiCHaZeiGXQ7PZYiH1RE0t1y78TcbEKX5l0cI/jjD1h/auHMlJst
	 J+RwX4nTIsr5grRVPJvkDSXn0XgFfr6moMNhoZVvK6yQK0hbc/HwOFweOG40CKq8ciVSU
	 JQB0tV7sSMgBU1UVhVJy6rZfQRtd2fINqsG8YTwUb0sSVUj5mdpp5KN0LahQaiTguZ/gw
	 XETwxK1KGjOga1URTEUeoEZvDnu767DAExwrHvcydjuDQJWf2mMFAEC2DNGAaisLB1U4g
	 thKRs0PHfewMiJKd1MAw/xZgEWyZXRM4QUsqzQYSrNg2g9nJ8A+KmRY4Lzdfi05BixA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D3L9I6nVkWNX8DoxsebmsKpsQfDRL9KhwjDhBEHBohQ=;
	b=uUvBrb1qiBJZzU8dfOtp7UmNUL4Cq/nBf7atnrdKxl3GBtu39+cczqlfSUNxIMO8TQmt
	 Xqm2xjvWDzaR+IPYSGpQ8ORzI5le76dv6+m1H+X2D3A9TxKONQeqzdWP/TCFKkmwkvnAm
	 5kqGNs+iHTY9dN13PnEG2gq+bY1qiDCeo2jdT1FrDxqrJHWvCusIKI4Jki/eAPeikRBWa
	 gv1B6KB/1f9AIM0BXKymj+i/3nc0Gc9pl5+LDOgbC40w3VZ68Bjl59tAlrHtErE9X+U0R
	 EnKfG7APtBEsRl925mhBiK8A7nKpVzpFdJOcIHOLNEQWy7SOPuZlF9g7Oa+r4jz7A6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ygc/pnFP";
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ED8606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4ED8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ygc/pnFP
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so2766440a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794816361; x=1795421161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3L9I6nVkWNX8DoxsebmsKpsQfDRL9KhwjDhBEHBohQ=;
        b=Ygc/pnFPOt8zvc+W+L790+lPPI92JkPu1Uet0MizR+wPU4/4AVPIO33xQIQQXWqjwl
         3IsZczk6UpPFMxES408lo6l40XuzSn6/U1NdX8Hulaf4qhY0S6hHaZMoIfvObWIYZBzU
         R7MW3wm/wkILcpsvHyc+Zfv1G4KYDaDGKYTAizSo2YHL4mcOEUgh0hQVBF5HhFKZ85Qo
         PnNiRUh1eZLLQEDnb+1yegApZbv97tfxhdh/aUJQeLdYJCo3jPsGg0NhoIZ4HaddwmFZ
         /jlcSvhnu1UNfNdcNObY98A1srXDzubomlcD0Xsg52xBamATrnZWHwq/S1R40Kd2fsRE
         xPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816361; x=1795421161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3L9I6nVkWNX8DoxsebmsKpsQfDRL9KhwjDhBEHBohQ=;
        b=UPisWkTnKz/TbjcjjdSxiG2ymABP3J5/yLWI2N3iIajMzj1n5saCpdQaIBtPTxNv1Z
         i1dbZKDGX/BayW6PjRCmcSTun1A1r6WinEF2+FyQOEOxqJMlGyflX3dxMZhY7vrhJ8YW
         V8gJaO9wDfKkC50TmN8q/75rG+TYMO7WiM/zErDeSY2VzYDMKsrJH6AMwFPQmwQZI6BY
         qBWGIMhjLgj22IBPWUAcfSahT2zUVchU33oDzma3ahqRUbbin3T3I9qx/tdKT3avAvh/
         M4ARueF4bf64LHvncVnK9Gex99HqruIlI2CaGe/YS8pmpZj7eU5hD/vjKqXb3pSHWAm0
         8OCg==
X-Forwarded-Encrypted: i=1; AL+hErEr6zVqOKLNRf6Ll4pgvXXPxqx0+rjjJJR9JkVgNpJ7WOsuVFab0e4VonjIuXFUP94Kq0H8xBaVbMJrop8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tRzbJterBLUacCtljfZa3XMx5Weakw1WLtrtqbYtDDk9gK3WD
	aOtQfA3SQPOfFSrChhFHSUXzFzXO4zfF4UAUYGF0xe30rxVl0zYPOtNe
X-Gm-Gg: AZFdTZf+f4KdsHSS9YiH79KGWPgOMCkAQTjd8KZj9Xl0gp94GoH5kh8zPd3yR/+PbO+
	MVd2pukLcQGGFdCGaK5jfu+4/JPlxPpiy+FnlBApN/s1F3i4Hx4AOz996GcTkwKW9Vwv2NQH1Y/
	wjKgr+qBs3Nf0xjBD9414vYs8SDNDsJ5ZXQFwbRek3OyB8BMb1hcqExsk76Njhptm5IdIqLoxzZ
	8zZuUTniTJPSSRC2Je3cPnjd2K8G6UxRJBNmICBtrtxFr/YqRiJ2NSLbtmrLp9GglK6+kNFWZ8y
	SMHvvOWFv/706Vk9yMwaxQYOoDR7A9XOOj+kvI4Nl+XF96xh7mQA4OBCCJJhGyncS9pPy2IcduS
	F12hwmHBH562+sST0qaKarbU7eF1aYHwkvG4W93Ee/UikP5u3kafK33B48sk/hK0BdcdaMTR3yl
	NQkMwwhbdrEVxNBSIYa4oY1oorg9WQ1nmueY2Ku69Y/zGpSv2N/kcZpsaRwHdpXDCdNczGhSRHR
	9FIa9V+gL3E8gMQ8c/3mZdQaBchVHTZMC+gGPh88CiBx6nTfxspKBQCfu0xYlM8mOAqFgtl74KW
	PJz9hvJ90j4uNUMKMnQTkorEFn78cBXRuDXsH2TSU+RntYxRzm8MvPcp9RV+
X-Received: by 2002:a17:90b:2f0c:b0:3ab:884b:65a8 with SMTP id 98e67ed59e1d1-3b1b0ba0acfmr9088807a91.26.1794816360741;
        Mon, 16 Nov 2026 00:06:00 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:d1be:2710:af83:9beb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d282fdsm20924303a91.14.2026.11.16.00.05.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 00:06:00 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Michael McAllister <me@michaelmcallister.org>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: hci_serdev: serialize flush with transmit work
Date: Mon, 16 Nov 2026 16:05:38 +0800
Message-ID: <20261116080538.66575-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

hci_uart_flush() runs on HCI close and reset and frees hu->tx_skb while
write_work may still be sending the same partial frame. The worker can
then resume with a freed skb, or both paths can free the frame.

The tty flush has stopped write_work before freeing the partial frame
since commit 1b0d946d6f08 ("Bluetooth: hci_uart: clear HCI_UART_SENDING
when write_work is canceled"). Do the same in the serdev flush: disable
and drain write_work before releasing the frame, and hold
HCI_UART_SENDING meanwhile so that hci_uart_tx_wakeup() only records
HCI_UART_TX_WAKEUP. Then re-enable the work, release SENDING and replay
a wakeup that arrived in between.

AI assistance was used.

Fixes: 82f5169bf3d3 ("Bluetooth: hci_uart: add serdev driver support library")
Cc: stable@vger.kernel.org # needs adjustments for <= 7.4
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Michael McAllister's v2 series changes the same function; its
HCI_UNREGISTER check goes above the new lines:
https://lore.kernel.org/r/179468159400.2456.12381703314197227930.wcn3950-poweroff-v2-2@michaelmcallister.org

Tested in arm64 QEMU under KASAN with a hook that keeps a partial frame
in hu->tx_skb across an HCI close: without this patch write_work reads
the freed frame and the close path frees it twice; with it the run is
clean, the close returns 0 and the device transmits after reopening.
The same holds with the v2 series applied. No new W=1, sparse or smatch
warnings.

 drivers/bluetooth/hci_serdev.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/bluetooth/hci_serdev.c b/drivers/bluetooth/hci_serdev.c
index d2c48df34199..194f11251cc5 100644
--- a/drivers/bluetooth/hci_serdev.c
+++ b/drivers/bluetooth/hci_serdev.c
@@ -97,17 +97,26 @@ static int hci_uart_flush(struct hci_dev *hdev)
 
 	BT_DBG("hdev %p serdev %p", hdev, hu->serdev);
 
+	/* Stop write_work and hold SENDING so wakeups only set TX_WAKEUP. */
+	disable_work_sync(&hu->write_work);
+	set_bit(HCI_UART_SENDING, &hu->tx_state);
+
 	if (hu->tx_skb) {
 		kfree_skb(hu->tx_skb); hu->tx_skb = NULL;
 	}
 
-	if (!test_bit(HCI_UART_PROTO_READY, &hu->flags))
-		return 0;
+	if (test_bit(HCI_UART_PROTO_READY, &hu->flags)) {
+		/* Flush any pending characters in the driver and discipline. */
+		serdev_device_write_flush(hu->serdev);
 
-	/* Flush any pending characters in the driver and discipline. */
-	serdev_device_write_flush(hu->serdev);
+		hu->proto->flush(hu);
+	}
 
-	hu->proto->flush(hu);
+	/* Resume TX and replay a wakeup recorded while it was stopped. */
+	enable_work(&hu->write_work);
+	clear_bit(HCI_UART_SENDING, &hu->tx_state);
+	if (test_bit(HCI_UART_TX_WAKEUP, &hu->tx_state))
+		hci_uart_tx_wakeup(hu);
 
 	return 0;
 }

base-commit: da3cc02587c629420603df4395179ec82955c941
-- 
2.56.1

