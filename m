Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113090;
	b=GqIgkRiiwTv/eFSVlt8owMo/uF1UQq5eLAWSA9B8whSVOzX9MzpMIBv7Odsc+3bnB77+
	 ICFOwdgyFHyrAP4RmyBIfVfFWmkTxcmSsETXCCMV+SS3rQXpZQzPWS0iovT66ebV8PVN9
	 T2yNnhee+L2Ju2/f3Oh53a3DVIWt3R38wXxnI91PO+UkiaxUZuiKXQbrXWuT40rv4ipRD
	 kZl296wdnZXswL1eTHJGPIRZecXg2ApMeoa+GF7ik+2s4j3aqG2UcAz+Ej8KZuY9yRs1U
	 HHmWybva2n8oK9YP18GzHKon4qXxDtIaylBoW3jlcflJuBQaAzmJx9G67NDpmzpjxyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113090;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=d/ngvX3MwK2JZ1Lx8ZHmo7uo1l/zkgbJHuWIMl6Dbds=;
	b=LOmzndOCxyAnr8ZzhPDxFDnVhX8XUk9zcq0qDMRBWZBV3NIYg1hX74olPkyLQsFoGo+5
	 wBROxm8NIIlS8mm3bNZODEX6Jgq1p/XCS5+X1Cm2wBfBhFjKJm00qKo/ZOv/BzvNiuqSb
	 XCQkOO7tXW+VqivzDaXDYySIz0JVHRJY0Ar9EG34fTO3Px9vw6cIZz6/aNJZwYRaTa+RE
	 JVhSI6Sg8v5KgSWjk/40H6CjzeRVJO6O6qwcSFfS/9p+Guw7nflERuZEY3/dlP4QvSJkv
	 ciuzW33sgZEAskugl8uBIA1D8EC82BsccspS6fAF5moC6ZfGHrAplXsv5c27Ya/RYyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="ATkutq/V";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83570606A31B;
	Tue, 27 Oct 2026 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ATkutq/V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD781F01828;
	Tue, 27 Oct 2026 14:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793113090;
	bh=d/ngvX3MwK2JZ1Lx8ZHmo7uo1l/zkgbJHuWIMl6Dbds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ATkutq/VmcACkqHsj8lw9SbeQ9gKYcU+2Fboqs50KLeP9YJ0zH0KKd7FxM0oGwy/e
	 3RHo61B72Nj8oFGDkOLukH7T2BRA7E12f2fqSkZf71avR6GV+ykQpksyV5bsNWFAvg
	 +JO+C6wNwYNO3YwVc8e+xAirwXIeT5+4p23sx3Po=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:57:46 +0100
Subject: [PATCH 06/19] usb: gadget: snps_udc_plat: lock out the interrupt
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
Message-Id: <20261027-llm-usb-v1-6-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>, 
 Neill Kapron <nkapron@google.com>, Ijae Kim <ae878000@gmail.com>, 
 Herve Codina <herve.codina@bootlin.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=2085;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=cXuY7EJw0AaFwQoHR74MlQQKB1uJExf2sU+sLQnn0xc=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPdr87t0SJe/aPE1fXTAhYbWEnV3slakWoa/yXSdLPW
 ufn71u5uiOWhUGQiUFWTJHlyzaeo/srDil6GdqehpnDygQyhIGLUwAmIrmRYcHkY6vKWZ74/pSe
 8sPzI9/uL3sPV2kyLJi575Dlg9zYsKmL3R4k166fMymzOAMA
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

stop_udc() is called from a work item, when the extcon device reports
that the cable has been unplugged.  It takes udc->lock with interrupts
enabled.  udc_irq(), the hard interrupt handler of the controller, takes
the same lock.  If the controller raises an interrupt on the CPU which
is in stop_udc(), and it is likely to have something to report when the
cable is pulled, the handler spins on a lock which the interrupted work
holds: the CPU is stuck.

Disable interrupts while the lock is held.  They are enabled again for
the ->disconnect() callback of the gadget driver, for which the lock is
dropped as before.

Fixes: 1b9f35adb0ff ("usb: gadget: udc: Add Synopsys UDC Platform driver")
Cc: stable <stable@kernel.org>
Cc: Neill Kapron <nkapron@google.com>
Cc: Ijae Kim <ae878000@gmail.com>
Cc: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/udc/snps_udc_plat.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/snps_udc_plat.c b/drivers/usb/gadget/udc/snps_udc_plat.c
index 8ce43c4f8fba..e2e71cc947dc 100644
--- a/drivers/usb/gadget/udc/snps_udc_plat.c
+++ b/drivers/usb/gadget/udc/snps_udc_plat.c
@@ -34,7 +34,7 @@ static void stop_udc(struct udc *udc)
 	int tmp;
 	u32 reg;
 
-	spin_lock(&udc->lock);
+	spin_lock_irq(&udc->lock);
 
 	/* Flush the receieve fifo */
 	reg = readl(&udc->regs->ctl);
@@ -53,9 +53,9 @@ static void stop_udc(struct udc *udc)
 
 	/* Disconnect gadget driver */
 	if (udc->driver) {
-		spin_unlock(&udc->lock);
+		spin_unlock_irq(&udc->lock);
 		udc->driver->disconnect(&udc->gadget);
-		spin_lock(&udc->lock);
+		spin_lock_irq(&udc->lock);
 
 		/* empty queues */
 		for (tmp = 0; tmp < UDC_EP_NUM; tmp++)
@@ -63,7 +63,7 @@ static void stop_udc(struct udc *udc)
 	}
 	udc->connected = 0;
 
-	spin_unlock(&udc->lock);
+	spin_unlock_irq(&udc->lock);
 	dev_info(udc->dev, "Device disconnected\n");
 }
 

-- 
2.56.0

