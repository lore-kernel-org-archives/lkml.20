Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAD447125B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039508; cv=none; b=QZOxLO0nBQcgqPaVIJq1Yv39/0JMVUjnr/i1GCXLjkNQSjp0lexqhs5dV+uzYtIJXLQgd/K4NP6KogbfhvqxBqR/6sxxWNYQgLOPXSYbsu2QMgeRBOS5LtcS3G3f3jCI4hQ8Fk/IZglEZWftRqeMlcA37uQXRFZOXzaOHJ0uy8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039508; c=relaxed/simple;
	bh=4Hjex3oCeXjPGzALeMaPEQW++8B/xL5HaZz4fxPh4jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=QhOEy4ZrtNfbTfZc/CHaaModzPLraA0G+ADZjuODhsp7OxaC4/DbJtGbtF6QgI724d4rJsn1Vrbt7BXdfVWt+NdWuh5tOPtEVaEHIiwI2tZKoqbXCW37f0uUPetTejsDQFFiNcVlnW2dB6REl4rANqxZDTcMqQqYxf7SS0vItfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=YO6aIXzx; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="YO6aIXzx"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260910112503epoutp03ec705d89a508ee61428a8ad8a009f9a9~T8fMOLXGE3114231142epoutp03N
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:25:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260910112503epoutp03ec705d89a508ee61428a8ad8a009f9a9~T8fMOLXGE3114231142epoutp03N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789039503;
	bh=R8h1yIEsIROnrfMiWl52bn3VimeVF2ZaPu7ScCbriDM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=YO6aIXzxZVDIppjRMDRXJd5fkuqxVg8AIlL1WWZdEmmGQemfLZDBZqYUFP+ljsKnU
	 088c4IMGseRJ9oNwgvJwcorxCx8yBfVhTFyVSfZl7pd3cVazXiLEXBr6bUgV70hwgo
	 cvojGqHbEb8HXMg8rVaGemkwH6fhc92YeTt8mqu8=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260910112502epcas5p2fc302ad1f944329a56c9eb334497cc13~T8fL1axni2810328103epcas5p2g;
	Thu, 10 Sep 2026 11:25:02 +0000 (GMT)
