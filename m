Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695652;
	b=dvPCbWfJrvdGfK0XFvi3q/O7E/GkRqPhdil5lNV83JOhhpQRrlBZbSEfh1o8HNn9Po1t
	 qvNLrOjgKG1f11mAzXCsbQaVnN2gte4T/dEEJfJZ8wiueGdfFLs3qbsY/Vdo7YRSFbXCf
	 fS5gbLK4Epmf/74bVAkfH+ehJOk7DnhxPziov2oDg5xIES5U9+kUWfJZ7AvHXLF0IN0Yq
	 BUSULr7gKOkTmprv6bHmJkYN2Qadyy91Bl1ri31cca4P8feogCZ2RkUayubyAAfpsY8y2
	 Z1BdpOeSRCXhFLQInno4prCyekm4EJf06zZulWYWJYHWD96s1ayWy/cetXyWbAEHLag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U4tKXObhoI+fdUM+1l8D4TYSSuaXMy7Ud+cPi9l7w0w=;
	b=RCUh9qlkE7m2LkUjUXN3aDr9K5QEC20JY7AzrW3Bkyv+LVFWJlYY68MvmmRMRDY/Nr77
	 PpdZlZxm8B0Um1GOHAZat3T9uJxov5quX/HYmiV8GHyNC37ubk6HHKhjWURSdlpsRYd/6
	 ji53uQk0+S3hcfmndw0jysQk4ulIR2pP9z91kyRtRqDoijGMZhYnMfNPhni3Fnt2JrH1h
	 rDRLFrGEnLqS4e7AiCZG658tHaeGryfUDocd2aG3thpbtT4A1kRY+idKEDc8lPQdPKDID
	 uPrS8PvjXlL2xeB1demnopaoUpkl1xlR+xLE19QP9l/Kz5rUNtfhKAz7LWbHinb1gZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WeI/PAMh";
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C15C606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C15C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WeI/PAMh
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so1854722a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695652; x=1794300452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U4tKXObhoI+fdUM+1l8D4TYSSuaXMy7Ud+cPi9l7w0w=;
        b=WeI/PAMhpY6ElVATxqJzgVu3Tvz50yNK9Mtvb0jpEhROSFUKak1i9ybMTlBzKA5whc
         H3oJfPliaqhT5UOmk3LO/ZpJ7jbeCP5z5xo4PZO7HB8ogQrBN0ozoiT5gf0Or2bmfAhJ
         y54kdg9c2zPBpztYQ21x1A6cnAQKechI9efPsSFGYmdgmX6n615wxC5JTxtHGkcaAkp6
         Gq1yHGQpIzojAVWYkF6u9oT5W1Lctw5gPpwYUDwPUAi7zKghOiscZSFVSGfPpAWvekYX
         5c/VMOrFzi5Yf1yy3AjkUim90lI715PTUEBDA5BbI+7KOYRSq6UNnLFBLJG6rg7ERn+/
         5H8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695652; x=1794300452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4tKXObhoI+fdUM+1l8D4TYSSuaXMy7Ud+cPi9l7w0w=;
        b=r8xDYiiEjkQI3e2GPzArJ+BJjtFJ3gF3TWoh45flSILuncP8wmpXTEzO9iPam08fqV
         5dlkjDGmFjN17Wz/W8FXCpogQGRMzLb84RyCK6ehWtMUDZGDE564vtdb9hmrHdpqXOmV
         7daQul/HLGiCDwyCDQs0MX79WKl5kRBO+ocX6BA4loqzxZ1knIpxV4hU0LbTwMp9AqNk
         T5sEZiiRf3GUw2DlprTGYmd9NRNegAU2nDyM2rM0AD4/TWPbJOswr3+XXtMwA4zYJL0M
         XHr2OMsQ+8D7NK7JRiV3fRtgT4Ckjex+8ptaJsk7QU8eXE/grF01njj20idg4x/n/cX1
         xXjA==
X-Forwarded-Encrypted: i=1; AKwUvByvFJDKFItzJxxDKohppF9yVHCNZRwxpV77xYav93Qz/znhEN8n/9VzmJHifybWz2N4r0/773BDPuGFYNc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZLFFb7weKjlqJ7nAJzmG+olEn+eLIh//un2sblvA7T2+QYdMi
	Pkc6lMliwF3dfXfNI16jXGgoOPUAopqpAsVBRmjuOiM59jZsp5ezr0Th
