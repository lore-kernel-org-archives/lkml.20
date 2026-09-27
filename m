Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997DE3EC816
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790512539; cv=none; b=f5TNxbGa+3YK1gnQd0NuImmigO4zBEkhfxUwJvrd/TXIX6nOhq3DO0xuUg/XOLTEwxS87OnCzO42BN91GcD0ctBrH/oTqdSC5BD0C/WlRCipbEMUc2KKN6nYMIQOlzxS61Q4xTmHp3P65FtNfGuK3KKwYvkvUejgi+bl/9xS6lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790512539; c=relaxed/simple;
	bh=wa4jj6x/0TOPi8zyhbCImj35uz6YAizmR+rXe/IRWRE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S/tTdPA4xZPNwaXvRVDaDLbr9jPDkdbjd8k9IFY5GRInc+js8Dap/THg9H/K6h4iywYLXTQD7dvitOYKWPwPAglVK2ZOgK0HWRVIv/uNGe43AQ4OAuV+PIbRcN9wPExfcJX5cRxvfgf2465aRCYxESJ2tX60BzKrGw5+ovMm2bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TN9jFV50; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TN9jFV50"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=C/
	tLW01LeYXAugZju/lcjvCpP70zL/B8XlUzHfj3iiw=; b=TN9jFV50OdMI2+6FJ+
	X7ZjwQfEaoPAJK/ABDEHBVOqQ9CADZ7bjkaCn5LpxQh4Wu+HlAuzNlX5Arl3NY2+
	zIO/ZlB4fCyOJEOYPK4OKDDaRbnLPnOC80a70h0m9P65+VoMu3zqQ9mfcB3h65W3
	oaNsuwK11To+On6M5lDMTyxBM=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDn73h8DblqcPZ3BA--.19430S2;
	Sun, 27 Sep 2026 20:35:08 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Michael Hennerich <michael.hennerich@analog.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] misc: ad525x_dpot: drop redundant drvdata check
Date: Sun, 27 Sep 2026 20:35:06 +0800
Message-Id: <20260927123507.1219495-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDn73h8DblqcPZ3BA--.19430S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr15Xw47CFykZFyUKr17KFg_yoWkGwb_u3
	4rurZ7Jw1UGwn8Kw129r4YvrW2gan7WryrGws7KrZxAry7Cry8Xr1kXrs8Z3WDu3yIyFn8
	Gw1jvrW09wnFqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRtwIDUUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7x1rpWq5DX1UcQAA36

ad525x_group is registered through the I2C and SPI drivers' dev_groups.
The driver core creates those groups only after probe succeeds and removes
them before invoking the driver's remove callback.  ad_dpot_probe() sets
the driver data before returning successfully, so ad525x_is_visible()
cannot legitimately observe a NULL value.

Drop the redundant check instead of silently hiding every attribute if
the driver lifecycle invariant is ever broken.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/misc/ad525x_dpot.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/misc/ad525x_dpot.c b/drivers/misc/ad525x_dpot.c
index a4e22fd4a107..28db4d8ee504 100644
--- a/drivers/misc/ad525x_dpot.c
+++ b/drivers/misc/ad525x_dpot.c
@@ -699,9 +699,6 @@ static umode_t ad525x_is_visible(struct kobject *kobj, struct attribute *attr,
 	struct dpot_data *data = dev_get_drvdata(dev);
 	int rdac;
 
-	if (!data)
-		return 0;
-
 	rdac = ad525x_attr_index(attr, dpot_attrib_wipers);
 	if (rdac >= 0)
 		return data->wipers & BIT(rdac) ? attr->mode : 0;
-- 
2.34.1