Received: from epcpadp1new (unknown [182.195.40.141]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4hgb1p5Hh4z6B9m7; Thu, 10 Sep
	2026 11:25:02 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260910111004epcas5p15c5293f941e45eb25a5930eda494b5ee~T8SHjLNvN2834228342epcas5p1F;
	Thu, 10 Sep 2026 11:10:04 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260910111003epsmtip27f09ad88e73efe41ecfe487f6297e70c~T8SGY65Nk1874218742epsmtip2d;
	Thu, 10 Sep 2026 11:10:03 +0000 (GMT)
Message-ID: <360067785.01789039502721.JavaMail.epsvc@epcpadp1new>
Date: Thu, 10 Sep 2026 16:40:02 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xhci: sideband: check vdev liveness before removing
 endpoints on unregister
To: Mathias Nyman <mathias.nyman@linux.intel.com>, =?UTF-8?B?6IOh6L+e5Yuk?=
	<hulianqin@vivo.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg
	Kroah-Hartman <gregkh@linuxfoundation.org>, "quic_wcheng@quicinc.com"
	<quic_wcheng@quicinc.com>, "broonie@kernel.org" <broonie@kernel.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	cpgs@samsung.com
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <c17e0351-d390-4a40-89c4-51d4be9f0123@linux.intel.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260910111004epcas5p15c5293f941e45eb25a5930eda494b5ee
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20260910101324epcas5p1faf6f82de85c9468f42f6f9b2f13e99b
References: <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<CGME20260910101324epcas5p1faf6f82de85c9468f42f6f9b2f13e99b@epcas5p1.samsung.com>
	<c17e0351-d390-4a40-89c4-51d4be9f0123@linux.intel.com>


On 9/10/2026 3:04 PM, Mathias Nyman wrote:
> On 9/7/26 15:24, 胡连勤 wrote:
>> xhci_sideband_unregister() assumes the virtual device (vdev) is still
>> alive when iterating sideband endpoints and issuing stop endpoint
>> commands. However, xhci_disable_and_free_slot() may have already freed
>> vdev and its out_ctx before xhci_sideband_unregister() is invoked.
>>
>> This happens when xhci_setup_device() gets COMP_USB_TRANSACTION_ERROR
>> (e.g. device not responding to setup address during bus reset recovery),
>> causing vdev to be freed before xhci_sideband_unregister() is called:
>>
>>    hub_event()
>>      xhci_setup_device()                  <-- COMP_USB_TRANSACTION_ERROR
>>      xhci_disable_and_free_slot()
>>        xhci_free_virt_device()
>>          kfree(out_ctx), kfree(vdev)
>>          xhci->devs[slot_id] = NULL
>>      ...
>>      usb_disconnect()
>>        uaudio_disconnect()
>>          xhci_sideband_unregister()
>>            xhci_stop_endpoint_sync()
>>              xhci_get_ep_ctx()            <-- CRASH (deref freed 
>> out_ctx)
>>
>> Unable to handle kernel paging request at virtual address 
>> dead000000000122
>> Call trace:
>>   xhci_get_ep_ctx+0x0/0x38
>>   xhci_sideband_unregister+0x68/0xf0
>>   uaudio_disconnect+0x70/0x144
>>   usb_audio_disconnect+0x7c/0x268
>>   usb_unbind_interface+0x13c/0x340
>>   device_release_driver_internal+0x1c4/0x2bc
>>   device_release_driver+0x18/0x28
>>   bus_remove_device+0x158/0x170
>>   device_del+0x1c8/0x320
>>   usb_disable_device+0x84/0x190
>>   usb_disconnect+0xe8/0x338
>>   hub_event+0xbd8/0x19ac
>>   process_scheduled_works+0x200/0x9d8
>>   worker_thread+0x154/0x3b0
>>   kthread+0x11c/0x1a0
>>
>> Fix this by caching the slot_id in the sideband structure at
>> registration time, then checking under xhci->lock whether
>> xhci->devs[slot_id] still matches sb->vdev before issuing stop
>> endpoint commands. If vdev has been freed, skip endpoint cleanup
>> entirely - the xHCI has already disabled the slot.
>> The interrupter is still removed as it does not depend on vdev.
>>
>> The slot_id is cached in sb->slot_id rather than read from vdev at
>> unregister time because vdev may already be freed, making
>> sb->vdev->slot_id a dangling dereference.
>>
>> Fixes: de66754e9f80 ("xhci: sideband: add initial api to register a 
>> secondary interrupter entity")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
>
> Thanks, nice catch and layout of the problem.
>
> I think we need to address this issue a lot earlier than in 
> xhci_sideband_unregister()
>
> xhci_free_virt_device() shouldn't leave any dangling pointers, if 
> vdev->sideband
> is still set at this point then something is wrong, and should as a 
> final resort be
> fixed here. Print a debug message and set vdev->sideband->vdev = NULL 
> before freeing vdev.
>
> Another issue is the transaction error recovery during address device.
> xHCI specs say we should disable and re-enable the slot.
> xhci driver additionally frees and reallocates the vdev.
> We could probably avoid this and just re-initialize the contexts without
> reallocating vdev.  This being said I think it would be even better to 
> not
> try to 'usb persist' sideband over a usb device reset.
>
> Might be best to unregister sideband in qualcomm usb audio driver 
> completely in
> the drv->pre_reset, and re-register it back in drv->post_reset
>
> But to avoid this specific issue we should also set 
> vdev->sideband->vdev to NULL
> in xhci_free_virt_device()

Regarding the suggestion to set vdev->sideband->vdev = NULL within 
xhci_free_virt_device() to avoid dangling pointers, I agree that this 
effectively prevents the use after free during unregistration.

But, I would like to highlight a critical point regarding the 
interrupter lifecycle. Even if sb->vdev is set to NULL , 
__xhci_sideband_remove_interrupter() must still be invoked during the 
unregistration sequence.

If the interrupter removal is skipped because vdev=NULL , the secondary 
interrupter resource is leaked. In our observations, this leads to a 
failure during the subsequent device connection and registration 
attempt, resulting in the error: "Failed to add secondary interrupter, 
max interrupters".

So it is essential that the cleanup path ensures the interrupter is 
released regardless of whether the vdev is still alive.


Thanks,
Selva
>
> Thanks
> Mathias

