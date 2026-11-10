Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297017;
	b=oDKJnaFgkBClenkwfrlyBTa63vKVX+VZofzER6maFv+amW9IuCNO7rMVjjxoQOsfyM5/
	 9CaUVi6eZ1JCr+qwVh9L55vF7UWtwc8IOUDJApgQPRs42lxyYbq7JWXUSecIf2E9I+9gx
	 Oxlgck91i1d+tjQ6AbX3dV3kYylPCDc4qNAXSjDZ8of4d/GM73UjYTzKppkkHBP7sf7Wc
	 FYVNxF2N8/3DG8A5xFrJfKbJMrV9hcL1K152xwAycEaXTc3Izc1OMyGYQkVL1cxsvSasB
	 Cxaw2iZDs9ICX7OrrSi2iC7L0XH0wEwT69wyDTWdWe0PuvYLMs9rkMTBjtzGbYuMW7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297017;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=RROawpMCmx14r/bjm0VY3A3l55TMRC7oAMQr+nNXxXM=;
	b=SVEP85Km6DUlek/FXCYbPTc+57SF6H1x+b4KlMcivEC1/u/mfLY1tBVuVK9bpJ+gDALa
	 1t12c+FejIw69tnSZXhynHlzWrQgl86L0YQOmJhFnxeZLuD5SI+DwIRbcRKfTGJrii4h5
	 nRwh8DA5fzILzDKLyu3/YY2LP8fkMQpBKlS0/RmdiFbLKF8ID+K4P71+WJr2taOESAC+5
	 tiJRujPz4R91bOFj4TQiEVrH6gluxMBti5xFLGcHs/exfkkdPfohC93voW3Ebaksq9MIp
	 gkvxVjG8yllcNHtUPQb6YEnARtOIS95Y0mO5aFRuEnPt7Yt73w2057jb4M5gBl8uiDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7E2606C61F;
	Tue, 10 Nov 2026 07:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E7E2606C61F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.102])
	by gateway (Coremail) with SMTP id _____8BxLNKzzPJq+BoeAA--.21335S3;
	Tue, 10 Nov 2026 15:50:11 +0800 (CST)
Received: from [127.0.0.1] (unknown [127.0.0.1])
	by front1 (Coremail) with SMTP id qMiowJAxlMyvzPJqi3AzAA--.12281S2;
	Tue, 10 Nov 2026 15:50:09 +0800 (CST)
Message-ID: <809041a2-ebdd-409d-a1f4-3ac7884513d2@loongson.cn>
Date: Tue, 10 Nov 2026 15:47:20 +0800
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
Subject: Re: [PATCH v6 2/4] EDAC/loongson: Encode node and MC info into mc_idx
To: Borislav Petkov <bp@alien8.de>, Qunqin Zhao <zhaoqunqin@163.com>
Cc: tony.luck@intel.com, linux-edac@vger.kernel.org, chenhuacai@kernel.org,
 linux-kernel@vger.kernel.org, Wang Jinwei <wangjinwei@loongson.cn>,
 Yulong Wang <wangyulong@loongson.cn>, Dongyan Qian
 <qiandongyan@loongson.cn>, Chao Li <lichao@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
References: <20261105025532.2055-1-zhaoqunqin@163.com>
 <20261105025532.2055-3-zhaoqunqin@163.com>
 <20261110064106.GAavK8ghva7DgZ35DK@fat_crate.local>
Content-Language: en-US
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
In-Reply-To: <20261110064106.GAavK8ghva7DgZ35DK@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxlMyvzPJqi3AzAA--.12281S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxZryfWF45Wr1fKFy5CF4rWFX_yoW5KFyfpF
	45Caya9F4rtryDWw1vyr4DZa4av3Z7Ka9Fgwsayw48Gr9Ik34UXFyfWrW2vF9rA34kKr1f
	Z3WrGr4xCayDJFbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_
	JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU
	0xZFpf9x07jepB-UUUUU=


