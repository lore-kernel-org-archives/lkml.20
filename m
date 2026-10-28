Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.161.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191063;
	b=UOZZ3lKKcdyjxV2MGC0QjmeZh3seAKu/hQVQt+E6kogL5oVKByKwigEK3ZfAtNr57Qnd
	 MVpi+F2QjsaevWMZ1nbJLnI2M37kW0m+rrCsQpOGQIiPGjzOypuQpBaQKaW9MQ33Y4Vic
	 CwKJJzrfiyd3gHox3c7sLLa/qdWm1QpdapzLNfx+ImDoRJGuAKxwg/QuNzSpJtgvfTgY0
	 +RCiKvY+VK29ixPGaCYja6Q+WIbOaoYolcG8wAkMNGmHlyqNts0NIrlH5GvZJe/ddQA9Y
	 sUu0NX/jhDABVB5lk9cEnA91DXpr99a2wRu8L6h3H8kIB3Kz5dLqNppqTW9GxpJInyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191063;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=2fPfC6kGhMzQ15NT2JguGTcaL9m4KcoiMLditaM36mI=;
	b=cN2j+kpVQJjwX4WPNIw0xlfOWD7CI5dzfxuSiiftL86nly1FJCNeSCTp3zOxYEE2stGz
	 K4p8kW3dFN9m2u2CxiWPMAoXvnFkNrzNizYyqXa1S7PvFXP+OSeqmnfY1rl9CuTobS7mm
	 IrbsKD4WM4Mc2AFAVmCn8yJSmJoq9ijdoVyrB2vVS92yA1R9GP3XjYJ61KdBpyqeW+3A2
	 66ntKbKubfdXOUCFGNAQBc0QasTd6PIjUpfOCEMb0NrPRjTunJRLw84j5G/NW9M9NJG8A
	 GEmhpA/s3wLJM+Vfn7vtlkYjQ01qlq/L7WAk1WvAULiP4lLMOwetCTZJwE8HE+6JFMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=162.243.161.220
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3671A606A31C;
	Wed, 28 Oct 2026 12:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3671A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with UTF8SMTP id IQEQrMDmDXeJ7OFqR9xhAA--.58018S2;
	Wed, 28 Oct 2026 20:37:29 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wBXFMCH7OFqjTLHAA--.20876S2;
	Wed, 28 Oct 2026 20:37:29 +0800 (CST)
Message-ID: <0ecb719c-5e0a-400c-b1b3-da2923c40bb4@hust.edu.cn>
Date: Wed, 28 Oct 2026 20:37:27 +0800
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
Subject: Re: [PATCH v2 0/9] docs/zh_CN: align translation paths and update
 guides
To: Weijie Yuan <kernel@wyuan.org>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Weijie Yuan <wy@wyuan.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261028034134.4144660-1-dzm91@hust.edu.cn>
 <auGucr4smrSp9g5l@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <auGucr4smrSp9g5l@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:IQEQrMDmDXeJ7OFqR9xhAA--.58018S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7uF4DKr17GF4rKFyrKFyxAFb_yoW8Gw1rpF
	nxGFy0ka18t3WSvrn7C3yxXF48GF43Gay7Kw17twn3KrZayryrXFyrKrWq9FZFgr4Fqa45
	Za1YgrWDWw4DCrJanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHjb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCY02
	Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s02
	6xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU3YFADUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 10/28/26 4:12 PM, Weijie Yuan wrote:
> On Wed, Oct 28, 2026 at 11:41:25AM +0800, Dongliang Mu wrote:
>> Several Chinese translations are no longer at the same relative paths as
>> their English originals, and some Original fields are stale. This series
>> moves the translations to matching paths, adjusts their indexes, and
>> removes stale Original fields. It also updates selected translations to
>> newer English commits.
>>
>> v1->v2:
>> - Drop the unused top-level readme_zh label from the translated
>>    admin-guide README.
> Hmm, so why still keeping these labels here?
>
> [2/9] .. _zh_applying_patches:
This is necessary and used by another location.
> [4/9] .. _process_index_zh:
> [5/9] .. _magicnumbers_zh:

The above labels needs removed. I forget to clean the same issues in 
other patches.

Dongliang Mu

> Thanks.
>
>> Dongliang Mu (9):
>>    docs/zh_CN: update admin-guide/index.rst translation
>>    docs/zh_CN: update admin-guide/README.rst translation
>>    docs/zh_CN: add media administrator guide translations
>>    docs/zh_CN: reorganize process debugging guides
>>    docs/zh_CN: update magic-number to match upstream
>>    docs/zh_CN: reorganize media driver API translations
>>    docs/zh_CN: move GFS2 translations into filesystems/gfs2
>>    docs/zh_CN: update networking/xfrm/xfrm_proc.rst translation
>>    docs/zh_CN: remove stale Original fields from SCSI and IPE
>>      translations

