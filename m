Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569549;
	b=APl4xCiJPk8RyJDW9qhzR0d8FU/UxyNXtwONaYygW4LGQIF4ukQqNcR2XrkUEyUSMe9l
	 aerV0cK8CkO2a8makNe6AznJ0vY0c3YyEJws303Sf+Qt/v2I6fsKYmK1yd4vnisv1H9Em
	 6pn3ZcxgRaGIZkHEPrsaeGezNDk2nZf6YVy5KmeWw/9/bSzCKtpVhpL4JJS1JN/3XTLO4
	 0wrfvWWeZevBa4tU+GVcVIq2u1VC8bET/jVrFwqu0Ie3JnfugFdn8jh9Y18jB2gBjON5L
	 nqIaHj4XWwooRGzjg0HXGVi3wbEDTVyrFNz2kRitVpQla7w8Zvgs0YeHAo+sp/q4RvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569549;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bQD74olywWfshX8oLEh4zN2PHAYJH5OrOG1cvasnjS4=;
	b=F2n/0WYKVYurC/YYq+ocYQ87dOcufVwPhI/abGj4RVA41tKFbs2H9IIe7T3BcczdDEFe
	 EF/VZ6PnkV8fKW5nwoL0E7zvbADmatAkPF8e1Rvzv2RE1oKae564s4MB5aRN2OgGUBVbk
	 oyal+ekGj1Og6C71GgEmJ1GCxxF0d3se5G/Pztj59J09MWxkwEMV85M1mQ5JTSdRKFMae
	 fqj98GdqBdfBnvJ9GuZJZhZfsnzyFUMUV7TF4FYEanlhtKkBK000mOaoYqNwMT4ub22sw
	 +76jtJzs8qn5WylBMu8vaoBq8OSPhZMUrAouoDcZ79y+Y6ApIOpekMqOOF7Dg06vvcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lDSD+J+3;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218FF606A8AB;
	Fri, 13 Nov 2026 11:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 218FF606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lDSD+J+3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794569549; x=1826105549;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nuvqR0YlUzf5WQYSytDfXMvmJsxteY/kcctS1jEB9qI=;
  b=lDSD+J+3JOAcEEq7PRRay4jItcX/vtmq/ULhYqPod+ZDTmJs4/YuCcJ8
   GxeriJMySzzIVjxGwa8sK708ObLtH4sq6e2iJl5Roiil/HNSyqnvJa9RR
   coxQAdjzGU8x15crxclArNZzww7M6BA6A9/LjwKIfj+qZi+p8yzXf5qOJ
   9Cn+Goo9UgeASeseFGrOzJRRc8pFCsF2IdRlqBUJ5QFtIcSfjOt8zuV46
   +eX6wT/tUiIIwIylItojynw6GUpONYy/bMfIQXXis+2Cq7JEgC2HO+DwB
   kVkObgXABEXi929FhGmg/fcBNWdCQizn683Hiyjo7e+WzS4jOVx7T1igm
   A==;
X-CSE-ConnectionGUID: AvX9v+cHQyuwpCLcVB8wdQ==
X-CSE-MsgGUID: SQ8ds4HPS9emYN5QkVmslA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3246948"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3246948"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:31:40 -0800
X-CSE-ConnectionGUID: qAij8h+1ThSQ6Wds6vWvLw==
X-CSE-MsgGUID: EAoxJgwNRmGsJIA7eNujNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9235610"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2026 03:31:37 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 08/11] ASoC: Intel: avs: Streamline wording used for board configs
Date: Fri, 13 Nov 2026 12:38:37 +0100
Message-Id: <20261113113840.3067489-9-cezary.rojewski@intel.com>
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

Have all the boards follow the same naming pattern in Kconfig.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/boards/Kconfig b/sound/soc/intel/avs/boards/Kconfig
index 82f50207bb2f..770267bf9c1e 100644
--- a/sound/soc/intel/avs/boards/Kconfig
+++ b/sound/soc/intel/avs/boards/Kconfig
@@ -23,7 +23,7 @@ config SND_SOC_INTEL_AVS_MACH_DA7219
 	  If unsure select "N".
 
 config SND_SOC_INTEL_AVS_MACH_DMIC
-	tristate "DMIC generic board"
+	tristate "generic DMIC board"
 	select SND_SOC_DMIC
 	help
 	  This adds support for AVS with Digital Mic array configuration.
@@ -41,7 +41,7 @@ config SND_SOC_INTEL_AVS_MACH_ES8336
 	  If unsure select "N".
 
 config SND_SOC_INTEL_AVS_MACH_HDAUDIO
-	tristate "HD-Audio generic board"
+	tristate "generic HD-Audio board"
 	select SND_SOC_HDA
 	help
 	  This adds support for AVS with HDAudio codec configuration.
@@ -49,7 +49,7 @@ config SND_SOC_INTEL_AVS_MACH_HDAUDIO
 	  If unsure select "N".
 
 config SND_SOC_INTEL_AVS_MACH_I2S_TEST
-	tristate "I2S test board"
+	tristate "test I2S board"
 	help
 	   This adds support for I2S test-board which can be used to verify
 	   transfer over I2S interface with SSP loopback scenarios.
-- 
2.34.1

