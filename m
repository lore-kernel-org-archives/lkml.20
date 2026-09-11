Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9AF35E1A4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789165155; cv=none; b=DusHddUy1qQYRA0TLOBTBdIPEIAZxzyfDcvSWFXqYHOCczCVsWZNlJ61rtIyYMa7mNHIMt+jbDLb/HnxrRg1qhatJ+VA9km7Uq8ZXWWH1vQyG0AMhdYZvlHCuP+wdeYkAJhVhS7exh4ijE/APLuhjuM+Qqx0Auk3sJb/0IYNf6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789165155; c=relaxed/simple;
	bh=/fcO5PvnBvL5ZUEF1lo1Qe5BDAxGE1RtLVLHr5iOP1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tXtD72baCgfe8JNZ/sKTq/Bw3Xl/41I5SPgU341FE4PDJfnc4/GiK96J+D/EHYhs2jrUJS4/6EaX+rfs6nWEFXQtWYNNUpC+IPl3zc8qHL/Abs1K0kONIYbqZH1JwfsiPZxFlb0qTIkMIF55LTF6jggikLPaLqAiL0htSLwrXj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxTcJyXx; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxTcJyXx"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b965f447cso507715e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789165148; x=1789769948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l6ZIiebb4ZMiW4arJXrmno4PJu47VBpVh+nHVQaLggA=;
        b=QxTcJyXxq3fjhOSqWCp4OE94grIcgYo7s94/1Tq9iq/GFu00Ei5ZudNaNmJ5TgL8KF
         Iymab2ywIGfXLDaD/oyNoLtKoPFPYCNREA2o3Gxknstq2aJylRGLxf+Ni4NIP7egCWcZ
         uVX66kqAl5MBVMweSbMtufLoJlZxmdy2/DQijJJGksZ8wehIXX54dZZS1oaAtyTATIII
         cSBq+YMccgU/sF4JXMFTOz+ODDFyiKceW3p9mOZIC7TD/u6Ry7znXeQq3urOD+EVIKAy
         x4PzBspE/AmHLp+KfMGN1pPaKUB1FJ4yTBaNNx6Crib+lyb1PuBwv3z6pwyPR/xnQrMt
         WsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789165148; x=1789769948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l6ZIiebb4ZMiW4arJXrmno4PJu47VBpVh+nHVQaLggA=;
        b=OVSkumY8YCiaYgpZUgPuCS52uNLmcPQ4xb8E7SBj/hzG8BvCwsnuCidfovUdtvL0rU
         tkZx6J0JfCQZ5UGLNhUJrxYFUS59gN70ZJVqpFWtBLY+g8DZUpOlt8pwHfsED1Gbi3PE
         BoIFxjFdQqqOr5CKc/0n6BGCy12I48YzXGrPg4wWDrclsU4JvkjvPrpMS6cAs5AWA7By
         EO3N4AljU8rzWdVZujDhJvRm/I2tyNqK4FpKeKsIianaPxkpJ2PFBQqDk4xFA5DwENwG
         6rk3QX7grBL61Q0K02OlQfOpLHvX7X5zBeu94mokJsNfHwV1W3lldzjTQavPxqahhhLM
         sPyw==
X-Forwarded-Encrypted: i=1; AKwUvBw4O2q+4Rp4w6CJ+j9PMhXuWrAm42ICVicUdil3+uWUh19H+oAPnjpXo/iyD6mnHE3naW4aL0Qybxu68Is=@vger.kernel.org
X-Gm-Message-State: AFuF++kpD/6847XYVGLGFfsGGQXa2Jyz5l/jvHkCctiCITHsudPqVJz/
	nNqqgujfs3WuMtoNdqjGOwN6hrO0spy7uobxx+66GWQ0J9CvmZVLN3f4
X-Gm-Gg: AYBFou0XMPEwDFG8Y7b+EfDHhtsZitSG3jDYOmP3cHs5CuGKzY4oUUksijmn9+fNkyW
	zHOE+RmrdIT2YzagE4wzYF5Gk531DoLtmUMLXAraWSHQ99X4KF+EOrI7iqPtIuLREtkKAzeJg1g
	8Rwphti4AolkKjBFMhurhcl7h7T/EVxJoyZJIMZ7okjPIdGOL07QYZF9EFjz3XXWljSF9B9n8Zz
	LA5xdFJNkQUklXau039hz0VYwix95auPkC0Ta5MnmVgb3WjTH0OU8avXIpxPkpJYAPCeNZZ3zFe
	vg2qagcGQOBHK7tuJpodneYP98wfOgh8f2+SNq/8f2rcMRg+0xy+nQmxdguCQABhv7R4FSKBA4/
	tHTcSF1CNbhvEwaldScg/OGHIBIEuM0YygTmihSe1C5qoTF3R5WPVwAmOEVLBic07sF5PrVZILe
	OWX5bgErxgzONwkuf1BmWjBwDAa27jAAOU3I+hcANxOLVP4q5ZY/qun4Pw7gH4UEYGdghP6Ahi4
	wO98Ql7EK9dhATpm5z+L0WKKogoQwu+46pDL11fYULw93DOu2OM7oAJcaLEc3ORefc3vIl+G6wF
	ZEo6nfRsw9/nSwyk6MlFQtTpfNYrFvzKK3ZR
X-Received: by 2002:a05:600c:358c:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-49e6caad0bcmr1654755e9.2.1789165147535;
        Fri, 11 Sep 2026 15:19:07 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f0403125sm6355193f8f.8.2026.09.11.15.19.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 15:19:06 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <djbw@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Ira Weiny <iweiny@kernel.org>,
	Li Ming <ming.li@zohomail.com>,
	Ben Widawsky <bwidawsk@kernel.org>,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] cxl/region: Fix the return value in devm_cxl_add_region() kernel-doc
Date: Sat, 12 Sep 2026 00:17:48 +0200
Message-Id: <20260911221748.7212-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_cxl_add_region() returns the new struct cxl_region, or an ERR_PTR()
on failure, but its kernel-doc says "0 if the region was added to the
@cxlrd, else returns negative error code", which was never true.
Describe the pointer.

Fixes: 779dd20cfb56 ("cxl/region: Add region creation support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/cxl/core/region.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
index 27e63e6dab7c82ccd6c34b7955f52789a32ce478..28a8e3d1e1231eef40bc30cdd937af980952232c 100644
--- a/drivers/cxl/core/region.c
+++ b/drivers/cxl/core/region.c
@@ -2727,7 +2727,7 @@ void kill_regions(struct cxl_root_decoder *cxlrd)
  * This is the second step of region initialization. Regions exist within an
  * address space which is mapped by a @cxlrd.
  *
- * Return: 0 if the region was added to the @cxlrd, else returns negative error
+ * Return: the new region if it was added to the @cxlrd, else an ERR_PTR() with the error
  * code. The region will be named "regionZ" where Z is the unique region number.
  */
 static struct cxl_region *devm_cxl_add_region(struct cxl_root_decoder *cxlrd,