在 2026/11/10 14:41, Borislav Petkov 写道:
> On Thu, Nov 05, 2026 at 10:55:30AM +0800, Qunqin Zhao wrote:
>> From: Wang Jinwei <wangjinwei@loongson.cn>
>>
>> On Loongson multi-node systems, memory controllers are distributed across
>> multiple nodes. Encode node and MC information into mc_idx so that sysfs
>> entries uniquely identify each controller.
>>
>> The driver gets mc-idx from ACPI _DSD property if firmware provides it.
>> If not, it falls back to edac_device_alloc_index() for legacy firmware
>> compatibility.
> I am still not buying this tinkering so lemme try again.
>
> If you cannot read mc_idx from ACPI, then by lack of options, all your nodes
> belong to memory controller 0. There's no other choice.
>
> And you do init it to 0:
>
>         mci = edac_mc_alloc(0, ARRAY_SIZE(layers), layers,
> 			   ^^^
>
>                             sizeof(struct loongson_pvt));
>
> and the subsequent property read tries to get it.
>
> So, IOW, your MC index is only valid when it is not 0.
>
> IOW, this ontop of yours. Completely untested ofc.
>
> ---
>
> diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
> index 3c5d29941a38..2132264a6d7f 100644
> --- a/drivers/edac/loongson_edac.c
> +++ b/drivers/edac/loongson_edac.c
> @@ -25,7 +25,6 @@ struct loongson_pvt {
>  	 */
>  	int last_ce_count;
>  	u32 mcs_per_node;
> -	bool mc_idx_valid;
>  };
>  
>  static int read_ecc(struct mem_ctl_info *mci)
> @@ -56,7 +55,7 @@ static void loongson_check(struct mem_ctl_info *mci)
>  	if (add <= 0)
>  		return;
>  
> -	if (pvt->mc_idx_valid) {
> +	if (pvt->mc_idx) {
>  		node = mci->mc_idx / pvt->mcs_per_node;
>  		mc = mci->mc_idx % pvt->mcs_per_node;
>  		snprintf(other_detail, sizeof(other_detail), "node:%d mc:%d", node, mc);
> @@ -82,14 +81,12 @@ static void dimm_config_init(struct mem_ctl_info *mci)
>  	dimm->grain = 8;
>  }
>  
> -static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase,
> -		     bool mc_idx_valid, u32 mcs_per_node)
> +static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase, u32 mcs_per_node)
>  {
>  	struct loongson_pvt *pvt = mci->pvt_info;
>  
>  	pvt->ecc_base = vbase;
>  	pvt->last_ce_count = read_ecc(mci);
> -	pvt->mc_idx_valid = mc_idx_valid;
>  	pvt->mcs_per_node = mcs_per_node;
>  }
>  
> @@ -100,7 +97,6 @@ static int loongson_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	void __iomem *vbase;
>  	u32 mcs_per_node;
> -	bool mc_idx_valid = true;
>  	int ret;
>  
>  	vbase = devm_platform_ioremap_resource(pdev, 0);
> @@ -129,15 +125,12 @@ static int loongson_probe(struct platform_device *pdev)
>  	mci->error_desc.grain = 8;
>  	mci->edac_check = loongson_check;
>  
> -	if (device_property_read_u32(dev, "mc-idx", &mci->mc_idx)) {
> -		mci->mc_idx = edac_device_alloc_index();
> -		mc_idx_valid = false;
> -	}
> +	device_property_read_u32(dev, "mc-idx", &mci->mc_idx);
>  
>  	if (device_property_read_u32(dev, "mcs-per-node", &mcs_per_node) || mcs_per_node == 0)
>  		mcs_per_node = 4;
>  
> -	pvt_init(mci, vbase, mc_idx_valid, mcs_per_node);
> +	pvt_init(mci, vbase, mcs_per_node);
>  	dimm_config_init(mci);
>  
>  	ret = edac_mc_add_mc(mci);

"all your nodes belong to memory controller 0"
I don't quite follow this sentence. There are four memory controllers on LS3C6000/S.

On firmware without mc-idx there can still be more than one  memory controller

Each probes with edac_mc_alloc(0, ...),  so if we leave mc_idx at 0 the 

second controller hits the "duplicate  mc_idx" check in add_mc_to_global_list() 

and edac_mc_add_mc() returns  non zero.


Qunqin,

Thanks.

>

