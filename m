Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E06470E85;
	Mon, 14 Sep 2026 13:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391387; cv=none; b=I05lAGDY7WsObg0z742t0nGL0Thy9D/KPDz1EHrxp8klnJuca3YuwR8iQJH+MHzdNeVTmLQwKFTs3dlGr47RUpaisyrwwNfS04RqWQ1bkj0k//by29xRhxONC2tLBemsIO+lmBZhKmmBQ5Tl9hoS0L/A3vmnL6aU/JsHtJtqqUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391387; c=relaxed/simple;
	bh=/w2RoKlslHZqgSRqDDWt5Dh434x8iOmP1gRzmd162ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qzaPwUn5cRiejnEyVfUtwcWXu8zzIxkwVK4zr7UVYmHPr4SiA4gFmVMPfhPXJwp+dCFybDHUwa0feylzkGZQLz7swchYkyG2RzE8LBdpz3T5sI11S5r/RZQMmhuCp5hI/13i5zhk0rjvSN7ToLCw4wCf73lGo7WOd/450tfmo3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M02iuHYM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M02iuHYM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789391386; x=1820927386;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/w2RoKlslHZqgSRqDDWt5Dh434x8iOmP1gRzmd162ws=;
  b=M02iuHYMvNooDMuuV65bldNa5/IcQyNr3Rpox3K4lpo466uvljeLRf4a
   yUHVX2Re/v2vvWdT4SGEuwgZChydXLEAXLGGhwJ8l4BuW+KqqY6bk4S6q
   IGj8ULgWV/VbqQy7A7bq4znlC7TvNYpmtfVjc8oqoZsrU30IZoQIqckzk
   SFZrbhj+j9/7w3SA0BFMhJEF/LDwb8iCSwz0nsgkVxAOV6yZq4OOyhsQW
   8dWMDrGdTVLPmiAIaoVBhIEumhoDcGprFvYDN7Rrh8n7LsCRnO9C9jNOG
   DAfFsYSfoCyP57wIVC+cm5XDA+cYNKOErMBAgQR69r105YV7N5QsNGcJ6
   Q==;
X-CSE-ConnectionGUID: vz1qOfPsStqsdnkhoaBlWw==
X-CSE-MsgGUID: ZCn+A3wdSQq7F386jhzcrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="107113292"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="107113292"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 06:09:45 -0700
X-CSE-ConnectionGUID: Cq6bh5SNQNW7iurApD6TrQ==
X-CSE-MsgGUID: QUugE8sKQ4Wy5jtaNJnqjA==
X-ExtLoop1: 1
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.245.60]) ([10.245.245.60])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 06:09:39 -0700
Message-ID: <c6c9890f-46d8-42f1-a7e7-8a5d551fa22c@linux.intel.com>
Date: Mon, 14 Sep 2026 16:09:33 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1BBVENIXSB4aGNpOiBzaWRlYmFuZDogY2hlY2sg?=
 =?UTF-8?Q?vdev_liveness_before_removing_endpoints_on_unregister?=
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
 Michal Pecio <michal.pecio@gmail.com>
Cc: Selvarasu Ganesan <selvarasu.g@samsung.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cpgs@samsung.com" <cpgs@samsung.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "thiagu.r@samsung.com" <thiagu.r@samsung.com>,
 Niklas Neronin <niklas.neronin@linux.intel.com>
References: <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <CGME20260910101324epcas5p1faf6f82de85c9468f42f6f9b2f13e99b@epcas5p1.samsung.com>
 <c17e0351-d390-4a40-89c4-51d4be9f0123@linux.intel.com>
 <360067785.01789039502721.JavaMail.epsvc@epcpadp1new>
 <TYUPR06MB62172308C897F81F7DAFF557D2BF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <750468423.101789103583573.JavaMail.epsvc@epcpadp2new>
 <TYUPR06MB6217F0788C14DD89D237C807D2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <937773018.41789116303608.JavaMail.epsvc@epcpadp1new>
 <191ee5d5-d93d-4fa3-9654-b3735d344118@linux.intel.com>
 <20260912141837.06b2f3cf.michal.pecio@gmail.com>
 <TYUPR06MB62174110FB101AD6B7B069EBD2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20260914110949.38a46596.michal.pecio@gmail.com>
 <TYUPR06MB62170DB4AB23F7A79E8DA466D2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <TYUPR06MB62170DB4AB23F7A79E8DA466D2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/14/26 15:24, 胡连勤 wrote:
