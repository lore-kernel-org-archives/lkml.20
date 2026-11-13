Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794543607;
	b=MTUFeNZCDIoifXVAkMB0iVTBR/CQJkhwXJWaOKOXAgKplmWzL4X+W0vmjh7S8/t2SRI8
	 D25zSi2VxUhM7aZrYi5HDBLYJOKe1US1GMNzuAL+hwcE5nPkedgIJNEHBODaJ3Z0WbZFQ
	 5SU++GOW2e7e+kYmY4oiaeTfn8nNNp6KWT75DoXnRh1z6lGOVuVgm/DQL0cfb1sdqAGF/
	 FwyAYU1klIoOT+Kvls4byyTnhfTkfAzRsZyCcMdJp8K7e0b9kdPEUIR/H0G2yl4wzn94c
	 hDNaKe8TRlAE20xJep+zsP2vpS5uwzsQR3G03oo1ABvs/77ab9Zw8HIL1boMMKkN78w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794543607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 Message-ID:Subject:From:To:Cc:Content-Type;
	bh=dYyr6kASLUC/BUfTOqaEjVuuLM5YzVSIiMSIdWbr0Xo=;
	b=1jYog7NknYRvajrB69ISRpkEf790B6qWOJ59EQLFAm3Tdi4+QmZKnXZS+cwdT2dT2UjP
	 f3VylmGqRwd55l9gUFVWFZ3QSwX74jq5DnECTLBtlAzaZj7e+crHRGBL2TC/v2DcL5w1b
	 mcOK3tUBfrOBGl7srNjYcjb18ZVlCbPM8n6x5kKbRf7thaJ8ds1mbW9DIPdZVDRs/8N9k
	 cN6kcNSy5qlm9bIPa2VUy4NW4jXA5TjeUm0WeA8Ezawhcf01cckBPG8AIWRcX1cwEVrn4
	 Ykpaf/i3uUfVaBuSk4Y7pOTNo+srrIXvNLgWAsDlvJ5hCAWsozvEjDjHOGRbXpguGyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rickyniu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DvFdHR7w;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48BF606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B48BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rickyniu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DvFdHR7w
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e8e16d22d8so10191825ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794543606; x=1795148406; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dYyr6kASLUC/BUfTOqaEjVuuLM5YzVSIiMSIdWbr0Xo=;
        b=DvFdHR7wF5OPmGnkgRHeJm+Fetrr9YhAoKZRNghdtZBLBWDE/1aZXq4tRCYmiZfo5W
         qUvuodEuRLLyqnjPAcYVpA8rprEaKlGnkCtTUtR9BC1AJcshvyHcjzLJ8WGrNdGeXGVU
         oxD1Sc78PXLk6m/kSrYGk1IB1PvEI369qjs0+WCFQ62I7NGPEpPKk3Cj4tDdifNXVYMe
         SqMCk6nPkholguWDteciZz4mKf7lbLG/cIy8iLY3k8TMMDFw+Jbzd2OqnNYXMOnV+n/L
         l8hRcDZNJBWNilbJn+ZseGAgjEvf3fSJ1hqBb64PxWMHA0QQxzwlOFNjZe0WlMQegCuV
         toug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794543606; x=1795148406;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dYyr6kASLUC/BUfTOqaEjVuuLM5YzVSIiMSIdWbr0Xo=;
        b=pbOa1HPrLO+WoTb8BZKbeT5BMQYTE1n7DvHQiK6KEuJR/Az0xvvnys5L+lWrdxlD42
         NR9bP17LWiI6YKxgLKW4nSKUh2DNqar+zw3EFmnLXABjEYnh2uSvl587o5nWUYUWEO2e
         5qEVE/0IKJdAlxkDII7NsA4qDUGPeXzOdzRIQGuFKjHPlbHQtOi1isIOq9ii5/LtgTeR
         xpvWKBLcCri9hRR4E5isTC5Yy1k/eww465awXDgsvEybtqqWMEjm+TxZNYi6EhQ2GStK
         4iy+xDZRB5YRVqOOhYS/9jgUA0/D88bxjkGi5hVbvsqrKzOQr7BMDRiCI6bfe+PGUKfB
         LHmw==
X-Forwarded-Encrypted: i=1; AL+hErH/0gE3DCIZT3x59Z30pfhlY9yO/q9q3Jaz8Q9Lnsw0TqRoyNeT4R6fo+/zWKN/rLSqm8wrVDtcC03vDCU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/k3vz8o1n55wHZz8u1iDuFvOFe39qTJOmdfFXoFy2tX/D6BlOY
	5ZATpNvZUjVUeommVGzxl7PB7EgSpqa25hTaUV3s17If420GRn5LzGlTKPhbZlkvE3y0ofjq4pc
	LbsIlbWBBWfYbCw==
X-Received: from pla14.prod.google.com ([2002:a17:902:ffce:b0:2ea:7f9c:2ce])
 (user=rickyniu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ccc4:b0:2ed:118e:7faa with SMTP id d9443c01a7336-2ee0de19c7cmr12354605ad.37.1794543605590;
 Thu, 12 Nov 2026 20:20:05 -0800 (PST)
Date: Fri, 13 Nov 2026 04:02:37 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Message-ID: <20261113041948.1280304-1-rickyniu@google.com>
Subject: [PATCH 0/2] usb: Fix giveback_urb_bh deadlock on URB dequeue
From: Chien Kun Niu <rickyniu@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chien Kun Niu <rickyniu@google.com>
Content-Type: text/plain; charset="UTF-8"

We hit a CPU hardlockup during reboot while usbnet was unlinking
queued RX URBs on a halted xHCI controller.

In xhci_urb_dequeue(), the err_giveback path releases xhci->lock and
restores interrupts before calling usb_hcd_giveback_urb(). Because
usb_hcd_giveback_urb() takes bh->lock with plain spin_lock(), an
interrupt arriving on the same CPU can deadlock on bh->lock either in
usb_hcd_irq() or when softirq runs usb_giveback_urb_bh().

Patch 1 switches usb_hcd_giveback_urb() to spin_lock_irqsave() since
bh->lock is also acquired in hardirq and BH contexts.

Patch 2 keeps xhci->lock held across usb_hcd_giveback_urb() in
xhci_urb_dequeue(), matching xhci_giveback_urb_in_irq() and keeping
per-endpoint URB giveback ordering serialized.

The two patches are independent and can be applied in either order.

Chien Kun Niu (2):
  usb: core: hcd: Disable IRQs when taking bh->lock
  xhci: Give back URB under lock in xhci_urb_dequeue()

 drivers/usb/core/hcd.c  | 5 +++--
 drivers/usb/host/xhci.c | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)


base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.56.0.567.gdb80ae8cd5-goog
