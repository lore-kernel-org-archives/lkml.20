Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7D144AB68
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385443; cv=none; b=LBSUNbe3/s64TctqD4jJi8zzIBO4NWAcgEXfXdOJayg9PTM4oi9tS1F7xpjzH6+KrvptE75EzZI0ZDoGRw5/ynk8Uaw+RDscXj/xImfGLXu77EinvE63XVsaANQR8xToyHW2LZWsav+YXXD3Q3fBHkJHZWySF0MkvDoI+zmHlAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385443; c=relaxed/simple;
	bh=u5GN9lVpjpXRd8vJC9Hh8socSV48mdkeYAlWgxTGzhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KHlLe+L7k2YOktYcYicqYes94GCVW0GFX/gWjWSs0q7WGAg9iAgCBGzTIIQdCsOsoWXyinKwANV0X/oYdMVVY0eREkScriaVoCgLM0czGj3i1Jji1+15Odt1IzpwLuJfalBcF3lLjoupNeRF5R3+7bqLO89e5Pq0eH9kRtk/1LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtUFr0YU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtUFr0YU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385441; x=1820921441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u5GN9lVpjpXRd8vJC9Hh8socSV48mdkeYAlWgxTGzhc=;
  b=gtUFr0YUmynwO5+fb4Am54ZRoSwb/nX92ttb7Y258C0unoeIlEnMsgMf
   C1Ijziu1JNQZS3oDlsSqdfvAdiK96nK04JzDyT0KWE8upZzMCa15dH97q
   YoUBkT4GO8I8akTtfbWUkkOSQelBVlGGiCS3JeVH1GKDibIsxi9TYqDnp
   j/A+DMRtvkqaLzHXtVWnf+aKaey3jyQeoPauqGKiFQQe7fj0DRWw/udd1
   WRy2R2iMpQRcvnteZIqIBE6ZLU5+tK2OyFJtuw93ylNyf2QuF2IKYo7li
   EC+tbtpEzukY8+oAwNijjitZb8ny0ixqCTQlKKL1GCHbJFdHxvgpNA3Yz
   Q==;
X-CSE-ConnectionGUID: CD1b4qFGTo61Tx0VIlQoaA==
X-CSE-MsgGUID: hZ0SjvHOSret36YyAwKRXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89864488"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89864488"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:40 -0700
X-CSE-ConnectionGUID: YYpTKAQBTFCIc3tv/OIA7Q==
X-CSE-MsgGUID: 1Au/JSzkRPSoItr2YqXFFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273133141"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.35])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:39 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/17] i3c: mipi-i3c-hci: Fix Response Descriptor DATA_LENGTH mask
Date: Mon, 14 Sep 2026 14:29:58 +0300
Message-ID: <20260914113003.183150-13-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914113003.183150-1-adrian.hunter@intel.com>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
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
---
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

