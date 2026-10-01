Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706783CB8E6
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857998; cv=none; b=IQSEhInrwK1WkqciEbNMYQ02/Dg0ofz81ZOEa4b05k2ABTxhxEci+K6xwQ+L/SrcM2IY++phPRciu7quWNFt04Ey6fvcUSZOM5imiSUqMFdFZ+ReovYMF5Rp9EG113hIPrXkczHu1sabWhySjD3l+edC7vnc0AJbxeSsujBr7BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857998; c=relaxed/simple;
	bh=+0Z9RNUYuQI0YF3Yzhv3v/KBNJUmhXnWTcQK4Lu5e5c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TmZilQIvYdq/BD8pCeVVuKd66yo+hGpcOIY3nBuzFvy4hYAnF02GXng2aXKVhJzanKtOHMM0cyWUHrz45Y0X/ZePZlJAlDTJKIhXHu3N1lrShSVJqlROLc1knCyTEeT8454eQ0PnLJQN6GRyhkmWwAcjhpu80Nq/fZH/mlzTC6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npAtyUVQ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npAtyUVQ"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb65437so3821178a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790857997; x=1791462797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z5lqU5QsEffdFqz898X5GwASYkPwAXbDBRdKuSA3IbE=;
        b=npAtyUVQ1V4Q/yIFXel0QmOw9nYpSTgVZpZDLoN68aMbNl8FKp9Y6io/QYspVeULUC
         USJLPtcbLf5u4zEc088856JM9RxQ928axqKGdlW+llbDUpPSAsVhUqkmlKZrNv9evbBJ
         jZp0FNir158zU6+ISYF0kg3QIcXGU/LexXdsgFry3RQIqJh66GIBpYjiqlbRZVWGsuoD
         NJLQ6UYwEy9r8zLh55hNMTF53u5s70I/I8pHSk3TIx/qi/U5R1sN50j3Sg/tGYRfysNF
         GN5eErzq8cPuhweEvtH0LCB2q5Nn5mycFMPq4odjFUCzIZrejeBFeonEmTlp0olXbHPJ
         Ai3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790857997; x=1791462797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z5lqU5QsEffdFqz898X5GwASYkPwAXbDBRdKuSA3IbE=;
        b=WA8JrBNhZGnygnW9oWuZaUB01yTk8GizT035UMcMyakaVPjBI51odoMSs4g0OhRXNt
         W3lNVevG8A+HraAE+OCJ83mxcXePAgVxAReSkFzPuZQ+lfeV83A1LSkXn+bJz0zceG3Q
         mKs9d3EnsW1bwtLac9F3p6+fuUcEa2dOcSwh8M5iU1LwYifRMl2l+dZVknSb2qrB2soh
         L0yknnR7DFvGKmKbY5nlZUXAKUkapZxzuT6VMTvMvXQnYuGTkGqvic5rvAeMity7Wc4t
         V6Un8y8NJLV41AVQe/5a0xTfmJPsGOmMnPFAyvat1NjBadOz8uVbz0wsX3WBgy+gitjp
         9d/A==
X-Forwarded-Encrypted: i=1; AKwUvBxIpVOMEO7o/Y/s/zKDXEziQLwe6sUWjfbWyBJXS42XFAJZpynZKkHfJgDuA4JXqrBFp8lAYbEOEyVDJGc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9rZsGuYr4pat4+VOz/G0xHHzPToh4DEOBndpSCz+aMPLppSl0
	w2uU+aaXaLSUMu6L005RN1ac5Mn35egtYHWbzM5hlUS6ElpQKo/uEI2y
X-Gm-Gg: AYBFou1rxXMVkuKkqmCP63OJH/5LITBSwcb6Q/vuuIcATawYlA89/6VwsWdBzt9qt4G
	6aGNhppxdFM8XPtvvUQLcVRNQ6q49rsmadaeDKVgXjiPubc2VYEECFNt2bmmUMRd19uWGJQdAAC
	U5A4k7us+3krndyrzjRn2xoPBHOjz1ha6eoO8udG/lfiWWKH9urKbe79J/kU/geQ1WHR1p1kkvR
	sOsKQu4OnyQl7TN9ZurmdUUidDBmAn2gE23a+Fn3hf+djUSsr8l2sn4uR1+vE0JQRZZMvPlc7uA
	FYzg2c0Ujs5UenYyiQFukH3/vZk2bGhqB9DAXzAdGP+pNG+iKRkFVvst3ozvhLOk8Bun+OhMQal
	hh8muTzvLm330/oxFAhr5ovMuDsygaQPb7r6KNsYltJ4tLszlIu1vaV30r9td0ySZIdhYhcpeNO
	KTlOvI7y/FVgET+3zvRm3lyW6aysTnp3KDxYmcdKrIN3TMHP409qjjDX7usq4xsexff2B29KfTs
	GEi0oebyRBtMY6aRT7wyv0V3NGyvn9TTYQ4iSg=
