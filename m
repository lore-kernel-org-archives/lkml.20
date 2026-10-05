Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C5847D926;
	Mon,  5 Oct 2026 11:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198212; cv=none; b=kGWYoXmuBJrTBRQsssxRPEJtftwFNuBYTMSwLTRHeEguuJ+zuejblKnyuRsdNQZTRTpwGMkHfqEBFuQfmAkbJObDjU4GHC0ZB+OZmQIWoqJBxBPqCenjBYJddqNQoSu8buisKA0MOoPtjsLjf9EHx/+asqeTK6ud0/b1PA/KtIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198212; c=relaxed/simple;
	bh=vko7EXi5RRbclfOsRRtkyUdbBvlFnNilJHy/BeXZAm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jVQLuWMPNxtJlhMLfENUpEz7wKnXXuv9O4VNCaRGp6BbhoeFJYyAdNEMJKkilAYLYUOcoc3gPZG053lHIQEK4L1xoly6bUpAu36a1vR03suHtI06cBGVtcmTWvOM3+CiIRO9mwv22Nycr2a8kfG+u1+7fDh4WQUsKjq7S2NenVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwtugPAU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwtugPAU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791198210; x=1822734210;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vko7EXi5RRbclfOsRRtkyUdbBvlFnNilJHy/BeXZAm0=;
  b=UwtugPAU7zp9pjwzYz9kQ2A58MIEKIVTIBUf4qbtPigBFqfj/xIZljws
   k6eaMu3B+nX9SfI3sha2dyULsZjdAzrWOvnM2Bc8oBbi3W+tX9OuPK9n3
   el/5O7DHCa9kG8pHSAlf7fJshSA0ii8iAlT/PMJImv9ZyCUTjVgTydtQX
   80zuqOv1+ImPWj23z4gI+OnPIY6+uC1iw+9TaL8NW4lqLqNQURQB7uMlO
   cD473Nb9RT0rV3pVT+xAVN7risPiyjmvlF55Kgo5lh6t9HkTfI+2PtqPv
   itX6yLWZH27KwKW6rWGCwsmZg5IM09wQzVL1RVMYgHh45up56J2GrK2sf
   Q==;
X-CSE-ConnectionGUID: trsv3OfnSO6s+bhze2eFXw==
X-CSE-MsgGUID: Lfd2I3QJTuKgmVFBSmyP3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="94739531"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="94739531"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 04:03:27 -0700
X-CSE-ConnectionGUID: 3ITqWxcsQrerjLAeAtwxNA==
X-CSE-MsgGUID: Ju8Y3QDHS0CFxgM7q/YkMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="276349680"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.212]) ([10.245.245.212])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 04:03:24 -0700
Message-ID: <68b34f04-f7e2-4468-8a18-ac97decb987d@linux.intel.com>
Date: Mon, 5 Oct 2026 14:03:08 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] usb: xhci: sideband: allocate sideband ring
 segments from a dedicated pool
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
 <20260909-16k_offload_v1_b4-v4-3-f24a86617597@oss.qualcomm.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260909-16k_offload_v1_b4-v4-3-f24a86617597@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/26 04:50, Wesley Cheng wrote:
> A sideband client that maps a ring buffer directly via the IOMMU
> (which operates at page granularity) needs to know exactly which
> page(s) back the ring, and only pages that are actually intended to
> be exposed to that client should ever be mapped this way.
> 
> Allow each xhci_sideband endpoint to pass its own segment_pool, allocated
> separately from the core xhci->segment_pool, so every segment backing
> a sideband-tagged endpoint always comes from a page that is meant to
> be visible by the entity handling the offloaded endpoints. Normal
> (non-offloaded) endpoints are unaffected, as they keep allocating from
> xhci->segment_pool.
> 
> The offload client owns the pool's full lifetime, and since
> that lifetime is no longer tied to the sideband instance itself,
> xhci_sideband_unregister() must free any ring still backed by a
> client-supplied pool before returning, rather than leaving it for xhci
> to free later when the client and its pool may already be gone.

xhci is the one allocating the ring when adding an endpoint, and telling
xHC hardware to write to that ring. It seems more approriate that xhci should
be the one freeing the ring after it told xHC hardware to drop the endpoint,
and there no longer is a risk on hardware accessing it.

usb audio (class) driver controls both when and endpoint is added or dropped
by setting configurations and interfaces, and also the one registering and
unregistering sideband, and adding and removing endpoint to/from sideband use.

I think usb audio driver should ensure endpoints are dropped before unregistering
sideband.

