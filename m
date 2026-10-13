Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD0653CA7C;
	Tue, 13 Oct 2026 20:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922986; cv=none; b=IRUSYvvzwNtD90byB6V4HTNj2YnDp6V4KSo22g65neROZOiZ/SrecnsprMTbjXLwWnOkFlMSinKmYAsDoSWcXHDXPITbgiQgwvgn9nGm577gtb9Y7RH/m7RImzSJYRXkJUprTtQUOCjexchTIqT0H+kLxiTeBpYY4T/r3LyRSbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922986; c=relaxed/simple;
	bh=UiAbtmA5YiRllYJJfAhGiTjLdg2J+gVaDZRoXFqE6cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R8e0/eN0SvzPC0UKeiLyOoyiEBA1XnVG+nNF18fLvRMWw3HfQkMbBtGmk0z3O2zUDGxuixzi0kv0Vq+k5+j4XR4pQO3vHrmusq2OZsAIGptB6UpA2ZWnpfOwsOR00s+hp5EujSfI+Vg/jQ4STa7ffYEPFGPSPRoE2/ICaZHsT44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oj3DT72M; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oj3DT72M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791922984; x=1823458984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UiAbtmA5YiRllYJJfAhGiTjLdg2J+gVaDZRoXFqE6cs=;
  b=Oj3DT72MQ7Xd3eRYqBsOTZO6VNyM93GLRaPjqgwoUt5/HRgggvErcaje
   B6eGGl04ZlNCD7HBxpbj5z8P7T2g7PVj/MDayXI4KXQfS/ktAuIN6T6Fa
   C7iyp3GR9D4lPnrEeyTXHei1nPhGw1Vr2Lv+t/F+5JohAiZgO4s+fdClT
   5uzF5JGUJ7hix9e/uQ8y9Pv3xxfs+3h2h8+VfUJttYfi8378t/Ji8mFBC
   CX6pLDIQT+wc3ac225YM79xIpEp1oTTdkXZk1SzRIrqMujE3zwRZDka+V
   sbiql3DWLak67egAdYhtM8UFEJw2XG/H4eoWQk/QuXn/9IDQCxQzQwXrF
   A==;
X-CSE-ConnectionGUID: gX3Y7xD7QomIzyg/b8ZoBA==
X-CSE-MsgGUID: PVBdFRzNRTy8OH7zstQ46g==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="667892"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="667892"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 13:23:03 -0700
X-CSE-ConnectionGUID: AJNcdoTXQ+CIZ5RMMEwZMg==
X-CSE-MsgGUID: hLwJczMXSlGBgY/rSufGqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1179255"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 13 Oct 2026 13:22:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 882A099; Tue, 13 Oct 2026 22:22:58 +0200 (CEST)
Date: Tue, 13 Oct 2026 22:22:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	David Gow <david@davidgow.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Kees Cook <kees@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>,
	David Laight <david.laight.linux@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	John Ogness <john.ogness@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] hexdump: Allow skipping identical lines
Message-ID: <as6TIm6xE8Izccb5@black.igk.intel.com>
References: <20250319-perso-hexdump-v3-0-a6ba3a9f3742@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319-perso-hexdump-v3-0-a6ba3a9f3742@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

+Cc: KUnit maintainers + Kees

On Wed, Mar 19, 2025 at 05:08:09PM +0100, Miquel Raynal wrote:
> While working on NAND issues, I used print_hex_dump() a lot to compare
> data. But I am mostly working on embedded systems where the kernel
> messages go through a serial console. Sometimes network support is an
> option, sometimes not. Anyway, I often print buffers both in kernel
> space and user space to compare them, and they may be full of 0's or
> 1's, which means lines are repeated a lot in the output and this is slow
> *and* hard to compare.
> 
> I initially hacked into lib/hexdump.c for my own purpose and just
> discarded all the other users, but it felt like this might be a useful
> feature for others and decided to make it a public patch.
> 
> * First patch creates a helper named print_hex() with a prototype
>   containing a flags parameter, instead of an entry for the prefix type
>   and another entry for the ascii boolean. print_hex_dump() now
>   falls back to print_hex().
> * Second patch adds a new flag to possibly skip the identical lines.
> * Third patch is optional, and adds the offset at which the dump
>   finishes in case the last line to be printed would be skipped.
> 
> The Cc-list, as provided by get_maintainers.pl, was returning 330
> e-mail addresses which felt to much, so I ran the script only on the
> second patch (the printk/includes/debug/Doc changes). It gave this
> Cc-list which sounds more reasonable. Hopefully this is a smart move,
> otherwise let me know what you think would be best.

