Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4B743CE65
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192487; cv=none; b=tVMOtAHokxAxg3E8cWO/7SbCqO+Gbm9gc+rm0iFQnSqXJfzpe0H6Tw/DkSvJIyCMZ4eD2MUJntSFZHOb+hxZ2PtpOsVgOU27ZTUa6hcstsdV1tyFaSGHTdMQlv/MmrabpF+h3wm/+JuSwQJRjaPsrqrxjwlIkToIT8hFkULoCZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192487; c=relaxed/simple;
	bh=rixrGDaEFtrVbXBwzSvfQXpzKwFy07ICwTeW89xWQtw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XryrCp4yXd3KFuGoZjua6WSKwrodlz4vAHFMkNyGC/ffPGnrKUmqPAeqKk7tjZmFVl35U8Z6I9M9aOofZDOKdNacdHW5fPSlKrcfsvxAeXB0+/7xEvn5sT5u6dqYk95BkSs+MsRc0Hz7wbiQHlPlb7pen8qXfpDG8+96BEd6KAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sgYnqY+1; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgYnqY+1"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-484415c8cb1so117483f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788192483; x=1788797283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDP4t5CtJDB/rNbN9Zai4pex9QrrqfqlqT133UxmlQ0=;
        b=sgYnqY+1nIN+Yy/JpGx+qrCC9cn/uyObs73JgKp/tkEZ7o4A0UMVzon4caTx7kbECZ
         5kDW/zxDyn+gya8srpoaUtB0XjsCNjZSv/F1IlqCVB6V10q16X/adnC5fPrvNjgRPkkf
         mnTDvcr85AXgZ6YVxoWOjyrCqAJf12XWXpzf9ZTtuGi3177igPeSn24dNfHAoZDjhJXo
         +DFoC+3QKR+LCHGu6nZFddSRrISlQHPoQdD1yGc6imjqKW8Znm+IpAESmAO6UaeFHpVM
         wR/gnPxwSO3uH4gmH7yGJOwtMWTCDTyYQUn2FNiAyfq9AooqblGytA00KxERZ5OpUp2D
         oy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788192483; x=1788797283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HDP4t5CtJDB/rNbN9Zai4pex9QrrqfqlqT133UxmlQ0=;
        b=qvO2I/1IqkjFjVhImp1PM4cquJoRbsuYPHpHRpB65A7QQGUUFwzDRlB8wfiQ20qYuL
         vm9mmJpEeIdjiHR93jneuDRdNpd6jdg5eKpHg6WGz9tHxeE0r0TX2psQKEJT3vUhUD8A
         qyWdI66AgTNzLBDlSXD1sS0+Jj8tKB2skUFrXjw62z4Pmq7/JUnu3POBG9GDb+v2bPY1
         RdXMHTr47IpTqpz3gaw0eOn7ENSa3n1tP77FWBWlDHroyDyG8dj+PKt2cnkisfdkYmsn
         miUXqo5RuYXZIr/dKMI2Fo/p7vBvKkT+gmvK3M7JnFZRfNI8YHI0h3y0/Zo2W06fe9tc
         oHsw==
X-Gm-Message-State: AFuF++mnWJ+HECqJblznE04BVwUDOA/f+85c63qfat+KJW8BirBZ74vb
	FCztwluULahJ3Heyk7AdiEbLRL66sOst5MF4czjJacsIAZw8nhS7S0o28h9xDSWUWWjbdA==
X-Gm-Gg: AYBFou1yCboQ7awEnicywp6xhuQHI9IuJ9AXsHj6r13mv5xXQG7OCC1O+XvCAzvR1jL
	vZaPOsqH9qgABKssUMzDTTBNF0kVfbLRXaaOQ2dvSnTdSzV+agZt6yfL9HZmeS4zHOUXdDu2XfJ
	YPgbKJbk/YWhsDbjVnN/BEJQ4pMkGVKYMmIDKdOe6bE5q99wadqAcTidy6mkAlZ8hcmoMnIlKDJ
	p0ZD6e9iIcSRxJ/5IQl1mAoFXc1FkpuotOhZ9UNz8fh/O0gQj8glndcJxpvc4yF4OsSWx1+lTGz
	iaQX8U1GpKTEF56989mi01c8jNidJFfpXVIEirth0YbKk+XjvpecwgjthjjMTGbUeuydttnIPZ3
	YsfOs/3qU32SMgTl9t67Hma5MvAOGaJXLK8oomsPN8c6w6gjg31gAHk+Lt2SbU8+QRRqFUE7v0x
	rLFYNtx7PLFfxCu/s+vwbUPDAfeTLAhQlrrRMXykckCP7nn7O2KLHGFp8v
X-Received: by 2002:a5d:518c:0:b0:484:3310:710c with SMTP id ffacd0b85a97d-4844102655bmr3118067f8f.24.1788192483493;
        Mon, 31 Aug 2026 09:08:03 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:ccbd:b529:37d3:c1b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f3asm23849760f8f.3.2026.08.31.09.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:08:03 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v10 2/8] platform/x86: int3472: tps68470: use unsigned int for GPIO lookup loop counters
Date: Mon, 31 Aug 2026 18:07:48 +0200
Message-ID: <20260831160754.9857-3-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831160754.9857-1-tchatard@gmail.com>
References: <20260831160754.9857-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO lookup table loops in the probe and remove paths iterate up to
board_data->n_gpiod_lookups, which is unsigned int. Use unsigned int for
the loop counters to match and avoid a signed/unsigned comparison.

No functional change.

Assisted-by: Claude Code:claude-opus-4-8
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index a77ed32ab..35909a683 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -149,8 +149,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	struct regmap *regmap;
 	int n_consumers;
 	int device_type;
+	unsigned int i;
 	int ret;
-	int i;
 
 	if (!adev)
 		return -ENODEV;
@@ -234,7 +234,7 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 static void skl_int3472_tps68470_remove(struct i2c_client *client)
 {
 	const struct int3472_tps68470_board_data *board_data;
-	int i;
+	unsigned int i;
 
 	board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
 	if (board_data) {
-- 
2.53.0

