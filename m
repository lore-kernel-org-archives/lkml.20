Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794075737;
	b=w+E7GWnLO8Vj007Tu2FfM2dt/oA5Uy80vmEjbMbJhioJv7CFoQMLEqYlN7Uqa0nTea3R
	 SOplFvJ+pYM66SaSGwcg1aC35eFvnpnPjddS8nH7GsdgdjB3rB2poBmtkhE+GPkY4qkB5
	 xKxBsgQ6jvn6YlOwC/4jqihf25ZxL0uszIozlpRMGKRat+OP/70dUc7CZLugwPtCJc4jR
	 qK6nSmBCFw2WiMRLSYJnG5WZCJQfJRXk95ejwov6yvlsk99APrlt8bAGbJYCkQOkK+YTr
	 uQkyFXeS43IVvNEF4MMAjCaIJDmGrg7QV+bHecM95fT95PjamIV0XwLCyXwoPAZsedg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794075737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TW6QFkGd7neo8fg6RUV9wkGb9LD/OTXb46vxR11jHYs=;
	b=cjQhwvxsClSwWlkLJRqR3G8a6mfzekO//UyVqda6Jj/YEn/o/kWRh/x9UnusMYtxWxnf
	 npahBH2N6EbKEmwP44KcbsfPvkYMsuUzIm5fvRMZV2M+vQVX0SAcUrwFt0mA2MZK3BOJd
	 Mq0NaITP5zK+WXT1f5CzUFsYAqughhVyCdKZ+UE39FA9gmP5qGWf17J58DMLOugNl4Ih9
	 3EYQMY2vUnccKSxegD/OcQHvR7MNpFwVNyeNGqeKoJvKHHdmOxwEgTK1BY0+2hiPhd3fz
	 rmh3wAzxjZHiSd8HcU4blbY0mmprqdOkOi8Vj7IVllpCGczR+1Ub9OWOq87LXEPC7tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r+4giMnL;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9835A606A330
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 18:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9835A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r+4giMnL
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b467581b98so13104965e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 10:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794075735; x=1794680535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TW6QFkGd7neo8fg6RUV9wkGb9LD/OTXb46vxR11jHYs=;
        b=r+4giMnLD6D7bD0G5TjnwMTGNTmxIZ3ZSqc+WRg1QY3+lFsFaLxGGuXfcE/H5tIXUs
         lOP73pN36iNz6KFqDaX1/ouI1LK+oYDM8Wdeq3RKGI6zTk7R8wAVIpF/uC2MWtkhSu7i
         kTj9/U6sHVSQlOvM70RAZ8C/8aVc1ypLzgzdhXdX9oS4z3GTw/HHWUR8h4xWgYUafhUI
         sOpGtcS/mzNNC2rO/jTqH5oDrP6nionTaB7CR092CgUwc94MCIxilzL/PdQ0jU9VuMQz
         pSjEE2tXMOAIQ1Li4hWCCdPgKRJsJPyKLperkagbHtPZxW315FRw6Mh7G1FrmFILGZXV
         lsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794075735; x=1794680535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TW6QFkGd7neo8fg6RUV9wkGb9LD/OTXb46vxR11jHYs=;
        b=DCoGTkSzhG5Y61oIIC9oqGONlORokfvl9i7unbhEbDg2zsrxcl1wN7+lTDxyghFG2F
         XjvJO0TlDQq0TR7KHmP8ccK86Fe6yfSxQdAcBtgUnFxnM2tXZ/M0dzurnFIsDH1xc/cY
         tmaUE3Oe1TuPbhRfQ29iaaYFLwRBGFq1uaOyOqnBFvMDiARu47AXvOL8e6x8cGJJ02KH
         0kKNsd3odTUikh8TRlWeBfsZzWLg/N8xFwuCeQuolpdcQVLs6/BhU1NB9wHStKGusekd
         ni4Sn38HuYQopkn80wMBN3YwTTmaNZoo3vGiZh6uHlIcr6/LTyB2DaP5cjnK/jMAlnds
         P4sw==
X-Forwarded-Encrypted: i=1; AKwUvByQ2j1PbLbzh/din2yg04xLnlCwrHFuqO8YW8cFZ5T2oizuYF6epiEV48ojH2olSPstJkTzkvJZ3qcIqRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SaSvTwdcyS+45SQyIe4zqsyCyheaJ48T0BUWxZfYiGZPwOiNK
	hytZxTobD6eCLQxJf6b1i5kIagONXGhkZSbbHyxsCf71MDMvUKjT9oPK
