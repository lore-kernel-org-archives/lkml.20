Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740701;
	b=HsE2Q/ac9A7eA1hT67qUL2cQZNI8IIpVQnyH3OkAURLu4y8aLQ75UCSO8qfeI2JR5uEv
	 kAFJJ395KTL/MdpaR1BU7Tshg3De3Q83/MJdq6cdlcJYpHe57ymVejIbZNfK9e3zOfx8l
	 cf4Ff95Cnb0mZ0p+uOTax6ME+pvR1oQ5gtzQ4R/Jqy/8NPebDcSirxs3F5EoEz3VpqxHC
	 5pb8JDaqUm0ToNIn4z0Ql4raDnu9qvs7bEcqHxcfMV4t1IqMNecNAH8a/cD9VgAjo0P1y
	 H01wMHsAWIkQxUo7MJmzo1RzNRzrb3O/Jb0A2kBu88Vtiyk2RsicnZbJY5ZF9wXXJ+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vqy5QIw1/kas6DX7rXU+qCiDfbpbyVW/9On/rw4UvY0=;
	b=nrQJaUU+pISTv2FgmAkSLCpOt5tvwv6dou+ljcLWGmGO7copmcg3KTl1ZBd6d8X0h9Kj
	 5oji2HPocJYtEALLoYqvPCfkcKSw90je9A+3yS7X+QFlINQsDRkKmbleSYid1QMRPF4ot
	 21KblHqZK+jLp3yvotx9oaoywXNejS0ZrTf9YnKMl2zGlFzEJLcMpyzWCzl7S9sVTmafb
	 45zMvlKOA1idTWHqFDXtIDpbVqaJMxqbhsPWAfD5ECuOXF32pwTM7nRuziLin4C874R8H
	 RwoaZis7lR+S6pSlAw/Rs2duSp9tz/ope/tmBkJ1AwySG4wkg5xVPIW2U6cBiZbXUJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EhnaBkfU;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C80606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55C80606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EhnaBkfU
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ea4f255ba1so1850475ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740701; x=1793345501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vqy5QIw1/kas6DX7rXU+qCiDfbpbyVW/9On/rw4UvY0=;
        b=EhnaBkfUxu2a2jxX+TtWEz+UgIZ7+ZyB0oJNNgr68myThRbWH31oPmFPeN3lhqCGwl
         VG3aJXlTqaK37+5XOu3lzKUSL/PelZFY2AwlBWZ5x1ynFFNvre6vQyVByO55Rcz7QK0+
         j9z6Hq7WqyATfPmr+FmfH935aLKefYrGSuLgiYl0gUh9uqegq7l4sOSadVk4JMiaicGI
         1slIm6tYKkE78bH3oQy42Zar6fs91KXmeCb6GiOIjfol9AR30BhoN0RcVH0qbWp12vv0
         dX79EEYD4ZJtEbRShO3hjV+izmmOwetrp98TryFECNtuSWa4oZ6Hvunub6N76lTemDJe
         N5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740701; x=1793345501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vqy5QIw1/kas6DX7rXU+qCiDfbpbyVW/9On/rw4UvY0=;
        b=1QYKwgEpBJppaaqJCS1/NWe/TZxVJ+3HLpZXNFwOARbW8T67YquHEZPYoap8ZmFpi+
         K/0iOqbPS1IfBrotwRlpoKHBlKEBPhiXG8kWNMjJ2In+OUn4hAiHj7CafqOkZl84ZJy4
         0p3vB5QCmrlAILoqILPt116dNO1sn5/XPWrjvviQVQSRYhfyNPcajpBPcLtd52g9v7O7
         AtdDRxTtfLTkV/VcWrBz/gSHiBd7df/5DETyeffrGlds8b89mbrM8QZU8mHRQQiGeaBf
         qqvmIFv0yGYbjzA5sjYZR+api67U5vM6luBzCVFaEcmWgLoNodr18QHrSIF72VJ859os
         /tlA==
