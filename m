Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EF6509EFA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788463866; cv=none; b=ZDU9/K8hzxp47YG2xEKZkSmldnxBoUSjkJA/0Vf+ZPKleF//zUDnQidG/poy51ugLmajz0JJicG7pCa23nPXvWtdylNy+H50/P+estOyPujTjWv0Q2YYetGa0kDOQ6/UR3lNRB9/ENR+/fwJTdgZysrjHlSkyJFXSsL13+hv4pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788463866; c=relaxed/simple;
	bh=sPieW/XMxA1aPDsb/aIFP2+oe40K3qdsLeR6duFXD1M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rLbpIvmP6Odn6jOoJp8qRHS+KpYboveRcgvvYpt1D0FuVsotz1/wbYpOggwak27MgoHpshJfg8qjj0NMEmGmxv0JNus4mW7u2o3jSpO8FVoyYyyyw2DdyTQnWEmGQLWPBBgZLNtEanbAWEYoRdgMm90RUaehl6/a5hV6sqSn5hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlZI+peR; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlZI+peR"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d7200b2e15so2257025ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788463858; x=1789068658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q4u3M0sxZUqmdiAJH52liPLQN2L5yD3cqPXsc6cd89U=;
        b=PlZI+peRfuXk4I5/ySdd0Jw+g7JFFfPEhKcFzDr5LY4fGc/p/nq2yGnc+8Cq9labhE
         iipovlvVinCv2XNCiaP7kmIrPi0+rMXCHQQPXIGdgGifn35yRiAubj5VXqeIgyzri0uJ
         ou/ODXGrTumxV5R94seXyH+VVZ0TqFEfZRd4RZjJjG5folfr/nhDNZxLgfzdwgPx/nt5
         5feV3V2O4QvcqUrtn12SmpRIhq+TywLfoHumCU+YMi9EKT5MnG6RUp/bKuvjXMDDsDnc
         9XO9NjCUcXRDsFgA27emnCzJJBAWXikIIhwnWF+3EshxTGUGyNgNOeVwA1jfsiwNqr96
         /Lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788463858; x=1789068658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4u3M0sxZUqmdiAJH52liPLQN2L5yD3cqPXsc6cd89U=;
        b=CSaFyx7C+XtRdI3+vt1feJMXGMIO4ga1QQ3juzgWaZ4Lr8u9KMa4itMY6MjGWAAhMx
         TZbq0FGqgHXIXdr9FEtxZaWx/gHLh1mrf1r33j49iOp3ATwi3bnpwekWpU7f3x+w++pX
         zyJRtfjgqSW6UcK4uuPnZEKA1OzJwHOG9jyElYLorA4nQ42ohzW/BQiV2t0BfbDeQDld
         gKo1/bJBYWCqkv4eEIBiXvrEOSSQ8hQnzE+A2TxIVZ7YyxjRMiSm/cM1Stf2yYAPPcsL
         y6tk944za8FLij2bglP4zOopPDngZyw2kDiTM8TS5KELXI9KM38IrwwUT5JApGqNmS3y
         1mpw==
X-Forwarded-Encrypted: i=1; AKwUvBytaqFGIvyFtOiop4rcpTqd1XAqm8ShFXS0i78/90Wfq53MEGPgpVyt+gvXOW5081m3MHSPFxWOjaphbu8=@vger.kernel.org
X-Gm-Message-State: AFuF++lMmzC+b6AJyz/vR6sRPMvJj8ZlVWxasj7gD208yhKuSBwC50VY
	RltXXPUEi+iRKupJsSIoDFVWNzw3shB9tr+DHxPmMDTZrX5po6MTHrCx
X-Gm-Gg: AYBFou1Nq0r+d7goczqq+HUIrrzWsw4w21+EQ8wWmpmjorRGqGaZHReKB/8gtuc/6cn
	LUYhIPqTQMPi4ES+jvayWgnUlQ8JONorApB/SQAk2KQGE1/hfui7s2lnVlGVykubGBjOTcgl4Uj
	0mtk077aYQbPC/m9JypzGhruHZqo/MOO2x4xOc3n2DPWJkmuKpT2NCqS8PXhGryFUtQE1V50nTs
	eFdTviDtPszQxySYZibdb21gbeRbGZZFFZIXiZx2gx9N105hyon4BeG2tb0u5QpHv9oh/kGogOP
	PnGyfRwFyP/W0Bf9vFeAZ8RXeQyV94Vc1D4tT3VSwqDUZc4H3Mubd4cxN2B0WI0iLmwNP96+08w
	JQddZNoTB3XFiaEnmSFX8GiR0N/7Htg5QipMO11+tQgieP8vKctfrmcWJfMlbNNJ8L7Cq+gqxLy
	wC2PiEHe2LP1UW+/WebajD4yIrvaTMyh1UKzCHrMgZH/wMRjT3RdrhMDXnZ9dmGbErIzA3Bk14d
	OQ2SxltIhGbI3oDLj/GlVGeciI/Q+I712c=
X-Received: by 2002:a17:903:3803:b0:2db:117e:cf50 with SMTP id d9443c01a7336-2db125a5895mr20300335ad.4.1788463857912;
        Thu, 03 Sep 2026 12:30:57 -0700 (PDT)
Received: from lza-virtual-machine.localdomain ([223.160.226.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae53ddsm396985ad.78.2026.09.03.12.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:30:57 -0700 (PDT)
From: Zhian Liang <liangzhan5dev@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhian Liang <liangzhan5dev@gmail.com>
Subject: [PATCH 1/2] Input: tca8418_keypad -  Add devm cleanup to disable interrupts on unload
Date: Fri,  4 Sep 2026 03:29:41 +0800
Message-Id: <20260903192942.21906-1-liangzhan5dev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tca8418_configure() enables TCA8418 interrupts by writing the CFG
register.  If input_register_device() fails afterwards, probe returns
an error and devres releases the IRQ handler, but the hardware is
left with interrupts still enabled.

Fix it by registering a devm action that clears the CFG register
 when the device is released, disabling
all interrupts on both probe failure and driver unbind.

Signed-off-by: Zhian Liang <liangzhan5dev@gmail.com>
---
 drivers/input/keyboard/tca8418_keypad.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/input/keyboard/tca8418_keypad.c b/drivers/input/keyboard/tca8418_keypad.c
index 36d4a7c38bb1..9f0aace6bd21 100644
--- a/drivers/input/keyboard/tca8418_keypad.c
+++ b/drivers/input/keyboard/tca8418_keypad.c
@@ -270,6 +270,20 @@ static int tca8418_configure(struct tca8418_keypad *keypad_data,
 	return error;
 }
 
+static void tca8418_disable_hw(void *data)
+{
+	struct tca8418_keypad *keypad_data = data;
+	int error;
+
+	error = tca84818_write_byte(keypad_data, REG_CFG, 0);
+	if (error)
+		dev_warn(&keypad_data->client->dev, "unable to disable interrupts: %d\n", error);
+
+	error = tca8418_write_byte(keypad_data, REG_INT_STAT, 0xff);
+	if (error)
+		dev_warn(&keypad_data->client->dev, "unable to clear interrupt status: %d\n", error);
+}
+
 static int tca8418_keypad_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -356,6 +370,10 @@ static int tca8418_keypad_probe(struct i2c_client *client)
 	if (error < 0)
 		return error;
 
+	error = devm_add_action_or_reset(dev, tca8418_diable_hw, keypad_data);
+	if (error)
+		return error;
+
 	error = input_register_device(input);
 	if (error) {
 		dev_err(dev, "Unable to register input device, error: %d\n",
-- 
2.34.1

