Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525EE3F482F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373556; cv=none; b=VADbGYz9f/A17Boqs+tub6Ffw6s7B8o0TWFLyeRzz3uO4yqaUBsvoIGI0eIaX6OI/YCqCKlG7uApwH7+UkVXT0Wjnv2YBJ4JR5dJI6Xy93v4kU1nIXZPxY0qnqcpSW/JQZXI0+a1r3RsQ5YdmBslBafBszQwmFnaYkrSsjCXNIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373556; c=relaxed/simple;
	bh=SxT2adBblINXrJRW2bTxfIq1b2HqI+JoCaLJCsifgDE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kXkZtm+ArcGI0wTr7Mc2YXdGBirI7FU/s/EGgLnTt0KImWYEdx2c8y13XldsK0R4K4GHgkp4crWgD8s0lZERsPUZPnZp9GDbg6w7MnLgypwFqkqd39DDFBkZTmvR9vXT2GNzDDU9/Y8YqXcK8S1qYay+5yJujSS96C1ICM2WfUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QjVBo375; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QjVBo375"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cfbdac7a1so1042465e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789373553; x=1789978353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WvL+tll9z+rZiVIgsLmiJriXCowgjHq2TgUmvCdD0FM=;
        b=QjVBo375JZcFJtecHvZbILRlqVcngQWuPlJ/AqW9LbYoyKePG1QsXSfsQl3se677PY
         yFwNA9t6Gc19iD9KlVYpYwB6zmwR9fKOMB3UQ8hmXIZQXQZc3RlxAbFRbrG1KAdq4J+L
         G7T5zFa85QhMyc9aMADvYQtx3CKm28YtPWZ31WZ/DJzEhRALJ9vCD7KWXGYEhcuF4xPz
         WFlEhJ0vxTTd7V8BOoqoz2UCKOilSGmBIVoNkhlmgpi4ZL0ACMov4iMXW4Zgrrj8XD0m
         f3euaz59kCIlWHl6LXKH+HvghUs2qIFwu2kz3Ix2Cchm969lj2jGdmW65QQfbVUQGXPu
         uZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373553; x=1789978353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WvL+tll9z+rZiVIgsLmiJriXCowgjHq2TgUmvCdD0FM=;
        b=nIrWaRCR9GP1hRWvjHPdyk11PIzxsThgSB8oBshtmRYxOTdKZoBZ0xDUjWwJmona17
         OykWQf/ltrAWV4qClR94xWBkmhnBpxhK5zZFQpfUCP3MSdMcFfSOROtPBItm2f+1diZ/
         mwOo7mTE+0Or/EE0FMkMmIhYszsCFytBWSf9U414QvedOup2A5iMosOm/8sjm8PpE2tW
         1uBcXQy4qBqGLJf7UxO1OlbI8Ll/ZYBdFm5AOm/efCReFUyLcepDWM2+yXBEUjw47Tu4
         hS1GNiuxjzb1nIsqj0xVJKCskvPIS5Fkbl/XtyhDc109woVB5OaYwO+TD2BjDDHcWprL
         +WWw==
X-Gm-Message-State: AFuF++m0sdIw3hP8P3jslNAu1fCkymcTLmqJBagXgy8uMU3O18n0RpcP
	XsHlIAN2h/cFcyrhvLorDQ0mZlLud67rAF6SQYhomZARqYm2In1VygoQWTj8UdvQ
X-Gm-Gg: AYBFou1TAybzvlzw0mEDAo65BN6V2faFlseb9H07DqLWVwNsWGnfa2NBfSnKanx0mA0
	KWtsO3uwxoZrQvYx+eQEjX5t+54T5D2413EYnzfJdsIke3UhxT7ArJVU3yZKENuUQe3sTOJRqyc
	ViMqxMEPI+9tntOxVWknFnO8jlXuwAIw2a7FrM6ySMKvuLftO0W8bVLbCAwABW6fjtCL3nXqMMh
	TrMfmlZpFO8W2gH0FIep6bUIoRJkBDb9ccTuHqcNNJ8jDuRTNbtdLGimS7yxhrbvm5K9ekrmGxB
	HA/4zvFhzcVxJ8ru6t7OE8bOgm/7D7t89PiYeZnldBaJDuvQtb73nLR9w7SVNhg6A1CZlxwJmrB
	5HTrrXdHIKiSjM3iEGDH5N25w5kZVMB+/4VuO5SYYA79UhPd0xT5VLTwB1CTrQhrMBeBLaJzur+
	RD67jtrVxwoPTuHw/Fi3sVFG3MIq9gOB/KFLSJlpPZurvbxalTvjHFXAm3Y97I1+5LoxxzftRH1
	3d8Ll/rdnaDQv6W0go=
X-Received: by 2002:a05:600c:4683:b0:49b:9241:7ff0 with SMTP id 5b1f17b1804b1-49e7a5ed9a7mr13611875e9.0.1789373553467;
        Mon, 14 Sep 2026 01:12:33 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60acff8bsm301434385e9.9.2026.09.14.01.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:12:33 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: mwalle@kernel.org,
	pratyush@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	vigneshr@ti.com,
	richard@nod.at,
	miquel.raynal@bootlin.com,
	takahiro.kuwano@infineon.com,
	Itai Handler <itai.handler@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] mtd: spi-nor: fix the lock left held by spi_nor_rww_start_exclusive()
Date: Mon, 14 Sep 2026 11:11:47 +0300
Message-Id: <20260914081149.1916589-2-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260914081149.1916589-1-itai.handler@gmail.com>
References: <20260914081149.1916589-1-itai.handler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

spi_nor_rww_start_exclusive() takes nor->lock and never drops it. It
returns with the mutex held whether it hands out the exclusive claim or
reports the flash busy, leaving the caller holding a lock it does not
know it has.

Commit 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex cleanup
helpers") turned its "goto busy" into a plain "return false" and deleted
the busy: label that did the mutex_unlock(), but kept the mutex_lock()
at the top instead of replacing it with guard(mutex). It is now the only
one of the ten spi_nor_rww_{start,end}_* helpers that does not use the
guard.

Its only caller is spi_nor_prep_and_lock(), so on a flash with
SNOR_F_RWW set:

 - if the flash is idle it returns true with nor->lock held, and the
   matching spi_nor_unlock_and_unprep() calls
   spi_nor_rww_end_exclusive(), whose guard(mutex)(&nor->lock) then
   deadlocks on the non-recursive mutex;

 - if the flash is busy it returns false with nor->lock held, and
   wait_event_killable() sleeps holding it, so the operation that would
   clear ongoing_* can never take the lock to do so.

Nothing reaches this today: the only flash with SPI_NOR_RWW is the
MX25UW51245G, which has neither OTP nor locking ops, so none of the
existing spi_nor_prep_and_lock() callers in otp.c, swp.c and sst.c apply
to it. It becomes reachable as soon as any common path takes the
exclusive lock.

Use guard(mutex) as the other helpers do.

Fixes: 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex cleanup helpers")
Cc: stable@vger.kernel.org
Signed-off-by: Itai Handler <itai.handler@gmail.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ccf4396cdcd0..8bc117b46e02 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1310,7 +1310,7 @@ static bool spi_nor_rww_start_exclusive(struct spi_nor *nor)
 {
 	struct spi_nor_rww *rww = &nor->rww;
 
-	mutex_lock(&nor->lock);
+	guard(mutex)(&nor->lock);
 
 	if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
 		return false;
-- 
2.34.1

