Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22052E6CAB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789026531; cv=none; b=PIAvYdGmedJ54UHDSuIkNOzqR5iPGGvQYMLXNvbiwMF+75NhUjfm19a4uN3B5++oxCn+2hooWiRjSUfnBpJ81s0epV9Tfs89QEkuvYVwy+ncwPROGzC4T0dgz2EKSTX7GRKCy26XQ5wwyRjoPUxXuScHKoFTVk2B+z10zBSYOcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789026531; c=relaxed/simple;
	bh=PSTEuwtCiCiSnSbm+yg3ZdfXJqG+MiCG0/Lvut/G1Kw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hb5hFZAeTbUGV7tHxF/MYcBbmf3S8IRFfBqm4xXJ8PcelClnHlOlaBYnoD/55qO+DYL3TZQcnUgs2NSO5tWEoqTPrFUcNB9J19k8tgTuDTUKtknCEuf8jmY4mNKD+JCs6k25q+10EqPsQGMkuYO4sOUXJ6LwZNp5GTyawWPQprU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7Jzhy4o; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7Jzhy4o"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39d862a49e0so33922a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789026525; x=1789631325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FsQQCoSyhi6vG3YcxotU27DLsoE/sbIXJ2Cls4B3Hng=;
        b=i7Jzhy4ob24ZDU+WhSXRU/2D1VLunOWfZ6PDRFk2/2vYsQagtNvOwIaAPzjwMhEMHM
         VgcIJ8dZnl9kFumT1p2rRJilYOnlQneWcF0Mns8iAmtiUV7tLBsvAk04MnKYGDdsV7uZ
         SOiK4faguNEh/b6DC/AVBi5s/3JGa75KxIVwyarmxG1gIAEWzTh8hDQQez9M25FTYmgD
         ZLqd1LbN6Rwsvdb/aDTjP+rf4vztWscicinnaCe372XjS1YFBcOH7N/b4Hau72gyUSLK
         Qzb/c/cV2JF88qLjDNAUWxtsjqqf68QkJW6vi7iTzPGHSwyui3C76+xr12/tQ8kJjTJO
         SKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789026525; x=1789631325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FsQQCoSyhi6vG3YcxotU27DLsoE/sbIXJ2Cls4B3Hng=;
        b=DJWuWoqC9fWfTr9bUPks8ZGwTxw1WPCHpUdnnFylHt4owp5yNeSwRuvfwUCh+kLmpa
         9JsHj+V+8jDSVqrBc1xOc0448mjM72dKNwKet1RJ3x6C4aQ+A0dAtQXqlVvz3ChB0bYo
         YklC2irnN97WNxd/pNGqp/Sx8jhyqCmOhRyC9gKYq6ZbQYnx3AQtDeb+zLLwsI9ZRSlS
         W92u1n59wguIHO5gWXoimX2Rd3OJgN7EewVSGItTKLlxyCLrQ1fmCsHa9U9goduqJs3U
         M6zCfyOcaygKL0YPq4uV3F7obprn6+QBfdcPKGehi/PqNkQo825h+4SvFn+bnsd1wqDS
         M1EA==
X-Forwarded-Encrypted: i=1; AKwUvByuVnFVrvaWmkmt8KOWxDmXT3Pd0snq5+M6s9a/M6tqezHKfVN53yQSxrLQ8WMAVvn2GG72VZyPe0rqndg=@vger.kernel.org
X-Gm-Message-State: AFuF++mPfkvIaUM+CXb4zQv0PfH7O+u33UFRfe7HnRvHr5ldF3+nxK0c
	c8WbXKsSkH1O6Pf2DPhRjJDoXV5HFcflCY7ollhpILQbo/ZUVreJTuBw
X-Gm-Gg: AYBFou1XKrQ526KXp6zqDJV4zsMS0iGRU4/XfeQT9cfQhcLyXTDB5IUtCIfTSWvwPTD
	yM6stXSEzWXB4QW0vJP/XWBWbNX1Whp5pauHoHJO6i6bq/mE/9xw21e/sHD3G2M2UA9+yrkS1OB
	IZj9owZ+/9AmhmjPdB+jjA7txY5N6Fc1QtyElwklda6JgjVvslaALW3W1jC3IQdbZ1bFb8xTLVH
	Tl5xf3hMFNsSYFYzwaPgzhN+j9YBYMI9M/NEB/xi+Q3MlksXdGnI/r015MKU440g4AN7vSIAZQj
	6Zd+qoRvo0VV8EAEMLuTJPyWz5VxfRquIkFZ9Tjg7HDW2xkkAYoF++FYItAYIxT3NIKiTZGlRIc
	T3vBtymz/Fdy51SQePaI2x2Sf5kbfdWBg+XUuzgcA2H+8SDkBYRmpuMdA6jbly5KrGPSJFinkXp
	SF24DazJ940t49aJ1ZvGqb/wOjF99Mocf3oJfRtlyoknzutE3yqDNjZc/8QlUWVYqseBIerna0I
	GiTF8MYKmz68Uw=
X-Received: by 2002:a17:90b:498c:b0:398:a2e4:c784 with SMTP id 98e67ed59e1d1-39b3d5c4449mr29495454a91.1.1789026524832;
        Thu, 10 Sep 2026 00:48:44 -0700 (PDT)
Received: from b2b4.localdomain ([124.5.96.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d770bc9f5sm4314177a91.2.2026.09.10.00.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:48:44 -0700 (PDT)
From: SeungUk Nam <tmddnr49449@gmail.com>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Dave Jiang <dave.jiang@intel.com>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	SeungUk Nam <tmddnr49449@gmail.com>
Subject: [PATCH] dmaengine: idxd: Free the minor number when cdev setup fails
Date: Thu, 10 Sep 2026 16:48:32 +0900
Message-Id: <20260910074832.15729-1-tmddnr49449@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

idxd_wq_add_cdev() allocates a minor number from cdev_ctx->minor_ida for
the new struct idxd_cdev. When dev_set_name() or cdev_device_add()
fails, the error path calls put_device(), and the release callback
idxd_cdev_dev_release() only frees idxd_cdev, so the minor number is
never returned to the ida. Leaked numbers accumulate across bind/unbind
cycles, up to MINORMASK, for as long as the module stays loaded.

Free the minor number before put_device() drops the last reference on
that path.

Fixes: c311f5e92484 ("dmaengine: idxd: Fix freeing the allocated ida too late")
Signed-off-by: SeungUk Nam <tmddnr49449@gmail.com>
---

Found by code inspection; the error path was not exercised at runtime.

 drivers/dma/idxd/cdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/idxd/cdev.c b/drivers/dma/idxd/cdev.c
index 82b07cf942ef..f1af7f0d25d3 100644
--- a/drivers/dma/idxd/cdev.c
+++ b/drivers/dma/idxd/cdev.c
@@ -573,6 +573,7 @@ int idxd_wq_add_cdev(struct idxd_wq *wq)
 	return 0;
 
  err:
+	ida_free(&cdev_ctx->minor_ida, minor);
 	put_device(dev);
 	wq->idxd_cdev = NULL;
 	return rc;
-- 
2.34.1

