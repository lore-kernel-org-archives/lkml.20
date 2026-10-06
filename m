Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B7123E342
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287750; cv=none; b=bTk/Ku2NcfV3YbnaZ/ywQ28TV/ZQD5IiRae+HZlQhu/LfUxiLOUmN8ISnTwfOEdC7dCDWhRpfDEX182mNnV2yUCjbxHO5aB67p8iIQXbwt/JdDVzYYjcMaRoHMxgBGAR8idcEeOVSugmKpJglPfcJi4dWbNjZfGn3RWD6u6vxhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287750; c=relaxed/simple;
	bh=esBU1+hjpFXEROwNxA4JmBuC5GYIDSizXcT6XgYdscY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eMLL84A1T7TmMDy9odjQ8bUX0gzB9dIM3BaJeN6BZdSoFpMj3sGPdPi4CnLmX7VCJPPG+/3kYNOtTtExUGApn6SCj9tcA3eJvaOXXvk04GGc9feRDvg5JPoLJRRD7V0aLwKuEzwpqHL9e+l7hfLUKDSiDcsFq9tSVD3IcUIp7fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security; spf=pass smtp.mailfrom=octane.security; dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b=oX/mmWVU; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b="oX/mmWVU"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-31490970b97so766405eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1791287749; x=1791892549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=090CEinLWtA8ss+plFjMgdVk0E87uATP7NkIB4N/6gM=;
        b=oX/mmWVUZEOpfc1Ehtp5QYBs/Jb7QuqcjthY/U/T080thoj/HwTWprAW9Z0EKFWNEK
         0eycMY29zynJBqhGfemzWl5OcTdH6QPU634OGWFZC15lixaQxv1+meV6qE1VPHYMj4HC
         3QjZfMsAr2iDAbUs1fmFVyUkn23Dr/am7F5Om+W1qyK4yd+XhZxQ/UtPRm/qgK6KJj0K
         VpgOIQFJtzfg/C8jnX+J0YWKX2bYTkq3tq+0/ants13Qnxa2dxeQVOJihPPTcvz1Hkjy
         c9Wo8CarzMUb54wLCim+0qY5USxErAsPy7yK2CqlJl3hlsVEeTlHnRIGn1Y3DjphEzsh
         ohbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791287749; x=1791892549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=090CEinLWtA8ss+plFjMgdVk0E87uATP7NkIB4N/6gM=;
        b=1/xm1LDl/XjpXBAA9Ag0SyLo+gN55/PKiEdIeYBmQWTOUfBapd65us/ijQ+/3OTmOa
         suPg6mnTrPgXjZvS6WFrOdAY/D816MFfsXtJOY53bLuP2ziOka+JW01YmguDaHfJqCXR
         0ri9L9z7ShwZbtLqh0T/1kiQn+1DuHmb14U5K2u43GgsULk89sGVhRq0RUY6VsNUsz8S
         mEQKSOhY7lNpvthjGf4S12hpWUpV+MdSZl6uI4x3SwQ48J4sjugDr/GBIUCVtZ7109hU
         hTlS03NB6ZmChAFoFUKeLaSSqU8gkWs5Kprtve6P1lxZeUnROFPxy/NyM46AmeZa7Sis
         VYZg==
X-Forwarded-Encrypted: i=1; AKwUvBzZ4yAyTK0eZKJHhNurDXOZvscUXQXydFaiEmkfU9wlo1gTqmGdVXBAVm5pKNlh/7pGU8YOBHISTjRbnjQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m4Nb69kaPMPg7hKV++F7bHi1WbanCnU8aq6qCadw/dhCzbpTE0
	ZnUxewIydk3D2mBeS9/b3o3tYSerKRoQHPONIIoCrY7EKgwqpJPISNvYFaEjD1hPTNo=
X-Gm-Gg: AYBFou0Ox8JQkRHMJRuHptggA9LlHoU0VcCED12nznxvGwKAoNdoSlWHVlsWQebPSXE
	83nMkdSgILQ1kT+7lDXVw673RJfR01EvZwXFhFk0HU0AFBXbk+NsIWfFmMdvnosDJWf+AX3VYtd
	BobKkQCu2Geoa+B32rpWKv9uPP4SK6qmBpbDzqYlvT5E0+0/OHBc/EShcog7rOCdVHbjNybUhq+
	/xBiD3FtOHrv1f7JK9ScWPZD53Unb3BXHeyUnoCsaOGhFqeww9JlWBrh3IRUPrBVhcRv3+fFBw3
	85C56w/vKry+qohVLcx1niRfzbgzj0jkYk5hueWQIM4BYlz9juvf7kDQy7ZF6LG+7sFsuS9Za2l
	R89SEU447fdhFuvlQrUp/ZccrDZjrz4pHXByHw0xwJmWfl9B3dMupx2YMEsA9Rq7hQmFrMCstMd
	oXVGr0M+E3ifH012qfwamovbTcvXsowPhV6Dj8ZSTpkg3bh9IGYB1/UFaogPkAk7d8IPZn18vwn
	+ChGlB4/EVFwnmyUKcEjNYiykPyfGzjm6Wn4ztzowVT7guNw7GCXVVNVGuKj9lPe3a3i8GCtTJ+
	GBjCWE+3TWRFgho1dYs=
