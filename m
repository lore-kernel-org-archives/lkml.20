Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D8D44A411
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791724826; cv=none; b=BEdO09SRihFD+kf4HlPImnZFU1aeb6hwK12+noIo8HywnrwYv/uor8sSChgU2+7LGXWI0N39wPJFUx5uRqRPqiOeR6GNnQwv6p0AZMvyHaTO7ftZDBYt+owScKV3XooxsSJF4A8m483lZK9g5lN6UVMiChA8O9ojWSBXXuReuWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791724826; c=relaxed/simple;
	bh=uXYPY6h1yD2YP8cgMDGftsU7ylCzXryuv3bVUW6VD3E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tn2sI69oxb0Lt/yXqNGqK4R4bU+djnwLe1zk+08h8liIsfbMFP7CUSU8Drk48Sp5ca8yw+9JJkPoaGroVAFFm1vtPsMTpqJCnFy2hI19XJRBHOjB5UH0pmPVjy2Hopwoc5/Jp4zuHCr+u2Ve+VcWrVXdveNJU7F6lz/5DlAcRME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfcuReCm; arc=none smtp.client-ip=74.125.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfcuReCm"
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-3599f43e0aeso225957eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791724823; x=1792329623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RC5wNxG5OvZ7QX4c7CG14p2PybaZXqw3gD9axjHB3VU=;
        b=TfcuReCmX56ub8M8kJYfuGYnjrNQckolaFjlkti41HYMWrpfm2isNlRR3WOtR2Fslz
         qKyAVNll1KDkriVLAqh2aTC4qK+Zo87xZJU1GrIhWqtqf6FBwdF+j5P0tgwJAln1mX81
         OfukIhp6lkPwzD6f6Nl/Omnit+BwxXiC5KKnM0jztkagS63kT1vnb+ABoJJwkQINHhtW
         iuKZBBPCdVoaOmw534VGPfFi3UBW2H6xjbielNfESIuc8gIazXFLXnD6WaTyTExpeklh
         M9XOJGnzSFxffNURDE6+EQ0qzSifPeztQg5sg45es6ExaKszO/8Q0ialzC2UOXNynldM
         +GJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791724823; x=1792329623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RC5wNxG5OvZ7QX4c7CG14p2PybaZXqw3gD9axjHB3VU=;
        b=x/ZZ3rQsmUlq/VsqpK6z0O130Ahl4Nz/xSGe/RC8RHWfZM6/mqfbBgCL7vHlIrHVD6
         DcM14ehO0gcbq94xjafIleYu8Acr9t9W3n5XdED/9spPRcemUujWHl1bBUguMwXsiWjF
         5Ll1p83APT7D2XzFE7aUq5r//AnED2xggJMuszKP9d04skM7kJZko/j9lNhG+6iD1Hrd
         JZarDnT8pyKoBi/+hD9PUNQS9UPQ9nZm1debxqnmGJXugEW6lI8M4sFMuL2z3lhQoidS
         S3T2n1gG1oWwETJBGo5ogeLK+VubVOGUoebiEowuQDL7ojC/c38m2JEVI/7qTrQFlrRd
         hVeA==
X-Gm-Message-State: AFq9FYImXAd/zBhxXB/cCYWCx4zEuDanpOea5dU1SEczoCHoUUr/dmNm
	/x6hrcPzzNlfHzKscT+X/E0GBQLd5ZvaiCiRfNY94ibfPSpWLva70Pb3HB4vXC7u/wAHjr3n
X-Gm-Gg: AYBFou1q6XnBMA9zrbFepCKKXGLb0m7q9AVwZD25K1Rgn9kdMnb2LCA/UV/R27vUfQA
	oA8WmMiHTfTHhDvzZSNBtGAID2yXRMaExo4beMp04MA6TVQLFOe1qExpdwaeFnqLGYzJ6aDwi6Q
	BO/Dh6R9uJ4nBjP6eML+G951KgXymdHBVSdQK+RfC4OKW2ivtA42+W+zShnoE/DZFtVWi7mDR/J
	cOJtAwkDv8xt1PbopL1hVL/Qc0cI9r+f1KC7+y1nl0R8+nw9Pc7Mi3q6m+5dG+FnFbDBFplyh6U
	rKTisIps/Y4TCOgQ1UdLF46vpo/qhPQMWdBmiz91CE7XoEQEIaDW6AzupAvufDSkfIwj/TSn9+E
	8jqpO37Y7a7kQ87/cHV4HHACVtkgvucwGd+KmzxOGAl0CB/8Upd+or6VdxYEeJlIcR+87FoFTjw
	9kAgWk2ND9D9Xet90RRTNAE47XrFO24aT+i/nYP5W6qXvCXx3jClVqTiBmcwlINKb+lSNL5uJu/
	8jOwaV/e/kfXplLRic96GikzCHJsr5wm6gDf615SObXQic6LPAdmLXnMLgfBHKOduj7+A==
X-Received: by 2002:a05:7022:1605:b0:151:94a6:6f5f with SMTP id a92af1059eb24-16a5fc917b4mr10950183c88.10.1791724823038;
        Sun, 11 Oct 2026 06:20:23 -0700 (PDT)
Received: from localhost (ec2-18-143-158-86.ap-southeast-1.compute.amazonaws.com. [18.143.158.86])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becb11sm20136059c88.4.2026.10.11.06.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:20:22 -0700 (PDT)
From: jianyungao89@gmail.com
To: linux-kernel@vger.kernel.org
Cc: Jianyun Gao <jianyungao89@gmail.com>,
	Dan Williams <djbw@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	nvdimm@lists.linux.dev (open list:DEVICE DIRECT ACCESS (DAX)),
	linux-cxl@vger.kernel.org (open list:DEVICE DIRECT ACCESS (DAX))
Subject: [PATCH] dax: fix dax_core_init error return code
Date: Sun, 11 Oct 2026 21:20:17 +0800
Message-Id: <20261011132017.31131-1-jianyungao89@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jianyun Gao <jianyungao89@gmail.com>

dax_core_init() mistakenly returns 0 on error paths. Change the
error return to use rc so the actual error code is propagated
to the caller.

Fixes: 9567da0b408a ("device-dax: Introduce bus + driver model")
Signed-off-by: Jianyun Gao <jianyungao89@gmail.com>
---
 drivers/dax/super.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dax/super.c b/drivers/dax/super.c
index 45f84b0eb909..0f35f65363ee 100644
--- a/drivers/dax/super.c
+++ b/drivers/dax/super.c
@@ -723,7 +723,7 @@ static int __init dax_core_init(void)
 
 	rc = dax_fs_init();
 	if (rc)
-		return rc;
+		goto err_fs;
 
 	rc = alloc_chrdev_region(&dax_devt, 0, MINORMASK+1, "dax");
 	if (rc)
@@ -738,7 +738,8 @@ static int __init dax_core_init(void)
 	unregister_chrdev_region(dax_devt, MINORMASK+1);
 err_chrdev:
 	dax_fs_exit();
-	return 0;
+err_fs:
+	return rc;
 }
 
 static void __exit dax_core_exit(void)
-- 
2.34.1

