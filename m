Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80585368D65
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481332; cv=none; b=PltSGToj77QDhiFSVL0/IAikt5AqmAyT0Z/W0g7ravIX/uq2i5F/VjfZo/jOLYD0JnAS8iafKooX5aoBK97lRGIhC2H8BfZmnLebDOZCPO/EpidpQcRbUL1rtK1K1fpR1Q1XayR6nRerxr6kTSrLdi6NXTNJs6tuybrOrUwL0GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481332; c=relaxed/simple;
	bh=bx4DSXNCIULw2FUncUSRqfYmz85DyjyUcd9/xdHxYPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FHwrd5AZRJvjJ2S1hY1jmXUoR5t6j42zGFSh1xrXnGy/MQlajkW14kfccjCuBaIG/020Y/QEFlMGnBqBeYAD9FRTe8wicvXrFmPdsojNzaEu2fgwT+5MRzPRdNJYzGh1EmbNXOU1/7NDu1V+Oc8Srdm+ku/L5u7g2QB9L9eLCbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANjEIaCU; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANjEIaCU"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ceb47d53so482195a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789481331; x=1790086131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dfdpMft+Taz5w+O+/iQK+gDuE29kZk9QP9FYpppeBn4=;
        b=ANjEIaCUbN+pJRfCyOHqMgw0W+d0iBadgcnNs4uUkevs/f9q9j8/+DLNhrvoK+Gij6
         zWO0O1/6MPRGc1LHs0khFw3c592czQ1PEyZ+jHTSqqtdIFfyI0N4Cwh+Pm8SOn8uloJI
         rM0oKnmxyKeqa8j47JKfHuMwdjz3BHdhDbScNJQjrQcBEUXHwU0Z8aZBQcJjTA7sjO4F
         ZbmKHAgBPqnbkjGV21pZ2y5xRIcEGQY3hYYCV5FxOHG2LfLC5+Q1HGiZP6Kijkf4Xn0z
         K8O210nZ+7BE9q9kuRslvg7ZL3TUfpRA3t8IjsbNE372X/QqYxfoJP+vz14efJMocbXw
         jMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789481331; x=1790086131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfdpMft+Taz5w+O+/iQK+gDuE29kZk9QP9FYpppeBn4=;
        b=iN/xADhOViPnkH88NxLbzOfp2hDhyDAtPs2Q49mFk8Jm796MRI9+WdRq5w2qZahU4W
         35BXqe4AC1QdD838nO84K0YpNhL9Xwe+uQNYQm3R77/gBecvFB1sT0xpwYg6d2hef+El
         GUYtmGl9Sw6hOdDOqKbw5XyCqm9rVDV3E8A82M4xwitQhctNLmqPgd7+FgN1SnJ04aAw
         cByUWadQ/O/yOeiHz3IT9ARqGgsWWp418OlACt6JX3ecSgjgFRbCOloASY+bBb5ITKJ2
         jnTqAFE21s8eoVk6b/WnylyOiCUGnCJbSBzFz9UayuB/AGRfFmsEqALsZVU8Iv2wIS19
         VSvw==
X-Forwarded-Encrypted: i=1; AKwUvBydrSGMaoVdHf6MUB54Sfy9eHWuaxvnslixoukvE83ktIf12DZ7ags0LiyQZ1ZM/1GqqLHlviWmbL9RVt0=@vger.kernel.org
X-Gm-Message-State: AFuF++kpywO2xDOotnmMw4bZA8YbliLmk8J5m7OO83fvhZsoLBezIDRF
	njdB3zuzjNxUIxQx3y80YANRWzRi9DJCrSZgAtY8olMaJJQb84/gHdQN
X-Gm-Gg: AYBFou37ik3O0ob4m/ptxEvyUmOQDaaWCVIl0WoRtAGasj2oOcZopH3qWRkxVxgefp6
	4l2+lsJ+8OO5/DH++EIeCbp9kgRdmMnQs34ouDhWBT2uOLPkAiddsp9OSFC0nT9RT+v8NI6avwZ
	4qAeG5XpEnKX8zLEGjhJY1gaPVmCRxRo9ucv+PaFkrEv/5xcsAJqvG5pdzoFMMCetfWrK73ojgY
	JSACRYKB3W84PSFuTvks5AA87rbx+w4Y63O0Jjz9IGvmYc0z/qghzhy/J7K1PFBxw3M67aaxSAf
	segMruI95vw9qJHis4nhYJGA6a1IcthbxEIqg0T2JAmEjK7/dmtbmKn8uVjHqXyvCE+pdBu2xqx
	rF/rgx7F8K0mf56OoqSnd8EuOomTdQAPshNNh3MuUYAVELwa6aCpRHpPhEnelmswllTqyOdgbMy
	k7IXYlc+hmsFcEQ7Ylij235yfG+UeZZSSw1/v12rbIJqczTxCNvdqexHkMyklWAC9/y6obEDvHI
	nzUBNz645EsMkwGTs86jIgVl/t+2av5I0Puv+M=
X-Received: by 2002:a17:90b:5646:b0:390:84db:888e with SMTP id 98e67ed59e1d1-39dfe097622mr4709299a91.7.1789481330561;
        Tue, 15 Sep 2026 07:08:50 -0700 (PDT)
Received: from localhost ([2401:4900:1c6f:fd8f:123a:b4ef:d8b:c604])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd58b30sm5863118a91.11.2026.09.15.07.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 07:08:50 -0700 (PDT)
From: Punnay Sharma <punnaysharma805@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] media: atomisp: ov2722: Return after failed pad initialization
Date: Tue, 15 Sep 2026 19:38:28 +0530
Message-ID: <20260915140828.25537-1-punnaysharma805@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If media_entity_pads_init() fails, ov2722_probe() calls
ov2722_remove(), which frees the device structure. The probe then
continues into atomisp_register_i2c_module() with a pointer to the
freed subdevice, causing a use-after-free.

Return the original error immediately after cleanup to prevent
registration from accessing the freed device.

Signed-off-by: Punnay Sharma <punnaysharma805@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..0748247ca42c 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -979,8 +979,10 @@ static int ov2722_probe(struct i2c_client *client)
 	dev->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
 	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
-	if (ret)
+	if (ret) {
 		ov2722_remove(client);
+		return ret;
+	}
 
 	return atomisp_register_i2c_module(&dev->sd, ovpdev);
 
-- 
2.55.0

