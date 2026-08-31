Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2F2387569
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788144937; cv=none; b=hDxXE7hQwxPOIvWlvt7B4Q+37AiHcsNsr01vmRw2zJzeXQh1hi2CCdXzUVQ7w+Y/9FbbYhca04OBkeu5wE6wzybgsGByaRPEIaetCP7NnorA5zA76SEzmF1IV3cW6yNFDY8FgGec0GPJl7EajTykeC9h+xRj1Hf/a+VL49wewA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788144937; c=relaxed/simple;
	bh=fsenzCGeQxhdLzVLSUeBtSEHSBKRu1nlgBAawWFg7u8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L8Ak+ktryGx4FAghHslp9TciH794gRei0xQIk/ClKRTbFWWWDUxk8DjrnuRd693/jDiOZxuqvmmgEmfcugFgGpDzsrbPxIRedaflJ3pgceK0V46LxhG+1miNK6l6AteRdDrLuLkv7fv7fpdjjNcDHA8WLG6w/RPPdmsWd7+Nf6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZluB3FYq; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZluB3FYq"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so3134118a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 19:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788144932; x=1788749732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=46LUM18tPrzkL84ohB1luZ0Ql7DRRpzHdIhMb60LycI=;
        b=ZluB3FYqUQPN4WBI3ixv2y6di9x4P9MW4UF0ogsB5WKpHQaPwUG7vb/bBGfozorOE0
         swo9GRmOT/NQAROo9prTPAPpLiQ7WCbAfEsai7f9iP7e6v+K1wNX9GWa4jDFjoYNOrjF
         saSNZPeVvdtM21On9fXrt8sI3TrTEMcwX+gc4izehL9yEfeo86ic+Rc6ElMY9RxiYkSz
         4idJywgaWVCAZ7JlUBPQzXRLZ8Mx+cydtH1rP/kVrrjtnj0j9c1B/5XEd3aD823sCby7
         fi/H/gGQ4K57cJc1V5h8A4gjjTbxxQ+9CaEi9p6UaN6dtBE40bgYw/T8cU/b3Bc0En7a
         Ig+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788144932; x=1788749732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=46LUM18tPrzkL84ohB1luZ0Ql7DRRpzHdIhMb60LycI=;
        b=WoCb1lWdkuJu+2GVMNwu7/FeKUDLmm7e7fgAT8hXU1gI9HzRajdIgll15yYjjZhbkt
         a2kaSoVB56CltftYtkksHEQH62JM80U9S5H3tSaPJ/TjIZCbJOWeK4RSYUx9/L9zDve6
         xv/P8DqS7oc6ABkOBgqkb4QKp7yccUyk00mburwnsdJXPWY9IHuX2SrnMhrKB7iN3rkE
         Pdil3V4macNL9ZGa6oNwmhrYOTb6DJid6pfO43DK8VcyYFWf2lQGTz3TB3eRTlir49nD
         JrTNZfBihelDX44XhxfbOwmwSCkCCm7r6Cb8lSBGXU2MFxut+gaDvWxC8/ht49Z8wq/H
         ReZg==
X-Forwarded-Encrypted: i=1; AKwUvBwRvNyTujOr6Qp7oR5MLJk+qDMlP4+dYRc3h9MHoxiiFkdBtXSI+5x+y9WxPuK5OhXSX0WJePH6wskSow0=@vger.kernel.org
X-Gm-Message-State: AFuF++nLwDLXq4Gk2ZDmjU1DQi3ANoLvadLCwjEQICpq2ds18C43yKGs
	DxaMc5fJNag/LWP4QHIvhqscA96i5RV7aPl9Pw4rUoknb0Gnt7ZHSdz2
