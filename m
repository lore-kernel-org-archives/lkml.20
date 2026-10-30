Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793328011;
	b=GkwUHqGaMoJOb+c7Xxj49dLBkfDGo5Por6JqtHLAGG4b4SX1EPwHM1AkQ1KvoI7FJRFx
	 iO0CxI/2OF9mA9+tU/8y09LeVF6AlHi2EpGx0GIqMk+3bDZhS33W+NODFlA4BGC1ZCn40
	 JXeF0/TZBHiRu2+RpmWlYx3NwDtLPG28/kpu1TiNgHA379g1wjLlk/DDNJynn/TgiEfDd
	 7Dmpp6bBK7s4NfkmXv1Wl7NWJqnDo1Wu1DKOb40A541nr+uDYpafFeE5C/yXTLzfphUab
	 AVNFmXt3PUi6vjDn9TOUSPn0SiE7vmG+AzT22wq2L91xRK0Xy7xkNYCCBH2hK5qLHyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793328011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=YSAh+y1tZ3U19Rc97yZ2/Ifnxo6JWkQYI8MOkedjj2I=;
	b=M5JdcS+JDqrnA+JMXLq0UlVm/qUS1hi73b1daehXrwNxmCxqK37YY1oA9hayHnl7ZYpi
	 BvtStHtKU/LDGBxNyM4iTdn3dnn99cq2RTS+n29oTPWO+0M1ZLVBHag4uOgDPmM9JmInw
	 iP8QegOGqm9JzkZ9YX1KrQaXJf+hwlr6bNgrS+jXB+ySuoJsLL44Bxl3cgL8Z7zD0KxZ9
	 Rpj243hm5YesobeFfj03SzeH9aSumMNsIpjj5zN0mYqPOlrzI9Z6R9oetR1BKfI+R3cEy
	 cnImv2/hOailq1Ajsxl3wpshlHWZpoZH8/de3UTflIpZi4v21rAgcWbZ8Yg6UTS8x5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U5MbUX9R;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F28B606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F28B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U5MbUX9R
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eadf48fb2dso110153e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793328009; x=1793932809; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YSAh+y1tZ3U19Rc97yZ2/Ifnxo6JWkQYI8MOkedjj2I=;
        b=U5MbUX9RhTMavnColAP3lfJm4DLBU/va00boE654w4KsCKHYF9mOCar0j6U6c2nj5D
         YAEoP9o/Qyz1vOcRjNWQweKGCPCzaqSYkT894bv1xFIkfOTc+GFNj+ChNYatPJMVtU1C
         Uv+4gov1Yi6757H7wlMMuiGeNMyjzCjICuuHBQ3AX6pHx+0mumwjMiskSii6eflVIdXh
         6UibHggjHYA+U2wESaxbMQNyR69xBfWawi4ktDujjVoEhLOK3ar6kXP39fdGZLVt5Gw3
         iCh+qdby1o6OZYLrhUj+YtQTba3Z0ANX5mND6Xu/8JNnUWvRD/zLFAiEJCboS131id3Z
         phRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793328009; x=1793932809;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YSAh+y1tZ3U19Rc97yZ2/Ifnxo6JWkQYI8MOkedjj2I=;
        b=X7TRtU1fm7yZTi9gY2WryILClyAG/mu126RxW4rBS5AVLOlDkxgHkm9XxyNu+Yq4dD
         gVlqttzBrTR2641y4tdeuRxMz2jNZrDab41sUfSjoZHC83Oo3CIbO21fZv3N6tefy+lF
         /Z/qSF1h33grrVgEdhjoKIzQHg/qAHvrux3QKdcRHjtNQ6xzrlIgz8TGTaRZVO+UZ+dj
         77Nq8t2xQR1ar1VSv/tIvYbOfeKHOxeL0KKduN2kCrDDaUYe/Cnp6igWl8c1wex9dims
         UOj2Ywzcl57sgkjhoa7MjRfzyYi3x0+RxHMEu3HneL5FKn8I9+bL1pY8GBNElKtP/L8f
         +cuw==
