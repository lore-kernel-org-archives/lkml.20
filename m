Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7644BF92A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789599763; cv=none; b=dynNWP9kv0wKjLJsuDQnU+EKI8S3e7Q37FAun3v54ztnupwagETu9V0Ae1yk61+KU4M5h0llHYVrZw4IR5+75xyPMXmfM0+8ejwCi6nRDLLaJSbV+Ev3klpJUoRXm2pw+J/wy5L497DybVxueZ/d6GnN71wOFKLFsfGo7gsnvKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789599763; c=relaxed/simple;
	bh=YCCfGwPfmCxWE+vcmUEZsFhPDZ76hppOIgoi+mVXp+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cwdi9spm4R54k3pVUp6TF31jnOvZhq5O9PDxLtM9nsxJ4goYM6LwxO7vp/JpAuohhnL63VYic/w9Xoc52xI2D01XkWP6IMYMYxw4GBuKJZTlDkdVmTSyxn8zM0k7pL+xq2Ss7Q4JYXOggrfuGFGy8p0N7Y2xyqIPIgQkPFVGqbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTMsdxpp; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTMsdxpp"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2dd68a16955so1731555ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789599752; x=1790204552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8fkxWCvKJczVMfesaEcNbK2P73mYdy8NStslyw9N+Ug=;
        b=KTMsdxpp50i/NXGjHRw/TCQ6v1jomXJ3YGaADy32UR87FEq1cHOH/5EQx/BYwMkNZh
         As7aaMZszqhw98IaddKtekTd9IseZH7PoOb9W3SC2O+UXQud9AgeGXnIDS+GU9dyDkcB
         PFCJHQ77v0bIQ37yGbTxe/uE9Ve5CEGELfNFQN5EwbIt1QxoKoy49bKioSO8O2zZtQxI
         90pR1Wa0/0FcixVMomGOIiKVY1xo6Z0jXrKSh3mycwSm3/oBigG/M+TAx2jGTSp0Eu3D
         wLh70tPUfIMR+/MV03gWkgwz06XGXBj9z2SaUe6Wc5TOKXE4Kf+ZWwv/oCNKMUXurvic
         zYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789599752; x=1790204552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8fkxWCvKJczVMfesaEcNbK2P73mYdy8NStslyw9N+Ug=;
        b=L5CiuBXY6CJuTVdebcUfeDBoMat+wSseZjDoGeGOz+3hjEaZoAZJ8l2xG6ArpJO53z
         q9P2+t+q7jL0Fg6hzaUBrgTW+s1AmgH58cJx04yMD4Qlfd3lOMa5wuCKWxQJQM6yW5N+
         lhhZrjm+85JbdPvwPzZtfWpZTSKLUu6pm3iJZ03Fu81zRESd+1NeV6KBbHD3ywiESZ3F
         gxnMLHMBg6nxEqdFrhXmEY2FHWe2OtDOCVcid1g4Yf4HneVZodXiNVbzMgMc43f0U6h/
         nGwGkAxGXzEYqBVw/HBjENrjfe6aBFcVCpJScC4ib/r+oNlLGqoUZ7s36Aa9nCoKV7gE
         WGzQ==
X-Forwarded-Encrypted: i=1; AKwUvBz71mwkjDJNqhOzxgjhwHr7vUDAFDCC/ZFaaf9aIQajK3dMtnnk7vTPHd62dKgFjtmZnpp8gZZRLHOjL8I=@vger.kernel.org
X-Gm-Message-State: AFuF++kX4MHwJiglWGvpuplKvPc46dn56z1Sw1grNUytWTCf/jVrUsez
	xGYpPsxZNjhFyEoqzpviWsufpaZcxaJko7E4epWKYDwExQBzzJJmHhAB