> 
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>   drivers/usb/host/xhci-sideband.c  | 38 +++++++++++++++++++++++++++++++++++---
>   drivers/usb/host/xhci.h           | 10 +++-------
>   include/linux/usb/xhci-sideband.h | 20 +++++++++++++++++---
>   sound/usb/qcom/qc_audio_offload.c | 32 ++++++++++++++++++++++++++++----
>   4 files changed, 83 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
> index 274da38f333d..1bb6e5034b58 100644
> --- a/drivers/usb/host/xhci-sideband.c
> +++ b/drivers/usb/host/xhci-sideband.c
> @@ -9,6 +9,7 @@
>    */
>   
>   #include <linux/usb/xhci-sideband.h>
> +#include <linux/dmapool.h>
>   
>   #include "xhci.h"
>   
> @@ -67,6 +68,7 @@ __xhci_sideband_remove_endpoint(struct xhci_sideband *sb, struct xhci_virt_ep *e
>   	xhci_stop_endpoint_sync(sb->xhci, ep, 0, GFP_KERNEL);
>   
>   	ep->sideband = NULL;
> +	ep->priv_seg_pool = NULL;
>   	sb->eps[ep->ep_index] = NULL;
>   }
>   
> @@ -113,6 +115,8 @@ EXPORT_SYMBOL_GPL(xhci_sideband_notify_ep_ring_free);
>    * xhci_sideband_add_endpoint - add endpoint to sideband access list
>    * @sb: sideband instance for this usb device
>    * @host_ep: usb host endpoint
> + * @pool: dma pool to allocate this endpoint's ring segments from, or NULL
> + *        to leave the endpoint's current pool selection untouched

Add some comment about if pool is set then xhci_sideband_add_endpoint() needs
to be called before setting configuration or interface that enables as
allocated the endpoint.

Also add note that this is not suitable for ep0 as ring is allocated immedialely
when device is created.


