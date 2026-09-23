Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACA93B3BEC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152890; cv=none; b=AkiPfjk73Xe7mlWdh9eHFOAxIXvZbeoFwxGZ4Y01BHhSO7xt1X9RWcTWcG0yeg/A0amYEDC0wuyrlD99rfr/4XCm2I/w+ZjjhO8UXTnUHhbAOfR160AfVzBLWPf+Nk3AvqJkkBnlr11ymen/KiR3OtExAz0yLhwohcpN4IxqQW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152890; c=relaxed/simple;
	bh=MtElMJ8fbL766bC95A8ZzPRkioZPIOD0KBOOEsCnNBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Po3gxaoScl+AD7IeKj5DoMy4QOn5b+028pR200QUvspMDSAfspcs4tdWP0vWc5JXecFR4+mQV6qmHKn6DC/odgCmduzPTMRPD/ANOk1ICaQOUWof2jZUFQdZX3cgvv93CNn+qkLT1XEX3Ap/cSxacwZfLT3/w/gsQ0YIXFYE7dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jz7BOztW; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jz7BOztW"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398c066106cso403363a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790152865; x=1790757665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FFMFjnfJDGF+mkKV4NlETqKvpStxbHkejYuXiptoDT8=;
        b=Jz7BOztW05YtqM24OhZpJabutmbXTXX6pYw434qjpjj+rdWCREpg+bDawCVeUw9nc6
         YYyB7R28H58WDxoKxCdWyMKGnSxcfRveqrO/hzC0bnmE9Oa5lfosP0dhyF1xvelhK+LC
         ic1dOvI6jxYDBRveiTYNc+QDlak7hFYkWHVSdQJXmgHwqCHqNOvD/ohA9+8npspw4hrd
         RV/Ly3HS3dnFmnIkI6HTGtodi4Gmw37ePePOvgwvuhzO0GesBQrMguq8OuAxYFfBo/9B
         hgt7jL4ZNzZWxMjn3MD9cMlfvRUJXTDm2iJU+9sbMSAqqKvVAzU9w59BkOc8zoTZASFl
         CErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152865; x=1790757665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFMFjnfJDGF+mkKV4NlETqKvpStxbHkejYuXiptoDT8=;
        b=oaHC3KuOOTF2kPc3W24O3g/raTCTfpoYZxtpj/8l67cpk/F5ppuUmgaJZ3V7oBBsTm
         C3Vy4OEnusMikScegr3VbEw9bPe1TKkvww3m2zgLoK0wvHx5W1qra+jdrSgnwdRPZ0ff
         l1dxh1AMnHQNu+5YoIz/9thOurWIeRRcqf6934WaHCeLpjvuUdbIUYmaqpO6da5cT/9q
         dznTDZSyRcr+TaHYmJBv9cLSVX620UUH7V3EmBOnMQ1dFiMlXuVVRHMAanPJe0ebFX7Z
         iqIbgsiyGj6FyLkKpDBNPiU6n84SJLxBsWzkv+SbwuoisIwcOvKkDIRW6rg5ABQe1gNP
         OHVg==
X-Forwarded-Encrypted: i=1; AKwUvByWi+zhesU55XBYETPsv8Xhx39xYqc39GNGZBH5FeI4xe7gZM79svfDPjo8CsBmuAv9/pCT6bUcuCIOlLI=@vger.kernel.org
X-Gm-Message-State: AFuF++m/jSpPNiWpTPZmWuPPirDtW9y9CD2pVB9/rnbIXUHpmwluohsv
	ARBVABxc7RuZXBUq9ZbaWM0tusYAtZtd4p3yAJjzxH/Qlg5IitR3Q52p
