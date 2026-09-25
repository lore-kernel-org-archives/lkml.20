Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8774A2074
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343492; cv=none; b=FBAH0rp2NyI86plT31SNrpIg7g4zfNfKmkmbY6Cswz+OraWwg+KEzb1d4kOgpskCrdqkxFYgbNRw7LiHlIW13szpJwqcaHD6nOiogghCKCJxYfqhCFVoOME9kVG86ddhpRvoQYJqk3tVdYlnEIv2jJDzy/1Kgw0N04UpV5lGyZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343492; c=relaxed/simple;
	bh=GSiIIb/g5GyHauoFwUjAVo68TeJOFVwGqe4Z6o8QFp8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A1DZCcpaZDu8qUKWBsH7zLWk4q0MF5c7YOIsZujTOja8jfAWIqWdnWDgUKfOeWo7euawedpurIc6eLzgnYbcRi/Qotub2IKjcJOg23q8yF2tYGhcAcpi4cj7X/gq6zzrC2Wh+LoY9EdZOrW6mLI8I5bqWAXpKFHXkNVpIeN3bnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=UQJJ31+m; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="UQJJ31+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=rm
	M6xXrpr9UKxLs3b0jxjQEKmSBnAiVp0w5mF33ni4A=; b=UQJJ31+mJU+OIxt2Rv
	TjKym/z16WJnBM6nLdEoogyVvi29rXJOTy8a5Q2aj2a73sKAE7ibAEoem8lmF1TB
	BMrc+0UBX5TqQPHBVhi72y3lwHf0EH46L31BiGt/tBMo3qfohp6ZGCiYtGb+RulK
	Yv/s50sV7CbO2wwTO8p5lmtII=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3X4QwebZqHTBAAw--.28279S2;
	Fri, 25 Sep 2026 21:37:53 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] mfd: mc13xxx-spi: Reject devices without match data
Date: Fri, 25 Sep 2026 21:37:51 +0800
Message-Id: <20260925133751.2230782-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3X4QwebZqHTBAAw--.28279S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFWDGFykuF1UGw15Aw4ktFb_yoWfuFb_Za
	sa9r1xWr1UGFn5KF18Xr15ZrWSq39Yvr1vga1ktrZ3trWUZFnrXFs0q34DJr43uayDA3WD
	Xr1UJr4xZFnF9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRtHUDDUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzhGy7Gq2eTFebwAA3k

A device bound through driver_override need not match an entry in the
driver tables. In that case spi_get_device_match_data() returns NULL,
but mc13xxx_common_init() later uses the missing variant data.

Reject devices without match data before entering the common probe path.

Fixes: 15d71e678ec1 ("mfd: mc13xxx-spi/wm831x-spi: Use spi_get_device_match_data()")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/mfd/mc13xxx-spi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/mc13xxx-spi.c b/drivers/mfd/mc13xxx-spi.c
index 56d2e57b7d73..d1523321152a 100644
--- a/drivers/mfd/mc13xxx-spi.c
+++ b/drivers/mfd/mc13xxx-spi.c
@@ -150,6 +150,8 @@ static int mc13xxx_spi_probe(struct spi_device *spi)
 	}
 
 	mc13xxx->variant = spi_get_device_match_data(spi);
+	if (!mc13xxx->variant)
+		return -ENODATA;
 
 	return mc13xxx_common_init(&spi->dev);
 }
-- 
2.34.1

