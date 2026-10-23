Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.76.78.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792721445;
	b=x8mrdXXtCWE/LPoFX3Q3jeax/ZyJFs+m0tU96bPdxET6TuVAkPr9kbVOsrt0uvI50xg3
	 Mxl2yzh/jtFB8sirhCrzmWuiT6BBuKPoDALrdM+3B0eqL1UwsJqvDVhDL1HxaALTheSYt
	 j46uS/sr3Co1YkBzEooxfNEwsn0JhDrikKnQZExtHEPeqHB7mZ8qU+jZhLL+VLSdb9Kqr
	 DYp+VbmfpFOcMSCUvPrbFJ2gtsjmKI72TW+ss74G51E9IYVm62C4VXgLJVEjzEx+GixPf
	 3HSBz3LAjZOqClCg7utCAYoHySa/a9qwN0QguQ4atr5ab3s2F3NAMpQCB6NzLsWZo3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792721445;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=PD4mBjmKOpR/Hm3u9iYV0SeR1imA2fdlEf0EChvTEws=;
	b=iZ8UhE3dJ8dpFhXxxDCKV9olIpBaQylDrjZHyJpEfW0M5ezuYiKhgR4Y6iNQVb2D/LpA
	 K/eRE0KtU5BIgNZlBzu4JuoR4pRxL883O9aNAETmqtErmTbg6vtfkDgnYApigtoeOl+tf
	 76M7bntFFOh4XpVh57fZLzongYu3SsAEfRcib0uMgKLghOVrsCysy9+N47hrIgLUtwcVk
	 TyDPQREh+xK5FLa411uIwWCmfCwLcDbENxrnf+p3b/0QI1RwI4M2gMFayTMDDx1eze1az
	 81/+3zeU2F1kwL5wsOk+PLKhE1DH/Pv8Jx13D13EopRX5jPRSNUBRNG3KfAqV7/0rNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=13.76.78.106
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C2B606A319;
	Fri, 23 Oct 2026 02:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71C2B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMDmLKMewtpqpYkcAQ--.50438S2;
	Fri, 23 Oct 2026 10:10:38 +0800 (CST)
Received: from [100.81.40.43] (unknown [222.20.126.216])
	by gateway (Coremail) with SMTP id _____wDnKw4TwtpqWgyzAA--.37569S2;
	Fri, 23 Oct 2026 10:10:31 +0800 (CST)
Message-ID: <40aeaf0a-6e04-461c-a507-52f791b45541@hust.edu.cn>
Date: Fri, 23 Oct 2026 10:10:27 +0800
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
Subject: Re: [PATCH v2 1/2] docs: doc-guide: add a guide for translators
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: wy@wyuan.org, jani.nikula@linux.intel.com, alexs@kernel.org,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 si.yanteng@linux.dev, chenyou910331@gmail.com, federico.vaga@vaga.pv.it,
 akiyks@gmail.com, carlos.bilbao@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261015125644.12908-1-danielmaraboo@gmail.com>
 <20261015125644.12908-2-danielmaraboo@gmail.com> <atQ_mXYNqs4tnDpW@wyuan.org>
 <79dd90f0.11f3f.1a15272eff3.Coremail.dzm91@hust.edu.cn>
 <CAMAsx6eb3X7GLheOaVoumORnvKftFYkU0VHynZYyx9m74+CTTw@mail.gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <CAMAsx6eb3X7GLheOaVoumORnvKftFYkU0VHynZYyx9m74+CTTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMDmLKMewtpqpYkcAQ--.50438S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3Ww1DZFykWF48CrW7Xr4xZwb_yoW3AryDpF
	W3GFyxK3ZxJ347Ar1Igw4UAF1Sya1xGw4UXr9rt3s3Arn0yr92qF43tr9YgF97WrWkua4j
	qF4jgry3WrW5AFJanT9S1TB71UUUUbUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQGb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	WxJr0_GcWlYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r1q6r43MxkIec
	xEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07Uq4E_UUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 10/23/26 1:09 AM, Daniel Pereira wrote:
