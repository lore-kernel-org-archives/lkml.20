Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A45048F000
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101466; cv=none; b=SwPbLytrGGlKX69gmuMzbQ8mvEaS8b6vw2qjevrj0pjwOy6kt2mQBhb4Eafc+lnHnjrp1d5cAQf+EMUM+32zi0fLg9VXChRl70U6DZwXly5bXqKE0QuSgHBAKKS+9GSxQaGffzPkdWD6jpQyUbPR4nEYmjmJ50psyplzZw20b60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101466; c=relaxed/simple;
	bh=0U/i3+N7RWpmWdB2K1SYwzNCBGMxTC5Yl1aUMawg65s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=giZvNIJQ5IWpHd5CaJ53uD7cl6n3ILztl+VlTBT3Gh+VoSTZle8b7Z2Zb4puM2xk2EVUMcP2lOBihZhsqbrCC4vmBCyJj37QP8CmGzFE9DCc24mxNQ8ku7qYqe8We0/ZYTtBK2WlkgGyq73DIHfTFwrrGgah9vsfGRxt4TsQSn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=UlrURzwG; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="UlrURzwG"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea50dc3so200561a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790101464; x=1790706264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ak//GM/1EUqa8AvscB+gM/3Fh5QvD3sB1gF17iE3yxo=;
        b=UlrURzwG8R4Ue7r+jYLcgun72YCjcev4xA+SVqqb6s6GcCTbFpB/BEhl2bngcNQQL+
         yvzfaRqNHQ5HSO3dlRwo3K/1G6pA53QY7gn5+iavm3c4m0FUdeShVVl0PJ8JwrUDxTBI
         l6J6fadvm6eR4EjzVR+PUHZ3H4CCKDdtTlVWxvmn4rkwemO6oI8Zylh5mCd3yWDIMHVt
         24u+WdSD+5PhlzlFpZtK0sit6ETjy2zZGUuGnmUwR2jNUtQX5Zt7ukYClANQz/5OQufb
         PGFRKPnsCxHsYU3K1dQiUOTkCl8+11js7TBnUqDMqS1wLmhc43zUL3tkuDyKHlqMQo8i
         7L/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101464; x=1790706264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ak//GM/1EUqa8AvscB+gM/3Fh5QvD3sB1gF17iE3yxo=;
        b=B99GGbzVNGbjEprkMJt5ShTsRQC6te4LJk8Y/y3H1uuV7G3UhLw0r+Mvjxp9g0Lc2l
         +UT+B4XD3p8nsFHa1z5zgkf53ROnVJfm8ELxga8b7imOelH5NMZd3QWFPD+NJ6fz/Sy7
         erUYg3i3YwBZKGdPZ/s1BbLc0q+ZKjGtizSG1s1Cfn7/Dghr7Du8zgi2xJFSXxAz2h4l
         3lFtMmYGZQ+M6ycHWDQFJfZo8ePgKSaaoXUR2docPKOV+BVWYULAdRT1TJY+sGiqB8li
         hrJLEKvvuOYqLtwtD4mkMWFl5FxMNzniXqty6PJOhuHEZiwbhStCPkOXT9iRo8ddIR3X
         Totw==
X-Forwarded-Encrypted: i=1; AKwUvBzFvH1ymqI+B0xGCMcJGTr7++Qjm0liw7CePuOBDwqku28h+fz6DEASK7pB5eu8pP5sZW3xdOevITV94iA=@vger.kernel.org
X-Gm-Message-State: AFuF++myX8aTEk77fsTYLQf4IjGD5dKjJp7BFfxoE7icudmmODxij5XC
	aYBVKcIe1ggI/mbPCnJw8dVmm3+GQpLAHayW8ByEE5oHM+OmQXKyVbdLb58VYia6IVA=
X-Gm-Gg: AYBFou1mxM734aAGD33iboIP2Jznl8YOn/GBrOYjlhp5p1NPpwv5RVmt7IDfGFdlNM1
	+NbufcbCSvoU3GZTnDhCY1jYXnYpZ1g6fmBrvWQN6QV9IyGz64Lk0gFm7YXyF4MS2ONOaEm7Iad
	R1F0WHJOdB6nwRBsG1TsRl9kma8+Tusht9UGAwr2xtrwj4WSigg+PfMsfq0EvtmMXwK3y//Dh4E
	3Kns5d0V6JYVs1QEId0KED4TZnjJ93wWN32g3icD0cnc3obcGyNAS8MV4fQXNA1zUpqe4LQkD55
	tOiOXQJk3VBWsRLVT9Rav9odSfBWuezzXRyMh0PEg7kDg8d397kivfrddd5HYSefafj2PjgdO5f
	eXWUmCMmefXk9xZYL6m38LSm49SQg8SDhQMZMxo5YYb3b9dv9scbtVF59zcoqKqihF87xAsgnqK
	txiqNWAv8XjrJCXcjdsBRdJgyxcB86xcJKuivfkHFByACbqsAjzqHd
