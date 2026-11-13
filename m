Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569549;
	b=JhOAri69SMQAeIZS0e7t4DB9ZvzeqcuZZv3syGghBwP6euFtLuLc0/JY96aBnDvi+OWu
	 p7XzmDgimrrTdUhZBrLhneJvwFjlXY/lEO2s3Y4gp12tJQ3gPzxaMvXQ1zVgYwianfH5G
	 iszV0kR+DvXWeG2tn3Tf2we7D+5CTW2Kh4dVsaK3O9NCFos0Nz4RzRg9H1Kg8LBPOuzLj
	 xX1Xuu5h16WPYeOPlGmtDCpHFk2mNz1zhX82rjw/pqn4iYJvR4lIZPZlVRdjQPMJRb/zG
	 lipMNxxVe5+1V2FhbzqozSFTfENDaph1/2PAj75i0+eGVSCLOVXoOViHOQ95EBj0dMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569549;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=11w+sa08DLYdLmtiMMRxi2C4bEyff7D8XwrFTzUsLdM=;
	b=OkdOdl4+qC9mDB5lR4XvSSWxu1wR3hwl1z3obnSrUwry0bdgm/0qReLTkhsD4uWxN6Rp
	 1P8A2XYZXApVR2WsNhuE+2inJBm9Yj5I4XLS363hgsZABTZhD1rU2uCibvFuGVGcpd4s4
	 7rDiQ/pCPD85e0LNcuwv8I+r5JKGOYqElMCID/c1A3GzZiXFLIY/IX6A5SwhTdwnZiqnH
	 75hjH2JGsfNG0r93LtrOus090EPI5DWHssBhBMnwqcn3+Xqb5aFDPrjb92eb2EgImGENc
	 kb6VgAsrAdMHPMZSftMWXgMYFjUCN3Ep/HiLImdj6rkpY7z0M93dV8nxBVLuEldKq6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="URQfHm/O";
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942DE606A8A6;
	Fri, 13 Nov 2026 11:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 942DE606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=URQfHm/O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794569549; x=1826105549;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XmqvEuaXrRGeECS+VHjgCOxu/WP7f+LL/i0hZd5mbwU=;
  b=URQfHm/OE5PDdH6ddNqTsp6E0AVMSKEeWLZjOotQX6Cd5CURgqOtgZkt
   41kQXixLYB4SWV7XtHGi3zTBC0svlu2YuJv3nlrGou17dElkA/loH7ZuL
   Hd6ZfCxF4qMCZA/AgH0jojsJ0adVKPpDVZ0uf+x/vbOYcXOi4XWUxiTQ6
   Xz9b98DHl5PPTqnBN8EnZs5RFu9MGSUkUyrmOaUxtfvJu8AsyhsqFWgoS
   sJ9nJlIvzcOcOuRC4+QHak91RJwrCwALyP3vICJu2i1ko6WeN7VOBlPgm
   RzHqj5NQa9R5VO9IqyNJua2EkBt/GfVnIbBs1ZEeJRZiDtKdyC4moRQPu
   Q==;
X-CSE-ConnectionGUID: 3KpGGMCsSIaCqwUEc9Ba3A==
X-CSE-MsgGUID: rmAmrjOIRlG0FYwgBvxsGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3246931"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3246931"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:31:36 -0800
X-CSE-ConnectionGUID: y6Bg6AwHRUC4X7IzvvYhnw==
X-CSE-MsgGUID: R32uP0nBQ+WxvIHrIXj+yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9235601"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2026 03:31:32 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 06/11] ASoC: Intel: avs: Unify code style for platform_device_id arrays
Date: Fri, 13 Nov 2026 12:38:35 +0100
Message-Id: <20261113113840.3067489-7-cezary.rojewski@intel.com>
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

Align all the simple entries to the compact one-line style.
While cleaning up avs-boards, add missing comma to BDW-boards
platform driver declarations.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/probe.c   | 4 +---
 sound/soc/intel/avs/boards/rt274.c   | 4 +---
 sound/soc/intel/avs/boards/rt286.c   | 4 +---
 sound/soc/intel/avs/boards/rt298.c   | 4 +---
 sound/soc/intel/avs/boards/rt5514.c  | 4 +---
 sound/soc/intel/avs/boards/rt5640.c  | 4 +---
 sound/soc/intel/avs/boards/rt5663.c  | 4 +---
 sound/soc/intel/avs/boards/rt5682.c  | 4 +---
 sound/soc/intel/avs/boards/ssm4567.c | 4 +---
 sound/soc/intel/boards/bdw-rt5677.c  | 2 +-
 sound/soc/intel/boards/bdw_rt286.c   | 2 +-
 11 files changed, 11 insertions(+), 29 deletions(-)

