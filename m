Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C183655E4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291076; cv=none; b=pi4SkPf97+7I3DrWPJq+54QVH6bYF0R5Q2mmdmeUkE4jtNnAXe23KBqO98Dbr6VyVl39w6bP5OsknebTh1L0b0bfZaT8TiI4IRAqJdl+vChl6nXdjkmTEN+TD2Qm27W3BOJytO7fA/BIjiseFzC7hfBstvy5sXdndUC0UIlqM9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291076; c=relaxed/simple;
	bh=hpI/+dMWdbQELuJ+OW8AyUJGjGTY/aQ6ws4VVcNySk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOWMoHyL8rrvxq4L87qJfjvWAlK3d3IVaxtQaItbX66hUgzvtJrHMdQvec54NVnNM5CVjE9bBJBcLzlErlK1yfJ7WyKlUy06JXsBazLYMpwPyxgow3mHBqIAgfhmfrKbXy8c5KJYleC11kMQYTL5oS8qVDgNr/+qxGQPAxkzeFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2k+ldwn; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2k+ldwn"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48436251906so327970f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788291073; x=1788895873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tnnNmIUeZLo5AF/NInIz9CfUDkQ43y3yeC2yfkSkWEM=;
        b=B2k+ldwn5iCYtML7YoSzHNSVLCyGC3oLcUdNiuh2mu0FIJwx1+OsT52uHf/1pLb7L1
         vSpOfGSC3mgnS5KrsnLaSbQMEoqQW8htBJQUam230dzM4DDfJcomacoHsej/DlPqjsND
         l7wGmCRF8eqGToyMOQT6njdZYcwN421TKLJdXT7TIDKPBxyKyuEwwV2+gB2+4QW2DWOw
         UWsbm1Y/EdFHuU5Nl1r4eBoqFJdvLXP9eAJmYoD3wHk78LZbylVf+i0ctWUbjgL41sl6
         ywbz6kU555GfjaYKg5DZOm++uFPBNUccvk1azgBOkc/UKUcBoe76gJrUWSi/7QwXFXN3
         4jHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291073; x=1788895873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tnnNmIUeZLo5AF/NInIz9CfUDkQ43y3yeC2yfkSkWEM=;
        b=iZcXDzjvFcYjOKo6/KkS5tOuHpYzqdESHkEV+30lSwPBEcJvNYQKT41Kv4jMyOmk4T
         nzrQFdfdz0BYNov79Y+KiFBUe7d3bNrh1fBuOYgs2n/P6dKgms1Ck5MJpakvjFuIDg2N
         0HIweES5hQS3YWBCDE8bOOqU2f1UOO4lD8WojuwZFo9V+TxOuPUr8Hn724je/1uTofT2
         zA1WB7ZrxLUc9iXmTk05guAuIIY1qsg1MRkcQqYxggmD4V3vWx/tyTz2CduX8Nt6qMu5
         I7I2Wk3zHjaHYsx/q+SiRBcijgB1pjXpv8i/VOf5IzEJBLUi1FwG0SK5nFEgCrF3Rvwa
         xKjw==
X-Forwarded-Encrypted: i=1; AKwUvBxLTXcBHU8rVpRpiTLteMrSZ8835VnToEJjda0qZzyWE3JykKf/lbgqzUxiLvIlgqXJoOu2t8Lg0EjFlho=@vger.kernel.org
X-Gm-Message-State: AFuF++kI8r/5HraAYV/8aD1hPX+XYLdulYBr75UJMGz0mjGkRMNExKtR
	HzsSYLXUaYEG4+d9po4v3IOMWdrTdv08ZYMjRcRtqlXy0A1LF0zgLFVB
X-Gm-Gg: AYBFou1S1TUq8tkDLGhPhybAmAQ7CTofr+bOd/QIXMLkMQJXNbzEdSi+4ok4BPk03GI
	a43M5UPWr4V7SeivBnmbfGIoSmqS3OxgOBnFWjs3HhhHkLnObYgCDjAn9l7c28VbMv2PrI75V00
	v6mxWLoRdoBcJ98JkkL3bc9vz9lJJGsy73anqQVKHgGn0EhIrtGwiN2SqIra8nKJ01CjdPg1aN/
	A8bqtNV8eEdVxCMT2s9JlMBMzD7HI9d4tqacH0diVpGsJauOpMkoQbGuJWoSCygGnf4ZcPTX9RD
	tgUxLCxMxyAo0o3nAR92DECU7QfwcvzFz/4Rz4cx35/UU5shJjEjwXcm2kPDqQNV7dSc6JAZNYc
	WJirtB75me4CKXZ2I+PEjg2POWuwFzNZS2WC5+oq/cEnCvR8RIn2uw/46Q9kQorNa6Ii5xarEEO
	mF1GPHU3ADUkZr6tEXn6jhzByfUHZJyzLtXoXHX4yjnPnfO/LZycmhBB9RYW9BHBlasN9BZkP56
	DABgaidU78qWtxkN8WNgqtBAnBJHzyuDcB/tP5s3poo7Ir7FFcVKMFuo1C7fudk8GWAVi3WhWkn
	gMxmtw==
X-Received: by 2002:a05:6000:46cb:b0:47d:ee9d:90c8 with SMTP id ffacd0b85a97d-48440fcda0fmr16556741f8f.3.1788291073333;
        Tue, 01 Sep 2026 12:31:13 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e7315bsm1113106f8f.7.2026.09.01.12.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:31:11 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] usb: octeon-hcd: fail the probe when the USB core does not respond
Date: Tue,  1 Sep 2026 19:30:28 +0000
Message-ID: <20260901193100.1352110-2-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901193100.1352110-1-orgads@gmail.com>
References: <20260827175703.1549-1-orgads@gmail.com>
 <20260901193100.1352110-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the USBN clock/PHY setup did not actually bring the core up (wrong
board reference-clock configuration, for instance), every USBC CSR
reads as all-ones and initialization marches on programming garbage,
ending in timeouts or a wedge deep in the FIFO flush.

Read GHWCFG3 - a hardwired configuration register that can be neither
0 nor all-ones on a live core - right before core initialization, and
give up cleanly if the core is not answering.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---

v2: no code change; added the Assisted-by tag for the AI assistance used
    (Documentation/process/coding-assistants.rst).

diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -853,6 +853,14 @@
 	 *    USBC_GAHBCFG[PTXFEMPLVL]
 	 *    Global interrupt mask, USBC_GAHBCFG[GLBLINTRMSK] = 1
 	 */
+	usbcx_gahbcfg.u32 = cvmx_usb_read_csr32(usb,
+						CVMX_USBCX_GHWCFG3(usb->index));
+	if (usbcx_gahbcfg.u32 == 0xffffffff || usbcx_gahbcfg.u32 == 0) {
+		dev_err(dev, "USB core is not responding (GHWCFG3=0x%08x)\n",
+			usbcx_gahbcfg.u32);
+		return -ENODEV;
+	}
+
 	usbcx_gahbcfg.u32 = 0;
 	usbcx_gahbcfg.s.dmaen = !(usb->init_flags &
 				  CVMX_USB_INITIALIZE_FLAGS_NO_DMA);
-- 
2.47.0
