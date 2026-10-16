Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB12547AF6F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145141; cv=none; b=kEISRwl1VlREMi1C/BHEuySw8GMvuU1TiE/aM6sN/QB5iIR9MVlU0wtnpIlOO7HcF0cVHLtjn9GdybfmZYt/fCOGNE/os/rgmNPZggG4JdM8r0RccG3XyJpPd6whvGVeYoVznuEDp3SnOQ1uH4iqlMP3i0LO2TaR9JJ1+MpO6rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145141; c=relaxed/simple;
	bh=YQO5XetIQSEANhtWhA5qbrsfyJQkeAvh8IbfMoixrtk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b6z5mR6TAdjY2qNnQoohP8YtRopjXg5n0beLruvyNvclCVodihpkvN/EiyajihadsRKAkIDbmmHLh+el3fgrFwEl39oQJaKPBP5mtgVM/QilRe7JX2wR8TZfseWook4F+YLN+mWBVfzMS9wk7+Gqt5Yz571Xg3h1jXTOouGjPG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ofvm5xTo; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ofvm5xTo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Bp
	NxUCsJWScZvGQdH1JJBZmMbVWwOQFNRIHMtTZzXkE=; b=ofvm5xTo+0VhwqLXRc
	SU7XZueQBM90uoXAFbaapb1L0HIIi5wTWxnrDMsYhdZ15USJ1qLAXxakydPeELGR
	C9lo+ARie8TBC/eAiNdSdM/Beeyopdo4aWzpiiM3hlwXEEC6FWFbFMB/We5331iX
	UWDcRB61cDCbeQlASn4ME8VP4=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3fxXj9tFqdQTxAQ--.15252S3;
	Fri, 16 Oct 2026 18:05:25 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 1/2] regulator: core: freeze deferred disable work during suspend
Date: Fri, 16 Oct 2026 18:05:21 +0800
Message-Id: <20261016100522.2582557-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016100522.2582557-1-yaojiale02@163.com>
References: <20261016100522.2582557-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3fxXj9tFqdQTxAQ--.15252S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw15XFy5Kry5Zw1xtry8AFb_yoWkWwb_W3
	48X3Z7uwsxursI9w1IvFs0vryYkwn2q3Wrur48KrW2yrW7AFy5Jwnru343Ar47Jw4IyFnr
	XrnxKr45Ar1YgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_89N7UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzgUGQGrR9uXlwgAA3C

regulator_disable_deferred() schedules hardware access after a
caller-provided delay. The power-efficient system workqueue remains
active during system suspend, so deferred regulator operations can reach
a bus after its controller has been suspended.

Use the freezable power-efficient workqueue to preserve the existing
power policy while deferring regulator access until devices have resumed.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/regulator/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 6a4008f387b5..317f02696e47 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3465,7 +3465,8 @@ int regulator_disable_deferred(struct regulator *regulator, int ms)
 
 	regulator_lock(rdev);
 	regulator->deferred_disables++;
-	mod_delayed_work(system_power_efficient_wq, &rdev->disable_work,
+	mod_delayed_work(system_freezable_power_efficient_wq,
+			 &rdev->disable_work,
 			 msecs_to_jiffies(ms));
 	regulator_unlock(rdev);
 
-- 
2.34.1

