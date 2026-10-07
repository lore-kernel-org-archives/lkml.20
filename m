Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E08C40BCC2;
	Wed,  7 Oct 2026 09:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365896; cv=none; b=VshJ9GirqRWgB7x8gA6BQ/uB2P07u0edIPDlrAISgfWPv/gi6dYTJZsfkJMWQaDVHOqUNLNFe35pHleP+LbFe2KRYYKSyrpZsHXfO0Z17IzIBvgEJlePGe15Xtf4JAueltsktUzBytubpMr9xlA2ZIP6sG3VcVFDGqHVGC/70FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365896; c=relaxed/simple;
	bh=0HphXfl1ajM1Zq2lurdwlhlg9ag4DZGOHKTtijLAqG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OzOsE1mqMf6xlgo7vQ4CUtjNNnMWTbkF7R5CcIMKypSjZZ7HBw8fYD65s2IWmYMz4Nln2mznXK9z0gNLG+UoPPX2T5G+eLkQ7qA6SnHGWAMJLVxjvLPGPTZYA536i+GclfZoqt2wt+5iRwNENHbd/uHvS1nI9JFzUuD2Epor/UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EmPjROvi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EmPjROvi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791365886; x=1822901886;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0HphXfl1ajM1Zq2lurdwlhlg9ag4DZGOHKTtijLAqG4=;
  b=EmPjROvi1ZPSWXh1K2/WN6iinGgRQY+PyVz0O83rfXuXrqn6jAw6xa1k
   ZlzG9gzWQ2uprxzJAW1JZxuPS0u0TT3IBdTDtG/xCzGQbuwffgk+c7zi/
   XKMULB32UdjrbuL0zjTFYeUGBbK7DGbdyXzewK+SYdp8h0ohspLdVKKwX
   Y0MsAJDKFGON5C6DG7dBFawXDyddKiq/0TjOqlTjLiexThJBKEhcwjZRZ
   QfSa/oEREnomp3cy5cYHTaAqzoaEXFeETKxkGuaKunkNsLqaQgT6/ePUg
   mwuspDEFMDyesaR7UQ0y5CSSjIRtDNBzfonpN9skiZDWwzdJq9e6/rmnO
   A==;
X-CSE-ConnectionGUID: H0IA+B3iQN6HeOncht/Gdw==
X-CSE-MsgGUID: /CQ7AQPnQNSFAF/41NN79g==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="4080"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="4080"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 02:38:05 -0700
X-CSE-ConnectionGUID: lmudgYgoRkuXPFdqz6/0zQ==
X-CSE-MsgGUID: FBSRG3g7S9exdWikyThqVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="285487835"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.244.221]) ([10.245.244.221])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 02:38:04 -0700
Message-ID: <2245f2e6-dca7-44ab-8dc1-df743f8ce992@linux.intel.com>
Date: Wed, 7 Oct 2026 12:38:01 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] xhci: Sort out the TD skipping business
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261007094952.28bfa51e.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20261007094952.28bfa51e.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/26 10:49, Michal Pecio wrote:
> Hi Mathias,
> 
> I see that you have picked this series for 7.4:
> https://lore.kernel.org/linux-usb/20260804120110.01bda0e2.michal.pecio@gmail.com/
> 
> There is unfortunately a small bug in "Shorten the TD skipping loop":
> old_trb_comp_code is assigned before being used by the !trb_in_td()
> block, which means that we use the *current* trb_comp_code instead.
> 

Thanks, replaced last two patches of your series with these two

-Mathias

