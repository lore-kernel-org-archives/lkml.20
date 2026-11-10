Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303508;
	b=JMpWmPfPZTkCTUKozIxLpdOgJHwJDulznO8Y9Z1ChcFQF9GdDvp+6kGcRg/f6lS0Cvl8
	 wP3UjRmRl5ylbphaUUjfckO76CTZuIUKyYVosACBXtja1N6yjlGmYuQAoADT6P9LogfhM
	 zv/xV/znG3+ompZHN3QNxJYeurECHY1NrI9FvOQzMBq7prYcjYd9xv8iL15b0+0mcWmeP
	 C+E+gL4LZHZaUerejOvLbs/8ym1QQQDHvRZksLzr2TD8nSi/2tZZrb6Bs0aZzozFOsbt+
	 LKQnMgxYfwMn2f62OnbpP3GebcuwHtSyH6fNiHGcbqfjlKoDIvH5oeoTNrRNbblBryw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303508;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FNBnF5z+qlyzuaTI4Z6q/k6karpzVQwZhjUK109S5fE=;
	b=ool+N8Y8JS1AnMdLZVzg4rg9H5NkJ508b4zXxWuYWy7FmklVEu60cIdegGVmAJA3vKZq
	 i7YdbZ9Eth8IqVKNhVTJ1fILtlpl+0V2xoHKnPFHhMBMINgpoj2EVwlnooNL42Fz9ujPP
	 qRovCBaX9J9WZQI7lzSscAtqyPZM5/C2OuKkFJClOx8+nE4pZRNHvynSkj0laHdUeSFXh
	 yvmLX8ZVuotW09SGj6xpAc//Ijj430DC3gdwwugdhVGotMSqI9ZTp4Jx+lFtO4Fx70lth
	 MZKQ59pZmorxfCxHZ45MX7kl4Z7hyUKfsVQERjSwgwSy30V/O8TiMMluaQhOEFuR+QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="L/73yIBD";
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C891606A9A4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C891606A9A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L/73yIBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794303508; x=1825839508;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kEqIwbcCOfNd4+PN9qLSem2g9APgdKjSTtiBZRVhHWI=;
  b=L/73yIBDtMHlGA66OopPHn0g0zvmvn98fNtdXOGhah06Zu8kzBBPTAAG
   J/ejfcWq8zHzrDG2sCrKc6A14w1gQqKB16xu/ayFYgLk77pOIHvSqJwNf
   p4JtHyftRtGbEgRKAKQOoFUFFseN7lSvNUFusUdrNOmrtb0N+Q+d8Axrh
   TzZ0bLnv/jv3YJeGrqtywWfAvsUR5FS6pnC9uYHZfjrBeqw67xIq0xpB7
   1M/zFH6crEL/Xniq+xIzVTsz6hwwlRoo/k0ENV81YJ+i/ld3bVKzC8LeX
   K0ioFzkrSjFL7UD3hF8JRiR8AdS8GM6yy9FSEuLLlTj+D1HONuAuItmyl
   Q==;
X-CSE-ConnectionGUID: AD67spEvTMmiOIOsA8xkkQ==
X-CSE-MsgGUID: mJyfTC4SQCOlH6pLJaOzqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2961818"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2961818"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 01:38:25 -0800
X-CSE-ConnectionGUID: UhEAkUoeQu27HIEPNxSG3w==
X-CSE-MsgGUID: a7LUaSiyQwWMylEpQvpA4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7975225"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 10 Nov 2026 01:38:24 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 20CA49B; Tue, 10 Nov 2026 10:38:22 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/4] regmap: Switch to use kmemdup_array()
Date: Tue, 10 Nov 2026 10:36:59 +0100
Message-ID: <20261110093820.454682-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261110093820.454682-1-andriy.shevchenko@linux.intel.com>
References: <20261110093820.454682-1-andriy.shevchenko@linux.intel.com>
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

Let the kmemdup_array() take care about multiplication and possible
overflows.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regmap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index bc4e53ce8ecc..e327850ecc97 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -2595,9 +2595,9 @@ static int _regmap_multi_reg_write(struct regmap *map,
 		 */
 		range = _regmap_range_lookup(map, reg);
 		if (range || regs[i].delay_us) {
-			size_t len = sizeof(struct reg_sequence)*num_regs;
-			struct reg_sequence *base = kmemdup(regs, len,
-							   GFP_KERNEL);
+			struct reg_sequence *base;
+
+			base = kmemdup_array(regs, num_regs, sizeof(*regs), GFP_KERNEL);
 			if (!base)
 				return -ENOMEM;
 			ret = _regmap_range_multi_paged_reg_write(map, base,
-- 
2.50.1

