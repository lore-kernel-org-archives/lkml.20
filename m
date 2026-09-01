Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC7E3E0226;
	Tue,  1 Sep 2026 02:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788229434; cv=none; b=sw8qo0v5f4blE1nsxodE5dPLcIUnr3m8foFHttf+jgs4GoRMbRglR3TB1Ta4h9ENmX05GRQTRpfPC++x63aFaGRuQtQOCwKWBjEXuHwAxGDUeFCjakcL3vOsKkbrJV3fBsAx8dZBnuJxoHmJZiHN1Sk+ZkzwcuGnAwHmE7OcU+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788229434; c=relaxed/simple;
	bh=G5LStabB6QFZAEcVXe1wEuiL6AHkuvKiHkHlL8uWhJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S79JU1ffIDJWZo7wIjUNMtHtOhusCpp7i0xqAXQdqX34qqKJRFtYZNEL9anSSpGcA49C4pXoRD8KAU9b70LZVcO1ZxPxxj9qbsGTCltrXnZtln8cWKFrMrjkASdrx63fmy1rzBaU1lKHJ0ET0UzQlWpvheUcEQduOP//K32pK64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=SuJSgSF0; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="SuJSgSF0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1788229419;
	bh=pzB3KDZulVd+nzo52v/rACjbHkPYGX06Xhx2sDcIlww=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SuJSgSF0soOHG2fJmlBcMl9vKVTveY7F8+3LTNx7mUX1rkBe8RUT2M/AUkD50nnmP
	 jFamAC5orMK7XZhIAF/hkjUNt+vfiDeVxZWgPdyvwUBaQBo++95b6LhdUZVDjo/4D2
	 IRvZ4QpnUupACvC+mihacpU+TNRNahFMm9mh+7po=
Received: from [198.18.0.1] ([58.206.203.238])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 5E3B2C06; Tue, 01 Sep 2026 10:23:35 +0800
X-QQ-mid: xmsmtpt1788229415tq2ulc4af
Message-ID: <tencent_C444940C7B88A72DCEEB870BD216AC46E705@qq.com>
X-QQ-XMAILINFO: MhK4DKsBP06iS7P+2BwIP3GnqEJgsG4FOkervFDtKNiCECp74twMj7FeA4ZTvv
	 ql8b/5625giyA9V8rIcIjhDW4Ijey4e9nDOtKoEZKSx0ZO3D2+g/MD2CBLqr3KzcHciWxL0FdJjf
	 ofzqvNILpjVdsIAaUR1hfs4/ecojEyiIEX3NnP4eTGosvM57HD2I41gvxtXYRAn1O9cfebMyuuDa
	 nq5ljcF12wZjKYpVxd9gkLWE9NzQSob8FzPARv9oan/QjIasNot+aJ8jCNbCdkRtj5pif+JTr1fz
	 6jB89/ZtjaMfsgEfSf+IfghhHIOAO9kb0HBoL+UNY6GoOjNqqpMA6WulJoETrmLy0ojEWBsEmduA
	 Dj8YUi8YsK67rVHixWeMsEIDJ2SY87d7KTyTlsfB6pQXNlDFSkdDFAbntTgIj61h00ImTqz3yNr4
	 AmZtc2D9WXFDdgda4nf23e6/U5h9Dw+XaH5RNFSLUyZPs3pyHOtD5kQL042UiQdIstAI6CnM2Gl1
	 FulL13QO/aKScQEypBXRTP2o5g0p5m4lmd21ykbRTY3yJpHYPtLkniXHSRmPwpye+R+CUYcHnDxB
	 gtEpzHoqsXU32L+5H270fN+cQvp9Qdgt3qrRnbPy1ga5zZxpQ5ksTOEgh5bvhbsSHNAN8+p07YKC
	 bm76+yRMERNYHX+7KipD/X3CcFHQ+ZtFVjEAz1YwL7twP9QgFuAx5mbqKf/NRAp9B/TpunmjKocs
	 tWziRBERV/KZX0sKlPj3e8+CVqjBdUet7cJUfqmLFvJLo7ld++07bdDTn1oJcv8KRotOK3PAv6GM
	 ynZEunosk+jF1It3l613fyTQvNgtWFgiDpqxSknj4hGg+7FUxrROHh/g+/tkJ98xT3HpWJx7jJYz
	 DCbaXZ6U8bvAG7U8/5VUOzyT8/phDIoXnLwK5vZ1OYzNeE6vL7rLq9hVWCGbsRc8URyRjW7zqS+H
	 AB/34sW772xTmrp7NVE2IFY+Je3zlhufpVdW9PQTysl/9yi5qJVEPCriu6DirMNbrF2QvEV6eyRn
	 m9HQm6JDBQjXi7Y2OrnAPQfAvlaoHUwnVNqEtLNA9KUr4hF+4f
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-OQ-MSGID: <457e58b3-b52d-43d4-bf5c-1a1827ce4202@foxmail.com>
Date: Tue, 1 Sep 2026 10:23:33 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] usb: gadget: goku_udc: move debug output to
 debugfs
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, Felipe Balbi <balbi@kernel.org>,
 Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260826-b4-fix-usb-v3-0-b28366e817f3@foxmail.com>
 <tencent_D7673CCE71B03F2C90CD60873AB4A245D808@qq.com>
 <2026082632-blank-thyself-00a6@gregkh>
