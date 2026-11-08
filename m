Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794132844;
	b=26rNXBbIkr3oMQR4H7gWMb/Zz3a9htzPCxpMTH1K0KDVA6WJa0MF+Ze03eGH+lvw/i+L
	 VbJlHcuOg66BthQQJ2bArZurqoiRUBJtuLEZfaMoQrpuRyLe8Zfswc8Y8yf5NcvbJ/NNd
	 V6bzNksaw2AkhikZD5KcEyT22w/qwrbtUEIZ8i2JfL0mOQk8qHPK68ySv4QL5XKa0UKUN
	 HB6FirDz3qVAYnAH/A38WVAp0lEfrmgL5aGMk0dfoClsyiUbz2TS2xmwZJfQpwnaq/fYB
	 VBPEumbmACUV6NUyV0SKGJfByHvU8aqONcii0tCHRoEQAzSSIzoV6kz7Q2yMKMhVQTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794132844;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:Cc:References:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=vuq9GH5gRApVBk9dTBvyem1k6yaVp9YAvagEyAzC9wo=;
	b=B/oyKMPrC11Kur/8ypvnZIU7RzO5jtlmMTTStMI6Wb00jzXyC2i1zWRtFnMizcrXBMz6
	 2YnZD9gwzJKLRocM29NGw+YgEIfrEf8g9hFFWEa4HkeSd8PjRYzJfbQr3J0t+yy2Whgse
	 CuzBZHEFgVedXmK4LrTtYimb74eb1Qi2/IKZaR+a11h66buAepPv7jsarRVbzP/c2GyOR
	 T3DDy20CIA4jiIVRWn2Z/m5AvYey8h8vGkP9QAjizaftKTeLJ+LcTgYBpNlchyVK8bijv
	 A9XKDrJInb6B9oCKpJvDFQup5LDsAkDBKD+STCVQmYg9+M26By+Dt9d2ZXc0Y5lsHhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7976A606A31C;
	Sun,  8 Nov 2026 10:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7976A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with UTF8SMTP id IQEQrMCGrcVfS_BqYZEIAA--.8011S2;
	Sun, 08 Nov 2026 18:13:51 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wBHMR9aS_Bq8oENAA--.18075S2;
	Sun, 08 Nov 2026 18:13:49 +0800 (CST)
Message-ID: <bab86e6c-bbda-4ad0-bd88-5ace76946eb0@hust.edu.cn>
Date: Sun, 8 Nov 2026 18:13:46 +0800
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
Subject: Re: [PATCH 00/13] docs/zh_TW: process: add translations of 13
 documents
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Weijie Yuan <wy@wyuan.org>, Chen-Yu Yeh <chenyou910331@gmail.com>,
 Yanteng Si <si.yanteng@linux.dev>, Alex Shi <alexs@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106113545.708896-1-chenyou910331@gmail.com>
 <3bbce43f-476c-4a21-8da3-2be98a696e9c@hust.edu.cn>
In-Reply-To: <3bbce43f-476c-4a21-8da3-2be98a696e9c@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IQEQrMCGrcVfS_BqYZEIAA--.8011S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw4UJrWkGr48ArWrKrWxWFg_yoW7WF13pF
	1xGFyfG3Z3Gw1SyrWxKr4xXryrJFyxCw43KF12qwn3t395try0vr4fKr9Fga9xWrW0va1j
	qw15tr48uw42vF7anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQCb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jr
	v_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxkIec
	xEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU32-eDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 11/7/26 8:44 PM, Dongliang Mu wrote:
>
> On 11/6/26 7:35 PM, Chen-Yu Yeh wrote:
>> I previously promised Jon that if no contributors stepped forward
>> within two months, the maintainers would have to produce some results
>> ourselves.
>>
>> This series adds zh_TW translations for 13 process/ documents that had
>> no Traditional Chinese version, and moves each one from the TODOList
>> into the toctree of process/index.rst.

Hi Weijie and Chen-Yu,

I’m also working on updating the zh_CN translations. My plan is to first 
resolve all references using |:ref:| tags or direct document paths.

I’ll proceed as follows:

 1. Update references directly for content already translated and merged
    into the tree.
 2. Add missing translations where referenced content has none, then
    update the corresponding references.

