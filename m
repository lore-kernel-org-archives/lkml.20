Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911635;
	b=KmaUh8d1MBUTqPS98r0y3i0dbZPHx262IbMxp5ZJU7ETBX8pkuQ4rCb4JAznobdHFiEo
	 smjg1eatjSMsrLH5IZg7oucJFuQRaQC/dXSheoEAozlyDiCto9CMi2IPZ/XGsTq7PWfpo
	 S99fBMWI+FWdYAQxKCYOXDNV2h0MiYdIGwGg3hjCSqEEXPGfMmsuq2SKijEqdGZcMYL0R
	 pRe5vnCptW4DiA45UwebjfSDaQfKyeQnEgkBitttHvq35CZUZd9Ahu2Ijkqrkx+3KcyYd
	 +ITaOzw53px6hBY0WUt8n1+VE2feVz/P/WjNVqC/WHWkxNFWqWw4tXpNR9sW7dNx5/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911635;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=knxi9pCrgcRrxVqW1ZkgE5rujot+Di3t9F1ekLlywFc=;
	b=Dh/ZtJiRi1wE41795ipKIaIMOUNCyGqNRudhWlpcwex6IfnKU4cqzex6RZvtMGeLr1Cd
	 j5VAiNTr9kfeaLu/ybNqtYMrfS1R1m8zWDMCw22G79hgvL4/j7079mAEHZD9BfTD3paXH
	 8oVI8yIm0M0XNv9AlnME0GwCzAnVjcjDEGqB8l5SBDeiZNjVxdiDuBJh+Dra6GCaqC4ql
	 kt6mI+p1RuVRAGzsbCmZzrels6nL11j7uddfaUBx/WYwE/belBYsu+Etj9Qwl0g3l/Wxu
	 PUpIcHVUxjkSKOk1eSwkskCOi5sf9umTPfvOCdo509adhkrUCFD/Fjvm1pEeDp8BlbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G5kicYuc;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1657606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1657606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G5kicYuc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794911635; x=1826447635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hVfhAUSfmuebbPUJKybbl/2j1UkGxAMhS5V3FDC6eec=;
  b=G5kicYucM1XQ2h3/rPkzPgdbY+orv9KsswaoSKznCXNjTJaAb0W1erdl
   Lz0ucyzCO3IrxN6/3rXiSq1KoVsgwlZswWihS3nc2CWxXhCq+ZQgN9xwF
   DPZcUxNAuwFPfbTKKYwRZhy7nBg1U+Xjd4/fHk1YHqGehAnRDUPryotz/
   5dCiKlKTIa4YzXU/90qPKhasQnRsRBnWnA4SEgGbH0Ld30thGrwKNdRzs
   MCoJWToH8luP9mirRxr7IU89QsQtUe8pdJWZwEExFPXusjXke32UXEhjM
   +JwuhPq064mAJezlyLBcbVd8Jw1msbwUIAHVP3ED9Ooty3veMu2vttTn6
   A==;
X-CSE-ConnectionGUID: cseIMtudS9S00tFEssp/Wg==
X-CSE-MsgGUID: 0kuki6j2T1GmVrDiuHIOzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3576303"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3576303"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 02:33:54 -0800
X-CSE-ConnectionGUID: tKcKbobjQlKBHrng07NZyg==
X-CSE-MsgGUID: Bcn5cq6LQlqzOIFxAPMEWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10030444"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.254])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 02:33:52 -0800
Date: Tue, 17 Nov 2026 12:33:49 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: ojeda@kernel.org, andy@kernel.org, geert@linux-m68k.org,
	pmarques@grupopie.com, akpm@linux-foundation.org,
	maxextreme@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] auxdisplay: cfag12864bfb: Fix init cleanup and simplify
 error paths
Message-ID: <avwtjc99XzpRzj4z@ashevche-desk.local>
References: <20261117102728.1304012-1-haoxiang_li2024@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117102728.1304012-1-haoxiang_li2024@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 17, 2026 at 06:27:28PM +0800, Haoxiang Li wrote:
> If initialization fails after cfag12864b_enable() succeeds, LCD
> refreshing remains enabled. A subsequent attempt to load the
> framebuffer module can fail because refreshing is still marked
> as in use.
> 
> Flatten the initialization flow and introduce cleanup labels to
> release resources in reverse order. Call cfag12864b_disable() on
> failures after refreshing has been enabled.

Can't you use platform_device_register_full()?

-- 
With Best Regards,
Andy Shevchenko


