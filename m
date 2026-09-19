Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9392F3CC315
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789812268; cv=none; b=ZtUUhmZMqILPa+zkGurckTqs+dSo2iD4g0MhGR2B/U56Jr19Gs0yIyWsJbIygRlvfqsFAt0R3QTGCVK76BjTTZ1iDXY5PDqfkeE/Iz1uPTwT4ObEDZYe6ohCV4eB4vVHjp59RKbEkmB/YOOMYE/IeveC5BYFgwPFSyuqMbV5GWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789812268; c=relaxed/simple;
	bh=0EHaYA31AKMkwGKZxxnGPfk5inRyKwHFRdZ52h6KFJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n1Slg2XKj49f1ntskecAVJHRO+n48za9hxiwwNN308NDIs6gddtoe2Z3ramwUMDkuzXwxm1sN3NbObWLMVLZg/SJxh2C8OBHe1z8w35eQPiy+kUvGJWdtGxIEKVRC1n6A23M1wcYJBhj2t6jHnys0kLsNOk/5drd6sv4KUEQI20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ht7+6nHx; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ht7+6nHx"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so1602879a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 03:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789812256; x=1790417056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oQH2rf6Bzcf6E6BADc6NPp0Qmbe39wDm40LygUzO/Os=;
        b=ht7+6nHxEVp78xrB0wgCKi3OhuSe+YeGfdWr6KpaGg9J9n7ZdXQGT7kW1JtAeu4UqH
         0Tuei5JETBDdlMaBF/rEwA0k3mpMSgtkoQKZJC7yCyrDqRDSiJnY5lszQvNiwq0uLIIy
         YWXcCSUMecRVs2tgf1bOS40bjm0yV7fB8bRz9oJgiTzOJKUnnPnaP7Apcn7d7CRWri0X
         ZWNg4Od3AQpx5USfwWK4p3CEf/RZEmHQtVD+S3UwVFTRD/XB6L3bkYBpKKdwCLZoe6JG
         inWFAYwUB1tzmYkbS0EeVu9IkPqI1PZJn8NqsMTU29rD5HJOJ65ZoP8UiKtGIev4TYLp
         Cs0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789812256; x=1790417056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oQH2rf6Bzcf6E6BADc6NPp0Qmbe39wDm40LygUzO/Os=;
        b=Mpgx0uD3CdOENXGJcUVMeO68T4reUuaYVLL+AadA8Ihn37GeOBHqmJhHhW3HCvpnD0
         Kdcpia9kKpvlCfrugE29DH5dZJeIkTAA5AnN+S8a1m1RFjkJPR5zbUevf5T674cf3loW
         N84i0JdbJgnPp2nwpunVaiy/z/e+qbOVryeEnc35Ur7gStE6OrHs8L8nq8Ay9UfJFS7L
         NZSanigFuTL9LmEIK2HbVZcYaKNy8RZspygDDtJqXGyHZHMBrMaPyQBxQ6d1Cw5HU7b+
         tyvzmpl3uCwLBkY/S1JW8MxUUszT2u0kRDvh0DaclwRRYeyVyP73d0rFpaCq97fvTLAJ
         8LpA==
X-Forwarded-Encrypted: i=1; AKwUvBwbIvW7NMHQ2Y77HDXq6eeK8G2qK2gzel29SRqS81bv4CanFoZTlfsMLFZXaas3XbC0/UfMyCJRMJZHO1I=@vger.kernel.org
X-Gm-Message-State: AFuF++nFzjKWp/dRMPFswp7RRKPjeAsml1/2Y5ae+e+oY1UCwafWtnX9
	ZNl7lXZnPVzXIdQUzD4AhXYkTl9dpTsRQVNEdAnZd0pU3YhvL2njWHrT
