Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794171865;
	b=riuTmmWs1kcs8sT9gZu/EiwxcTCbsTOxQYOjIn3dER7aX/4sZ15OwEsSHVNyTYcg5cJv
	 y9npFu3XfVfNB05dc0Wb9yR8E9g4Ie+uSLKCSYHQhYP+08Nja8ZwByIzxsdwzJC8Gnx1M
	 PlZBJ3F17sEEqpXHqiLOUcDIDLtUvQJqHw64YoiXVwP8yUgNJbYaZmR1h+FAHfqzcau6Z
	 N1qaHerAPgzWmKI81/nWfs8ad6cCY8dAFprQzT2e8E/N2tgveJSfwHcKYMYlz9kxllakC
	 MWJdM56F2DlF0yLLZW5+tKhN8zC1GQzUd8gzYkAB+bJzXS5EpfrgUWE+uAVuS42WJjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794171865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=5GT+YOwt4Wk5UaYozi9TZs9C5IMfkSYjhBBTrIEYhmQ=;
	b=Vx7MWKPcnjw+xHp0XM13R/2sSux6nXacZDceFmLHiKuG5hH5Y1CquVI4URsXGLnYFnZj
	 qitaG26YxcGn1Y3EJJkjJERPSye0JGLV6YKz403ibWO47tnJMUnW4nuIgxAoyEIuYEDbp
	 XgYXn/k1nm5jSwLKoK2+CVZzenKTiPzJH4+YdnOPONb9iFJjY+NJLTZkk9W2Ip247Ps5F
	 lTBL/fKBgU3Ugm9pITlXfCRcDnoKRjkRoTZEY4CsJdP/XO5XfqhAMi0+lpl60ADu04HXk
	 U6eB3hccfX/taXft3E5Q/WVtEfHcSyCplW93lOisDK7yFEuu+XLWYmWR2ZwYB673yFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="QtEgshp/";
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E2C606A335
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37E2C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QtEgshp/
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4a76f0cce5fso112509fac.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794171864; x=1794776664; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5GT+YOwt4Wk5UaYozi9TZs9C5IMfkSYjhBBTrIEYhmQ=;
        b=QtEgshp/hMdeDywBQqrU8jr4TeOfNd23D70HubU4cWYXtrvU0f8+P1tZtrSSRhL8h4
         NkZI+unS2oj9gniScMyAsi7iQhS3EddiwtjuwolxsaNF8WYQovDw62JQ8itQ0CnZuVUc
         LgHniQiVENtOjxwE4e2c45rUFubF6Bh3l9sMUqGK5cNNQoPhGiYcbHnyLr7vbBaTmfHW
         IlefwwyscLyhVnL1kLE8rRtyGHXUL96gA4dGHQwBCQ7NBm/Cdp8060cDsHwJUR7KTAG/
         dT+Xd924Q0l6IeuFJ9aA8NCbxaF86vaiFyO0u4KaY2HFwJ8ZNU5cII2Bn5x+ko+aPnIz
         biBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794171864; x=1794776664;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5GT+YOwt4Wk5UaYozi9TZs9C5IMfkSYjhBBTrIEYhmQ=;
        b=MvaKGeB4jn442k4NLXhvLLEKcBBIyEBHdVNr9UHSe99BmdHEy0L3r2oQLJSrcdwLbe
         Ca3XnlGQFIWl/iC17x4Naei5dzAKXRD5RF8q18s660RmaQwSExycYSHKoNoQOIH/ICVf
         9deiLPLokjAlaZ30W1nrJ5bCJBE9P6/RYQXwT/Kl3fPRvBfdAfN8JwpuDMBOECECBTJF
         h4ywIY5TIDQnAM2GAxYDRxx4no/RcF6+t6l5nMuhbO0KB3TVT2h1OZ7cmhSd0Z3GO1+7
         OW2+sdx7mmPTgNNgPnwN2MghtqgHJvJa0J6I+tCOkduA/wUpGrS25vhkzON3AWlNzTDU
         XGeA==
X-Forwarded-Encrypted: i=1; AL+hErG+A0M/UvtcjOViil9EEL1fOxHQKOx8ZO9xVB2mAmTpsMJWNIUcNrmrPj4Eg6hbrOtBDlq8zXVnH26YWrI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/COzW6bT9Q/MyD0ey9dsaD7Frkasn7BLsg/qlf0r8DQKn71Fug
	2UeKR3vDAii2Z7c1gMh7vhhB+4DEaafnoB+GUABiUJflTBmUa6a65uzKzmLwoQ==
