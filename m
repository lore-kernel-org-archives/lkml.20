Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CFE438000
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789917206; cv=none; b=YDCGBUBInJjg6AN6K/+cVwLMKevQDUv7ovtmNoQXsUKeNHbUiRjsW29Nr/EbusLVL+ADAHSxNWp6/Esu9zXy8eqZbToPCIHY7YBywp6tZiw007J1GfaLt1R2CUmNzQZp3feJzvHh12rApn1cTYWtceO5gexNCsf3j+3NjN29xO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789917206; c=relaxed/simple;
	bh=LvCS1J3n7zGwydqW7aquNU9PxD92uK+FL8mwwGGF+aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MXvbmkmNCuTVG+oHCzrmwd5/aVeuAfloe2nvh45uX26C44YCAvIkZ4BszwxICa39U2cj+WTmCcLXk4/+njqsQDvqF6MOkSf1mmVyLdRUtF7pNRqLr2+OCBlJRKVxoMarNGlpBKftB+fBulTvdjcV/4Pc992iwr+NWF2IM2SCGJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lmxZ/Yhr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lmxZ/Yhr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789917204; x=1821453204;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LvCS1J3n7zGwydqW7aquNU9PxD92uK+FL8mwwGGF+aw=;
  b=lmxZ/YhrsTwuzFLDX84nr46vweGIqFfajiILc3YiNkJcGtQoEt2L9259
   o46IuvjUuyf5mPiDFey1jvkDHO6UTH1i/8eGwX8kGlmzGl7F5clZnuyVf
   bcPuSt9mK5kSIo8Sg3D1ZvwaXD57MqS3ufJjWYL6yZlFItmW35JB/va1d
   naHXYJkxvno2qXV3OYmLT//DZFS4rvNY5MWt8P1lnlBQrxYVIJ6KAmB8/
   7nIzfw3o5XWc+ogIMtBEl8tgNQoqwr31henONII+LlPrQ7BejZ0PIOo7W
   2+dG6xmJcQ9iS7qpVFraEZydywiJen947FnDBHPJ7g0MLI1ujIw6+KOcM
   Q==;
X-CSE-ConnectionGUID: 2PprCFOmSra4O1zG3MD4Ng==
X-CSE-MsgGUID: P9ThTyzrRdu7gF9HNrAN4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89548471"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89548471"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:24 -0700
X-CSE-ConnectionGUID: dA7X5oIGT/Kt3PS5b+8SXw==
X-CSE-MsgGUID: na0SVeBxRIyAtZqNWe568w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3352439"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.82])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:23 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 12/17] i3c: mipi-i3c-hci: Correct RESP_DATA_LENGTH to bits 15:0
Date: Sun, 20 Sep 2026 18:12:42 +0300
Message-ID: <20260920151248.46936-13-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920151248.46936-1-adrian.hunter@intel.com>
References: <20260920151248.46936-1-adrian.hunter@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Content-Transfer-Encoding: 8bit

The I3C HCI Response Descriptor defines DATA_LENGTH in Bits[15:0],
with Bits[23:16] reserved in all published HCI specification versions:
v1.0 (Table 91) and v1.1/v1.2 (Section 8.5). However,
RESP_DATA_LENGTH extracts Bits[21:0], incorrectly including six
reserved bits.

Update the mask to match the defined field width.

No functional change is expected because compliant controllers return
zero in reserved fields.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Added Frank Li's Reviewed-by tag.

Changes in V2:

	Reworded the subject, which was previously "i3c: mipi-i3c-hci:
	Fix Response Descriptor DATA_LENGTH mask", to name the macro and
	the corrected bit range.


 drivers/i3c/master/mipi-i3c-hci/cmd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd.h b/drivers/i3c/master/mipi-i3c-hci/cmd.h
index 7bada7b4b2de..e0d4a6e0e319 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd.h
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd.h
@@ -24,7 +24,7 @@
  */
 #define RESP_STATUS(resp)		FIELD_GET(GENMASK(31, 28), resp)
 #define RESP_TID(resp)			FIELD_GET(GENMASK(27, 24), resp)
-#define RESP_DATA_LENGTH(resp)		FIELD_GET(GENMASK(21,  0), resp)
+#define RESP_DATA_LENGTH(resp)		FIELD_GET(GENMASK(15,  0), resp)
 
 #define RESP_ERR_FIELD			GENMASK(31, 28)
 
-- 
2.53.0

