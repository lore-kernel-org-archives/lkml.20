Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ECE3D667F
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531985; cv=none; b=FkGyZSRwrMPE3c5yPTWr67BS2ojO5KKuBOh8frpj1GgGzSDwYclyA8WSHGuv/8Xctks8IPoWGo/jlu+yqNduVbsffm+M5CIN1zqp8TZUFFmo9dq7+ECqXBVGCqYxfURkTFwKMGTCKFRkeTlQH/mkQuIMxw2vLYPKKVSQE3NaCfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531985; c=relaxed/simple;
	bh=00piDVZ5vZxPJAOkhzz1OQzw9HOR+t5VnLYZ/+YTckE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=r1p3MSTMaMpDuPtuuD6KczVZDONt5hUfyiJuofjbodIZyl6Cg48EZUAa50Hvrssru0SC/0zh5Z59qijDTnOvefxAPSvsWn0Mjk7AEUNJpSCb61dqUMWt/BQkEHfHKfzoIrYG12j21A2d7yJ/AiSm/rFdloBhcA2EwJHm74ONdIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1hf/gp8; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1hf/gp8"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6afe29c08ccso5035478a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791531982; x=1792136782; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pyEQy1EsTneEsqS91STV0Kzj7aHhfHz7OYjQbZJSVLA=;
        b=Q1hf/gp8nkqNrAPReQkEy1Ce+wAGbZeasu8e0k7Wcl1PVFmvA6rPOecQhB3WDZPP68
         x0uZ9p6cHvPcAIaJ8Wdv0N6zrHEd51+szFBPPEyfS6FQr5QuyiQyz2yeIxFWZ2BKLWMD
         h5k/4EtXKqpjXzvw9o/Dkk9CFFioZrt908GfdU+qkJBZcAYpzy//HGVkOl5OxzN0ZbeP
         ww9tIIyXgThawFw9KH2kwFiNlVO0PhUxMFj+2JToB0sqWk8pIRu00yUVW+oI4kmnt8D4
         hEzxu6XW5OkOQcvY5fQqs82Z5s4rhAbkD/eirKR17L6CfSaEH8vsjdNUeng4YnqRpagA
         IgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531982; x=1792136782;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pyEQy1EsTneEsqS91STV0Kzj7aHhfHz7OYjQbZJSVLA=;
        b=hkhxwrrvjDrKJxOOjyBaqLe9bOiOE4B5NUfb2aQEcKDIc4cbqPCrzP+0q6gmM21hb2
         avd5oD3kJKuFI1ZcmLzmcYsLle+vzw0b9L0sOPgL3NhjGkIMI11snOfs6pxuNGaJThoj
         Y9pRTXksOw6absxJhUMnyX+KWNAwDe58LTff2YwLClik7b4kGTh3vtqhVh7Q7s2Ct8tw
         Qcii2h3q561hjmy4wTwtVFVWYNtgrj4xlV81zF5OHwa3AZkcIQaimkE1xf1R/QeE+ILQ
         A9NnD98wOsfdRliOMXKfygZfX3J0kKBuPI0NaAfgsmCfKqo4H0PxlkNZfI9jzusQBFi+
         xCjw==
X-Forwarded-Encrypted: i=1; AKwUvBzv89eSdw12qLnILL4jZzMhpDs37qHSb1D/v5mkqTCbRqJaOf5DBA5xbVFYykALU4mkg9VOzKM6lmzm1sM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2+c/KuZHO02usAQ1mkik5L1xqnv2u8rfF6Dh1kF8OXTJTK0xK
	L8BHz9kevjkK15Msmzv1RharwIXact9hxdOV8s4McXyDPaIKfVSlO6OU
X-Gm-Gg: AYBFou2JqHHUbe5LF1TBCdaspd4Bn9roSiSTZjOG34HRZ7QqDm6Xj58NO4d5MzXFLKy
	iTT2o7+8OxrhnU+tC+Y3ggvT7p4WaNXF5GtkrFpLf0G5gOQkP2xucrrWV9SB9KZzVGXYmdK4Cug
	pvuBSwFU2tMsxl92WcIdBy2knwtsHyMw2dqJplJuKBktMqaETVD59i8cAZ5yXjNwSsFQDNYKctT
	ciQxFuJDzJo9FU7/toBuzjE4brNflycPpkoF4lLN1sw2dYR4wRhGde4i0wyuGuNe73stfePIpTY
	O2tTIIjru5L0xMFAv2BV7V4tZurTzeTtSnbpFJiEjE94KJJPrfItfM5WpvrXjotQ1Y2slsNEFmS
	hFwhwQEMSRSW362h749FEMJikDhqRalTDVeGrqvhFAgljPNW1dDuYskYDMHCke65ru/zOI2NBVa
	HLMIDaFOTOe4sxd0s8yMimw/raD6DCwAB+dybrODEDuhkXMsB7Aw7s9YjHaIVjs6cJeqiqvr7sL
	4pfMv1SpwJ5lelWaT+x9iEn0A==
