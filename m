Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE4848BD57
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537198; cv=none; b=V2BsNXKlRX2WrD3m34NRGamXmrlDErzcUqFGnoqM/o766O9ZGySuKX0zYO7qdxtq6EXGzigAGX561i801rXIqHgsXOoy6kGcfLT7W7MSKxarIgpUfEWJUrzCn7ItMJy0P+k47Ew6bRfLgFVyRFjiRBplK7CmePN7l6h9xwI9WDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537198; c=relaxed/simple;
	bh=s4vt5UQI92yBZEhWRd1KakBiy4b51SnXf54Q6GDpQUc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FWLUmPao0MdZXJMROnXFAwLMrKYZDXFocT6MRH9ePjxWa8c4Ag6TkoPYlytDBtdIFw4bZsH5ji1mH9rnpeZE4i9KnxTb3c64JaHWZBrqad+0DKg1k1iG76+YDmHHn1poiWnitZhkA1Ikg3tsOMS1DiEMNJA6DTNBBp2sVf8cexA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TTHUkr5p; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TTHUkr5p"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39906175917so1332143a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788537195; x=1789141995; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CAwO2E8HU/J4mifuSn0aiL69IdIeEkkIoQgO6TpMlRc=;
        b=TTHUkr5pGZBsqzukf5MMpb2iW9SSu5Rl4PV07QXj+GEk5u5ZHtbMHENEZJrBi4gFqb
         p08jh7tLViP6WobhvOYTcJHjJ0gEJclfOidaxahZ+8o0Np0eju/LfDIbuKiMV6wOejqG
         wsZ7Fn5StIopFhvVJEsS7g3J9T2gllRyXClGtOdAFIInKWiZUsQU8jIejh5WUvkNg3WZ
         UL53RNxmo+E51J6+I6Nhe5sq1mIUxSsedTYBkhCsao3QXgWpnH1XrODeTQMKZ+IUv+sA
         P7tTEXVpMIT/hwVI+wTdYjBhd8JzyWc1uIk9K3Wi+EBcXF3b/qNr69LcoT5t+2Rj+qpq
         HEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788537195; x=1789141995;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CAwO2E8HU/J4mifuSn0aiL69IdIeEkkIoQgO6TpMlRc=;
        b=DKl5Nec9Rm44ZBxm2K+7Xo8mpcxYigDmWvu+qvsNbLw+TmiDwLz4xtxc6kv9lUJE6w
         EBhmCJo0Vqa2BYUF0tCGp3cVz6/7/ISmUqvPMAxr7NKqBr9BzeAWhZUTRg4Te+SNcj31
         W/GiUGjILpHqw1L6lkapBGIiLY0gVEeN0nWe9W/bh6uDh5iFOL8QGl5YYUml6CPSCUw0
         2BMlyHCS6F//euwYo0wvURLK6tAqmaZXz6IMuSiZyDdNp+yv8U8QVy5dPaGz6gGmqJYX
         YtMomixEwRUZnj+lIibVvbhrgthIE+Q7/RvrQbhbj3GHhbPH3taHqSLCXb4xQ6Nt8QZO
         jnQg==
X-Forwarded-Encrypted: i=1; AKwUvBy27em3Boa3jUJIG0p2VWl+j4pvFlDaZVPXQuLxp6/HgJF5SWVQoPPv1BAt08AXiKl6pxTTxn9DhCgDunQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l+r5VpoMUG8x4DJ8Wyp+TzczRdZOv6LYeNaQFsWhS2qeP2Mxr5
	0N8S8IrWkldHZCeKDTt046rdye3PHTunm+T2Yr18/T8VdRHec2Yf74bRJDUZQpWirFBoUhIEgxn
	dDpisRII7JM0zr0cb0dZImg==
X-Received: from pjbmy11.prod.google.com ([2002:a17:90b:4c8b:b0:396:5b40:4ebb])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4cce:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-39b260dd4e9mr11206681a91.2.1788537195308;
 Fri, 04 Sep 2026 08:53:15 -0700 (PDT)
