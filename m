Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474388;
	b=qtMlHbYug7D4vpSeAO7bqTY9+kppU76iLTL1b5iaxPwt5+6quBavKw6VvXxThnZ3bE8N
	 BzFROJXcJxMakKSHK62NT5hPYK98JXW+aeojCoLEJQovSLVKxtt8OH5bNhaeIMw8wHbiu
	 3XlKMS8ELalGdjaCN6SuADH6Zv4ZxBtpFn6NuIn/UeWQplYgJJeTl4HyQH1gMRgOWCSIX
	 vjlLWKNJqm3VW+uc4nMJKZAIwMT875/Dq65WvAQ1o8FAXFgEUYm9UGzScwKexPryDs8c2
	 u240vIr046qgPOOnaxYLzg7I25hPoVN2HnOLr04NfpCfyPsrDGBu13FxtCl/pFoiW5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474388;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=7ylTJIoUhHVMU8cJQZ1aoxNGoOowuGM0KzaGzXyZsw4=;
	b=nGC/g9OHxp1gdApnIS0ilo620x19qHQ1TE7cBH1bfFCQ5063tegWfQyKgxlKbbT4mXnb
	 22vlzmtZDPPPnim+1geFQ9vSJHbYF1rWGzlYNA+V4uNS8rp6PR+x90bZl/p9fiNx6Zy+i
	 zw+gw38QraYpfb5xkAbkbZbYzB0b5sKnrokkKLnZ+kUw2mIZxXGVRhEoWks0MhJwSQ78/
	 jIx9fsRIL+MKoYlgwot/LuJjsQ0m/v7Nu9byyh+Dr1GEcyXM6bvnckicZK9OuUXiBCsA0
	 7/ZJMemsnAwO2/3oLarSkz6ai4mSG7MZ2UxqTbfRaWtLhvkiBwoR2pSHNZ10tKmqzdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fNiog8Bo;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A032606A88B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A032606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fNiog8Bo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=7y
	lTJIoUhHVMU8cJQZ1aoxNGoOowuGM0KzaGzXyZsw4=; b=fNiog8BoT/rt8I4dZC
	ZE3mrMdQAxE2D8mZGTrCdTD8kA7exacgUqm3U1ToPs3fERLI3zVoFpRZHyl+FLfX
	iEee3I2kTDB7HE4wvHG81TdDS3eabCcWFOrsqctFaYW11C9djxu2zVZ1/epwpoOB
	tE3JGYdMu8xyXvNuXFwVnxdDw=
Received: from LUOBO-DINQG8T.hobot.cc (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgAnVXligfVqmIGYEw--.39291S2;
	Thu, 12 Nov 2026 17:05:40 +0800 (CST)
From: Rui Wang <wr574332525@163.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] i3c: dw: Prevent premature transfer completion on IBI
Date: Thu, 12 Nov 2026 17:05:38 +0800
Message-ID: <20261112090538.1917-1-wr574332525@163.com>
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
X-CM-TRANSID:PCgvCgAnVXligfVqmIGYEw--.39291S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF1rWFWDWFWfGry8ur45ZFb_yoW8Cr1Up3
	y8K39Ykw48GF429F4DWa10va4fX3W5KrWakws5KwnxurWDJ3WYvF12kFy0qF4xWFWxZ3W0
	vr45t3yUuws8ZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbkucUUUUU=
X-CM-SenderInfo: lzuvlkittskjqv6rljoofrz/xtbC0wSRKmr1gWQkBQAA33

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
Signed-off-by: Rui Wang <wr574332525@163.com>
---
Changes in v2
- Use Rui Wang in the author and sign-off fields.

The possible queue stall reported by Sashiko is in the timeout recovery
path and predates this patch. If I can reproduce it, I'll send a
separate fix.

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