X-Received: by 2002:a17:90a:508:b0:3a4:ee64:b82a with SMTP id 98e67ed59e1d1-3a4ee64d502mr1454410a91.11.1790857996554;
        Thu, 01 Oct 2026 05:33:16 -0700 (PDT)
Received: from localhost.localdomain ([2408:8352:470:235:7e7d:21ff:fedc:f409])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f478e750sm4464178a91.13.2026.10.01.05.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:33:16 -0700 (PDT)
From: xy521521@gmail.com
To: stern@rowland.harvard.edu
Cc: Hongyu Xie <xiehongyu1@kylinos.cn>,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] usb-storage: ene_ub6250: fix coding style issues in the timeout code
Date: Thu,  1 Oct 2026 20:31:35 +0800
Message-Id: <20261001123135.38831-3-xy521521@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20261001123135.38831-1-xy521521@gmail.com>
References: <20261001123135.38831-1-xy521521@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyu Xie <xiehongyu1@kylinos.cn>

Fix the continuation-line alignment of the code added for the bounded
probe-time transfers and rename the fDir parameter of
ene_send_scsi_cmd[_timeout]() to fdir, as flagged by checkpatch.

No functional changes intended.

Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/usb/storage/ene_ub6250.c | 34 ++++++++++++++++----------------
 drivers/usb/storage/transport.c  |  9 +++++----
 drivers/usb/storage/transport.h  |  6 ++++--
 3 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
index 109336bd7e30..276764a66774 100644
--- a/drivers/usb/storage/ene_ub6250.c
+++ b/drivers/usb/storage/ene_ub6250.c
@@ -494,7 +494,7 @@ static void ene_ub6250_info_destructor(void *extra)
 	kfree(info->bbuf);
 }
 
