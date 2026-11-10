Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303507;
	b=R9decDm4B+urpL9TOcvA6VqxodR4bGxm56c/R630TCCXxrjc/PhmeSnLA8LMjgdZPX2a
	 cBPWYmnDr52VxWvRaIyOgMR3gzoiNJXZWkfEaNNtopL2NPs6h39BAoiq7n7CAvkEb5aDY
	 wzLTHw45/GVaHBe+fJoRoN7G7DupJS7jDEwTkR/yVAgdaFjN0eL+4njkwQ4hGqsYqhzV3
	 +G0Fb1Ku485o/56HF9eM4hwV/j35SDk6FvtfJ4Ve8GwgozuK2RAXHKOYTYHMoOS7d/UNV
	 KGEU552xX/OxRaEKB9rKNE8n1e4TJyMa2ehW4xjDQbb2Du+W3qOhOZUTJ2KlM31j5Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303507;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pugEhzYQFermHAhEqHWd7IXh1ZG7eCOfrq634A+RR9I=;
	b=RI4/Kg9Pn5MM9HtXUBHR9LrPUOpWRgRDd0gZ0tekXkLjyCW2SefB8InWq/2H3egMjD8V
	 Tt3N2jGR6+Q89lfS/AGIWUGVciOlsWDYNE3kiSLTU7IoN26Fc6OZFwcAgwrGQfMDR/PLg
	 3pncJ/1bEJBvjbC4lTUUVjjux9lovyIwUE0K0ERyYfGKNAcvkKp3kT1gsrARaYoMh/uMu
	 B0KoDV3vIdeYEthY30e8kHx1vkQ2WxWyokYjmUxSHz5zNANarFmuYcnJD0D9hPOUq8a4h
	 QenQAfimkMoFicN03VEir1L2BM13XA2Lzz2HiOEuXR3E9Mbo8sC68mMrDFPC1WLSmbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A0ASY11K;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45C5606A330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C45C5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A0ASY11K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794303505; x=1825839505;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SgDh52NTnvp8KWwggbGew979b6UAtBq42YeBCbIFT6U=;
  b=A0ASY11K5gNJOSS4LAikOWLXLamcTFwfDjFsNy+qrbsZSw+r1dRXukG6
   n/vzAxOLC1vsEGV8/jed3WNg5C3/ZLtupdimCtoGkU6p7EC7GAS+v9Trf
   6RUpdWogPVWUIprENtxc0qmkfT6VUPQxMl7alVUoxG9UzQDARov5iX5nZ
   VHJAoI4eY7Ow/mrFQ5UmH98T9HWvEwd0PUs4XpcpSlZCB0lZR5Y+kjCL7
   mGEscRNUEO/Qy7SWmywHf/jfPN9kFqdyIFT6Ls0Xw6W7uPwWOUOWTl/kk
   zLw/ix8FYdF1YK21Q1oK3781sxh0MvRsY6o4B2NfRt3uNa5aMasyBP0gW
   w==;
X-CSE-ConnectionGUID: uktSE+F2STuKZ/T5LxXEgw==
X-CSE-MsgGUID: /dUmWIl1QvqVAH5s1/zHxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2961807"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2961807"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 01:38:25 -0800
X-CSE-ConnectionGUID: dQuL6qS+S0e3vGpaOTta1Q==
X-CSE-MsgGUID: oXIGF2KFRQyqPhm5bQsoWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7975222"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 10 Nov 2026 01:38:24 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 256BC9D; Tue, 10 Nov 2026 10:38:22 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/4] regmap: Drop never used devm_regmap_*_free() APIs
Date: Tue, 10 Nov 2026 10:37:00 +0100
Message-ID: <20261110093820.454682-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261110093820.454682-1-andriy.shevchenko@linux.intel.com>
References: <20261110093820.454682-1-andriy.shevchenko@linux.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_regmap_field_free() was introduced in 2013 and was never ever used.
devm_regmap_field_bulk_free() was introduced in 2020 and the same story.

Drop never used APIs.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regmap.c | 36 ------------------------------------
 include/linux/regmap.h       |  3 ---
 2 files changed, 39 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index e327850ecc97..0617a957559b 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1330,42 +1330,6 @@ void regmap_field_bulk_free(struct regmap_field *field)
 }
 EXPORT_SYMBOL_GPL(regmap_field_bulk_free);
 
-/**
- * devm_regmap_field_bulk_free() - Free a bulk register field allocated using
- *                            devm_regmap_field_bulk_alloc.
- *
- * @dev: Device that will be interacted with
- * @field: regmap field which should be freed.
- *
- * Free register field allocated using devm_regmap_field_bulk_alloc(). Usually
- * drivers need not call this function, as the memory allocated via devm
- * will be freed as per device-driver life-cycle.
- */
-void devm_regmap_field_bulk_free(struct device *dev,
-				 struct regmap_field *field)
-{
-	devm_kfree(dev, field);
-}
-EXPORT_SYMBOL_GPL(devm_regmap_field_bulk_free);
-
-/**
- * devm_regmap_field_free() - Free a register field allocated using
- *                            devm_regmap_field_alloc.
- *
- * @dev: Device that will be interacted with
- * @field: regmap field which should be freed.
- *
- * Free register field allocated using devm_regmap_field_alloc(). Usually
- * drivers need not call this function, as the memory allocated via devm
- * will be freed as per device-driver life-cyle.
- */
-void devm_regmap_field_free(struct device *dev,
-	struct regmap_field *field)
-{
-	devm_kfree(dev, field);
-}
-EXPORT_SYMBOL_GPL(devm_regmap_field_free);
-
 /**
  * regmap_field_alloc() - Allocate and initialise a register field.
  *
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 8f3034881f8a..e4f8f462fbab 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1488,7 +1488,6 @@ DEFINE_FREE(regmap_field, struct regmap_field *, if (_T) regmap_field_free(_T))
 
 struct regmap_field *devm_regmap_field_alloc(struct device *dev,
 		struct regmap *regmap, struct reg_field reg_field);
-void devm_regmap_field_free(struct device *dev,	struct regmap_field *field);
 
 int regmap_field_bulk_alloc(struct regmap *regmap,
 			     struct regmap_field **rm_field,
@@ -1499,8 +1498,6 @@ int devm_regmap_field_bulk_alloc(struct device *dev, struct regmap *regmap,
 				 struct regmap_field **field,
 				 const struct reg_field *reg_field,
 				 int num_fields);
-void devm_regmap_field_bulk_free(struct device *dev,
-				 struct regmap_field *field);
 
 int regmap_field_read(struct regmap_field *field, unsigned int *val);
 int regmap_field_update_bits_base(struct regmap_field *field,
-- 
2.50.1

