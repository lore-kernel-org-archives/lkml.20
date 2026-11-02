Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610520;
	b=FGMdYs6hHZyPiMHOq96lOivWmb+2mMS7kB283MzW5cL346F4zxT7q3C9ATyst4HGfDa4
	 6Si5Qj7bf7jXOuSUBZFLswFtoFduir8N6rLFxwnYpbI+s8Zw5hQWnspdyQ57BDh0QwbVz
	 uOUVgUyo7o9Joc7GCXSBulESqmgwTm8yDhWk8sLAQHulOcImXSCMiA2+FiPVMRMM2k/q1
	 WemmNH+slhgVfwjgVNRNPYYUSS56yVwxFwUXRSf4bequgvOaRIvgsg0NKpZgjhJmP5leM
	 +IdmLiPCyaJH2K+/a9PalMFkkMg+AGs5xlp7YXj1iJgaBB/6ZQZ/Xk6vNG3fEIjVJTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610520;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=ASETVRD3C1tDhumu8b3/MvKnBzMds7T9o1iO2TN0fdQ=;
	b=RfbBaCjSnj8DX/8vjm0CBKt1bJr3OVmo5VPgb00bsVAFlIkPMfVW9xT6cc0CmtLoCiZ3
	 Pf3t4ctBwsWBT5SanJqN89KbMM2+yuMwGYhfzEoDies0axh856J3ytbuFrWMquvAD3G4i
	 f5pGDglsve+xPkft1eoKb+5PPif8W1A3VOJ3+57+1LqrgwTysW8ZYPZhEpXiwLWDijM4U
	 YAQi+ruYgaWKCKx+Rcq+DQJCfOPnPBI6xu8ujl3tEGt+yT8tqOQL9g9/JfUWgpc8Jso8F
	 0IdwQxuTWde3KVA6eV2lzR6wvAzplT6a15UvKfPfYgiN0qBUTwjgr95MQu8NzRpaj3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38596606A324;
	Mon,  2 Nov 2026 09:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38596606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8BxLtMUU+hqTH0bAA--.13686S3;
	Mon, 02 Nov 2026 17:08:36 +0800 (CST)
Received: from [127.0.0.1] (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJDxTs8RU+hqRNExAA--.37717S2;
	Mon, 02 Nov 2026 17:08:34 +0800 (CST)
Message-ID: <74ceabd2-dcca-43f0-9f07-c6daafeb85e1@loongson.cn>
Date: Mon, 2 Nov 2026 17:08:33 +0800
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
Subject: Re: [PATCH v2 0/3] ASoC: loongson: Fix configuration and clock error
 handling
To: phucduc.bui@gmail.com, Binbin Zhou <zhoubb.aaron@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261028104138.26973-1-phucduc.bui@gmail.com>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <20261028104138.26973-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJDxTs8RU+hqRNExAA--.37717S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgETCGrn-30YhwABsJ
X-Coremail-Antispam: 1Uk129KBj9xXoW7Jw1DZFWUGrWDXr1kAw1rXwc_yoWDKFcEva
	4Iga92kr1UXF13Ca45ZrsrZrW3uFWvg3W3CF1qqw42va47trsxtrWDCr15W3ZFvrZ3Arnx
	JF4F9a97A3W3GosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb78YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

Hi:

On 2026/10/28 18:41, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series fixes I2S configuration updates and improves clock error
> handling in the Loongson ASoC driver.
> 
> Link v1:
> https://lore.kernel.org/linux-sound/20261022084040.31181-1-phucduc.bui@gmail.com/
> 
> Changes in v2:
>   - Use FIELD_PREP() for register fields as suggested by Binbin.
>   - Apply the same approach to the other registers in hw_params().

For the whole series:

Reviewed-by: Binbin Zhou <zhoubinbin@loongson.cn>
Tested-by: Binbin Zhou <zhoubinbin@loongson.cn>
> 
> Compile-tested only.
> 
> Best regards,
> Phuc
> 
> bui duc phuc (3):
>    ASoC: loongson: Fix IISConfig0 update in hw_params for rev 1
>    ASoC: loongson: Use FIELD_PREP() for register fields
>    ASoC: loongson: Handle clock enable errors in set_fmt
> 
>   sound/soc/loongson/loongson_i2s.c | 58 +++++++++++++++++++++----------
>   sound/soc/loongson/loongson_i2s.h | 11 ++++++
>   2 files changed, 51 insertions(+), 18 deletions(-)
> 

-- 
Thanks.
Binbin

