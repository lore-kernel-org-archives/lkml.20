Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F3A3B6341;
	Tue, 15 Sep 2026 12:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474302; cv=none; b=jo9d9DnaUZwOxqV3AkY32CZH7d8KZDWbD1zNZgF47HkhPWBkPVeNHTduAHWSro4JkTIEA1SjxukU+24nFpclMgRCZaJF6g7OXAAqa1v0RLcyeWG/qE0++QBGBU/zSPyqugfnSU81HI6UpR3qe/sp8QSxmysNT6hc1W94JHaDyq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474302; c=relaxed/simple;
	bh=jMLrK+lnLNr5zpQBvJwxK8szsU9jhDM7xBvhzPvnFEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kvd3F/hdc57tIh+ST9s3JGy1WLTDyEWJZnk4mvp5aPitI64ti29xKXymHONfquQZdx4+COK8oanblBO9jEwWgxVoOn0haztK9Kmx1RsriY+1V5U8YX8B7xR4t7V8HLa+lIMk2kAn4QAwoT+gS6G5fd1Y1udowbIgnP6IDNQA7M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJGWVKrD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJGWVKrD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789474301; x=1821010301;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jMLrK+lnLNr5zpQBvJwxK8szsU9jhDM7xBvhzPvnFEY=;
  b=gJGWVKrDQB8FwvbfE+C/qo2OCaxwRFEKFrum6MfV+K9yQKIB7FZg4avP
   uVG5sf2+RYmf8mxebaX1dFarl3onKTogcXs5OmMrn5mlflvkFM+LqLAah
   gwBZTsGKq0ln0+tGFCuFCX96CN0N/Y1MmX40ojlXfmkdFbBTHzVBPHa1i
   /B53fqYh88QKxO9LqlDStt8UQiWRLC3b3pKfwqDPofhN1KwKE2FwCRyY6
   VCCLnlMtN61U0fOgLgf9H003AqztwR83ynRj+N0j5WF0i/L4TVnoG6OOy
   A9HTdEOFqjpjYlTt3fmzHc/gH6tNYwQ8uTBCBnbSjg3kZwzZ8M7xH3W1L
   Q==;
X-CSE-ConnectionGUID: 5TYjET26TT2xSzJB3rHY5A==
X-CSE-MsgGUID: R3ShnZxjT/Sy70Id5RU0AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89775331"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89775331"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 05:11:40 -0700
X-CSE-ConnectionGUID: j7d6bjSnR8G79vggcDZCiA==
X-CSE-MsgGUID: f6yFv09+T7ikiFnYrMgU9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296496946"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.247]) ([10.245.245.247])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 05:11:37 -0700
Message-ID: <aaf0e818-32b5-41f2-a2a2-fdf9b32ea892@linux.intel.com>
Date: Tue, 15 Sep 2026 15:11:35 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] early: usb: xhci-dbc: Handle out of bounds xhci-xdbc
 capability
To: Umang Jain <uajain@igalia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <demarchi@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20260915074049.613842-1-uajain@igalia.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260915074049.613842-1-uajain@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 10:40, Umang Jain wrote:
> Currently, the early xhci-dbc assumes that the entire PCIe memory IO
> can be entirely mapped  within the fixed boot time mappings
> dictated by NR_FIX_BTMAPS. This patch handles the case where the PCIe
> memory IO size can be larger than the fixed boot time mappings and
> query the xhci debug extended capability in xdbc_map_pci_mmio().
> 
> This commit ensures that the xHCI debug capability can still be queried
> when the PCIe memory IO space exceeds the fixmap size. In this scenario,
> the base address is mapped uptil fixmap size and debug capabilities are
> queried thereafter. Iterating over the entire PCIe BAR address size is
> left for future improvement as and when, such a case arises.
> 
> Additionally, this brings the need to track the early_ioremap() mapped
> size separately hence, introduce additional struct member xhci_base_length
> in struct xdbc_state.
> 
> Signed-off-by: Umang Jain <uajain@igalia.com>
> ---
> Changes in v2:
> - Commit message update
> - Changed and tested behaviour for mapping only first fixmap_size
>    of PCIe Base address size instead of iteration over entire BAR size
> - Updated comments
> - Updated XDBC MAPPING SIZE to 64

