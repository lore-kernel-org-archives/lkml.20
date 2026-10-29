Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279777;
	b=F0IaGI53h1PH4/VG0SBHCxYp7tk3ThgcUlCdswMyBzcMXy+7Glzu1arbZUI7syYJWPZ3
	 2U1RJbijEdpDUNJgwvzo2tkStph+lw3GcJQB8P7/TU8ePwXSHdSRnlbdT3c+Pz+fr14Q9
	 oZWI0wS1fL1Homo7wfyio62V6VFaFVS4E9FUK9P8KvSYNd8a1d/TuuEm8V3QgBxrAxO+0
	 SUagcm3itWqvcEW6pOTKWSM5IPrWt0+11wemmEF2Ec4nR6PPcgZ8WO1eBm1LTaobjq04P
	 wguTMNrPNwIoQfafmKy+SSQVdQ9o6z9F0z+haJWNSXFUXjWcVbNfqXuQ5G5Rz8H/aEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279777;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=h8u45CNmIEd0bbtYlv6CM92JPz3f01uopFoHms6RdL8=;
	b=5X9hd6FslnifodQFBT+XSEXbWy5bVoyubeRNyPhkWoQfdlhROvQndUhlzZ6Y+f1M8Zzo
	 DRD73hfD5PXGA9ExWDrPOA5cndv3qjh/YmdTanOlC2NoBNzI/9JQj14YndQxsHbljJ7v/
	 VEEKDB3a9NEgrDWx4hDJQiwpPbdfwFwdwOjm7CKBybMYeya9uLO4PIhgcZOvaM9djcWq4
	 4nXPfheouRb6pnRDfmTOLf0QpYZ0SpEhAjTwVFtPzi0GUm3y+SASnFoty2zUiN3hEU2Gf
	 mVnvjS5Sp0uCBBf+awJmLpb33tiWQ8sYnLHFQMMBRG+beZ7Acjox+rJRr1DeFG5oRgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kVtwdqBb;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F202606A31E;
	Thu, 29 Oct 2026 13:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F202606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kVtwdqBb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793279777; x=1824815777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0k351C2/JUZ73k6Gtt6/++UObK1xusuhxkHbZNf6oSU=;
  b=kVtwdqBb0gBFp6ekE5175Bp3nt49RXEk+L/RhfWVskQzLmI1yDiMvSWx
   kPw9Kg8R1Fbf54AVqrpxuxN2cMbZWS3LRt3DFuK97eC58vZ7m4na+9867
   hTtVAbKeSpqtcmEaD73B7YBBqXCOO23PDmT6/WXyL+ETplGOaIOKUFDOu
   d4QSY+k9+nStH0ZyXCguTY0VI7Agk1KuGuuIQyhLpjX4ZOGk1lVYfGJxQ
   q2fX5SWki185ez8GNXZrrWu9mMMh5+UVq/DfiILhgxQkFigXvQqS4YuZr
   KEr3hGCk4T8XrdYEqjayJPvT1k9sZuH2xr+zXCWHegcrsUFmJtVPQpD/z
   g==;
X-CSE-ConnectionGUID: Bubl1s1rQ1W9oLjHyEkUiQ==
X-CSE-MsgGUID: AJjtosgXQhud0lxXQYHGwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2038140"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2038140"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 06:16:17 -0700
X-CSE-ConnectionGUID: Cm6bfeYkSo6Wzv/qwOUJ9A==
X-CSE-MsgGUID: HXNgm2u3SzW0GNBTUrvuYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="6907380"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 06:16:13 -0700
Date: Thu, 29 Oct 2026 15:16:11 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] media: atomisp: remove the circbuf library
Message-ID: <auNHG_JHY9P3xqMd@ashevche-desk.local>
References: <20261027230807.2407261-1-vladurares@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261027230807.2407261-1-vladurares@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 27, 2026 at 11:08:02PM +0000, Rareș-Mihai Vladu wrote:
> Thanks to Andy for suggesting, in review of my earlier typedef
> patch [1], that I look at converting the custom circbuf code to
> circ_buf or kfifo, and for reviewing the previous versions.
> 
> While looking into it, I found that the circbuf API is only used by
> the local queue path, and ia_css_queue_local_init() has no callers,
> so as far as I can tell that path is unused. The remote queues only
> need the descriptor and element layout shared with the SP firmware
> and a few small helpers.
> 
> So this series first moves the remote queue handling into helpers,
> then removes the unused local path together with the queue type that
> no longer seems to serve a purpose, moves the few remaining pieces
> into ia_css_queue_comm.h and drops base/circbuf/.
> 
> checkpatch warns about new typedefs in patch 4 and about MAINTAINERS
> in patch 5. The typedefs are only moved from ia_css_circbuf_comm.h,
> which patch 5 deletes, and MAINTAINERS has no entries for the removed
> files.
> 
> Compile-tested only.
> 
> This supersedes the typedef patch [1].

Thanks!

Sakari, can you apply this, so we have reduced code base (by 1%,
which is significant in this case) to think of?

FWIW, output of `cloc`

$ cloc -- drivers/staging/media/atomisp/
     605 text files.
     602 unique files.
       3 files ignored.

github.com/AlDanial/cloc v 2.04  T=0.21 s (2828.8 files/s, 456544.5 lines/s)
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
C                              144           8850           6077          46523
C/C++ Header                   455           5355          10852          19150
make                             2              7             16            286
Text                             1              8              0             35
-------------------------------------------------------------------------------
SUM:                           602          14220          16945          65994
-------------------------------------------------------------------------------

-- 
With Best Regards,
Andy Shevchenko


