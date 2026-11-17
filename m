Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919700;
	b=mEBN/uTT3NJwpc0/iQgUIBUU/RA81OdJdzSGUyAh5wkbKwVrnqGKdjr29cXLhX35uOSa
	 F+J6Y9UuW8gcROG/Dqem1TvgQ51efMp6MPLK2KMuqmYf4qUQmec9i1X2nMn7sI9GfpGh8
	 H3fkb7EZCiFx9ZrG0ynINerxwpLXb0zRPP9EF20ZDsr9BSZtGhybyfd9ENPcsElMzEqUx
	 PQ5trJT8vgcfvqBKD7i5/Nvm5e8Khf2CqOTQm1wrD1A3PhXXjif9Tw8gZuwJZ4K4nw6d+
	 9F+6keI7q2cPZVyOmZ/RqUqhOIN7aCLUcKltL4jZ5IDfnNu+jpMSUtb2XpWPrIIf9PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TWqIshyer+rnwnmvONg26Tc85ILGwWxZiQSjCuZQWa8=;
	b=oLVz9CvG2yTfY8h9LhgLXID8uf44aVqQaQQwabQPoa1vqRoXVqsWvDR2jy6kTTZDZKX4
	 hM/eLYMe5AGVmC3uZ+aVc7GFbAbywaWVV57bUxqGGSHRms43jEvvPf7f4IsrBFh73ffTu
	 9mgziFVn0g2s29snbJb/v6a0A9XqY7JGx2LwJ3loL5dXrTIWLKe+a0WAFRTtf6Uf8NsOW
	 Ddc6qps1Xq1FifXl4ysDl6APC6nix+tOzULFJuPAvYZlnPVcnUBPkVaWSBFOFzdT/4QSy
	 JjCVfe+nLUsvDT1sVdapNnXy/YEW5njDWetWy+tDyK6X9QqKk9FvSYHygLUO/0xDzgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=On+Gm22K;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F7A606A880
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6F7A606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=On+Gm22K
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so33447215e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794919698; x=1795524498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWqIshyer+rnwnmvONg26Tc85ILGwWxZiQSjCuZQWa8=;
        b=On+Gm22KhOREUjhxyN5/8vvGLuJolTVEwVc/7H9pErgg+96xP1T3vuDCXQ+vOKGGtS
         HudyeaNwukfeAiwXrGJQdKHHQ+QA3NrLoGOVhWhOP2BfsyJxdOR2sbkLLhDDOCAvi91P
         CM7rqQX0by+yNIGTvV71CEKaG0F9X07eikcHKQeByI9MmCAjDU8vJH9QDtKlZHRiBCTA
         s5L4I5+vd/UFpQCK1TZRuaoTL842PZJ+UP6s+huNFuYVQ+n+5lsGsZ35EsKgB65YA2qA
         nQDll57JujeBLs3LL8b6Bo7taMgmk8lPY05GrmPMMGyYyBF2PTPjuAOVv/RpqJndtytc
         7RjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919698; x=1795524498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWqIshyer+rnwnmvONg26Tc85ILGwWxZiQSjCuZQWa8=;
        b=lapI/dQZW675xMofPUQ67FEi9nHaNUxYezPHCaRzkSI+8YZu1Ywp1fhKMcXLxFUMRQ
         nBAgKXUvtXqXzjVvMtGpF9SsUW1YeeDbNZXOXMZLL8eTmg4+0MS63P/B4VHHoVfGuwtf
         gjKak2r4Quw7+4aoOBaGsOBQHG3dHwh9IMNtUuw3kz3bet9MehR4HjSsne2CJZqI4S3g
         niSKJxv1V8imUei8xq6EDHZ7FfkyUQOf8DhWbUMWyFkC1MABW3seOAyOOk/Y/Tu5Tiey
         RG2JlKWHP9+jg2ThzeWfYH4YoMAsTNhNi0nMebf2At3ELqJNLQHaYqiS6gNOki5ocTjw
         DO0g==
X-Forwarded-Encrypted: i=1; AL+hErFT2/T9yoJn7rwK2Fd1EdztriYRvkVHYfqOAbPQmVo3pq38aroHXPsX5Vw9/ooq8hWlp1sbwXeK6F4xAxs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EbYOtm+q2S1Kqsud02myN9EVDPm4wh+jSKc+8g2gMWukWnRJN
	fXbMXpOGRiZeCoyaNVJNyCpXh3IPyN/sQiT4euKh5rVEUGGwSdHud446aNlww0J+ALQ=