X-Forwarded-Encrypted: i=1; AKwUvBzsVnGNf+LO4CiwDlL/FI32umwiDMHdr7fVISv+lJH55KXXJaZsiXem+hhocPMT9sp+PlT41gNvefUpIG4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVXNBJ5E2NW77dz2jMrX9nV1w8tz5hEvKQSGtYNmS7AvAOWuTg
	CfkPbUK+KJuCXnWTiJMRfnXApLxIWbVqTBDL3iuS8hMgHtkoy5BmIQMT
X-Gm-Gg: AYBFou1WSHFK54jzt/ha36M+gKLVZFAUdrnUUUzLi5OO1LBuwyDAYClT1sR9HaRKzVj
	qFeIZBun6PoKRlsvyMnYA2KhPbM/t4HO2NtSMSp2hRf4wjGH+QydVeFki1Z4CvWbbj99weTTNZM
	Fjlqo2wGsT+JJ0f1vloGTZudXi49doTVcVdOn8ZcnbZwPDYNVtJxngek3Ixi81VWluV1Co5A0bn
	ax/CIl43Ux53xA3lqfMXVC4u9HjRWAFr0dwJJ2qodQvVs34kn8MAEc079rgI7VvLdhVIb9DgMns
	zlNuRh8M33CZodznTpS8/BQ+GgebOSMPy7M7E374hweGMEUdhliZnAE55YjkPaxzcy1Z1k/WiSz
	9CHNV0FmMZLdv+Qq9QK8veYIVgTE5PEwZVcSdYs86QpZBajfLYkDZnrJ04nZKtky2EK257bDMoz
	kohevluhtk26VMjOfiK10YvmwWSyHUZm3Qkealz9kRX71aiz3TuDef2V8Aq8JeQ2ecGHctMHT6N
	ckIMDAGLp4ohBFZVFsJnQxS7f0wIZQTlRCNT7PlNUSPaiHaQcwEQ+z6LVDEmk7gXXg7hwFF+HUq
	ueaJ4Oo1jbO29mc6RTmgYmKIhlBB5xi51gJ7mV+epXsyNkp13WQRog21GEu/EXKjv5sWxZlIPGo
	CUguPgkiYJztrl19yvlXpwTuLzKyB
X-Received: by 2002:a05:6122:1b0c:b0:5c9:a60b:e5c8 with SMTP id 71dfb90a1353d-5ec6893b14cmr559247e0c.11.1793328009288;
        Thu, 29 Oct 2026 19:40:09 -0700 (PDT)
Received: from macbook-pro-de-joas.local ([2804:7f0:b101:c5e8:ccdf:2b09:f69e:4902])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69c5d183sm963735e0c.13.2026.10.29.19.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 19:40:08 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Fan Wu <fanwu01@zju.edu.cn>,
 oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 [PATCH net] nfc: st21nfca: complete a pending SE APDU request only once
Date: Thu, 29 Oct 2026 23:40:02 -0300
Message-ID: <179332800288.52644.8728400883396719965@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

st21nfca_hci_se_io() stores the netlink callback and its context in
info->se_info and arms the BWI timer.  The request is then completed
either by st21nfca_se_wt_work(), when the timer expires, or by an
EVT_TRANSMIT_DATA event on the APDU reader gate.  Neither checks that a
request is still pending, and the callback, se_io_cb(), frees its
context every time it is called.

So when the secure element answers after the timeout, the response
calls se_io_cb() again on the context the timeout already freed, and
frees it a second time.  The same happens if the controller sends two
EVT_TRANSMIT_DATA events for one request.  An EVT_TRANSMIT_DATA, or a
timer armed by EVT_WTX_REQUEST, with no request pending calls the
callback on the context of an earlier, already completed request, or
calls a NULL callback if there never was one.

