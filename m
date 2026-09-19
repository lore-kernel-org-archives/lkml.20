Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0D519CCF5
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789778634; cv=none; b=ZvE3I1Vm+8kGgYGMj13b6soU8vuUPcLA6reweh2mTGGiqrVJL4IbblneCd+XdXgSSWkHXo4HISERIulsK5rRfgQJE1c33pmz+2aViKjl82a/kS9uQTwe+BZpn0f4m0YZD1WfsEJw1RystQLRPp8iN/gwufUzZXhXAEhrl491eeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789778634; c=relaxed/simple;
	bh=D+hAw/Uh09Q82SlEbERV57F3KoJyZOGCwE/LuwiDuzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V3Keilyqkwizu01ASkdRWp348mYHB6RD/YoMrCtOguZrsjs5R6jMmYWN43cKnCacxsUV1WqaXJN65/09iNXezu/CPaiSvavfto9PBmhvBVdviyZt1HubBexqBR7Z0veioQrF9PqutzupF5ErEnKmftc6akzy5ZXj5KcdD83k5R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzRbAPWe; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzRbAPWe"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398a147688bso1350510a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789778632; x=1790383432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mkPeQNnq/YaoNWX48WK/qwCx8TOwAW8sXHVfmaoWgp0=;
        b=mzRbAPWe+ZSQLAUmh0cWrz0+9enOzBEehuc/RJfMjUt3lfQ4hOnjR8FpGna87gcV6q
         /1fgd4i+0XTdja72cTgCj/lqHq1Y/VCWPc4gOecgaJhera/n/hfeR+EeLYACO6VDQs1h
         +NpJNGyijKWo94KzhvmfxXBKYr5pq3m6eB95pohdKAu90ER+w40V9SxqL6gDTqo+q2TH
         Hd0uL1C3qnuNrtme3/O4agMD5U2Gn5P9fWxe0pQJmyWXowOKQpLTrlNZbTvQUzx5I8qE
         lvhSNcTbW9vS9f9SBZBoFEdtOc+wZmB2ImooIY/BNZJEwNTb9ukowTDfbkKYxUPqExTh
         ACvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789778632; x=1790383432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mkPeQNnq/YaoNWX48WK/qwCx8TOwAW8sXHVfmaoWgp0=;
        b=W+GOmMQUxs5xxH1WMszZPFGkXcrqdwu6A13U5z7+dt8SdG3G3mznuwe/Xor9r+cSER
         UJEQBfD4PTOnLddLKLN9dT0uXyAlgTAUw/EGy61wOgcTR7GG6xIyzqhGaxo4gSpmSjzJ
         RiKBBCniJ9KaFzy/Pv3enhry0Qekl5ntNo3+64mpC2wP/rQwtUsGesT3Zc2MMV9YDlF5
         Fh5wUv107uO0mCKeoHEnOd9IpuvQD0bd5EaoXg8kyYCXhsJ/NGtjOWwWEvAmZvYRKGUq
         p0gGL05i0lMvjND+zO5iRQp4KCEEE5kCUIyS4mDUl/grEoaqqIrHliuBzDCcwj5fz9Pl
         pj/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzg/akeKmu26tLROJNUWYjvSh7RMUYgK/DqLmeENzN4fDxGzINI1TeJ4EXQx5y7uqHxXvRcGTxLmAto25I=@vger.kernel.org
X-Gm-Message-State: AFuF++lFdZX4OR6bzjmCNGQu22WLtaoWPoI/0ugpESqy5D/6YwZX53Tu
	Xwy1UwQ9SC9DXoDfbHTmpgJIg09FbMTxaDefMrLSLlIgUfxZhuZX2Q8G
