Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A2A3815D9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130849; cv=none; b=kfnrY432ytkLbu6fEVDBm3abTzV12DuOZdnt9nqj+di/B+xd994IMHBuhrKzqPugoSPtHGZMYDynOBEmX1UvjHj0qD9SINP3Fpw6yYhsMhax5rhFCEs/pJFvlFOcZ8P9PRpbK459/Wu37+hHWyqzWljNnqoNX5kHuAmv+w6isBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130849; c=relaxed/simple;
	bh=/5Y2a7OHDrZ6jahngk9hKXSydFbk7n3qDMauoI5sWJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=obQ3aK0+f5GR0Jpr26lcfy1OFEyH1MQkv8pXupV7Eiy0fRI0h97yUkFYQahChceCcqWPOnGBC7pKiuvT/UUWA9mnjUfDq6dLIudo0d+zhDt+avXo3f8IaIJXAQEGRCV2KLVxQVREATknhCB1nOTzJwKu0g1YZWsSncr+bPNzsfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NNSUqtry; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NNSUqtry"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-398cb5615deso368312a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790130847; x=1790735647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OPE7PSkJ4NrPw8zuJEf70/v8WMud7mVFynWgRXYCG4A=;
        b=NNSUqtry4UjppRpEcwQNyJcu9BJpCH7o73Mms3GzsFbCdVlWMwX66mfzX2zeoLW1Dc
         nF9+0boWG9NnR6jyejGBmQmS6pbwZAyXgRLEc+E5tRWEi++2PfMfvcW5Q9D84crtf/0p
         4Sz5/unm3MXgM7ovaqqFLdpOvNnoBgAcJ2iDxQCk3sflaUkFKB0uuKsWcFTGzxjWk0KX
         elADIaly82fm4LXrHppfXPqny8XO5B1Hy9F2jq9cN/WuWqZGz/nCoEXm7VG9TEDZZZxA
         OydBwarDYSXqYiJFkz6ECGduYvLmADOWbhf6XyX+FHkv1nj5xBmjDm8jrppQyjd4wl2z
         GEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790130847; x=1790735647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OPE7PSkJ4NrPw8zuJEf70/v8WMud7mVFynWgRXYCG4A=;
        b=EE4LEmJSMb0kb6tW4YPt1vWdZCIozIGS9SR9Mbwek1h6YSP7ozmaYxUjAT4myA/bsH
         MJH6tYfLGwCum5ihtGb4Zr7J8mg13AaTzrSnd4blHnEsXlsrCXGSCbFiIHEyo+IHTSq0
         vVxYL6SqkvwK0VqGCvexEw71kocbupd3X0huUe+VzeA4mET1qU28D0+VQVfwrWtjT2ZF
         +w7H4qCnt2fXDNolnrBU9T23g7rPv6QHPK53T7VdtKxFW1ypXX8W5lGxEin5NAk3jgrD
         zrgD15XG9eg5WZS2mgfro3DFh1cEUd0ipdobCq8/s+jFOHJKQLVbX7cbcyFVmdAvGnmZ
         jwuw==
X-Forwarded-Encrypted: i=1; AKwUvBxKX/dSUaECJhHHrzgis6PmmCu2DJ16nyvdzqc36fRlggWvI6w7TYQ8tEH1CXEIiuSOjnLEUW0s5HynhKE=@vger.kernel.org
X-Gm-Message-State: AFuF++lXpisfeQggtgjtAiip6J29zpuHTyvS2BxTKMIjtSiEPJYUGBfG
	CKX8h/nQX+efBNmd8M5KbD/rIgLQHLNsvnBo9K6aluTQPj8KA40e5yAd
X-Gm-Gg: AYBFou1Hu8IrI2mreVczMIMT5JNsyfstxZq4huizcw2gb2ljpf305uO+P89JCCAgNYr
	ofh5pV/WlDRiM8Ko5WFrDNOd1EH/BN7R82EnuctACCCpUYyApBJDAPTaQMU0plfugQ3R6HRzVCo
	A6f41boFfrQHBYaK6j5kB4V51KgKOLCIW+fIYbAu9PkSveCeEhLjL/UgVWM7jeSyyyR544OGjTq
	WqESFwb0e+qla9PJA+bE3Cv1wSIXhmNb5+xbebl7iWE3FsLCofXScCZpJznHk4THdblUKqOxt+o
	oZkCY5jgrJhamI3bWzWuq+xXdlHe/+j+GsQUXjy4Phm9ROWz14RlMgnnO3T6KP2StNVJGb3ZUME
	0iAjjG1Yvk2GT8Cc4eouRs2zRRX/PJJ6mvjoJAXYxEPPVfR869dSrff6CQSPX/6Ymz/1d/05FgI
	CMJmE93Vgyj+ukWRgI6PWkSwSd+IHTszKGZK57RHXaCEB8DJ8n+g0WgM05orlIrW/KZ0tDc/Dt/
	DyKODc=
X-Received: by 2002:a17:90b:2d4c:b0:39e:6d82:dca with SMTP id 98e67ed59e1d1-3a07e56dc06mr1100081a91.30.1790130846753;
        Tue, 22 Sep 2026 19:34:06 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddae723sm2076574a91.5.2026.09.22.19.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:34:06 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rhys Tumelty <rhys@tumelty.co.uk>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 2/5] phy: core: Add common helper for get phy phandle by index
Date: Wed, 23 Sep 2026 10:33:00 +0800
Message-ID: <20260923023304.78428-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923023304.78428-1-inochiama@gmail.com>
References: <20260923023304.78428-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two phy helpers use index to get phy phandle of a device node,
add a common function for the future reuse.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/phy/phy-core.c | 51 +++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 7be649f14797..8fbaea003b90 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -682,33 +682,49 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
 	return phy;
 }
 
+/**
+ * of_phy_get_by_index() - lookup and obtain a reference to a phy using a
+ * device_node by index.
+ * @np: device_node for which to get the phy
+ * @index: index of the phy from device's point of view
+ *
+ * Returns: the phy device, after getting a refcount to it; or
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
  * @con_id: name of the phy from device's point of view
  *
- * Returns the phy driver, after getting a refcount to it; or
+ * Returns: the phy device, after getting a refcount to it; or
  * -ENODEV if there is no such phy. The caller is responsible for
  * calling of_phy_put() to release that count.
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
 
@@ -958,7 +974,7 @@ EXPORT_SYMBOL_GPL(devm_of_phy_optional_get);
  * @np: node containing the phy
  * @index: index of the phy
  *
- * Gets the phy using _of_phy_get(), then gets a refcount to it,
+ * Gets the phy using of_phy_get_by_index(), then gets a refcount to it,
  * and associates a device with it using devres. On driver detach,
  * release function is invoked on the devres data,
  * then, devres data is freed.
@@ -973,19 +989,12 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
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

