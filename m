Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044574B2CAD
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 16:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788626715; cv=none; b=RnU/OV+k/6bU8KXP4nnebzep7LJjCH27DbwOWgNxJYjB3/O05iqma2RisTeYzfXzD8Vx8QRnDl2MkRfISMtaXranWRz2l29I2DUOCLFAKZPBXCJcdfPvt35lsmCaD5WUA2OCceyS/tU0n9uGmGCtsrdLmRP/5EZfgdgeeC6tBTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788626715; c=relaxed/simple;
	bh=zXRC/RdlmsiuexVeqwFjarsu6yZ7PSNCPNwsKWzg6EI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XzYalsTw1qNgGs/TGnOpGM3cOFyzSaHLcJdrP41SQG0a/jFzwBZPyvS42dLZOI6RNAVD0fuLAH1acQbFgjAujhhWR1ArGwo7ALFJsu38YpcYj/oOu8eJNxaV46tIK8Pxdnt4xBJPO3gL3Q6K0KMPp+R7mPQ6JdP6nKaJju8y8x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VV7CslGA; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VV7CslGA"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-90e7c71f86eso14685436d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 09:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788626706; x=1789231506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iebef4UkUnASKv8XcTx3vwRMvhVbFEWfZRLdXca6h64=;
        b=VV7CslGAVnHj0gm8JK0n6CeO5ODOlecicnnkvks3hTB+JxVBe1fVZlpQaFnY6YnL5b
         rBO0J4TR+BI8nfs9yAGodxNqmzezpUyKXHfFLDUyxLy6H5j2kFuBTa3vZDi9VQTLYTUm
         dFbv/itBx/dpP6fWRtZ7GJM5yA7wKDAFqXHVz7UQOffB7X8VXv0QZD6bb0PS3jE4IPsi
         2+pjaDDjAP8aX9jLBAMGSnp8qAtvnbRsK0xwpXvKs7RpXcwmp7n2uik0L1Vmk22kNjCI
         ZV+PHKzxFxW8bmLE20cPmR1v3qdJbNj8Cx+xoCjJKnS4gF9XZKIetdjUOvnfy8a/vuHx
         82MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788626706; x=1789231506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iebef4UkUnASKv8XcTx3vwRMvhVbFEWfZRLdXca6h64=;
        b=I8ak72JYBcGvoFpYGRGE/SK7TV413aYlI1EFiPEtbOOWZS3EfOVXcs4V+B4wiltLeA
         ONb14q3HotO6+rxBINTV0I3IxrPzhM6+lzaFaVe0wmu9Efr5m/IruflelIviL37YPKdQ
         +klCejR2E1TNWvHGXrfxJnT39vH0qhb+NnAWWPiHsDINsnHQ/4qL2Pcj8BZ+kJ8wV3q/
         QZYHZCrRMivosCG7NSpB+TAqg5BlQS81Xmw0HVsgy27JkL5rj44MLZc1s3NQPa7Q4sjj
         WvaheG47w8NCQZKHkHIlVr/z355n/vu52hdjEurv0LgIlxo1BwcitKYjMXhvabBRfndI
         OcSA==
X-Forwarded-Encrypted: i=1; AKwUvBwV/zviCdVuGwr+2EcTVy5dUZseEPuB8t7zB8GT89pTZyApfPCwj8e7ozWVjiD8r/kr+it9HpYdCt2cocQ=@vger.kernel.org
X-Gm-Message-State: AFuF++njFyj6P5mgweNyRfVMppxmGKDa+/G86EEvM3B1aabYhxY9+jEh
	9LFrqJ+Q7XTfSkFnNycQPohuFnL5buWd7IR1DB8Izs/xaefBt8FOaXkJ
X-Gm-Gg: AYBFou1k+k3bZW7L1xZpZt+P5PyZHtxrKBqqh8YI+USnhLO/48UwDOp5c7Ytt7yjt62
	l3Y9r0eIf5izCjPgTHIS0kaNStszUuOk6WYj6j826+Sr00BTc9rU+HG4YOmpDGYMGOkoQaIIpx4
	KcpaXRl4nrnHBwO4nE/tdqFxwn6GtaIJJUmt7sO6ZCC9u6cuDn+/SYRZstaKeIyPBygokwFxopA
	HRqxDE+BdBKsFK6leuTuvzBQwkAlmkoQUAX+cUvb4KwjqvaJVjcU4+G6Dqk7k4NHS6/mvaEH6tI
	r7dJ9bH67GwRvm5fQzU4x9DkntRoto/SuTrZgUSmNsz/f/RCvYxcDdgmyqN6fFtGIiPs2eKSx0T
	OkZ9ED/s09ovLNoCVJWYYX/84oeDutLJXCqY1N9q0m/SQ6JInG7M18wVB/ku+yxxPMASM7i7/Xd
	sG6GPvFLJs5bwnaEYfGL0v9GegTi3y+FZAdKKzN1z2KQ4SVZOLFmkzb67CwRqsTINdAXUYC95iE
	ynZD8QC29u8kEUVkXHSEu7GUySAD5+xUgYW7g==
X-Received: by 2002:a05:6214:4904:b0:8ef:91c5:8edb with SMTP id 6a1803df08f44-9103ef23c37mr177612896d6.10.1788626706129;
        Sat, 05 Sep 2026 09:45:06 -0700 (PDT)
Received: from dave-desktop.lan (modemcable053.177-58-74.mc.videotron.ca. [74.58.177.53])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104067ac52sm48984326d6.27.2026.09.05.09.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 09:45:05 -0700 (PDT)
From: David Collin <davidcollin899@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Collin <davidcollin899@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] usb: dwc3: host: fix dangling xhci pointer on init failure
Date: Sat,  5 Sep 2026 12:44:47 -0400
Message-ID: <20260905164448.209348-1-davidcollin899@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aptV-QHKGbMqw1uP@vbox>
References: <aptV-QHKGbMqw1uP@vbox>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dwc3_host_init()'s error path frees xhci via platform_device_put()
but never clears dwc->xhci, leaving a dangling pointer that
dwc3_host_exit() dereferences unconditionally on removal/shutdown.
Clear dwc->xhci on the error path and return early from
dwc3_host_exit() if NULL.

Fixes: d07e8819a03d ("usb: dwc3: add xHCI Host support")
Cc: stable@vger.kernel.org
Signed-off-by: David Collin <davidcollin899@gmail.com>
---
 drivers/usb/dwc3/host.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index c5674161b2b0..74117cbb2f42 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -219,12 +219,16 @@ int dwc3_host_init(struct dwc3 *dwc)
 	return 0;
 err:
 	platform_device_put(xhci);
+	dwc->xhci = NULL;
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dwc3_host_init);
 
 void dwc3_host_exit(struct dwc3 *dwc)
 {
+	if (!dwc->xhci)
+		return;
+
 	if (dwc->sys_wakeup)
 		device_init_wakeup(&dwc->xhci->dev, false);
 
-- 
2.55.0

