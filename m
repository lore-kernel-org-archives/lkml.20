Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911295;
	b=END+w/wWYc/22NNRx+PVqdtpoVlxqMZeJJjVlARind5l9IysJMdGjYoE5DQqyjeCm7Yr
	 vnfNHrBOXPSbSDoueKgdrir5OG2HO1KCOYaUYUsEIhsZudfpHq246j7S0+IprffYzrBIK
	 RHtnLDlXKxh+rqWw62ypc9yIMsDjq+m3c7+Q655QsyXoeqocgMuRlLPmLamHPTbo2xG1v
	 ZSobM8UpacRm0B4Qw4Q0IShNimeuun1x9S03li4VOe9b04KeKB9jAK1FR2SCki9IUsL0k
	 X+RgYQogMHyIgiSidWHFy2uFx2vnH8FYTdj5ZvlvBJdKZ1DunDwoKIGugj7SPomaItA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911295;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=mAae2YymeFBvgHK1vqNyYqcin7uvU4iwvvKFrMdYCVQ=;
	b=KVcRzszNVNwSpoFFQeKhxPJ4DzxlvAP3G2zOIXxcSYIDLWbdzYnlHB/UOXl3NUktMpfY
	 ziNlIzeg/RFr+RKM42NScVxEX90hu4Z4vnPF6HHsHhBsEOYr046+gz6XPym7VC9m1Gkvn
	 KQ+2RPVNA6QvCynfKl6nhCffee4d8bOdeHOd0R8Md1yZkXashl2r3bv9OPm9rO9PVCzVx
	 qPfRkaAjxBlfi/mvpKguaDcbHljEHM1o4yMIVqZVPczflGzVYBslwvaGLrmc+MWFSxAuJ
	 fFGoamyCn+lqY48r36ObxbUAIkCO0Q6HihdyUk/I6e2Fnp32xgd1yBFRNoxDqmNPnxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pS61IXoS;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4697606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4697606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pS61IXoS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=mA
	ae2YymeFBvgHK1vqNyYqcin7uvU4iwvvKFrMdYCVQ=; b=pS61IXoSB1p+0Fu40s
	VbvRtRD3NmQUReK1OVrzWDUilbixWjznlbhNND4anFBISmCjZtVOo5Mxg1fZKwNA
	EExLf6x1/4ikvPpXOsJWK5pPPuVKNEfTDTcc5Q8u7sut0aUdSirxDSZJ8GpLXuKI
	9qbTw1eQSXmBlJAr9oLwBSD/U=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDXH78QLPxq+3xcIw--.35329S2;
	Tue, 17 Nov 2026 18:27:30 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: ojeda@kernel.org,
	andy@kernel.org,
	geert@linux-m68k.org,
	pmarques@grupopie.com,
	akpm@linux-foundation.org,
	maxextreme@gmail.com
Cc: linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] auxdisplay: cfag12864bfb: Fix init cleanup and simplify error paths
Date: Tue, 17 Nov 2026 18:27:28 +0800
Message-Id: <20261117102728.1304012-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXH78QLPxq+3xcIw--.35329S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF1rWw13Xw4fWw18uF17ZFb_yoW8tF1kpa
	1aqFWYyry5GF47KrW7tw12vFn8J34S9ayFkFyDGw1F9w4xGa18Wa4rt3W8Xr17JrWrG3W3
	tF13WF18CFyDCrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEJPE7UUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7hLoV2r8LBJTagAA3S

If initialization fails after cfag12864b_enable() succeeds, LCD
refreshing remains enabled. A subsequent attempt to load the
framebuffer module can fail because refreshing is still marked
as in use.

Flatten the initialization flow and introduce cleanup labels to
release resources in reverse order. Call cfag12864b_disable() on
failures after refreshing has been enabled.

Fixes: 70e840499aae ("[PATCH] drivers: add LCD support")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/auxdisplay/cfag12864bfb.c | 34 +++++++++++++++++--------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/auxdisplay/cfag12864bfb.c b/drivers/auxdisplay/cfag12864bfb.c
index 24baf6b2c587..c507286641bd 100644
--- a/drivers/auxdisplay/cfag12864bfb.c
+++ b/drivers/auxdisplay/cfag12864bfb.c
@@ -118,13 +118,13 @@ static struct platform_device *cfag12864bfb_device;
 
 static int __init cfag12864bfb_init(void)
 {
-	int ret = -EINVAL;
+	int ret;
 
 	/* cfag12864b_init() must be called first */
 	if (!cfag12864b_isinited()) {
 		printk(KERN_ERR CFAG12864BFB_NAME ": ERROR: "
 			"cfag12864b is not initialized\n");
-		goto none;
+		return -EINVAL;
 	}
 
 	if (cfag12864b_enable()) {
@@ -134,23 +134,27 @@ static int __init cfag12864bfb_init(void)
 	}
 
 	ret = platform_driver_register(&cfag12864bfb_driver);
+	if (ret)
+		goto err_disable;
 
-	if (!ret) {
-		cfag12864bfb_device =
-			platform_device_alloc(CFAG12864BFB_NAME, 0);
+	cfag12864bfb_device = platform_device_alloc(CFAG12864BFB_NAME, 0);
+	if (!cfag12864bfb_device) {
+		ret = -ENOMEM;
+		goto err_unregister_driver;
+	}
 
-		if (cfag12864bfb_device)
-			ret = platform_device_add(cfag12864bfb_device);
-		else
-			ret = -ENOMEM;
+	ret = platform_device_add(cfag12864bfb_device);
+	if (ret)
+		goto err_put_device;
 
-		if (ret) {
-			platform_device_put(cfag12864bfb_device);
-			platform_driver_unregister(&cfag12864bfb_driver);
-		}
-	}
+	return 0;
 
-none:
+err_put_device:
+	platform_device_put(cfag12864bfb_device);
+err_unregister_driver:
+	platform_driver_unregister(&cfag12864bfb_driver);
+err_disable:
+	cfag12864b_disable();
 	return ret;
 }
 
-- 
2.25.1