After the current translation are self-referenced, I will continue to 
add more translation. In the current stage, it would be more important 
to fix all severe issues in the translation other than adding more 
translation. To be honest, it is easier to leverage LLM to add more 
translation.

This is just my approach for enriching the zh_CN translation work — I’m 
not suggesting you need to follow it.

Dongliang Mu

>>
>> It is independent of the "resync translations with the English
>> originals" series sent alongside it, and applies on its own.
>>
>> Terminology follows the decisions in that series; whole-file
>> terminology unification and the glossary.rst update will follow
>> separately.
>>
>> The series is based on the docs-next branch of
>> https://github.com/kernel-zh/linux-zh_TW.
>
> This patchset looks good to me except the newly-introduced top-level 
> labels, which have no references.
>
> tw_researcher_guidelines
> tw_applying_patches
> tw_pgpguide
> tw_changes
> tw_deprecated
> tw_kernel_docs
> tw_maintainers
>
> Dongliang Mu
>
>>
>> Chen-Yu Yeh (13):
>>    docs/zh_TW: process: add researcher-guidelines.rst translation
>>    docs/zh_TW: process: add cve.rst translation
>>    docs/zh_TW: process: add applying-patches.rst translation
>>    docs/zh_TW: process: add maintainer-pgp-guide.rst translation
>>    docs/zh_TW: process: add changes.rst translation
>>    docs/zh_TW: process: add handling-regressions.rst translation
>>    docs/zh_TW: process: add deprecated.rst translation
>>    docs/zh_TW: process: add kernel-docs.rst translation
>>    docs/zh_TW: process: add maintainer-handbooks.rst translation
>>    docs/zh_TW: process: add contribution-maturity-model.rst translation
>>    docs/zh_TW: process: add conclave.rst translation
>>    docs/zh_TW: process: add threat-model.rst translation
>>    docs/zh_TW: process: add maintainers.rst translation
>>
>>   .../zh_TW/process/applying-patches.rst        | 392 +++++++
>>   .../translations/zh_TW/process/changes.rst    | 532 ++++++++++
>>   .../translations/zh_TW/process/conclave.rst   |  35 +
>>   .../process/contribution-maturity-model.rst   |  83 ++
>>   .../translations/zh_TW/process/cve.rst        |  90 ++
>>   .../translations/zh_TW/process/deprecated.rst | 363 +++++++
>>   .../zh_TW/process/handling-regressions.rst    | 969 ++++++++++++++++++
>>   .../translations/zh_TW/process/index.rst      |  35 +-
>>   .../zh_TW/process/kernel-docs.rst             | 355 +++++++
>>   .../zh_TW/process/maintainer-handbooks.rst    |  20 +
>>   .../zh_TW/process/maintainer-pgp-guide.rst    | 795 ++++++++++++++
>>   .../zh_TW/process/maintainers.rst             | 127 +++
>>   .../zh_TW/process/researcher-guidelines.rst   | 136 +++
>>   .../zh_TW/process/threat-model.rst            | 187 ++++
>>   14 files changed, 4101 insertions(+), 18 deletions(-)
>>   create mode 100644 
>> Documentation/translations/zh_TW/process/applying-patches.rst
>>   create mode 100644 
>> Documentation/translations/zh_TW/process/changes.rst
>>   create mode 100644 
>> Documentation/translations/zh_TW/process/conclave.rst
>>   create mode 100644 
>> Documentation/translations/zh_TW/process/contribution-maturity-model.rst
>>   create mode 100644 Documentation/translations/zh_TW/process/cve.rst
>>   create mode 100644 
>> Documentation/translations/zh_TW/process/deprecated.rst
>>   create mode 100644 
>> Documentation/translations/zh_TW/process/handling-regressions.rst
>>   create mode 100644 
>> Documentation/translations/zh_TW/process/kernel-docs.rst
>>   create mode 100644 
>> Documentation/translations/zh_TW/process/maintainer-handbooks.rst
>>   create mode 100644 
>> Documentation/translations/zh_TW/process/maintainer-pgp-guide.rst
>>   create mode 100644 
>> Documentation/translations/zh_TW/process/maintainers.rst
>>   create mode 100644 
>> Documentation/translations/zh_TW/process/researcher-guidelines.rst
>>   create mode 100644 
>> Documentation/translations/zh_TW/process/threat-model.rst
>>

