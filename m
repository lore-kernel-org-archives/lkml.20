Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2C619D074
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789345087; cv=none; b=dMzSmuJ3nR04EmgUdNDorusZCDEFApI5nGGFVFqOu65//8Tfvif6Evs4b5FHycfgn3983wmNwFDldMPj+rdaE56SmFLplDUPi8QGQ0llr3SuRwexz8FCuYN7KU+tzle9Lb+tCVR/U0oX69HTdFboYfUlrZzdDG0/E7XvUn4WI08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789345087; c=relaxed/simple;
	bh=vCNmjz3mHu7OjzMHN2/PFAnKbHOceq3ckw4wxm26X5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TUynwcGpk3VR1a6ehAWaG3cNTCU6hkOyePlJuSxRMsZocCdDWEjsIQuN4HdH+6wojFpzmYcLrGZJxYx24zQd753BpFLezn2eJGqe240gFt9fPkxfOH3/Lc9tuNoBsk+RSK5xx5xqhG2vIPrOLF3FUag3OnXfGeZufOY/KxvtFm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Obb0c6NY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Obb0c6NY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789345085; x=1820881085;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vCNmjz3mHu7OjzMHN2/PFAnKbHOceq3ckw4wxm26X5s=;
  b=Obb0c6NY/hQ5SyzWjV38Nt9MUyaBNNYrVDMLZyveGazUKzyAuKNIVniw
   URsjigu2ku0SQuWuS+hqOBMUnbrmnC/8JaEt2LoOijOW1DobSI8KlisiD
   MsKodLXzhyjCChuZmas2nXR2YWA9IuJy6fOzt6hzFQabzyZ7CnDlzQ/sv
   fNLyaELyuIZoK29MnWxWDKdgpM73WjxcFQ8Jom8+tf6df0tuYB9dNjLj3
   npK8z1DJNeIdqzENa4yM8Ips77xh3Oucp31PPqKeO35vQwA2Xdo9G7Srg
   4iHEdcH/UEeaRDjdgYrwUkzZtbSCDu41OqgInSIOw6dr2BcVIiGesrzj1
   Q==;
X-CSE-ConnectionGUID: Uw3hIa02S2Sls3ramnatSQ==
X-CSE-MsgGUID: xPQ6+yaqQy+z90KPodVnkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="88844582"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="88844582"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 17:18:04 -0700
X-CSE-ConnectionGUID: 5UJSmWAmTEOJT9pugfY77Q==
X-CSE-MsgGUID: xFzrN+YuQBmeFMqV8SZMUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="269209145"
Received: from dwoodwor-mobl2.amr.corp.intel.com (HELO [10.125.108.110]) ([10.125.108.110])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 17:18:04 -0700
Message-ID: <2a15ec49-7b83-4881-a9ec-a1193602eb4f@intel.com>
Date: Sun, 13 Sep 2026 17:18:03 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] x86/urgent for 7.4-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 Vernon Yang <yanglincheng@kylinos.cn>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Orson Peters <orsonpeters@gmail.com>
References: <20260913225356.1033865-1-dave.hansen@linux.intel.com>
 <CAHk-=wiSPMB4tZB4mngU5wUJ3qJj5HwKc7x2E1dj4YnxCGadeQ@mail.gmail.com>
Content-Language: en-US
From: Dave Hansen <dave.hansen@intel.com>
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <CAHk-=wiSPMB4tZB4mngU5wUJ3qJj5HwKc7x2E1dj4YnxCGadeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/13/26 16:10, Linus Torvalds wrote:
> On Sun, 13 Sept 2026 at 15:54, Dave Hansen <dave.hansen@linux.intel.com> wrote:
>> The MADV_FREE one is notable for silently losing user data and having
>> been around for a couple of years.
> That explanation rewards horribly badly.
> 
> MADV_FREE itself is fine. It's *supposed* to drop dirty bits and lose
> user data. That is the whole -m and only - point of MADV_FREE in the
> first place.
> 
> The bug seems to be elsewhere in non-MADV_FREE code that then just is
> confused about things. But both your pull request and that commit
> message seem to try to blame MADV_FREE. What's up?

Yeah, the explanation isn't great. Sorry about that.

My read on it is that problem shows up a bit *after* the actual
MADV_FREE. The manpage goes over this scenario:

	After a successful MADV_FREE operation, any stale data
	(i.e.,  dirty, unwritten pages) will be lost when the kernel
	frees the pages. However, subsequent writes to pages in the
	range will succeed and then kernel cannot free those dirtied
	pages, so that the caller can always see just written data.

So the problem isn't with the data which was around at MADV_FREE time,
it's with the "subsequent writes" that the kernel frees.  I _think_ the
main way the kernel tells if a "subsequent write" occurs is _PAGE_DIRTY.

So the scenario is something like this:

 1. First set of data goes into the page
 2. MADV_FREE performed, clears _PAGE_DIRTY. Page eligible for reclaim.
 3. Second set of data is written, sets _PAGE_DIRTY. Page *in*eligible
    for reclaim.
 4. PMD is mprotect()'d which flows through pmd_modify(). _PAGE_DIRTY
    is lost. Page now wrongly eligible for reclaim again.
 5. Reclaim goes after the page, discards second set of data.

At least that was my read on it.