X-Gm-Gg: AYBFou3lCblAv0siVlu269yWRA31t97908HRH22q98Gtzp5Vt1zEK7BPF02NDaT74b8
	tRTTze71DVkkUs1Uote0X210nnVWbYkzs0ZMMLYRQikNSJIwvScCoJ7JIsKmZgQnT3LeBfR/Nw2
	jqWgWmQcXSAxKA48A4ITcvhFurpb0DCdvU2glrvjl60UemPoL89sSyvQEAbY29ZS+LXER0oNJFS
	4wMugHGkzcx6PcV9gDtsTYHkxwTgmoXHXuUWMol852nMC5zKL5ZM+RbOA0mf+X2Pw1YeWuVlZpF
	903dO0RG2WtkR86ixhY9J+AINQeD22RgkVh4zC8C2ZNR8VVgiao6kVN94IxTMgEJnbO/7zZL+en
	8761xzZTYEf8GuPGWWAwdxH5o31QvdyyZQJNO789f52ven1aY9tLyA9Rfo9I2CaRzirTqPiDYsj
	WrtDnbreILsAxkAcU5fRmQURo7ZNnTj9OpPEVFKRlK7PnzgdaGJA7BAyHvhZMRzkCBzzXNUg==
X-Received: by 2002:a17:90b:4fc7:b0:395:8124:ac53 with SMTP id 98e67ed59e1d1-398da618732mr4487959a91.6.1788144932288;
        Sun, 30 Aug 2026 19:55:32 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7aaaasm13890514a91.6.2026.08.30.19.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 19:55:31 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/3] phy: core: Add common helper for get phy phandle by index
Date: Mon, 31 Aug 2026 10:55:04 +0800
Message-ID: <20260831025506.95548-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831025506.95548-1-inochiama@gmail.com>
References: <20260831025319.94886-1-inochiama@gmail.com>
 <20260831025506.95548-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several phy helper use index to get phy phandle of a device node,
add a common function for the future reuse.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/phy/phy-core.c | 47 +++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 451f8f0644c1..2259f0dff082 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -681,6 +681,32 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
 	return phy;
 }
 
+/**
+ * of_phy_get_by_index() - lookup and obtain a reference to a phy using a
+ * device_node by index.
+ * @np: device_node for which to get the phy
+ * @index: index of the phy from device's point of view
+ *
+ * Returns the phy driver, after getting a refcount to it; or
+ * -ENODEV if there is no such phy. The caller is responsible for
+ * calling of_phy_put() to release that count.
+ */
+static struct phy *of_phy_get_by_index(struct device_node *np, int index)
+{
+	struct phy *phy;
+
+	phy = _of_phy_get(np, index);
+	if (IS_ERR(phy))
+		return phy;
+
+	if (!try_module_get(phy->ops->owner))
+		return ERR_PTR(-EPROBE_DEFER);
+
+	get_device(&phy->dev);
+
+	return phy;
+}
+
 /**
  * of_phy_get() - lookup and obtain a reference to a phy using a device_node.
  * @np: device_node for which to get the phy
@@ -692,22 +718,12 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
  */
 struct phy *of_phy_get(struct device_node *np, const char *con_id)
 {
-	struct phy *phy = NULL;
 	int index = 0;
 
 	if (con_id)
 		index = of_property_match_string(np, "phy-names", con_id);
 
-	phy = _of_phy_get(np, index);
-	if (IS_ERR(phy))
-		return phy;
-
-	if (!try_module_get(phy->ops->owner))
-		return ERR_PTR(-EPROBE_DEFER);
-
-	get_device(&phy->dev);
-
-	return phy;
+	return of_phy_get_by_index(np, index);
 }
 EXPORT_SYMBOL_GPL(of_phy_get);
 
@@ -972,19 +988,12 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
-	phy = _of_phy_get(np, index);
+	phy = of_phy_get_by_index(np, index);
 	if (IS_ERR(phy)) {
 		devres_free(ptr);
 		return phy;
 	}
 
-	if (!try_module_get(phy->ops->owner)) {
-		devres_free(ptr);
-		return ERR_PTR(-EPROBE_DEFER);
-	}
-
-	get_device(&phy->dev);
-
 	*ptr = phy;
 	devres_add(dev, ptr);
 
-- 
2.55.0

