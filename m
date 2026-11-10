Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299189;
	b=JNPIErBrXQhBq6Sq1RMq1GDQXS2b5WMri46dj8sQ6riw2eLrR5teYzR6KMDFxu9REH3z
	 9YEvWwuo38Xak9LFwG/BjnjyGi/DydOhqsbTxvsXxLMfW2yljv4c8dH3iMEz4Z/KL1EC5
	 5qXJXBJP9kcXUbFQSShykXBXdgf2XLA/g9YVGzUnNSbyoSJUo33BYO8QNJ0dvHKgci97w
	 hW48qAhHXEaQKNEHTo2oZQ3XPGCAptXvuVumpnD/aOIx9/HiVYPXZfZSveqLImyhgRAq0
	 JV9exjk/IeJJSySlOUnLIAqSM9nipDiN4Etdq7/QruA1yjf/CbnT/wMMhkx0ENgIHKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299189;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=R4EAcCpHM83oZ0S7+xLkLWc02XjcnZxXTSXnWoPgwPg=;
	b=O29aMyTmHZ8pN3DFyFLsTlhonBK533qw8Rq/wZhrxSlqZP5oDqFhdVfhd6KIn9C4MxeJ
	 WwG3voWjXI3zCxfHawm9gXY4e4xtArIzFUAKt0TJRgWQkRc0rvnZ9f58dwGbej47v91pA
	 HGbkSAK61khlp99OEM9RZiZyOi0Gswu+ZNeqHIDfVnZlmxA5IQj0SYQWY8Fj/JAfTRYRj
	 Ve4bCc7Q0UnSmdYzHa/daQ+xF5Xn0PSCGUeh61nB82jMlmi/iNQXQ4+o8ehBItIrXex/i
	 92a/MMXLrwYYOrPMCGKx66cgwg22QJVD20YSxINO9qRXtkJ+ldL19IhUgazL2zM8idg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6065360A3814;
	Tue, 10 Nov 2026 08:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6065360A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.102])
	by gateway (Coremail) with SMTP id _____8BxrtIu1fJqah0eAA--.21638S3;
	Tue, 10 Nov 2026 16:26:22 +0800 (CST)
Received: from [127.0.0.1] (unknown [127.0.0.1])
	by front1 (Coremail) with SMTP id qMiowJBx5cwo1fJqF3IzAA--.12508S2;
	Tue, 10 Nov 2026 16:26:18 +0800 (CST)
Message-ID: <61dc34e7-e872-42cb-a0b1-be100a78053a@loongson.cn>
Date: Tue, 10 Nov 2026 16:23:29 +0800
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
Content-Language: en-US
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
In-Reply-To: <20261110080338.GJavLP2h448voZSQRE@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBx5cwo1fJqF3IzAA--.12508S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKrW3ur47JryrWrWDuw47Jrc_yoWfuFX_ur
	1UCF9ru34kW3yvywnrCw4fArnFgayvgry8ZrZrXw4Iqa47XrW5uF4UWrWS9w1rKr1DAF9x
	ZFyjvw4xtw4jvosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb38YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_
	GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
	UjIFyTuYvjxU2MKZDUUUU


在 2026/11/10 16:03, Borislav Petkov 写道:
> On Tue, Nov 10, 2026 at 03:47:20PM +0800, Qunqin Zhao wrote:
>> "all your nodes belong to memory controller 0"
>> I don't quite follow this sentence. There are four memory controllers on LS3C6000/S.
>>
>> On firmware without mc-idx there can still be more than one  memory controller
> So edac_device_alloc_index() is used to give out indices for other EDAC
> devices with edac_device_alloc_ctl_info() but I guess you could use that in
> your driver until you don't need to add other devices besides MCs and then
> it'll become a mess...
>
> Lemme ask the simplest question first: is there any case where ACPI won't

mc-idx is not guaranteed. There is firmware that does not provide the property.


Qunqin,

Thanks.

> provide that _DSD property or you're in control of the firmware - not like on
> x86 - and this case we're trying to fix is never going to happen anyway...?
>
> Thx.
>

