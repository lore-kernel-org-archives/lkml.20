Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C60738AC72;
	Tue,  1 Sep 2026 03:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788232125; cv=none; b=gHpcUztfb9M5cmgkHyspfsI4GHm1C5nAeof8xhLTEwP/fHd0945LcRz7S0ajG1hH+x43u3kS3fkxhgNfyRhVJWvV0OkQfLm5AYT2SLHcGLCeM7UOqsm+TEXH4PFtszHrWGZaDRBSTm3gguXTg1k0/eIJ4F/14P6y8Kumn20eXTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788232125; c=relaxed/simple;
	bh=exRYbENaeqIC9LzQrl1oaL3FO3hyBULOPrf5+b+88N8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T73Tn65+zUCFPsCoDtxZXcNnvM/PQ6kZGJ4DhITQNG12GtU+zGKVR1yBJGjziVK6g7lZjbRFJIW0vr8M9PgZ25E/t4Y4faUQuBPL9vzGrJla5KK+3P7yAtP9t/x4sWDc/C8HrwX06CBQfSh+/WjYl5g3gEdJ8fFvWaBxukmWypM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=UXRsDfoQ; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="UXRsDfoQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1788232111;
	bh=eEsz7+r7qwRJXlGm1iAic9cd7SXMJhQKDo9zhXiMp/Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UXRsDfoQPXTwnU6xc2cTmdo1+3ONr/Eoe3J4mtB2yrkfN+MUZ5z0L2+W6W0AtA9Vl
	 2XWXVFppHI36tUv5plCu5zON26k4bubF/He3RLi8ReXCHOcTLySFPIkvejkpFaXtJ9
	 1Z455t6ljwH5HIGTlwhNfAA8yK4XxHgGUjZg7bp8=
Received: from [198.18.0.1] ([58.206.203.238])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 21C366A4; Tue, 01 Sep 2026 11:08:28 +0800
X-QQ-mid: xmsmtpt1788232108tcd6hcrco
Message-ID: <tencent_CD7E18210FC0A874E644DBB097794EE29C09@qq.com>
X-QQ-XMAILINFO: NlxVGCthfHmZFAK0fER5jLvqeLRrYIEPU6hyEUUcoZQ8XDorFKOId7L4orlH3o
	 P7NQaJJt6Mk7v/CO2Zqnv0n9Wt7eOaDWRIEtPK8Jsnm9p5bUeDYTru4J8NKBHsVeIjOKHSW4YMCy
	 Lbg0lPQh4Zpwrwa6mmEeIYe4eEpBcwyI8X5CFzz55+01AUlHFtbIZtM9er543CaeBV/dBWAD73u6
	 r6yVuUZCI/2GOfRE8c3/ZBV9R3f7rDIuC0d0s/lyfnMHbbol645Z+uaDlsaLHW3NNd5CyUQWXeSB
	 Vl3T5NmHvfCC+TpJ2KMM8NWzQqoMZnewA5eFvigeeUowZHZJGeLr0bN9VxE0FPuCPjClqbREJiKH
	 b24SJCVkUfFZTl8/TTPdvh9aeFuyfpKQDcSZmjPy/7KYm8H298cJB5oNiWJntx7Y+8f7O5lNXch/
	 IxsgDcLNVRPwp6JqQdw7K5PxvaCO4bJMJpkJTbmD5Ujy3xY4vhDW/FBEYK9JVs8fwSEjgpO9BkL2
	 KtQPYniAa18k2x+F1zwULWsgxvHkNWcKPMMoJ547GbI3AaAOsVMXaXE0Y0Pt7iZlxLzkGUaDxobc
	 xn4pHZzOyBiDxXUcNeGRFe8BdIUZkuUN9Fr8V3D93nt92hwWX+kcrLbY3qthn0DOi/TdpUhdYKJU
	 f6vpeOH8AGK2WQtipoEL9sI5jVRgVjTp95Vw38Qxg78ruRSaEeMaqxvLYmgXHiVbi7qNaNq8EScx
	 MI18jsEy5WK5V6IsLJqzRk1t0lr4HhbrkZtNUTwEciZMdfdzD1oGP031VhOlSeDcJq245wb/buUU
	 wQVK15lUzXR2eoQeVSx7i9vnq+H9f422ZrVJvsY8tDsQVaQd8HMYE05lbKhcMdKRKJrR63c3TbpH
	 fTXcqGrJgqkcE/wx9Ig7Pfxuasw9g5JnH7j5KhJNW2vtPSCPXn3ywlzmK5s4EEowlAQMflKexTdT
	 g5/kFF3M73ptYPf2PmRGIu/6WYhnlxfACeVaYXOEySx5ZiAAoGNuDqjp6cY807iHQcNnXQvUF8F6
	 G8lORqEI902MDyrNwhubALmqJohLaek/s7z0tXCWS3YRopq9g8J69SEgu17xD4mqL3A4C3QS+V1r
	 LEYc+vWv68GQKdvX0=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-OQ-MSGID: <e059628d-2f57-4c1d-830b-0387eee74e24@foxmail.com>
