Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E3B3B8BA4;
	Tue, 15 Sep 2026 13:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478575; cv=none; b=YU6LOSnJgWZ9cFPHRAhlmlDgkzl+eIQt2alC96yjrSzDYNtGcbBJ/njy04hy66Mc0YDnA+O+O8PuWKdxTW8+kgV5N8ht8HJrojVQzvHtUD/16azK7vNXl8dDPWefl3XLDNbiqWBjIeyIiBvX8+bVjsHfb1YzTKTcMxdjPCoc8nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478575; c=relaxed/simple;
	bh=Xt6w8PfG4hMbOwR/dzA+tZEVL3wfRZ/KyrFLLcGlPwo=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=PIXQvZbrtN/0tA+3715myEvt+Ix4sJxdLJaIxstSHVIDPuY1xFsqhtCxKE8wV9D525Wca+5HFaELdXn32m5H3Moh4FWaqXIoE0UyKXw9Lm9mlJ4yjPVPYo4N+XvmDEgm+AxDyKCEqCaoO8pHBVLLPd1uk+FtqlhBgM4Wxg2tdkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=GP2cdT+5; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="GP2cdT+5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=WRMMiWWcyTFpWUwbgbFdf0DV8pHtweezXgm7yfIeL8k=; b=GP2cdT+5DdSmxi+Uri+gi7nrPu
	TRjrDTAj4V3ejNLKBjt9jwJspffUi/rzPduH1zvtSyspJGukuReReyW6LjRmOz9HvdlfC4e/oXZn+
	4V51wU7Ub+OsZ8JD5KudErnUNo9mwzEpA7G4HJCuDez4ZNw913ifbOx/w4+PeXnKxgqD1EirU87B0
	9D3aN17DeujwjIIDwchZfMrOvSy5381j336BHsMdpHSB3rbBRDQoC67JWzeJYs2CvUGg2ZkUJYVdU
	3PIFtuZX0c0dfmP/+hnh61wy2hfRaSRLsXfCHCNQd03mmnE2PiPdfJh9B0qIeODdMsAzBi0ePxrZE
	RVyrmD5A==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x6T7K-002SRi-69; Tue, 15 Sep 2026 15:22:33 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1x6T7I-007La0-Ec; Tue, 15 Sep 2026 15:22:33 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <uajain@igalia.com>)
	id 1x6T7I-000000022Qx-27Gw;
	Tue, 15 Sep 2026 15:22:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 13:22:32 +0000
From: Umang Jain <uajain@igalia.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lucas De Marchi
 <demarchi@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH v2] early: usb: xhci-dbc: Handle out of bounds xhci-xdbc
 capability
In-Reply-To: <aaf0e818-32b5-41f2-a2a2-fdf9b32ea892@linux.intel.com>
References: <20260915074049.613842-1-uajain@igalia.com>
 <aaf0e818-32b5-41f2-a2a2-fdf9b32ea892@linux.intel.com>
Message-ID: <195958b071b8cd57062060688b611ac6@igalia.com>
X-Sender: uajain@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.1, Tests=ALL_TRUSTED=-3,BAYES_50=0.8,KAM_DMARC_NONE=0.125,KAM_DMARC_STATUS=0.005
X-Spam-Score: -20
X-Spam-Bar: --

