Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465824CE668
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789498879; cv=none; b=lkJdQemKf/h4oJW1ffe2jE6JUZ3JIeZ8xwlxZholiwHNIc7+4yrh3gA4myNmeIMb2gWSsCxL5Wg5E1/qF2LdyWpIx1RfEl0d8N0Qx2viERODRDevkpmxT7AJ9GVdh31NVd9VVocROxmFCsRSUjGTwCeQjD6oubPFKvJAWIFEbTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789498879; c=relaxed/simple;
	bh=l4t1jNOLy02YBOh7dmJnJlpg7s8WJAsAgZVpnp46ojU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ClVcYdynWAX0mh26n/yzQbuVqljMCobFXiL5G8fj1vocz7DQwk1supJIzJeQQYTE4jv/Gv3HfKoHJfbMVgzEGuhMIsFFvRl9Tu+uOEYjBfcd2Y75HnBP/+fLpn8oz1vejJJ/cKqzo0ND1bUKWtNelMg9NYtncIfI2iBHdODpUr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m35+zrJ6; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m35+zrJ6"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398beb616f5so31752a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789498849; x=1790103649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9ubRUCKOUA2J3XCgMm19BhpyuYjCphiG49HTeWE9Tk=;
        b=m35+zrJ6UMUTGSAaBA5BIUl2WiDBffuk8IhgAmy5jml98aYwSppkDdPdm6pKzGYXkU
         bxVwMffzx/pYksXKOvYPYVkJcJM5gNUVkBzKnSefXbJFdrregMxWhuai0hmAoNX+OMfd
         KigOLE8yFeVro07CbCay3rkaN3Z3SPgjKfX18IVgPo3Dki0Bvv668PrkZ7m3WQ4bnynM
         9rJ5X71YlwuKIIid/ejCaE77FNB0w3PMu5rZbufxdBbJONzQ+cXDDD9VHvtuHTTtRXMU
         ExKVxbxZNBSNdUcDlh0g7TebsVnSQmHwkIg0qxPM4yuSg5dLxqZx3tDvxJ9rkyWCfjwo
         bRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789498849; x=1790103649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9ubRUCKOUA2J3XCgMm19BhpyuYjCphiG49HTeWE9Tk=;
        b=2VH+OhfquLIOiX383B0Jh6MOmLXv3xlvERXQtwVV4dAz7OEvEFpHF7RS2qmLbX5mAi
         l00s/3j8foklH+a7X5yQD7ZwuRKR1yEJ8rg54H7f8WJkvmjnVk2BqwYj1w99C/4PKrGe
         R+LN4pzdvdlf471Pn+rg7SkSNSdIssA2RZ+IsviMMsnupNsc3o/yjPlYzBq24oYK+YY4
         Hbooxq71G5TOFFw6fMO6oj3Hz1b8M+RZgM1k+mqjpgMK1X1EkNpol6hVmZbVd6z19saB
         DRogVPTZoA3dJQKZ83giT9jwFRCqZHSO9LHCqXgP7W1gHltdYiG9MjklAv1rhrL6i8KD
         LKHg==
X-Forwarded-Encrypted: i=1; AKwUvByq5HiPIxPd2YKxE0zdRYH35jPXIHy5bjLwC3c2ciz+Mm09B5f74gts/IfrCvZl9Pv12GAVbVC40cAvDK4=@vger.kernel.org
X-Gm-Message-State: AFuF++l6UhJtg2FZzMjRh8VemRUxdhkJMpG3+9AH4V2OFh4j4/Q8NIlz
	jqZofN4JlfRVrNWflb+X8L6zTFzgiJktjnsvQJurF61AnM13hair3VaK
X-Gm-Gg: AYBFou33hq3LR8J0I90lMWl5HaCtDdnfmSxKP8zo07xsWpKQXEZg1dsnh1Lw2WnByYr
	4cAAylHfA/YR/VGmpvRrv0B01bG5Khx/B5cdb+rcWJ/1p8FnIbrRy/zFVYb3ZVC2RaN0K//EFoX
	z+62SLsTM8KcwijwWIXi5VuiNECBlQ6OCwnpfBs1TploAMezB3yUcm7ZiB1N1+aniFRFHRge4h5
	eCs/T6SKu0N8wlR1V8pzo7xDhjQVufWTa/I4aRzrCMvcT05QUfJMCKBF2sUPuqXhShqpYAi0g2l
	asbu0iqzR6IhaQo6+wzlNEmjXx7XcpPYES+bk4ETCXxrCtbaNMflWFDSSWiMDDAjXXyIuCmUuM+
	kL/WtOwpvcxjb9J0t3RjYpxc1f0an2vLI+sbr4oQWXG9kHSb+og+SPAqzvJNf22oK63UAtm1zNf
	KOk20DOlxK7SxodWE9pJuFd2JnEJQZZuZxgFj7ymxyOotPMUY3k4ScqRre4Zbwbi8Q07HpHH94S
	NlO+ZjrveQxhNLx1FiCT/ipXCKtRaVTkBfK/fwN6it6AH49AGZ8xqKbZ/qtKC4oWs2zaSYEJp+n
	DUUfK3U2H+N+D8NM4oMbI32WDOFqCazj2Oj9w8yPYNMx/EG3uozOlQ9+1Q8=
X-Received: by 2002:a17:90b:3842:b0:39e:b0d:d274 with SMTP id 98e67ed59e1d1-39e0b0dd4c1mr2936420a91.10.1789498849414;
        Tue, 15 Sep 2026 12:00:49 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7a3cc9sm201919a91.14.2026.09.15.12.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:00:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	Harninder Rai <harninder.rai@freescale.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv5] dmaengine: fsl_raid: check fsl_re_chan_probe() return value
Date: Tue, 15 Sep 2026 12:00:47 -0700
Message-ID: <20260915190047.86218-1-rosenp@gmail.com>
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
 v5: put some stuff on one line for easier readability.
 v4: use break;
 v3: fix sashiko review
 v2: fix description
 drivers/dma/fsl_raid.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 9cc289f7129e..b4355eb0098d 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -836,18 +836,27 @@ static int fsl_re_probe(struct platform_device *ofdev)
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
+			if (!rc)
+				continue;
+
+			rc = fsl_re_chan_probe(ofdev, child, ridx, off);
 			if (rc) {
-				fsl_re_chan_probe(ofdev, child, ridx++, off);
-				re_priv->total_chans++;
+				dev_err(dev, "job ring %d probe failed: %d\n", ridx, rc);
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
@@ -872,7 +881,8 @@ static void fsl_re_remove(struct platform_device *ofdev)
 
 	/* Cleanup chan related memory areas */
 	for (i = 0; i < re_priv->total_chans; i++)
-		fsl_re_remove_chan(re_priv->re_jrs[i]);
+		if (re_priv->re_jrs[i])
+			fsl_re_remove_chan(re_priv->re_jrs[i]);
 
 	/* Unregister the driver */
 	dma_async_device_unregister(&re_priv->dma_dev);
-- 
2.55.0

