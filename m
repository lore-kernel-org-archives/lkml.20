Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896668;
	b=3WfR8RNvOI3sG32bMt5Gh6mpx0uUzN9fkgBL/hNqxSBEM/efUAQwjUCwYuBYkNUTIZS+
	 /n8sBZJ8vzwGKPyVT4Zy+Dej5i0Nm13Vgdqce15Tui7TlFCR1+ReIrL/w7T5iwCS03+2Q
	 4V04F8rbAkfj/3lqzjIxNAnJH0Hw1fNo9ZMPJeb1jRvVPx6SdXr3Q0E3nDswf3NlCm76l
	 KTaXx9GNWjHLRGNxl8q9sFBnXiQMf/dTv0n5g+Bd0dKScnLvGvdMg9RA90xJvEYiN5094
	 quJJUgyyEYn3ZNYy8ml5Dk3yP0Jh2GQGhiZYHvRRrZLpQZOt3AdS7AI4qEOM0QAw9ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896668;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=uYf0dmk+DEmWciEUXlRmObZomIKtC11b5wdklOxzdYQ=;
	b=gxj9S3B6OZUXNECnabgnyd5R8s6tgFDEEWapw6r663gUhwOdDu/3bgzWW6sov5Bl+g6J
	 qTsK/8Sz7/GeQ7/nX/+1vVsFarYMbjzORzk100R82159Q7Xb4htDAQjNpVfsNLZALja77
	 D5SH4ODz/vMw+eToOr7XcKAtImPABeg9YtAd4WX3v7UktMXnXszdeccqe7JTED7fFU2p9
	 IBP6p9S66byCs1Xs5JeSbcPA06uZQzkX7zyeJSYITi+6VNS4zXctjLcEZhQMfqlxhyh6m
	 f9y7vdjz3Ef05BKmHNtfXrtGY7eBcRQffs6bYwPoFJHKvmfUk18LwVQSFvlGahz66yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=KiNBTn7t;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67196606A31C;
	Tue, 17 Nov 2026 06:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67196606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=KiNBTn7t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1794896612;
	bh=uYf0dmk+DEmWciEUXlRmObZomIKtC11b5wdklOxzdYQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=KiNBTn7t3eJAEOtk3/2VeRDFmefiykSARmU2xikrG5XUJuWnPkGlCRVU4ltAP14U5
	 GYtsKQ3ZBbsyqcHGcCZHFvSfsPK8zxGw+t9GD2KdCu4vA8VpjVNAtIxCtux4Zf5xEe
	 2URhub+zmFlCzrFDFgd3sHDL0aF55mX+ISnz4L4M=
X-QQ-mid: esmtpsz10t1794896577t1e4edcdb
X-QQ-Originating-IP: PMmzf6rOVt5JBrH48aHB5GXqSihzlivps6BWE5/XnRA=
Received: from PEC004119 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 14:22:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7945630178983201446
EX-QQ-RecipientCnt: 7
From: Haowen Tu <tuhaowen@uniontech.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haowen Tu <tuhaowen@uniontech.com>
Subject: [PATCH] ASoC: ak4375: Power off the codec on probe failure
Date: Tue, 17 Nov 2026 14:22:53 +0800
Message-ID: <4E11793720037898+20261117062253.3611273-1-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.50.1
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
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MxpHmR/vpz48AQUA3HcTUfp/R5uD3PeSdwSqHRhJEeYb9sJtSuGdT7Xs
	AUbVoeQ5dOnRXcNxPaaezS3U7sXqYxl8mnPNgg6FiXSZISFhYZIq64HkkzGewyuw3vpLF5W
	1EkQXibhZkWjsztJSddNQEqs4JgzPo0H130mCaF4luorHt7pnFgK/GmvANV9zjK2AC2u1n3
	6I08ZSffe9k7IWpiYKsYwmC1Z9FEBiJpVjgsVWracdNLp+2d1/2w620BeD/uwhKMqN3To2E
	Nco2GTe7sXm6dEU66FzkiZI14SHMhTdBVRBLbxr7a0kaAkBFNMbbNfLhcNC1x0U1U4TIP4N
	TEzAC/eoANwHNJPGaY3EJV/N5UKAPivD3g2Z8lZmKWm67K+zHVlCM99Y7mbzhp7qY8gRGkP
	IYVLOqfwCA6btMn9Z4dfywvtXhnZGdw8MsMZj6baQwwswyjjj/CTNyVPPRPz3PIrCNvtWH7
	MPVXTvr6wwszDgQBs9wyARLninKMFhVWDI9gbdrXI0jS0nOt0x1BR+gId4p39b6q4FEyjTx
	VYiSI4IGMPOTUUvDc2yz4ZU4exrcvUIWDGsrDfDO1AZ82BAmhF3Je8u39hM1WS1m+mgu+/2
	k7HNK3dTF65ncrnq0Fy4DMCKpivUOYlqjhEKqX9J1Hf1rER3pzhWLWWcnbexYL5jh9himh3
	4wd/6HzeO/E5EEpbkI0V76qKWViyV5PWQfJAIq1XfjHx/vPBZOBJaRIcGeiRmdhcgZLoRWY
	LhpuuD94RwXfFLtOLMEp/TPF3Bvmrkd5lVNESVfI7pR9umJ5BrWrXnV7DBYlK6vAgFdJUIt
	mDz7CMoqGZq5hQ2n63byoFavk7QOaXFdHKocqcehjqu9GJWDo626gbwdh1cw2RmvQH8UQ9h
	LEo9uFIS1U8RCuljUeR8RCgVrm4opbE7QDxWNI5rQnL2EhVUgAxeF6GJE7O3ygiiQ2ovlhV
	KcP+U6JeSnSd2KTe+FOQyLhV8YAd4D2hQ0Wf3zCBKCZnlHif6UnnYv0LlKzDi6AH7dNLcW5
	ksLA4BWi16CM2uOZEtzBvFX52hePT5+tYBAPgh3g==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

