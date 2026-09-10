Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C13B495039
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789070801; cv=none; b=Y8GkcTeIgUv7ga4vWcfolcw39ZjWhgdN54bDTSdirGHQefFQAucovef/FABx4g8qF4bAswWz8V/MD778wteOK1BqaGD4vP3FoffGC/8nAN4sOfIbmaURwPYVfUm5eTu6zzI38H6SUKv3/smGYUrKjKBReksnGCSGelYGkmKZhw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789070801; c=relaxed/simple;
	bh=bIekzr/acASAo8pLqBfoGXi82QPpe9AW/HLpSxdjKu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WgwBjZGTkxLgU8pyfQCOf+4p4MUXGZrXwZVIGKssQIGqECH15cEMkRidMS3bJhk41WbWAvPOrnWtZLKtWT2atBHC9RE5zmdUz7JX5u4pPuAWoxWsSJfKBFlZYuNFJEZnoivLcrWKZdlVcHFWvRh2Ums5qmzDsvviEbNekcx9SmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbDeXDsX; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbDeXDsX"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc02279so140537a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789070800; x=1789675600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pw223cD4yf9W0em0F6VzM2Cty/ImT+5nXI2srqsFOi0=;
        b=jbDeXDsXw+Uec4UjxAbQuevSOKPNPz4x7bO5lVnNfsIGFwY3YxcfgSjwVMp5AnJbkI
         NBJONACzfzHiwJvhBFU+Jyl1icap1sUMdk/cbMu6mx5MCEWMT904IYIP3O3IPaHrUo7e
         feEjQfrTx4bCYc0IvoLiylNYl5BiOU29VPt+LFlXTTz4r9BO3o5FjS9k3XkbVLkoGCSV
         kLCM9QD6dPn45UsC+uEHaW/xyKCsZhVN4kw5eT+DbEyuCJ72JEPTDbWgpv25gMWBEMJk
         7zHjKIMudYcHbBUcjzz0+io9kc/S+G5tA6kZeZj4sjSybDqbEXOxXrVd4FXNWJdXie0F
         ejmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789070800; x=1789675600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pw223cD4yf9W0em0F6VzM2Cty/ImT+5nXI2srqsFOi0=;
        b=ibK0VY/cS502k8pkNNjj56uoV+iEbTzhjiYKwXsIQWsK/omzYE4MPQaWPs+y9NtV6u
         BWsIAl02LyUU0/UWUv0l+/PfECO0ZvVnu1jaEy9CnNzD4cfMQ3+Fboa87vITtiAs2yIj
         VWk5jzpVgIbOTifDc5rnKEV62DM+cU9ujXPnSLu0ES9lY4IGyhA01gAgBOlgNyH8i861
         SN9jiBG4214SEUX4UGB4Kd1rIw+4Suk65yA+dj9ZOcfKNGTWMhNSVcRNdOj6iBlpI2c8
         gTijhSBc1MBhLnz05qlwpmjoOh9fv5dXWKz5Gha4kaP/wHdklSHdqXEvcl+f/gq37w0O
         7/Mg==
X-Forwarded-Encrypted: i=1; AKwUvBwBVsMuSrecnJIfqf09eSj+mv2JvhGc6V1UWExsuz/HGnLXaObPZinU8qjtNBqpQ1wfuoQGW9oWP5EAsEY=@vger.kernel.org
X-Gm-Message-State: AFuF++kFxDVVhOEy9MFd1lkdiLeDqrU65crlf+BD5DnM22oMDb4No6iV
	aiRltYi+Sra6+p1ACdbo4kghQBWjjENJHcg3i63A2D0vlB86aSP4jgSG
X-Gm-Gg: AYBFou2Vj7PGQPifkLcSFGO72qBNRVRyBMszhyIILQgHG7Rtjmib3TrXOTnpfhWEuhm
	tJgpnGXNAgOWmuQW3Ti2rjDCuqU8KUtIfxLl5WamjVKS4HLpC1E/fZeSGYVHswqsUAfcA66T/lm
	ma4qB40bgvbzyVw6sE/h2VUNnjbvGcc1n7i71R2tO31K5vvXWtpL+ESwEy96MNLb2UsaCgwoXPv
	USnj6ClOZnRPioHlTsu8pH59HSkY7FiyX4PQuS4o+kE/Dw+rKWVPl9Sm3IZDOuepA8vOzp0GDwb
	SoqiKM7OBe0M2Dww7aPsZnT87eMEwcMtEDvXlpDTVI03jz/gfftH0wm7RgZO7CHcAgYirPdzzFQ
	sY7EM2AVq8B0SQKjSEknSUhRrOvxqsk62oFR2LL5U+5sHPrtst6uquoxXLdjLTxEdBADzKJwuNB
	/hmeHO0NkZn+bdJCsWz1T7T23K0Jl3a/TvXmeKFWw8j3T5l0udssiTuYMByWLImF6Lulu23/Tbl
	5FK7gAuRUFOiNOH9aDDsRVIHlCJwRMLmWDlJJABtxy2aZnqeJSOb1qEd5/PhOCzD6GbWzWTagHM
	DB2iVkd1+HUzVLKsDEV43oVO+KPdC24XiExC7iAmtd29gPH23w==
X-Received: by 2002:a17:90b:3dcd:b0:399:ea1:5a82 with SMTP id 98e67ed59e1d1-39d9bc66ab9mr689655a91.3.1789070799543;
        Thu, 10 Sep 2026 13:06:39 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994cc978sm690227a91.9.2026.09.10.13.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:06:39 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	Harninder Rai <harninder.rai@freescale.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv4] dmaengine: fsl_raid: check fsl_re_chan_probe() return value
Date: Thu, 10 Sep 2026 13:06:37 -0700
Message-ID: <20260910200637.41512-1-rosenp@gmail.com>
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
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v4: use break;
 v3: fix sashiko review
 v2: fix description
 drivers/dma/fsl_raid.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 9cc289f7129e..6167fa652e96 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -836,18 +836,32 @@ static int fsl_re_probe(struct platform_device *ofdev)
 		}
 		/* Find out the Job Rings present under each JQ */
 		for_each_child_of_node(np, child) {
+			if (ridx >= FSL_RE_MAX_CHANS) {
+				dev_warn(dev,
+					"too many job rings, max %d\n",
+					FSL_RE_MAX_CHANS);
+				of_node_put(child);
+				break;
+			}
+
 			rc = of_device_is_compatible(child,
 					     "fsl,raideng-v1.0-job-ring");
+			if (!rc)
+				continue;
+
+			rc = fsl_re_chan_probe(ofdev, child, ridx, off);
 			if (rc) {
-				fsl_re_chan_probe(ofdev, child, ridx++, off);
-				re_priv->total_chans++;
+				dev_err(dev,
+					"job ring %d probe failed: %d\n",
+					ridx, rc);
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
@@ -872,7 +886,8 @@ static void fsl_re_remove(struct platform_device *ofdev)
 
 	/* Cleanup chan related memory areas */
 	for (i = 0; i < re_priv->total_chans; i++)
-		fsl_re_remove_chan(re_priv->re_jrs[i]);
+		if (re_priv->re_jrs[i])
+			fsl_re_remove_chan(re_priv->re_jrs[i]);
 
 	/* Unregister the driver */
 	dma_async_device_unregister(&re_priv->dma_dev);
-- 
2.55.0