X-Gm-Gg: AYBFou3Qckjwzu32qms7cHsdd47l+M0CfULWB1slnH52QXLuZ5ETZOk7tA3RCyrVQRn
	eOSKkLGbcbjvpdnTbSMaRomfPDhmMt8aEm8tCwkBwe9/fQAp5lDaxhrpnEqRwg1sSomSWJhwS3v
	LyNnfqwWFGwb/bbaC7IF0HMke6mzKcDqF/YvpHUfp3yQwEvyyvx6h1Bixnt8qYbnf/WNeGNpquV
	eIdOBS41YmFduTczy23hVTSelTnspOf70Awh/2KVzkAb4prxL+1frQBCc0fWmGsnVTuaiLPpcEE
	r/RIlJQQxtndokewtOmop5I3/l10RfrH0qLq2neAH0NxbQ60isUKtw0bXNypMA95VvdJmcH6NqV
	U1jzcNHyW/AiaA4+UHHvgVvzWNUI37lsUCMqwG+bktJb53Meg285JzkCAWwJZ29hZpfsI35AlGk
	tihV137qluvjtlJpvf8sqIGqVlKXkMAhes/R81qoMztbNTSFZBjp9fVn9xYqNgPCd2Zcsz9k2+F
	LIE97Uh8QTiYgtkg7EPrmVdSgbtHPzOMKWWFJk1jQMWjBj2ga+ZHHpgNDt5R53zWIMq5i2nZsUC
	sFrI5LGqryac71tjgz8uCHL1MQxI2u4yIWAOChkdHX6VwHs+
X-Received: by 2002:a17:90b:2fd0:b0:3ac:af8b:6f3 with SMTP id 98e67ed59e1d1-3ae898149e2mr9319285a91.52.1793695651757;
        Tue, 03 Nov 2026 00:47:31 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm3294725a91.10.2026.11.03.00.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:47:31 -0800 (PST)
From: Li Ximo <lixicaicai@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>
Cc: "S M, Suhan" <Suhan.SM@amd.com>,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2] usb: gadget: udc-xilinx: guard EP0 dequeue against empty queue
Date: Tue,  3 Nov 2026 16:47:22 +0800
Message-Id: <20261103084722.1821982-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Wang Haoran <haoranwangsec@gmail.com>

The EP0 dequeue side, xudc_ep0_out() and xudc_ep0_in(), calls
list_first_entry() on ep0->queue without checking whether a request is
queued, while the enqueue side __xudc_ep0_queue() already guards the
same queue with list_empty() and the non-control endpoint handler
performs the same check before its own list_first_entry().

list_first_entry() never returns NULL on an empty list; it returns the
container_of() of the list head, i.e. a non-NULL wild pointer into the
enclosing struct xusb_ep. Switch both functions to
list_first_entry_or_null() and return early when no request is queued,
making the dequeue side consistent with the rest of the driver.

This is a defensive consistency fix found by static analysis.

Fixes: 1f7c51660034 ("usb: gadget: Add xilinx usb2 device support")
Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Reviewed-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v1: https://lore.kernel.org/r/20261023073131.637062-1-lixicaicai@gmail.com
v2: refactor the commit description as a defensive consistency fix per
Suhan's review (the originally described bus-timing trigger is not
reachable without software first arming a buffer), and add the Fixes
tag. Carry Aldo's Reviewed-by. No code change.

 drivers/usb/gadget/udc/udc-xilinx.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index bef06fe75..032d9f04f 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -1822,7 +1822,9 @@ static void xudc_ep0_out(struct xusb_udc *udc)
 	unsigned int bytes_to_rx;
 	void *buffer;
 
-	req = list_first_entry(&ep0->queue, struct xusb_req, queue);
+	req = list_first_entry_or_null(&ep0->queue, struct xusb_req, queue);
+	if (!req)
+		return;
 
 	switch (udc->setupseqrx) {
 	case STATUS_PHASE:
@@ -1875,7 +1877,10 @@ static void xudc_ep0_in(struct xusb_udc *udc)
 	u8 *ep0rambase;
 	u8 test_mode = le16_to_cpu(udc->setup.wIndex) >> 8;
 
-	req = list_first_entry(&ep0->queue, struct xusb_req, queue);
+	req = list_first_entry_or_null(&ep0->queue, struct xusb_req, queue);
+	if (!req)
+		return;
+
 	bytes_to_tx = req->usb_req.length - req->usb_req.actual;
 
 	switch (udc->setupseqtx) {
-- 
2.30.2
