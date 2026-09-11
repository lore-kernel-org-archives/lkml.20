Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906BD471243
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116315; cv=none; b=Y7pHupFEvExWanwVgOE7TnTUwyxT22fgda5rG09kk4CjaQtRTC8rgUjFpD5UyvmwwKm3paRMlVJ9GaAyNT/Gslxi+d0QhK9TMTVLieCoKYy7h0tzb2OU5K93YvaixX8yf6B0I36N2FeVbTB/RYtp8x+6BkohBu/IXR0lmZO+Q7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116315; c=relaxed/simple;
	bh=CbvohmmfWuvyIvE0d9VWANni2cvOKKgt5xA335J7/AU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=NBHbhxkC5ACciBDYCcnLrI2FOTPDyuEYd5Enl69Yw2brU0qMlpQUBD9wsJEH1OCNr/PMoMiXT9jEIECtkpks3jroM392Wzf3peYxtNKWc7uunxxZRoa7j0Uib7hGowvFvipTEh6t8HakQL/SKV+xIBfbgeSx3+WBdYKfNr1wg8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=nNOmUglg; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="nNOmUglg"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260911084504epoutp03357ba3a3fca95cf65ca50e6d34ab7643~UN8yl0Upe3218232182epoutp03C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:45:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260911084504epoutp03357ba3a3fca95cf65ca50e6d34ab7643~UN8yl0Upe3218232182epoutp03C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789116304;
	bh=kxHWEFK6LwdESOcR4h1nBkZJn58oMfECaIcdzF1zAQs=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=nNOmUglgfYIparfwCYe7fBRSVlC04rkHguj4b4qBaCuekZry+4hq3SKo0jQSmfwtJ
	 xtKOofILW4Ktcr5PTBV1xWDz7O/pt6avnyrUM1ET6pqsL2EAYUwnxUdV2/MyAkMueR
	 TZkLYA3CGNOhzzQI0Y2PIZlgraZgNxvHpIz2GKo8=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260911084503epcas5p3e856827347dd5fb83c687b8838c6f2a7~UN8yMn-nW1476114761epcas5p3E;
	Fri, 11 Sep 2026 08:45:03 +0000 (GMT)