X-Gm-Gg: AYBFou1MbsTBWe0WzoMYnuAshUDzxxL5nWuOojsImNmJWXOUPHRvK5CYPNqU6RV0XSA
	mfPc8LqpgLXFJCaYQGqFfXFhb6EEFzMdg4A0b0rbP5vIfVRPZ33R9OXuWb6BN2UnpF6k/zsh5Dp
	ICItjhv/wrGALmIt2uSh4VXBGvChX8Jjc3VRn7qwo1SnZhLCNbqL6e2FJgLRKfwrR8+sdqxriht
	C+8JN9i2fa5wMFS+IK9IaEklH+r1/1klteCcyo1k4sdWCiI84SX/KI9GI5FdnvxoJIY8w2FMPs2
	L28tPt4y4LSmQZ0qvxyyOb17X9zStTxErwU2whX9ajd1DSmioB8a7FRrkUia7KySzV8geqqO223
	YL8lO+wY/ouM4HHqKl7Pt6HArXXBjVLN7pseJE6rovkPoHxaz/+OQXoAL/mNHpeemZKrBCiaeV+
	uPDaJYX6S2BjybQmQFo0pBQvnf7o1T9rCAhcZJQEyY5mHiy00EBSUSDxwj4tMpITAuptzdnbfyv
	AV2P6+YaOA4PRnWqK+AXnqdYkOUiu0ZhkEJhGf096dFJ9wBgLdoI9C+jiyLWYlsST+SyQOrUwel
	5sIveafqyhczyjCvWp3p+uFlxEMsRbEaNVxL4ETv7zPJDAdy2C5jXKu8V57tirqE9EdDeBN/5PG
	LGz3aLjbc05H9Wpg=
X-Received: by 2002:a05:600d:82e2:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4b6df6deffbmr110679175e9.25.1794075734861;
        Sat, 07 Nov 2026 10:22:14 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbd082dsm59551055e9.1.2026.11.07.10.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:22:14 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 19:21:31 +0100
Subject: [PATCH v2 1/6] firmware: raspberrypi: Add blank line after
 declaration in response_callback
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
Message-Id: <20261107-fix-raspberrypi-firmware-v2-1-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=641;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=oT/JQjeja8ZJ/ptNbh5as5O7phAoJf3oIOYYqQOmlq0=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq72xVMnfEP2TO+oiRDwrTAxKzhsHQjuXtWzrj9
 5gP9eekUcOJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9sVQAKCRB4zXhFDAXI
 Z4ifD/wKSyOFDfXtz3emcdtFHTQzLEeOphtdfj8ZonH60pWC/jo7wuJSwuCddoVKD/9BvKRXB+U
 IIyRnOY4FNKKMZkEW0SqIFH14r0j9ZANA/CBqjJ5MFqrGpxiMgL8SsdPeqG4jyaTySgH+IOfO+a
 jCbHKv+ebLFeRNFafNTbEwbx2Q1DNLwFaekcZlLcUg4t+1diQtJ987s7S90aXRILodT4IcNHcsV
 Kmff29vG0BvtUvaEDvys10FOPPOT+7YTYdIBrq8hj8bYqxk2zU3TSPGXsEhMjtnwZQtpHiOZrA4
 xthOJ8uf9w6r1plx507zqeK8JJja9stJgDhRNBqkslu781LcJGt1hq9mJAtwBCtdva9k5jFvTLQ
 jXU/2/tYgAm00KSS5DwEDRbCG+Vq5sFAQmgU1IUUBI7pPIMGQtxRp7JCKQVt/KmbnuNc0aUDmhn
 VHZKDvixjrbep0Gy8Ok31uGPDD6W9PNfQTqKbxOI4vnThwS7I/Kj67lJR98H754mo17XdJvg07S
 IGcgu2zAEto9uRMxxmusz8ylPK6QPjzg5N1ZhD1MhYS0aGDzAJJbQGqR0bOXgMbLGtATTUabPHo
 tw2RZnwZwOwbJXKUU07GBqicUQaQmoiswFlJmwwl7hjPkO8OklYSoPbAgegkI9HwfpxmBCke9Xu
 eMKqF/G5AubmQvA==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

Add a blank line after the local variable declaration.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 443459c8c90f..8f3653c4a669 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -40,6 +40,7 @@ static DEFINE_MUTEX(transaction_lock);
 static void response_callback(struct mbox_client *cl, void *msg)
 {
 	struct rpi_firmware *fw = container_of(cl, struct rpi_firmware, cl);
+
 	complete(&fw->c);
 }
 

-- 
2.56.0

