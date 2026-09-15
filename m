Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAE33911D5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437971; cv=none; b=VwoHL7aKldDPHJQjGaIrF/TXmrWf214nHOTuu/AJDk2ERjUXYvsAs9UnkbPajo4oIQhMsyZFhv1OyS0XKpimqo3e19yyTNNuBDXoI/9pYDQ0lt8L8OB7Pk3BMW/+3nUsR/7cCjCAgfaj6lRWeNjncrGrEDuELu9dinZ/D+MGC58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437971; c=relaxed/simple;
	bh=IsSRvZpTd2ytDnUVH/h7zanvLZg8RPBZ5DIYyIFl5Uk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f2cSn6LcqhqF1SYb4Dfqn2HUPYIoCCKW1ernV9n7w7HnyTEba5n8JOdqYaxzjmsDMn3JYl5bMxcbZ5yI+QvdTBk1/hRxrZLVfxFNL0mtaUt81iIr5WPZ5sf19WTVX37RreCM5x8diA2s4B0/xOifVFXDVp3IajMSRLg2uS3IVHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCA7DhpJ; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCA7DhpJ"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcb5cb1so35636996d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437968; x=1790042768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ad5dKOxCgmzRzr/3vr0OMGOG7uBSvPVGD8Z4whsnBTA=;
        b=WCA7DhpJ8TJeP9pmUDreN7hK6JZCADnfkhjgBPZ1ijFQXHog4DZyhPyc2+eVrQXmSg
         JTGDE5PlvHpRwK3MG1n9Cm2/Y0b2Kh+w//ukPWR4zLbTxb8eEQt0mKwYc3hUdWnpqhp6
         Y6PM0mfsjfptUlyhd98y4zIp1zGngPuwVy9oiJAEDOK1PNybUZAi3sW2eonQJTiOuo5f
         QleQOK2Wk7Hv3l2NMkNxXtoLmlsI0/3Ouv/uKNrfEPR+2jCdy6mls9HneZZJp0j+m0uP
         fHP6BLs9hPTQD2WI9tajwUF/BbSL66CJ+VX4dKbtl4xLQg27RZQCgZ+iwV7mDoJwCrpa
         z1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437968; x=1790042768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ad5dKOxCgmzRzr/3vr0OMGOG7uBSvPVGD8Z4whsnBTA=;
        b=jfoXxzefQcpFJT1ZQqfXJ0SclBJfSZ8rjfQZQXiGSF59PUdozPjy8UVTmVkYkl0onB
         UP7Q3im9CHLA4HWLTsUdoMmgFCzPywCAXptH9+P20Xu/DvGK1RagfrgIlG/0G5FIJCRr
         Ky4N3jU/nGRjQFS77nSlEWdhwm/Rb/NZmYTbMVT55JJj4O1TR2xMCY3YhMcpDW7ixIKX
         rZ+qUKJMmn5Qw83a4tzRTEY2d0dbOr+G+iC20xiRDjkvewx/iuGzImSI7tnqa97MxgJy
         ueuJZiZf1To7ed6Rvf0G1VkRSt/jTlPcUyg3bc5WkX3h2g0Gziz1CAjk+Z5s/Zl5e6yK
         s6KA==
X-Forwarded-Encrypted: i=1; AKwUvBz+sRwz4YUmg8yHTXY7nRFF9vsYtV5lOdP6wXbC4+7jWa+fymiBuJYULM0aMEGMFDTZjpvQ38D0EpLMBh4=@vger.kernel.org
X-Gm-Message-State: AFuF++kToTwEOLQNGbrfSFt9/CxsoDFi2+2ovl4lj6jAVt4kCK5Vx79L
	HcQMeJi1jz7eVLrgtB3xvZsyBfU/twks1fceky8JnfmoG+BneUzSRtQ=
X-Gm-Gg: AYBFou0pyOrHjM04l59ucUynnlmOI1agWchIq6LkiS8ucs7QZtNLJSDi2DCajlSuN/y
	mcgrQ4tVmJgIrw+/aa8W0hX6F8pB3kgB6cFiMYdeFYuhEB98pKvNy5hfV95Qh9+f9r0HSfQTr8G
	zko0w5qbccIC4fF3J3dpiHf836Yp9bC0RPlUuxO+aMTTvQ9BXd8bGbQRNooK4yyeEBPq5T0J2Fv
	tkfVQGVXtM0nqX5Dxc1yGhA6fprmfXUt7IRcCJMj4XXdwj4Ssa0OO6FgAsBbW2qpg+9u+2rP1FO
	bjnBYq4bzWn3s1SAtIc/UjlvXOWat/H94K35rZgOtFm+r0aQOl7nwDObp6E4PxzEpU00L7N4XhQ
	mcBGF1M0vvf80VpSUDfK1OjnsfaJkLdOWgAmbsjsvgkmxDfIigm+cyruKapDVv2Xdf7PfGekB26
	YEHrJ5hxEiqhly/vKNMNEOvzJpyDu5u/W1C/7IHj+bE/heZPkr6fHax+DT71vR5up1VIBy2X9dW
	qjzPbOtz378v+esHozPjV1dasiNaG2w3e+Fng29FuQcXJr/V300WDM48YYmP1asK9Bgw9EZ83Sl
	SW5mHmQSnub1eF1Fs+yQvkSimBpjj1nSQzDPV+fq7efDSaUhfQd9FP6r5Qrowthz4ECBvg==
X-Received: by 2002:ac8:7f81:0:b0:531:179e:ea4e with SMTP id d75a77b69052e-531179eee80mr50338711cf.31.1789437968264;
        Mon, 14 Sep 2026 19:06:08 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45cb06sm109618956d6.11.2026.09.14.19.06.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 19:06:07 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Jan-Simon Moeller <jansimon.moeller@gmx.de>
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] leds: blinkm: Remove sysfs group on allocation failure
Date: Mon, 14 Sep 2026 22:06:00 -0400
Message-ID: <20260915020600.91955-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

register_multicolor() returns on allocation failure without removing the
sysfs group created by blinkm_probe(). Remove it on this path, matching
the helper's existing LED registration error cleanup.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 56e8c56c9af0 ("leds: Add multicolor support to BlinkM LED driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/leds/leds-blinkm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -691,8 +691,10 @@ static int register_multicolor(struct i2c_client *client, struct blinkm_data *da
 
 	mc_led_info = devm_kcalloc(&client->dev, NUM_LEDS, sizeof(*mc_led_info),
 					GFP_KERNEL);
-	if (!mc_led_info)
+	if (!mc_led_info) {
+		sysfs_remove_group(&client->dev.kobj, &blinkm_group);
 		return -ENOMEM;
+	}
 
 	mc_led_info[RED].color_index = LED_COLOR_ID_RED;
 	mc_led_info[GREEN].color_index = LED_COLOR_ID_GREEN;
