Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55673DA7D7;
	Fri,  2 Oct 2026 10:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790937137; cv=none; b=ejs8eGgOVe96qX65gypRFDdt4vZy3+1MuDTYqxIDVaGJg8YYBSF/wQrMHooFZMweg89rFKa+RcTFy9KwEwIogV2UfIUJFiwSKSdRLzBXogBN1yFkwtVAs/SYAka01CQzLWjPpfvPOOl8VsDHFmqrKYoOcKgok26m408FHX4Rn0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790937137; c=relaxed/simple;
	bh=jTCQkoi6Q6DCTozBrP9KwBu/fvcDNE+90kPRcFmYHUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BJmLyJ+xX5bSBRoOAhJOjlzl9XWzONrrIaYRDZ5PLYrgjsxRxly7Hipvugj7K/Ps1GEhIB3/9iaqau/bkIZHTig0xX4Dc2VZRAc8Fbv8fKifOxVizsQ6/IDwkQ/9t0UeBy3S3u76/0EH86MoIgI4a1e7RdObLI9ho0Fx7ti6ReY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cBBNTsAw; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBBNTsAw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790937136; x=1822473136;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jTCQkoi6Q6DCTozBrP9KwBu/fvcDNE+90kPRcFmYHUI=;
  b=cBBNTsAwLPt0543NmBjRIaBh7SxcAUZKAO9OHIiCu83n6/pY4iYbZgQG
   U0x+2OEBKTZ9+jzAWy49M7U21mCsg6n5rmOHew6kQRI8rL4RdhVfCrhKr
   ajqGUfzVpaqe3Jir73izB+OlNoivXoPgc1tJR0w32e8949wo2jXlWvDOc
   hdSMZlRXVzHVBg0StCmO22yRDumuvpH4JcZWyi3RI/JgTxP1Sx4+bu0T3
   Wsic6v1GTycg8g9gtayAgpHIIPu//uObImHskzcPTH3jzC7vTMJtH063W
   2vYA0JvPHpd3JZ0+9q/Y+YmZD1UzBDy+P/hnUMDmoj76VhQmXT3RhuYqK
   Q==;
X-CSE-ConnectionGUID: ayNejdknT2OyjSTZ2xYL1w==
X-CSE-MsgGUID: Z6tQSvBNQGS/L+6SxxrmoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="79260459"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="79260459"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 03:32:15 -0700
X-CSE-ConnectionGUID: OCnHjwHnTS62GD+NUrddjw==
X-CSE-MsgGUID: jSHKICGgRtqY4zcGIuOVCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="304186322"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 02 Oct 2026 03:32:14 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id E7E3F99; Fri, 02 Oct 2026 12:32:12 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] soc: qcom: cmd-db: Use %*pEhp specifier to add some sanity
Date: Fri,  2 Oct 2026 12:30:46 +0200
Message-ID: <20261002103209.875124-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As Sashiko pointed out in [1] the %*pEp makes the whole thing
like "no escape". To add some sanity to this the used specifier
also includes ESCAPE_HEX.

Link: https://lore.kernel.org/r/179089728102.434549.12368098081790653201@kernel.org [1]
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

Just a Link tag (no Fixes et alia) as the escaping seems to be a guard
that never fired so far.

 drivers/soc/qcom/cmd-db.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index 3f1eee784387..bed14b92c194 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -308,7 +308,7 @@ static int cmd_db_debugfs_dump(struct seq_file *seq, void *p)
 
 		ent = rsc_to_entry_header(rsc);
 		for (j = 0; j < le16_to_cpu(rsc->cnt); j++, ent++) {
-			seq_printf(seq, "0x%05x: %*pEp", le32_to_cpu(ent->addr),
+			seq_printf(seq, "0x%05x: %*pEhp", le32_to_cpu(ent->addr),
 				   (int)strnlen(ent->id, sizeof(ent->id)), ent->id);
 
 			len = le16_to_cpu(ent->len);
-- 
2.50.1

