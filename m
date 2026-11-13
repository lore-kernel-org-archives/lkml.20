Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555414;
	b=GAelPu7gJZ5Tas9ZIKyjIv8dKgZ/AdDsw10iicJK3KAqDUJeaCmj2S88BBF4dtUp7uKy
	 nYYvmc5uwLDgyNUDVUOsik7x7gGqEAVRu7pS0pZ+s9nzx7Pg6DW/iYdmconliDVQl478P
	 I1+o3UjoL0ZNV4ZRKTGkc0bpAzZ16UoFvc4DWVNK86QcbtO5uLnVeylP6J3quznRfPyiJ
	 o4s7EpYkeQEiuf7EI5aUF/NCQOtBQIQ6x047taJUe7TUKoHWrfRYN4DUxd7dDvHxDGOrH
	 PAacDwGR72Ar9OLx0a4yfYZC/V9CCsumck3ksOBagnGNTXkT3xuqdrsrpEKc67clNUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555414;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mX97vKGfKG79Gv/YC4HRVZ42o6kQjjPD71aRf1vrpj4=;
	b=jDthnNngMPgpnm3XAY+2cb8hFz3MeizZ9NWOOaYNdkEJSk/wRvVaTD05Wj4FBf+Z7ctQ
	 S6G4o+4Xl1hvSC7qU6yHCBfHCwSYkFbl0tMwq+epr7xyr0/lGzWEraSlYe/kXwZ4TSyEU
	 MZ10CkD73+pRF8Pw3NEF5IPIIooDou3DXYCOqOoeGB6PYAPhtlDUUq4f6K4zyamz/QvTQ
	 0r4ZwXPthgGvzFgNGG12y2IivB7syx3n0LaPuC2L1PFQO2rD+4HyU8dplfUMh2F5jtEFs
	 ggMTot7ynU6QCxQeqwpXiMuShhbz2JisCNXTcTKjFRq1nUe2iZU1i7zkJMeZygoW4yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C34606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23C34606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd69954c755so860146a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:36:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555413; x=1795160213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mX97vKGfKG79Gv/YC4HRVZ42o6kQjjPD71aRf1vrpj4=;
        b=Vuxtk7D8tnBgjiyO70r8szeXT3FPoA3gHmMAAOZ3fwIqIk22t0j3B+gx0AjwPH/uSW
         8fBN6PxHrnpBYv63FSWCObWN6vSU1eOrN9QrqRNvNip0Jd6TLmq9UG8PnevyPaHHJK7f
         G2YImh6adRHg6aZOyXWhxAz/TKBJw/USh9DBuTiSu0ESiwPDjDN+Kviqv9qnt9I4kl5e
         hNeaipXftWMUJLA5ctIKF7ierobxhkB/uJJn42HL9Mw44y9lT/OXvUesf4Ey8lU07zoK
         WyflQ+N2rpI3LerjgoGm9XzUTiu0ayW6DgBqakwEo1aT/m1co7BB8EoAbrLxxu01P972
         QLsQ==
X-Gm-Message-State: APuU4Z9CTWg4EMIYIJbXI6/yu7oikQG+BY8ZdL+OOjVv7NernNM10YNy
	Et/hgmm4GPk5yyFiKYvH4PST8O1rA6/52HAPy9P21JfXbGlQaker2ee+
X-Gm-Gg: AYBFou148ITQM5n8h1qQsooV8BvRii7L1wNHaqFGIfwny6XfjwjhUPt4N0vlX81Go3V
	UobK75VziKfeXkA6JvNd3IvmJamn63QU/3905uBhvshmjA/JvLfni1hyNkf4FsDp88fua6OnhUj
	yQr+Ihe9CeOJvjQiSCDImdixbwKeqoHjYbCKd4VQsierZvQwToYSCyeDpK6av1IZ8HOW7XBi51y
	xwKwL2q1g7UYh1+N9hrDU6wPK49a3IbxaJY37PIPQ/Jh/Zhyn1eIEMdIHHdt2+h0beacT1Dr13f
	dv75VgubcYirbqs3gtvJv7zFR2w6M02qmiB5ZSELEt4Q4+L0Qj2cbJqHPRppusxPk1hMrtKAue7
	Z5aDQ3wG8RgJqRSuHvYdK9DEJV8K/9gJdM8kS1F00v0tFjgg8/RA3TE1DOXGSYdmxkkOA0NV+H2
	GTnEajLHkYZ4BRLgoc6BkLNgPtGBSRFFai/veKaa+5wXkaONOTdOXNa4K/jJQi8IuqcrnQRG+4T
	PkS9iOqrCee2rO8IXi2ny2KKhcCUCJa5ZA3JmKZTJLzvP9mOtsacQxqEIQhNbFzMnNu5J4BEwEi
	i8eS2MQQW4H+fCAQrRGFw3FG2NOZhcfOEAuo6eWzQGEB7A==
