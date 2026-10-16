Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB182D73A0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145456; cv=none; b=BJKq4T0HznjBvvzgOvchyNM2euXJFirRxwtJ4dj4WQsgXVE+oDXgaCxTeSa99YWMrBzwaD/rpXk8emB1Qi/FKu/7YN0kgRjgF6zQj+3zRvE1ttFKO1vPvCebnGqC5j5perEvIwzaK4crbpWdDLZ37niQuWTUs3KIDDdCfTsTK2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145456; c=relaxed/simple;
	bh=oRhTkADbPPFk2lQxJ3Q9u6uunqgBs4YugN4ok4WKsVk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gZPiPBNIlLRhN00/L8Fk+hTuzZXPpx4JTfcPElFScyz1kiRN5j1quLXF6KdRzgAY6U1wZnZvrsgwur6EbHS4luICUBWgvKWdA8pGU8sTJi/LQy8UAVR0pGHO7k+5KEU7i87KCUtTsSgP3WY1uNqw4MGwBedeV+bvU0oCGS/DP3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=T92sHFFE; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="T92sHFFE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=s7
	ahz3ZxDOrAoSGBstCMhjFpTs1DKuTtqUs9FA5eqxs=; b=T92sHFFEQcwomuaQcH
	lAY0IPMMYmEFIEZ60p/y2cGvYkdFAyIjIPO1/ebkA2REh4HZCWp6qX18qYZEaWOY
	yS1oXtWO6P4pi+LqJXPeDbFLXL11z7sUg2GWBY/nal2QPzeNnHlRAcua80Lhv5hJ
	UWbwBngwE4mdXSy1Wd/dHH5EE=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3XwMb+NFqvNkBAg--.61009S2;
	Fri, 16 Oct 2026 18:10:36 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] misc: bh1770glc: queue proximity work on freezable workqueue
Date: Fri, 16 Oct 2026 18:10:33 +0800
Message-Id: <20261016101034.2586548-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3XwMb+NFqvNkBAg--.61009S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr4rKFW7Gw1fZF4xAw4xZwb_yoWDtrc_Wa
	y7XrnrGryj9w4jyw1vyr13Zry0ka4v9r95JFsxKw47try7urWkJF92yr98Aw1UuF48JFnx
	Wrn8ZayfKw1qkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiSoG5UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xxUjmrR+ByPvQAA3E

The proximity fallback work reads sensor registers after a delay. System
suspend powers the sensor down without cancelling that work, while
schedule_delayed_work() leaves it runnable on the non-freezable system
workqueue.

Queue the fallback work on system_freezable_wq so it cannot access the
powered-down sensor or its suspended I2C adapter.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/misc/bh1770glc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/bh1770glc.c b/drivers/misc/bh1770glc.c
index 98fc5970b2bb..3411947d9283 100644
--- a/drivers/misc/bh1770glc.c
+++ b/drivers/misc/bh1770glc.c
@@ -620,8 +620,8 @@ static irqreturn_t bh1770_irq(int irq, void *data)
 		 * next expected interrupt time.
 		 */
 		cancel_delayed_work_sync(&chip->prox_work);
-		schedule_delayed_work(&chip->prox_work,
-				msecs_to_jiffies(rate + 50));
+		queue_delayed_work(system_freezable_wq, &chip->prox_work,
+				   msecs_to_jiffies(rate + 50));
 	}
 	return IRQ_HANDLED;
 }
-- 
2.34.1

