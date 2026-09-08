Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A29572684;
	Tue,  8 Sep 2026 15:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882865; cv=none; b=QVVT7fd77gYPARbWcNf/7y1ENg7z2s3NBeANf3awwFF4Bj/NYO8U+8MRcs6zvQ2RTjOzSQ9jwVv7+7xXbL3qlVGnAsMPOojT7oo7sMTaohQY3CV7p/EO5Vr7vYVnw6M6MhIE5keJpMwyS1gbyTzIb41K9S/fRj+f0fMgFW/7HMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882865; c=relaxed/simple;
	bh=SxaPL4XstZMEZjVU7YnvoXUJ4ineiUUF0ILSxILu2I8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J2brNdnqWt6HNIamA0tYFMc8dVetKRCQXD0sRMb+oscN4wbCm7aPgIdo1Nwrl+9PTjvKCWYDQHwSy0TTWPVVYMYZH4GrlOi1bQ/vcN714IdWYIMu+xe2ElG2nxmMn0DOqay2ElmUCraLoLti3rfIl9DudBur8Cg074xbc+B/8Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=jK4p1H4s; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Ta2C+skR; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="jK4p1H4s";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="Ta2C+skR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788882858; bh=SxaPL4XstZMEZjVU7YnvoXUJ4ineiUUF0ILSxILu2I8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jK4p1H4spIlPZQjjo9gD9eYAnH7vNJAHpBa7D3YIiP9e5dSs7NNj0D0b+flPQJ1mB
	 bqYQWmSiKZltMNpEKkuYjoH+TDv6Z2W9DyPMMNvVFIHvviWVoyTe103DPud01hwQUt
	 phAqq/WpWnGp5OROj8IhaL2W26JMrNtiV7QRB890P7YgHVfMikjMykjV42Yo/2Al/Y
	 yIrC5ydYzGMmEemdXCTxHLNpljwykNqG0lW+eAD6a8hVqI0qA7m/77UDuNrGTqLbji
	 flTRygYTEzRzM5q4MNWH6Odkl77Gd5BYrt8EGEkeMY0SzUZaq/B1ByNGWqCfrQi2x2
	 Skl8P+iKPgYQA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 597D94144B; Tue, 08 Sep 2026 16:54:18 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788882857; bh=SxaPL4XstZMEZjVU7YnvoXUJ4ineiUUF0ILSxILu2I8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ta2C+skRIFtswO1WofKQ7hNp48VCLI4of10KIimfIlFdhDjsFbi4IcHtSWMr3Uqwv
	 Q0e0uWx9KVGZ6BKV+U/2kGhtwdN7DWAuqzmAJcR0Y8K9zVwHTbsn7132wVm8J98usq
	 AaN70QXoe53JbUMR+QkNM+oCRYFTpI9EYdTxazViRv7ypx89THfj2MCvP7Ojkubheq
	 7xMFPTSFb+CWSpVfndOPDhrKkj25IQFgGOItQzH6Dk1tp6rdUVDgkpMzL9REG6BWiF
	 qRV4v09wwmybHxyfwxwd6MAZk4R5SJGi42Js5/RkokWSXjvJ+oCHUqj90/XhAv1VPq
	 cLTGgRDrEiCBw==
Received: from maru.home (host86-150-50-53.range86-150.btcentralplus.com [86.150.50.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id C1F1441448;
	Tue, 08 Sep 2026 16:54:17 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 17/19] media: rc: Validate carrier range in LIRC_SET_REC_CARRIER ioctl
Date: Tue,  8 Sep 2026 16:52:05 +0100
Message-ID: <ad2b4f1d16820bd6229232bfc9260556e7d18054.1788882189.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788882189.git.sean@mess.org>
References: <cover.1788882189.git.sean@mess.org>
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