X-Received: by 2002:a05:6a21:9082:b0:3dd:a195:dd60 with SMTP id adf61e73a8af0-3ddf82e5f1fmr256497637.66.1790101463748;
        Tue, 22 Sep 2026 11:24:23 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:55::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3ba8b6sm12098a12.5.2026.09.22.11.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:24:23 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Prashant Sreedharan <prashant@broadcom.com>
Cc: horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>
Subject: [RFC net v2 3/3] bnxt_en: stop DMA before releasing rings the firmware did not free
Date: Tue, 22 Sep 2026 11:24:03 -0700
Message-ID: <20260922182405.1290749-4-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922182405.1290749-1-joe@dama.to>
References: <20260922182405.1290749-1-joe@dama.to>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When HWRM_RING_FREE is not answered, bnxt_hwrm_ring_free() clears
fw_ring_id and __bnxt_close_nic() goes on to call bnxt_free_mem(), which
unmaps the ring memory and the RX buffers that the FW may still be
using.

This is reachable in production. On a BCM57504 the first sign is the TX
watchdog; the close that follows times out a subset of its RING_FREEs and
the driver releases those rings anyway:

  05:30:12  NETDEV WATCHDOG: transmit queue 0 timed out 6073 ms
  05:30:12  Resp cmpl intr err msg: 0x51                  x20
  05:30:12  hwrm_ring_free type 1 failed                  x12
  05:30:12  hwrm_ring_free type 2 failed                  x8
  05:30:12  AMD-Vi: IO_PAGE_FAULT  x3

Count the rings the firmware did not free and, if there are any, disable
the device before the close path releases memory.

The device stays unusable until a firmware reset.

Fixes: 74608fc98d28 ("bnxt_en: Ring free response from close path should use completion ring")
Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index a7f6facca7b4..574532d7047b 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -7756,6 +7756,7 @@ static void bnxt_clear_one_cp_ring(struct bnxt *bp, struct bnxt_cp_ring_info *cp
 
 static void bnxt_hwrm_ring_free(struct bnxt *bp, bool close_path)
 {
+	int stuck = 0;
 	u32 type;
 	int i;
 
@@ -7763,12 +7764,15 @@ static void bnxt_hwrm_ring_free(struct bnxt *bp, bool close_path)
 		return;
 
 	for (i = 0; i < bp->tx_nr_rings; i++)
-		bnxt_hwrm_tx_ring_free(bp, &bp->tx_ring[i], close_path);
+		if (bnxt_hwrm_tx_ring_free(bp, &bp->tx_ring[i], close_path))
+			stuck++;
 
 	bnxt_cancel_dim(bp);
 	for (i = 0; i < bp->rx_nr_rings; i++) {
-		bnxt_hwrm_rx_ring_free(bp, &bp->rx_ring[i], close_path);
-		bnxt_hwrm_rx_agg_ring_free(bp, &bp->rx_ring[i], close_path);
+		if (bnxt_hwrm_rx_ring_free(bp, &bp->rx_ring[i], close_path))
+			stuck++;
+		if (bnxt_hwrm_rx_agg_ring_free(bp, &bp->rx_ring[i], close_path))
+			stuck++;
 	}
 
 	/* The completion rings are about to be freed.  After that the
@@ -7798,6 +7802,17 @@ static void bnxt_hwrm_ring_free(struct bnxt *bp, bool close_path)
 			bp->grp_info[i].cp_fw_ring_id = INVALID_HW_RING_ID;
 		}
 	}
+
+	if (!stuck)
+		return;
+
+	/* FW never acknowledged freeing these rings, so it may still be
+	 * DMAing to them. Stop the device before handing memory back.
+	 */
+	netdev_err(bp->dev,
+		   "Firmware did not free %d ring(s); disabling DMA before releasing ring memory. A firmware reset is required.\n",
+		   stuck);
+	pci_disable_device(bp->pdev);
 }
 
 static int __bnxt_trim_rings(struct bnxt *bp, int *rx, int *tx, int max,
-- 
2.53.0-Meta

