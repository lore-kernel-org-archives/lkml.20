Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095757;
	b=Ed9tpwzN8m/kDIbX4lNAouSlQMgQVluW607YRt1wdFnf5266N05D7+YpVRxjlVFYQ1G5
	 +lOCKg91mZif7/DfwMwY+cw9tNFFiHc77upbsLWywRtMH1oi7RGoKo94LkkBjzQWMVYvO
	 lAvNQrhgSDf7rXrzLokXxu9uqoFBK1KDYH7TsOzW/trv1HuThUkvwb9LE2T5aNJR8CwPp
	 xpvhlcStwFMOmZaIYtT8d5UKZJXxfaI950VxIpx5nXu01HYTygPbnWpCRFX4hZLStQRVL
	 dFd8w75iXg8MRX1UQ3H7H/TiSwsCOeMrOko46rgJ3A3Fuk6NrqdLZZGG8Fqqo9CIHMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095757;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=XlCCWPrEFK3RXddfXN6QH3zLg0Y/vHPMqyByA8OlxLg=;
	b=b28OgO0n0crkxJJHW+OG9TlnaEJBZoNEfaJxuO0s9C6cGxDmu0gWDF5X3YXvFPQGdoyv
	 3Ki8gZxmf8wnq5M+6Vka6hUlc39BZmESORIX+Wr7OOYnqmqK4TiZp2PFmagk4SHDsgNxb
	 mJd5yVR20gXIW6jciqxkEqq3sdCOEB5KTdCBAdwVowdHt/zhhi1g1JTlJf1ein0VTcKOF
	 eEm+pbN6zn1nkj+nMxMmAy23lQgPXqrIrib+Y3j2gyQxK870zA/684/SOO088m04UhlfC
	 GOUw3IqLwDqYDJ8cdoz31oIv6uhAdqNdf/8H02HAKam3bcMRKDtQKpyGg7Sa6JmcFhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Tb/P+VBs";
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CC3606A31E;
	Tue, 27 Oct 2026 10:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36CC3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tb/P+VBs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793095757; x=1824631757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jeV6wtKK2ekUAK9tJVtT+fAgjBdc7aMzHqV8Q44/Umk=;
  b=Tb/P+VBsKVPbXkpbZ0fYtzzc0E2673LMTzoGTnXVixM/5KTd+0/u/bve
   TnOiEuoYSheADqNUKD4jbpnqVUjG0/K3062Fl+qt8c90jplZqIgAhirc+
   vZXQF8AvAKcme1fMSdjyNL2XlG21gtF2KYQsTDbKd+VebmFfegy1fgHwk
   jt8k/v62QMwy8kFo8PW5I66OL5BIYSG+fpDJUsyBbPnXWCHR1vkJ1rW09
   rYmeFyL25klk/KslgPUUR73vvQ7sfSLkKZZxSWtnAvRK6BVCcAj+t81rA
   R3XDJ5ubsSJc91iRQx+gapCnHS/glCMgYSj/DkweRISjIhM430VJwzm7e
   g==;
X-CSE-ConnectionGUID: 7YuZVZDHSB+nrqyWMAfs9A==
X-CSE-MsgGUID: v3wZqJC4QGOpCONbVdgMuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1667362"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1667362"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:09:17 -0700
X-CSE-ConnectionGUID: VX+fSFlNRFGhu30zQY5FmA==
X-CSE-MsgGUID: ge2Xt8SbR/CfDPX0/AJhkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6255212"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.2])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:09:14 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 455FE121CEC;
	Tue, 27 Oct 2026 12:09:17 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xLe7I-0000000H0VP-2hdz;
	Tue, 27 Oct 2026 12:09:16 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 1/1] =?UTF-8?q?Revert=20"media:=20Don't=20hide=20I=C2=B2C?= =?UTF-8?q?=20or=20SPI=20drivers=20by=20default"?=
Date: Tue, 27 Oct 2026 12:09:16 +0200
Message-ID: <20261027100916.4053512-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAHk-=wiVxA+1x-eNCp3-e4=emCKXUw9HnSg-ng5A_Ndf6-3mxA@mail.gmail.com>
References: <CAHk-=wiVxA+1x-eNCp3-e4=emCKXUw9HnSg-ng5A_Ndf6-3mxA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This reverts commit 3bf8c26a085c7b00dbec67a919b93fa8b7ad70e0.