> On Mon, Oct 19, 2026 at 12:37 +0800, Dongliang Mu wrote:
>> So my suggestion is that, after confirming all the translated
>> docuementation follows this style, we can delete this field and write
>> this relocation style in the translation guidance.
> Hi Weijie, Dongliang, Alex, Jani,
>
> I checked docs-next. it_IT, pt_BR, ja_JP and ko_KR already mirror the
> original path for every file. There are 14 files in sp_SP, zh_CN and
> zh_TW that do not, for two reasons:
>
> - the original has moved and the translation was not moved with it:
> magic-number (now in staging/), gdb-kernel-debugging (now in
> process/debugging/), security-bugs (now in process/), xfrm_proc
> (now in networking/xfrm/), memory-barriers (now in
> core-api/wrappers/), and the three gfs2 documents in zh_CN;
> - the document exists only in the translation: glossary.rst in zh_CN
> and zh_TW, and how-to.rst in zh_CN.
>
> So I agree with Dongliang's order. For v3 of the guide I propose:
>
> - state the path mirroring as a rule, since the language switcher and
> checktransupdate.py both depend on it;
> - describe ":Original:" as optional and not needed when the path
> mirrors the original, instead of showing it in the header example.
>
> Moving the files above and removing the existing ":Original:" fields
> can then be done per language, as separate series, by people who know
> each translation. I can send the moves for the files whose originals
> were relocated, if the maintainers of those translations agree.


I agree with this proposal. Ask maintainers of each translation to 
solves these issues first.

Daniel, can you list all 14 files in sp_SP, zh_CN and zh_TW?

Dongliang Mu


