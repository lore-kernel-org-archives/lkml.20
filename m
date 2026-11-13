Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569566;
	b=Hgwv13Wk7O6gEfJIxi2L2gloKQ/rBN6zTPxwQ8PlSeNRuYjb4stoepY5VBx4wxj3bXwK
	 T0tbGYKK+c8fLr7pE4WDLRoztCTOQNe/f2ADdz0F8UdzmzouNWKeQMzXGaWVyucJYxYqV
	 Cc0kQChMh+rAYr9wVS+mbvFu4YGi1HEvIcKE4OpIfOR+13ASY4e/7lkW92Dd51Pa6LFIg
	 UE3bYZjK8qy92ecbH0nNqwGkPhCutDCQ5cxbyD5VxGCFIKJd0GWLgaWghg6uBoEK8rXKB
	 eQnKoiv9tFgpSri6wPhX5MDIMWOjQppH+sQL7CEOtMnFdpmfITMxIRazyjkm2aG9KXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569566;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z3Gq9sreptx0+ny59w5XDVCUpsd41ZWX0cddi3rgnbc=;
	b=1viaVpKRa/iBHPgNj/lJODrFvqAjulVNR7J66hEZcSwPAjCMHjRAPrqsc6LWbTbby3Dx
	 9VuNfVJeBNitAgM8/0REBWx6arYvJkksabX7gKv9ZTcR1+3dcepxv9G5f1ZZ2JTSQ7sP6
	 igmuhn5GAK/xssenvNgpEuqLt0ugc30mgg/bD5H1JNsRVr8DFNzsNQm3DjAaJ1FICNZy1
	 iO4nRsE0jL1F/RrFB/e34cSeJSk1/cATvQ3De2k4Ecl0yTa6NbQxmkAwOuttr7umEvkgl
	 AqKiUZBDcv0anuPPzv2dpr5ZUxkB2991y0e7EBOm0yA0SNFrx1y2B40xYRnoAO4yg4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hAOTyZyE;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D201606A321;
	Fri, 13 Nov 2026 11:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D201606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hAOTyZyE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794569566; x=1826105566;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EJMnrDbBJOALbpLsI3FqbFO3ZR8l5ai1HlsolaV9Uy4=;
  b=hAOTyZyEeij56qgM3rAnnFMh/yjw6nPT5xhEcKlkQv8F1Z/Y1Tm6YWiv
   iXBEKADvCAePBnUkb27EbA1b1IBLkCR3umKNgRo4bQM4lxQ3PA7yBTAHx
   ML2ATmjrxhzViutQM5K55DLnvl4XxBnEiCr0c73n3jrbhKOkWEgBn/Buj
   KEXNOxFMeNcXQtok08zBTc03+nFBq3KVvkzWrOVDoDebvIJ4ojPpfQm8d
   z8EhrMCYOSmUwRrBcXAaFFGp3TQBtkIM5V8L23il3uKcplyJiyMp40Oao
   36iSzF1p4FRn4CyOZEZStkjRDcmT/ESrOFyS9Csfb92AgFh7qB9SrawCu
   w==;
X-CSE-ConnectionGUID: l9AyqjnDSy2NeZ5t74p++w==
X-CSE-MsgGUID: LMM4zvHRRjqcZxtINnn80g==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3246962"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3246962"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:31:42 -0800
X-CSE-ConnectionGUID: UKdHKKLERXqBRjNPYq/B/g==
X-CSE-MsgGUID: OwfccmSUTmak+N4m9tYfaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9235629"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2026 03:31:41 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 10/11] ASoC: Intel: avs: Streamline spacing used in the avs_ids table
Date: Fri, 13 Nov 2026 12:38:39 +0100
Message-Id: <20261113113840.3067489-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113113840.3067489-1-cezary.rojewski@intel.com>
References: <20261113113840.3067489-1-cezary.rojewski@intel.com>
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

Makes the declarations consistent across the table.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 8cb2deb2b5d9..8ff7c616a9d1 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -913,14 +913,14 @@ static const struct avs_spec fcl_desc = {
 };
 
 static const struct pci_device_id avs_ids[] = {
-	{ PCI_DEVICE_DATA(INTEL, HDA_SKL_LP, &skl_desc) },
-	{ PCI_DEVICE_DATA(INTEL, HDA_SKL, &skl_desc) },
-	{ PCI_DEVICE_DATA(INTEL, HDA_KBL_LP, &skl_desc) },
-	{ PCI_DEVICE_DATA(INTEL, HDA_KBL, &skl_desc) },
-	{ PCI_DEVICE_DATA(INTEL, HDA_KBL_H, &skl_desc) },
-	{ PCI_DEVICE_DATA(INTEL, HDA_CML_S, &skl_desc) },
-	{ PCI_DEVICE_DATA(INTEL, HDA_APL, &apl_desc) },
-	{ PCI_DEVICE_DATA(INTEL, HDA_GLK, &apl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_SKL_LP,	&skl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_SKL,	&skl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_KBL_LP,	&skl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_KBL,	&skl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_KBL_H,	&skl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_CML_S,	&skl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_APL,	&apl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_GLK,	&apl_desc) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_CNL_LP,	&cnl_desc) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_CNL_H,	&cnl_desc) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_CML_LP,	&cnl_desc) },
-- 
2.34.1

