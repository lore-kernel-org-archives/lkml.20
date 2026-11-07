Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065613;
	b=hajg0+UH0fMD8t2MRW3+iYU6hWRAmdGKk5pNCZPl6Dq2N0xrK6znRJtPySn+eNJK9/JI
	 sH67Vpz/zatxvxxLKB5UY56RdFErwxqg0jaMlQobR2acVlYtbwb0dYsoM5dhZyCRzPC0F
	 Pb46mQsmaU2lfzZSQbZdm3ZY0ZSta+W7vXvGIFoG1JY6EbsKPre6ipntfb1J4H2svTeqO
	 KxLOtQNhjYumorNFzu+hMVv1YgG9cgEQP4ul2pUmpZmI6qln9iFm5m7H668NWjuz0wCwN
	 E6CA3iggorJaYbQglhLbRXYN+u+zmhv4uiChip3zAb+BiEmu8xVCJHm5yEC1TNw7oTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o5BouOfVj6QrHRMx9FtSeHZTkceBPgzJ2LCjg7lA6F8=;
	b=fKJ3W1PpHfpbwqyjaVkToKJY22WSNePG/3p/EQWpZMdiiEntu4woCrzYqIgjlXncteqG
	 nlQTO6d2zEJl1FdHtdR7sXHnlKcVa7jFREtwKC5C2q/tAYr+poHyAtmfwU/yVefxpNMmZ
	 4b40i2mghZe7t4iYTFijrbcXkLFhZw+RZqxVRanvrEypQSUx39B1q0UTyxl9m6NqDwimO
	 pnfcZ8qiaE9dKaTnANfDkqcDQ6nPqQ/oIx9d1r41Iw5b1TXMaO6kKUO77VnFIDYylnkfn
	 V5jZonynDoC2PFosHrtnee1+cDs914Q1oDlP0VqvAa5Bo3c+jPaVAzrYM2xFEvtBFfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yj4cDSkF;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6741C606A33E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6741C606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yj4cDSkF
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37000e7234bso2772591eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794065612; x=1794670412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o5BouOfVj6QrHRMx9FtSeHZTkceBPgzJ2LCjg7lA6F8=;
        b=yj4cDSkFVYDWYdtMlaEUcHRvWY/d+c/hagAFafGVJ2kowj7dEQtzde1dFtIr9b8k4O
         TznZsh2F8ZZSCDShb7GwY1Q2EMPyfv4l6WIR8wugF0oVmUUV5XsQvpIkv9BYwYBa4upM
         v49KfCxM6hDHs2bGh3SbigkIGGfWJbKvF7xoSGkOBM8qpXVG9SHqKDSm9MEzjogwlzQf
         doEZfXO7C4/5NyZ9Y+AOCAwV6ZM/0INN4g2SEEtHsmIFnb9AbasKCMBkCp6t85EyOh6X
         pSPMnI/Mi+0bbcN8+9Sj0wBCv1o4Mwu+sfFQU2Ez6P/9d3JirkyqtgmB1V1hLsJMFsqr
         chrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065612; x=1794670412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o5BouOfVj6QrHRMx9FtSeHZTkceBPgzJ2LCjg7lA6F8=;
        b=TIyN4ADOi+sVOA/D3q4XfA/fZDXCbqlrQkL4zNBmnGF7Zys2PbfEgMsn6jHXyic/Ed
         GndSbeYNVFlDAHwu4gIkmMBKqDP0lmryRTmEsQu73yJpc10Sob/m5ndtyduI2USNX5E2
         fGbGCjnrwVG9LopZZ6CZARlM/7MhIcSQdfg6yd8nV8iWCoNIHoCVwEb5eC+jlaS/PPpz
         fIRZ4r4w7LzpFT8gBJeuZ5BIosUwcL5WvyZ1B9KluemXqq6h7D036z7HJJ5Fr/mMWpLP
         j7hlSbpMKdBV7OB6GNSWhKHN9Z3DMh70bLKKqs45hdVwZGL51u9z6U/V0g0enHHfBBB9
         SwdA==
X-Forwarded-Encrypted: i=1; AL+hErF+nDO582RZD7+WDKvuRJ1k/FzEDlo2wyGCmNv8AjIBdVPDI6F1aD0NjByyPp6PqeWfIsergJEWDHh3MZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4mnmaqfLWEUaIhzMZ6Y3nzQhezwNNr6jDIeYmdHyUpvJfZHCb
	sKfnPiXMB5llkcZhJYudDdKA6BvuYBQeyuLANjxVLdqWlYXzsZKVey6J
