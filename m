Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92E6283FE5;
	Thu,  8 Oct 2026 07:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442872; cv=none; b=UIVcpY4IM4U7AXHOLMhr7deYq7ty/IUlmUpmgy/SsyIypoIr0w/JKyrZxW2QuH9QZcWvN2C0ACtQPZmxK52XajaU5F7WK++6kLK+RyJRx79mRnA1MIZMyvwklb6OTCJg1mlah3Ht8bTq4SrVCHZdEHfycbme6GbxZ/jX+ecdTVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442872; c=relaxed/simple;
	bh=h73wPTVLtVL8bmddHdlMfN6vKjZ1mA+xoY6PQLngFrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I5SmKUgCvTr2xY1aN4zdAdfwe0ki2VZdDW2mp9VmHVSVeVSA00WyBMGnFPJV9Sfr3Ls8D/HM/Dskhyjyeh9DTr/B8Sl05T4aISxmzA4U3B0K/ww5b2qQg3gR4IKlsbBKKWYjwWZvLhrm6ZShKpbFqBD55DLdcn7wvsPzJy81Gm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.102])
	by gateway (Coremail) with SMTP id _____8CxKvC0P8dqFaATAA--.57200S3;
	Thu, 08 Oct 2026 15:01:08 +0800 (CST)
Received: from [10.20.42.102] (unknown [10.20.42.102])
	by front1 (Coremail) with SMTP id qMiowJAx1cywP8dqS+spAA--.60369S2;
	Thu, 08 Oct 2026 15:01:06 +0800 (CST)
Message-ID: <42bb8b65-226f-42f9-8fa1-81e2f5a7a3cd@loongson.cn>
Date: Thu, 8 Oct 2026 14:58:21 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] EDAC/loongson: Encode node and MC info into mc_idx
To: Borislav Petkov <bp@alien8.de>
Cc: tony.luck@intel.com, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org, chenhuacai@kernel.org,
 Wang Jinwei <wangjinwei@loongson.cn>, Yulong Wang <wangyulong@loongson.cn>,
 Dongyan Qian <qiandongyan@loongson.cn>, Chao Li <lichao@loongson.cn>
References: <20260902084827.2652-1-zhaoqunqin@loongson.cn>
 <20260902084827.2652-2-zhaoqunqin@loongson.cn>
 <20260930003412.GEarxZBOHFAgZg7TL6@fat_crate.local>
Content-Language: en-US
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
In-Reply-To: <20260930003412.GEarxZBOHFAgZg7TL6@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx1cywP8dqS+spAA--.60369S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCF45KrWkXw4rtr4kGr1ruFX_yoW5WryDpF
	WUA3WYkrs8tr10934ktr4DZFySkw4xJasxArsaq3yFkwnIyF1xWF9agr45uFn8Ary0kFyI
	qFWUtw4kuFnrAFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==


在 2026/9/30 08:34, Borislav Petkov 写道:
> On Wed, Sep 02, 2026 at 04:48:25PM +0800, Qunqin Zhao wrote:
>> @@ -23,6 +24,8 @@ struct loongson_edac_pvt {
>>  	 * register state.
>>  	 */
>>  	int last_ce_count;
>> +	u32 mcs_per_node;
>> +	bool mc_idx_valid;
> Why do you need a silly bool if you have valid indices in any case?
>
> You either get it from edac_device_alloc_index() and in that case, the node
> number is always 0 and when you get it from ACPI, you get the right thing
> anyway?
>
> IOW, you init mc_idx properly in the probe function and then you're all set.
The indices are unique, but they are not physically meaningful.

`edac_device_alloc_index()` returns a global atomic counter:

```c
int edac_device_alloc_index(void)
{
    static atomic_t device_indexes = ATOMIC_INIT(0);
    return atomic_inc_return(&device_indexes) - 1;
}
```

It only guarantees uniqueness; it does not encode any node or MC
information. When firmware lacks the "mc-idx" _DSD property on a
multi-node system and the probes run concurrently on different CPUs,
There is no guarantee that `alloc_index()` values map to physical
MC order. Decoding `mc_idx / mc_per_node` and `mc_idx % mc_per_node`
from this counter can report a wrong location.
>>  static int read_ecc(struct mem_ctl_info *mci)
>> @@ -44,7 +47,8 @@ static int read_ecc(struct mem_ctl_info *mci)
>>  static void edac_check(struct mem_ctl_info *mci)
> In a prepatch, please remove the "edac_" prefix from all your driver-local
> definitions like edac_probe() or loongson_edac_pvt. The edac_ namespace
> belongs to the EDAC core functions. Since your functions are static, you can
> simply call them probe(), check() etc.
Will fix.
>>  	struct loongson_edac_pvt *pvt = mci->pvt_info;
>> -	int new, add;
>> +	char other_detail[64] = {0};
>> +	int new, add, node, mc;
>>  
>>  	new = read_ecc(mci);
>>  	add = new - pvt->last_ce_count;
> ...
>
>>  static int edac_probe(struct platform_device *pdev)
>>  {
>>  	struct edac_mc_layer layers[2];
>>  	struct mem_ctl_info *mci;
>> +	struct device *dev = &pdev->dev;
>>  	void __iomem *vbase;
>> +	u32 mcs_per_node;
>>  	int ret;
>> +	bool mc_idx_valid = true;

If this bool variable serves a real purpose, I'll place it between the u32 and int.


Thanks,

Qunqin.

> The EDAC tree preferred ordering of variable declarations at the
> beginning of a function is reverse fir tree order::
>
> 	struct long_struct_name *descriptive_name;
> 	unsigned long foo, bar;
> 	unsigned int tmp;
> 	int ret;
>
> The above is faster to parse than the reverse ordering::
>
> 	int ret;
> 	unsigned int tmp;
> 	unsigned long foo, bar;
> 	struct long_struct_name *descriptive_name;
>
> And even more so than random ordering::
>
> 	unsigned long foo, bar;
> 	int ret;
> 	struct long_struct_name *descriptive_name;
> 	unsigned int tmp;
>
> Thx.
>