Date: Tue, 1 Sep 2026 11:08:26 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] usb: gadget: goku_udc: fix kobject warning on
 probe failure
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, Felipe Balbi <balbi@kernel.org>,
 Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
References: <20260826-b4-fix-usb-v3-0-b28366e817f3@foxmail.com>
 <tencent_79E338821F4FC825B0149D5951476C189E07@qq.com>
 <2026082647-tripping-skater-fe31@gregkh>
From: Cheng Lingfei <chenglingfei@foxmail.com>
In-Reply-To: <2026082647-tripping-skater-fe31@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/2026 5:27 PM, Greg Kroah-Hartman wrote:
> On Wed, Aug 26, 2026 at 05:15:07PM +0800, Cheng Lingfei wrote:
>> goku_probe() calls goku_remove() when hardware initialization fails, but
>> the gadget device is initialized only near the end of probe. As a result,
>> goku_remove() calls usb_del_gadget_udc(), which drops a reference to an
>> uninitialized gadget device and triggers a kobject warning.
>>
>> Initialize the gadget device immediately after allocating the controller,
>> but add it only after all hardware resources have been acquired. Track the
>> gadget registration state so goku_remove() can safely clean up both partial
>> probe state and a fully initialized device.
>>
>> Use the split gadget removal API and drop the final gadget reference only
>> after all hardware resources have been released. Obtain the controller from
>> the embedded gadget device in the release callback because driver data is
>> set on the PCI device rather than the gadget device.
>>
>> Fixes: 3301c215a2bb ("USB: UDC: Expand device model API interface")
>> Reported-by: syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=06ec7624018233e17113
>> Tested-by: syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
>> Assisted-by: Codex:gpt-5.6
>> Signed-off-by: Cheng Lingfei <chenglingfei@foxmail.com>
>> ---
>>   drivers/usb/gadget/udc/goku_udc.c | 28 ++++++++++++++--------------
>>   drivers/usb/gadget/udc/goku_udc.h |  3 ++-
>>   2 files changed, 16 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/udc/goku_udc.c b/drivers/usb/gadget/udc/goku_udc.c
>> index 5ad8633f522b..615cc6b8f354 100644
>> --- a/drivers/usb/gadget/udc/goku_udc.c
>> +++ b/drivers/usb/gadget/udc/goku_udc.c
>> @@ -20,6 +20,7 @@
>>   // #define	VERBOSE		/* extra debug messages (success too) */
>>   // #define	USB_TRACE	/* packet-level success messages */
>>   
>> +#include <linux/container_of.h>
>>   #include <linux/debugfs.h>
>>   #include <linux/kernel.h>
>>   #include <linux/module.h>
>> @@ -1726,7 +1727,7 @@ static irqreturn_t goku_irq(int irq, void *_dev)
>>   
>>   static void gadget_release(struct device *_dev)
>>   {
>> -	struct goku_udc	*dev = dev_get_drvdata(_dev);
>> +	struct goku_udc *dev = container_of(_dev, struct goku_udc, gadget.dev);
> 
> That looks wrong.  If it is correct, please create a proper macro for it
> so that you verify that this all is working properly.

The object allocated by goku_probe() is struct goku_udc, with struct 
usb_gadget embedded in it. Therefore, when the gadget release callback 
is invoked with a pointer to the embedded gadget.dev, it must recover 
and free the enclosing struct goku_udc.
This follows the same pattern used by the net2280 and fsl_qe_udc 
drivers. I agree that the conversion should be made explicit, so I will 
add a helper macro in the next revision:

#define to_goku_udc(g) \
	container_of((g), struct goku_udc, gadget)

#define gadget_dev_to_goku_udc(d) \
	to_goku_udc(dev_to_usb_gadget(d))

-- 
Best regards,
Cheng Lingfei

