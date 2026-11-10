Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316607;
	b=0lWpDWMsxkggkaSoh/VfcVJCbHuEvFQU4NQfS3Gc6r6hxqHnzuURgwg1OesuQAYmUp8X
	 Ydzxjvishk4B72v687LVSzXST7tJJuuCOKcRO/XlqmER/D11CeStjvlFMtPlLXNTyqymK
	 fy0nMUWPevRy7PiYclqQ2OEWk0mx0UA9RY9k8g+CmaMU+/yo8+gA3TW4L6ei+N73J3Qty
	 x0OUC+Y/aSRP6k2nQNwH4ulcfNYZ2+9xqPAydrLlaQXb+2Y5YaYFpuBqpFb99ZKrxWizG
	 jtjA7gWQKFCizCMEz237X/Qdos2slRfwdWgSpI+cvp3Ay/x2JWBufQ9Dvx71zWFDZcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uFQlGxNintgZ+1lpruDk3ejevpKfhQnwYo9OwNbOBsE=;
	b=C5qY55+dryMIVolyefQ0DddSUw+7cB2wksr4uV/9viM7bFqvMwUzSW+MPqP1ml3ZuNKC
	 CbmyWKv3cTwtue4+Fl+Kayqe9VKMd8HTSWr/O3m20kkpzR7L3i/iXRTlXNntWZR9sRxmv
	 aIh2e62+AbCoHdMmhspnk3CylD/PeLBOxLBhn9igxjqrNc3cUDGg2soe90YhCyEd8dAdJ
	 tSA6MciOl6rtGIxi9oj+k83/RiiJIw8Ezr8WBrh4FbCrmxvi4j9IPOvcZsORVdt7MwVru
	 D7xXMwe6TrHcDgKqbSO2Ziiviw38Q8ke8PoFUnAyke3HxZ3DnMdzgla8YYIpnatGb8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X+XaWfjd;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F7D60A6F59
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0F7D60A6F59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X+XaWfjd
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb45e96d2bso782543a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316606; x=1794921406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uFQlGxNintgZ+1lpruDk3ejevpKfhQnwYo9OwNbOBsE=;
        b=X+XaWfjd33EsWrUJXq5j8nPI9JUhqD3YFRLEZXhTWRykk4MpTbxxzfz6F2PTqB6lwy
         NmLZ5wFjMA3DkxtWpqLq0kxO+CLG8eWdgvPJ32qRa6SN9mJIPlXAQcPkRkeDswNB49Ww
         hu4HGMoz10ZKJAxueoUeaT/SAJsGJO5cnKcnJIrwFu+jD7HGDWzF9sQXFKBai87h+6r6
         BuTX/gR8jlktkyqwFAexJxqn9jvzLec52FNiIHx1ECuFGZmrn4TNeFgL6jiY+mGHq4LD
         DtgYraFRKuNR2wzl6RVXnuU/x3uViNNwWZg2RVLkAfHJbtG8OiimL3SxjHw+p25k78wo
         iEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316606; x=1794921406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uFQlGxNintgZ+1lpruDk3ejevpKfhQnwYo9OwNbOBsE=;
        b=K/9Fg/alx/tcLPdVV2wqPwSznfrI95S+7xqMfDUd5iXhNPTPZ/Wj8hZYFR5N/NXZuq
         yIm1QwKxu+DJYmFEl2YisQg6uvRr6JKz57ucUw/299wdS2FWkq6ZAXiOilhQjjpfRvWm
         ADAfWl1RcTp4ut7Jr8wm+qvh2zXqzArLDUBCf21FrwQYdDzHbQOrzcsW+Kd0lhp3aB54
         h8x5zEDvECG1vklADVeG45QFqlqPB3vXiupKNhP+4csgM/ydUcCPF0+UUqcXEe25FvTG
         bO10C2RN1DNcufSHyjI9TC76ZrSTNqEVFAVzZM8xRA3Gq00G1n3vsTBqezre2QRmVT3l
         CyWA==
