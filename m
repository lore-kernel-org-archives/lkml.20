Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399795;
	b=LyAuUPurF8igom7kUH9kNSOiR9XWNMe+/CRKK4QOV8RAo+fw3V0H7WYmbqYrvnh+KnRt
	 3enKZcZ3I0lp5+rTSLSN3xnscWQnJuzFDgPlNS9sYsqnMPZ1Nb75/aOwxhGcw6nxllJK+
	 zgyOyqWX3yn2ygEGNYDMlAfCHBiSAQKYXGku3c0JrzdrgfWJvg82/na9JBBx4MSVvBX43
	 jfXeW4YAJjMkp/QhkqGzJniMlZpYDPUoYSXAVe2jScQbz/bIfJswo3dmWKe9QtnG2A5yM
	 FO8oaMQLCo/Kk5FUUvgOy06z7DuHy/Pr9l3cMwqJ+CO5WoERRZwKvs/WU2Kt/A6jjKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399795;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=T4F+EltLawC2D1qnx9Gj4BEi3qOxexX4Y8GoCtZt3d0=;
	b=bfST8VnvFWLoenMNHSEHgQsALh29FlcpdnP8ublH2thEZLDwdwUFDD0OSo/w8DMRh3Gv
	 xbNVf4U7tBDB0gcvAnJe2/Tot8JnshafF5xTJ60ocTDhAmWEf/OvF9yBxogdzrYTmldBm
	 tnBd8GdE9MZpn6n1fAdnbdEu7lMPxGxfIsNqf4ZWZ5uxXzSDWziggOY8apkdbA48cx27b
	 CeEht9/7nrXN9He9qXXnBeHa+g6JJark7V7kejh1Ox1+MJqAxZRsWi3hyg3kYKnYuwI+j
	 hYs0MGdBwnI+hZUjTY8elRHLGfTetVs9eteFqM3CQ/KX33AlloexMItPGvCpaWjjmvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=hoCqlXK9;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3D0606A88B;
	Wed, 11 Nov 2026 12:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB3D0606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=hoCqlXK9
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54502a172;
	Wed, 11 Nov 2026 20:23:11 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: wl1251: Fix potential RX descriptor leak on probe failure
Date: Wed, 11 Nov 2026 20:23:10 +0800
Message-ID: <20261111-e5624093d6-wifi-wl1251@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1ca8feaa303a1kunm8be761671b3664
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGU5LVh8dT0wYQkMeSR0YH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=hoCqlXK9coaJmxZmsFEvijVyKq+5pqMg1XCoKQHuY+aNnZ7/4GblUnDUVcLpAbT3plDMbv1ihr5fF0RxGIboEb8t+ac6urutt+Oiy0EgPJU5VdmlSj2jUJGHfaGt3s0kzZddwZYIXdphzQx7Mrk2+t22WUDf+KzA5X+C/9Gu/iU=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=T4F+EltLawC2D1qnx9Gj4BEi3qOxexX4Y8GoCtZt3d0=;
	h=date:mime-version:subject:message-id:from;

wl1251_alloc_hw() allocates rx_descriptor separately from the mac80211
hardware. The SPI probe error path only frees the hardware, leaking the
descriptor.

Free the descriptor before releasing the hardware allocation.

This issue was found by our static analysis tool under development.

Fixes: 8e639c0673a9 ("wl1251: move module probe methods into spi.c")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/net/wireless/ti/wl1251/spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ti/wl1251/spi.c b/drivers/net/wireless/ti/wl1251/spi.c
index 1936bb3af54a..418c42613fce 100644
--- a/drivers/net/wireless/ti/wl1251/spi.c
+++ b/drivers/net/wireless/ti/wl1251/spi.c
@@ -318,6 +318,7 @@ static int wl1251_spi_probe(struct spi_device *spi)
 disable_regulator:
 	regulator_disable(wl->vio);
 out_free:
+	kfree(wl->rx_descriptor);
 	ieee80211_free_hw(hw);
 
 	return ret;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