After ak4375_power_on() succeeds, probe can still fail while reading the
device ID, rejecting an unsupported ID or registering the ASoC component.
These paths return without disabling the supplies or taking PDN low.
Managed regulator acquisition does not undo regulator_bulk_enable(), so
the enabled supplies are leaked when the probe resources are released.

Route these failures through ak4375_power_off(). Also disable runtime PM
if component registration fails, since the remove callback is not called
for a failed probe, and mark the device suspended after powering it off.
Restore normal cache access after the device ID read regardless of whether
it succeeds.

Fixes: 53778b8292b5 ("ASoC: Add AK4375 support")
Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
---
 sound/soc/codecs/ak4375.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/ak4375.c b/sound/soc/codecs/ak4375.c
index 28cc41014bd9..04c99b188981 100644
--- a/sound/soc/codecs/ak4375.c
+++ b/sound/soc/codecs/ak4375.c
@@ -536,19 +536,19 @@ static int ak4375_i2c_probe(struct i2c_client *i2c)
 	regcache_cache_bypass(ak4375->regmap, true);
 
 	ret = regmap_read(ak4375->regmap, AK4375_15_AUDIO_IF_FORMAT, &deviceid);
+	regcache_cache_bypass(ak4375->regmap, false);
 	if (ret < 0) {
 		dev_err(ak4375->dev, "unable to read DEVICEID!\n");
-		return ret;
+		goto err_power_off;
 	}
 
-	regcache_cache_bypass(ak4375->regmap, false);
-
 	deviceid = (deviceid & DEVICEID_MASK) >> 5;
 
+	ret = -EINVAL;
 	switch (deviceid) {
 	case DEVICEID_AK4331:
 		dev_err(ak4375->dev, "found untested AK4331\n");
-		return -EINVAL;
+		goto err_power_off;
 	case DEVICEID_AK4375:
 		dev_dbg(ak4375->dev, "found AK4375\n");
 		break;
@@ -557,13 +557,13 @@ static int ak4375_i2c_probe(struct i2c_client *i2c)
 		break;
 	case DEVICEID_AK4376A:
 		dev_err(ak4375->dev, "found unsupported AK4376/A!\n");
-		return -EINVAL;
+		goto err_power_off;
 	case DEVICEID_AK4377:
 		dev_err(ak4375->dev, "found unsupported AK4377!\n");
-		return -EINVAL;
+		goto err_power_off;
 	default:
 		dev_err(ak4375->dev, "unrecognized DEVICEID!\n");
-		return -EINVAL;
+		goto err_power_off;
 	}
 
 	pm_runtime_set_active(ak4375->dev);
@@ -573,10 +573,17 @@ static int ak4375_i2c_probe(struct i2c_client *i2c)
 					      drvdata->dai_drv, 1);
 	if (ret < 0) {
 		dev_err(ak4375->dev, "Failed to register CODEC: %d\n", ret);
+		pm_runtime_disable(ak4375->dev);
+		ak4375_power_off(ak4375);
+		pm_runtime_set_suspended(ak4375->dev);
 		return ret;
 	}
 
 	return 0;
+
+err_power_off:
+	ak4375_power_off(ak4375);
+	return ret;
 }
 
 static void ak4375_i2c_remove(struct i2c_client *i2c)
-- 
2.50.1