From: Cheng Lingfei <chenglingfei@foxmail.com>
In-Reply-To: <2026082632-blank-thyself-00a6@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/2026 5:27 PM, Greg Kroah-Hartman wrote:
> On Wed, Aug 26, 2026 at 05:15:06PM +0800, Cheng Lingfei wrote:
>> goku_udc exposes diagnostic state through /proc/driver/udc. The single
>> global proc entry collides when more than one controller is probed and
>> triggers a proc registration warning.
>>
>> The data is intended only for debugging and is not a userspace ABI. Move it
>> under the USB debugfs root and use the PCI device name for a per-device
>> directory. Create the file only after the UDC has been registered.
>>
>> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Link: https://lore.kernel.org/2026082616-glue-atlas-0cfd@gregkh
>> Assisted-by: Codex:gpt-5.6
>> Signed-off-by: Cheng Lingfei <chenglingfei@foxmail.com>
>> ---
>>   drivers/usb/gadget/udc/goku_udc.c | 47 +++++++++++++++++++++++++++------------
>>   drivers/usb/gadget/udc/goku_udc.h |  5 ++++-
>>   2 files changed, 37 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/udc/goku_udc.c b/drivers/usb/gadget/udc/goku_udc.c
>> index ac2a984c2f87..5ad8633f522b 100644
>> --- a/drivers/usb/gadget/udc/goku_udc.c
>> +++ b/drivers/usb/gadget/udc/goku_udc.c
>> @@ -20,6 +20,7 @@
>>   // #define	VERBOSE		/* extra debug messages (success too) */
>>   // #define	USB_TRACE	/* packet-level success messages */
>>   
>> +#include <linux/debugfs.h>
>>   #include <linux/kernel.h>
>>   #include <linux/module.h>
>>   #include <linux/pci.h>
>> @@ -30,9 +31,9 @@
>>   #include <linux/timer.h>
>>   #include <linux/list.h>
>>   #include <linux/interrupt.h>
>> -#include <linux/proc_fs.h>
>>   #include <linux/seq_file.h>
>>   #include <linux/device.h>
>> +#include <linux/usb.h>
>>   #include <linux/usb/ch9.h>
>>   #include <linux/usb/gadget.h>
>>   #include <linux/prefetch.h>
>> @@ -1050,9 +1051,7 @@ static inline const char *dmastr(void)
>>   		return "(dma IN)";
>>   }
>>   
>> -#ifdef CONFIG_USB_GADGET_DEBUG_FILES
>> -
>> -static const char proc_node_name [] = "driver/udc";
>> +#ifdef CONFIG_USB_GADGET_DEBUG_FS
> 
> Why do you need this config option check anymore?

Thank you for your review. This driver follows the existing UDC driver 
pattern (e.g., gr_udc.c), but the additional config option check is 
unnecessary here. The debugfs subsystem already provides stub functions 
when CONFIG_DEBUG_FS is disabled: debugfs_create_dir() returns 
ERR_PTR(-ENODEV), and the removal helpers are safe no-ops.

I'll remove the CONFIG_USB_GADGET_DEBUG_FS conditional from this driver 
in the next revision.

I also noticed that several other UDC drivers still rely on this Kconfig 
option. Some of those checks may be redundant for the same reason, 
though in certain drivers the option also guards debug-only state or 
code. Would it be worthwhile to audit the remaining users in a separate 
follow-up series and, if none require compile-time gating, consider 
removing CONFIG_USB_GADGET_DEBUG_FS entirely?

-- 
Best regards,
Cheng Lingfei

