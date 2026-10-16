Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539AE339390;
	Fri, 16 Oct 2026 06:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132666; cv=none; b=Do0zpAiTjz3ZnfADs3tMWTSUn34C1zITO2iqwOdXQ5zIqUZMVlLK3ML5yrUbDFNlMCySepuzx3NI7NS8NHfEZz0JWJN6xkt7NWhosbVLisTDfFq91vSiJsVomlPffBHo/LOjKGX95Zk3oE/rg89BHkJPbaa8CRgQgaFoMyknJT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132666; c=relaxed/simple;
	bh=RRr7FAtyes9jqwagcNaiAPzkSd2hFWKFBh1dgEF+KGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V94C+SvSeOXg+zCwqlBthVRwfQSw6H0qTC/44okLYNV+LvKKmFgf2dbG0l/oCrQu9Go03XrF11gis2G1hbm7GJmmf2Ghp0TxTj1eRDRRILNGQbWi+LA81DgCi76mRluCad3Lp5HOkgs/BuZF/GWrGTkfR6A43noC3Ckf9KnE6gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CqNW1QyE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CqNW1QyE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA652C2BCF4;
	Fri, 16 Oct 2026 06:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792132665;
	bh=RRr7FAtyes9jqwagcNaiAPzkSd2hFWKFBh1dgEF+KGM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=CqNW1QyE92PTKcE7x8RI171QWSQMaZYO+wZLtdOE5WGgegN1/f+xzwEb+lpk9Usmk
	 q8xrXPyxx066CVgeDXgZGSY46pBTWsoKnIxL8V02tjnDvRue745J03dZOxOZfo6UU/
	 AmFW/dCnss61olZhYrv0T3bEfRxNEGQR8YI4l7MxUMJT2a/Ur1WUE001JWseIvYdEd
	 kUkgJOrKckzLNmKyUiLyyfeUKwrONn73Q4vuvxEY5pWtWtpSdunCoPrXKnmUsjT3PS
	 jxMxE5pwPu2s5I9x1hl2VFbfvkYIA/hNHVZthXCZIk4Qo3RAiZvIi+hjpeEY5tBYqO
	 n9HztlSG5XKig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C638BCC6B38;
	Fri, 16 Oct 2026 06:37:45 +0000 (UTC)
From: George Neacsu via B4 Relay <devnull+geocausa.gmail.com@kernel.org>
Date: Fri, 16 Oct 2026 07:37:45 +0100
Subject: [PATCH] media: i2c: vd55g1: Register as a sensor sub-device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-vd55g1-async-sensor-v1-1-cd72f6d68ea4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBtQQ6muEi20ppqNhgNSRHdPW
 r7F/w8IZSaBsXkgU2HhFCt028By+LgT8loNRhmnlXZYVmt3jV7uuKBQlJTRBlJD71Toeg+1PDN
 tfP3XaX7fD9Hg0oBlAAAA
X-Change-ID: 20261016-vd55g1-async-sensor-5be09860b38a
To: Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Peter Marshall <pm@petermarshall.ca>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, George Neacsu <geocausa@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792132664; l=1573;
 i=geocausa@gmail.com; s=20261015; h=from:subject:message-id;
 bh=HOuIUiiGtrzICJ6LB+4q4TGvU5naELrGEK4lImy36vw=;
 b=MB5soG0/w+aFpF+5oy7ZTTdO6Vctif3AxNsJen4iBAiIBdEYyrmRQy57hrDUOPbLcr390eGn7
 C9/GD7PcvLQAUgzDib7GFYgJmmBUyQd/m+Wgma6pt+56Jlh5TqfTyjg
X-Developer-Key: i=geocausa@gmail.com; a=ed25519;
 pk=KyQk/iWbxsikewDBh0SwlHI51RvAqahD3loqmRp9DVI=
X-Endpoint-Received: by B4 Relay for geocausa@gmail.com/20261015 with
 auth_id=1199
X-Original-From: George Neacsu <geocausa@gmail.com>
Reply-To: geocausa@gmail.com

From: George Neacsu <geocausa@gmail.com>

The binding references video-interface-devices.yaml, so a board can
link the sensor to its illuminator with flash-leds. The driver
registers with v4l2_async_register_subdev(), which does not parse that
property, so the flash sub-device is never bound and never appears in
the media graph.

Use v4l2_async_register_subdev_sensor(), which also handles flash-leds
and lens-focus. v4l2_async_unregister_subdev() already cleans up the
sub-notifier it creates.

Tested on a Surface Pro 11 (X1E80100), whose VD55G0 IR sensor (with
Peter Marshall's VD55G0 support applied) drives the PM8550 flash LED
in hardware strobe mode: with this change the leds-qcom-flash V4L2
flash sub-device binds and the IR LED can be armed from userspace.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: George Neacsu <geocausa@gmail.com>
---
 drivers/media/i2c/vd55g1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 6f458f6..8e050b4 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -2043,7 +2043,7 @@ static int vd55g1_probe(struct i2c_client *client)
 		goto err_power_off;
 	}
 
-	ret = v4l2_async_register_subdev(&sensor->sd);
+	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
 	if (ret) {
 		dev_err(dev, "async subdev register failed %d\n", ret);
 		goto err_subdev;

---
base-commit: 62f482ff73bf3ae88b0c899115527752cf9cbf13
change-id: 20261016-vd55g1-async-sensor-5be09860b38a

Best regards,
-- 
George Neacsu <geocausa@gmail.com>


