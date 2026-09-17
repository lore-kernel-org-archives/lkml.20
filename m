Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37F34DEC3F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672458; cv=none; b=Wgeyf9gQSrbzFPPSfpkBa6GsopQCzWsqQV2QqDUyDZvOf7dgCYSY7L5VjBGwAAr/xmNHXZgCrCjLJP0ndIK2FCRGEMXlJ8N793ll6ZOJuIlZrpFhgweumoSuy8l47JA6Sr17cbHo4gOGJrOheU8EEbuN2jkjGOheDmqM0eSEkLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672458; c=relaxed/simple;
	bh=wOR0t6NyeVQrcvvWqcA7+DR+SuMRbj2V6g0RQeyhr0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=svWqjr3+fGseHi724uifbwdItcrBemoxki9B/s26w3eBrfMdh/9Eu7QMjS5qcfR7lIwsZ+0380OviLkpn+6VrrZCM29ZTmk7JtYP/Vt2afuOMxmMXone5rXfVeHxeNsBxDkQstSNAaK4qW2xQ+Bokm8Fry82yhptFBGig3mqmOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xn2x97lP; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xn2x97lP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789672456; x=1821208456;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wOR0t6NyeVQrcvvWqcA7+DR+SuMRbj2V6g0RQeyhr0A=;
  b=Xn2x97lPHO5fmn5WO+bXwfrF61s1Q+5RCThcL5MsM/z347Ix+afDzhBh
   kqqKr1PypvZBBkcBcS3LrEg//NHrj2eQi5wwtAY1iBj9TMtYX0iTR66ZZ
   ccI7NDATyj9ELkjds0dncr/I8SQL+5u8C9BgUTFDUGQp5N2KsFmb4A9T0
   dSVgQGqgfOxsJwJmqTHFab5aX1FO+W33oRiyOZPnoq1Mqvglo6IbxfrVt
   cFuaCaCYGt6vgeT3muCrTfcC9A+C1Dm6AunRAXdLMOfTxafZ1K7y9U/ET
   o2PYaRqS/wjdJLU/HXj38AJTb+eVx24/rW67IcTnJas/GH2X0BEWKhztT
   g==;
X-CSE-ConnectionGUID: LKJ5SqBUQN+aGaOS2ehdzg==
X-CSE-MsgGUID: JNjQI5CQRSaFoVkuEO5C4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639901"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639901"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:16 -0700
X-CSE-ConnectionGUID: /7Iw5LihSPOLV0MwpYGqCQ==
X-CSE-MsgGUID: gRumGHMTQFOIsDTNr7g5Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270271967"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:14 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 05/17] i3c: master: Remove stale GETSTATUS length check
Date: Thu, 17 Sep 2026 22:13:44 +0300
Message-ID: <20260917191356.133242-6-adrian.hunter@intel.com>
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

i3c_master_getstatus_locked() verifies dest.payload.len against
sizeof(*getstatus) after issuing a GETSTATUS CCC.

This check predates the introduction of dest.payload.actual_len. Since
then, dest.payload.len has held the requested transfer length and
dest.payload.actual_len has held the received length, so the check is
always false and can never detect a short response.

It also predates the addition of generic read CCC response length
validation in i3c_master_send_ccc_cmd_locked(), which now performs the
necessary check before returning success.

Remove the stale check.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Added Frank Li's Reviewed-by tag.


 drivers/i3c/master.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 215a22f2c7b6..4296c51a9537 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1777,11 +1777,6 @@ static int i3c_master_getstatus_locked(struct i3c_master_controller *master,
 	if (ret)
 		goto out;
 
-	if (dest.payload.len != sizeof(*getstatus)) {
-		ret = -EIO;
-		goto out;
-	}
-
 	if (status)
 		*status = be16_to_cpu(getstatus->status);
 out:
-- 
2.53.0

