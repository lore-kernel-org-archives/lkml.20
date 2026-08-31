Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EB331194C;
	Mon, 31 Aug 2026 09:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167444; cv=none; b=ridATdR230JLKY8hhkLK5qMZ+Qz46zHyFIlF6e9nY7EVRQVU/e/grKXgjHqNsGAlrG9ASr4ptdwI2De+3n/AHI+6oL5ZER9rynxh/xS/E7bxbCB0ifw2ugrEary9MKEeGitQFMNK6SBgtD41pjg9tqmNsLEqKN3ENQQgySphXIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167444; c=relaxed/simple;
	bh=yvUhS7EZp/kwZ0VBhmC55b9Mm/+ldXFM9PZMJiOtvrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kugs0DJ71xx/iSSAisgsmYEEti0CuoP13j5lvZYy16Y0ErdDAQxqFMiDMyqS3WGFiPgD92aOupfk1BQLCvaYhdB1o0W1ZJmjg7a9r+c9NtCDCictBVIY7qQRIdNjE/H0a/LdL1o0pyHi/v+Zz8OT4vMxrbrq/fUvGBeHl2n9i9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cIQ2GdHJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cIQ2GdHJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788167442; x=1819703442;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yvUhS7EZp/kwZ0VBhmC55b9Mm/+ldXFM9PZMJiOtvrQ=;
  b=cIQ2GdHJ+YHTOwFvSyQl5Uus/dpoIAJ7HexOes7U/0fbjQYmF6WzKPjp
   qDDXQLohAZ7F28T9eJAv71bTue153byAwXelspmzyWN5FzyNQzhFIGIaO
   cgj8wHcRAjpcYX0BISGV4kwTwn+EOx3JJQkKpV6yqbDV54m9/xYLRn4aL
   Wed15KrxEC/FxAkbYFAZorLGZF5hCDh88uGC7CgzJA1nDb2aQ8KncRoU3
   48bwurRorynSjfMO5VnR5KJBARKEHss3Pnj/fdc5Pc2HKjl9YQMD/q1Ai
   BWoKh+PGIjWXkpKNywX+Axjl8Scy2LXnjBeFn/ksq+2PY/OsG7p6kHy/1
   Q==;
X-CSE-ConnectionGUID: LUs7dSaJRLafbsaexCrDVA==
X-CSE-MsgGUID: galGWDidRh2oCpsSNmjWCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="76117732"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="76117732"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:10:42 -0700
X-CSE-ConnectionGUID: jFHXD/yJQjWAY5Z4aRt6Sg==
X-CSE-MsgGUID: 33XPKSQxQYSEMTXQ2BAjqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="265503471"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.244.13]) ([10.245.244.13])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:10:41 -0700
Message-ID: <a03c0f9d-02da-4dae-a17c-83412f24566d@linux.intel.com>
Date: Mon, 31 Aug 2026 12:10:40 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: fix maximum event ring segments calculation
To: oushixiong1025@163.com, Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
References: <20260828105926.930033-1-oushixiong1025@163.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260828105926.930033-1-oushixiong1025@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 8/28/26 13:59, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
> 
> Commit 6d45e9556d4a ("usb: xhci: standardize multi bit-field macros")
> converted BIT(HCS_ERST_MAX(hcs_params2)) into
> FIELD_GET(HCS_ERST_MAX, hcs_params2) << 2. The ERST Max field is a
> power-of-two exponent, so the maximum number of segments is 2^n, not
> n * 4.
> 
> With an ERST Max of 0 (as reported by e.g. QEMU xHCI) max_segs becomes
> 0, the event ring is allocated with 0 segments, and the resulting
> zero-sized ERST allocation trips the page allocator:

Thanks for the report and fix.

This issue was reported earlier and is address in:

https://lore.kernel.org/linux-usb/7e6648ad-7459-4248-8c6c-227cfc2586d8@linux.intel.com/

That patch is on its way upstream.

Good to get verification the fix (very similar) solves the issue for you as well.

Thanks
Mathias