In order to avoid exposing fairly rarely needed drivers to ordinary users,
revert this patch. People needing these drivers will need to enable
CONFIG_EXPERT until we have a better solution for this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/Kconfig | 11 ++++++++++-
 drivers/media/spi/Kconfig |  4 ++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 7de2d095c969..11c30252540e 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1042,12 +1042,14 @@ endmenu
 # V4L2 I2C drivers that aren't related with Camera support
 #
 
-comment "audio, video and radio I2C drivers"
+comment "audio, video and radio I2C drivers auto-selected by 'Autoselect ancillary drivers'"
+	depends on MEDIA_HIDE_ANCILLARY_SUBDRV
 #
 # Encoder / Decoder module configuration
 #
 
 menu "Audio decoders, processors and mixers"
+	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
 config VIDEO_CS3308
 	tristate "Cirrus Logic CS3308 audio ADC"
@@ -1210,6 +1212,7 @@ config VIDEO_WM8775
 endmenu
 
 menu "RDS decoders"
+	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
 config VIDEO_SAA6588
 	tristate "SAA6588 Radio Chip RDS decoder support"
@@ -1226,6 +1229,7 @@ config VIDEO_SAA6588
 endmenu
 
 menu "Video decoders"
+	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
 config VIDEO_ADV7180
 	tristate "Analog Devices ADV7180 decoder"
@@ -1585,6 +1589,7 @@ source "drivers/media/i2c/cx25840/Kconfig"
 endmenu
 
 menu "Video encoders"
+	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
 config VIDEO_ADV7170
 	tristate "Analog Devices ADV7170 video encoder"
@@ -1683,6 +1688,7 @@ config VIDEO_THS8200
 endmenu
 
 menu "Video improvement chips"
+	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
 config VIDEO_UPD64031A
 	tristate "NEC Electronics uPD64031A Ghost Reduction"
@@ -1711,6 +1717,7 @@ config VIDEO_UPD64083
 endmenu
 
 menu "Audio/Video compression chips"
+	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
 config VIDEO_SAA6752HS
 	tristate "Philips SAA6752HS MPEG-2 Audio/Video Encoder"
@@ -1726,6 +1733,7 @@ config VIDEO_SAA6752HS
 endmenu
 
 menu "SDR tuner chips"
+	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
 config SDR_MAX2175
 	tristate "Maxim 2175 RF to Bits tuner"
@@ -1742,6 +1750,7 @@ config SDR_MAX2175
 endmenu
 
 menu "Miscellaneous helper chips"
+	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
 source "drivers/media/i2c/cvs/Kconfig"
 
diff --git a/drivers/media/spi/Kconfig b/drivers/media/spi/Kconfig
index da3e225d420d..4656afae5bb4 100644
--- a/drivers/media/spi/Kconfig
+++ b/drivers/media/spi/Kconfig
@@ -1,11 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0-only
 if VIDEO_DEV && SPI
 
+comment "SPI I2C drivers auto-selected by 'Autoselect ancillary drivers'"
+	depends on MEDIA_HIDE_ANCILLARY_SUBDRV && SPI
+
 menu "Media SPI Adapters"
 
 config CXD2880_SPI_DRV
 	tristate "Sony CXD2880 SPI support"
 	depends on DVB_CORE && SPI
+	default m if !MEDIA_SUBDRV_AUTOSELECT
 	help
 	  Choose if you would like to have SPI interface support for Sony CXD2880.
 

base-commit: f39567cc92272f987c056d8c92f7c93f3fdf53ef
prerequisite-patch-id: a907c42a90ccc410e6fffdee8c9300233a5cd4be
prerequisite-patch-id: 82ecd20999da94a7472cd1061a0fdf8cffbac325
prerequisite-patch-id: 7d09c7afa4c3d4109642db3fd8435b21605854c6
prerequisite-patch-id: f9e361e419752c2c3b2d845b535e33407c7544f6
prerequisite-patch-id: 48a068cfdcbf7d53806dd8ff9e48f5de529fc67c
prerequisite-patch-id: ba262f258d655a87b99432ebce1e579594a16950
prerequisite-patch-id: 64c1f90be9a61ce4b6ee3988606ab0a24e630d42
prerequisite-patch-id: 69ddc210ad98238341ef358dfddb0a42f20b9ea0
-- 
2.47.3