X-Received: by 2002:a05:693c:2410:b0:33b:fc17:e786 with SMTP id 5a478bee46e88-3514e2e62a0mr1112407eec.16.1791287748244;
        Tue, 06 Oct 2026 04:55:48 -0700 (PDT)
Received: from localhost.localdomain ([103.207.175.177])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351469f75fesm8638511eec.5.2026.10.06.04.55.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 04:55:47 -0700 (PDT)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	David Heidelberg <david@ixit.cz>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org,
	Giovanni Vignone <gio@octane.security>
Subject: [PATCH v4 2/2] nfc: nci: uart: fix use-after-free of write_work on ldisc teardown
Date: Tue,  6 Oct 2026 17:25:31 +0530
Message-ID: <20261006115532.72100-3-shubham@octane.security>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261006115532.72100-1-shubham@octane.security>
References: <20261006115532.72100-1-shubham@octane.security>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nci_uart_tty_close() frees nu->tx_skb and purges nu->tx_q before it
cancels nu->write_work, and the NCI device is still registered at that
point.  Two paths can therefore (re)queue the write worker after the
skbs are freed and run it against freed memory:

 - a tty hangup invokes the ldisc ->write_wakeup() (nci_uart_tty_wakeup
   -> nci_uart_tx_wakeup -> schedule_work), and
 - the NCI core keeps sending via the driver (nci_uart_send() ->
   nci_uart_tx_wakeup -> schedule_work) until the device is unregistered
   by nu->ops.close().

nci_uart_write_work() then dereferences the freed nu->tx_skb -- a
use-after-free.  nu->ops.close() also frees driver state that the worker
dereferences via nu->ops.tx_start()/tx_done(), so the worker has to be
stopped before ops.close() runs.

Fix this the way the Bluetooth hci_uart ldisc does: gate
nci_uart_tx_wakeup() on a new NCI_UART_READY bit taken under a
per-connection rwsem.  nci_uart_tty_close() clears NCI_UART_READY under
the write lock -- draining any in-flight nci_uart_tx_wakeup() -- so that
neither the tty nor the internal send path can requeue write_work once it
is cancelled; only then is the device closed and the skbs freed.

NCI_UART_READY is set, and the module reference taken, before
nu->ops.open() registers the device: the driver may transmit (e.g.
download firmware) from within registration and user space can use the
interface as soon as it is registered, so gating those transmits off
would drop or leak them.  The open path uses shared error labels and, on
a failed open, drains the worker the same way the close path does.

Runtime-tested under KASAN with a line-discipline hangup reproducer: the
unfixed ldisc reports

  BUG: KASAN: slab-use-after-free in nci_uart_write_work

within the first iterations, while the fixed ldisc runs the same race for
56000+ register/hangup cycles without any KASAN report.

Fixes: 9961127d4bce ("NFC: nci: add generic uart support")
Assisted-by: LLM Claude
Signed-off-by: Shubham Antil <shubham@octane.security>
---
 include/net/nfc/nci_core.h |  2 +
 net/nfc/nci/uart.c         | 80 +++++++++++++++++++++++++++++++-------
 2 files changed, 68 insertions(+), 14 deletions(-)

diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 664d5058e..c71648ab5 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -18,6 +18,7 @@
 #define __NCI_CORE_H
 
 #include <linux/interrupt.h>
+#include <linux/percpu-rwsem.h>
 #include <linux/skbuff.h>
 #include <linux/tty.h>
 