X-Gm-Gg: AYBFou33jiCwgdQlm4bKzSG81y1yYXtK/VteSPPMiu1yBLlXQxg5wrPVnV40tdxCH9n
	ZL7ACkfMoQIGahU75CGrhXP9Q4MlutcT4hJrUJ2cAsCOhLaTu/4LrVa8Vo5xRBMSnqog6MabKEh
	gvMLxPtd+rqsXCwEmQBypkxazNYU5q3Qd+rQ9IM7TzmK1aN7Fcg4XKYSUKwL3c+CJKoCdcSvVGQ
	dnJXULrSJ5Jw6PO2VVW4CMlniBKmNt92hK6ZDrzCpCWSfaZWHJ2nyZGwJ2vExilM7uuGqjzzUZS
	IAhPutf1t1bIBdHloO9r0cfJIzZo+4yqHQA7wcj8ksvY9Pbhpx1hgMy3rcZ/ZJvAp7SCmyq9606
	2uyPfgT/kEWz9eB6oRwzXxgzxI0XQoDRlfPf/BqcNaUXHKo6q0A616P+QIYLN+O37Fvg+5nPzfO
	HBImPrjcxLwhnyttFD6HxAL94Ixo9lJLGl2v+TSyAV7NV4c5FX8hEPxHRcs9xfKP+4Kf+NouK0u
	kjgC5rAnhGFBz8D/9n6tNZqVt4HxDfNjOUZEwC8ws9xrYSXzhdcJZl5UkAOA2aMExCe6eEzUMDH
	MiMWX8+WYH4IXZ7UxuxH9WRByXnlveGACyNMh9i75LFKZo2Wv7irBPjHPFhNtrmrZzWU9Q==
X-Received: by 2002:a05:7300:10c:b0:369:f97f:72c1 with SMTP id 5a478bee46e88-36f771025d2mr8735252eec.36.1794065612157;
        Sat, 07 Nov 2026 07:33:32 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm17256890eec.12.2026.11.07.07.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 07:33:31 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	linux-can@vger.kernel.org
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] can: peak_usb: pcan_usb: cancel restart timer on stop to avoid use-after-free
Date: Sun,  8 Nov 2026 00:33:19 +0900
Message-ID: <20261107153319.3765325-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

pcan_usb arms pdev->restart_timer from pcan_usb_restart_pending() (the
restart-command URB completion) during CAN bus-off auto-restart; the
timer callback pcan_usb_restart() obtains the pcan_usb via container_of()
and calls peak_usb_restart_complete(&pdev->dev).

Unlike the other PEAK USB adapters, pcan_usb provides no dev_stop
callback, so restart_timer is never cancelled on teardown. When the
interface is brought down or the USB device is disconnected,
peak_usb_ndo_stop() / unregister_candev() tear the device down and
free_candev() frees the peak_usb_device (and the containing pcan_usb)
without deleting restart_timer. A restart timer still pending then fires
pcan_usb_restart() against the freed pcan_usb (use-after-free).

Add a pcan_usb dev_stop callback that deletes restart_timer, so it is
drained on ndo_stop() - which unregister_candev() invokes on disconnect
while the interface is up. pcan_usb_restart() does not re-arm the timer,
so a single timer_delete_sync() drains it.

Found by static analysis and code review; not tested on real hardware
(needs a PEAK PCAN-USB adapter and a bus-off auto-restart racing unbind).

Fixes: 46be265d3388 ("can: usb: PEAK-System Technik PCAN-USB specific part")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/net/can/usb/peak_usb/pcan_usb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/can/usb/peak_usb/pcan_usb.c b/drivers/net/can/usb/peak_usb/pcan_usb.c
index 8fd058c..4c13195 100644
--- a/drivers/net/can/usb/peak_usb/pcan_usb.c
+++ b/drivers/net/can/usb/peak_usb/pcan_usb.c
@@ -882,6 +882,14 @@ static int pcan_usb_start(struct peak_usb_device *dev)
 	return pcan_usb_set_ext_vcc(dev, 0);
 }
 
+static int pcan_usb_stop(struct peak_usb_device *dev)
+{
+	struct pcan_usb *pdev = container_of(dev, struct pcan_usb, dev);
+
+	timer_delete_sync(&pdev->restart_timer);
+	return 0;
+}
+
 static int pcan_usb_init(struct peak_usb_device *dev)
 {
 	struct pcan_usb *pdev = container_of(dev, struct pcan_usb, dev);
@@ -1051,6 +1059,7 @@ const struct peak_usb_adapter pcan_usb = {
 	.dev_decode_buf = pcan_usb_decode_buf,
 	.dev_encode_msg = pcan_usb_encode_msg,
 	.dev_start = pcan_usb_start,
+	.dev_stop = pcan_usb_stop,
 	.dev_restart_async = pcan_usb_restart_async,
 	.do_get_berr_counter = pcan_usb_get_berr_counter,
 };
-- 
2.43.0