X-Gm-Gg: AYBFou18wEoFn/xZ2Zzy45lMSNn1hLAIfOj4TcPSEPj0KfsTNo6yflkUUtrU8l1WVNm
	9Tv0FGq0OZ05l8UdMXWtEuGsa1qOqeGWTna/jc6TSZJZBBNhOcUyBon47NMpNh6BJOooK1GsrXr
	E6zg85QevW5sEA8MAOtroYnlsLCg0JvUSbfJzH2tnKYMUYfsdr3hA28sf1c7ZR27696pc2KkVVA
	EqXfN4Rd2URXJEa43CbDS7Fy8qF+nMKfySmrAbpJoUtU1qtH6/c8pvyKK1WY7tLOsh//wyqKkvy
	0eD/PaIHVhIeMJ05bKFgQwYq0zNUTk31d4aRk6u7/ycpvyM8BEYhFGiW+g42BsPFppnQJ56PL1d
	pNfzfmvZNQZOJ5UstHreotUVVFIn/0F7eYc+8DhppBKBY3oJeVtUpDS73uKq3KtGab6fVLvKP6f
	JE9bFUZGNMnHb3iinTY9ltu4xmPfhxYhIWxq5raFdG8xGz+JS8l3Irgx5PCcjdtSnZ0DV2zlGVr
	rigtlVqj/N6XTLihL1b5ZNo3XStNk122kr3jyv9GNwc97C7u72cbjgjMn+CUiX+AtlXygBPwZfM
	/yI0XeSgnK1xi2r67QYx+o82nP2GHRugrsH9VH3Oze/YxwsPvO0xejyHGUcx7YQYPi0OZpXfy8o
	jYgWWer3lnhLgV7yACzNlXKt7mylGMQfIjgiJMN8hGFDUKES4fx2GHBA5d6jZwtltneAUJvXAkq
	wnXwpmFomPS4bkxxin/4SlTTdNprf/bZPqn5JuZ80Ul/kkpyecnt6a
X-Received: by 2002:a05:6870:538b:b0:49d:d617:b692 with SMTP id 586e51a60fabf-4adecb98a9dmr1074710fac.49.1794171863950;
        Sun, 08 Nov 2026 13:04:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade695a5a6sm3597440fac.10.2026.11.08.13.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:04:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:04:21 -0700
Subject: [PATCH] mtd: rawnand: r852: prevent card work from being requeued
 during shutdown
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
Message-Id: <20261108-submit-r852-shutdown-work-v1-v1-1-8e448ad7c54c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM2w7CIBBEf6XZZzcCltb4K8YHLltBU2qAXpKm/
 y7oyyRnMnN2SBQ9Jbg1O0RafPJTKMBPDRinwpPQ28IgmOg4Zz2mWY8+Y7xKgcnN2U5rwHWKb1w
 4cjkQa+WlZ10LRfGJNPjtp78//lz+LzK5OutCq0SoowrG1WrM9hxUKEFbhuP4AqcfqoagAAAA
X-Change-ID: 20261107-submit-r852-shutdown-work-v1-15fe04537064
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 David Woodhouse <dwmw2@infradead.org>, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The card interrupt can queue card_detect_work after shutdown cancels it
but before interrupts are disabled. The worker can then access the
controller after pci_disable_device(), and can enable card interrupts
again while processing the event.

Disable and drain the delayed work before turning off interrupts and the
PCI device. Later queue attempts are rejected while the IRQ handler can
still acknowledge events until interrupt teardown completes.

Fixes: 67e054e91924 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/r852.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..bf1c1be7f2aa 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -1007,7 +1007,7 @@ static void r852_shutdown(struct pci_dev *pci_dev)
 {
 	struct r852_device *dev = pci_get_drvdata(pci_dev);
 
-	cancel_delayed_work_sync(&dev->card_detect_work);
+	disable_delayed_work_sync(&dev->card_detect_work);
 	r852_disable_irqs(dev);
 	synchronize_irq(dev->irq);
 	pci_disable_device(pci_dev);

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261107-submit-r852-shutdown-work-v1-15fe04537064

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

