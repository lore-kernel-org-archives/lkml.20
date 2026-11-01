Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793543538;
	b=K5MM0Z4yWBbgXSoCA0oLBruSH0ur2Ih++HCIKjoNkNOkXkzxrY/joPV+7mDRV+71csQp
	 NSWl+AXt4fPUrJZPX0wSMdb+/qbvNLStAPQg3rY0ITDE6fWxrMeCM1MJPlNk26elYIwcG
	 hLiHQhQlkV1u0YXeV/2bQIFp8PjN7la1HS1wc45jMZWShkhAvmgj6hknFAJRLYgGqjW65
	 sekSTu7JiDySwWIt7Uz2rwIZbVO/11vZ8FM4/qll7FHXODXbJug2X1m1S7z8/1m02UQLv
	 5+0gmsk8GRHY0JaaroQ8pCvbzrgLoq7hFi4DvWYZG1Ud15W2aqUZaiekCxRgNL6t6WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793543538;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Uqju34F2XTm0dOOLsODT8LSZpd+f6JRw+MJO0qkB++U=;
	b=KpdEzniJLwMd1vhOq/03MEdrNLjcB5+6ka8AQ6pcJyVqVLcNO37orhNT7ZPYP70xlHnB
	 0e0xAH/TsuY6BpaYUqymLA6SeF+/ZDiYouB8dU8Fc9wdlV6AwooOidNGiUeOf5UieVIpg
	 8LUkM1fXpi+ZGqtc6pd2jOyWys3Od4TaL05TMOP8yD7WILOdeHfTjZL6zn08kGOZIPFqt
	 o+7Sjd9lyQpfO92XGzFjS4J55o8Op3v9pBW036LJp186sODq/zaP2QcXiErIepX6cfB8K
	 TJHTi3RT6EdF84SNeBYgKL54kfGzqzHgBj6+KVdvebEUj2ZFOy0QgD6UNyRjgH3X3cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K3l+p3wu;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B809C606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B809C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K3l+p3wu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793543537; x=1825079537;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=k4B0QxYHDKxB79XJwXBSjOl3me0D6cQAaJA4VfP4zdE=;
  b=K3l+p3wuZ+hfbPKQC8k4qzaS73gZIvwMtzPLqVR3RkRbe3Mc3X/+oyY0
   tvbohSQDhcmy0ajG9S7+N/9vnXDcYSrntRmDURmFaftQeTYqkmn3J96ry
   +4ZepiMU1v+fWyT/+TM1TseU16CaxaEgU9PftC+SLPni3zeCyTLd/vkh3
   WjKfGwADScn8HmgP9fKQ2UHC9O3qhTs4JrmME6YjiCHQy2a5dVVJCxDqw
   Uda5hbQSMuL6CndlnOKdc6GmJ4Qgwcg8QMHwe09MI+kcbEC2rs9B06rJM
   FHdTc6Rx3q2Mbgi6NH/H42LZf5xpHYGA+UX241q5f6iYITJoQIpIPmT66
   g==;
X-CSE-ConnectionGUID: 8yMY9OFZSHqf+0T5/4KslQ==
X-CSE-MsgGUID: 4i+oG6eFSlW1BzB3z5G5QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2124621"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2124621"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 06:32:16 -0800
X-CSE-ConnectionGUID: f/TWoBkKSniGKu6CRFtusw==
X-CSE-MsgGUID: p41oxIB4S7+yM2a0DnLgpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="6280183"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 06:32:15 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Sun, 01 Nov 2026 16:32:06 +0200
Subject: [PATCH char-misc-next] mei: bail out if no matching hbm request
 found
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261101-bail_out_on_nonexisting_hbm-v1-1-ec1eb6aa5547@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqDMBBA4avIrDtgLPGnVykSoo46oJOSSYsg3
 r1pl2/xvhOUIpPCozgh0oeVg+QwtwLG1ctCyFNuqMqqNqY0OHjeXHgnF8RJEDpYE8vi1mFH33n
 btHVj27uFLLwizXz89eePi7izjpinBP11fQH2Iw40fQAAAA==
X-Change-ID: 20261101-bail_out_on_nonexisting_hbm-a9a578675835
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Menachem Adin <menachem.adin@intel.com>, 
 Alexander Usyskin <alexander.usyskin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793543534; l=1463;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=k4B0QxYHDKxB79XJwXBSjOl3me0D6cQAaJA4VfP4zdE=;
 b=T3cgkIYluDkvIpbgxLs/8W3RZvgNVi0n6GeA1NWKv2on12xAbEguix3dH/rCS1a8KiNPrlgSv
 c72NvX5740ODlnseh1/4DAixX98yDhpOexn31+ZcqIrBxQOQr+BALm8
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=

Umatched HBM client response acts on wrong client
as last traversed client is used.

Fill cl pointer only when match is found and add debug print
for that edge case.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/hbm.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/mei/hbm.c b/drivers/misc/mei/hbm.c
index a864ac7121b2..c93f3db34353 100644
--- a/drivers/misc/mei/hbm.c
+++ b/drivers/misc/mei/hbm.c
@@ -998,25 +998,26 @@ static void mei_hbm_cl_res(struct mei_device *dev,
 			   struct mei_hbm_cl_cmd *rs,
 			   enum mei_cb_file_ops fop_type)
 {
-	struct mei_cl *cl;
+	struct mei_cl *cl = NULL;
 	struct mei_cl_cb *cb, *next;
 
-	cl = NULL;
 	list_for_each_entry_safe(cb, next, &dev->ctrl_rd_list, list) {
 
-		cl = cb->cl;
-
 		if (cb->fop_type != fop_type)
 			continue;
 
-		if (mei_hbm_cl_addr_equal(cl, rs)) {
+		if (mei_hbm_cl_addr_equal(cb->cl, rs)) {
 			list_del_init(&cb->list);
+			cl = cb->cl;
 			break;
 		}
 	}
 
-	if (!cl)
+	if (!cl) {
+		dev_dbg(&dev->dev, "Can't find request for cmd %02d (%02d:%02d)\n",
+			rs->hbm_cmd, rs->host_addr, rs->me_addr);
 		return;
+	}
 
 	switch (fop_type) {
 	case MEI_FOP_CONNECT:

---
base-commit: 79e5797d243a466138f641932f81dc69f796060c
change-id: 20261101-bail_out_on_nonexisting_hbm-a9a578675835

Best regards,
-- 
Alexander Usyskin <alexander.usyskin@intel.com>

