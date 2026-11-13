Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794547706;
	b=5J6wG8138NgrJ+Rtzli52ycWTOs/Q8/86DJsl6icOKzg0NV8nPVtw5vBWRHnkTuJJwQs
	 e1weSaq8LX+W8zxg5MWi6WJZABr4uC8USaOwekwgxXjLpNogBeKYuVcsyI+5DEaJqXIAE
	 PGtMV0/OYUyVmJhJYku7JJo5FI2TWFvAlmJnJbWvcrsoHkSZ9Z3TtCmOjwx5bPHeyVvsZ
	 gA2nfFfv/T/aTh3pjGJ3rkLhpGi3AyhYxPdfqGp3Bqcb4LYFjrC3P65MUxp6++PKpbCY6
	 3ttPDU/OPTpU2NX5edJiI5WQS6InBNtYn0GURe183DKxDmVbZfVDDaSwaEwuHMLq3xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547706;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=cqeUZDKASaczhIXZLCB0TEXhtB+A7gj3n3l57g855N8=;
	b=kdNdezytdPWM+y1/K1vQ606sXd5mPmzu85yFXdtH5qkZyKmUfPBQ9bzAfyxlF3w9Kkbz
	 lIDZDL8nDEIyBdfjQA3ITkjRRJnaXjbxfqPgaH6Rdjwl381UQDhrOFT7pxz/y4G+6/xO3
	 QVcxGNdwBMwJX8MiZ35FxUAeciyEJi4jr3zG0IqToLJ2hcI9RKGstJ7ZFyCcDn19BYUKT
	 WbWtfNeTNCnOgvTep/AS/42MNu6/QgfOWkBClJI7Pqs5z0kPOYIjxP8jXHaTM2un9AqdQ
	 9nb+Wh26idCOYpz7uR48qjL9/xzIVJcjAC6ouy8zJYC2IaXdpNWfLnjSrEDjVbjSUEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=GZqjtZns;
	arc=none smtp.remote-ip=54.254.200.128
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC27606A31C;
	Fri, 13 Nov 2026 05:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEC27606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=GZqjtZns
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1794547676;
	bh=cqeUZDKASaczhIXZLCB0TEXhtB+A7gj3n3l57g855N8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=GZqjtZnsonl5s9oUVQF+4x+72rqd8cpi7DLONAAfLsfGwyKc+7kUD8psIvR5KvdUj
	 Ntk1Sc/yxkk7xpjsd00LggMMW+3LOwo7EY9BI7haYyDK80qF6H92fz7DXS0LKmO2Rj
	 rw+qf1VM5h8AwEf16xcZ7MQ1tkFkXgL9WatRyRe8=