Received: from epcpadp1new (unknown [182.195.40.141]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4hh7Ql4M3xz2SSKr; Fri, 11 Sep
	2026 08:45:03 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260911084154epcas5p35d2504edcb322593accc357b9161d7b7~UN6CaiYQ60442104421epcas5p3c;
	Fri, 11 Sep 2026 08:41:54 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260911084153epsmtip175687bf91bdc8cb92432e9a7f939d8e9~UN6BAfIUb3121631216epsmtip1H;
	Fri, 11 Sep 2026 08:41:53 +0000 (GMT)
Message-ID: <937773018.41789116303608.JavaMail.epsvc@epcpadp1new>
Date: Fri, 11 Sep 2026 14:11:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOetlOWkjTog562U5aSNOiBbUEFUQ0hdIHhoY2k6IHNpZGViYW5k?=
 =?UTF-8?Q?=3A_check_vdev_liveness_before_removing_endpoints_on_unregister?=
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>, Mathias Nyman
	<mathias.nyman@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "quic_wcheng@quicinc.com"
	<quic_wcheng@quicinc.com>, "broonie@kernel.org" <broonie@kernel.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"cpgs@samsung.com" <cpgs@samsung.com>, "alim.akhtar@samsung.com"
	<alim.akhtar@samsung.com>, "thiagu.r@samsung.com" <thiagu.r@samsung.com>
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <TYUPR06MB6217F0788C14DD89D237C807D2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260911084154epcas5p35d2504edcb322593accc357b9161d7b7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20260910101324epcas5p1faf6f82de85c9468f42f6f9b2f13e99b
References: <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<CGME20260910101324epcas5p1faf6f82de85c9468f42f6f9b2f13e99b@epcas5p1.samsung.com>
	<c17e0351-d390-4a40-89c4-51d4be9f0123@linux.intel.com>
	<360067785.01789039502721.JavaMail.epsvc@epcpadp1new>
	<TYUPR06MB62172308C897F81F7DAFF557D2BF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<750468423.101789103583573.JavaMail.epsvc@epcpadp2new>
	<TYUPR06MB6217F0788C14DD89D237C807D2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>


On 9/11/2026 12:59 PM, 胡连勤 wrote:
> Hi Selva,
>
>>>    drivers/usb/host/xhci-mem.c      |  8 ++++++++
>>>    drivers/usb/host/xhci-sideband.c | 25 ++++++++++++++++++-------
>>>    2 files changed, 26 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
>>> index af8d4b74c4ba..afdcfb38b35f 100644
>>> --- a/drivers/usb/host/xhci-mem.c
>>> +++ b/drivers/usb/host/xhci-mem.c
>>> @@ -922,6 +922,14 @@ void xhci_free_virt_device(struct xhci_hcd *xhci, struct xhci_virt_device *dev,
>>>    		dev->rhub_port->slot_id = 0;
>>>    	if (xhci->devs[slot_id] == dev)
>>>    		xhci->devs[slot_id] = NULL;
>>> +
>>> +	if (dev->sideband) {
>>> +		xhci_dbg(xhci, "vdev for slot %d has sideband still set at free, clearing dangling pointer\n",
>>> +			  slot_id);
>>> +		dev->sideband->vdev = NULL;
>> Thanks for your updated patch.
>>
>> Dont forget to add #include <linux/usb/xhci-sideband.h> in this
>> xhci-mem.c file otherwise getting below error,
>>
>> drivers/usb/host/xhci-mem.c:928:30: error: invalid use of undefined type
>> ‘struct xhci_sideband’
>>       928 |                 dev->sideband->vdev = NULL;
>>
> Include the corresponding header file
> #include <linux/dmapool.h>
>   #include <linux/dma-mapping.h>
>   #include <linux/bitfield.h>
> +#include <linux/usb/xhci-sideband.h>
>   
>
>>> +		dev->sideband = NULL;
>>> +	}
>>> +
>>>    	kfree(dev);
>>>    }
>>>
>>> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
>>> index a5deeee4d5dc..6312c9e3af65 100644
>>> --- a/drivers/usb/host/xhci-sideband.c
>>> +++ b/drivers/usb/host/xhci-sideband.c
>>> @@ -472,12 +472,22 @@ xhci_sideband_unregister(struct xhci_sideband *sb)
>>>
>>>    	scoped_guard(mutex, &sb->mutex) {
>>>    		vdev = sb->vdev;
>>> -		if (!vdev)
>>> -			return;
>>> -
>>> -		for (i = 0; i < EP_CTX_PER_DEV; i++)
>>> -			if (sb->eps[i])
>>> -				__xhci_sideband_remove_endpoint(sb, sb->eps[i]);
>>> +		/*
>>> +		 * If vdev is NULL, xhci_free_virt_device() has already
>>> +		 * cleared sb->vdev and freed vdev (e.g. on
>>> +		 * COMP_USB_TRANSACTION_ERROR during address device
>>> +		 * recovery). Skip endpoint cleanup as the xHC has already
>>> +		 * disabled the slot.
>>> +		 *
>>> +		 * The interrupter and sideband instance are host-level
>>> +		 * resources independent of vdev, so still remove and free
>>> +		 * them to avoid leaks.
>>> +		 */
>>> +		if (vdev) {
>>> +			for (i = 0; i < EP_CTX_PER_DEV; i++)
>>> +				if (sb->eps[i])
>>> +					__xhci_sideband_remove_endpoint(sb, sb->eps[i]);
>> I have one query on  skip endpoint cleanup due to  vdev is NULL, in this
>> case the pointers in sb->eps are not cleared. Since these pointers point
>> into the virtual device eps, any subsequent call to sideband API
>> functions like xhci_sideband_get_endpoint_buffer() that dereference
>> sb->eps could result in a use after free if the virtual device has been
>> freed. Is it possible?
> Yes, you're absolutely right. If sb->eps[] is not cleared when vdev
> is NULL, subsequent calls to xhci_sideband_get_endpoint_buffer() or
> similar API functions would dereference dangling pointers into the
> freed vdev, resulting in use-after-free.
>
> I added the else branch to clear sb->eps[]:
>
> 	} else {
> 		for (i = 0; i < EP_CTX_PER_DEV; i++)
> 			sb->eps[i] = NULL;
> 	}
>
>
> The complete code modification is as follows:
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index af8d4b74c4ba..448d28aaff3e 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -15,6 +15,7 @@
>   #include <linux/dmapool.h>
>   #include <linux/dma-mapping.h>
>   #include <linux/bitfield.h>
> +#include <linux/usb/xhci-sideband.h>
>   
>   #include "xhci.h"
>   #include "xhci-trace.h"
> @@ -922,6 +923,14 @@ void xhci_free_virt_device(struct xhci_hcd *xhci, struct xhci_virt_device *dev,
>   		dev->rhub_port->slot_id = 0;
>   	if (xhci->devs[slot_id] == dev)
>   		xhci->devs[slot_id] = NULL;
> +
> +	if (dev->sideband) {
> +		xhci_dbg(xhci, "vdev for slot %d has sideband still set at free, clearing dangling pointer\n",
> +			 slot_id);
> +		dev->sideband->vdev = NULL;
> +		dev->sideband = NULL;
> +	}
> +
>   	kfree(dev);
>   }
>   
> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
> index a5deeee4d5dc..f979ce517163 100644
> --- a/drivers/usb/host/xhci-sideband.c
> +++ b/drivers/usb/host/xhci-sideband.c
> @@ -472,12 +472,25 @@ xhci_sideband_unregister(struct xhci_sideband *sb)
>   
>   	scoped_guard(mutex, &sb->mutex) {
>   		vdev = sb->vdev;
> -		if (!vdev)
> -			return;
> -
> -		for (i = 0; i < EP_CTX_PER_DEV; i++)
> -			if (sb->eps[i])
> -				__xhci_sideband_remove_endpoint(sb, sb->eps[i]);
> +		/*
> +		 * If vdev is NULL, xhci_free_virt_device() has already
> +		 * cleared sb->vdev and freed vdev (e.g. on
> +		 * COMP_USB_TRANSACTION_ERROR during address device
> +		 * recovery). Skip endpoint cleanup as the xHC has already
> +		 * disabled the slot.
> +		 *
> +		 * The interrupter and sideband instance are host-level
> +		 * resources independent of vdev, so still remove and free
> +		 * them to avoid leaks.
> +		 */
> +		if (vdev) {
> +			for (i = 0; i < EP_CTX_PER_DEV; i++)
> +				if (sb->eps[i])
> +					__xhci_sideband_remove_endpoint(sb, sb->eps[i]);
> +		} else {
> +			for (i = 0; i < EP_CTX_PER_DEV; i++)
> +				sb->eps[i] = NULL;
> +		}
>   
>   		__xhci_sideband_remove_interrupter(sb);
>   
> @@ -486,7 +499,8 @@ xhci_sideband_unregister(struct xhci_sideband *sb)
>   
>   	spin_lock_irq(&xhci->lock);
>   	sb->xhci = NULL;
> -	vdev->sideband = NULL;
> +	if (vdev)
> +		vdev->sideband = NULL;
>   	spin_unlock_irq(&xhci->lock);
>   
>   	kfree(sb);

Looks good to me.

Thanks,
Selva


>
> Thanks
> Lianqin

