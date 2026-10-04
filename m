Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8535E418A37
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 10:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791109762; cv=none; b=XHCGv4K+SbxpRl543Eunc88hgUGoW2GyqrvUGk43ybh8rak3sMPyzlb+y6JbOd0iSTXFZGi8KEDMFXxSIEa6/xidWALeLffJJAbh++koGb1wGWckt9mwnTkFKoGPn0kRG2fngsEXmb/Ulq8SnO1WGSwgvjulnq9RepQBPi4C2TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791109762; c=relaxed/simple;
	bh=qEEDNIIgAqO7jksfknN5V5LFPWfqIbRC22R80z62+D0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EqLoKfnBhSpqOeKCDI1eWrT9GtkLNV9ZwosRxPIgM13nFw4W0a0JjTeA1hsH4D7uSKNkNSk+T7J5bvnC+aRRdxg/YzyqpBg3BmNwE70SiOnlkY+kPl6IznCyIAok4owRynS1sM0OmrgBvef7WTIyMC/YE74fphIMwkVyiy4hC9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ln74raXS; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ln74raXS"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93c5b7f5bfaso50312585a.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 03:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791109760; x=1791714560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hW8RzTH4aLcm4TzCyMXmpOH+i9c92hojU2ChQeD95CA=;
        b=ln74raXSrVTesrfs7jlLnTNg92LxVg+/jDkDt8bGr+CDGUZ+649K6GtgaHBQjah22I
         QRKXjcsP6IP59LLQNfHYF+V4VD1L+1BQA+KAUvGWkInV5UWxRN5OBkYKOSc16TvKyFO8
         14ieVLdgSiqx50l3A8wjx4J5jdqSSu7gLTX22YBj9UJj4bNn/pV3J7Iy3g//IYg3wA2v
         TRoBfPW2/vDY1y9Ox0gLMG381X5CUqsID23lrU7B87aED4qqFLUv8+TtuZItYZ9FyGxc
         6bI6RTKncpBj5FIxXRkGbPAqtJW/Cu1DHTRWuHNtWS7TI+P81Ws0IdJqwE8VCMmbhVdR
         Ggjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791109760; x=1791714560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hW8RzTH4aLcm4TzCyMXmpOH+i9c92hojU2ChQeD95CA=;
        b=JKHQkXi4U6TA3mvv6gsHlM5RwEjVvskhrW5f5cwRpSFgFzjvkRgouWrguynXjJvk7g
         HsONjgD9Dio+Yv2eBDt2fVxl/ScSFuuobSNtTxBgBZCKix+5p6SlbEOyaKepxJXh6TS7
         2AZ8Ue8M9qK7pUOgLtQ9RhcarjbklQl6IqA5TXoIObr8bJwXUadjNY2QjMFPeLisqVLA
         HO7g+ziRMNg1DGPh1oajRqdx8ORRQUN1Ybpy4f9mS18GhwOk4DNx3MFLokI1dM3Fdy9W
         V56Gg1qwj3XsyjLHK7SKVC6fuB1WfQWKiJLcqUuTCKpAS8K1r68ddJBvAI59SfqqQEtv
         c09w==
X-Forwarded-Encrypted: i=1; AKwUvBxQr97isVoVyFkmaYV21StnDHQMvr6JQ8MRcnAQX00fWj8LJVgnAYFy2DQInqKOP6zdJA6jTTqDhxg00hI=@vger.kernel.org
X-Gm-Message-State: AFuF++mxwbzyzoDNXwFGtw1ky47GVys5XUKLZsJqHT4Cl6t9VdYCzCXO
	Q01nLkFg+3Lnf5v3UlfHTRlNrEKk1c7kFxkInFbZI9uCPJ7e9phmsrhE
