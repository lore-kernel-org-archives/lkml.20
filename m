Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.156.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187083;
	b=R258yzhSGQEDpZWo8wfLtLDlUQjRNVoURWKHDZqzoXmnn8VqzB3MHgmadFa9gTUgxMoo
	 KGTzSkxNbfWMZICznsNG5ROlz5pQuopvny3KG+y56juMf60CnYkcYC2sdPo6kXn3Ov1FZ
	 AaCRJ7p8EuhIn1C8iI+Q4NszfCJSJiRMOnXqh3Td9sZTnrK7QaV60y2++KbvZkkbPOEiB
	 PR6Gf6ujeh7kIEK43xRdUADczZunmzbUgEAjqghxIN46y4OpglZMcbQkO78iqpqRrJ2d1
	 VBQJBWwVkZV+GSCDiBk3kEc6YKfao8JBNOUFEz3BRbLtLJ6y0GcBB0+ZyKIrD6+X1TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187083;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CMAE-Envelope;
	bh=zrja8EfzhNwVxcvFfot4BI2Qx5xO8+yUBu2o21YSgFo=;
	b=Omthjir8DVLl9trsP6Zm/2b56nLcwUHGMSS59F1DTGIf9RaZYXXWoToLBdUfXQG72nW9
	 kwvDX2aSeqa1I2EGeD49EZnBxyikejlXGyyjBVW4SS8+Rk9sG4SG01zzsyqn6+RH/SKAJ
	 PRtPOiJPjMyh2qfZWpC8uDcFdD2DcgHVZSso6bdDybqWkxEIspEo4nXBtLS1P6j1I45nj
	 AAxUK9DqwsKacgqjzKZwlLtYVDBqV69yi/mVtJbtCWv2KFjdQkR7D7vHwMt6TW+wFJTHy
	 ALI1fFAd5kPFAO9miRwGdOqHi5irvbNu6sDmdqcRVQVq8ysddOvOf9sAPDM5VVzvtRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=NzZZwHyU;
	arc=none smtp.remote-ip=62.149.156.116
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7687F606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 01:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7687F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=NzZZwHyU
Received: from [127.0.0.1] ([87.16.49.252])
	by Aruba SMTP with ESMTPSA
	id QE1AxMsH06VShQE1CxPow6; Mon, 09 Nov 2026 02:17:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1794187074; bh=8fZI2lXxC8ogDCARFPexqgWvoMA8iZm/DndUACcPEas=;
	h=From:Date:Subject:MIME-Version:Content-Type:To;
	b=NzZZwHyUKBQ/BT0pn77ua894gpoCxpfI/fN/MDQuNkuWdaGrBGL7fPZkqLcvwTYYG
	 vl0zfEXEJpSA3NF8NvXuGKzFtc4oaVtYKPVs6ukZZMYis+5K8VjbJNooOxV42QHIwY
	 Tkybt6slwmJaoBG/jO0w7lZbIK8zwQnSGQUmSXrzdZeEdaBXFeLRXQ8/LlqUgxbA5J
	 wBZX9LXYn2HycskQmZimQewkYc/8NRrOrOp5jPyBtDAJ3a3B/9Kq4R9Lc256Fg/sME
	 VTbfxrVcI8sYQDzAweL/yNaVp3QoZQSG5n1b36Sq60Sc8HWJZUBJEh/2VrsdKl7Em4
	 po5wrVYdM4ZPQ==
From: Alessio Ferri <alessio.ferri@mythread.it>
Date: Mon, 09 Nov 2026 02:17:54 +0100
Subject: [PATCH wireless-next v4 04/10] bcma: chipcommon: enable
 asynchronous GPIO interrupts
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-bcma-ac-rev1-v4-4-de1262c18b54@mythread.it>
References: <20261109-bcma-ac-rev1-v4-0-de1262c18b54@mythread.it>
In-Reply-To: <20261109-bcma-ac-rev1-v4-0-de1262c18b54@mythread.it>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Michael Buesch <m@bues.ch>
Cc: vit9696 <vit9696@protonmail.com>, ville+git@takio.fi, egc112@msn.com, 
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Alessio Ferri <alessio.ferri@mythread.it>, 
 b43-dev@lists.infradead.org
