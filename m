Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2515349C3
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791927729; cv=none; b=E4WkbrtPWXOCbUGfRbm04DB2NQox+vaUwgPPqx+21iX/E5BkewaaZkm0MmIJtTmY2YVjUP43tubvWiaPEjBU9rE7/7Z7JlpbjSChZEpQAUURxEyBy17bfIYDAHOGeRp21BPRDok9Fav7BULGHFrUK8eW1rDJV4yUgQoDkz1GsTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791927729; c=relaxed/simple;
	bh=ZEiyfxSi5iVl8gguw171v26wkcsC84TwxK1x6s8pO3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o4oxlgEYlwAaew4Oag9gyE9AmSTX8S/iuLF1y3p7JWkR3Z3JmimUm/sUxBCeDq7Z2TwJ8ws5GXJ8Lkh2bDTslmpCGAXe+du0/pqLNnf17QhbJF8p2GwVIZhwzoPWuoHqmFBvzpPpNeeLy2DvwXAbLLGmjensNgAQZC3tH8cxwvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zachschneider.com; spf=pass smtp.mailfrom=zachschneider.com; dkim=pass (2048-bit key) header.d=zachschneider.com header.i=@zachschneider.com header.b=NppNr1K+; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zachschneider.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zachschneider.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zachschneider.com header.i=@zachschneider.com header.b="NppNr1K+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zachschneider.com;
	s=protonmail; t=1791927718; x=1792186918;
	bh=aHk/iomm+t9N76YcybtFtjmB/aVm2Mh+THljV6Tfv8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=NppNr1K+22au0KXXN0G4PnyqhpoeRcrdsC8SooVwoHv6VCFw2hnHIR8v4053pNOPe
	 nqGc86av58mp68dyQ4Fjk7taJ1jAOCLYQ5vo597V4V0qxqJv/gDLYNrulPPhw4+KfJ
	 0ItxMQGg5j6qpYa82SE/wqZmGpI2RHCkwqYej3lIoluf1a2iPgrKyGfv37l0DuHySn
	 vW6T4EfybLlO+TLAuiUKKOHokK53ZzI7A39TUOz62p75RacizqkpRtLSpLpjj2A3q5
	 SrlQaVaA+oBlAk5QEhfPs1SVsXejKLvoSug/M2fIkBztwE5PKJ1gP+1B7rDQ4d+bIU
	 LpCRgoIuHPqkA==
X-Pm-Submission-Id: 4j478N5ccfz1DDLm
From: Zach Schneider <me@zachschneider.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zach Schneider <me@zachschneider.com>
Subject: [PATCH 2/2] staging: rtl8723bs: fix long line and braces in odm.c
Date: Tue, 13 Oct 2026 16:41:29 -0500
Message-ID: <20261013214129.699212-2-me@zachschneider.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013214129.699212-1-me@zachschneider.com>
References: <20261013214129.699212-1-me@zachschneider.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch reports that the ODM_RAStateCheck() call in
odm_RefreshRateAdaptiveMaskCE() exceeds 100 columns and that the
braces around its single-statement body are not necessary.

Wrap the call arguments onto a second line aligned with the open
parenthesis and drop the unnecessary braces. No functional change.

Assisted-by: LLM
Signed-off-by: Zach Schneider <me@zachschneider.com>
---
 drivers/staging/rtl8723bs/hal/odm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 4352f58f3674..435875f3bef4 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -270,9 +270,9 @@ static void odm_RefreshRateAdaptiveMaskCE(struct dm_odm_t *pDM_Odm)
 			if (is_multicast_ether_addr(pstat->hwaddr))  /* if (psta->mac_id == 1) */
 				continue;
 
-			if (ODM_RAStateCheck(pDM_Odm, pstat->rssi_stat.UndecoratedSmoothedPWDB, false, &pstat->rssi_level)) {
+			if (ODM_RAStateCheck(pDM_Odm, pstat->rssi_stat.UndecoratedSmoothedPWDB,
+					     false, &pstat->rssi_level))
 				rtw_hal_update_ra_mask(pstat, pstat->rssi_level);
-			}
 
 		}
 	}
-- 
2.56.0