-static int ene_send_scsi_cmd_timeout(struct us_data *us, u8 fDir, void *buf,
+static int ene_send_scsi_cmd_timeout(struct us_data *us, u8 fdir, void *buf,
 				     int use_sg, int timeout)
 {
 	struct bulk_cb_wrap *bcb = (struct bulk_cb_wrap *) us->iobuf;
@@ -508,17 +508,17 @@ static int ene_send_scsi_cmd_timeout(struct us_data *us, u8 fDir, void *buf,
 	/* usb_stor_dbg(us, "transport --- ene_send_scsi_cmd\n"); */
 	/* send cmd to out endpoint */
 	result = usb_stor_bulk_transfer_buf_timeout(us, us->send_bulk_pipe,
-					    bcb, US_BULK_CB_WRAP_LEN, NULL,
-					    timeout);
+						    bcb, US_BULK_CB_WRAP_LEN,
+						    NULL, timeout);
 	if (result != USB_STOR_XFER_GOOD) {
 		usb_stor_dbg(us, "send cmd to out endpoint fail ---\n");
 		return USB_STOR_TRANSPORT_ERROR;
 	}
 
 	if (buf) {
-		unsigned int pipe = fDir;
+		unsigned int pipe = fdir;
 
-		if (fDir  == FDIR_READ)
+		if (fdir == FDIR_READ)
 			pipe = us->recv_bulk_pipe;
 		else
 			pipe = us->send_bulk_pipe;
@@ -528,8 +528,8 @@ static int ene_send_scsi_cmd_timeout(struct us_data *us, u8 fDir, void *buf,
 			result = usb_stor_bulk_srb(us, pipe, us->srb);
 		} else if (timeout) {
 			result = usb_stor_bulk_transfer_buf_timeout(us, pipe,
-					buf, transfer_length, &partial,
-					timeout);
+								    buf, transfer_length, &partial,
+								    timeout);
 		} else {
 			result = usb_stor_bulk_transfer_sg(us, pipe, buf,
 						transfer_length, 0, &partial);
@@ -542,24 +542,24 @@ static int ene_send_scsi_cmd_timeout(struct us_data *us, u8 fDir, void *buf,
 
 	/* Get CSW for device status */
 	result = usb_stor_bulk_transfer_buf_timeout(us, us->recv_bulk_pipe,
-					    bcs, US_BULK_CS_WRAP_LEN, &cswlen,
-					    timeout);
+						    bcs, US_BULK_CS_WRAP_LEN,
+						    &cswlen, timeout);
 
 	if (result == USB_STOR_XFER_SHORT && cswlen == 0) {
 		usb_stor_dbg(us, "Received 0-length CSW; retrying...\n");
 		result = usb_stor_bulk_transfer_buf_timeout(us,
-					    us->recv_bulk_pipe, bcs,
-					    US_BULK_CS_WRAP_LEN, &cswlen,
-					    timeout);
+							    us->recv_bulk_pipe, bcs,
+							    US_BULK_CS_WRAP_LEN, &cswlen,
+							    timeout);
 	}
 
 	if (result == USB_STOR_XFER_STALLED) {
 		/* get the status again */
 		usb_stor_dbg(us, "Attempting to get CSW (2nd try)...\n");
 		result = usb_stor_bulk_transfer_buf_timeout(us,
-						us->recv_bulk_pipe, bcs,
-						US_BULK_CS_WRAP_LEN, NULL,
-						timeout);
+							    us->recv_bulk_pipe, bcs,
+							    US_BULK_CS_WRAP_LEN, NULL,
+							    timeout);
 	}
 
 	if (result != USB_STOR_XFER_GOOD)
@@ -589,9 +589,9 @@ static int ene_send_scsi_cmd_timeout(struct us_data *us, u8 fDir, void *buf,
  * Unbounded variant for command-path callers: the command's abort
  * machinery terminates usb_stor_msg_common()'s wait if the device dies.
  */
-static int ene_send_scsi_cmd(struct us_data *us, u8 fDir, void *buf, int use_sg)
+static int ene_send_scsi_cmd(struct us_data *us, u8 fdir, void *buf, int use_sg)
 {
-	return ene_send_scsi_cmd_timeout(us, fDir, buf, use_sg, 0);
+	return ene_send_scsi_cmd_timeout(us, fdir, buf, use_sg, 0);
 }
 
 static int do_scsi_request_sense(struct us_data *us, struct scsi_cmnd *srb)
diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
index c586d2021b7e..89619010d665 100644
--- a/drivers/usb/storage/transport.c
+++ b/drivers/usb/storage/transport.c
@@ -388,8 +388,8 @@ static int usb_stor_intr_transfer(struct us_data *us, void *buf,
  * machinery to terminate the wait.
  */
 int usb_stor_bulk_transfer_buf_timeout(struct us_data *us, unsigned int pipe,
-		void *buf, unsigned int length, unsigned int *act_len,
-		int timeout)
+				       void *buf, unsigned int length,
+				       unsigned int *act_len, int timeout)
 {
 	int result;
 
@@ -412,10 +412,11 @@ EXPORT_SYMBOL_GPL(usb_stor_bulk_transfer_buf_timeout);
  * Same as usb_stor_bulk_transfer_buf_timeout() with an unbounded wait.
  */
 int usb_stor_bulk_transfer_buf(struct us_data *us, unsigned int pipe,
-		void *buf, unsigned int length, unsigned int *act_len)
+			       void *buf, unsigned int length,
+			       unsigned int *act_len)
 {
 	return usb_stor_bulk_transfer_buf_timeout(us, pipe, buf, length,
-			act_len, 0);
+						  act_len, 0);
 }
 EXPORT_SYMBOL_GPL(usb_stor_bulk_transfer_buf);
 
diff --git a/drivers/usb/storage/transport.h b/drivers/usb/storage/transport.h
index dc0442efc24d..361dbd77f15e 100644
--- a/drivers/usb/storage/transport.h
+++ b/drivers/usb/storage/transport.h
@@ -78,8 +78,10 @@ extern int usb_stor_ctrl_transfer(struct us_data *us, unsigned int pipe,
 		u8 request, u8 requesttype, u16 value, u16 index,
 		void *data, u16 size);
 extern int usb_stor_bulk_transfer_buf_timeout(struct us_data *us,
-		unsigned int pipe, void *buf, unsigned int length,
-		unsigned int *act_len, int timeout);
+					      unsigned int pipe, void *buf,
+					      unsigned int length,
+					      unsigned int *act_len,
+					      int timeout);
 extern int usb_stor_bulk_transfer_buf(struct us_data *us, unsigned int pipe,
 		void *buf, unsigned int length, unsigned int *act_len);
 extern int usb_stor_bulk_transfer_sg(struct us_data *us, unsigned int pipe,
-- 
2.32.0

