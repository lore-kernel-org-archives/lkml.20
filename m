Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48EB4BF944
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603510; cv=none; b=Zx+0P46iRCf+o8a/+6k9dPhkPJB5Azy0y+0znvGhl9EuaoqnkLUWnRX57ZJPt0JgjiqHnw15/TeiohWY5kHDvLESGGjnApFlDKp3NqXQoui2MT6+HR2hlwUv83pxhnDi5g2IWcYSwxw+in7wR+5djlfr/TDejvFcfxZwfmHqVIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603510; c=relaxed/simple;
	bh=gcCH/ImF2avN/BEXcJAAzwFIO1x1X7GsiP5n3c/8JK8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=isocmlueRg4Nui+cfzLdN9zKEoQnEdEEQLduytojlyhAeJdgNy1jSuruiiqO73KH+pWGYrWH3a5Y5z3EC14sKHF0AR/OYwR9G3uDjlYKF55aAtSEUtK1vXauqWXyrzn7w7hX3ZF9xPydhja75K7Q0ClEE0mh58a8kzZ7mETvrL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMzswL8C; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMzswL8C"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341fe27b718so3008120eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790603508; x=1791208308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ONrDgBKVsUbMcgTyeE/kjmsO78+gt+LAoKwNAqLrInw=;
        b=PMzswL8CmE1K5WlKHVI0h858Tf2HQUgFZxStQ3H1AfPI9fmcEsBM5Il1C0p7kfGING
         6kcFhqCye0lveFgCHm0C9MVzy/LOBTNHRq4Gux8tgWB/rZJhmJpLCTyoVOVNmQjS4ics
         0gIKyMQeoT1byXRIw+DIeMbxK+tqb0hidhKvjkVUnilmtwk+IA3GuYeN1jklgbL8ZBVU
         CiC1nZQ0oMVVoSN4jrKgC1A5lKb4PS4l3GlpROr8LcGjQp7y0x/3AkUSq7kIfenZb9OU
         7iDPkztvHgpNC5F/zfR4wBIJfbHfE4Pdeio16KH5vataxyAlFWEss1mOov3YeRC3+Ry/
         XgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603508; x=1791208308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ONrDgBKVsUbMcgTyeE/kjmsO78+gt+LAoKwNAqLrInw=;
        b=L/4bCZyQ8xXl7Ju7wjQjQPp/pJgP9YlzbUt5fwUdChXJge9NVKxaVbwPMEqYFBiBp4
         k6wzmSLyobMvCdBcwFIdjaJSfqdNMvzMS65PN+2W/fo7scfzVYsQuaxjBppcTFg+k5fa
         KX3SetCKWACQxevrxnv3qEAwEdiCo7UvtCWpbG07kJU6WOXEInx8T7pqqSudwOWAXLPW
         y62fYXfnwh9GRh8qIKYeaLSnXCRxpoLragCQXNWj2IAP1D/N5yJ0Y26HTaKmhqUrfuXw
         2Vj7CZwAPLIRPEyCMwHb2ivzfmcZbcIYB3DIch0Svzb4XvMu26BPzat1fH8Pl+uOM6P9
         SdHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzH1Kwbh5nH/i7wTZXin3hMrUVAtBOis5mbC+6bhmMv7wfyM2VBrG4csIrDm8wmW7ArcBOvL0UidlUKG3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDdFOMw3jOfeifuXzXfiP1pePbrsfbN4nSQQqZ1kBWuCvlUWG5
	7ki0EqG3iinpzGH1j/opR8QudgV7H/kqjkF5BEhNrGbhss06wQjo0hA3
X-Gm-Gg: AYBFou1eUePqYENP0DHgJUaWen03+XN/rw1qgaMibxkypEHUzZKPbl7G+/IO7r8tfuP
	QaRwz8GM3/qMtxgX4FjXS42ZpGFHGoByCEjKd5oBWo8bdDBrk7nYMNx25D9V1S5GdsKR85Y4ctw
	vAc5C2ZOGj2d5YewvoGpOm2pdCJhPbuJO8V/EDfSPOh9dhDz65g06Qh7pvvjNJOflXDG/EFxIAQ
	5JRRE0fHFD1zw1mn1TTVMG09YIW29PW/ZGliiS5MlMd62K4qXEhJWZIUEqLsLhxRF4xdUae5ybF
	g2Ujm8zPHh92YiiiZJmrLLE8IXzumUe605fAzj+Sc3z4ydDLs3g5J0EreqXVX5jxrNlUBNmsUkV
	eNTivE+7c1gXcOw4AvuB7WP7mSaIeX2LodD+kSYGo2leFCuT/dHO8Xky2JJ2igpJ4Q8fuTTgXWM
	xmybvMRHUFflCWpQqWhwSQwb2cMZAY0f7QeWRa1D8HM8z12xl7ajYMGr2H4w6c2zhQEp72/2Juu
	aFGAdZfuLsU/VU8
X-Received: by 2002:a05:7301:b89:b0:343:ba1b:9b55 with SMTP id 5a478bee46e88-343ba1c13acmr7303784eec.40.1790603507758;
        Mon, 28 Sep 2026 06:51:47 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3475546c982sm6634166eec.5.2026.09.28.06.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:51:47 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Tu <shawnx.tu@intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: hi556: fix power leak on remove while runtime-active
Date: Mon, 28 Sep 2026 20:51:40 +0700
Message-Id: <20260928135140.2354361-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hi556_remove() calls pm_runtime_disable() but never hi556_suspend().
pm_runtime_disable() only blocks future auto suspend/resume, it
doesn't force a final one -- if unbound while hi556_set_stream() is
holding an outstanding PM reference (removed while still streaming),
the device stays genuinely active with regulators/clock enabled
forever after.

probe()'s own error path already shows the right pairing (calls
hi556_suspend() when powered on). Do the same in remove(), guarded by
pm_runtime_status_suspended() so the common already-suspended case
isn't suspended twice -- same guard sibling imx412.c's remove() uses.

Moved remove() after suspend()/resume()'s definitions since it now
calls them directly.

Fixes: e62138403a84 ("media: hi556: Add support for Hi-556 sensor")
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/hi556.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index de573cee4451..45d1366c6d5a 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -1264,18 +1264,6 @@ static int hi556_check_hwcfg(struct device *dev)
 	return ret;
 }
 
-static void hi556_remove(struct i2c_client *client)
-{
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct hi556 *hi556 = to_hi556(sd);
-
-	v4l2_async_unregister_subdev(sd);
-	media_entity_cleanup(&sd->entity);
-	v4l2_ctrl_handler_free(sd->ctrl_handler);
-	pm_runtime_disable(hi556->dev);
-	mutex_destroy(&hi556->mutex);
-}
-
 static int hi556_suspend(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
@@ -1316,6 +1304,20 @@ static int hi556_resume(struct device *dev)
 	return 0;
 }
 
+static void hi556_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct hi556 *hi556 = to_hi556(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	pm_runtime_disable(hi556->dev);
+	if (!pm_runtime_status_suspended(hi556->dev))
+		hi556_suspend(hi556->dev);
+	mutex_destroy(&hi556->mutex);
+}
+
 static int hi556_probe(struct i2c_client *client)
 {
 	struct hi556 *hi556;
-- 
2.25.1