X-Received: by 2002:a17:907:971e:b0:c2e:4831:1442 with SMTP id a640c23a62f3a-c31a9a046bcmr108377466b.1.1791531981688;
        Fri, 09 Oct 2026 00:46:21 -0700 (PDT)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9accf47sm54336366b.76.2026.10.09.00.46.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2026 00:46:21 -0700 (PDT)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v6 1/7] char: xillybus: Improve control of execution flow with mutexes
Date: Fri,  9 Oct 2026 09:45:51 +0200
Message-Id: <20261009074557.19996-2-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261009074557.19996-1-eli.billauer@gmail.com>
References: <20261009074557.19996-1-eli.billauer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

This commit addresses two issues by using mutexes:

(1) Add a mutex to protect the fifo_buf_order global variable. The
    purpose of this variable is avoid repeated failed calls to
    __get_free_pages() for allocating FIFO memory, when the chunk
    size was too big. However, if two drivers are initialized at the
    same time, fifo_init() may run in parallel, and fifo_buf_order
    may be reduced too much. This is a far-fetched scenario, now
    completely prevented by fifo_buf_order_mutex.

(2) setup_channels() acquires process_in_mutex to prevent
    process_bulk_in() from accessing the xillyusb_dev struct. With
    correctly working hardware, process_bulk_in() is never called while
    setup_channels() runs, because the device has no reason to send data
    in that phase. The mutex ensures that process_bulk_in() does not
    touch the members that setup_channels() alters.

    There is no similar protection for data flow in the other direction,
    because during the setup process, the only outbound data is the
    BULK endpoint used for commands, and it remains untouched after its
    initial setup.

Assisted-by: Deepseek:v4-pro Kimi:K2.6 ChatGPT:GPT-5.5 Claude:Sonnet-4.6
Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---

Notes:
    Changelog:
    =========
    Change v5->v6: Rebase to current tree
    
    No change on v4->v5.
    
    Changes v3->v4:
     -- Use plain mutex_lock() in fifo_init() rather than guard() in order
        to avoid mixing guard() with goto, following Sashiko's remark + add
        attribution to Sashiko for this.
    
    Changes v2->v3:
     -- Add Assisted-by tag to description
    
    No change on v1->v2.

 drivers/char/xillybus/xillyusb.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index 193e2a5b599e..13dda738477c 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -50,6 +50,7 @@ MODULE_LICENSE("GPL v2");
 static const char xillyname[] = "xillyusb";
 
 static unsigned int fifo_buf_order;
+static DEFINE_MUTEX(fifo_buf_order_mutex);
 static struct workqueue_struct *wakeup_wq;
 
 #define USB_VENDOR_ID_XILINX		0x03fd
@@ -372,6 +373,8 @@ static int fifo_init(struct xillyfifo *fifo,
 
 	unsigned int log2_fifo_buf_size;
 
+	mutex_lock(&fifo_buf_order_mutex);
+
 retry:
 	log2_fifo_buf_size = fifo_buf_order + PAGE_SHIFT;
 
@@ -388,8 +391,10 @@ static int fifo_init(struct xillyfifo *fifo,
 
 	fifo->mem = kmalloc_array(fifo->bufnum, sizeof(void *), GFP_KERNEL);
 
-	if (!fifo->mem)
+	if (!fifo->mem) {
+		mutex_unlock(&fifo_buf_order_mutex);
 		return -ENOMEM;
+	}
 
 	for (i = 0; i < fifo->bufnum; i++) {
 		fifo->mem[i] = kmalloc(fifo->bufsize, GFP_KERNEL);
@@ -405,6 +410,8 @@ static int fifo_init(struct xillyfifo *fifo,
 	fifo->writebuf = 0;
 	spin_lock_init(&fifo->lock);
 	init_waitqueue_head(&fifo->waitq);
+
+	mutex_unlock(&fifo_buf_order_mutex);
 	return 0;
 
 memfail:
@@ -418,6 +425,7 @@ static int fifo_init(struct xillyfifo *fifo,
 		fifo_buf_order--;
 		goto retry;
 	} else {
+		mutex_unlock(&fifo_buf_order_mutex);
 		return -ENOMEM;
 	}
 }
@@ -1932,6 +1940,9 @@ static int setup_channels(struct xillyusb_dev *xdev,
 	struct xillyusb_channel *chan, *new_channels;
 	int i;
 
+	/* Don't let process_bulk_in() run while we change the channels */
+	guard(mutex)(&xdev->process_in_mutex);
+
 	chan = kzalloc_objs(*chan, num_channels);
 	if (!chan)
 		return -ENOMEM;
-- 
2.34.1

