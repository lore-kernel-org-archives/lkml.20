Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDE83B9D80;
	Tue, 15 Sep 2026 08:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461205; cv=none; b=XpEw5pPxyAxc8E7D2P913mAw+0+8IJQzGbhbgQn4E5iVWeWeMz3PD1tAtdnUquxIs9DvNWJcb6fjqna6F6anrT9NSMXK1F0Qpwhr8nLWI4cG1xTfU1JTDhudOvQ9aXkn7oB74pyUHn7diQoSv7h9GwfEBde1WDAFkTAJgZ/bxSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461205; c=relaxed/simple;
	bh=SxaPL4XstZMEZjVU7YnvoXUJ4ineiUUF0ILSxILu2I8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HSXNUzK710SeYmY7xB9N4UzXqhJoI5pX9ggE/m9UaZOTgcBB5JRgRV3YE9IG8sMX9DYBBrP0H0Q1W/qi7db5M+MsrAFVLikXVsOwSx6z1ZV6VvP8Vk0B7Pw3XuXd+TBIPCKaNvF/q7QkkhCvc5bQky2ldXKKmzlgY0mVtgJu9Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=YQILR3ld; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=YQILR3ld; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="YQILR3ld";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="YQILR3ld"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789461202; bh=SxaPL4XstZMEZjVU7YnvoXUJ4ineiUUF0ILSxILu2I8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YQILR3ld/gE+f2XenEP2EHfuywVMqEubpWIddtgvD6teepORg+uOgdX86Zu8tlRFB
	 vM2suw25ty2ocLLXoj7TzfpIiOcx3wISkebwDXUyqSqea/7KXzdnl+zr2zrpeAearD
	 M5vJ2v9a+3hOxFAQPxl27s4IEvc7p6yrIOF5xIiypNAPV9rYn9AMDPFe2WGKjAA0mG
	 Kc8dmB28TtUP0ArLKyVx9aMeTGEtyJX2NAufx6y4Adeof+o/WttR0CSIJaTIFZ4QS6
	 7ZH5Iykem2ZfJEuzYN3Kdu/IGIwniBWjUjS3wl3wZ30KolKGdhauBja61MMpDeaiUE
	 3EoIykCSAFEDQ==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 9214D40B86; Tue, 15 Sep 2026 09:33:22 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789461202; bh=SxaPL4XstZMEZjVU7YnvoXUJ4ineiUUF0ILSxILu2I8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YQILR3ld/gE+f2XenEP2EHfuywVMqEubpWIddtgvD6teepORg+uOgdX86Zu8tlRFB
	 vM2suw25ty2ocLLXoj7TzfpIiOcx3wISkebwDXUyqSqea/7KXzdnl+zr2zrpeAearD
	 M5vJ2v9a+3hOxFAQPxl27s4IEvc7p6yrIOF5xIiypNAPV9rYn9AMDPFe2WGKjAA0mG
	 Kc8dmB28TtUP0ArLKyVx9aMeTGEtyJX2NAufx6y4Adeof+o/WttR0CSIJaTIFZ4QS6
	 7ZH5Iykem2ZfJEuzYN3Kdu/IGIwniBWjUjS3wl3wZ30KolKGdhauBja61MMpDeaiUE
	 3EoIykCSAFEDQ==
Received: from maru.home (host81-158-254-226.range81-158.btcentralplus.com [81.158.254.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 0CE7B40155;
	Tue, 15 Sep 2026 09:33:22 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 18/20] media: rc: Validate carrier range in LIRC_SET_REC_CARRIER ioctl
Date: Tue, 15 Sep 2026 09:32:28 +0100
Message-ID: <fbda0dc5a43e7430bdf5e7c1ce8648902876f976.1789460680.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1789460680.git.sean@mess.org>
References: <cover.1789460680.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure that the low value of the carrier range is smaller than the
high value. This fixes an underflow in ite_set_rx_carrier_range().

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/lirc_dev.c    | 2 ++
 drivers/media/rc/rc-loopback.c | 5 -----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
index 183f1939b941..d9b6ecca563f 100644
--- a/drivers/media/rc/lirc_dev.c
+++ b/drivers/media/rc/lirc_dev.c
@@ -492,6 +492,8 @@ static long lirc_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			ret = -ENOTTY;
 		else if (val <= 0)
 			ret = -EINVAL;
+		else if (fh->carrier_low && fh->carrier_low > val)
+			ret = -EINVAL;
 		else
 			ret = dev->s_rx_carrier_range(dev, fh->carrier_low,
 						      val);
diff --git a/drivers/media/rc/rc-loopback.c b/drivers/media/rc/rc-loopback.c
index 53d0540717b3..9d56e77c9351 100644
--- a/drivers/media/rc/rc-loopback.c
+++ b/drivers/media/rc/rc-loopback.c
@@ -74,11 +74,6 @@ static int loop_set_rx_carrier_range(struct rc_dev *dev, u32 min, u32 max)
 {
 	struct loopback_dev *lodev = dev->priv;
 
-	if (min < 1 || min > max) {
-		dev_dbg(&dev->dev, "invalid rx carrier range %u to %u\n", min, max);
-		return -EINVAL;
-	}
-
 	dev_dbg(&dev->dev, "setting rx carrier range %u to %u\n", min, max);
 	lodev->rxcarriermin = min;
 	lodev->rxcarriermax = max;
-- 
2.55.0

