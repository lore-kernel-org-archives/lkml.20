Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.187.6.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804893;
	b=sBtisarjLYRq3jmCsztHHFH3bLZPovayh4m+hKcbACDy0B0Qn41kmWBGzJ7fJ9YoEutS
	 k1RGFOYQKpVnJjhlfEcLIqFiW5qTXhbu6Vm8keqK3U6QQMbZgvyQH4Kg4nVLaBGZcJTpp
	 ylT3nYajlJfOZ2Slcmvd81pdN7XmbF7Gxls5yrxoCjjuZ/BFQ0XyT2mth0c9UbS4m90Oy
	 XIt59lPxXFMi8gJ39ELwG77Gl7TK/QqYZbKa9S/AvoRr7dd9Y7jMpNALRYXFF0nP1YRn9
	 IvzhiuHnujR2PoU+F+ik2LVtjCWso6bC79yuWNTpHISzedzE40YnqufVFl6M5siNjDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804893;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=KEA9bue78qat7JBy8LiBpNpoByZQDXeNWudllgh2GWI=;
	b=BWADlS62Q0mtYQnKDTsvI9bua9M7WUNigx04GTAW68Pvw+sG+vxhb43mxxJxURmvdliy
	 6uafSVl9KlCI8jDl9nJeaJ8U40eg2zdtkyZB/C2pOP1mXe0tDUJ5LBcsaADJ6TFylVDgi
	 OXoHssH0T4OP6QGz9zhNPf31mBfP6ePNK5q5QnnMAct6BN2jaQmKMux3zW/PXRBCI8STY
	 LYoLJY76VlBl+ZWVzzBJIzcIygUcTGu7ln6JxWMYzk84psMC4HQLfKuuCjDrp0LSq4IeR
	 Ir/FsMERg8KOsdbzK7c0DItPChHz+U8a5CQyh+VG9lFhL59VdEE53sxKdp2b6Gsh94w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=52.187.6.220
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.187.6.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73F8606A328;
	Wed,  4 Nov 2026 15:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D73F8606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with UTF8SMTP id IAEQrMBmL2tXSutqynMAAA--.3192S2;
	Wed, 04 Nov 2026 23:08:07 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDnnzhUSutqcogdAA--.20688S2;
	Wed, 04 Nov 2026 23:08:06 +0800 (CST)
Message-ID: <e300822f-acc6-4e25-a2a8-00eb0ab7ea08@hust.edu.cn>
Date: Wed, 4 Nov 2026 23:08:04 +0800
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
Subject: Re: [PATCH] docs/zh_CN: fix stale :Original: reference in
 xfrm_proc.rst
To: Weijie Yuan <kernel@wyuan.org>
Cc: =?UTF-8?B?UsOpbmljaCBCb24gwrRDaXJpwrRj?= <renich@evalinux.com>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Steffen Klassert <steffen.klassert@secunet.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260920073144.546566-1-renich@evalinux.com>
 <78d0a4ea-d621-4408-8efd-d8c9bb1f6841@hust.edu.cn>
 <autEFEW15g5I0oVT@wyuan.org>
 <a4e6c559-5e7a-4c7e-8475-6f1970d8f3bc@hust.edu.cn>
 <autIHApRGasgTCXO@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <autIHApRGasgTCXO@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMBmL2tXSutqynMAAA--.3192S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxAr4ktry3Gw1UKr1DtFW7XFb_yoW5Zr47pF
	W5tF12k3W0v3WYyrs2gw48Za10q3W8uryYgF1DG3Wrtrn8tr1SqFW3Kr1Y9F1kur1kJF13
	Xw42gF92y3yUAFUanT9S1TB71UUUUbUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQKb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r1q6r43MxkIec
	xEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_GFv_Wrylx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0pbytUUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 11/4/26 10:58 PM, Weijie Yuan wrote:
> On Wed, Nov 04, 2026 at 10:46:19PM +0800, Dongliang Mu wrote:
>> On 11/4/26 10:41 PM, Weijie Yuan wrote:
>>> On Wed, Nov 04, 2026 at 10:32:43PM +0800, Dongliang Mu wrote:
>>>> On 9/20/26 3:31 PM, Rénich Bon ´Ciri´c wrote:
>>>>> Commit 03e23b18c720 ("net: Move XFRM documentation into its own
>>>>> subdirectory") relocated Documentation/networking/xfrm_proc.rst to
>>>>> Documentation/networking/xfrm/xfrm_proc.rst.
>>>>>
>>>>> The Simplified Chinese translation was not updated accordingly,
>>>>> leaving its :Original: tag pointing to a nonexistent file and causing
>>>>> tools/docs/documentation-file-ref-check to report an invalid reference.
>>>>>
>>>>> Update the :Original: path to point to the new location.
>>>>>
>>>>> Fixes: 03e23b18c720 ("net: Move XFRM documentation into its own subdirectory")
>>>>> Signed-off-by: Rénich Bon ´Ciri´c <renich@evalinux.com>
>>>> Hi Rénich Bon ´Ciri,
>>>>
>>>> I have proposed a patchset to revise all the inconsistency between the path
>>>> of Chinese translation and English documentation and these invalid original
>>>> fields.
>>>>
>>>> Please refer to this patch - [PATCH v3 8/9] docs/zh_CN: update
>>>> networking/xfrm/xfrm_proc.rst translation
>>>>
>>>> https://lore.kernel.org/all/c641a11c-39c8-40c4-b162-10f3a3db57ff@linux.dev/
>>> Ah, I haven't had a chance to look carefully at your series yet. Then
>>> this patch can be discarded in what's-cooking.
>> Haha, what's-cooking is really a good place for me to catch up all my
>> missing patches.
> Thank you!
>
> https://buding.wyuan.org/ is an experimental dashboard for us which is
> made weeks ago, but obviously it is very rough. So now I feel that
> what's cooking is somehow enough for us, as it seems more robust than
> web app. ;-)
>
>> It seems all patches are reviewed, but some are waiting for the authors to
>> revise.
> Yes, thanks for your work!
>
> Oh, btw two of my rerolled series are waiting for your review, but I
> think they are both good to go, while I'm certainly biased. ;-)
>
> * Weijie Yuan 2026-09-05
>    [PATCH v2 0/2] docs/zh_CN: update maintainer/configure-git.rst
>    [PATCH v2 1/2] docs/zh_CN: sync maintainer/configure-git with upstream
>    [PATCH v2 2/2] docs/zh_CN: improve maintainer/pull-requests translation
>
>    Needs review.
>    source: <20260905-configure-git-v2-0-ab194db8c6b9@wyuan.org>
>
> * Weijie Yuan 2026-08-23
>    [PATCH v2 0/5] Update maintainer-pgp-guide.rst Chinese translation
>    [PATCH v2 1/5] docs/zh_CN: update maintainer-pgp-guide translation Weijie Yuan
>    [PATCH v2 2/5] docs/zh_CN: clarify free Nitrokey requirements Weijie Yuan
>    [PATCH v2 3/5] docs/zh_CN: update maintainer-pgp-guide kernel.org link Weijie Yuan
>    [PATCH v2 4/5] docs/zh_CN: add kernel.org trust repository reference Weijie Yuan
>    [PATCH v2 5/5] docs/zh_CN: remove empty proofreader field from maintainer PGP guide
>
>    Needs review.
>    source: <20260823-maintainer-pgp-guide-v2-0-bea33b2ece54@wyuan.org>

Oops, I will review them ASAP.

Dongliang Mu

> They are revised per your guidance.
>
> Thanks!

