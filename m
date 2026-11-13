Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569545;
	b=zBeJuhfPfGj3q73dpdVq66iGOsRtWeSoIIGcbl/TDQYP1hV1FtsRYy+fHGkGjVwYjCq6
	 p5HI2UYw/7n8RdvnKME7KgIV6KfaxXh7E9tEDJR68Pbzpjfx5bh64Sc1udGsKH1EG3qRQ
	 HQ5KlMgBopUJgHsRgeHKRtwrwVTNg8mVLEo+/KAr0W3DqVIpFXBxKGdjTTWNucDV19tod
	 dslyMzuJBti0+OcnwLd02L+bKvcJCiR7vtV5bJd3YJ/gv28z7rO4g4j6C9QuI+SNfjcrP
	 A9uVm6Qg96DTtPsQteRAoLUkluunHgDGscPuxANdxvpZRxBKXuNxVYm+S49PeZ1H+3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569545;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kK+XrDYuzgzuA7IzJgosDbmMr0e8QXwa57Z8AZ8dDKI=;
	b=g09rNMlJdzm9IkfnyzvbE9y6sSvusY/ipEeVnCCcX7jeSg2/l2Jwid1zLZLYsAYmbAxJ
	 mHTO56I3bqBsF7x9ycU9QMcpJoOxZmiMGXi9/ou7ML6GsrxVGVCAPT/vE60Ygb5hcxcPo
	 J8C39IpzMkW9VMltDcU2dKrIjTrqS4EY03coLM6SViuB3/8usbq82V1tC/WULOMiD+zlo
	 XDGiWg2wUbB/Dmf+ONOzSWP9OzSp3FPy3C0FzaWOHWhgARtObeSbWj0fd+DiR3x53HUd5
	 TJOnT8yKLfMvs8TTQT87ZHtfYgP0QAfYAFM1tRPSupzV7sRoMA6mBpcn2tgDBXc+x1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HEvbEuc6;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BD3606A334;
	Fri, 13 Nov 2026 11:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77BD3606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HEvbEuc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794569546; x=1826105546;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZOh72hlLn6BVdXl/FggtQpbZozJkZ4e293sAuXaCLLA=;
  b=HEvbEuc6WkIjcpJknHcMlWZTePwRyTQc8vhIk8GGqEb9WFx2UHExQ8yG
   HJcOUJH2i0nMD8cmlm/ZtSaRiG4iWQIcRB0Pv1T7HLhXHQXrDytnIb56O
   VoWCUjBj05n5EWWVpwhIb3tzGRWHcDLnfizIHv9HO+8w5t4USEBeTc5fE
   hwAp1BeTHkyQGcVLzAM6x17FVvQAvUvo4H+x/VFEUJnTcBpElyX0xVsV2
   rwsJpnLZ6vzbc+aP9rxkMknq9hhuOgP5v/iW4G/STx2omt3HdehkNB876
   W5qmfYUS1w89gQ4oz1CjyWVTyuqLc+ocycPWofiQuefUC8zT6Jstr037l
   Q==;
X-CSE-ConnectionGUID: X8K8oTJETNOJQmNCaBGQ9g==
X-CSE-MsgGUID: dGJhi0HWQvSalsmWijDeow==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3246917"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3246917"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:31:31 -0800
X-CSE-ConnectionGUID: cgMDeUsiTyuhOiDlMNrxKw==
X-CSE-MsgGUID: UQyR165ZSU27Iy84icTrpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9235587"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2026 03:31:28 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 04/11] ASoC: Intel: avs: Small registers cleanup
Date: Fri, 13 Nov 2026 12:38:33 +0100
Message-Id: <20261113113840.3067489-5-cezary.rojewski@intel.com>
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

Sort the HIPC registers - HIPCT comes before HIPCI. Also for
readability reasons, reword the ADSP interface version constants.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/messages.h  | 4 ++--
 sound/soc/intel/avs/registers.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index 55c04b0142ae..f8407b917c00 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -502,8 +502,8 @@ enum avs_hw_cfg_params {
 };
 
 enum avs_iface_version {
-	AVS_AVS_VER_1_5 = 0x10005,
-	AVS_AVS_VER_1_8 = 0x10008,
+	AVS_IFACE_VER_1_5 = 0x10005,
+	AVS_IFACE_VER_1_8 = 0x10008,
 };
 
 enum avs_i2s_version {
diff --git a/sound/soc/intel/avs/registers.h b/sound/soc/intel/avs/registers.h
index 97767882ffa1..c80207652fab 100644
--- a/sound/soc/intel/avs/registers.h
+++ b/sound/soc/intel/avs/registers.h
@@ -50,9 +50,9 @@
 #define SKL_ADSP_REG_HIPCIE		(SKL_ADSP_IPC_BASE + 0x0C)
 #define SKL_ADSP_REG_HIPCCTL		(SKL_ADSP_IPC_BASE + 0x10)
 
+#define SKL_ADSP_HIPCT_BUSY		BIT(31)
 #define SKL_ADSP_HIPCI_BUSY		BIT(31)
 #define SKL_ADSP_HIPCIE_DONE		BIT(30)
-#define SKL_ADSP_HIPCT_BUSY		BIT(31)
 
 /* CNL Intel HD Audio Inter-Processor Communication Registers */
 #define CNL_ADSP_IPC_BASE               0xC0
-- 
2.34.1