X-Forwarded-Encrypted: i=1; AKwUvBzxjIY7+pfixV27XNt72CFXDGSpop1eDMQ07t6uLjjsElgaR2UAxtHBtI1oVqYe9N1u/GbAkSr+o2c/hFE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/nyifpH+bHc2aIF6rS3Q+ieLA2ku9B83llqoDLk7lfIZCttPy
	Y/Az6ptXbSaSJ3XdXv3UNchemr8cHq0z8TwbjlG7PxW2awxlARjGTAgA
X-Gm-Gg: AYBFou1KG0BrsPAYv3NQQTniJTEjCMZNjObHNFKrWbDzN5GfILLONS1xLWWVAaQBbqu
	TqRLiziKqTmXHhySXC4XLicQqARhe1kQS7GGcIYAMTGMpfQmy9VFt9P8mO3A+ZDe3bMhOUQCzJp
	m4eYKCO+WBQbQPbms2s6Qjdy3cR0uwFkHv7nHH36XWLlEqKaZivgTzIpEA661upjThGKK4LZcDv
	hk5z3JF5AZZZLGHGAXW/k6Soih3YNvmrqOa3IH9KYkFmFwly9ipH93yg4kdpQKQYlHFGMmHhc6Q
	Lkf72DMlPjqXGKwqqDy7FgVGCWMksB3k6yD5viNQBCSFSD/cX+hHRlRXdKg59aVowTfCRBcblR3
	o4iXv1hgGg2tFwuZpHUn3z6FEd4Ow2xuvkozXnvWtRo3gUm/V90eXGnDGY6p+Yll42RFKuSyD4g
	rrgDCR617fs6qG+lw25gDabyz6ZxoHAHGltVY14MP29jdFqfH0WFOpCOiDr7lwNSLbJr+QZue4F
	MynAyAuj+7CIfuf20oXBS1YONFMgAQJmcPzuANjaouCXWl5YyBU7pYOXy+vX+k9xYvnF/PPwvcG
X-Received: by 2002:a17:903:190d:b0:2e9:9263:a6b with SMTP id d9443c01a7336-2ea7c33245emr14654155ad.40.1792740700661;
        Fri, 23 Oct 2026 00:31:40 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7af6eed2sm6766545ad.7.2026.10.23.00.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:31:40 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] usb: gadget: udc-xilinx: Fix wild pointer dereference on empty EP0 queue
Date: Fri, 23 Oct 2026 15:31:31 +0800
Message-Id: <20261023073131.637062-1-lixicaicai@gmail.com>
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

list_first_entry() does not return NULL when the list is empty; it
returns the result of container_of() on the list head, i.e. a non-NULL
wild pointer pointing into the enclosing struct xusb_ep rather than to
a valid request. This was found by code audit.

xudc_ep0_out() and xudc_ep0_in() are reached from the endpoint 0
interrupt handler xudc_ctrl_ep_handler() purely based on the hardware
FIFO status bits, without checking whether ep0->queue actually holds a
request. The queue can be empty at that point: the gadget driver's
setup() callback may not queue a request for every control transfer
stage, and xudc_done() removes the request once it completes, after
which bus timing can raise another FIFO ready/free interrupt. The
unconditional list_first_entry() then yields a wild pointer, and the
subsequent accesses to req->usb_req.actual, req->usb_req.buf and
req->usb_req.length read or write unrelated kernel memory, leading to
memory corruption or a crash. On real hardware this is triggerable by
an external USB host controlling the token timing. Note that the
enqueue side __xudc_ep0_queue() already guards the same queue with
list_empty(), which shows the queue can legitimately be empty; the
dequeue side was simply missing the symmetric check.

Switch both functions to list_first_entry_or_null() and return early
when no request is queued, mirroring the existing list_empty() guard
on the enqueue side.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
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