X-Gm-Gg: AYBFou35rvwa+LXclY0cj/SWGDeX78ih167lN8FdrGQtKIbcys+seask4w3qEfk+RF0
	MyUb4jPJAjuzdZlHCPhcvDfwJBzHep2W1Xx3wE02ZJZScgOKwCGOUZZTD7+EiLGDgVWGsPb0bzW
	SHJS+7B/2cjeW3H+NatH+21DM+tvEeZsXXzdcn0J/0pmrb+CSzESQonLjNKqIs+GYh3RlU/cw24
	UHU1mxOWCWeKsQgjHvaIGt1ROYVaJY3CDFf6690c6sXgzyS/Fw6B39u+EHhGcz0jw9e1OUCANOV
	nbiOFHjbMjtxcom0DXu1+G84NJV32qcnU1P8EoiRh4+Ci0xe44AMLfxewn08gFlS9xboB9xMZiX
	Dms2SxfMxamUPRBWUuH0ptkYoHUuYxwLdl83pfwJqWy4CHKYaWDFOK+Tqb+3JAti/Qjfd3fFmmU
	QM3gDfS8gKd5BSDWQcyDlq0SRLHw8B3MUQgC+844db1z70+puVszo0iNYull591uTQOJE1S+oIx
	N69jYFvVSqfdf3Js3E5Y8ESmnc=
X-Received: by 2002:a17:90b:574f:b0:39e:6a81:f34f with SMTP id 98e67ed59e1d1-39e6a81fd3cmr4027760a91.41.1789812255651;
        Sat, 19 Sep 2026 03:04:15 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:814e:e9d3:767e:9a2a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145dasm3843697a91.4.2026.09.19.03.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 03:04:14 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>
Cc: linux-mmc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] memstick: core: reclaim the request before freeing a timed-out card
Date: Sat, 19 Sep 2026 17:04:08 +0700
Message-ID: <20260919100408.113979-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

memstick_alloc_card() hands card->current_mrq to the host and waits 500 ms
for it. If the host is still busy, the wait times out, the card is freed,
but the host keeps its pointer to the freed request.

rtsx_usb_ms hits this easily: its handle_req work can block in USB
transfers for seconds. When it returns, it reads and writes the freed
request, including the retry path in memstick_next_req():

  BUG: KASAN: slab-use-after-free in rtsx_usb_ms_handle_req+0x17ff/0x1a00
  Read of size 1 by task kworker/1:3
  Workqueue: events rtsx_usb_ms_handle_req
  Allocated by task 1656:
   memstick_alloc_card
   memstick_check
  Freed by task 1656:
   memstick_alloc_card
   memstick_check

Add an optional host->cancel() hook that stops the host from using the
current request, and call it from a common wait helper on timeout, before
the request's owner can go away. rtsx_usb_ms implements it by draining its
work item. The helper also covers memstick_set_rw_addr() and both waits in
memstick_alloc_card().

Reported-by: syzbot+3ee5da0319ca17ef1f4e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3ee5da0319ca17ef1f4e
Fixes: 99451dceeb5f ("memstick: Add realtek USB memstick host driver")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Testing: no hardware. A raw-gadget emulation of an RTS5129 (0bda:0129) on
dummy_hcd delays every bulk-IN reply by 550 ms (above the core's 500 ms wait,
below the driver's 600 ms USB timeout). On a KASAN kernel the unpatched tree
reproduces the report (same offset and alloc/free stacks); the patched tree
takes the timeout+cancel path (~0.6 s) with no KASAN.

I first considered a second unbounded wait_for_completion() instead of a hook,
but rtsx_usb_ms_request() skips scheduling once host->eject is set and
memstick_remove_host() flushes the workqueue, so that can deadlock.

Known limit: cancel waits for the worker's remaining retries (a few seconds
with a device that never answers) while memstick_check() holds host->lock.
Other hosts leave ->cancel NULL, so their behaviour is unchanged.

 drivers/memstick/core/memstick.c    | 22 ++++++++++++++++------
 drivers/memstick/host/rtsx_usb_ms.c |  8 ++++++++
 include/linux/memstick.h            |  2 ++
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/memstick/core/memstick.c b/drivers/memstick/core/memstick.c
index e03989c4e99e..ea09a63286bb 100644
--- a/drivers/memstick/core/memstick.c
+++ b/drivers/memstick/core/memstick.c
@@ -359,6 +359,20 @@ static int h_memstick_set_rw_addr(struct memstick_dev *card,
 	}
 }
 
