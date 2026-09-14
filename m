Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E49A442397
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385428; cv=none; b=t8DJl6BnyUzOGQmQ4JQGfyj0uisA7IAA6cTLq9r6NHx2vW8BWepRchiW6mzXfx3bPNfzuOBI6cpMsDLtXmevw8XQPWj/b11yWwmLL+p8vSOYY8jTiaACXU2ZX45mWc+oS0uzAiJV/wyuP+UzqM3LW8ALONxPckOI4lowZvPFYFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385428; c=relaxed/simple;
	bh=mEuXU+hSGHRuOZy7jlByqS/F3cXwBBH8RTpFfujh51M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nJJfVy1GtKbXmPr+B+KuO62BIbzPEkx1/bjafcBMX8J/+NVF99p/UWY5IiWopYHbwhN/PKW/uaC85h9fJr3GBWMlnJw886T9wzayhqhtqgh7RTXW97AqQsqnbLcsGAX56SHJG8kbeDunUOSyr73V//DGJgQ2MJrtafv52Uk5k/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l2kBFCEH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2kBFCEH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385426; x=1820921426;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mEuXU+hSGHRuOZy7jlByqS/F3cXwBBH8RTpFfujh51M=;
  b=l2kBFCEH4LcfzzhIj0kBdrRiS7qZpMD+L03pbr8BmXpyNRbjqdIpxPV0
   mhTUSo3VAUUbaMezfGH/YBDWEcMChYpbb4IotGnejHgNnFz+nLwU2NRW8
   13UeNqfNIMAPrTdRK+sJddSAV3ZQjw5djCapvzTwLQ/X4eQh7h8bDhzn5
   WzSgut2eSDrTYXpg9q81V9gNrnbAa7hzg1zqenYOs+3/eWq5LG2Uyn1EH
   90oytxlP2gosUG5cYfCZ6cTPKXbOV3jwTJdaIEIrXlA/axgYlSHC/9mZ1
   hJC3OS+RzAb1hVViAMZSPZQGMA0Jc39m4Cr5ptuiZlJUy91HKPM1dcLRK
   Q==;
X-CSE-ConnectionGUID: s+NFSyQ1SzywRLmkeWgqmA==
X-CSE-MsgGUID: B3aXyF+ZRSmIg+whC6bCBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89864434"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89864434"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:26 -0700
X-CSE-ConnectionGUID: V1ASewLsSPCC6+39RmdhwA==
X-CSE-MsgGUID: 3X4WaPLfQdSqRWrAgM+LMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273133101"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.35])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:25 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/17] i3c: master: Remove stale GETSTATUS length check
Date: Mon, 14 Sep 2026 14:29:51 +0300
Message-ID: <20260914113003.183150-6-adrian.hunter@intel.com>
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
---
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