X-Gm-Gg: AYBFou0hYOIBbctf/HnP58rwZmnEyOqKqFZJHzAoSpr8EkToBFd0EvirYF1cJ4XnP1/
	bNDxZDWlbzxbXAu7/3+IEMDKZcM0p3OQ4R0U+LuV+lgQbUG9nzb/aH70PauAP3TgDruKWFjgiu+
	CKbc/E/g3G20/u1QlE1fAuil2JnLwJWpZ5QifSw7DHT2F8lqCI21ZgvA34mOGPGMKqF7TzyIjbo
	YcgESvFRD2BkvOdvtEpPi0wAjdp0XFv1pFZbgz+5xDVgsAxAuzeb1qKYCZh47CZM9eSbpLvTdtL
	xcIlDAmmG90uRxGpqIcUmUCx+mr3kV0CosV/6cKIVbD3Tsh0fQ7dVoH0YFakaDp9hrRlcUCCu9T
	BdGN3FxEF7W6A6hODGDA9Yll1l0+IhPyTsWtktYxUnx7rtpMGwORmuvJokUYCeK2IdWPMDzQ3fP
	k9SEBh1JR11gwXeo/akZw9bcVlZ+Fs8RIokRy/1IlJZN4HPvl2oh/KZBmuAXlGJZqO2N6a/quzt
	kA1W81OHOUqTBA5EVQwRpxSgxR5SFpkrkeJ+kHQslJPO6DD7h2zIfGgeJfhE8M1cI4xjhaDMKD9
	23Jr3dXOUolhzqTzuU7uTvI6bmQLEIj6ggaSi+kgfCzQvgTk
X-Received: by 2002:a17:903:b8f:b0:2d7:1f17:41f8 with SMTP id d9443c01a7336-2dd9ca0c91bmr19967065ad.15.1789599751704;
        Wed, 16 Sep 2026 16:02:31 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89ee19b9sm17289305ad.51.2026.09.16.16.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:02:30 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Harninder Rai <harninder.rai@freescale.com>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv6] dmaengine: fsl_raid: check fsl_re_chan_probe() return value
Date: Wed, 16 Sep 2026 16:02:28 -0700
Message-ID: <20260916230228.283615-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fsl_re_probe() ignores the return value of fsl_re_chan_probe() and
unconditionally increments total_chans. When a channel fails to probe
(for example, an IRQ mapping failure) its re_jrs[] slot is left NULL, yet
total_chans still advances, so fsl_re_remove_chan() later dereferences the
NULL pointer during device removal.

Check return value and only count successfully probed channels, and guard
fsl_re_remove() against NULL entries.

Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v6: increment ridx before continue;
 v5: put some stuff on one line for easier readability.
 v4: use break;
 v3: fix sashiko review
 v2: fix description
 drivers/dma/fsl_raid.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 9cc289f7129e..f059ff2e37f8 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -836,18 +836,30 @@ static int fsl_re_probe(struct platform_device *ofdev)
 		}
 		/* Find out the Job Rings present under each JQ */
 		for_each_child_of_node(np, child) {
-			rc = of_device_is_compatible(child,
-					     "fsl,raideng-v1.0-job-ring");
+			if (ridx >= FSL_RE_MAX_CHANS) {
+				dev_warn(dev, "too many job rings, max %d\n", FSL_RE_MAX_CHANS);
+				of_node_put(child);
+				break;
+			}
+
+			rc = of_device_is_compatible(child, "fsl,raideng-v1.0-job-ring");
+			if (!rc) {
+				ridx++;
+				continue;
+			}
+
+			rc = fsl_re_chan_probe(ofdev, child, ridx, off);
 			if (rc) {
-				fsl_re_chan_probe(ofdev, child, ridx++, off);
-				re_priv->total_chans++;
+				dev_err(dev, "job ring %d probe failed: %d\n", ridx, rc);
+				ridx++;
+				continue;
 			}
+			ridx++;
+			re_priv->total_chans++;
 		}
 	}
 
-	dma_async_device_register(dma_dev);
-
-	return 0;
+	return dma_async_device_register(dma_dev);
 }
 
 static void fsl_re_remove_chan(struct fsl_re_chan *chan)
@@ -872,7 +884,8 @@ static void fsl_re_remove(struct platform_device *ofdev)
 
 	/* Cleanup chan related memory areas */
 	for (i = 0; i < re_priv->total_chans; i++)
-		fsl_re_remove_chan(re_priv->re_jrs[i]);
+		if (re_priv->re_jrs[i])
+			fsl_re_remove_chan(re_priv->re_jrs[i]);
 
 	/* Unregister the driver */
 	dma_async_device_unregister(&re_priv->dma_dev);
-- 
2.55.0

