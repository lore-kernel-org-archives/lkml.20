Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556425;
	b=YB0fxcbPUaHSS8BfOVqrkOZJCDigEOg4JSjrreuoWjwi7t8YqHnugYSLlcysuf8o6byj
	 9Lj4udQpPJMXNtUfT0M1svifTSGyZFGJ1z/pEBJOHBscJoo1ubVJ+Ag2+1YZA9u6ZRIBk
	 /zsU2SSKjqTKpqY7sjZn4oHkKjAi6yoEEKqS6fqaaAhHMVWTOloK8plrt6CmNSdEoDr2+
	 bDsfoZWho0gptEu1wdDZ3RuosMWKnvQbsjQ1rraz53XKfKf7sCekCmTtP76lyxFRL4Rh9
	 tk2KOdaytmSZddVIS3ZUjrwuEoAjAzo4Tr1/3B3g2+q5ilAgeMwEPaxnoJjH+MJM5ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556425;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CuBjlJhdzOrqOW7FazDIjFnia92qOxigqhgEQXmfmMM=;
	b=DVUj3IzZRx8XSsKkbK1OmQkJXuHt8nQIIzMirFWyUrW6Tf+Zltwme8R6k0OCs3rg19y1
	 lAZpWfCJuP11hO1gZqPHP6TAgd8wW9ze/msd1QsufYOuW2TPpcjYVf3ZpXVuahwpFfggH
	 gHDqtU85XbHlmmoGP5qNCwWUY1CyDctX0NLSwUXh2ft63Vvq3oxK1OO0/qT5IsHGVcudo
	 tEPev9p+cMEEh0fEldIgEtiWAK1jCKkPrBOXw6m0+J/ZPj5qOTDB4C5cMUI2qeqd+OAO6
	 3vXrPUIfp88RKG69okqQ9MZktmyY/3UzuZaKhTSb/9wmiGLsfjGctj7PqFLPjdrOZ5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JzrrRqqD;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF822606A880;
	Fri, 13 Nov 2026 07:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF822606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JzrrRqqD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794556425; x=1826092425;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ccjmimuf5uzssdKBEbZnKI/cNIv+9rYcI0MozPt/Tzo=;
  b=JzrrRqqDuZMDfh0VSQFt11ktraBDndRf4Dd2NG1tduuPBuiF1D4gCj0O
   QGORsWB8w06509ADP6qbydt4K3+agaVv4+0Uuq6A3xx8pjyr2b3nF9Xt0
   AFdwn1AOOGcGy+nClcBSD8ACDOKcxUSn13uG+Mk58Yn2GsdlFXoJhfwVx
   FIX9L6HKjAqe5hmINeoEkEcYlQHXalrq6LIckG7xEXijkZ3lT8qBAfWz0
   FqobsJ5nwJKRzqY53gG2P/2obwya6qmAtGdfRZxDXQqH4fxyuaLZzly7e
   MRuLGpPEnTj0n8RSFLOz9HczagAfOXmSoxP3XeyoF3luoEmt529Clgxik
   A==;
X-CSE-ConnectionGUID: 8wYdqew/RuOqCMirUsH1TQ==
X-CSE-MsgGUID: CP55n7RNQ46WmCaECxgGTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3223870"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3223870"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 23:53:44 -0800
X-CSE-ConnectionGUID: jr2YH7EfT06t82FLaNBoTQ==
X-CSE-MsgGUID: dNPAAql5QlyMCcWfVjMm2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8773900"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 12 Nov 2026 23:53:41 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id A703499; Fri, 13 Nov 2026 08:53:40 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hamdan Khan <hamdankhan212@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] media: atomisp: Inline one time use __IS_SOCS() macro
Date: Fri, 13 Nov 2026 08:53:39 +0100
Message-ID: <20261113075339.2561993-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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

__IS_SOCS() macro is used only once and there is no sense
to keep it separate. Inline it into the IS_ISP2401, which
is the only user.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../staging/media/atomisp/include/linux/atomisp_platform.h    | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 0d6f2a4039f1..81b58a91bb9d 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -168,7 +168,6 @@ void atomisp_unregister_subdev(struct v4l2_subdev *subdev);
 
 /* API from old platform_camera.h, new CPUID implementation */
 #define __IS_SOC(x) (boot_cpu_data.x86_vfm == x)
-#define __IS_SOCS(x, y) (boot_cpu_data.x86_vfm == x || boot_cpu_data.x86_vfm == y)
 
 #define IS_MFLD	__IS_SOC(INTEL_ATOM_SALTWELL_MID)
 #define IS_BYT	__IS_SOC(INTEL_ATOM_SILVERMONT)
@@ -177,7 +176,6 @@ void atomisp_unregister_subdev(struct v4l2_subdev *subdev);
 #define IS_MOFD	__IS_SOC(INTEL_ATOM_SILVERMONT_MID2)
 
 /* Both CHT and MOFD come with ISP2401 */
-#define IS_ISP2401 __IS_SOCS(INTEL_ATOM_AIRMONT, \
-			     INTEL_ATOM_SILVERMONT_MID2)
+#define IS_ISP2401 (IS_CHT || IS_MOFD)
 
 #endif /* ATOMISP_PLATFORM_H_ */
-- 
2.50.1

