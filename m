Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379239;
	b=AY1q07WypYjTMYnjxwq5QuGxdKmdjUfLm+vdC148ab/XsO4T8Qy/5WyVBysYNaHsYFRp
	 ypjeNR6RrAAvqTdsTgvOAqiA/g/0aFgxEJL+0cyZLNjeT6HNmN/FWZdJxRqz97SwewHaN
	 a9T1QI0vng+14lHiYz2keN/RVz/AkEto0GYkgZg+m3zxw+AZjeAQxO3WgePvVrZG4wI/x
	 vjL8EEfUufvdSaleOuFFvyv78vCoV0ucgZMghHxtL4Nh0qsIdvUiWTpIymiZTmlFQBaB2
	 fogQd8vBKtHpThDgkoYgQG68d5HeBZLP6WsFxh97neKRro61XM8GeZ4/XvNsipOalbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379239;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=mS7f3LBNsYvviLImdAlV+37u0J808vqvFdf+W/WMDc0=;
	b=LQ1LE+B58pi18U6bO9WTnkRbGmvvkBNRJFa3gHZk9nR1jSb8euZHQqVvJzIdIvhU0eKA
	 TTMSlgv3VaF+vY2OA45FctlNaLnMnkNg+RuU4OLHWifBBuGeW+1AMcq9RwTCE+V1CcYVC
	 mE6OxQGNRxJS3685g/ZTwDJ4Oz9qrkgCNFQybOIRCXlwNnycSx558xwpU5He8l3S74D0+
	 hxesSy37ESKVnvTUTnk1ag3lAdX9L7k99TbninaYKlPr1zF79xbFzw3HK0TmhpeKqeKeL
	 2VB1JE8wiq8TFNwoqe6PeH29pf7AxQ0ElqYGGdFuCMxZHpMEN8rhGK95Y/C36S+ZWGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91361606A321;
	Wed, 11 Nov 2026 06:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91361606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.102])
	by gateway (Coremail) with SMTP id _____8BxbdLeDfRqQXQeAA--.24050S3;
	Wed, 11 Nov 2026 14:40:30 +0800 (CST)
Received: from [127.0.0.1] (unknown [127.0.0.1])
	by front1 (Coremail) with SMTP id qMiowJCxtMzaDfRq3akzAA--.13034S2;
	Wed, 11 Nov 2026 14:40:29 +0800 (CST)
Message-ID: <f34b681b-1499-43c8-b8a7-1437409bd709@loongson.cn>
Date: Wed, 11 Nov 2026 14:37:39 +0800
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
To: Borislav Petkov <bp@alien8.de>
Cc: Qunqin Zhao <zhaoqunqin@163.com>, tony.luck@intel.com,
 linux-edac@vger.kernel.org, chenhuacai@kernel.org,
 linux-kernel@vger.kernel.org, Wang Jinwei <wangjinwei@loongson.cn>,
 Yulong Wang <wangyulong@loongson.cn>, Dongyan Qian
 <qiandongyan@loongson.cn>, Chao Li <lichao@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
References: <20261105025532.2055-1-zhaoqunqin@163.com>
 <20261105025532.2055-3-zhaoqunqin@163.com>
 <20261110064106.GAavK8ghva7DgZ35DK@fat_crate.local>
 <809041a2-ebdd-409d-a1f4-3ac7884513d2@loongson.cn>
 <20261110080338.GJavLP2h448voZSQRE@fat_crate.local>
 <61dc34e7-e872-42cb-a0b1-be100a78053a@loongson.cn>
 <20261110183101.GEavNi5Qrv3eLe80VL@fat_crate.local>
Content-Language: en-US
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
In-Reply-To: <20261110183101.GEavNi5Qrv3eLe80VL@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxtMzaDfRq3akzAA--.13034S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXF1kKrWrtFyUKF13tFyrGrX_yoW5CF18pF
	4UCa1Y9rWrtryDWw1vyF4UZa4a93WrKasFgw4xZa18Kr9FkryUXryfWrW2vFyDA348CF15
	Z3WrGr4xCFWDGFgCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_
	JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU
	0xZFpf9x07je0PfUUUUU=


在 2026/11/11 02:31, Borislav Petkov 写道:
> On Tue, Nov 10, 2026 at 04:23:29PM +0800, Qunqin Zhao wrote:
>> mc-idx is not guaranteed. There is firmware that does not provide the property.
> Ok, I guess you can do something like this then. It should work naturally with
> the rest of the EDAC MC index handling:
>
> diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
> index 3c5d29941a38..78fa8d87da0b 100644
> --- a/drivers/edac/loongson_edac.c
> +++ b/drivers/edac/loongson_edac.c
> @@ -14,6 +14,9 @@
>  
>  #define ECC_CS_COUNT_REG	0x18
>  
> +/* Memory controller index invalid due to inability to read it from ACPI, etc */
> +#define MC_IDX_INVALID		BIT(16)
> +
>  struct loongson_pvt {
>  	void __iomem *ecc_base;
>  
> @@ -25,7 +28,6 @@ struct loongson_pvt {
>  	 */
>  	int last_ce_count;
>  	u32 mcs_per_node;
> -	bool mc_idx_valid;
>  };
>  
>  static int read_ecc(struct mem_ctl_info *mci)
> @@ -56,7 +58,7 @@ static void loongson_check(struct mem_ctl_info *mci)
>  	if (add <= 0)
>  		return;
>  
> -	if (pvt->mc_idx_valid) {
> +	if (pvt->mc_idx >= MC_IDX_INVALID) {
>  		node = mci->mc_idx / pvt->mcs_per_node;
>  		mc = mci->mc_idx % pvt->mcs_per_node;
>  		snprintf(other_detail, sizeof(other_detail), "node:%d mc:%d", node, mc);
> @@ -82,14 +84,12 @@ static void dimm_config_init(struct mem_ctl_info *mci)
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
> @@ -100,7 +100,6 @@ static int loongson_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	void __iomem *vbase;
>  	u32 mcs_per_node;
> -	bool mc_idx_valid = true;
>  	int ret;
>  
>  	vbase = devm_platform_ioremap_resource(pdev, 0);
> @@ -129,15 +128,13 @@ static int loongson_probe(struct platform_device *pdev)
>  	mci->error_desc.grain = 8;
>  	mci->edac_check = loongson_check;
>  
> -	if (device_property_read_u32(dev, "mc-idx", &mci->mc_idx)) {
> -		mci->mc_idx = edac_device_alloc_index();
> -		mc_idx_valid = false;
> -	}
> +	if (device_property_read_u32(dev, "mc-idx", &mci->mc_idx))
> +		mci->mc_idx = edac_device_alloc_index() | MC_IDX_INVALID;

Thanks for your patch. I’ve tested it and found a minor issue. 

If we encode the presence of the _DSD property into mc_idx, 

the sysfs representation will become confusing. For example:

loongson@loongson:~$ ls /sys/devices/system/edac/mc/
mc65536  power  subsystem  uevent
^^^^^^


Qunqin,

Thanks.

>  
>  	if (device_property_read_u32(dev, "mcs-per-node", &mcs_per_node) || mcs_per_node == 0)
>  		mcs_per_node = 4;
>  
> -	pvt_init(mci, vbase, mc_idx_valid, mcs_per_node);
> +	pvt_init(mci, vbase, mcs_per_node);
>  	dimm_config_init(mci);
>  
>  	ret = edac_mc_add_mc(mci);
>