X-Gm-Gg: AYBFou2dDqGzdWot6KUKMLjl1gGLqloW4aHBbfmgwLXPBoxrKE6SGLKg8If7Gh2tsRR
	W1QVHkNliiZlrZXjm8UPAr+I2JIOdeSSxhEJHUqZrcC7Bq9LpxGej8nk9KlMp9yUgHGSI7vG7Qo
	QsWyXb227bhGtxX1FFkKEl1dFOyi32wjS3hPUsvktgkRZBHirwA3pJ0XjT3ZYHQ5vowF+V9Ongv
	V4g+6jDOn5frunSBnhaSJrnNvSXVKhhx8wPsNyT+L08OKTbCdMHoZMSU0llHkfiN6B/xIRKsMtY
	n48rOMRCfxFfIYl5K8CighurzLJrigTtQojIEUopg2mzTwSjTys09soHsXQ3N0lhMdTmBpo1Qvi
	ZE0Tp5EVn4TdVDrr9A8XGkj3/dMGsVn0d78LnfzDyPY5A3F834CxpA1vMaWQeJ2HWjbj37ehaTd
	+yo9PnHDXJw5OlOKhrxNxstYw2Z+W1nBTrM5VkslpVSJIFtRzfLpo5ipR1lZ+ubRiR47Hg04Jeg
	pcOGAS5Fq9O7Y1jDf0HhbYSjABDWcItLSiAJ30jeK4Hs/aMRyKzffiiYGxEEK+gW3kVFyrOLICH
	mQ==
X-Received: by 2002:a17:90a:d645:b0:39d:f317:44cd with SMTP id 98e67ed59e1d1-3a07e554e0dmr1667962a91.14.1790152865102;
        Wed, 23 Sep 2026 01:41:05 -0700 (PDT)
Received: from localhost.localdomain (ec2-13-212-242-176.ap-southeast-1.compute.amazonaws.com. [13.212.242.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0812a1eb2sm1105330a91.4.2026.09.23.01.41.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 01:41:04 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: dm9000: Fix a recursive lockup in the TX timeout path
Date: Wed, 23 Sep 2026 16:40:55 +0800
Message-ID: <20260923084055.65091-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dm9000_timeout() takes db->lock with interrupts disabled and then calls
dm9000_init_dm9000(), which expects the caller to hold that lock and accesses
the chip registers directly.  For DM9000B devices dm9000_init_dm9000() also
calls dm9000_phy_write(), and that function takes db->lock again, so the TX
timeout path deadlocks on the same CPU.

dm9000_phy_write() already skips db->addr_lock when db->in_timeout is set,
because in that case the caller holds db->lock and sleeping is not allowed
either.  Skip db->lock as well then, so that the nested call from
dm9000_init_dm9000() works as intended.

Fixes: 6741f40 ("DM9000B: driver initialization upgrade")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 drivers/net/ethernet/davicom/dm9000.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/davicom/dm9000.c b/drivers/net/ethernet/davicom/dm9000.c
--- a/drivers/net/ethernet/davicom/dm9000.c
+++ b/drivers/net/ethernet/davicom/dm9000.c
@@ -325,10 +325,10 @@ dm9000_phy_write(struct net_device *dev,
 	unsigned long reg_save;
 
 	dm9000_dbg(db, 5, "phy_write[%02x] = %04x\n", reg, value);
-	if (!db->in_timeout)
+	if (!db->in_timeout) {
 		mutex_lock(&db->addr_lock);
-
-	spin_lock_irqsave(&db->lock, flags);
+		spin_lock_irqsave(&db->lock, flags);
+	}
 
 	/* Save previous register address */
 	reg_save = readb(db->io_addr);
@@ -344,11 +344,14 @@ dm9000_phy_write(struct net_device *dev,
 	iow(db, DM9000_EPCR, EPCR_EPOS | EPCR_ERPRW);
 
 	writeb(reg_save, db->io_addr);
-	spin_unlock_irqrestore(&db->lock, flags);
+	if (!db->in_timeout)
+		spin_unlock_irqrestore(&db->lock, flags);
 
 	dm9000_msleep(db, 1);		/* Wait write complete */
 
-	spin_lock_irqsave(&db->lock, flags);
+	if (!db->in_timeout)
+		spin_lock_irqsave(&db->lock, flags);
+
 	reg_save = readb(db->io_addr);
 
 	iow(db, DM9000_EPCR, 0x0);	/* Clear phyxcer write command */
@@ -356,9 +359,10 @@ dm9000_phy_write(struct net_device *dev,
 	/* restore the previous address */
 	writeb(reg_save, db->io_addr);
 
-	spin_unlock_irqrestore(&db->lock, flags);
-	if (!db->in_timeout)
+	if (!db->in_timeout) {
+		spin_unlock_irqrestore(&db->lock, flags);
 		mutex_unlock(&db->addr_lock);
+	}
 }
 
 /* dm9000_set_io
-- 
2.43.0