Thanks, this starts to look good.

Some small fixes and cleanups still needed.

> 
> v1:
> - https://lore.kernel.org/all/20260720191249.1272328-1-uajain@igalia.com/
> ---
>   drivers/usb/early/xhci-dbc.c | 78 ++++++++++++++++++++++++++++++++----
>   drivers/usb/early/xhci-dbc.h |  1 +
>   2 files changed, 71 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
> index 41118bba9197..d2e6ae410b0d 100644
> --- a/drivers/usb/early/xhci-dbc.c
> +++ b/drivers/usb/early/xhci-dbc.c
> @@ -35,10 +35,23 @@ static bool early_console_keep;
>   static inline void xdbc_trace(const char *fmt, ...) { }
>   #endif /* XDBC_TRACE */
>   
> +/* Size of xHCI debug capability structure as per section 7.6.8 of xHCI spec. */
> +#define XDBC_MAPPING_SIZE	64
> +
> +enum xdbc_capability_flags {
> +	XDBC_CAP_FLAG_NONE		= 0,
> +	XDBC_CAP_FLAG_LEGACY		= 1 << 0,
> +	XDBC_CAP_FLAG_PROTOCOL		= 1 << 1,
> +	XDBC_CAP_FLAG_DEBUG		= 1 << 2,
> +};
> +
>   static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
>   {
> -	u64 val64, sz64, mask64;
> +	u64 val64, sz64, mask64, fixmap_size, mapped_size;

mapped_size in no longer needed. Can be removed

> +	enum xdbc_capability_flags cap_flags = XDBC_CAP_FLAG_NONE;
> +	bool found_all_caps = false;
>   	void __iomem *base;
> +	int offset;
>   	u32 val, sz;
>   	u8 byte;
>   
> @@ -85,7 +98,56 @@ static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
>   
>   	xdbc.xhci_start = val64;
>   	xdbc.xhci_length = sz64;
> -	base = early_ioremap(val64, sz64);
> +
> +	fixmap_size = NR_FIX_BTMAPS << PAGE_SHIFT;
> +	if (sz64 < fixmap_size) {
> +		xdbc.xhci_base_length = sz64;
> +		return early_ioremap(val64, sz64);
> +	}
> +
> +	/*
> +	 * Base address size is greater than fixed size boot time mappings
> +	 * hence, map maximum allowed fixmap size from base address and
> +	 * determine if the required extended capabilities lies within the
> +	 * fixmap.
> +	 */
> +	base = early_ioremap(val64, fixmap_size);

if (!base)
	return NULL;

> +	offset = xhci_find_next_ext_cap(base, 0, 0);
> +	mapped_size = fixmap_size;

mapped_size not used

> +
> +	while (offset < fixmap_size) {
> +		val = readl(base + offset);
> +		switch (XHCI_EXT_CAPS_ID(val)) {
> +		case XHCI_EXT_CAPS_DEBUG:
> +			if (offset + XDBC_MAPPING_SIZE < fixmap_size)
> +				cap_flags |= XDBC_CAP_FLAG_DEBUG;
> +			break;
> +		case XHCI_EXT_CAPS_PROTOCOL:
> +			cap_flags |= XDBC_CAP_FLAG_PROTOCOL;
> +			break;
> +		case XHCI_EXT_CAPS_LEGACY:
> +			cap_flags |= XDBC_CAP_FLAG_LEGACY;
> +			break;
> +		}
> +
> +		if ((cap_flags & XDBC_CAP_FLAG_DEBUG) &&
> +		    (cap_flags & XDBC_CAP_FLAG_PROTOCOL) &&
> +		    (cap_flags & XDBC_CAP_FLAG_LEGACY)) {
> +			found_all_caps = true;
> +			break;
> +		}
> +
> +		offset = xhci_find_next_ext_cap(base, offset, 0);
> +		if (!offset)
> +			break;
> +	}
> +
> +	if (found_all_caps) {
> +		xdbc.xhci_base_length = fixmap_size;
> +	} else {
> +		xdbc.xhci_base_length = 0;
> +		base = NULL;

we need to early_iounmap() in this fail path before returning NULL.

> +	}
>   
>   	return base;
>   }

Thanks
Mathias