diff --git a/sound/soc/intel/avs/boards/probe.c b/sound/soc/intel/avs/boards/probe.c
index b3ed44bc228c..ffd6ff76f9a5 100644
--- a/sound/soc/intel/avs/boards/probe.c
+++ b/sound/soc/intel/avs/boards/probe.c
@@ -61,9 +61,7 @@ static int avs_probe_mb_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_probe_mb_driver_ids[] = {
-	{
-		.name = "avs_probe_mb",
-	},
+	{ .name = "avs_probe_mb" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_probe_mb_driver_ids);
diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index 376b0859a88f..a28f107a5521 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -258,9 +258,7 @@ static int avs_rt274_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_rt274_driver_ids[] = {
-	{
-		.name = "avs_rt274",
-	},
+	{ .name = "avs_rt274" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_rt274_driver_ids);
diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index 2931c36df7db..ef1721bab2ca 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -228,9 +228,7 @@ static int avs_rt286_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_rt286_driver_ids[] = {
-	{
-		.name = "avs_rt286",
-	},
+	{ .name = "avs_rt286" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_rt286_driver_ids);
diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index ef6da3f3420f..3b5ee7021ee3 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -247,9 +247,7 @@ static int avs_rt298_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_rt298_driver_ids[] = {
-	{
-		.name = "avs_rt298",
-	},
+	{ .name = "avs_rt298" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_rt298_driver_ids);
diff --git a/sound/soc/intel/avs/boards/rt5514.c b/sound/soc/intel/avs/boards/rt5514.c
index c81c47e08991..189f27708fe3 100644
--- a/sound/soc/intel/avs/boards/rt5514.c
+++ b/sound/soc/intel/avs/boards/rt5514.c
@@ -175,9 +175,7 @@ static int avs_rt5514_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_rt5514_driver_ids[] = {
-	{
-		.name = "avs_rt5514",
-	},
+	{ .name = "avs_rt5514" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_rt5514_driver_ids);
diff --git a/sound/soc/intel/avs/boards/rt5640.c b/sound/soc/intel/avs/boards/rt5640.c
index 267006a1e09c..a425a597c9ca 100644
--- a/sound/soc/intel/avs/boards/rt5640.c
+++ b/sound/soc/intel/avs/boards/rt5640.c
@@ -249,9 +249,7 @@ static int avs_rt5640_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_rt5640_driver_ids[] = {
-	{
-		.name = "avs_rt5640",
-	},
+	{ .name = "avs_rt5640" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_rt5640_driver_ids);
diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
index de10d09616c6..afa560d942d1 100644
--- a/sound/soc/intel/avs/boards/rt5663.c
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -246,9 +246,7 @@ static int avs_rt5663_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_rt5663_driver_ids[] = {
-	{
-		.name = "avs_rt5663",
-	},
+	{ .name = "avs_rt5663" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_rt5663_driver_ids);
diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 9f47dc14ac64..bd2507855d96 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -322,9 +322,7 @@ static int avs_rt5682_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_rt5682_driver_ids[] = {
-	{
-		.name = "avs_rt5682",
-	},
+	{ .name = "avs_rt5682" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_rt5682_driver_ids);
diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index 53f8b6e2c513..900a965c9746 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -177,9 +177,7 @@ static int avs_ssm4567_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_ssm4567_driver_ids[] = {
-	{
-		.name = "avs_ssm4567",
-	},
+	{ .name = "avs_ssm4567" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_ssm4567_driver_ids);
diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index 98f0ca64be27..7bffc579edb2 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -446,7 +446,7 @@ static struct platform_driver bdw_rt5677_audio = {
 	.probe = bdw_rt5677_probe,
 	.driver = {
 		.name = "bdw-rt5677",
-		.pm = &snd_soc_pm_ops
+		.pm = &snd_soc_pm_ops,
 	},
 };
 
diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index 523ade9f31ab..f890e02bf9cc 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -247,7 +247,7 @@ static struct platform_driver bdw_rt286_driver = {
 	.probe = bdw_rt286_probe,
 	.driver = {
 		.name = "bdw_rt286",
-		.pm = &snd_soc_pm_ops
+		.pm = &snd_soc_pm_ops,
 	},
 };
 
-- 
2.34.1

