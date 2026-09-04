Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A0850C282
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542178; cv=none; b=g90drKr6qrEA7KpTOPKV3GVnrt9HjOzioGstAcHAMKDtkyiD8s8idJq5zgKr7JJRzVtqOWFUYumAIrZksJ2XIirLreEhv3huxuOEQWhqucwlHbyaFGFtGLe35DDLmK8rkq5GhgpDwdvEi3gTV1+fNBlkl6Xpi7snljBGx9xkUqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542178; c=relaxed/simple;
	bh=FbkHPsmiA5zHnxxsfR1WWOP8m5F0e1gDkF8K+pc1He4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nvTk+P1WbvXCuqErQDGWWUy6wl0djtAN4paIwkFLHmnlwh3yIjW1/02cFzEcTPIsdcG/QYCBilktspp//L5knIJNAGQA7pPiHt+UnFQAC7LTAuRDpRLTqZ1thocklbiaVig0xQ9eqpOKnN6ttlU+57gxJLAtvF04pDVcb1eNAlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CAVtU12T; arc=none smtp.client-ip=209.85.218.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CAVtU12T"
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c2580a59d0dso110570266b.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788542174; x=1789146974; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lHu65GRGtE9tAA3U30k5Ff4J4ZEkOWgVLpTedANrfZQ=;
        b=CAVtU12Tdrkbj1KCzZDFoaEELIcVKtZoa/Yds2vbG2QTuElOPeahUQ/HkVf9UDmaLW
         VrRHZNcz6cz+wN0ETyRwbn2c/S2YHMen8qo9CoSb8QZU0GudIWS0Bpe35kaPbjydJDbW
         HYPnBayzI2soAhAMc0Kqo3rCORXa7KiI+0z8n90f9MwBv4yaRQyTZlpHWdUSMjDWM7wQ
         XRYA7sH73Oe0knAxF2ZkVMZ0kvakQMpp2RCkUCAzjSqQAROwK8bmEITi/JHwrywkCtru
         mRfJR+iC60KtjU+Mcu0XQpEdJYr70d6SQdiR2T27Av4cCodp+aT1x20ejc0Hp5KRVOq4
         V3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542174; x=1789146974;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lHu65GRGtE9tAA3U30k5Ff4J4ZEkOWgVLpTedANrfZQ=;
        b=nMiO2ttJSjzHOG1h/wL/bTAEQ/xcYAQfFp/hHqKZ9ZCaGFN/6dMetU3/W2oOkwGYGp
         AxHtKuIBU8zUTMqJRRYjgIWd/gzO33KBB7dIVMll+QeSOylqjIwxqgIjoYeM2Kz51eYc
         t2zn0wKwMke8FNbWtM9PNfcrDJVaokjCTR7/7zRTXEhHwPHDELbPWQHILmM9ioTUfXWI
         R10Q30CwGUcMjanDeiJiVoCXtxisCu0xMeTk3D1I1KVEbIXG9YE68C3H6WanNaXxMWZk
         JeHkk3KO5EISPJkbrD0IcIG8qVpbMWJ3RxvFvJhurJEjNQjLGh6liSAqi3RWw1vAO0le
         ym4g==
X-Forwarded-Encrypted: i=1; AKwUvBwpWqgv25k3EV7qkkUSRmo7EN0SiBrFMD0QU4TTTA0Fkk8nDXHnkhrbzveB0fsnb8UJu+tuKBOsi5I2YtU=@vger.kernel.org
X-Gm-Message-State: AFuF++l2O57eBDnG3woeCAjN5IuB1V5AASQPyqk41SRm86ubgOFo5nl+
	JIdO4tEua+N8c7RgTA2cbyILwFbxSwrpjvPPjKp03yU7EbdIoVbZqqcgfcIwTeHWYvbLyUvaEo4
	jNr0am9vCKiXb/kzdFA==
X-Received: from ejczw3-n1.prod.google.com ([2002:a17:907:e003:10b0:c25:d60:eff0])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c16:b0:c1f:e9d9:64d4 with SMTP id a640c23a62f3a-c260c9cb978mr352987066b.11.1788542173879;
 Fri, 04 Sep 2026 10:16:13 -0700 (PDT)
Date: Fri,  4 Sep 2026 17:16:07 +0000
In-Reply-To: <20260904171610.3342398-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260904171610.3342398-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904171610.3342398-2-tarunsahu@google.com>
Subject: [PATCH v4 1/3] ARM: locomo: Fix device reference leak on registration failure
From: Tarun Sahu <tarunsahu@google.com>
To: Russell King <linux@armlinux.org.uk>, Geoff Levand <geoff@infradead.org>, 
	Masakazu Mokuno <mokuno@sm.sony.co.jp>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Paul Mackerras <paulus@ozlabs.org>, helgaas@kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	sourabhjain@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"

As per device_register() kernel-doc, calling kfree() directly on
error bypasses reference counting and skips the device release
callback, leaking the reference. Even in case of device_register()
failure, Calling the put_device is advised.

Fix this by calling put_device() on device_registration failure
instead of kfree().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 arch/arm/common/locomo.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm/common/locomo.c b/arch/arm/common/locomo.c
index 55e360452828..0f6689d343b0 100644
--- a/arch/arm/common/locomo.c
+++ b/arch/arm/common/locomo.c
@@ -223,10 +223,8 @@ locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
 	int ret;
 
 	dev = kzalloc_obj(struct locomo_dev);
-	if (!dev) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!dev)
+		return -ENOMEM;
 
 	/*
 	 * If the parent device has a DMA mask associated with it,
@@ -255,10 +253,11 @@ locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
 
 	ret = device_register(&dev->dev);
 	if (ret) {
- out:
-		kfree(dev);
+		put_device(&dev->dev);
+		return ret;
 	}
-	return ret;
+
+	return 0;
 }
 
 #ifdef CONFIG_PM
-- 
2.55.0.979.g7e5102b832-goog

