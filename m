Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4516A2DC32C;
	Mon, 31 Aug 2026 13:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181452; cv=none; b=cIW8a+tE3kwI9Ynf80e5EVq+HpDiyXGLTHMvmcu+ba6fXrk0Gxysy0pyjK2i5aXXN6bgGAdqQJ9W3y1Q4fZpPBxgmYYN/as+v/xyk4b5LDKqj/3IVdxn81p/YW8+VMFhQPpwLMuK0vOeHdxxm8AM+Drc97XU3ZwIJ0HVsf3epRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181452; c=relaxed/simple;
	bh=CEjBd6GFRDVnqtgZXJaSynvhFuMYjyanDluIehnM89k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u/iugpKQFtMCcoFhcwblwqxCGjTsdufZBFzt1BiKtdnJXlfqL50Vt7eoh76GtB4CvQIasYfz+7Z6l9A1kPYGyXHzgXbKhVLzsnLrCI0GRWAGp3wN58e6Fz5TiaRNmkci3T4nk8yMnoTBWfnLdglVbxQBAe7muA4siZX7jVY3GcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dJ0nJGEq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dJ0nJGEq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788181451; x=1819717451;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CEjBd6GFRDVnqtgZXJaSynvhFuMYjyanDluIehnM89k=;
  b=dJ0nJGEqbaa7y2TwFd3fzwauqzFgQkh2AzaQxhnGlfL2nmCeSOd3Ndnm
   kDghyvEJVUPaOGiWG2a4OhpPhOMi4kcoTL+InWEwFsbBeEGSBLXzYfmrT
   hGF/Tbsi234mXmTD86NZE4NDzwSsY22WvZewMEHeiSC5ohpMtgWRj/RqR
   dOTm1JoBNkhKH/tA2Kbpd1qe9OOVVxdSJI8EQlRADhnQSu56DmCvJCO8o
   FjDfaIDsIhGNVjHVaf7UxCxQkUzQknSF6PiQc65dfP58uhTpuRKjbQiky
   mIzxkKwXjPJMIBmXjZ1x0asjUqoQ92BFAuxkHbvpyE/vOnSK+DJFNbzaG
   g==;