X-Forwarded-Encrypted: i=1; AL+hErGj5K/g9nHTUavigEP7e8q9uR/c3J8XKM1yemSsgmOaZ4m7jNLmu9I/VWDNbQeYFiNgQ7cam3DvxBeD9+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hJuk9fEDie2MNw98ErMl8W196a73hMgT32rZA7DOOgo933Zce
	ttt/yfT/zdcui/k2QcKHODI4NGY3yIY5dGe5SUWJTlVDacwpsoVWtC80
X-Gm-Gg: AYBFou1BHVprg2kpAUIQI4Zq3IwrZwN5hvuKCPdxWHzKYAxB9wbdCbfl953AUAABxsu
	8b8oNXTZ/oUzz/fsxRy9RX7ppfOjiHZmGsawXSTmKSIGnD6bK4rdq4W8xm6bRryS7q0JA/4Ks4R
	xfZwwB2CmbyMN4BWu6Lpr+Y0jhsDdWDChioFa80LKZDVVPjTjFJPfLUeHWypkfaKzXtf5U5LujI
	gikGBYWWunrfT3yH/+FyU1B01bKJmGhphNrCYBcCeqzJHNJIIVjQ8LdJ3eHtxeifEbUpxanO5AG
	3Tfl/ISzGW2TN1UhpP2e6bPVnUZlOLXkrT6IFSx9I4PKl3BLFsRqEcbkQZ9/4PEBJRTUnlZjloM
	Oy0S7gZ7D7PXsI08MRjkDBCNirCeVQi5AhJAchIRAEOs5eRSRYLDJbFv0P77DYhL8QCgFulJyWn
	NZ/SF9NaH7Im4Spc23i50nwq04w2uTvBdxTC//fCLWAeI8jhomT7LW/d9VueyTPgJgJx0YQo/St
	NG7pyCFzPzes/hsg7joQffA4qIdEavyxbRrO+YfD1pUmkxVO9qq5EzN7JdGzxev07J8SzKhp0Ye
	yPO3xEpmrmxjtwXw2WED0OxdTPn5I5A=
X-Received: by 2002:a17:90b:3c46:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3b166c93350mr2341880a91.11.1794316606188;
        Tue, 10 Nov 2026 05:16:46 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:45 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 17/33] dmaengine: ste_dma40: convert per-channel tasklet to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:17 -0800
Message-ID: <33ed46c14f6be61dd5c839b3b307512749e0d067.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
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

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/ste_dma40.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 8b89d44f9b0d..a06008d8dd27 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -461,13 +461,11 @@ struct d40_base;
  * @lock: A spinlock to protect this struct.
  * @log_num: The logical number, if any of this channel.
  * @pending_tx: The number of pending transfers. Used between interrupt handler
- * and tasklet.
+ * and bottom half.
  * @busy: Set to true when transfer is ongoing on this channel.
  * @phy_chan: Pointer to physical channel which this instance runs on. If this
  * point is NULL, then the channel is not allocated.
  * @chan: DMA engine handle.
- * @tasklet: Tasklet that gets scheduled from interrupt context to complete a
- * transfer and call client callback.
  * @client: Cliented owned descriptor list.
  * @pending_queue: Submitted jobs, to be issued by issue_pending()
  * @active: Active descriptor.
@@ -494,7 +492,6 @@ struct d40_chan {
 	bool				 busy;
 	struct d40_phy_res		*phy_chan;
 	struct dma_chan			 chan;
-	struct tasklet_struct		 tasklet;
 	struct list_head		 client;
 	struct list_head		 pending_queue;
 	struct list_head		 active;
@@ -1646,7 +1643,7 @@ static struct d40_desc *d40_queue_start(struct d40_chan *d40c)
 					d40c->pending_tx++;
 					d40d = d40_first_queued(d40c);
 				} while (d40d);