Date: Fri,  4 Sep 2026 23:53:07 +0800
In-Reply-To: <20260904155307.150443-1-stanleyjhu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260904155307.150443-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904155307.150443-4-stanleyjhu@google.com>
Subject: [PATCH v2 3/3] scsi: ufs: rpmb: Register and unregister ufs_rpmb_bus_type
From: Stanley Jhu <stanleyjhu@google.com>
To: Jens Wiklander <jens.wiklander@linaro.org>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Bart Van Assche <bvanassche@acm.org>, Brian Kao <brian.kao@mediatek.com>, 
	Brian Kao <powenkao@google.com>, Avri Altman <avri.altman@wdc.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Stanley Jhu <stanleyjhu@google.com>
Content-Type: text/plain; charset="UTF-8"

The UFS RPMB driver defines ufs_rpmb_bus_type and assigns it to the bus
member of struct device for each RPMB device. However, ufs_rpmb_bus_type
is never registered with the driver core via bus_register().

When driver core rejects devices assigned to unregistered buses with
-EINVAL in bus_add_device(), device_register(&ufs_rpmb->dev) in
ufs_rpmb_probe() fails with:
  "bus_add_device: cannot add device 'ufs_rpmb0' to unregistered bus
   'ufs_rpmb'"
  "ufshcd: Failed to register UFS RPMB device 0"

Fix this by registering ufs_rpmb_bus_type in ufshcd_core_init() and
unregistering it in ufshcd_core_exit().

Fixes: b06b8c421485 ("scsi: ufs: core: Add OP-TEE based RPMB driver for UFS devices")
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufs-rpmb.c    | 10 ++++++++++
 drivers/ufs/core/ufshcd-priv.h | 13 ++++++++++++-
 drivers/ufs/core/ufshcd.c      | 16 ++++++++++++++--
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/core/ufs-rpmb.c b/drivers/ufs/core/ufs-rpmb.c
index fe96acdde278..1889ea10d5df 100644
--- a/drivers/ufs/core/ufs-rpmb.c
+++ b/drivers/ufs/core/ufs-rpmb.c
@@ -29,6 +29,16 @@ static const struct bus_type ufs_rpmb_bus_type = {
 	.name = "ufs_rpmb",
 };
 
+int __init ufs_rpmb_bus_register(void)
+{
+	return bus_register(&ufs_rpmb_bus_type);
+}
+
+void ufs_rpmb_bus_unregister(void)
+{
+	bus_unregister(&ufs_rpmb_bus_type);
+}
+
 /* UFS RPMB device structure */
 struct ufs_rpmb_dev {
 	u8 region_id;
diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index e55c2a02c1f5..d5e0cc3edb5b 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -493,10 +493,21 @@ static inline u32 ufshcd_mcq_get_sq_head_slot(struct ufs_hw_queue *q)
 	return val / sizeof(struct utp_transfer_req_desc);
 }
 
-#if IS_ENABLED(CONFIG_RPMB)
+#if IS_REACHABLE(CONFIG_RPMB)
+int __init ufs_rpmb_bus_register(void);
+void ufs_rpmb_bus_unregister(void);
 int ufs_rpmb_probe(struct ufs_hba *hba);
 void ufs_rpmb_remove(struct ufs_hba *hba);
 #else
+static inline int ufs_rpmb_bus_register(void)
+{
+	return 0;
+}
+
+static inline void ufs_rpmb_bus_unregister(void)
+{
+}
+
 static inline int ufs_rpmb_probe(struct ufs_hba *hba)
 {
 	return 0;
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index a25b6a0cb5c6..4470e3d65c5c 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -11584,16 +11584,28 @@ static int __init ufshcd_core_init(void)
 
 	ufs_debugfs_init();
 
+	ret = ufs_rpmb_bus_register();
+	if (ret)
+		goto err_debugfs;
+
 	ret = scsi_register_driver(&ufs_dev_wlun_template);
 	if (ret)
-		ufs_debugfs_exit();
+		goto err_rpmb_bus;
+
+	return 0;
+
+err_rpmb_bus:
+	ufs_rpmb_bus_unregister();
+err_debugfs:
+	ufs_debugfs_exit();
 	return ret;
 }
 
 static void __exit ufshcd_core_exit(void)
 {
-	ufs_debugfs_exit();
 	scsi_unregister_driver(&ufs_dev_wlun_template);
+	ufs_rpmb_bus_unregister();
+	ufs_debugfs_exit();
 }
 
 module_init(ufshcd_core_init);
-- 
2.55.0.979.g7e5102b832-goog

