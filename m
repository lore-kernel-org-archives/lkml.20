Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E62F4519A8;
	Mon, 28 Sep 2026 06:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578709; cv=none; b=hkK3hGdXIIcoMNPeTsYRNFobIO1e3hvQi2qj9EKW0J9qXtvRuplL7mP63f7bV8vXFkIyijRrdurRM+pFqrsg3ZSBDN1K8mCkcZy9NdwY5HCTWoEqzZeQ/1VyR0OxJIx1lLlJllKFLpyKckFwlkIfBSJm+iRUccF3KyLDJ/hUWd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578709; c=relaxed/simple;
	bh=z3n3rg8k6zTgjeFWHEW3cLredLpTE0Dl6r06+sShjxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dlMnnw9O3BiQg6hOiPGLkywb30WeRnDNLQHe4G1R2z2zZLcoOKhBfKDh1WJc+IvrUETmw35ZfQGQYlfHCxd4fmpOplbMPoJnabcUO55vVgJQnfkDAYnl3IKF9F8+m4Cj6ZCwmIZ7BYORn0sf65x2pnn0eB6iE4I1Xo+zfTWfpaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f99bf2f6bb0911f19a56ed5b684f684d-20260928
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:caa1c705-9a11-4072-83c6-de7ddb604b48,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:e5c8ad7c1779f63221775d3fe4af8e69,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0|15|52|99,
	EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f99bf2f6bb0911f19a56ed5b684f684d-20260928
X-User: dengjie03@kylinos.cn
Received: from [10.42.12.246] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 24528131; Mon, 28 Sep 2026 14:58:14 +0800
Message-ID: <97a321af-12e1-41a4-a401-159b8fe955f8@kylinos.cn>
Date: Mon, 28 Sep 2026 14:58:11 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: cdns3: Fix NULL pointer dereference in
 cdns3_pci_probe
To: Greg KH <gregkh@linuxfoundation.org>
Cc: pawell@cadence.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Peter Chen <peter.chen@kernel.org>
References: <20260810023626.70669-1-dengjie03@kylinos.cn>
 <154cb7e0-f2ae-4ed4-b661-0904a12b9e06@kylinos.cn>
 <ao5PoUihfGkPGeSJ@hu-petche-lv.qualcomm.com>
From: Jie Deng <dengjie03@kylinos.cn>
In-Reply-To: <ao5PoUihfGkPGeSJ@hu-petche-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Greg,

A gentle ping on this patch:
   [PATCH v2] usb: cdns3: Fix NULL pointer dereference in cdns3_pci_probe
https://lore.kernel.org/all/20260810023626.70669-1-dengjie03@kylinos.cn/

It carries Peter Chen's Acked-by and fixes a NULL pointer dereference on
two-function Cadence USBSS devices. Could you take a look and queue it
when you get a chance?

Thanks,
Jie

在 2026/8/26 10:29, Peter Chen 写道:
> On 26-08-25 14:50:55, Jie Deng wrote:
>> Hi Peter,
>> Thanks for the review.
>> I've sent the v2 with the Fixes tag updated to 7733f6c32e36
>> ("usb: cdns3: Add Cadence USB3 DRD Driver") and your Acked-by
>> added, per your suggestion:
>>
>>    v2 patch:
>> https://lore.kernel.org/all/20260810023626.70669-1-dengjie03@kylinos.cn/
>>
>> Could you please help pick it up when you get a chance?
>> Thanks,
>>
> Hi Jie,
>
> Usually, Greg will queue it.
>
> Peter
>> 在 2026/8/10 10:36, Jie Deng 写道:
>>> The Cadence USBSS controller is a two-function PCI device. The first
>>> probed function allocates the driver data and stores it with
>>> pci_set_drvdata(), while the second function reuses it via
>>> pci_get_drvdata() when pci_is_enabled() reports that the first
>>> function has already been probed.
>>>
>>> When the second function is probed while the first one has been
>>> enabled but has not yet set its driver data, pci_get_drvdata()
>>> returns NULL, and the subsequent wrap->devfn assignment dereferences
>>> a NULL pointer and crashes the kernel.
>>> logs:
>>> Call trace:
>>>     cdns3_pci_probe+0xa4/0x300
>>>     local_pci_probe+0x44/0xa8
>>>     pci_call_probe+0x54/0x158
>>>     pci_device_probe+0x84/0x100
>>>     really_probe+0x184/0x3d0
>>>     __driver_probe_device+0x80/0x178
>>>     driver_probe_device+0x44/0xe8
>>>     __driver_attach+0xec/0x1f8
>>>     bus_for_each_dev+0x7c/0xe0
>>>     driver_attach+0x28/0x38
>>>     bus_add_driver+0x110/0x238
>>>     driver_register+0x64/0x128
>>>     __pci_register_driver+0x50/0x60
>>>     cdns3_pci_driver_init+0x28/0x38
>>>     do_one_initcall+0x5c/0x280
>>>     do_initcalls+0x104/0x1d8
>>>     kernel_init_freeable+0x140/0x218
>>>     kernel_init+0x28/0x1f8
>>>     ret_from_fork+0x10/0x20
>>>
>>> Return -EPROBE_DEFER in this case so that probing is retried after
>>> the first function has completed its probe.
>>>
>>> Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
>>> Signed-off-by: Jie Deng <dengjie03@kylinos.cn>
>>> Acked-by: Peter Chen <peter.chen@kernel.org>
>>> ---
>>> Changes in v2:
>>> - Fix the wrong Fixes tag: 8bc1901ca7b0 was reverted, use 7733f6c32e36
>>>     which introduced the driver in the current tree (per Peter Chen's review)
>>> - Add Acked-by from Peter Chen
>>>
>>>    drivers/usb/cdns3/cdns3-pci-wrap.c | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/usb/cdns3/cdns3-pci-wrap.c b/drivers/usb/cdns3/cdns3-pci-wrap.c
>>> index eb5760f75b9d..fd06a3d8e638 100644
>>> --- a/drivers/usb/cdns3/cdns3-pci-wrap.c
>>> +++ b/drivers/usb/cdns3/cdns3-pci-wrap.c
>>> @@ -96,6 +96,11 @@ static int cdns3_pci_probe(struct pci_dev *pdev,
>>>    	if (pci_is_enabled(func)) {
>>>    		wrap = pci_get_drvdata(func);
>>> +		if (!wrap) {
>>> +			dev_err(&pdev->dev,
>>> +				"second function not initialized, retrying\n");
>>> +			return -EPROBE_DEFER;
>>> +		}
>>>    	} else {
>>>    		wrap = kzalloc_obj(*wrap);
>>>    		if (!wrap)
