Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0385C3CA4BC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790032034; cv=none; b=uLFXbzJ8LJXSdUMksBDX+Q5mJZAjyWbkI1zHVnZQICWWeVDY0Y8cN4CiKfuiyofKz/n2chRk9c6XE+/xjtTj7NWv6tkvciCckygCTvETzIIA4qU5kU9uHUIvYfXXhOba4YrMmtHNx3MnItFkSwdvRQjAuZvScBVJ/n3zjgBN664=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790032034; c=relaxed/simple;
	bh=uJfzgfSGRNqdmsECGrwEUb3o+9fvnIN5kQou+V0cHC8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F6WAERPiUhAKtEgfu7y1yvjNVTmlT2JwnX7bTpGTswqwo9clHs7XlOVGpGlb3PN5cDtbAhcBgxkkCLsb6Qr5JbJ79a4bNINP1kJydXyqFN6kXu0l2dhszb57M6M/KQEqjQ65y2Ad3Fhyp1vDwcTf7Ah/KVA4kUMbCBXJvE3oP1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samagazaryan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tKjMuWpN; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samagazaryan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tKjMuWpN"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so5272247a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790032031; x=1790636831; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R6tln3zzXyXdjXIsZYRibDgjhT6eLkPrDJnsUsI23uA=;
        b=tKjMuWpN92sQ6reT6fgQnabnGwuCY4wF99Oz5M0Crwj98CtH17KzA264CQfYCHvPyr
         5HYCY0MjlkVvuohPEJiUi3/URHDF0zmfHIA3oD7YYfbub12dmYtwCIdfs4GzrSD07tNs
         wfMNIvsYci5+N1U4QEqi8nfINiDWDXRh2febfj6T6Pbq9IE8XQBOnKnaODDZhLnaft+A
         HznMGiuK0vcT/BJauw6y2Cd2q83L/jTGCm6wBU4B9C5kX7fl4vU5UK1h6t29Wfdzuuh0
         uFB+nF8GPpSHzBQp536kU67N++GKTOnjJ62Wgg2H9SraxheFSx53a5B1QlidR6c/xs3e
         9UGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790032031; x=1790636831;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R6tln3zzXyXdjXIsZYRibDgjhT6eLkPrDJnsUsI23uA=;
        b=Sg/ExhFpV/VZByBsoyoOUN61IQjqlMErHaD2tZDk1AarcdijOjZRYre9TB9H8PNrEi
         dXIU9FTOnKrb3vltwI+6yyXN0F5jG60PrwRPyhTPr0Xdm92KN1LvTdVN2YmmHJZXhBLu
         e0vm8KEe4wqPDEstS6CN3sqmupSwMSY+e5ChMZmUlhqcPL52Og177NGMpnoQI45yrhVs
         UpRwDUhhQQzufOQpNrp3W0t+arR0TtDIoymDGOkjGL6e3bJlkHmM7n7pQS+cXmwADK8o
         dLSI6F8aRh8wzCpZGp9augC0d6ptWw1wMjKcEayjKGBXwLzI6vtVWScKgq0/rORYqJaw
         QVAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQ6ZoPYNk2eyXkWrMb2ROxdRcfS4ulGfPjjA2Hu58tqTSoMIFJRPEyLSi2MyMZAzhdHVRtgQhm3xKrQTY=@vger.kernel.org
X-Gm-Message-State: AFuF++kM50cFvrVQ4AdolxDgR5RMD/Lqre0oRiCWv3DzI1gziJBKCUvi
	dNrikIgeJ71v/IkWFowlGj3dwBstMscNzte6d5jnA6HRuJOKMmiIlxusyEssKgwmV844PQxWXT+
	JcfJwoRiqahI1g8y9ETamFgZDfpksmA==
X-Received: from dyrt38.prod.google.com ([2002:a05:7300:4f26:b0:339:6b44:abf5])
 (user=samagazaryan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3909:b0:39e:3558:f925 with SMTP id 98e67ed59e1d1-39e54d86a97mr17168028a91.24.1790032030595;
 Mon, 21 Sep 2026 16:07:10 -0700 (PDT)
Date: Mon, 21 Sep 2026 23:06:01 +0000
In-Reply-To: <20260921230603.2518652-1-samagazaryan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921230603.2518652-1-samagazaryan@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921230603.2518652-4-samagazaryan@google.com>
Subject: [PATCH v5 3/5] i3c: use actual_len for read transfers
From: Sam Agazaryan <samagazaryan@google.com>
To: linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Arnd Bergmann <arnd@arndb.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, Meagan Lloyd <meaganlloyd@linux.microsoft.com>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
	Sam Agazaryan <samagazaryan@google.com>
Content-Type: text/plain; charset="UTF-8"

Currently only the amd and svc I3C controller drivers populate
i3c_xfer.actual_len on reads, while dw-i3c-master and mipi-i3c-hci
overwrite i3c_xfer.len with the received byte count and leave actual_len
as 0. Because of this inconsistency, mctp-i3c reads xfer.len instead of
xfer.actual_len, making it fail on controllers that do not mutate len.

Unify read length reporting across the subsystem:
- Clarify in <linux/i3c/device.h> that actual_len reflects the actual
  number of bytes transferred on reads.
- Update adi, cdns, dw, mipi-i3c-hci, and renesas controller drivers to
  populate actual_len on read transfers without mutating len.
- Update mctp-i3c to read xfer.actual_len instead of xfer.len.

Co-developed-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Signed-off-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Signed-off-by: Sam Agazaryan <samagazaryan@google.com>
---
 drivers/i3c/master/adi-i3c-master.c    |  5 ++++-
 drivers/i3c/master/dw-i3c-master.c     |  2 +-
 drivers/i3c/master/i3c-master-cdns.c   |  5 ++++-
 drivers/i3c/master/mipi-i3c-hci/core.c |  2 +-
 drivers/i3c/master/renesas-i3c.c       |  3 +++
 drivers/net/mctp/mctp-i3c.c            | 10 +++++-----
 include/linux/i3c/device.h             |  2 +-
 7 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
index b35386260350..d033bfd4ecc2 100644
--- a/drivers/i3c/master/adi-i3c-master.c
+++ b/drivers/i3c/master/adi-i3c-master.c
@@ -412,8 +412,11 @@ static int adi_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 
 	ret = xfer->ret;
 
-	for (i = 0; i < nxfers; i++)
+	for (i = 0; i < nxfers; i++) {
 		xfers[i].err = adi_i3c_cmd_get_err(&xfer->cmds[i]);
+		if (xfers[i].rnw)
+			xfers[i].actual_len = xfer->cmds[i].rx_len;
+	}
 
 	return ret;
 }
diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 4563d8761ba0..28e8eb293747 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1029,7 +1029,7 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 		struct dw_i3c_cmd *cmd = &xfer->cmds[i];
 
 		if (i3c_xfers[i].rnw)
-			i3c_xfers[i].len = cmd->rx_len;
+			i3c_xfers[i].actual_len = cmd->rx_len;
 	}
 
 	ret = xfer->ret;
diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 2d98c1ce9b12..331062c10b31 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -795,8 +795,11 @@ static int cdns_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 
 	ret = cdns_xfer->ret;
 
-	for (i = 0; i < nxfers; i++)
+	for (i = 0; i < nxfers; i++) {
 		xfers[i].err = cdns_i3c_cmd_get_err(&cdns_xfer->cmds[i]);
+		if (xfers[i].rnw)
+			xfers[i].actual_len = cdns_xfer->cmds[i].rx_len;
+	}
 
 	cdns_i3c_master_free_xfer(cdns_xfer);
 
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index dadf049bd4b5..f74c02fab9e3 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -509,7 +509,7 @@ static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
 		goto out;
 	for (i = 0; i < nxfers; i++) {
 		if (i3c_xfers[i].rnw)
-			i3c_xfers[i].len = RESP_DATA_LENGTH(xfer[i].response);
+			i3c_xfers[i].actual_len = RESP_DATA_LENGTH(xfer[i].response);
 		if (RESP_STATUS(xfer[i].response) != RESP_SUCCESS) {
 			ret = -EIO;
 			goto out;
diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 28c0927a0179..a3dcb4cd9b0e 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -918,6 +918,9 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
 		time_left = renesas_i3c_wait_xfer(i3c, xfer);
 		if (!time_left)
 			xfer_failed = true;
+
+		if (i3c_xfers[i].rnw)
+			i3c_xfers[i].actual_len = cmd->rx_count;
 	}
 
 	if (xfer_failed)
diff --git a/drivers/net/mctp/mctp-i3c.c b/drivers/net/mctp/mctp-i3c.c
index 6d2bbae7477b..5f94c11a1712 100644
--- a/drivers/net/mctp/mctp-i3c.c
+++ b/drivers/net/mctp/mctp-i3c.c
@@ -131,12 +131,12 @@ static int mctp_i3c_read(struct mctp_i3c_device *mi)
 	if (rc < 0)
 		goto err;
 
-	if (WARN_ON_ONCE(xfer.len > mi->mrl)) {
+	if (WARN_ON_ONCE(xfer.actual_len > mi->mrl)) {
 		/* Bad i3c bus driver */
 		rc = -EIO;
 		goto err;
 	}
-	if (xfer.len < MCTP_I3C_MINLEN) {
+	if (xfer.actual_len < MCTP_I3C_MINLEN) {
 		stats->rx_length_errors++;
 		rc = -EIO;
 		goto err;
@@ -145,15 +145,15 @@ static int mctp_i3c_read(struct mctp_i3c_device *mi)
 	/* check PEC, including address byte */
 	addr = mi->addr << 1 | 1;
 	pec = i2c_smbus_pec(0, &addr, 1);
-	pec = i2c_smbus_pec(pec, xfer.data.in, xfer.len - 1);
-	if (pec != ((u8 *)xfer.data.in)[xfer.len - 1]) {
+	pec = i2c_smbus_pec(pec, xfer.data.in, xfer.actual_len - 1);
+	if (pec != ((u8 *)xfer.data.in)[xfer.actual_len - 1]) {
 		stats->rx_crc_errors++;
 		rc = -EINVAL;
 		goto err;
 	}
 
 	/* Remove PEC */
-	skb_trim(skb, xfer.len - 1);
+	skb_trim(skb, xfer.actual_len - 1);
 
 	cb = __mctp_cb(skb);
 	cb->halen = PID_SIZE;
diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index 971d53349b6f..f868a7bf2bc9 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -59,7 +59,7 @@ enum i3c_xfer_mode {
  * @rnw: encodes the transfer direction. true for a read, false for a write
  * @cmd: Read/Write command in HDR mode, read: 0x80 - 0xff, write: 0x00 - 0x7f
  * @len: transfer length in bytes of the transfer
- * @actual_len: actual length in bytes are transferred by the controller
+ * @actual_len: actual length in bytes transferred by the controller on read
  * @data: input/output buffer
  * @data.in: input buffer. Must point to a DMA-able buffer
  * @data.out: output buffer. Must point to a DMA-able buffer
-- 
2.55.0.1082.g2b9226bbc0-goog