X-QQ-mid: zesmtpsz8t1794547662ta86139ba
X-QQ-Originating-IP: cNYf+E+YWAajSD+0Aud+jwDTYgxDR1pyX5ZTg8DzUQQ=
Received: from PEC004119 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Nov 2026 13:27:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16882870533920003161
EX-QQ-RecipientCnt: 5
From: Haowen Tu <tuhaowen@uniontech.com>
To: johan@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haowen Tu <tuhaowen@uniontech.com>
Subject: [PATCH] USB: serial: oti6858: restart polling after TX allocation failure
Date: Fri, 13 Nov 2026 13:27:38 +0800
Message-ID: <2274A9F7B5D45D06+20261113052738.1479779-1-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.50.1
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OMQrLjQu6P6m4wwZQP27emlNuWKg+oZnEwraSHhZhG718BuOK/Rdb/W5
	tioHBGOm5zOdbqAd59sSkuMFGnqW9EU0lEWSU9BO8IQIAefTOaxaceIYuieolp6g8VXSU7o
	t9ypNxKaA8MveYjYsEo/AV0v3qBo1WtW8ErlcGqxTb4zSQXpItBYqyYyaeGUa2VTOorYzly
	2x4ppgrAnIp2Tysn25RL6zi1SJ0og0v3hhtZSYeW1aHOqqaaZAzsrWF2Rbxka2wjuZ6huXJ
	rGBk14KmXVRcL9QKEx2wYkp+d9UMQHmDUz+Gj9Z9x9XO+1ZmRihaTYCzqRDBafGv8PxtfKN
	VbtpNOVDLjqpx3liwXazUdTw179cInNh/Jbn83q6rFaoSpgYx592ot/cNpQqU5TgXSXFJnf
	0aCQ/0aC+adBPZdmufMkPydQcfwPNZllv8VptjG6smEbh1je4ppuETyZNvO/l8d/P9mDSoV
	s8mgZbhDuq4cyPuTrcMXRc8QAS55GZQjF3XTyW6AuMJ55IUbDE11swuZBeklDngwQ02+wiQ
	rvtT7aM9PNg4Becgk1jOzHXcK4/sn4SI6I4r3gmQJmSCbO4Iap2Wu1WEb638FEsd1bKQtA5
	Pv5ojjS3rjj2Tza3BpD1PcbLGRyXN1qEP6JBALa+IipbUy9vY5hOchfj2z9XuJZ0t0tv6zV
	zRMBH5VMKXSh23Oc3BgmFt+JX+qRW0AcKmj/5vlq/DT0MXkDJI9Lxe98QGWHviz/FRH0hJU
	uvjHEibmpC9Qf3mK5h3af5uwo3x/gMV1WDemTBZ5NZhKAFkM0iuvC+ar7QP6r6DSwPE2LNx
	W7fwCleIL75UFqeEe8DJOcIo35y0H+IpKquNTkWzx52WJxcOnTpLOWc2mjGHGaJ1/JLSI0v
	CHQkdUWEXuw0zvlrstqKYZbALA1AeX97vG5Q8gMCJ7q3N1eWJrq03EdFMwrkr1q0M7h9VfQ
	TeUyo7vFu45pt332raXDpUi3ZD9Zs/Ti87SMtQs6JpQYGApoPJWyNa955oddYvY3492Z1c9
	rK5mMVBvOYHJjs9xcqb4tvHsDnQj5ALgAoTOf6aQ==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

The status interrupt callback stops polling when it schedules send_data().
The work function then sets write_urb_in_use before allocating a one-byte
buffer for the transmit-buffer query. If that allocation fails, it returns
without clearing the flag or resubmitting the status interrupt URB. With
no write URB submitted either, nothing restarts polling and queued data
can no longer make progress.

Use usb_control_msg_recv() to manage the DMA-safe query buffer. Allocation
failures then follow the existing control-transfer error path, which
leaves the FIFO untouched, clears write_urb_in_use and restarts polling.
Adjust the return-value check for the helper's zero-on-success convention.

Fixes: d2126326bd71 ("USB: oti6858: fix DMA buffer on stack")
Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
---
 drivers/usb/serial/oti6858.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/serial/oti6858.c b/drivers/usb/serial/oti6858.c
index c6364e8ff71f..917bc68c0f3a 100644
--- a/drivers/usb/serial/oti6858.c
+++ b/drivers/usb/serial/oti6858.c
@@ -261,7 +261,7 @@ static void send_data(struct work_struct *work)
 	struct usb_serial_port *port = priv->port;
 	int count = 0, result;
 	unsigned long flags;
-	u8 *allow;
+	u8 allow;
 
 	spin_lock_irqsave(&priv->lock, flags);
 	if (priv->flags.write_urb_in_use) {
@@ -281,18 +281,13 @@ static void send_data(struct work_struct *work)
 		count = port->bulk_out_size;
 
 	if (count != 0) {
-		allow = kmalloc(1, GFP_KERNEL);
-		if (!allow)
-			return;
-
-		result = usb_control_msg(port->serial->dev,
-				usb_rcvctrlpipe(port->serial->dev, 0),
-				OTI6858_REQ_T_CHECK_TXBUFF,
-				OTI6858_REQ_CHECK_TXBUFF,
-				count, 0, allow, 1, 100);
-		if (result != 1 || *allow != 0)
+		result = usb_control_msg_recv(port->serial->dev, 0,
+					      OTI6858_REQ_T_CHECK_TXBUFF,
+					      OTI6858_REQ_CHECK_TXBUFF,
+					      count, 0, &allow, sizeof(allow), 100,
+					      GFP_KERNEL);
+		if (result || allow != 0)
 			count = 0;
-		kfree(allow);
 	}
 
 	if (count == 0) {
-- 
2.50.1