X-Received: by 2002:a17:90b:57c3:b0:3ab:9c73:130 with SMTP id 98e67ed59e1d1-3b1b0a108e5mr1426110a91.33.1794555413550;
        Thu, 12 Nov 2026 23:36:53 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb179fasm3205009a91.4.2026.11.12.23.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:36:53 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	usb-storage@lists.one-eyed-alien.net,
	syzbot+30552b4cbe99d6d91306@syzkaller.appspotmail.com,
	Liu Qi <liuqi@longcheer.com>,
	stable@vger.kernel.org,
	Hongyu Xie <xiehongyu1@kylinos.cn>
Subject: [PATCH v5 1/2] usb-storage: add usb_stor_bulk_transfer_buf_timeout()
Date: Fri, 13 Nov 2026 15:36:37 +0800
Message-Id: <20261113073638.1225998-2-xiehongyu1@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261113073638.1225998-1-xiehongyu1@kylinos.cn>
References: <b07b5f5b-4722-4f1c-84b9-205ba9b8943f@rowland.harvard.edu>
 <20261113073638.1225998-1-xiehongyu1@kylinos.cn>
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

usb_stor_bulk_transfer_buf() waits for URB completion without a timeout.
That is correct for transfers belonging to a SCSI command, whose timeout
and abort handling terminate the wait, but not for transfers issued
outside a SCSI command.

Add a variant which takes a timeout, in jiffies; zero means no limit.
usb_stor_bulk_transfer_buf() becomes a wrapper with a zero timeout, so
existing callers are unchanged.

Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/usb/storage/transport.c | 31 ++++++++++++++++++++++++-------
 drivers/usb/storage/transport.h |  5 +++++
 2 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
index 8de3015bce050..424293658918a 100644
--- a/drivers/usb/storage/transport.c
+++ b/drivers/usb/storage/transport.c
@@ -378,12 +378,17 @@ static int usb_stor_intr_transfer(struct us_data *us, void *buf,
 }
 
 /*
- * Transfer one buffer via bulk pipe, without timeouts, but allowing early
- * termination.  Return codes are USB_STOR_XFER_xxx.  If the bulk pipe
- * stalls during the transfer, the halt is automatically cleared.
+ * Transfer one buffer via bulk pipe, allowing early termination.  Return
+ * codes are USB_STOR_XFER_xxx.  If the bulk pipe stalls during the
+ * transfer, the halt is automatically cleared.
+ *
+ * A nonzero @timeout bounds the wait for URB completion, in jiffies.  It
+ * must only be used for transfers which are not part of a SCSI command:
+ * those rely on the command's timeout and abort handling.
  */
-int usb_stor_bulk_transfer_buf(struct us_data *us, unsigned int pipe,
-	void *buf, unsigned int length, unsigned int *act_len)
+int usb_stor_bulk_transfer_buf_timeout(struct us_data *us, unsigned int pipe,
+				       void *buf, unsigned int length,
+				       unsigned int *act_len, int timeout)
 {
 	int result;
 
@@ -392,14 +397,26 @@ int usb_stor_bulk_transfer_buf(struct us_data *us, unsigned int pipe,
 	/* fill and submit the URB */
 	usb_fill_bulk_urb(us->current_urb, us->pusb_dev, pipe, buf, length,
 		      usb_stor_blocking_completion, NULL);
-	result = usb_stor_msg_common(us, 0);
+	result = usb_stor_msg_common(us, timeout);
 
 	/* store the actual length of the data transferred */
 	if (act_len)
 		*act_len = us->current_urb->actual_length;
-	return interpret_urb_result(us, pipe, length, result, 
+	return interpret_urb_result(us, pipe, length, result,
 			us->current_urb->actual_length);
 }
+EXPORT_SYMBOL_GPL(usb_stor_bulk_transfer_buf_timeout);
+
+/*
+ * Same as usb_stor_bulk_transfer_buf_timeout() with an unbounded wait.
+ */
+int usb_stor_bulk_transfer_buf(struct us_data *us, unsigned int pipe,
+			       void *buf, unsigned int length,
+			       unsigned int *act_len)
+{
+	return usb_stor_bulk_transfer_buf_timeout(us, pipe, buf, length,
+			act_len, 0);
+}
 EXPORT_SYMBOL_GPL(usb_stor_bulk_transfer_buf);
 
 /*
diff --git a/drivers/usb/storage/transport.h b/drivers/usb/storage/transport.h
index 74ffd0d7e7b6c..361dbd77f15e3 100644
--- a/drivers/usb/storage/transport.h
+++ b/drivers/usb/storage/transport.h
@@ -77,6 +77,11 @@ extern int usb_stor_clear_halt(struct us_data *us, unsigned int pipe);
 extern int usb_stor_ctrl_transfer(struct us_data *us, unsigned int pipe,
 		u8 request, u8 requesttype, u16 value, u16 index,
 		void *data, u16 size);
+extern int usb_stor_bulk_transfer_buf_timeout(struct us_data *us,
+					      unsigned int pipe, void *buf,
+					      unsigned int length,
+					      unsigned int *act_len,
+					      int timeout);
 extern int usb_stor_bulk_transfer_buf(struct us_data *us, unsigned int pipe,
 		void *buf, unsigned int length, unsigned int *act_len);
 extern int usb_stor_bulk_transfer_sg(struct us_data *us, unsigned int pipe,
-- 
2.25.1

