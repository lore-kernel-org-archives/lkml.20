Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85E34FECDA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788458454; cv=none; b=GJ+YhJf2Rp9YRd873BQJ655CWX0bTtChPevz8QhRUvHk7AXWyPOP6HETFvZSqshQeJD6RfiwknfzNmsor9oe481s0S23hm+WpbmE9rNsqh05cspE+wYFsX8HRik5Q/04OYfHPS/mkbJJHj1lUj33EBo36iQe9xEkUV6zcs7z17U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788458454; c=relaxed/simple;
	bh=FUL13PMBpdVmvGH7sOikoOUHQ3Zugr8TJXZNx3GBI6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KxmOdqDyhieZUNyxNhmf8GDquJmlhZLjXos50k8C7AZTch1aaY5oCKWHz1UKTmRRF84TcjLpHwTHihKuYtuoxl4ESoy3VtbfMznyV2guMeGnqtJOsN2v3jjiCbXhe9sy+7o0llW/GtYG7BlO44INlSmhI72CtmmLJfLdN7Qm4p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJB+oWgj; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJB+oWgj"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c197e7e4e94so11626966b.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788458450; x=1789063250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FwSW+L2fi24nBq8MzlES78JQKLNoN9Kx8+uKI7PoLRM=;
        b=PJB+oWgjkgFPu6bTH4bxHFU52RTzVBCFb6CuWD5H0XiSgy7na1GNnjn1tj3eATJpxX
         +XkgKishLg906MVxB3MrlKqF4CoLTzLNnhIcV9LMDYpFii2M9KN+lSvcE3CzBLuAo+90
         b/j0SbXktVeCQWUkv+AYYICRREzQF0XiNEN4q8O44pZBzZ81PcpKae4uf51wdafQxH0s
         qHMjVcm+ZlNPtRc07KAPx80fxFMtuDkdwiD8G0faM25qmusQ2XBYFSTkS7FV1vxxrwIn
         r5q4UugsZMOH4wswaUxvgeSooVjVy9lyAqTSG8Z4ByzE7Lu0eU4qs3nqjAz6mlhy09jX
         sTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788458450; x=1789063250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwSW+L2fi24nBq8MzlES78JQKLNoN9Kx8+uKI7PoLRM=;
        b=mik/cUgI4vJpzHmWcLXfsz+BM0d1Y4Jjgiy0kWn1ox8FYwdXaPcRk8ulyxmcn4pjpF
         is6Wmad4CycfMugNhIWk/vJxpaUxs83aRd+v3FuyKXpZBbpWLt+RaTLqVUwG6RVupZmK
         TPYeZULQN3TE7CvSbSfxmiNcMRYzMbO/SlrQmPE1e/9z/Qxk8IfDdFgQkXe7/mBmTWdY
         jLVUTx3HFqAflg+47tCDsrD/LJTBFor0B/7yRw0C4LjDXsrJvdRNg9CPMrJfEXZgJtbU
         KZcX0hUeUZ2EiofLg6rj14H9OixwwopZnD3pyeH0RUya2mMQ5KvYBPdRp5N0TFzvArDm
         0mpw==
X-Forwarded-Encrypted: i=1; AKwUvBzft6PNHrny4ESZr5j9+2QAilsbOaCAKoDsryy5uJaOupmD/5g4B+MGFP6GrVC0yynQ4A90D6Op5/HmodI=@vger.kernel.org
X-Gm-Message-State: AFuF++nyFi0duv8DHyYpEtyg0XrweYu+HjQWAwDaJykWa6Cjc9Nnr07d
	LyhwbJCtM3xZTOsNlXMGngtHFhn4lsQkqeiY8O8qIdf+AwkG7xTQM9fq