Sorry for the so late response. First of all, a bit of a background
development on my side. At some point a few months ago I asked John
Ogness to give me a private dive to the printk() guts. He explained
to me a lot about ow printk() circular buffer works and that the
implementation is nowadays done in the terms of circular buffer library
and printk() front-end. This gives a potential to get a clean solution
for the testing how printk() actually behaves. The main issue with the
real printk() is that the buffer it's using is defined globally and
for clean test cases the printk() can't be used. We discussed the way
of high-jacking that by linking an object file of printk() implementation
to the KUnit test, but it seems quite a tricky if ever achievable exercise.

Meanwhile Kees Cook seems found a nice workaround for the similar use case
in his recent patch series [1]. The idea is to register custom console and
provide a custom .write() method which is the heart of the solution. On
the writer side user prints something which has unique prefix, while the
console callback recognises that pattern and checks the rest of the line.

I promised to David Gow to write this so we might have some generic
implementation of either approaches (whichever seems feasible) in KUnit
framework. It would be nice to have kinda macro to register a filter
that will check printk() buffer and compare to the expected output.

	KUNIT_REGISTER_PRINTK_FILTER(my_callback);
	printk(...);

Folks, what do you think?

[1]: https://lore.kernel.org/r/20261005155653.late.426-kees@kernel.org

> ---
> Changes in v3:
> - Drop the tree-wide changes.
> - Create a print_hex() helper with the new prototype discussed with
>   David and Petr. Create a fallback from print_hex_dump() to
>   print_hex().
> - Include a new patch to print the final offset if the previous lines
>   where skipped.
> - Fix the typo reported by Randy.
> - Link to v2: https://lore.kernel.org/r/20250110-perso-hexdump-v2-0-7f9a6a799170@bootlin.com
> 
> Changes in v2:
> - Rebased on v6.13-rc1.
> - Manually fixed the diff in many places to fit Andy's requests.
> - Added a real life example (code diff and output diff) with the
>   modification of the API as well as the use of the new flag introduced
>   by this series in the cover letter (at the bottom) as requested by
>   Andy.
> - Link to v1: https://lore.kernel.org/r/20240826162416.74501-1-miquel.raynal@bootlin.com
> ---
> 
> Here is a typical diff showing the code change with a perfectly equivalent
> output:
> 
>  print_hex_dump_debug("", DUMP_PREFIX_OFFSET, 32, 1, spinand->databuf, mtd->writesize,
> -                     false);
> +                     0);
> 
> Here is a typical output of a NAND buffer without the new 'skip' flag,
> ie. with the above code snippet:
> 
> 00000000: 55 42 49 23 01 00 00 00 00 00 00 00 00 00 00 01 00 00 08 00 00 00 10 00 2b 10 f1 92 00 00 00 00
> 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 db 93 e9 fc
> 00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000100: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000120: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000140: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000160: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000180: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000001a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000001c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000001e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000200: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000220: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000240: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000260: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000280: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000002a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000002c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000002e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000300: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000320: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000340: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000360: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000380: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000003a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000003c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000003e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000400: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000420: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000440: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000460: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000480: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000004a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000004c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000004e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000520: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000540: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000560: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000580: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000005a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000005c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000005e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000600: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000620: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000640: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000660: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000680: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000006a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000006c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000006e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000700: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000720: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000740: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000760: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00000780: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000007a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000007c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 000007e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 
> And with the new flag added the code looks like this:
> 
> -print_hex_dump(KERN_ERR, "", DUMP_PREFIX_OFFSET, 32, 1, spinand->databuf, mtd->writesize, 0);
> +print_hex(KERN_ERR, "", 32, 1, spinand->databuf, mtd->writesize,
> +          DUMP_PREFIX_OFFSET | DUMP_FLAG_SKIP_IDENTICAL_LINES);
> 
> And the output is easier to parse and also faster to show on a serial
> console:
> 
> 00000000: 55 42 49 23 01 00 00 00 00 00 00 00 00 00 00 01 00 00 08 00 00 00 10 00 2b 10 f1 92 00 00 00 00
> 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 db 93 e9 fc
> 00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> *
> 
> 00000800
> 
> ---
> Miquel Raynal (3):
>       hexdump: Simplify print_hex_dump()
>       hexdump: Allow skipping identical lines
>       hexdump: Print the prefix after the last line to show the dump is over

-- 
With Best Regards,
Andy Shevchenko