X-Gm-Gg: AYBFou23pBuKqfzkHc5KuIQ+0lob+CKl0awFW7+h6a1yjFPGXLcAu6UBn1mVyP1F8fV
	dsOnCzJ6PC/Csq1kRqMHeSUhjV51jXSN+7+ietGJCpMqLcGCnKdyB4bxnaPAe4Doml62EiDfuPO
	PlwFcidHrD5vDm5DvMz08nfuS15MyA7omLR7SxURE/45Ga+lJJbw6duNvlX18zVae5H/74UX9vS
	nclNZuOuzqL5vIJN0nRNMY46pY2q/Xgzk33HqKssgHg7T9FRxVxGN8M1iSNCkKyjr7R4yfA5dOY
	NiJ1AUiLzAjXh1tZxcDDgKbVUPLRU4rNdnfxFuxdW3U/vWrj8cDfNs1gtu254hdQPQwofCc06dh
	cjeOM7ZZd+rhTCW6nQzzh2vJGvl36r2ktvkgaRLq5/Q0G8penOYjtftcWoIxbAzHGF1t/6E+nNl
	23WOSxI8Inl1aFZZr1RzjXdEZgqkjYerm8K/IefCv1GqmCXE6sF5sU/nVcxd7Ki5AAL8LIINatc
	9CqNx+iw7+Kh9PZWo3RmuDV5LEYV9n5qtoXxUUcLgGe8eo24yRRGOs2nqfNHQ==
X-Received: by 2002:a05:620a:1a10:b0:93c:65e3:df81 with SMTP id af79cd13be357-93cb5a5be1bmr1958241885a.13.1791109760089;
        Sun, 04 Oct 2026 03:29:20 -0700 (PDT)
Received: from Precision-M6500.home.mulloy.xyz ([163.252.155.132])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca2b2413sm635381685a.41.2026.10.04.03.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 03:29:19 -0700 (PDT)
From: Joshua Mulloy <joshuamulloy@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joshua Mulloy <joshuamulloy@gmail.com>
Subject: [PATCH] memstick: core: don't clear dev->driver in memstick_device_remove()
Date: Sun,  4 Oct 2026 06:28:48 -0400
Message-ID: <20261004102848.34563-1-joshuamulloy@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

memstick_device_remove() sets card->dev.driver to NULL after calling the
driver's remove() callback. Since commit a995fe1a3aa7 ("rust: driver:
drop device private data post unbind"), device_unbind_cleanup()
dereferences dev->driver after the bus remove() callback has returned,
so this should result in a NULL pointer dereference whenever a
MemoryStick card is removed or its driver is unbound.

The driver core clears dev->driver itself in device_unbind_cleanup(), so
there is no need for the bus code to do it. Remove the assignment.

This was found by code inspection, with the help of an AI coding
assistant, after hitting the same bug in the TI FlashMedia bus code
(drivers/misc/tifm_core.c), which oopsed on SD card removal. It has
only been compile-tested: no MemoryStick hardware was available.

Fixes: a995fe1a3aa7 ("rust: driver: drop device private data post unbind")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Joshua Mulloy <joshuamulloy@gmail.com>
---
Compile-tested only (W=1, no warnings, current mainline); not runtime-
tested. The same fix for drivers/misc/tifm_core.c, which was tested on
hardware, has been sent separately.

 drivers/memstick/core/memstick.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/memstick/core/memstick.c b/drivers/memstick/core/memstick.c
index e03989c4e..06ee6faed 100644
--- a/drivers/memstick/core/memstick.c
+++ b/drivers/memstick/core/memstick.c
@@ -100,7 +100,6 @@ static void memstick_device_remove(struct device *dev)
 
 	if (dev->driver && drv->remove) {
 		drv->remove(card);
-		card->dev.driver = NULL;
 	}
 
 	put_device(dev);

base-commit: 6addb4f385570ebc11c4eb499a4f1c149f313e84
prerequisite-patch-id: d9a5a385ce2ccea3eec18ee2168d603e951c6374
-- 
2.53.0

