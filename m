Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17F5260580
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128601; cv=none; b=tBpFYzRRLIQehxXvjzrN286z1zJ6mcBB4ssVLyl8UjQOc2+C3aQjbPBiFm1osGrH4x1WBHjsAJ9mfN0o8qDwsYB38XED6j821URvL1mvQmmFSBxBPhNJmNsYTFspX9tCfklOT5UsH9mR5MYhIgHJf/dwVe/3a46a7Vsi605YKWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128601; c=relaxed/simple;
	bh=AcFeSQtM7aew7J9oFB0qOVKBF7m+83aU+dFMfY9BnCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kef76u4a4/piLKajsuaD67xMuQUIVf6N1VdFRpmdWCZfs0MAGOBZNh56ObPMDvNqp0ZWxSHiFYfCOyJjATEFDZUWaPcemiMJfxBWE2EYQZHsNxVqbjJyYMpRGk44nBHoNKXaycYe+ZWqlzhte+Bm0LMrG0529PUEnGFknkFzloQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cW3e4yxg; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cW3e4yxg"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f066d8so1444725ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128599; x=1790733399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k4D3VR+86sNKFIEnE4BQe5eU0PEwvj6J5mCOLZRzuwE=;
        b=cW3e4yxgZ0h/AseQyYOPy2X22j8JCCBzVfJfMHIibx9nKn+FlQerrEX5UvB7Jmh+W8
         8AB+X2apAa1XeotfWO1ZOUnzWiSOUQAsQT8IZRP4FwsKiJ/WunsUQAcCqfEenBlayyHZ
         7sFRGoDhaaADUQt4XT7tANagX/fkGpKbm1wretfQ24d/RUsRG8Lww9rP4nxWdDWgKCVO
         hWkgOfHERyPzs7ly8a+qjUQ12YH3UkW0Tcs9KDFPuIT3ho3iV/XIjtTsweQuf2Ws3aey
         Xz5QDlyLHF7dAvqs5j0Yyt6WPQESpEJvPAidCAmsp4vzIxKi+gdwz3dLmGK9VJSmOnPh
         nmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128599; x=1790733399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4D3VR+86sNKFIEnE4BQe5eU0PEwvj6J5mCOLZRzuwE=;
        b=yaStEZSUDPTzwHpGKoxWnLeSSA1CvHIwIlr5pCzcxM5fQ7IaMReJQwyNLRGRIeTcy+
         AupGLjIsGlmkkeAC2LCANaRH6jNRvBZj2iZLYDu+BkMnb4lf+lCkFFKUDjOm3nEJZfUB
         sZbNNW8Ke2LuJp9D8Zhrbsz7FbbEgHmEca/lON7Cu2ULnc3TJcZfF9V7phJJnXoZAKz5
         kyZPHwSXOkN+BYOlWXR1SD+isebtnG9Vv1v+VhCqJxu6bFll3/9WgnZxgSspjlty5HTZ
         V6LOggVGQjOjfoxNm5/3Xwg27NE8fiHcktJu9Uwx/476mrhyl+cFNedZDbz3h+rCji5O
         zCdw==
X-Forwarded-Encrypted: i=1; AKwUvBwChHu7+054h8ubRcCYgLk/qzeT9rqJObwr+aGJEf1xLQHIdlsK6byESOkmxXSjfarg9e6lS20W7GDIeXE=@vger.kernel.org
X-Gm-Message-State: AFuF++kDpjDnuWaau8Imna7DZXhki1Zkx3wYmB08UBhWgNdQ1ZKeXFfu
	kCAIQvRJ2ft7sxfYpVpLb6deifzvKqUbXXlfRMmqNJfeB6bRJfWW00f4LO2TwInSkAkjxjAv
X-Gm-Gg: AYBFou0m2zApYaFKwJqxhocYN4yLvi3eDkqL3WqQl8jmuNXXUpZceuGdut5aTuZhKZD
	A8yw3nYNJgbkQGRgdsaBBjFXXO/HiYZp92gVumNZEw7gkdL2KhSsW0rVsGJFPlMsv1k+F9Ymmoh
	wGl1PRe/5TE+04Vvx+WPLHjFqXtdg+g9jf/pKUyre1i/9nxxwOsfk93lAIBypptbEZUULjGSMwX
	3XHFukD93tTAPJ+/WiM3wsvK8d+FAuJlm0JszFIFTqyJ68gJ2VyAL7BLr7JzErjvSxBDXWXuJa6
	A91nCc2YEBawaxhD0hKYF+sp0DK+4iFbFHhTtooT4S0bpNXDNK+u7Mi43E8RI/ZP4844qxgTGTl
	eQLZxXXX1I5YAMrsZZCPPG8jVUtNMRyOd5CLNi/6inCa+fkVo2TB2qrGY6sA7M5fZIdV2rn7YEU
	9UEvB2nRVCxJfMsgpKRfYUU46RBznD6/6v16EKd2j/u1YfYo7k+ZWk9O34yz+Picr106xfAexrb
	W3qfhBXY1lxpaBOLRre1+2NkXOioFF9l2b6UYKH7S534BUe/m5V1g==
X-Received: by 2002:a17:902:cf06:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2df69877962mr7599925ad.3.1790128599066;
        Tue, 22 Sep 2026 18:56:39 -0700 (PDT)
Received: from localhost.localdomain ([163.125.129.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5dc32csm2780825ad.53.2026.09.22.18.56.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 18:56:38 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: ov5648: Fix a data race on state->streaming
Date: Wed, 23 Sep 2026 09:56:31 +0800
Message-ID: <20260923015631.44973-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ov5648_s_stream() updates state->streaming after it has released
sensor->mutex, while ov5648_resume() reads that field with sensor->mutex
held.  A concurrent resume can therefore observe a stale streaming state and
leave the sensor in standby while the software believes that it is streaming,
or the other way around.

Keep the update inside the sensor->mutex protected section that already
programs the standby mode.

Fixes: e43ccb0a045f ("media: i2c: Add support for the OV5648 image sensor")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 drivers/media/i2c/ov5648.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2145,12 +2145,12 @@ static int ov5648_s_stream(struct v4l2_subdev *subdev,
 
 	mutex_lock(&sensor->mutex);
 	ret = ov5648_sw_standby(sensor, !enable);
+	if (!ret)
+		state->streaming = !!enable;
 	mutex_unlock(&sensor->mutex);
 
 	if (ret)
 		return ret;
-
-	state->streaming = !!enable;
 
 	if (!enable)
 		pm_runtime_put(sensor->dev);
-- 
2.43.0

