Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF3D1A724C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791780538; cv=none; b=WxfYXjUJ+ALfkRPx3DpvSsknEmRnRP+Jf5dA/nNaZCFtJHQeL8uhwgeZuUF6YhiQB//8Xqg3Ocrf8lR7yw7pKr4D2H8z9WCyxEQzCnREv/OuRymQjpTzEAcioynm6j7rnA3W5t079KwtaMlW2PWQ4lYlXfit0Xs7/kCI/soG1bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791780538; c=relaxed/simple;
	bh=mNXVZisFr8d4ag5Ybqo/067e1iUf3Fk/1Flu0l+yMHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SeTXRNDpUcdb/ZRPusfZALdox/7mwTiHmPPD/bWsp11qepINFKO7xg3g6J8LiOI25O7TW+NkF2ABC3eO6yRBOXlBrh29XT+W6szMbZGH/uCm+0T6T5R8bqQxKaH3vCWBPAogPzmhY91cwK7NhO9gDnOz6hD6dlSN96IIEOkivN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DV+xk5Sr; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DV+xk5Sr"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5339173489eso17043471cf.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791780535; x=1792385335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jMGRj2x4/MNQGJmOzzzZqm+73crDKnrVgU8faoZXAfA=;
        b=DV+xk5SrFE41Hr6Cejhgn+qOAiWDMIYiW0tv3vCK0mhw8alH/mvJIuYc1BJd0YMj3u
         yHcUNTKh8G6oRlN5GbkqvAL+wdLRo9LrmUkXy6Vrzx2OFgc1RpyFfheZCl4A/8JzswNp
         NulcYEJw5AMBwF+QtswiTObGF9xUygYeCltpgAECgqD/ysWgeLg+QItRn9vU//OYNEWc
         968ivSqhqsRigTCsEbf76CiJ34rG19dSZG9UhxS/JFebJuwTQUrnDVeuJ9566KkUdKNU
         L9/AUTYDTy1TLRNk4hqFf03oPMqJUv4CKEwd0fHWGCa8EFI7f0XRYmGQ7UdhVb3TBcOi
         az6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791780535; x=1792385335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jMGRj2x4/MNQGJmOzzzZqm+73crDKnrVgU8faoZXAfA=;
        b=1QLzzvnxSPsiLI1jwG4fOuKoXhwBq7zznsNvkkILXV10dN5PrIaxiNRaA9j0J6ou0W
         HLYg+5zikXir4eL1Sov5+v/ARFOHWVPf0ZmjA6JXe6gVR9whxUHgxlgkpiea8vrqJKhg
         5wRJbOmjjn/N78GtxqEqMVAO1CLpMQ0eA7BViN5wKI7Z1pQeeXruVFf5JtGyDYwHJmjE
         5PUk1q6xnJ0zxyC6qp9ZisCteuCUyfsULHy9uDITpzy6xUypXiMyfJZBlWkCNVqCz1lq
         SXO/3fTRXcgoiw9mKizpImAWJPiKjmI9ZstFRP+pSvyklbe7aN5P/GSzSRYaFLev68pi
         /RuA==
X-Forwarded-Encrypted: i=1; AKwUvBzFgtudBdaCG/Fk2aaiWIW06W5M0Mv1+0pkRlNXWlwD4qqgiw8+DbzRVS0S+l1mLsrI+EgGK1HJOUXuvdE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJvy5T5GHJBn76WYECNKcKwlsDnb4hy9braIBvg3j0aNkXDmPK
	5IVQAKkRbs+RhA2ekRNLU9zqSn0P9WzdRloGHDYnKvA155TmbtWmsUG8QQbQfydEgg==
X-Gm-Gg: AYBFou3NtgpIxovN3/U3J4sSvbiK7b6I6Ea/2vHdmY4vyeOqikqKVWnrvkbPh3Qb2y6
	fJg07IEHfvsCWFDCb108O4S7QWQprc4HenJKxhLm+EoXfoss7CY+E60VgcTz++Y7ag6mrHaA0gk
	zCSVh1EKmkOH4BVtvulBFaHSGMjpTTSt/lLptcEWZXdoOwwfKccAwNsnQE9eqdPhknKl+dVjmgm
	rzKu3XI3AHQ9RzMRwMvgYNzy3bMtQI631uV4U9TldkXePmKyW4fywYonbHA37lvCh9bxnOJ5AHU
	N1nPOYef6FKhdUBXhPsfEs2xYa238j/41I/O5esS+B3+rvHNtj3afeFuuxZhPNVKBkDXCjxLEnA
	qsRXAXu/ihpJ7g+4LoN5REXii5/MS21TXT+khQ/WxnM+m1rcZ9jniQ7CvBF898WX+MgrO9Me5CN
	ibJKv7a8t1BCAF/lLNLJwwv3TJ7CBdv35Fu92WcG+qJLNHgFKIdL/l2HBhDCi3Ha3/ZWqh4lg6R
	nPzbioo7aq9etp8UsdBAgdCBNBTSqmAI9dpuGA5BrnOHpxbK5mNTE8qvzmbOnjqVt+zQAuzwew/
	VF6NCkrf4O9xFsTR66gI2BvKbPOj
X-Received: by 2002:a05:622a:1e17:b0:535:142d:fa17 with SMTP id d75a77b69052e-5359f488fafmr154064881cf.6.1791780534742;
        Sun, 11 Oct 2026 21:48:54 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b80d74168sm18142096d6.42.2026.10.11.21.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:48:53 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] nfc: microread: stop the I2C IRQ before removing the HCI device
Date: Mon, 12 Oct 2026 00:48:49 -0400
Message-ID: <20261012044849.162298-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removal frees the HCI device before the I2C IRQ, allowing a running or
new handler to pass a frame to a freed context. Probe also enables the
IRQ before microread_probe() initializes phy->hdev.

Keep the IRQ disabled until HCI setup succeeds, and free it before HCI
removal. Failed probe can then release the IRQ without callbacks into an
uninitialized HCI context.

This issue was found by static analysis.

Fixes: 71054c7db161 ("NFC: microread: Add i2c physical layer")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/nfc/microread/i2c.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/microread/i2c.c b/drivers/nfc/microread/i2c.c
index f45e883b8730..07da86db989f 100644
--- a/drivers/nfc/microread/i2c.c
+++ b/drivers/nfc/microread/i2c.c
@@ -244,7 +244,7 @@ static int microread_i2c_probe(struct i2c_client *client)
 	phy->i2c_dev = client;
 
 	r = request_threaded_irq(client->irq, NULL, microread_i2c_irq_thread_fn,
-				 IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+				 IRQF_TRIGGER_RISING | IRQF_ONESHOT | IRQF_NO_AUTOEN,
 				 MICROREAD_I2C_DRIVER_NAME, phy);
 	if (r) {
 		nfc_err(&client->dev, "Unable to register IRQ handler\n");
@@ -258,6 +258,8 @@ static int microread_i2c_probe(struct i2c_client *client)
 	if (r < 0)
 		goto err_irq;
 
+	enable_irq(client->irq);
+
 	return 0;
 
 err_irq:
@@ -270,9 +272,8 @@ static void microread_i2c_remove(struct i2c_client *client)
 {
 	struct microread_i2c_phy *phy = i2c_get_clientdata(client);
 
-	microread_remove(phy->hdev);
-
 	free_irq(client->irq, phy);
+	microread_remove(phy->hdev);
 }
 
 static const struct i2c_device_id microread_i2c_id[] = {
