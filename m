Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556013AEB27
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790049204; cv=none; b=UgSr9jFtfkQX6UiNbNF800Xbh7r5TQn1IWlkz4HhsOl5bEWbiLwf10K0N82zAvk4sAP5uDrmOxbt6ava6l3umou1tUssp1MHihb2hOwnvZ3LnRw7wHC+zDmDDwB83eesNnhqhvcfZHpk1TOEBmvoNNrS3v/Pl+15/xmoqHz3LH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790049204; c=relaxed/simple;
	bh=oaig7IIc0/9Gc/HoBtE26gxovH3dKDsT0hiocoSqP1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r1pca8bxUyi+wuJRWJ3q0OBnalVVi1moQgY6mWssvEbjrO3hiTxq8TmGRk40BG8dCQKafV5MyOh3crUcm06EgAIQYeo6itZP8Xb3158ZM3P/SaprbqB5lt7JlxOn7BtJrx51+nVROonqkeiauoQBK9QYiOBkk0NcfcazYZymPAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYNQph9P; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYNQph9P"
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c67e4fff62so1376664e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790049200; x=1790654000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Gh5tKcxiQTs/oI+I7DVxOINXtqMjEU216h7NUGcuQ8=;
        b=iYNQph9Pb+TjdSc/TVlixrbGxjRIrzqkT/B+ptkoqpZiNSy2siPWHwDDVw8DgTa5DO
         qdW5Xiauhgp+3m9rLeb8cXK32v2NQi1JD4EXMpOkOzh09fOtLMcxJZSScqvEwJ3/bLlB
         RgJBKXxMinPgWA0kOblezE5CkBBtfmmm3MmnhR8qlj85s3l5DErHa4RoD6RMSEpHXbnb
         w/hy0T3I+rvVdOTMzhojX62w+9IPPz6/TaIy7MPUrJbhrBxb692ta2BKIYLPifOL110C
         HO48NU3IfZ+7sZRhchg+Ht1dH3ZVONgyl34iptJfXIOKMsC2624vdTMks7a4bOuyDciy
         Cs1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790049200; x=1790654000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Gh5tKcxiQTs/oI+I7DVxOINXtqMjEU216h7NUGcuQ8=;
        b=rC8irX7Az6OIW7cOpUTM9s1Zec2eia5FVWUz3FuqAP7uIvX2Ub32r6d0dfg/NFHBVC
         s6Ckwx/i4bqy1E7pUgpeOF7LaaqGEf2OkhH5874pW3+yTgcHkZnPhTjtxSlA8SH0rE2m
         d6Fpvtx/4VaDsPyOEUlW6D52Q2188e2lG3Ef99t71mPNK7vOmYdP96h9X9+Gh1kqKT7G
         ojlGw6V3FSeTAt/+uTz7Jj1mhvQ6IdRIUNak1+w3iL8pIuB46JocwAwjNBk+F8ZdgKcQ
         YchOM9cwl6hno2H/2H/Opy6D4VEAwhw1NMqPYcLPZdDN6pbPuh9DsSbuQcW7Y4xsi6yI
         5MQw==
X-Forwarded-Encrypted: i=1; AKwUvBwdxDj+zyiV32fEGs0sCARaOJzOYRD83Qg9ChLK8oajdOA9a+yZSywXHfegQcUPyPShhxggruavQrMpgSE=@vger.kernel.org
X-Gm-Message-State: AFuF++l/Eo8f+qTwZ/lJHE2drndo47XmbPGyUPXIbii3w1N0mD/W3eVC
	m9yv6aIuLlSnC7KuijJRwIc4J/7FbC5rlUgadpnzJ01l706JdzR7ODcI
X-Gm-Gg: AYBFou2S+1lPKsWlKsWxj41ZjoF97xkdOOKYMNmdprVHf24NcarWnYKIHxB3X/4dbwI
	c/o0i/GkPp3KB1Wj0UaL6GvHJyfUj78dIWPhA0lQaAeuX74P8CM1Md4jqPkWgu7GiTI1yyybO/1
	CR5nDjn10PFB0KYK793iVm5WABsQF1ESwyr7IK7tc1CaIGXNMrEnHXZ+E6YOjSrAeYQ/A8AsLJt
	2/scrkmfwpWdxOd/IKmh+N/DW4G8ZcSg5fBQFJ1TqSwQaul662Hoep4CocfOzf68mz1417o8bUE
	xZzy8kuXFiJ4p83CYNuYO9sqHtxBnq3VIQsj5vI1NRW6Dypu5L7NE8oFjmLsHAVwytdSW0m+RwJ
	0a/PtqiLgUMzf/2AF7ueGMXfiZQpvLNO5PXTZLfSMcvpKWSx9sYUpHal1aWYnA9Od7URwkj/GBP
	LNuhOZnJddISR8B3/GWAp03KFu+Bo3ugRoSOQsqO8loxXWO1EPF7AH6wlDenjaaw8uyh/63xINS
	D1iTX4XZ90O9cR/cJjtPIgVCUr26g2MkxxRIm4zEwR14Xt9/wH38pRdNbgeOq+iphoBQ/oY8D+/
	Q9KKZDogViokJlO3i2jgCCXjOtjnxITKl6QH56PEGLi7unE=
X-Received: by 2002:a05:6122:e261:b0:5c9:c60e:f4b7 with SMTP id 71dfb90a1353d-5c9c60ef783mr5263547e0c.21.1790049200145;
        Mon, 21 Sep 2026 20:53:20 -0700 (PDT)
Received: from ututo.. ([2803:9810:87dd:de10:9e9d:ca05:6a44:76ed])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9e7ce53dbsm525835e0c.7.2026.09.21.20.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:53:19 -0700 (PDT)
From: Lucas Costa <2000.costalucas@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lucas Costa <2000.costalucas@gmail.com>
Subject: [PATCH] staging: sm750fb: free cmap on framebuffer release
Date: Tue, 22 Sep 2026 00:53:02 -0300
Message-ID: <20260922035302.167378-1-2000.costalucas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver never calls fb_dealloc_cmap() after it has been allocated,
so when the buffer is torn down we leak.

This happens on every unbind, and when an error is detected in
sm750fb_framebuffer_alloc().

fb_dealloc_cmap() gets called before framebuffer_release() in both places.

Fixes: 81dee67e215b ("staging: sm750fb: add sm750 to staging")

Signed-off-by: Lucas Costa <2000.costalucas@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 8b93bfeb217b..92412534239c 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -910,6 +910,7 @@ static void sm750fb_framebuffer_release(struct sm750_dev *sm750_dev)
 	while (sm750_dev->fb_count) {
 		fb_info = sm750_dev->fbinfo[sm750_dev->fb_count - 1];
 		unregister_framebuffer(fb_info);
+		fb_dealloc_cmap(&fb_info->cmap);
 		framebuffer_release(fb_info);
 		sm750_dev->fb_count--;
 	}
@@ -943,6 +944,7 @@ static int sm750fb_framebuffer_alloc(struct sm750_dev *sm750_dev, int fbidx)
 	return 0;
 
 release_fb:
+	fb_dealloc_cmap(&fb_info->cmap);
 	framebuffer_release(fb_info);
 	return err;
 }
-- 
2.43.0

