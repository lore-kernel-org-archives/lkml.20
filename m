Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6D14E77FF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672472; cv=none; b=PxVzLq6C4eYlRjEMwMvq/ACcmg581WfoMvLi4jGESkEs402V2D+wDMm1ZMv3/qkVdfo7PBJzFPxD8JG2igJI1tg6KAK/8OEG8BlIXkL8zi5857gDu+Wn4el3v3RuiLv1Fs0DuLIE+O6diyZJBP3rN3aLgKbwdkiIL2y9b8T/z3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672472; c=relaxed/simple;
	bh=h/WQ1CySimtto27MKEw6h0kwRBGh80WpJZja5OCfoIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U3XdHCQsMRc0P2mObUZ1Vjzqw3SuE6dcdE773qOQIdhbi/MUf9aDYqtvrPCdjfEQTUnqlM8aUH4GYmFLhQLnGji7Pc7XDUNAVf+8sp+7LBKiJml859T8DxW+G5/Dh5oLUAu/kXM1ojHS9upJZ+jpHtcpShwoCaMcAuZFlRRHfNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XSEH6/pv; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XSEH6/pv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789672470; x=1821208470;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h/WQ1CySimtto27MKEw6h0kwRBGh80WpJZja5OCfoIA=;
  b=XSEH6/pvtV9fI7aBFszAWbb4stB9jb2eJyhYBpSmwpMD7OdPC3mW6nHf
   IjXGC8tPtAAwZu4PxpdiZwWiY184NDW0V3QskdLGDTHXiWQ2u5Y1iMdqU
   u8dI8ppFuNiX9Vi4xQnRQ2ixQuzrsQs/3LLptPV8oVIxhuWqLad+d3U8j
   E0sMSsUwhGW3dIg3/AvsdiUk5hlekH8JaR7iQkW0BH0LpPWK+G56TE0La
   TsV2HtXoKHGxfzXInoGvFFswkix+vSlvwpjSBXjyJp3OmgsQDDgg/oz3b
   /Z9UdtnsSb2+WiOVAgvJNjehlGZij38X1kJbQWqyGTRDJZ0cGYvrmLyFZ
   Q==;
X-CSE-ConnectionGUID: NvvvjZUIQpiVCAhQEnRmZg==
X-CSE-MsgGUID: DOBSRIkZTDOrCT8dcHkC6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639956"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639956"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:30 -0700
X-CSE-ConnectionGUID: xukVB5gZT/aDry/nMGmvaA==
X-CSE-MsgGUID: GWdMM/17SyejzLevKBySiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270271999"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:28 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 12/17] i3c: mipi-i3c-hci: Correct RESP_DATA_LENGTH to bits 15:0
Date: Thu, 17 Sep 2026 22:13:51 +0300
Message-ID: <20260917191356.133242-13-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917191356.133242-1-adrian.hunter@intel.com>
References: <20260917191356.133242-1-adrian.hunter@intel.com>
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