>
> Thanks,
> Daniel
>
>
> Em seg., 19 de out. de 2026 às 01:37, 慕冬亮 <dzm91@hust.edu.cn> escreveu:
>>
>>> 发件人: "Weijie Yuan" <wy@wyuan.org>
>>> 发送时间:2026-10-18 11:40:09 (星期日)
>>> 收件人: "Daniel Pereira" <danielmaraboo@gmail.com>
>>> 抄送: "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy Dunlap" <rdunlap@infradead.org>, "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, "Dongliang Mu" <dzm91@hust.edu.cn>, "Chen-Yu Yeh" <chenyou910331@gmail.com>, "Federico Vaga" <federico.vaga@vaga.pv.it>, "Akira Yokosawa" <akiyks@gmail.com>, "Carlos Bilbao" <carlos.bilbao@kernel.org>, "Avadhut Naik" <avadhut.naik@amd.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Jani Nikula" <jani.nikula@linux.intel.com>
>>> 主题: Re: [PATCH v2 1/2] docs: doc-guide: add a guide for translators
>>>
>>> +cc Jani Nikula
>>>
>>> On 2026-10-15 09:56:42 -0300, Daniel Pereira <danielmaraboo@gmail.com> wrote:
>>>
>>>> The documentation has seven translations, but nothing in the English
>>>> documentation explains how to contribute to them.  The only guide that
>>>> exists, Documentation/translations/zh_CN/how-to.rst, is written in
>>>> Chinese and covers the zh_CN translation only.
>>>>
>>>> As a result, the same problems come up over and over in the review of
>>>> translation patches: labels and citations copied from the original,
>>>> which are global in Sphinx and collide with the English ones; partial
>>>> builds with SPHINXDIRS that hide those collisions; lines over 80
>>>> columns; translations not added to any toctree; missing commit
>>>> descriptions, tags separated by blank lines, HTML email rejected by the
>>>> lists, and the documentation maintainer left out of the recipients.
>>>>
>>>> Add Documentation/doc-guide/translations.rst, a guide that covers the
>>>> whole workflow of a translation: choosing what to translate, the layout
>>>> of a translated document (path, header, labels, citations,
>>>> cross-references, what must not be translated), translation quality and
>>>> terminology, adding the document to the build, checking it with a full
>>>> htmldocs build, checkpatch and checktransupdate.py, preparing and
>>>> sending the patch, the review process, keeping translations up to date
>>>> and starting a new translation.  The commit message format it suggests
>>>> is the one already recognized by tools/docs/checktransupdate.py.
>>>>
>>>> Link the guide from the doc-guide index and from the translations
>>>> index.
>>>>
>>>> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
>>>> ---
>>>> Changes in v2:
>>>> - Drop the Assisted-by references from the AI tools section, the tags
>>>>    example and the checklist (Weijie Yuan).
>>>> - Use a plain path in the ":Original:" example and drop ":Translator:"
>>>>    from it (Weijie Yuan).
>>>>
>>>> v1: https://lore.kernel.org/linux-doc/20261013003702.5824-2-danielmaraboo@gmail.com/
>>>>
>>>>   Documentation/doc-guide/index.rst        |   1 +
>>>>   Documentation/doc-guide/translations.rst | 694 +++++++++++++++++++++++
>>>>   Documentation/translations/index.rst     |   3 +
>>>>   3 files changed, 698 insertions(+)
>>>>   create mode 100644 Documentation/doc-guide/translations.rst
>>> [...]
>>>
>>>> +Anatomy of a translated document
>>>> +================================
>>>> +
>>>> +Location and file name
>>>> +----------------------
>>>> +
>>>> +A translation mirrors the path of its original under the language
>>>> +directory, and keeps the same file name::
>>>> +
>>>> +  Documentation/process/howto.rst
>>>> +  Documentation/translations/<lang>/process/howto.rst
>>>> +
>>>> +Do not translate file or directory names.  The documentation build uses
>>>> +this mapping to add, at the top of every page, links to the same page in
>>>> +the other languages; it only works if the paths match.
>>>> +
>>>> +The file header
>>>> +---------------
>>>> +
>>>> +Start the file with the same SPDX license identifier as the original.
>>>> +Most translations then indicate, in some form, which document was
>>>> +translated and include the language's disclaimer.  For example, the
>>>> +Italian translation uses::
>>>> +
>>>> +  .. include:: ../disclaimer-ita.rst
>>>> +
>>>> +  :Original: Documentation/core-api/symbol-namespaces.rst
>>>> +
>>>> +A plain path is enough in the ``:Original:`` field: the documentation
>>>> +build turns ``Documentation/...`` paths into links automatically.
>>> Oh, btw. There's a comment about ":Original:" from Jani [1]:
>>>
>>> | I'm wondering, are these :Original: fields useful anymore since the
>>> | translations extension adds the button to switch between languages?
>>> |
>>> | The pretty much hard-coded expectation is that the English version at
>>> | path/to/foo.rst is the original, and its translations are at
>>> | translations/xx_YY/path/to/foo.rst.
>>> |
>>> | I.e. neither the HTML nor the RST benefit from it, and it's just
>>> | repetition.
>>>
>>> Perhaps we could have a bit of discussion here?
>> Hi Jani and Weijie,
>>
>> if all the translation documentation follows the relocation style -
>>
>> Documentation/XXX/XXX.rst to Documentation/translations/XXX/XXX.rst,
>>
>> the ":Original:" has no meaning, but actually this convention does not work sometimes.
>>
>> BTW, tools/docs/checktransupdate.py uses this relocation style in the zh_CN translation. When I try to test this script in other translations, this issue occurs.
>>
>> So my suggestion is that, after confirming all the translated docuementation follows this style, we can delete this field and write this relocation style in the translation guidance.
>>
>> Dongliang Mu
>>
>>> Thanks.
>>>
>>> [1] https://lore.kernel.org/linux-doc/c719c6756f345c6c39db483654578ef09de1948f@intel.com/
>>
>> ------------------------------
>> Best regards,
>> Dongliang Mu

