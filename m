Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793040645;
	b=ojmXeBly9LckfSMMYIRMw0PIx/LxW79sgroNeXELdmUX+cyEkipf+mj4XPixrWS2FLpr
	 rHAFTP9M8m6rclAXkE6xg0xjuoh2K9IOKjwZ3mI4DXyDdnvaLJwI6zGj0SnW/7U+SDCvS
	 PsK3SCatp7CtLEPR6G+CeO7zDbsrEKoGC6fcifUxF4gdhbbkeOmbnPIfoWj/9bE+5iZ+S
	 ELpFqa7qGuy8LkLcTJ6qO3p2YWZGmRlx7juUMCY6mZhmc0pobpLlAv+VjmtF0qwuxWqXh
	 YouTveH+s5yBXomSXvi+wDp/6gTY/6TaXEiQuZSncpTGBv94ONV5BIXwBA7cHKwOqoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793040645;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=aqyRinzTQgRsXVFpOli8BiDDp472DEXHPmsqC9GND2c=;
	b=nO38x84JILcN5iAzjyFotQuY3Zi5QeD8SKFLU+d7AfiltstqOnJNCE5XAxonvt3AVTFM
	 x1t1a+mRtoGSOvOtXgvycVxXDwMAPUqmGYvzGi0SCZQ44JxtxGBtNzWV3kJgNh7y4lDb8
	 DVwFP2TH32hA0Y4TY1Kvlt1ejzY1/MliOKKyTSLyWxwI5K593Y1dFG3Te6aDGQuFaLO29
	 kHId8gvvjLi8wr2Xc5Ibnhy9bcKV9vIq2ok0Bf00gVf5rRlrDZvUxM68ohELbOgkEcty9
	 9heIke4RFHmKulLawwo+APrfRQeFtzhMs0qwEWnX2oUzX+k3xWltvwV1xNm60I7m+pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KeU8zkmN;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBA7606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BBA7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KeU8zkmN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793040645; x=1824576645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yStS4NNivNOd7OJgZO5WssRf4+X3rXvDYJ6fhiDnayg=;
  b=KeU8zkmNt3RJReH86lgWt2c/7+fvNUf5aZVuUevUpQbq50HQ27af2rtu
   TdY337CXPn0trd5rv5kDqrYXQJ9j3CXeRWMGkpZE6iRaOQWaTb6QZWDdc
   9nCferCND7jWdhSkQifZIVJ1WfmySB/SGvyeP/pVZo1q/ziVRwZ48+O6L
   GDkHS3WcJe+4k3LF13osngG+LIu5/KqKfctp6zVs3eTc8IMgt0pnPkPk0
   yACj+h6z5BrqNhNVfigzZdDulumJRvcbP0ip1yBjWsWbClBYvdyHIFF6j
   9hQWnlv2Mbo4Re61fhGyCr/CaaiT55uIugKUYrAyjx4bUDrHD77bOeJ2u
   g==;
X-CSE-ConnectionGUID: 49/0toloQTKKEhyJ9YBABA==
X-CSE-MsgGUID: hx51PrWkRq6/Vu4el7z49g==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1716495"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1716495"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 11:50:44 -0700
X-CSE-ConnectionGUID: q9b3QmQMSbuyxvml99Gy6w==
X-CSE-MsgGUID: 7hgNfxKJRQKf7j95MiBvHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4447356"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 11:50:41 -0700
Date: Mon, 26 Oct 2026 20:50:39 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Chris Down <chris@chrisdown.name>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add new "printk" mailing list for PRINTK,
 PRINTK INDEXING, and VSPRINTF
Message-ID: <at-g_x2vmOT4Ljqc@ashevche-desk.local>
References: <20261026160128.12581-1-pmladek@suse.com>
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
In-Reply-To: <20261026160128.12581-1-pmladek@suse.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 26, 2026 at 05:01:28PM +0100, Petr Mladek wrote:
> Reference the new "printk@lists.linux.dev" mailing list for PRINTK,
> PRINTK INDEXING, and VSPRINTF subsystems.

The order seems follows the described and checked by checkpatch.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


