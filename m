Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472908;
	b=xv6/PKSwyVTfIvUSMkDqodIoNzrCg0gwJ9cqpLK+auLhuWsN2Dm8rpU4MZsuMNz2+zZX
	 HSFNd39U4bufIAEVwavrcF6Qk2nYpEtJHFs+hiR1libszR9KRXNofwKHxcCkZRL15o/yR
	 rm6SEPtU48aHy4w0B21GotNVxCOV+hJ1aRKXL7BsrvfiK9M8XcOUpSuvDzNjANxUO3/nh
	 KisgjhJCJzNBvlYV0fd4EBeoV90dAF2uVM743YAZeIckPdJ/yJ+l4WMAelaBZOrh2tJlX
	 4dnI7tQYfWdlgkgmK/mrUb9L3M5rqPvYglg6XdfD95xvhH/3m6rHD7rWP0KzZhAn3QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472908;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=eRXYdPEJrt01azKgswlYdvVqc+Ae2UXCVEOtqPjXV2Y=;
	b=MAE7P3vWEVz7T5Kn4ROxUX6xGPFzHUyKkMJOjHp0mI/imwgdjXeKQheVWRJiwJmwEpeP
	 +hErGb7frVSe42aD/JXJgd2usG2LA3BqvQ9EIuLH6eH9YchdNsLa4ZUKGByeDCjhTjC3Y
	 2yItIGpKS/pEUjwgBUHsVrGUvU6HRxsEG0+vj/5wiCaIn29n586cVk7H+p+cG4aIKnOnD
	 lX60oAckWxMFDJSQykneFzWuTSW0/0bHnefOqRmYXMu3X+H0IFWj8B/RR/Zd2k/XYHFSs
	 k9T1OI7IR51n8T329JZL9IR3d/tRoTnr5309Lx7bQrrsHtMRLzFiLVZ2zZCZrs8GzGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=n0vVDvgV;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE7F606A8A0
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE7F606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=n0vVDvgV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=eR
	XYdPEJrt01azKgswlYdvVqc+Ae2UXCVEOtqPjXV2Y=; b=n0vVDvgV/gjvsCMH+P
	viVnOWbBUzkdJI9et9Hvj5OhMftD/Ss5U8KDjiNT5ZXPI4vmoPh4GlLceNyyHLFJ
	NCeKOMh+Xlr/mBs1IKDgMj/IDIISG1zk/CDn9Jj5O5XSx6SlvgpxhhnvuPrLK7X9
	XApdBhCqOsjYuAQHuLop3aDvA=
Received: from LUOBO-DINQG8T.hobot.cc (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD31xyYe_VqV+UIGw--.58885S2;
	Thu, 12 Nov 2026 16:40:58 +0800 (CST)
From: "rui05.wang" <wr574332525@163.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: dw: Prevent premature transfer completion on IBI
Date: Thu, 12 Nov 2026 16:40:56 +0800
Message-ID: <20261112084056.1147-1-wr574332525@163.com>
X-Mailer: git-send-email 2.53.0.windows.2
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
X-CM-TRANSID:_____wD31xyYe_VqV+UIGw--.58885S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF1rWFWDWFWfGry8ur45ZFb_yoW8WryDp3
	y8K3yFkr48GF429F4UGa1Yva4fX3W5Kryakw4kKwnxurWDJ3WYvF12kFy0qF1xXFWxZ3W0
	vr45t3yUuws8ZrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbUUUUUUUU=
X-CM-SenderInfo: lzuvlkittskjqv6rljoofrz/xtbC9hodtWr1e5p5ZQAA3m

An IBI threshold interrupt can arrive while a transfer is pending and
before its command responses are ready. The IRQ handler calls
dw_i3c_master_end_xfer_locked() even for an IBI-only interrupt. If the
response queue is empty, the function completes the transfer with a
return value of zero. Later responses can remain unconsumed and keep the
response-ready interrupt asserted.

Only call the transfer completion handler when INTR_MASTER_MASK
indicates that responses are ready or a transfer error has occurred.
An IBI-only interrupt leaves the transfer pending.

The fix was tested successfully on FPGA hardware.

Fixes: e389b1d72a624 ("i3c: dw: Add support for in-band interrupts")
Signed-off-by: rui05.wang <wr574332525@163.com>
---
 drivers/i3c/master/dw-i3c-master.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 34aa8f8..19735ec 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1527,7 +1527,8 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
 	}
 
 	spin_lock(&master->xferqueue.lock);
-	dw_i3c_master_end_xfer_locked(master, status);
+	if (status & INTR_MASTER_MASK)
+		dw_i3c_master_end_xfer_locked(master, status);
 	if (status & INTR_TRANSFER_ERR_STAT)
 		writel(INTR_TRANSFER_ERR_STAT, master->regs + INTR_STATUS);
 	spin_unlock(&master->xferqueue.lock);

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0.windows.2

