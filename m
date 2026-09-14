Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E556447ACFF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394257; cv=none; b=ijF4Twnqs9vtyEDgIKU9+R9HoSkAR/DCitGJHaeQ9JXdxsvCD1gkIX3ekcN2gE6Z+DB4pkyddswDVwbz5VGpHIh64YwedvUSj3aUHq2VY4D1r3AqsQo3GR6w10WbVzMj/wQbaBwoYiFSeOug50OhVYD64RPO7DbNeGVGCZ464X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394257; c=relaxed/simple;
	bh=4C8oUlW/K8pKlkOLxMwWsCa9VAC3cTK/vHmn35fjaPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KXrBHd1cAJdZseYtFeB1Go8IZ9rgVqP2k+pHY9WY15gD8PyA1paQVTHg50WQg3p7XM7NCZ2Zu41354HMvvQAOVyG3ZzpWP97/gDIT/nWk0j3/zXpbcMO/w9/+/cXfbMuCy5wrXIP9HaJTSa/S/R/uBHISE4X14K935CgK/sjZK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2utLZvu; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2utLZvu"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2db710396ffso35454925ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789394253; x=1789999053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qaak+sKiArxa7mKTlQvl1SbE11tdZGIRrd8OTw4JELM=;
        b=c2utLZvuS2Yyt/JHyr6bc9kW4ekQE2B3ViaOdP9gR100gAoCMVwd5152py2B+EKSjn
         lBYF29FRcg0kDNeQ+yCkmRMHF4N0HWfKxxAtH3TkM/w6dbuMmTFy9oS6c5qRzxQ+POMi
         ooBmxomaXFopx2xMv9v8lzvPTpPiRw8e/AGe2pNV2B/QFuymR+EbasQaF2NV2AddS4du
         SvPepfxWQjqgEBi/oL5myebi/d62aOcP96D6BC2xwsQXiLFYRR4+kC/pw0hvJbitOjoD
         pxGkLg7svnrUFJsTd6k+4MkKDdAh5LggEBR3TcTulFSg0PVWhTosbpgDwKz5SiZ2yrCu
         zfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394253; x=1789999053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qaak+sKiArxa7mKTlQvl1SbE11tdZGIRrd8OTw4JELM=;
        b=e8g+0TBOlLP7irWUzMoPrKiLl/8a/S1QLHTc9/ZuvvACNq92RcW82yR0jzj/+EqpQG
         7GTsNzm4gqwN0/VH71m9mv0aOxPm0YjQR9f68IqzRJSqwCz5CRqHqOdjjoEde9dKD7yX
         2ZCo3LMga2oICSix2o4FS8LHvC/5oLomOINY4GvUS83VL/HSSt8xBqBGstuka/dxG7gW
         ZQNDQ5jOxUStWUH+DpHzAaBZO93UUSRNV+E536Z925yPosQ6Lvwd3ln8mYUbOrwhbiEv
         cJx6UOfV+GvzNOSqN6QLCGLeFvcb8d7M8QxO1BUcAb2RoUZ71ye6GehSWp3emMRGKb51
         1o5w==
X-Forwarded-Encrypted: i=1; AKwUvBxOTz5p1SaNh7PrbFYjTQFBJ5BebkymzpvLEVG7aMP/a0UHlAZrRS8261bJ1iNMxmiCUEwChkO7F/Gh2r4=@vger.kernel.org
X-Gm-Message-State: AFuF++mVX5oStMDt+0PvD/jQwGPq0KiMp3sXfuDJ+QQnbw7+8nuGaI/R
	t5vhDgj12z9Pq6HD1v6FVC+ApF+EM38rNsaQvUvQa/wGZJSxrUR6awXA
X-Gm-Gg: AYBFou14pw+d+aI9ErAoqg376bdR3CAJ1sDq7Kth+setGK3yn2Qrc0tYJQcckGMz0W+
	fR2qGMFcx1RMfZJBlYtr+yKvGiUKtZuY7AFzCQIPGKurAdFFnDtW+UAXOiFVCw5f6QKLRLOT+CN
	F1nRHRfJuB+XoUIsXNCWi7LbOCEERE+QnvX+DIrHsEdVsNwaCS18i+0RgOkF04SYMPx+vIuiju/
	BiAoe92O8iMp4IN4ZMoVnKXRc6clNFR3UTdqDqIi8jV3Qy50nJOG03c8Sunr8KYNBJ7seFPpW0w
	I4VlLqUUU1jCeFH27rtaWPPo0lLdd1PzYL7u0Y8FjcZk3XYTMBUlRevDZOV4VRZl7WT4lTfTZhR
	6rsvVvQXVnF5rpj5w/3hFyM0FOb1vrw7Lj/LhX+ZuZFNns3RdHmM7SokUcPpdxKC7CilvajL39r
	u5ME7o63rerwv1NtITbe6VEnzl+oR8NFs5YezR5bbL2v4CSZ7Ft9dmZQ==
X-Received: by 2002:a17:902:8d8e:b0:2dd:6a63:4476 with SMTP id d9443c01a7336-2dd6a6344c1mr28308675ad.10.1789394253055;
        Mon, 14 Sep 2026 06:57:33 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cff297esm49156425ad.73.2026.09.14.06.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:57:32 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] leds: flash: sgm3140: fix child node reference leak
Date: Mon, 14 Sep 2026 21:57:23 +0800
Message-ID: <20260914135723.1741327-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sgm3140_probe() obtains a reference to the LED child node with
device_get_next_child_node(). The probe error path correctly drops this
reference with fwnode_handle_put(), but the successful probe path
returns without releasing it.

v4l2_flash_init() takes its own reference to the supplied fwnode and
v4l2_flash_release() drops that reference during device removal.
Therefore, the reference acquired by sgm3140_probe() is only needed
during probe and can be released once initialization has completed.

Drop the child node reference before returning successfully from probe.

This issue was found by manual code inspection.

Fixes: cef8ec8cbd21 ("leds: add sgm3140 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/leds/flash/leds-sgm3140.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/flash/leds-sgm3140.c b/drivers/leds/flash/leds-sgm3140.c
index dc6840357370..51e31fdb78e5 100644
--- a/drivers/leds/flash/leds-sgm3140.c
+++ b/drivers/leds/flash/leds-sgm3140.c
@@ -273,7 +273,9 @@ static int sgm3140_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	return ret;
+	fwnode_handle_put(child_node);
+
+	return 0;
 
 err:
 	fwnode_handle_put(child_node);
-- 
2.43.0

