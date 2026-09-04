Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6921352025;
	Fri,  4 Sep 2026 13:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527297; cv=none; b=EpJLzjXYTMZAAp4CuuYx3HAbQyYiHg4mIua3tZALJGa6xXkD9X7E4pUgzrOXmti+IocNWYzloc7OyLYrP+27e1Xvfu9EnW8tLM6HcycCZw2iI0Py/cZhu6c7Ey9QGLdxsjX902aJt9wj+ayrXV/D122QPwqKd5Lk3NiqO6SY96M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527297; c=relaxed/simple;
	bh=SxaPL4XstZMEZjVU7YnvoXUJ4ineiUUF0ILSxILu2I8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LTQCsCytuU3KMkVZMByBbMiC5qu4+x62/9ynoqUWq2qHwsPR8RHBKBTQdp39Ijrs5C0tiLmbljgApO+9S+7YISa2sPbGNxgaWagVBMxF7VBU45pRSQpml2CmWS6w+LIdQ3E7GEZ0xhcfGcog1QkYJ816ocaXkCJNYTYaL7kbiBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=mmD5gKq4; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=fi1fpHME; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="mmD5gKq4";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="fi1fpHME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788527288; bh=SxaPL4XstZMEZjVU7YnvoXUJ4ineiUUF0ILSxILu2I8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mmD5gKq47awuXKd/CNBnWHf8Q9v89clNek9+25ztK+WVmvvFWbsz6P5TfjHobKrme
	 96bHwiTogXx3qXqIemNJoSdFJO0uVReyIjUJvi5/3D4r8aRwbaLib+iI/vK2boPpm+
	 W0DXkXdmNsiWHsMvFc0p3MtwPgUxziGgzlcuzHpee1hoPft4me3jrcPQKIhC8iKduf
	 usX4v0hQN1eCQ7AYnBcpdPPW0L+JEzWYds953A44rF0YfJz4iU9amphRyABFJ7Ye8O
	 H2pBrpmFWDk2WKVP7cITM1jgxD//D9v/UmGqz68y95cg/kbiQYZ+PRFYPwAVP32Pwn
	 ZEjeLoOAJo5qA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 1EB914145E; Fri, 04 Sep 2026 14:08:08 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788527286; bh=SxaPL4XstZMEZjVU7YnvoXUJ4ineiUUF0ILSxILu2I8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fi1fpHME/zkRCr5AXIIjwBu4ofba60Q91/r4vxZPkccBNFoLbAmhHsb2Kc9uMuIap
	 LVmWCyNw5PglKqv6hikE298z1mPxSA7U3rA198wEK6hbOmGZYnR+0KiSKl+Kon/wk1
	 /YkLlHB/1i1N9AcC5k74CXDOG71C6NEWlyPSqog0705CNDuoPQUgbgsTHoOqieyA+O
	 UCabCTM6LIhJuhIJij4pj1tWFmT7fckduUwkMWCkHM8HkDN55h2s6le97S36VFA/LS
	 xHHq2J9A7D353bEWWiMiLYrVNtHrWn3zGEzddWxEq66HcNS0pvMs4yI6vEphlahKzm
	 j5zNxjZfAQjJg==
Received: from maru.mess.org (hephaestus.mess.org [82.68.61.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id E9B2741451;
	Fri, 04 Sep 2026 14:08:05 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 17/17] media: rc: Validate carrier range in LIRC_SET_REC_CARRIER ioctl
Date: Fri,  4 Sep 2026 14:07:45 +0100
Message-ID: <032aa8fafdbbbf0165862fdd265dc7a4bac161b7.1788526920.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788526920.git.sean@mess.org>
References: <cover.1788526920.git.sean@mess.org>
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