-				tasklet_schedule(&d40c->tasklet);
+				dmaengine_schedule_bh(&d40c->chan);
 				return ERR_PTR(err);
 			}
 			d40c->busy = true;
@@ -1670,7 +1667,7 @@ static struct d40_desc *d40_queue_start(struct d40_chan *d40c)
 			d40c->pending_tx++;
 			d40c->busy = false;
 			pm_runtime_put_autosuspend(d40c->base->dev);
-			tasklet_schedule(&d40c->tasklet);
+			dmaengine_schedule_bh(&d40c->chan);
 			return ERR_PTR(err);
 		}
 	}
@@ -1730,13 +1727,13 @@ static void dma_tc_handle(struct d40_chan *d40c)
 	}
 
 	d40c->pending_tx += callbacks;
-	tasklet_schedule(&d40c->tasklet);
+	dmaengine_schedule_bh(&d40c->chan);
 
 }
 
-static void dma_tasklet(struct tasklet_struct *t)
+static void dma_tasklet(struct dma_chan *chan)
 {
-	struct d40_chan *d40c = from_tasklet(d40c, t, tasklet);
+	struct d40_chan *d40c = container_of(chan, struct d40_chan, chan);
 	struct d40_desc *d40d;
 	unsigned long flags;
 	bool callback_active;
@@ -1786,7 +1783,7 @@ static void dma_tasklet(struct tasklet_struct *t)
 	d40c->pending_tx--;
 
 	if (d40c->pending_tx)
-		tasklet_schedule(&d40c->tasklet);
+		dmaengine_schedule_bh(&d40c->chan);
 
 	spin_unlock_irqrestore(&d40c->lock, flags);
 
@@ -3076,14 +3073,14 @@ static void __init d40_chan_init(struct d40_base *base, struct dma_device *dma,
 		INIT_LIST_HEAD(&d40c->client);
 		INIT_LIST_HEAD(&d40c->prepare_queue);
 
-		tasklet_setup(&d40c->tasklet, dma_tasklet);
+		dmaengine_init_bh(&d40c->chan, dma_tasklet);
 
 		list_add_tail(&d40c->chan.device_node,
 			      &dma->channels);
 	}
 }
 
-static void d40_kill_tasklets(void *data)
+static void d40_kill_bh(void *data)
 {
 	struct dma_device *dma = data;
 	struct d40_chan *d40c;
@@ -3091,7 +3088,7 @@ static void d40_kill_tasklets(void *data)
 
 	list_for_each_entry(chan, &dma->channels, device_node) {
 		d40c = container_of(chan, struct d40_chan, chan);
-		tasklet_kill(&d40c->tasklet);
+		dmaengine_kill_bh(&d40c->chan);
 	}
 }
 
@@ -3141,7 +3138,7 @@ static int __init d40_dmaengine_init(struct d40_base *base,
 
 	d40_ops_init(base, &base->dma_slave);
 
-	err = devm_add_action(base->dev, d40_kill_tasklets,
+	err = devm_add_action(base->dev, d40_kill_bh,
 			      &base->dma_slave);
 	if (err)
 		goto exit;
@@ -3161,7 +3158,7 @@ static int __init d40_dmaengine_init(struct d40_base *base,
 
 	d40_ops_init(base, &base->dma_memcpy);
 
-	err = devm_add_action(base->dev, d40_kill_tasklets,
+	err = devm_add_action(base->dev, d40_kill_bh,
 			      &base->dma_memcpy);
 	if (err)
 		goto exit;
@@ -3184,7 +3181,7 @@ static int __init d40_dmaengine_init(struct d40_base *base,
 
 	d40_ops_init(base, &base->dma_both);
 
-	err = devm_add_action(base->dev, d40_kill_tasklets,
+	err = devm_add_action(base->dev, d40_kill_bh,
 			      &base->dma_both);
 	if (err)
 		goto exit;
-- 
2.43.0

