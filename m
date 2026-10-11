Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447683242D8
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791747243; cv=none; b=CRadrXVFIioBGSIYUf9JogmEVtup2iTR/h1V/4iLECD4sQgu4DPAFOMsZ5LBgqtvNOHvXPIpoEfLUEaq8QQleAUBMeFadXNtRm+xsf9xd83BaJXonJbpbDT61VXpqUC4B+kTzOavpb0r5Yzkc9fcN/k9zmOa5usp38aCOm01ifo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791747243; c=relaxed/simple;
	bh=61XhG2ZYTDSrWKrKfWInr2r/YADFoTuE8RhU6zdkc+A=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sbnmMIp6CwpNIwo8+z1R/mkpOY4T044TS4jtnlaDI/OTpkj3HiSo+x0P1dHpdDkLRVmVuUhsIstI2pdBPPfmVBRj7SA6qQmViRreqmNJrSaAM1Dzfi+X6BaN16we5scbqeJSE8fdVMtr/1rxtFEyrhNJLY+3f9Klcgl6YDH5TZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qrvXDx9I; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qrvXDx9I"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5352a876d5aso18009901cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791747241; x=1792352041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5cS8rtI+Z/43NmekjXfCNZrQzOfAL9A4kwOwWeF68po=;
        b=qrvXDx9IPw5ZNXf1B76s2FVWpTd3JnDG7pdBZBoZ8ss+GO8G86XTNnKmmR7USXOKy2
         x05v5XRmDZR3UrU/vVmIoX3W8IWdeWwbv0p/dLA7JP2bk6YgYZkZ2kbKwj7QVK1bB5DN
         M9xHyuf2tRsdxDN75g8Y7UZE9JRj0E8sHHg4hBrAoglbj2Lec9Mzvcff129u2i2D7hYA
         xst6DLMyBDCpDXuLbkQ9Fg31rCXPemBOq7pw96tPajOKgduHYGugoIvZtUMjzI+CzsKc
         h4hNhXLjpJmY1ZG3pE+bfyNwRLbsfL2rGonBUPKUXJlRZ43dibpbhcSePHKLabXzRMFS
         mY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791747241; x=1792352041;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5cS8rtI+Z/43NmekjXfCNZrQzOfAL9A4kwOwWeF68po=;
        b=UnZYkGqKKlrJ8R5MpKrWp6YYDoSyko1WCUEgBpwtlxIB/8tljS44gGVOPcgJQuH57A
         ZwmN5WvLN/X88AFuGhWysLofhzhdj8voZp50uO7UaxvIY0wIQoD5UZUfMjUIKfbbLfgA
         bD4JAbPqOV9L1QB4V6ODid38Ox422+thScfuQj/EshltJZl7utAGXQRA75+2ZgI1Shbl
         cc3wuXFQh1aVvcUF8UPSeuKpzlMRTQ4wwDhhNsrfII/UUMpDVyWDpKOVHd2ukmDnEFPn
         cCrjbLy5/FKLXzDdfit7O5PKrivHVdydGH6t+BJedcvS9VVCgFSgw21Y46xU6uDlTE4h
         1rQg==
X-Gm-Message-State: AFq9FYKxHJ6O7191bz+zR0QHksT21eXkcysnb9lbN+yWtZAzmZojm/ck
	Am8JGfpDiDHgWNQbMj6OXnyk352Nb3vZRsw2CsCBSXX5jELGWLwTvEM=
X-Gm-Gg: AYBFou1JCpQyEoOaV1RPsBxGn2jYBp2ia3eDxlmjJch4hTbSdW+ZseTfYlhSefTflSv
	cqu/G+3pYt7XhaRDbax9O2S8vsh/Sk5RcFTzwX3KIwCt4O9/StGsSp+mXgQ8t6QKTXIqz39xahr
	SpN3ies1iMid12lqlZFibsaJ0/Ppc/rszwgSCr6KRQLYirZrc2Xk26PKS9PlFPJ+Nz0wviZBzSx
	gQh9IkJM7D9LR3cFTS2CRkggKa6j1k6veyHrKupE5NC05y5f9UenxDiPsB+i/dp8fxhN5zh5AP9
	NG93TxhB8fHweIX0e5Ath5rX2OcByIAlQ09md9RQb4ebC8vTmlvcpXpRsVMoMaDuFceb9Eb/TXC
	i77b8G0ZUB3jAK+S/IWcwrJ0YMHo+FDAKuxaCa3J1BBb8a4tOWtW8EOkDCcyhUfktL6+/Fi6JIn
	hMYLbeCXwgL540hO8wMOjN+uGHEI/V9wY2YxhfKR5/T8Ha3WAlC+GdpyIJo5RlbCdQLUZyfZwit
	CkbYkbVF3DSvXvXP04RNLrT9sc3Dln6VrpzJulwF93HVQHSqdr6Hd6221QqXJ2xTcvSBH6ejehc
	YXBeRg==
X-Received: by 2002:ac8:5cd4:0:b0:533:36d9:a911 with SMTP id d75a77b69052e-5359fb20005mr122686171cf.28.1791747241023;
        Sun, 11 Oct 2026 12:34:01 -0700 (PDT)
Received: from gmail.com ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7dd1a0sm63412351cf.27.2026.10.11.12.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:34:00 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: mporter@kernel.crashing.org,
	alex.bou9@gmail.com
Cc: linux-kernel@vger.kernel.org,
	ae878000@gmail.com
Subject: [PATCH] rapidio: tsi721: Cancel the self-rearming doorbell work on removal
Date: Sun, 11 Oct 2026 15:33:56 -0400
Message-ID: <20261011193336.005f74ced603-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tsi721_db_dpc() schedules idb_work again when another doorbell arrives
while it is restoring the queue interrupt. flush_work() waits for the
instance that was queued at the start of the flush, but does not prevent
that instance from queuing a successor. Removal can therefore free the
doorbell buffer and device state with another instance still pending.

Use cancel_work_sync() after freeing the IRQs. At that point the external
producer has stopped, and synchronous cancellation also handles a worker
that rearms itself. The non-rearming port-write work can still be flushed.

This issue was found by static analysis.

Fixes: 3670e7e12e58 ("rapidio/tsi721: fix inbound doorbell interrupt handling")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC, W=1 (arm). No runtime testing.

 drivers/rapidio/devices/tsi721.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rapidio/devices/tsi721.c b/drivers/rapidio/devices/tsi721.c
index 71b87bf..2bae63e 100644
--- a/drivers/rapidio/devices/tsi721.c
+++ b/drivers/rapidio/devices/tsi721.c
@@ -2978,7 +2978,7 @@ static void tsi721_remove(struct pci_dev *pdev)
 
 	tsi721_disable_ints(priv);
 	tsi721_free_irq(priv);
-	flush_work(&priv->idb_work);
+	cancel_work_sync(&priv->idb_work);
 	flush_work(&priv->pw_work);
 	rio_unregister_mport(&priv->mport);
 