With st21nfca on a virtual phy and an emulated controller answering an
NFC_CMD_SE_IO request 4 s after it was sent (the default timeout is
3.2 s):

  BUG: KASAN: slab-use-after-free in se_io_cb+0x2ec/0x334
  Read of size 4 at addr fff00000c5277da0 by task kworker/3:1/59
  Workqueue: events nfc_hci_msg_rx_work
  Call trace:
   se_io_cb+0x2ec/0x334
   st21nfca_apdu_reader_event_received+0x1ec/0x248
   st21nfca_hci_event_received+0xb0/0x300
   nfc_hci_event_received+0xb8/0x30c
   ...
  Freed by task 59:
   kfree+0x214/0x498
   se_io_cb+0x2bc/0x334
   st21nfca_se_wt_work+0x14c/0x1d4

and for an EVT_TRANSMIT_DATA without a request:

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
  pc : 0x0
  lr : st21nfca_apdu_reader_event_received+0x1ec/0x248

Use bwi_active, which st21nfca_hci_se_io() sets, to tell whether a
request is pending, and clear it in whichever of the two paths
completes the request first.  The event handler already stops the timer
and waits for the timeout work before looking at it.  Also complete the
request with the error if sending EVT_SE_END_OF_APDU_TRANSFER fails
rather than never calling the callback, which leaked the context.

Fixes: 2130fb97fecf ("NFC: st21nfca: Adding support for secure element")
Cc: stable@vger.kernel.org
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
Tested on arm64 QEMU with KASAN, with a test-only module that registers
st21nfca through st21nfca_hci_probe() on a virtual phy (LLC nop) and a
userspace controller emulator (DEV_UP, ENABLE_SE, SE_IO over netlink).
Without the patch: slab-use-after-free in se_io_cb() for a late and for
a duplicated EVT_TRANSMIT_DATA, NULL pointer call for an unsolicited one.
With it all three are quiet and a normal SE_IO exchange still works.
Not tested on hardware.

st-nci has the same pattern; Fan Wu's pending "nfc: st-nci: drain SE
timers before NCI teardown" v2 already makes bwi_active an ownership
token there, so this only touches st21nfca.

 drivers/nfc/st21nfca/se.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/st21nfca/se.c b/drivers/nfc/st21nfca/se.c
index 7154bc1d6..4261ed1d9 100644
--- a/drivers/nfc/st21nfca/se.c
+++ b/drivers/nfc/st21nfca/se.c
@@ -264,6 +264,12 @@ static void st21nfca_se_wt_work(struct work_struct *work)
 						struct st21nfca_hci_info,
 						se_info.timeout_work);
 
+	/* The timer can also be armed by EVT_WTX_REQUEST while no
+	 * st21nfca_hci_se_io() is pending.
+	 */
+	if (!info->se_info.bwi_active)
+		return;
+
 	info->se_info.bwi_active = false;
 
 	if (!info->se_info.xch_error) {
@@ -383,11 +389,20 @@ int st21nfca_apdu_reader_event_received(struct nfc_hci_dev *hdev,
 	case ST21NFCA_EVT_TRANSMIT_DATA:
 		timer_delete_sync(&info->se_info.bwi_timer);
 		cancel_work_sync(&info->se_info.timeout_work);
+		/* Only complete a pending st21nfca_hci_se_io(), and only once:
+		 * the timeout work may already have completed it, and the
+		 * callback frees its context.
+		 */
+		if (!info->se_info.bwi_active)
+			break;
+
 		info->se_info.bwi_active = false;
 		r = nfc_hci_send_event(hdev, ST21NFCA_DEVICE_MGNT_GATE,
 				ST21NFCA_EVT_SE_END_OF_APDU_TRANSFER, NULL, 0);
-		if (r < 0)
+		if (r < 0) {
+			info->se_info.cb(info->se_info.cb_context, NULL, 0, r);
 			goto exit;
+		}
 
 		info->se_info.cb(info->se_info.cb_context,
 			skb->data, skb->len, 0);
-- 
2.43.0