>    *
>    * Adds an endpoint to the list of sideband accessed endpoints for this usb
>    * device.
> @@ -123,7 +127,8 @@ EXPORT_SYMBOL_GPL(xhci_sideband_notify_ep_ring_free);
>    */
>   int
>   xhci_sideband_add_endpoint(struct xhci_sideband *sb,
> -			   struct usb_host_endpoint *host_ep)
> +			   struct usb_host_endpoint *host_ep,
> +			   struct dma_pool *pool)
>   {
>   	struct xhci_virt_ep *ep;
>   	unsigned int ep_index;
> @@ -153,6 +158,9 @@ xhci_sideband_add_endpoint(struct xhci_sideband *sb,
>   	ep->sideband = sb;
>   	sb->eps[ep_index] = ep;
>   
> +	if (pool)
> +		ep->priv_seg_pool = pool;
> +

Fail here ring is already allocated from another pool:

if (pool) {
	if (ep->ring && ep->ring->segment_pool != pool)
		return -SOME_SUITABLE_ERROR;
	ep->priv_seg_pool = pool
}




>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(xhci_sideband_add_endpoint);
> @@ -288,6 +296,7 @@ EXPORT_SYMBOL_GPL(xhci_sideband_check);
>    * xhci_sideband_create_interrupter - creates a new interrupter for this sideband
>    * @sb: sideband instance for this usb device
>    * @num_seg: number of event ring segments to allocate
> + * @pool: dma pool to allocate the interrupter's event ring segments from
>    * @ip_autoclear: IP autoclearing support such as MSI implemented
>    *
>    * Sets up a xhci interrupter that can be used for this sideband accessed usb
> @@ -301,7 +310,8 @@ EXPORT_SYMBOL_GPL(xhci_sideband_check);
>    */
>   int
>   xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
> -				 bool ip_autoclear, u32 imod_interval, int intr_num)
> +				 struct dma_pool *pool, bool ip_autoclear,
> +				 u32 imod_interval, int intr_num)
>   {
>   	if (!sb || !sb->xhci)
>   		return -ENODEV;
> @@ -315,7 +325,7 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
>   		return -EBUSY;
>   
>   	sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
> -						   num_seg, NULL,
> +						   num_seg, pool,
>   						   imod_interval, intr_num);
>   	if (!sb->ir)
>   		return -ENOMEM;
> @@ -370,6 +380,8 @@ EXPORT_SYMBOL_GPL(xhci_sideband_interrupter_id);
>   /**
>    * xhci_sideband_register - register a sideband for a usb device
>    * @intf: usb interface associated with the sideband device
> + * @type: xHCI sideband type
> + * @notify_client: callback for xHCI sideband sequences
>    *
>    * Allows for clients to utilize XHCI interrupters and fetch transfer and event
>    * ring parameters for executing data transfers.
> @@ -436,6 +448,15 @@ EXPORT_SYMBOL_GPL(xhci_sideband_register);
>    * After this the endpoint and interrupter event buffers should no longer
>    * be accessed via sideband. The xhci driver can now take over handling
>    * the buffers.
> + * Any transfer ring allocated from a client supplied dma pool is freed here
> + * as well, as the client is not expected to keep that pool alive any longer
> + * than this call. This includes rings of endpoints already removed with
> + * xhci_sideband_remove_endpoint(), which xhci would otherwise only free once
> + * the device is reconfigured or torn down, i.e. after the client is gone.
> + *
> + * The caller must ensure the usb device is no longer streaming through the
> + * normal, non-sideband path when calling this, as the freed rings are still
> + * referenced by the endpoint contexts until xhci reconfigures the device.
>    */
>   void
>   xhci_sideband_unregister(struct xhci_sideband *sb)
> @@ -458,6 +479,17 @@ xhci_sideband_unregister(struct xhci_sideband *sb)
>   			if (sb->eps[i])
>   				__xhci_sideband_remove_endpoint(sb, sb->eps[i]);
>   
> +		spin_lock_irq(&xhci->lock);
> +		for (i = 0; i < EP_CTX_PER_DEV; i++) {
> +			struct xhci_ring *ring = vdev->eps[i].ring;
> +
> +			if (ring && ring->segment_pool != xhci->segment_pool) {
> +				xhci_ring_free(xhci, ring);
> +				vdev->eps[i].ring = NULL;


Sideband should not make decisions for all endpoints of a device based on the
pool memory is _not_ allocated from.

Endpoint may not even belong to audio interface, for example can be part if HID.

Can't assume that just because ring isn't allocatd from xhci->segment_pool that
it means it belongs to sideband. It's true today, but dedicated pools may be used
for VTIO/virtualization in future.

Maybe add some warning to xhci_unregister_sideband() if an endpoint assined
to sideband  still has a ring allocated before calling
__xhci_sideband_remove_endpoint(sb, sb->eps[i]);

> +			}
> +		}
> +		spin_unlock_irq(&xhci->lock);
> +
>   		__xhci_sideband_remove_interrupter(sb);
>   
>   		sb->vdev = NULL;
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 15ce0bb7aa3f..1353d6fa2776 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -19,6 +19,7 @@
>   #include <linux/usb/hcd.h>
>   #include <linux/io-64-nonatomic-lo-hi.h>
>   #include <linux/io-64-nonatomic-hi-lo.h>
> +#include <linux/usb/xhci-sideband.h>
>   
>   /* Code sharing between pci-quirks and xhci hcd */
>   #include	"xhci-ext-caps.h"
> @@ -740,8 +741,6 @@ struct xhci_interval_bw_table {
>   	unsigned int		ss_bw_out;
>   };
>   
> -#define EP_CTX_PER_DEV		31
> -
>   struct xhci_virt_device {
>   	int				slot_id;
>   	struct usb_device		*udev;
> @@ -1255,14 +1254,11 @@ static inline const char *xhci_trb_type_string(u8 type)
>   #define NEC_FW_MAJOR(p)		(((p) >> 8) & 0xff)
>   
>   /*
> - * TRBS_PER_SEGMENT must be a multiple of 4,
> - * since the command ring is 64-byte aligned.
> - * It must also be greater than 16.
> + * TRBS_PER_SEGMENT and TRB_SEGMENT_SIZE are defined in
> + * <linux/usb/xhci-sideband.h>, shared with sideband client drivers.

This seems backwards.

Maybe we should just add ring_seg_size and xHC device pointer to struct xhci__sideband

Or optionally helper(s) that provides those

>    */
> -#define TRBS_PER_SEGMENT	256
>   /* Allow two commands + a link TRB, along with any reserved command TRBs */
>   #define MAX_RSVD_CMD_TRBS	(TRBS_PER_SEGMENT - 3)
> -#define TRB_SEGMENT_SIZE	(TRBS_PER_SEGMENT*16)
>   #define TRB_SEGMENT_SHIFT	(ilog2(TRB_SEGMENT_SIZE))
>   /* TRB buffer pointers can't cross 64KB boundaries */
>   #define TRB_MAX_BUFF_SHIFT		16
> diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
> index 005257085dcb..6d318e6a3bf6 100644
> --- a/include/linux/usb/xhci-sideband.h
> +++ b/include/linux/usb/xhci-sideband.h
> @@ -13,7 +13,19 @@
>   #include <linux/usb.h>
>   #include <linux/usb/hcd.h>
>   
> -#define	EP_CTX_PER_DEV		31	/* FIXME defined twice, from xhci.h */
> +/*
> + * Constants shared with the xHCI host driver (drivers/usb/host/xhci.h),
> + * which includes this header for its canonical definitions.
> + */
> +#define EP_CTX_PER_DEV      31
> +
> +/*
> + * TRBS_PER_SEGMENT must be a multiple of 4,
> + * since the command ring is 64-byte aligned.
> + * It must also be greater than 16.
> + */
> +#define TRBS_PER_SEGMENT    256
> +#define TRB_SEGMENT_SIZE    (TRBS_PER_SEGMENT * 16)
>   
>   struct xhci_sideband;
>   
> @@ -72,7 +84,8 @@ void
>   xhci_sideband_unregister(struct xhci_sideband *sb);
>   int
>   xhci_sideband_add_endpoint(struct xhci_sideband *sb,
> -			   struct usb_host_endpoint *host_ep);
> +			   struct usb_host_endpoint *host_ep,
> +			   struct dma_pool *pool);
>   int
>   xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
>   			      struct usb_host_endpoint *host_ep);
> @@ -94,7 +107,8 @@ static inline bool xhci_sideband_check(struct usb_hcd *hcd)
>   
>   int
>   xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
> -				 bool ip_autoclear, u32 imod_interval, int intr_num);
> +				 struct dma_pool *pool, bool ip_autoclear,
> +				 u32 imod_interval, int intr_num);
>   void
>   xhci_sideband_remove_interrupter(struct xhci_sideband *sb);
>   int
> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
> index e4bfd43a2488..c94b15423a9a 100644
> --- a/sound/usb/qcom/qc_audio_offload.c
> +++ b/sound/usb/qcom/qc_audio_offload.c
> @@ -7,6 +7,7 @@
>   #include <linux/ctype.h>
>   #include <linux/dma-mapping.h>
>   #include <linux/dma-map-ops.h>
> +#include <linux/dmapool.h>
>   #include <linux/init.h>
>   #include <linux/iommu.h>
>   #include <linux/module.h>
> @@ -131,6 +132,7 @@ struct uaudio_dev {
>   
>   	/* xhci sideband */
>   	struct xhci_sideband *sb;
> +	struct dma_pool *segment_pool;
>   
>   	/* SoC USB device */
>   	struct snd_soc_usb_device *sdev;
> @@ -1140,7 +1142,8 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
>   
>   	memcpy(ep_desc, &ep->desc, sizeof(ep->desc));
>   
> -	ret = xhci_sideband_add_endpoint(uadev[card_num].sb, ep);
> +	ret = xhci_sideband_add_endpoint(uadev[card_num].sb, ep,
> +					 uadev[card_num].segment_pool);
>   	if (ret < 0) {
>   		dev_err(&subs->dev->dev,
>   			"failed to add data ep to sec intr: %d\n", ret);
> @@ -1211,8 +1214,9 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
>   		goto exit;
>   
>   	/* event ring */
> -	ret = xhci_sideband_create_interrupter(uadev[card_num].sb, 1, false,
> -					       0, uaudio_qdev->data->intr_num);
> +	ret = xhci_sideband_create_interrupter(uadev[card_num].sb, 1,
> +					       uadev[card_num].segment_pool,
> +					       false, 0, uaudio_qdev->data->intr_num);
>   	if (ret < 0) {
>   		dev_err(&subs->dev->dev, "failed to fetch interrupter\n");
>   		goto put_offload;
> @@ -1786,6 +1790,7 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
>   	struct usb_interface_descriptor *altsd;
>   	struct usb_host_interface *alts;
>   	struct snd_soc_usb_device *sdev;
> +	struct dma_pool *segment_pool;
>   	struct xhci_sideband *sb;
>   
>   	/*
> @@ -1804,10 +1809,21 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
>   		if (!sdev)
>   			return;
>   
> +		segment_pool = dma_pool_create("xHCI sideband ring segments",
> +					       interface_to_usbdev(intf)->bus->sysdev,
> +					       TRB_SEGMENT_SIZE, TRB_SEGMENT_SIZE,
> +					       TRB_SEGMENT_SIZE);
> +		if (!segment_pool)
> +			goto free_sdev;
> +
>   		sb = xhci_sideband_register(intf, XHCI_SIDEBAND_VENDOR,
>   					    uaudio_sideband_notifier);
> -		if (!sb)
> +		if (!sb) {
> +			dma_pool_destroy(segment_pool);
>   			goto free_sdev;
> +		}
> +
> +		uadev[chip->card->number].segment_pool = segment_pool;

If struct xhci_sideband had dev pointer and segment size then we would just swap the order:


sb = xhci_sideband_register(intf, XHCI_SIDEBAND_VENDOR,
				uaudio_sideband_notifier);


segment_pool = dma_pool_create("xHCI sideband ring segments",
				sb->hcdev,
				sb->ring_seg_size, sb->ring_seg_size,
				sb->ring_seg_size);

segment_pool isn't needed yet when resistering the sideband.

Thanks
Mathias