On 2026-09-15 12:11, Mathias Nyman wrote:
> On 9/15/26 10:40, Umang Jain wrote:
>> Currently, the early xhci-dbc assumes that the entire PCIe memory IO
>> can be entirely mapped  within the fixed boot time mappings
>> dictated by NR_FIX_BTMAPS. This patch handles the case where the PCIe
>> memory IO size can be larger than the fixed boot time mappings and
>> query the xhci debug extended capability in xdbc_map_pci_mmio().
>> 
>> This commit ensures that the xHCI debug capability can still be queried
>> when the PCIe memory IO space exceeds the fixmap size. In this scenario,
>> the base address is mapped uptil fixmap size and debug capabilities are
>> queried thereafter. Iterating over the entire PCIe BAR address size is
>> left for future improvement as and when, such a case arises.
>> 
>> Additionally, this brings the need to track the early_ioremap() mapped
>> size separately hence, introduce additional struct member xhci_base_length
>> in struct xdbc_state.
>> 
>> Signed-off-by: Umang Jain <uajain@igalia.com>
>> ---
>> Changes in v2:
>> - Commit message update
>> - Changed and tested behaviour for mapping only first fixmap_size
>>    of PCIe Base address size instead of iteration over entire BAR size
>> - Updated comments
>> - Updated XDBC MAPPING SIZE to 64
> 
> Thanks, this starts to look good.
> 
> Some small fixes and cleanups still needed.
> 
>> 
>> v1:
>> - https://lore.kernel.org/all/20260720191249.1272328-1-uajain@igalia.com/
>> ---
>>   drivers/usb/early/xhci-dbc.c | 78 ++++++++++++++++++++++++++++++++----
>>   drivers/usb/early/xhci-dbc.h |  1 +
>>   2 files changed, 71 insertions(+), 8 deletions(-)
>> 
>> diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
>> index 41118bba9197..d2e6ae410b0d 100644
>> --- a/drivers/usb/early/xhci-dbc.c
>> +++ b/drivers/usb/early/xhci-dbc.c
>> @@ -35,10 +35,23 @@ static bool early_console_keep;
>>   static inline void xdbc_trace(const char *fmt, ...) { }
>>   #endif /* XDBC_TRACE */
>>   +/* Size of xHCI debug capability structure as per section 7.6.8 of xHCI spec. */
>> +#define XDBC_MAPPING_SIZE	64
>> +
>> +enum xdbc_capability_flags {
>> +	XDBC_CAP_FLAG_NONE		= 0,
>> +	XDBC_CAP_FLAG_LEGACY		= 1 << 0,
>> +	XDBC_CAP_FLAG_PROTOCOL		= 1 << 1,
>> +	XDBC_CAP_FLAG_DEBUG		= 1 << 2,
>> +};
>> +
>>   static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
>>   {
>> -	u64 val64, sz64, mask64;
>> +	u64 val64, sz64, mask64, fixmap_size, mapped_size;
> 
> mapped_size in no longer needed. Can be removed

ah right, fallout from last version / changing implementation
> 
>> +	enum xdbc_capability_flags cap_flags = XDBC_CAP_FLAG_NONE;
>> +	bool found_all_caps = false;
>>   	void __iomem *base;
>> +	int offset;
>>   	u32 val, sz;
>>   	u8 byte;
>>   @@ -85,7 +98,56 @@ static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
>>     	xdbc.xhci_start = val64;
>>   	xdbc.xhci_length = sz64;
>> -	base = early_ioremap(val64, sz64);
>> +
>> +	fixmap_size = NR_FIX_BTMAPS << PAGE_SHIFT;
>> +	if (sz64 < fixmap_size) {
>> +		xdbc.xhci_base_length = sz64;
>> +		return early_ioremap(val64, sz64);
>> +	}
>> +
>> +	/*
>> +	 * Base address size is greater than fixed size boot time mappings
>> +	 * hence, map maximum allowed fixmap size from base address and
>> +	 * determine if the required extended capabilities lies within the
>> +	 * fixmap.
>> +	 */
>> +	base = early_ioremap(val64, fixmap_size);
> 
> if (!base)
> 	return NULL;
> 
>> +	offset = xhci_find_next_ext_cap(base, 0, 0);
>> +	mapped_size = fixmap_size;
> 
> mapped_size not used
> 
>> +
>> +	while (offset < fixmap_size) {
>> +		val = readl(base + offset);
>> +		switch (XHCI_EXT_CAPS_ID(val)) {
>> +		case XHCI_EXT_CAPS_DEBUG:
>> +			if (offset + XDBC_MAPPING_SIZE < fixmap_size)
>> +				cap_flags |= XDBC_CAP_FLAG_DEBUG;
>> +			break;
>> +		case XHCI_EXT_CAPS_PROTOCOL:
>> +			cap_flags |= XDBC_CAP_FLAG_PROTOCOL;
>> +			break;
>> +		case XHCI_EXT_CAPS_LEGACY:
>> +			cap_flags |= XDBC_CAP_FLAG_LEGACY;
>> +			break;
>> +		}
>> +
>> +		if ((cap_flags & XDBC_CAP_FLAG_DEBUG) &&
>> +		    (cap_flags & XDBC_CAP_FLAG_PROTOCOL) &&
>> +		    (cap_flags & XDBC_CAP_FLAG_LEGACY)) {
>> +			found_all_caps = true;
>> +			break;
>> +		}
>> +
>> +		offset = xhci_find_next_ext_cap(base, offset, 0);
>> +		if (!offset)
>> +			break;
>> +	}
>> +
>> +	if (found_all_caps) {
>> +		xdbc.xhci_base_length = fixmap_size;
>> +	} else {
>> +		xdbc.xhci_base_length = 0;
>> +		base = NULL;
> 
> we need to early_iounmap() in this fail path before returning NULL.

good catch ;-)

Thanks for review, I'll address and send out new version soon.

Are we sure we intend to keep this implementation? And leave passing
over the entire PCIe BAR range for later ?
> 
>> +	}
>>     	return base;
>>   }
> 
> Thanks
> Mathias
