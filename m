Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792989393;
	b=CZS9dxw7Jj3oDMkWQqpGckAxJxS0FRsy1Hb4YROB7ND14BXn3DPgvFGpBWkKI9Q7zt2I
	 SugOqDadbGE6GcISvBvICX7DO19jJv9QSaXsdeQkiJ0kl3ZUNXPWkEDVRB6N4xdrJPhGk
	 azF0GEYiIqZ72nW74W8HtiuRZPOWgfSE3EUCg/C9mtY7kOBGD3Ojs+ljfC9sBKGFop2XW
	 mnS8KMlkvUV6V9eVephB6ObpqYPFJNRJ8NpVmKhGVc53TLgUDrC5Uk//1WGrtbp9FKUh3
	 I8ysiLpiaVzTR5SjxPceAU8tiMccyMaytj1V/OlHVQfkDVxYncWl2g2LB90pIRLm4bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989393;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=fkjASHhjHD9dtcL2FTJk6qqQRP9PpHcbiVA7YApl7Ho=;
	b=nMGYb5j5ZhG+/Ygv9lEtcWsKuwj60Hn1KWRfVSk69BIQ6lwEdi5Uhds3ka0d5bHwO4tT
	 FppvWfTDN9AkgeOhvZz1rAke9B5YiFv94NsJJVOZPDdH5rCmkknEamAVTmCU0WKm3SEKQ
	 2EwT3zA8VAH/XfuA+B3Lof9meRL+Dzn+KXEO9kK/mhH6/SVKfRDpQDMnrcx6u9A93YjFI
	 97DoIsZ3lYNhxwfXi3xiuU+u/WY4YNxtqSgHeidG409IGxC8u7T1HptxUF2euwClZlmoD
	 cZfFWc8vuaY5V/kUvYRnneh+rLkqecxePjsZwmwh4/rs/tcmrOar75cJJELupdARL6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656C2606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 656C2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8Bx79LO2N5qHV4ZAA--.8731S3;
	Mon, 26 Oct 2026 12:36:30 +0800 (CST)
Received: from [127.0.0.1] (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJCx9czM2N5qODkwAA--.7944S2;
	Mon, 26 Oct 2026 12:36:29 +0800 (CST)
Message-ID: <b5044747-0f3a-4a63-9446-829379f3915f@loongson.cn>
Date: Mon, 26 Oct 2026 12:36:28 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/28] mfd: ls2kbmc: Allocate simplefb platform_data on
 the heap
To: Lee Jones <lee@kernel.org>, Chong Qiao <qiaochong@loongson.cn>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-4-lee@kernel.org>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <20261021121245.3111563-4-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJCx9czM2N5qODkwAA--.7944S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEMCGrexPwvHwAAs7
X-Coremail-Antispam: 1Uk129KBj93XoW7KFy5CFWDJF1rJF4kCr1rGrX_yoW8tryDpF
	ykCa43AFs5KFy29a47Gr1kuryYkwsFv340gF93Xa4S93s8J348KFWrKFy8uas3trykJ3W7
	Xr1DtF45uFZ8ZFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Sb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6rWY6Fy7McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcV
	AKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26F1j6w1UMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
	CI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBI
	daVFxhVjvjDU0xZFpf9x07jxSdgUUUUU=



On 2026/10/21 20:09, Lee Jones wrote:
> ls2k_bmc_probe() declares struct simplefb_platform_data on the stack and
> assigns its address to the display MFD cell.  Although mfd_add_device()
> deep-copies platform_data via platform_device_add_data() before
> ls2k_bmc_probe() returns, the shallow mfd_cell copy attached to the
> child platform device retains a stale pointer to the expired stack
> frame.
> 
> Allocate the simplefb_platform_data structure on the heap via
> devm_kzalloc() prior to devm_mfd_add_devices() so the pointer remains
> valid for the lifetime of the child platform device.
> 
> Closes: https://sashiko.dev/#/bug/linux-4e2dd9cb-310b-4bba-b305-ffacc738285c
> Signed-off-by: Lee Jones <lee@kernel.org>

Acked-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>   drivers/mfd/ls2k-bmc-core.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index e245bdee8226..3e3bc835262e 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -470,7 +470,7 @@ static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_platform_da
>   
>   static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)
>   {
> -	struct simplefb_platform_data pd;
> +	struct simplefb_platform_data *pd;
>   	struct ls2k_bmc_ddata *ddata;
>   	resource_size_t base;
>   	int ret;
> @@ -489,12 +489,16 @@ static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)
>   	if (ret)
>   		return ret;
>   
> -	ret = ls2k_bmc_parse_mode(dev, &pd);
> +	pd = devm_kzalloc(&dev->dev, sizeof(*pd), GFP_KERNEL);
> +	if (!pd)
> +		return -ENOMEM;
> +
> +	ret = ls2k_bmc_parse_mode(dev, pd);
>   	if (ret)
>   		return ret;
>   
> -	ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data = &pd;
> -	ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size = sizeof(pd);
> +	ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data = pd;
> +	ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size = sizeof(*pd);
>   	base = pci_resource_start(dev, 0) + LS2K_DISPLAY_RES_START;
>   
>   	/* Remove conflicting efifb device */

-- 
Thanks.
Binbin