@@ -455,6 +456,7 @@ struct nci_uart {
 	struct work_struct	write_work;
 	struct tty_struct	*tty;
 	unsigned long		tx_state;
+	struct percpu_rw_semaphore tx_lock;
 	struct sk_buff_head	tx_q;
 	struct sk_buff		*tx_skb;
 	struct sk_buff		*rx_skb;
diff --git a/net/nfc/nci/uart.c b/net/nfc/nci/uart.c
index aa20e8603..a971fb3b1 100644
--- a/net/nfc/nci/uart.c
+++ b/net/nfc/nci/uart.c
@@ -33,6 +33,7 @@
 /* TX states  */
 #define NCI_UART_SENDING	1
 #define NCI_UART_TX_WAKEUP	2
+#define NCI_UART_READY		3
 
 static struct nci_uart *nci_uart_drivers[NCI_UART_DRIVER_MAX];
 
@@ -58,13 +59,28 @@ static inline int nci_uart_queue_empty(struct nci_uart *nu)
 
 static int nci_uart_tx_wakeup(struct nci_uart *nu)
 {
+	/* This may be called in an IRQ context, so we can't sleep.  Therefore
+	 * we try to acquire the read lock only, and if that fails we assume
+	 * the tty is being closed, because that is the only time the write
+	 * lock is taken (nci_uart_tty_close()).  If the write lock is ever
+	 * taken elsewhere, this must be revisited.
+	 */
+	if (!percpu_down_read_trylock(&nu->tx_lock))
+		return 0;
+
+	if (!test_bit(NCI_UART_READY, &nu->tx_state))
+		goto out;
+
 	if (test_and_set_bit(NCI_UART_SENDING, &nu->tx_state)) {
 		set_bit(NCI_UART_TX_WAKEUP, &nu->tx_state);
-		return 0;
+		goto out;
 	}
 
 	schedule_work(&nu->write_work);
 
+out:
+	percpu_up_read(&nu->tx_lock);
+
 	return 0;
 }
 
@@ -123,18 +139,46 @@ static int nci_uart_set_driver(struct tty_struct *tty, unsigned int driver)
 	INIT_WORK(&nu->write_work, nci_uart_write_work);
 	spin_lock_init(&nu->rx_lock);
 
-	ret = nu->ops.open(nu);
-	if (ret) {
-		kfree(nu);
-		return ret;
-	} else if (!try_module_get(nu->owner)) {
-		nu->ops.close(nu);
-		kfree(nu);
-		return -ENOENT;
+	ret = percpu_init_rwsem(&nu->tx_lock);
+	if (ret)
+		goto err_free;
+
+	/* Take the module reference and enable the write worker before the
+	 * device is registered: ops.open() may already transmit (e.g. download
+	 * firmware), and user space can use the interface as soon as it is
+	 * registered.
+	 */
+	if (!try_module_get(nu->owner)) {
+		ret = -ENOENT;
+		goto err_rwsem;
 	}
+
+	set_bit(NCI_UART_READY, &nu->tx_state);
+
+	ret = nu->ops.open(nu);
+	if (ret)
+		goto err_ready;
+
 	tty->disc_data = nu;
 
 	return 0;
+
+err_ready:
+	/* ops.open() may already have scheduled write_work; stop it before
+	 * freeing, the same way nci_uart_tty_close() does.
+	 */
+	percpu_down_write(&nu->tx_lock);
+	clear_bit(NCI_UART_READY, &nu->tx_state);
+	percpu_up_write(&nu->tx_lock);
+	cancel_work_sync(&nu->write_work);
+	kfree_skb(nu->tx_skb);
+	skb_queue_purge(&nu->tx_q);
+	module_put(nu->owner);
+err_rwsem:
+	percpu_free_rwsem(&nu->tx_lock);
+err_free:
+	kfree(nu);
+	return ret;
 }
 
 /* ------ LDISC part ------ */
@@ -180,16 +224,24 @@ static void nci_uart_tty_close(struct tty_struct *tty)
 	if (!nu)
 		return;
 
-	kfree_skb(nu->tx_skb);
-	kfree_skb(nu->rx_skb);
+	/* Drain in-flight tx_wakeups and block new ones, so write_work cannot
+	 * be requeued once it is cancelled below.
+	 */
+	percpu_down_write(&nu->tx_lock);
+	clear_bit(NCI_UART_READY, &nu->tx_state);
+	percpu_up_write(&nu->tx_lock);
 
-	skb_queue_purge(&nu->tx_q);
+	cancel_work_sync(&nu->write_work);
 
 	nu->ops.close(nu);
 	nu->tty = NULL;
-	module_put(nu->owner);
 
-	cancel_work_sync(&nu->write_work);
+	kfree_skb(nu->tx_skb);
+	kfree_skb(nu->rx_skb);
+	skb_queue_purge(&nu->tx_q);
+
+	module_put(nu->owner);
+	percpu_free_rwsem(&nu->tx_lock);
 
 	kfree(nu);
 }
-- 
2.43.0