X-CSE-ConnectionGUID: 2J5S8lFXTPyxqxIPUuFz2A==
X-CSE-MsgGUID: zWJ6TYgJSae7fT0J7Kjz+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88350137"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="88350137"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 06:04:10 -0700
X-CSE-ConnectionGUID: HjhktWFGS2ajSoUbeh4RAg==
X-CSE-MsgGUID: VHwBLPo7SlGcQVvO2CrCug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="267463512"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.244.13]) ([10.245.244.13])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 06:04:07 -0700
Message-ID: <c3f69010-4263-4d71-bdfd-62f21989b639@linux.intel.com>
Date: Mon, 31 Aug 2026 16:04:04 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add larger page size support for USB audio offload
 path
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20260828-16k_offload_v1_b4-v2-0-8a46369ebbb6@oss.qualcomm.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260828-16k_offload_v1_b4-v2-0-8a46369ebbb6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/29/26 00:37, Wesley Cheng wrote:
> On some environments, 16kB pages can be enabled from the Linux subsystem,
> which manages the IOMMU mappings for the audio DSP within the system.  In
> the current design, the following assumptions break when 16k pages are
> utilized:
>    1. xHCI ring size is equal to PAGE_SIZE
>    2. Ring addresses start at the beginning of a page
> 
> When the USB offload driver maps the rings (w/ the audio DSP SID), it is
> set with a 16k granular, which is a problem, as several xHCI rings could
> exist on the same page.  This is because the rings are currently allocated
> from the segment_pool.  Hence, potentially mapping non USB audio related
> rings into the region accessible by the audio DSP.
> 
> To mitigate this, this series introduces a separate segment_pool
> associated to each sideband instance.  Before the USB audio offload path
> is enabled, the USB audio data streams/endpoint are not active.  Only when
> the class driver issues a usb_set_interface() call (done from
> snd_usb_endpoint_prepare()), will the xHCI allocate the transfer ring
> resources.  Which pool is selected is all based on if the sideband path
> is being enabled, and if so, memory can be allocated from that pool,
> which expects to be owned in conjunction with the audio DSP.  This
> concept allows to keep the same model existing in xHCI, where multiple
> 4k segments can reside on the same page, which reduces potentially over
> allocating based on the page size.
> 
> Likewise this mechanism also allows for the offload client driver to
> determine which SID is associated to the segment_pool if it decides to
> map outside of the Linux subsystem.  The new ring allocation flow for
> sideband/offload clients will be as follows:
> 
> qc_usb_audio_offload_probe()
>    ├─ segment_pool = dma_pool_create(...)
>    ▼
> xhci_sideband_register(intf, XHCI_SIDEBAND_VENDOR, segment_pool, notify_client)
>    │  sb->segment_pool = segment_pool
>    ▼
> uadev[card_num].sb = sb
> 
> handle_uaudio_stream_req()
>    ▼
> enable_audio_stream(subs, ..., pcm_card_num)
>    ├─ data_ep = uaudio_find_host_endpoint(subs, subs->data_endpoint)
>    ├─ xhci_sideband_add_endpoint(sb, data_ep) ← ep->sideband = sb; sb->eps[ep_index] = ep
>    ├─ snd_usb_endpoint_prepare(chip, sync_endpoint) ─┐
>    ├─ snd_usb_endpoint_prepare(chip, data_endpoint)  ├─→ xhci_check_bandwidth()
>    │                                                 ▼
>    │            xhci_endpoint_init(xhci, virt_dev, ep, ...)
>    │            pool = sideband ? sideband->segment_pool : xhci->segment_pool
>    │            new_ring = xhci_ring_alloc_from_pool(..., pool, ...)
>    │            ▼
>    │            xhci_ring_alloc_from_pool(..., pool, flags)
>    │            ring->segment_pool = pool
>    │            ▼
>    │            xhci_alloc_segments_for_ring(xhci, ring, flags)
>    │            xhci_segment_alloc(xhci, ring->segment_pool, max_packet, num, flags)
>    │            ▼
>    │            xhci_segment_alloc(xhci, pool, max_packet, num, flags)
>    │            seg->trbs = dma_pool_zalloc(pool, flags, &dma)
>    ▼
> xhci_sideband_get_endpoint_buffer(sb, data_ep) → xhci_ring_to_sgtable()
> 
> qc_usb_audio_offload_disconnect() / unreg_xhci:
>    ├─ segment_pool = sb->segment_pool
>    ├─ xhci_sideband_unregister(sb)
>    ▼
>    dma_pool_destroy(segment_pool)
> 
> Similar logic is added for the secondary interrupter path as well.  The USB
> offload class driver calls xhci_sideband_create_interrupter(), which will
> be responsible for allocating the secondary event ring.

The custom dma pool looks like a good solution.

I think we should tune this a bit and pass the custom pool pointer to
xhci_sideband_add_endpoint() and xhci_sideband_create_interrupter() instead
of xhci_sideband_register()

xhci.h:
struct xhci_virt_ep {
	...
	struct dma_pool	*priv_seg_pool;
}

xhci-mem.c:
xhci_endpoint_init()
{
	struct dma_pool *pool;
	struct xhci_virt_ep *ep;
	...
	
	ep = &virt_dev->eps[ep_index]

	/* use ep->priv_seg_pool if set by sideband or .add_endpoint wrapper */
	if (ep->priv_seg_pool)
		pool = ep->priv_seg_pool;
	else
		pool = xhci->segment_pool;

	xhci_ring_alloc_from_pool(..., pool);}

xhci-sideband.c:

xhci_sideband_add_endpoint(..., struct dma_pool *pool)
{
	...
	if (pool)
		ep->priv_seg_pool = pool;
}

This allows finer granularity in selecting dma pools for endpoints.

It also keeps the xhci "core" sideband agnostic, avoids including xhci-sideband.h
in xhci-mem.c

It also helps possible vtio support so it can set its own ep->priv_seg_pool in a
possible .add_endpint wrapper.

Thanks
Mathias