X-Gm-Gg: AYBFou2pGjTbr3DQ0/X1b5rGx2J55KNlsE3+TUYj3ju8bLP9cPRb91RaT6nuxfg380H
	krkJtnwjfrZHSpJsuyKOoP7vCvsc/GA9MHj53J95YOgCRPqJ8flIuCrGZQBt3C/0xTxeN8SnsGH
	d6tDozO3ZDvFqs6DsdurdzLyles4AlW2Czyj/nqSXDVNV2v8VWZluXgmQirMMl6KhENpnfsM1ru
	sQB7jdhixI6BYGwXCkuzg7YHeiwCjG8gnOjxmOUHBxYTBEqBfKKwUySnBuwmlhw+69zBwee2kHf
	JXDVadM576GQaFREL+UlW62x+KMd00gZXNpz/Yn8npKl7GI73emEmjuc6Xslebu6HrJ1nRd4y8j
	9INJkUr9QTIHW/h0AY5lQK1if2KZrl/NwrziXNfKWIB1MBzSppmgYDzKTJ9ytgx2ZVGSl27rhbN
	dP8cuzY/oMLD4JFOHZoYrPYjhuhRr85N1nEgzBMR7bohPNSQ1FkLPFaSLZttJWTJnSpxfjRnNcd
	f1pxbjgI6XVU2uA0GLcdG4MQ49g2PrqPl4hfsxgzr8LZ7a2u79fC35Yx3FSePEQ7A==
X-Received: by 2002:a17:907:7a89:b0:c21:8c6a:c680 with SMTP id a640c23a62f3a-c260ca21e53mr28157066b.22.1788458449738;
        Thu, 03 Sep 2026 11:00:49 -0700 (PDT)
Received: from localhost.localdomain (185-130-167-72.kund.ip-osteraker.se. [185.130.167.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d581f51sm3362166b.42.2026.09.03.11.00.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 11:00:47 -0700 (PDT)
From: Sebastian Sjoholm <sebastian.sjoholm@gmail.com>
To: bjorn@mork.no,
	andrew+netdev@lunn.ch
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Sjoholm <sebastian.sjoholm@gmail.com>
Subject: [PATCH net] net: usb: qmi_wwan: add Quectel RG660QB
Date: Thu,  3 Sep 2026 20:00:44 +0200
Message-ID: <20260903180044.6179-1-sebastian.sjoholm@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Quectel RG660QB 5G module (USB ID 2c7c:013d).
Its QMI interface (interface 4) uses class/subclass/protocol ff/ff/ff
like the other recent Quectel modules, so match it the same way.

The remaining interfaces are handled by the option driver.

Tested with an early sample of the module on a Quectel 5G EVB connected
over USB 3 to a Raspberry Pi 5: qmicli talks to the module via
/dev/cdc-wdm0.

Assisted-by: LLM
Signed-off-by: Sebastian Sjoholm <sebastian.sjoholm@gmail.com>
---
 drivers/net/usb/qmi_wwan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
index 8178a8758..c940af5b0 100644
--- a/drivers/net/usb/qmi_wwan.c
+++ b/drivers/net/usb/qmi_wwan.c
@@ -1084,6 +1084,7 @@ static const struct usb_device_id products[] = {
 	},
 	{QMI_MATCH_FF_FF_FF(0x2c7c, 0x0122)},	/* Quectel RG650V */
 	{QMI_MATCH_FF_FF_FF(0x2c7c, 0x0125)},	/* Quectel EC25, EC20 R2.0  Mini PCIe */
+	{QMI_MATCH_FF_FF_FF(0x2c7c, 0x013d)},	/* Quectel RG660QB */
 	{QMI_MATCH_FF_FF_FF(0x2c7c, 0x0306)},	/* Quectel EP06/EG06/EM06 */
 	{QMI_MATCH_FF_FF_FF(0x2c7c, 0x0512)},	/* Quectel EG12/EM12 */
 	{QMI_MATCH_FF_FF_FF(0x2c7c, 0x0620)},	/* Quectel EM160R-GL */
-- 
2.43.0

