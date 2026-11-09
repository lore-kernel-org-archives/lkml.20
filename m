Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227351;
	b=ITUQ6sRmhllsXlYboWfAoBvp4aF0OP7Cov9KbG3dWttkgnMsHsMs3vPwd6CrwTKfa3rF
	 VzFu+b3L1iMIb5GSIV0DcbCrTj0mWvK9at/0q8RQ2b2BwGS25o64F/nmxaTPqp2l/NqJB
	 WTFtfunhMrPLO+dOEVt6faaSFg0vUnUm/fZRYmn1S/f1rg8Mp3U6dc+CTv99XICk8Q3bR
	 opxX0DkpwtbzZAGe4Gq2R0G99Gz6Agbdlo6EWXcEnfYgEhXodRx5b7Y9/BR0mqAv9Swzy
	 2zPjSYo1pwaCdMInJIHaih1KkyajxPPdyZy14X5ZNWLp7KJhPDvoYwjUubCcOOad7vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227351;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=V0W1Omuc5qLlgrYlj61ga7Sw6NBA0Vf65IbGqtBQXEs=;
	b=cpst0YhwL7hqtefwCNnc2l7FLkchSFoFDpORdKVgBlpW44iWSqlS3AVYfAgJ3NY7UNr9
	 iCCYKYEGUTN0/oFwC1lMZ0RhaN3fm5TQlKtfgTspVSf76uOPVuABTQhR77cSDdirPeoI3
	 15jy2jizovAoijhqZzhOrFNycgGT3SGWIiBy3otp0WsdJ/jEu2hkc0oYKeYLLtpw8Baen
	 507NpyRYCxTOpW/jTycKvuN0sAoNv48loH3vw8HgrXqeQmEa8xPwFL4f21JIF5ilI3COY
	 EkBCrSLRB+nfbzEoLPTw7wnam3w9Itc4z3o9o5Gqemt8UWcGnU/G39xwklZ1KntQUgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JniN2JPj;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BCF606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59BCF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JniN2JPj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794227350; x=1825763350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ri+0JSXDDpMzIF/go23y54HD4lk4Q1T33paLw4rI6/A=;
  b=JniN2JPjUmroKon8XyK37KAnRM2lyWqVRixyUadbUhxldfOCxZkX47cs
   WRilNTQa7U11U1EQ7bJx+QXOUfzWaSHIdf33BO2hI/KukJ6S9wtSAM1Vs
   Q2bKSpAYTcQc/LvUahRANuCRT+xRLUB6USyOVWsf7/f3fM3vBVp8VMaVG
   NtkB34UKytvukqXCeFClVfpajeVCi46O6VpssHZvqr2gKOwl95CsXgnIA
   TxFbzYnpAglDCC80tEu6Vt3GBosFF13eKAHXydshm7w7s4SOi0tanJM0I
   5qi/gJTrq1WUjTJ9wPbA/0KL3GH7QaCpKP4ZpddJQ7pBlN9EHxpV+BUI9
   w==;
X-CSE-ConnectionGUID: Zx5m1g6WRI+f81FLjmqqeA==
X-CSE-MsgGUID: UU1x58HnTa+TpngGiM6zFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2972280"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2972280"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 04:29:09 -0800
X-CSE-ConnectionGUID: YnSFwxRvT2GBX1KbIGpbTQ==
X-CSE-MsgGUID: B1TdXyuVTu65IJKn7yVtXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7735109"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 04:29:04 -0800
Date: Mon, 9 Nov 2026 14:29:02 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yuehong Wu <wuyuehong@cmss.chinamobile.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Breno Leitao <leitao@debian.org>, David Gow <david@davidgow.net>,
	Tejun Heo <tj@kernel.org>, Ryota Sakamoto <sakamo.ryota@gmail.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Marco Elver <elver@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Kir Chou <note351@hotmail.com>, Lorenzo Stoakes <ljs@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Petr Mladek <pmladek@suse.com>, Eric Biggers <ebiggers@kernel.org>,
	Guan-Chun Wu <409411716@gms.tku.edu.tw>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Antipov <dmantipov@yandex.ru>,
	Thomas Maarseveen <maarseveent@gmail.com>
Subject: Re: [PATCH v2] lib/tests: add KUnit tests for the priority sorted
 list (plist)
Message-ID: <avG8jvXXkVSA4wkG@ashevche-desk.local>
References: <20261106-plist-kunit-v2-1-yuehongwu@cmss.chinamobile.com>
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
In-Reply-To: <20261106-plist-kunit-v2-1-yuehongwu@cmss.chinamobile.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 06, 2026 at 10:18:34AM +0800, Yuehong Wu wrote:
> lib/plist.c has no KUnit coverage; its only test is the in-module
> plist_test() under CONFIG_DEBUG_PLIST, which BUG_ON()s on the first
> violation and does not report results in KTAP format.  The code has seen
> three regression-class changes since mid-2024:
> 
>   commit c8dab79f9eef ("lib/plist.c: avoid worst case scenario in
>   plist_add")
>   commit 95d4b3450ebe ("lib/plist.c: add shortcut for plist_requeue()")
>   commit 43c91b152243 ("lib/plist: fix plist_requeue() corrupting order
>   in the last bucket")
> 
> The last one has no regression test: plist_kunit_requeue_last_bucket()
> covers exactly that wrap-around, and the other cases pin down the ordering
> invariants the previous two changes rely on.  KUnit coverage makes such
> ordering regressions visible in CI, where CONFIG_DEBUG_PLIST is not
> normally enabled.
> 
> Add lib/tests/plist_kunit.c, a KUnit suite that exercises plist_add(),
> plist_del() and plist_requeue() and validates the invariants documented
> in include/linux/plist.h after every operation:
> 
>   - node_list stays sorted by ascending numeric priority (descending
>     priority order) with FIFO order inside a priority bucket;
> 
>   - exactly the first node of each bucket is linked on prio_list, and
>     the headless prio_list ring visits the bucket heads in node_list
>     order before wrapping back to the first bucket (a single bucket
>     degenerates to a self loop on the first node).
> 
> The fixed cases cover bucket head handover on delete (first, middle and
> last bucket), the plist_requeue() shortcut with and without a following
> bucket, requeueing the head of the first and of the last bucket where the
> ring wraps around, the INT_MIN/INT_MAX extremes, and plist_first_entry()/
> plist_last_entry().  A deterministic pseudo-random add/del/requeue churn
> test mirrors the in-module test but draws priorities from a small range
> so that multi-node buckets actually occur, and every requeue in the loop
> moves a node (a requeue without a same-priority successor is a no-op).
> 
> The suite is wired up as CONFIG_PLIST_KUNIT_TEST next to the other
> library KUnit tests and is enabled by default with KUNIT_ALL_TESTS.
> lib/plist.c is built into the kernel and exports none of plist_add(),
> plist_del() or plist_requeue(), so the test cannot be built as a module:
> make it built-in only (bool, depends on KUNIT=y), like the other KUnit
> tests that use non-exported symbols.
> 
> The tests were built into an x86_64 kernel and run under QEMU/KVM with
> kunit.enable=1 kunit.filter_glob=plist*: 17 of 17 tests pass.

> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202611052109.GqbzRkv1-lkp@intel.com/

New code may not be reported as a regression. There was never the module
present, nothing to report, nothing to fix.

-- 
With Best Regards,
Andy Shevchenko