X-Mailer: b4 0.15.2
X-CMAE-Envelope: MS4xfA0SHnp7/o1kd6yqNJOwxQ9vhGBL4ANMkZqJ/MlRU6NcbLTLJG6wQLJXR978HuYWEYipWWphXGxbozZm8p1w++CcEwuVs3pTkD1lBJ20cKs7x66LY7ZO
 lPPxLcppsYWEvc99HGnRnIC1KkYsC01OvWhZjoF/A16my8XfcvPZtQinQ6hyBPO/54IZ57QV5xdcM4Cs2fG7IUipQQ3UyGsuZ/zSXSby5FILX0qafbbGO0s2
 lJyGypyqM5VPyry4Ig6v819AhE5kzGniuKo+kLbJqeAtozKB6ffkUgvuCRTaLm7+Q7V+5QN4gE2pGL0AGwffg9h0/VoBw3JAKiZjd3Ipe0WVfCgxB1BOh69R
 MRv+wSUc4/Ab1VnwNi7LQ57g0F53Qbmbk2v4s0EvLv29tM00yMnMLi6zhSQy0jWpm9SrVS847vMEtoc9SHjv6a/bgJBL8cz4NnEs/D2REzNpbRwn1oyKCn3F
 ylYWEYsSklBQcXBVXSj93DAHrMOimmP33IBBzA==

Set CORECTL_ASYNCGPIO on chipcommon rev 21 and later, as Broadcom's
driver does at attach, so that GPIO interrupts are generated without the
backplane clock.

Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>
---
 drivers/bcma/driver_chipcommon.c            | 3 +++
 include/linux/bcma/bcma_driver_chipcommon.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/bcma/driver_chipcommon.c b/drivers/bcma/driver_chipcommon.c
index fd91a39f0..f5e1b5415 100644
--- a/drivers/bcma/driver_chipcommon.c
+++ b/drivers/bcma/driver_chipcommon.c
@@ -227,6 +227,9 @@ void bcma_core_chipcommon_init(struct bcma_drv_cc *cc)
 			((leddc_on << BCMA_CC_GPIOTIMER_ONTIME_SHIFT) |
 			 (leddc_off << BCMA_CC_GPIOTIMER_OFFTIME_SHIFT)));
 	}
+
+	if (cc->core->id.rev >= 21)
+		bcma_cc_set32(cc, BCMA_CC_CORECTL, BCMA_CC_CORECTL_ASYNCGPIO);
 	cc->ticks_per_ms = bcma_chipco_watchdog_ticks_per_ms(cc);
 
 	cc->setup_done = true;
diff --git a/include/linux/bcma/bcma_driver_chipcommon.h b/include/linux/bcma/bcma_driver_chipcommon.h
index 525155658..c7d69d583 100644
--- a/include/linux/bcma/bcma_driver_chipcommon.h
+++ b/include/linux/bcma/bcma_driver_chipcommon.h
@@ -54,6 +54,7 @@
 #define BCMA_CC_CORECTL			0x0008
 #define  BCMA_CC_CORECTL_UARTCLK0	0x00000001	/* Drive UART with internal clock */
 #define	 BCMA_CC_CORECTL_SE		0x00000002	/* sync clk out enable (corerev >= 3) */
+#define  BCMA_CC_CORECTL_ASYNCGPIO	0x00000004	/* GPIO IRQs without backplane clock */
 #define  BCMA_CC_CORECTL_UARTCLKEN	0x00000008	/* UART clock enable (rev >= 21) */
 #define BCMA_CC_BIST			0x000C
 #define BCMA_CC_OTPS			0x0010		/* OTP status */

-- 
2.34.1

