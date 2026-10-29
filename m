Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.161.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793276617;
	b=GGiTe/z3HfSr48Sb0tC4x79A543u00yTPvCrTGD9d6uJSE0SBa01ENSbDZqiGaCm6dRT
	 50poaRg5aItLhkjclqEbPfUtxYLmjxzDmbXjJNdWpsncvQtbEYHoxVn9d59EgtJSYFOU7
	 /Duo7wJT2GCVAQl/d5GISdU1d9B59z+/PK7Oyqz0AOWefyVHKPM0HjFD0PlnsxpLzeeSY
	 jo6n+mvc6Z50jJAycuvRsCk8cOzLKDMVodlMulcZCieEKXRvxbMWpZkVi0ZfBXRMwF0Qs
	 sAn7KBpIc1Z/hbVl61muXUyVO8txx0S3I43pQqai6gEkRhnKhwIUXdpMjehkzv6a4PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793276617;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=AieJBuN/OlM6P3II1sHeVlc2hJk38W9kYUrLO9SmUYo=;
	b=GtQTjebL5g01C2tgs5az/4Ozrxh+3Q3XsuCEuzr3MkUkqwazNpNDRfHo3F9f8x2rf4ub
	 3xczSEHlMAbIwKKDWQMWYuuDjnde2ltc1zzHV+4reAnZV4C6L2tD1qHftqq/JcJb0I/n+
	 RTNHjBJOveEpS2p/eVwtDMw1+JPk9pZq6KPj62MPOrMqNo2jEzWDQHDq+gcZlCGR5cNzi
	 q9SCZ86sopLAcW65DoOAopJx9otp/WpRsBOm3H24R9agy92DjfoACNmjAf/awgiuf9sj8
	 Ro4M1dIKjrUEW7FvTPzaqL2kHUX+AIb+gknWlS9eBcZoT9vekTAG/ivZ+QPq+i3JUBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=162.243.161.220
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EDEE606A31A;
	Thu, 29 Oct 2026 12:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EDEE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with UTF8SMTP id IAEQrMBmqJ7EOuNqXvxJAQ--.36057S2;
	Thu, 29 Oct 2026 20:23:32 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCXkDvBOuNqFZgGAA--.12981S2;
	Thu, 29 Oct 2026 20:23:31 +0800 (CST)
Message-ID: <9acd17f9-2ae3-4728-a8e9-c41b6de5c869@hust.edu.cn>
Date: Thu, 29 Oct 2026 20:23:29 +0800
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
Subject: Re: [PATCH v2 4/9] docs/zh_CN: reorganize process debugging guides
To: Weijie Yuan <kernel@wyuan.org>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Weijie Yuan <wy@wyuan.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chen-Yu Yeh <chenyou910331@gmail.com>
References: <20261028034134.4144660-1-dzm91@hust.edu.cn>
 <20261028034134.4144660-5-dzm91@hust.edu.cn> <auGsi1N37Ptp7Kqg@wyuan.org>
 <auGs89xiNoacI5vi@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <auGs89xiNoacI5vi@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMBmqJ7EOuNqXvxJAQ--.36057S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxXFW3AF15CF45KF48XFyftFb_yoW5uF17pa
	ykKFySka1rXryayryI9F48XryfKayxJF47Ka4jv3sagr9YyF9aqry5tryqga43WrWSya1r
	Aa1DJFy29345AFDanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQCb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxkIec
	xEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU3YFADUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 10/28/26 4:06 PM, Weijie Yuan wrote:
> On Wed, Oct 28, 2026 at 04:04:36PM +0800, Weijie Yuan wrote:
>> On Wed, Oct 28, 2026 at 11:41:29AM +0800, Dongliang Mu wrote:
>>> Move the GDB debugging translation into process/debugging. Update the
>>> process and development tools indexes to match the current English
>>> structure.
>>>
>>> Synchronize the process index with upstream revision a03ef333fbd6.
>>>
>>> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
>>> ---
>>>   .../translations/zh_CN/dev-tools/index.rst    |  37 +++---
>>>   .../debugging}/gdb-kernel-debugging.rst       |  15 ++-
>>>   .../zh_CN/process/debugging/index.rst         |  62 ++++++++++
>>>   .../translations/zh_CN/process/index.rst      | 111 +++++++++++-------
>>>   4 files changed, 160 insertions(+), 65 deletions(-)
>>>   rename Documentation/translations/zh_CN/{dev-tools => process/debugging}/gdb-kernel-debugging.rst (93%)
>>>   create mode 100644 Documentation/translations/zh_CN/process/debugging/index.rst
>> [...]
>>
>>>   ============
>>>   内核开发工具
>>>   ============
>>>   
>>> -本文档是有关内核开发工具文档的合集。
>>> -目前这些文档已经整理在一起，不需要再花费额外的精力。
>>> -欢迎任何补丁。
>>> +本文档收集了用于内核开发的工具文档。目前这些文档只是汇集在一起，尚未充分整理成一份连贯的指南；欢迎提交补丁！
>>>   
>>> -有关测试专用工具的简要概述，参见
>>> -Documentation/translations/zh_CN/dev-tools/testing-overview.rst
>>> +测试工具的简要概述见 ``Documentation/dev-tools/testing-overview.rst``。
>>> +
>>> +调试专用工具见 ``Documentation/process/debugging/index.rst``。
>>>   
>>>   .. toctree::
>>>      :caption: 目录
>>> @@ -21,21 +19,26 @@ Documentation/translations/zh_CN/dev-tools/testing-overview.rst
>>>      testing-overview
>>>      sparse
>>>      kcov
>>> -   kcsan
>>> -   kmsan
>>>      gcov
>>>      kasan
>>> +   kmsan
>>>      ubsan
>>>      kmemleak
>>> -   gdb-kernel-debugging
>>> +   kcsan
>>>   
>>>   Todolist:
>>>   
>>> - - checkpatch
>>> - - coccinelle
>>> - - kfence
>>> - - kgdb
>>> - - kselftest
>>> - - kunit/index
>>> - - ktap
>>> - - checkuapi
>>> +* checkpatch
>>> +* clang-format
>>> +* coccinelle
>>> +* context-analysis
>>> +* lkmm/index
>>> +* kfence
>>> +* kselftest
>>> +* kunit/index
>>> +* ktap
>>> +* checkuapi
>>> +* gpio-sloppy-logic-analyzer
>>> +* autofdo
>>> +* propeller
>>> +* container
>> + cc Chen-Yu
>>
>> My b4 review agent scanner says..
>>
>> | OpenAI Codex <codex@openai.com>:
>> |
>> | The move leaves Documentation/translations/zh_TW/admin-guide/README.rst
>> | (line 289) pointing readers to the deleted
>> | Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst.
>> | Please update that reference too, either to the new zh_CN path or to the
>> | existing zh_TW/process/debugging/gdb-kernel-debugging.rst translation,
>> | so readers can still locate the debugging guide.
>>
>> Seems to be a good finding :-)
>>
>> Thanks.

I can first update the link in this patchset. Then we can change the 
location of zh_TW translation files.

Dongliang Mu

> Sorry, actually I did not Cc Chen-Yu.. Now done.
>
> Sorry for the noise.