+/* On timeout the host may still hold current_mrq; make it let go first. */
+static void memstick_wait_req(struct memstick_dev *card)
+{
+	struct memstick_host *host = card->host;
+
+	if (wait_for_completion_timeout(&card->mrq_complete,
+					msecs_to_jiffies(500)))
+		return;
+
+	if (host->cancel)
+		host->cancel(host);
+	card->current_mrq.error = -ETIMEDOUT;
+}
+
 /**
  * memstick_set_rw_addr - issue SET_RW_REG_ADDR request and wait for it to
  *                        complete
@@ -370,9 +384,7 @@ int memstick_set_rw_addr(struct memstick_dev *card)
 {
 	card->next_request = h_memstick_set_rw_addr;
 	memstick_new_req(card->host);
-	if (!wait_for_completion_timeout(&card->mrq_complete,
-			msecs_to_jiffies(500)))
-		card->current_mrq.error = -ETIMEDOUT;
+	memstick_wait_req(card);
 
 	return card->current_mrq.error;
 }
@@ -405,9 +417,7 @@ static struct memstick_dev *memstick_alloc_card(struct memstick_host *host)
 
 		card->next_request = h_memstick_read_dev_id;
 		memstick_new_req(host);
-		if (!wait_for_completion_timeout(&card->mrq_complete,
-				msecs_to_jiffies(500)))
-			card->current_mrq.error = -ETIMEDOUT;
+		memstick_wait_req(card);
 
 		if (card->current_mrq.error)
 			goto err_out;
diff --git a/drivers/memstick/host/rtsx_usb_ms.c b/drivers/memstick/host/rtsx_usb_ms.c
index beadc389f15f..403144a39a53 100644
--- a/drivers/memstick/host/rtsx_usb_ms.c
+++ b/drivers/memstick/host/rtsx_usb_ms.c
@@ -551,6 +551,13 @@ static void rtsx_usb_ms_request(struct memstick_host *msh)
 		schedule_work(&host->handle_req);
 }
 
+static void rtsx_usb_ms_cancel(struct memstick_host *msh)
+{
+	struct rtsx_usb_ms *host = memstick_priv(msh);
+
+	cancel_work_sync(&host->handle_req);
+}
+
 static int rtsx_usb_ms_set_param(struct memstick_host *msh,
 		enum memstick_param param, int value)
 {
@@ -787,6 +794,7 @@ static int rtsx_usb_ms_drv_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&host->poll_card, rtsx_usb_ms_poll_card);
 
 	msh->request = rtsx_usb_ms_request;
+	msh->cancel = rtsx_usb_ms_cancel;
 	msh->set_param = rtsx_usb_ms_set_param;
 	msh->caps = MEMSTICK_CAP_PAR4;
 
diff --git a/include/linux/memstick.h b/include/linux/memstick.h
index 107bdcbedf79..e86f7f6e3e4b 100644
--- a/include/linux/memstick.h
+++ b/include/linux/memstick.h
@@ -285,6 +285,8 @@ struct memstick_host {
 
 	/* Notify the host that some requests are pending. */
 	void                (*request)(struct memstick_host *host);
+	/* Stop using the current request; may sleep until the host is idle. */
+	void                (*cancel)(struct memstick_host *host);
 	/* Set host IO parameters (power, clock, etc).     */
 	int                 (*set_param)(struct memstick_host *host,
 					 enum memstick_param param,
-- 
2.43.0