X-Gm-Gg: AYBFou1klnaxw1Ko+PR//eIann/LYyULOFiHK9hzrpj1d6f0z1bIdo70exDgTMw+Ssa
	mfSRjFRgX9adQ7xK09D4wCouBKYFfCt1jsFSwr7KB5yBqeGH2GY5GZfxz4cByraD/ziUcZpxVox
	9LDl0CGy8yP3e16jyuiwIMWMVce5qVC2ftNS6GAL75+VIARIX73aKp7pkKya8geaXmCnaSUiwkf
	zi6vTfr7aBKyLX4O9WY7nqpNS5YVeUjDW+MJ1e9KM4dnR8A1eQv4YIKMWYgaRlT2syWcaZDICTl
	4G6TXhfP8JWWh5zXw4Q+trRqqZrGELiDlnpfjhUWnpiJEASDoZXnL3V7EbqpiHcfdzwNRxpNI1R
	mKf35V4YykvPlf39+E1vR9WpF29j9+dNz8Q+hK+s3890EFAHHHtcMPxLhn6tvTB9oGzUyn7PAjo
	0QLV7A0Xh93o5hExAG6Fs+l94m3buRp/MVYyjOc8YrDZmZ06jJa+YQ7qbpo640N12NYxeeRDlyo
	S0rrFEG0epK3NPEWy+uaLqTcWxmlbmRtpbyGJxiLSrN4GHIilXK3IXRSWwJs62b95+RlswJJV4t
	jHfolNF+50F/NcPwXSAJJTUoc8H6C9HUcac+B4KCGce0gZ24
X-Received: by 2002:a17:90b:57e8:b0:39e:6c69:9b8b with SMTP id 98e67ed59e1d1-39e6c69b27bmr1827870a91.48.1789778631767;
        Fri, 18 Sep 2026 17:43:51 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145e5sm1768797a91.5.2026.09.18.17.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 17:43:51 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Harninder Rai <harninder.rai@freescale.com>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv7] dmaengine: fsl_raid: check fsl_re_chan_probe() return value
Date: Fri, 18 Sep 2026 17:43:49 -0700
Message-ID: <20260919004349.736044-1-rosenp@gmail.com>
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

Check return value and guard fsl_re_remove() against NULL entries.

Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v7: handle differently based on sashiko review
 v6: increment ridx before continue;
 v5: put some stuff on one line for easier readability.
 v4: use break;
 v3: fix sashiko review
 v2: fix description
 drivers/dma/fsl_raid.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 9cc289f7129e..f269fe9df795 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -687,7 +687,6 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 		goto err_free;
 	}
 
-	re_priv->re_jrs[q] = chan;
 	chan->chan.device = dma_dev;
 	chan->chan.private = chan;
 	chan->dev = chandev;
@@ -741,6 +740,11 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	/* Enable RE/CHAN */
 	out_be32(&chan->jrregs->jr_command, FSL_RE_ENABLE);
 
+	/* Only record the channel once it is fully initialized, so the
+	 * cleanup paths never touch a partially-probed ring.
+	 */
+	re_priv->re_jrs[q] = chan;
+
 	return 0;
 
 err_free_1:
@@ -836,18 +840,24 @@ static int fsl_re_probe(struct platform_device *ofdev)
 		}
 		/* Find out the Job Rings present under each JQ */
 		for_each_child_of_node(np, child) {
-			rc = of_device_is_compatible(child,
-					     "fsl,raideng-v1.0-job-ring");
-			if (rc) {
-				fsl_re_chan_probe(ofdev, child, ridx++, off);
-				re_priv->total_chans++;
+			if (!of_device_is_compatible(child, "fsl,raideng-v1.0-job-ring"))
+				continue;
+
+			if (ridx >= FSL_RE_MAX_CHANS) {
+				dev_warn(dev, "too many job rings, max %d\n", FSL_RE_MAX_CHANS);
+				of_node_put(child);
+				break;
 			}
+
+			rc = fsl_re_chan_probe(ofdev, child, ridx, off);
+			if (rc)
+				dev_err(dev, "job ring %d probe failed: %d\n", ridx, rc);
+			re_priv->total_chans++;
+			ridx++;
 		}
 	}
 
-	dma_async_device_register(dma_dev);
-
-	return 0;
+	return dma_async_device_register(dma_dev);
 }
 
 static void fsl_re_remove_chan(struct fsl_re_chan *chan)
@@ -872,7 +882,8 @@ static void fsl_re_remove(struct platform_device *ofdev)
 
 	/* Cleanup chan related memory areas */
 	for (i = 0; i < re_priv->total_chans; i++)
-		fsl_re_remove_chan(re_priv->re_jrs[i]);
+		if (re_priv->re_jrs[i])
+			fsl_re_remove_chan(re_priv->re_jrs[i]);
 
 	/* Unregister the driver */
 	dma_async_device_unregister(&re_priv->dma_dev);
-- 
2.55.0