X-Gm-Gg: AYBFou06kiccqdTCgR4DDifGRe/y9rc43YWiRN16pWrusP8VbP+GxBlHwn+SkjZk8r9
	/cTia17WYQJUbsmWucY41/3YOJ6UYFCTSZB2UOfHCqeAPr5y8LKv6yExoo2SVNPG4hgkck7HyNp
	xCwXi3LXFJuV9bpIhWP7g1O7YM6/arrZG37CMqimNuWo4YGmqbve61zMy2lcOYeOYxN9sSM2zbf
	U5B5NnQKIHGvmr2p14a9iaXYa2b+nP8ef5M298IrTY6F9gkjuDRY3qT+0xXXBxMx7+VQzMFrwtS
	1slhxIHvp+D7NsoSltKhi5+jBJqLuxzkiU/B2cHH4ktEtdG7Q2l7HfMLp1YrRMf2Mi8wc3PdHL3
	0Rc9vWFdF3XlK5nrCPswz8JcnDmHjz6ZCTgsBokGLKrP8zv8LtgsPhUzm1KJqFvTS2wAv2PAOmJ
	rRy646IXydkVLSOF4EvdksNdFgHEEZcb/Zro5PsOwNy+flxHCtlFqfuxSnzno3wxkqZHZH4o0Mb
	oSaMCjJpWlnRbEwtXvCTjy4J1ishqluQCYItgqQvUxLFySbzy+BXHOUhddAFXF/y/4zDQAPiVl3
	wgtvgULrgZw73HL5dZPMFUlqxmKKbQWTMuAaItwzExWsFQw6VnEiczQLNoPu78FlX8GP+koG93w
	qWpJ3A/TNsQ==
X-Received: by 2002:a05:600c:a114:b0:4a3:12fb:1ee7 with SMTP id 5b1f17b1804b1-4bb55aa7c58mr226250815e9.25.1794919698131;
        Tue, 17 Nov 2026 04:48:18 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5f350d51sm124029135e9.4.2026.11.17.04.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:48:17 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Nov 2026 16:48:08 +0400
Subject: [PATCH v3 2/3] usb: gadget: udc: Forget a deactivation when the
 gadget driver unbinds
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
Message-Id: <20261117-udc-connect-v3-2-9413b491d213@flipper.net>
References: <20261117-udc-connect-v3-0-9413b491d213@flipper.net>
In-Reply-To: <20261117-udc-connect-v3-0-9413b491d213@flipper.net>
To: Neill Kapron <nkapron@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2432; i=alchark@flipper.net;
 h=from:subject:message-id; bh=lCYNBR/eIWKILRxQZCUTexJRQVCf4nABtu0C5ClnwP0=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWT98eU+nf699fqlf/MWuYfmvNo19aRxcsymsuO1Pzrur
 zcqP1HZ0jGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBUM89i+J9ZP3mtY1iU+tHyhLAiw3hJbs/PO+tMJCq9W/lcW8V7lRkZusIMQ/e
 +Pq78M+Sa4bN5m2Ys9//zOc8njnn/xJ0fX94uYgEA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

A gadget driver deactivates the gadget through usb_gadget_deactivate()
until its functions are ready, so the deactivation means nothing to the
next driver. Yet the UDC core keeps gadget->deactivated set across
unbind. Only configfs resets it, since commit bf95c4d4630c ("usb: gadget:
configfs: clear deactivation flag in configfs_composite_unbind()"), and
it does so from its own unbind callback without connect_lock, which
guards the flag everywhere else. A legacy gadget driver that unbinds
while deactivated leaves the next driver unable to connect.

Clear the flag in the UDC core under connect_lock once the driver has
unbound, including when the bind fails after the driver has deactivated
the gadget, and drop the unlocked write from configfs.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/gadget/configfs.c | 1 -
 drivers/usb/gadget/udc/core.c | 7 +++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 51df6d1d1487..c0f9e6625b64 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1849,7 +1849,6 @@ static void configfs_composite_unbind(struct usb_gadget *gadget)
 	spin_lock_irqsave(&gi->spinlock, flags);
 	cdev->gadget = NULL;
 	cdev->deactivations = 0;
-	gadget->deactivated = false;
 	set_gadget_data(gadget, NULL);
 	spin_unlock_irqrestore(&gi->spinlock, flags);
 }
diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 577bc15f61a1..449b303c2f81 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1705,6 +1705,11 @@ static int gadget_bind_driver(struct device *dev)
 		dev_err(&udc->dev, "failed to start %s: %d\n",
 			driver->function, ret);
 
+	/* The driver may have deactivated the gadget before failing */
+	mutex_lock(&udc->connect_lock);
+	gadget->deactivated = false;
+	mutex_unlock(&udc->connect_lock);
+
 	mutex_lock(&udc_lock);
 	udc->driver = NULL;
 	driver->is_bound = false;
@@ -1734,6 +1739,8 @@ static void gadget_unbind_driver(struct device *dev)
 
 	mutex_lock(&udc->connect_lock);
 	usb_gadget_udc_stop_locked(udc);
+	/* The next gadget driver decides on its own deactivation */
+	gadget->deactivated = false;
 	mutex_unlock(&udc->connect_lock);
 
 	mutex_lock(&udc_lock);

-- 
2.56.0