> Hi Michal,
> 
>>> Thanks for the analysis. A clarification on the hub_event() reference
>>> in my patch:
>>>
>>> The crash trace shows hub_event() at the top because that's the actual
>>> crash call stack from the failing device. The full sequence is:
>>>
>>>    hub_event()
>>>      -> port_event()                           [hub.c:5966]
>>>         -> usb_reset_device(udev)              [hub.c:5875]
>>>            -> usb_reset_and_verify_device()    [hub.c:6183]
>>>               -> hub_port_init()               [hub.c:6228]
>>>                  -> hcd->driver->address_device()  [hub.c:4781]
>>>                     -> xhci_setup_device()     <-- COMP_USB_TRANSACTION_ERROR
>>>                        -> xhci_disable_and_free_slot()  [xhci.c:4438]
>>>                           -> xhci_free_virt_device()   <-- frees vdev here
>>
>> So not a mistake and this is indeed a dangerous case. And AFAICT, in
>> this path udev's pre_reset() routine isn't called and therefore can't
>> be used to fix your issue, unless USB core is patched to call it.
>>
> Actually it is. The crash path goes through usb_reset_device()
> (hub.c:5875), which calls drv->pre_reset() at hub.c:6412 before
> usb_reset_and_verify_device(). So pre_reset/post_reset is viable —
> if the sideband client is a USB interface driver.
> 
>> But xhci_discover_or_reset_device() is called: before hub_port_init()
>> calls problematic hub_enable_device() / hub_address_device() functions,
>> it calls hub_port_reset(), which calls hcd->driver->reset_device().
>>
>> But I'm not entirely sure what happens if reset fails before this call
>> is made and then hub_port_init() jumps to re_enumerate. The function
>> bails out, but sooner or later somebody will try to free this device in
>> some manner, I suppose, so what happens then?
>>
> By the time we reach re_enumerate (hub.c:6235), xhci_setup_device()
> has already freed vdev+rings via xhci_disable_and_free_slot()
> (xhci.c:4438) without notifying sideband. The later xhci_free_dev()
> is a no-op because xhci->devs[slot_id] is already NULL. So the
> dangerous window is between xhci_discover_or_reset_device() (with
> callback) and xhci_setup_device() failure (without callback).
> Given pre_reset() is available, the proposed fix:
> 
> 1. Sideband client implements pre_reset() to unregister and stop
>      ring access before reset.

Sounds good, call xhci_sideband_remove_endpoint() for every offloaded endpoint.
If possible then maybe even unregister sideband for this device completely here.


> 2. Add a sideband callback in xhci_free_virt_device() for defense
>      in depth.

Selvarasu Ganesan pointed out that xhci 'core' in fact doesn't include
xhci-sideband.h yet. If possible I'd like to keep it that way.

Setting xhci->sideband->vdev to NULL, or calling a callback here changes this
and is the first time we then intertwine xhci core with sideband.

Long term solution is to not reallocate vdev just because we try to disable and
re-enable the slot to recover from a failed address device command.
Usb core doesn't free and reallocate udev during device reset either.

Niklas just started looking at decoupling vdev allocation and initalization.
Meanwhile we could try a bandaid like:

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a9e47e178c28..0b5152a1a301 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4435,11 +4435,15 @@ static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
  		dev_warn(&udev->dev, "Device not responding to setup %s.\n", act);
  
  		mutex_unlock(&xhci->mutex);
-		ret = xhci_disable_and_free_slot(xhci, udev->slot_id);
-		if (!ret) {
-			if (xhci_alloc_dev(hcd, udev) == 1)
-				xhci_setup_addressable_virt_dev(xhci, udev);
+
+		if (!virt_dev->sideband) {
+			ret = xhci_disable_and_free_slot(xhci, udev->slot_id);
+			if (!ret) {
+				if (xhci_alloc_dev(hcd, udev) == 1)
+					xhci_setup_addressable_virt_dev(xhci, udev);
+			}
  		}
+
  		kfree(command->completion);
  		kfree(command);
  		return -EPROTO;

Does this work in your case?
Can you see any negative side-effects with this solution like never re-enumerating and
recovering after a failed address device command?

Thanks
Mathias
