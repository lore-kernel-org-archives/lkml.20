Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523504D17BE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604304; cv=none; b=Sl3iGAk/aYk+MgBpk++Mc12WJIuyEydjVgZy8eJ6UPqmumkrzFCCaFrFWrftcxh/ATjHupK0t9zMCxvzaS0KiRUDhprBxZpjmkzlDK5AHjUBGySnz2hemV3Z4Plu0VktrS1anCO/DJkLgWZqCkKEJOX4PIzN5YNPCLAvFwd+8WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604304; c=relaxed/simple;
	bh=e7sZyGlmDt4oF5STQeiaE91HwY1PMEfx+7YPGsgDjQw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J8qydMJUBN4GGSQbSzrL4ZO1s+eHVN9moP2Sz153ywGy8DX9rphLCLc7YFIAvvFbKY0n/vHAPl2UGwD4Ib1SuZG9Lr1o10rwl4kdwy07CBXuni98Fe/ogpTtXdSZj9AvzMUw1D6W0f3LoJo6hTbdhJD2/1BjWg616uvxb0K39Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AiGorfGa; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AiGorfGa"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-882c2bcef77so844590b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790604297; x=1791209097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t52BXxF23LF5E87Y4H/VQEPcHdWpBGQRCV4phQgDzGs=;
        b=AiGorfGaw9QPrHyCEcUq8Rk3eMCbZ69NfyamC4NWykeKHhBc3pDD4D54eLHNTraH0I
         4caXslqeesgxDhci/DX1wkzY0s57gWAi25v/WJp65ENNR/zKFaX7Dh3+24f885IFsr9J
         s69M39M36/jhnKvIeR5OBrZt/oTBeGlqebNHqR/iIQ9qh//1QPhSgkpKkL2VOrrO8Ydo
         6TgWk53NoJznZob7P2F+AlPj1oKBY886pPmmZGX4MwbLvEWBi5+GVMophH/NT+8jMmyz
         pb8w1p9JEm+eIpivyftp+4LHVYQnSX6hkYmKpxviCrIy03Kl24wy9bBnZGw7um4I+u+5
         JibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790604297; x=1791209097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t52BXxF23LF5E87Y4H/VQEPcHdWpBGQRCV4phQgDzGs=;
        b=e6idqnpqeChAscCDzQesdtGeW4HKxH7ixR4YikFr+AVr3uNbyq1jcmSdSNy5qDLU1i
         moTZK8jWPyyLp43l9jny+DcJmRXEe/iKZ4aZ+4yQsVYL4OI+W6J3AX6rUESEQ6DBK7i3
         wf1BrnzTVK7U+bmBCrRcAi4QC128l2eOVE3xHR64xOaGBkI0lyXUIEX3ioDPu2Xk+Ui/
         pfzQSkMpqWTbeFgLTggeY+/ESpP+wp6eX/s2sYOu0BjoGyNQz/KWpzSJsTZEfg6vvcei
         NNCMIQEnP9A7I4XMGHTQ88BAV02zgLWMJ5jYvdGl9ClS2t1wCYacZkPFA3xWMn3kF1/k
         GS7A==
X-Forwarded-Encrypted: i=1; AKwUvBxNssB4PVb8NsG1rayJEAMc7kaBGjbOoMcr35lXw/dJT05cHWdnAbmMm27PonBiSXD6AXaIVn6JY099ASk=@vger.kernel.org
X-Gm-Message-State: AFuF++m3g6hiLJLpClG3z4MIUrll+oQ7KqnUpNAfMmF4zibXEsMgN1i3
	ALgDDQabgoDi1YkR/n4npD42VKf9oBEt3HacWcG9+BCnRJeaY59zlBzQ
X-Gm-Gg: AYBFou0HTYc1idRG3ayWjFneQ8/k3Z2rIS8sgAF0ocv5OYsCRhy/yiZVznNgzh4vtmx
	l+ezZ259YvOwkxuUvGyfhVYsWmTqtBdW1J9dLyzS1bFLFgDOgtf1EFKNeJHynqx2qA2b8IdZUDP
	lH0bnPyNsSGTLDqHG6cLscxgveVqNcz8b8KcwxCmyStOcPfdGADx/K4ASzsWDwUmea8QKaw57I9
	rvHxYMOBNoR0RMD03GVb1rdzmm66kPxrszrSctckN9JG1IR1yb1qCOXZcPoSYzZVQhKv5cf9F/g
	gzhQDcfcICFAckNMTvcHHS38j4iNsX3KDBO/0JSU7Dw15glvh3BwaKV8h9KhJ7MEFu5/0n3NMTY
	+6WHDsaGdIIF/dX22q29L+IdCg+YzQ29F8Wc2h4uNQOFYete0SZAX3HE46CgeUptnvhngfI7If7
	5tMLkzKLzYzgYbgLXxDgNKSwb7G7uwmOq41PzINQ+/jL+gJATzKcYx8c7twm5GS+CLW03byhUmE
	Xoyqp4Ufr/ktgaS
X-Received: by 2002:a05:6a00:4107:b0:881:c561:a088 with SMTP id d2e1a72fcca58-881c561afdbmr4799959b3a.4.1790604296856;
        Mon, 28 Sep 2026 07:04:56 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff354d854sm4129901b3a.2.2026.09.28.07.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:04:56 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Tu <shawnx.tu@intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: ov2740: fix power leak on remove while runtime-active
Date: Mon, 28 Sep 2026 21:04:48 +0700
Message-Id: <20260928140448.2404694-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ov2740_remove() calls pm_runtime_disable() and nothing else -- it
never calls ov2740_suspend(), which actually powers the sensor down
(asserts reset/powerdown gpios, disables the clock, disables the bulk
regulators). pm_runtime_disable() only blocks future auto suspend/
resume, it doesn't force a final one.

If unbound while the device is genuinely runtime-active (streaming,
or an open subdev fd holding a PM reference), the regulators, clock
and gpios stay in their active state with no code path left to ever
release them.

Call ov2740_suspend() in that case, guarded by
pm_runtime_status_suspended() so the common already-suspended case
isn't suspended twice -- same guard sibling imx412.c's remove() uses.

Moved remove() after suspend()/resume()'s definitions since it now
calls them directly.

Fixes: 866edc895171 ("media: i2c: Add ov2740 image sensor driver")
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ov2740.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index fb590dfadda1..fc3710cf3c0e 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1198,17 +1198,6 @@ static int ov2740_check_hwcfg(struct ov2740 *ov2740)
 	return ret;
 }
 
-static void ov2740_remove(struct i2c_client *client)
-{
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-
-	v4l2_async_unregister_subdev(sd);
-	media_entity_cleanup(&sd->entity);
-	v4l2_subdev_cleanup(sd);
-	v4l2_ctrl_handler_free(sd->ctrl_handler);
-	pm_runtime_disable(&client->dev);
-}
-
 static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
 			     size_t count)
 {
@@ -1323,6 +1312,19 @@ static int ov2740_resume(struct device *dev)
 	return 0;
 }
 
+static void ov2740_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_subdev_cleanup(sd);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		ov2740_suspend(&client->dev);
+}
+
 static int ov2740_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-- 
2.25.1

