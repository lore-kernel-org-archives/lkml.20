Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2944DDB49;
	Wed, 30 Sep 2026 13:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774000; cv=none; b=aR6qAKDA+Cf8tXCmiP5Dfjahw3/nirEhgaK4Q3xHk7vWL+ou6ArNZpvur2WvLtwBFc+nTbEtuRcUweVPdn9EEAH/a5Y2toLUtbZeuYsipdlXbP/YxIsN0JXNre5mPX326pw5P0m3Vvc7GW6fpAKJ3Asr/2LMP7FukoyTZTAMKwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774000; c=relaxed/simple;
	bh=IIPbuWS7GhpGNpz5uNLZEeIlIQ0aiuT1u3+X0thxmNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dfu9L7kmXPJL3qgkSDjQxlqQgFRC2PpLgS8gtqsvPjSkQwbIJLOXX0elN5mURkTKpJHFOkILqBUqqSocTg87ies4uka9hnoZtrtC0fUHDyB3UZE0/og+vrpnBzqUcVujc3jiy73HhQkylTVW5pRP+4aNYCV7ANH9qn/5BSuBh08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jaFB6DwS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jaFB6DwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790773989; x=1822309989;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IIPbuWS7GhpGNpz5uNLZEeIlIQ0aiuT1u3+X0thxmNM=;
  b=jaFB6DwSV3p7Gyk2HC4rA2eq79R2YcmD2PQjvG/8Rvx++7R5Xof7b1Q2
   sH7+XzvMV6/fqxLp+Q2r03g1lfp0ki6iElrCDXfH4racP2C5KhC568wHf
   Bcmo+qiToJc5vtjFBKQLXvz8oDL2+45JJGzdILOxrIKzT1d+Suu4iv2+O
   8GYs6Jk7VqwkRj6vrqCU0rCoS2KoSZz7aYHdtCgEcX9u4CKVgEMy0xT/p
   j9zM67EEo3pmK2+T6WwfG+5fPyJ6Uix5kHLyyweLxkngfq7qhkaSDL+Dw
   9Yiyu4/TxuyMC2X2hVXVdRoluo/gC2xDv0qen3uHUsWgTqXIrLFVYKPB7
   w==;
X-CSE-ConnectionGUID: Vi7BM3/DSsGaX0Sey1R5iQ==
X-CSE-MsgGUID: P41LcUWuTlSij78QMYfzUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="93995471"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="93995471"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 06:13:02 -0700
X-CSE-ConnectionGUID: qg5pKsKPTVWdM3xtQZGEng==
X-CSE-MsgGUID: IEOAYcJETKqtFp/emHjrCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="283753449"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.78]) ([10.245.245.78])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 06:13:00 -0700
Message-ID: <f13481be-9692-4657-a02b-5cdf6e803133@linux.intel.com>
Date: Wed, 30 Sep 2026 16:12:58 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: fix typos in comments
To: Zain Aboobacker <zainaboobacker33@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260926162518.25301-1-zainaboobacker33@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260926162518.25301-1-zainaboobacker33@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/26 19:25, Zain Aboobacker wrote:
> Fix various spelling mistakes in comments found by codespell.
> 
> Assisted-by: Claude:claude-opus-5-5 codespell
> Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>

Added

Thanks
Mathias


