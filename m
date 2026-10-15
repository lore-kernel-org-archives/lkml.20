Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3564EBAC9;
	Thu, 15 Oct 2026 14:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.76.78.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073893; cv=none; b=RRHOkRr5ZiEtCkqkyVOUMAr9tkkE2UEYJzxEiNaFllGdfsEAhfkYmfXNyMy/PgE5Ipzq2ZkQRk3PHiUMcj4mmlOWcGxljVl+2ocinHyA3ywNQHarrBPkxCnJp9vA5iicbsPWdhlNtufFMYFuuAZ6szi/rarrwq2etIrIGD6T+K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073893; c=relaxed/simple;
	bh=aBDMAhe/5rU52/zVBtZuG4MVogElowq3MzW2NeTCVRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J4VafQnIa+Ewxm4eMFeeAi+0UL8YT8pZwbMojXebgqTsW906G52Et9fMyamjQ6bjqWqOTQOMNUhZkelh7FfXLjpGKrmPW6IYb5vxwhkc/cGnYY6efJZ8IAF72I8aDxDCjlxB7jmpnZQEt+mXtHw6d21yb04euhZjNG02nrSPxCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=13.76.78.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with UTF8SMTP id IAEQrMCm7qSP4NBq10rgAA--.35949S2;
	Thu, 15 Oct 2026 22:17:51 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAnAveL4NBqu_sHAA--.20421S2;
	Thu, 15 Oct 2026 22:17:50 +0800 (CST)
Message-ID: <4fa9758d-cc9b-4874-9549-ee5026af00a1@hust.edu.cn>
Date: Thu, 15 Oct 2026 22:17:46 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs: doc-guide: add a guide for translators
To: Weijie Yuan <wy@wyuan.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Daniel Pereira <danielmaraboo@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>
References: <20261013003702.5824-1-danielmaraboo@gmail.com>
 <20261013003702.5824-2-danielmaraboo@gmail.com> <atC5u4RPzVkVgTNm@wyuan.org>
 <CAMAsx6eef_2Gcf_WhvTkFWz-fOjyaWjP+h3US0v1=w-W5RdHBQ@mail.gmail.com>
 <atDVxZQUiJfsqEBr@wyuan.org> <87o6cvrs27.fsf@trenco.lwn.net>
 <atDdJS0HxZZ7O92B@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <atDdJS0HxZZ7O92B@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:IAEQrMCm7qSP4NBq10rgAA--.35949S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7WFyUJr17XryrXryDJr43ZFb_yoW8Wr4xpr
	yDKFn8Ka1DJ3WfAr4xKay5Ja1vyw1fCFZ8Xw1akrn3uwn0gFy7KFWFyryY9Fy5uryxW3WY
	vrWj9F9xXFn8AaDanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQGb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxkIec
	xEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jhcTQUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 10/15/26 10:03 PM, Weijie Yuan wrote:
> +cc zh_CN maintainers
>
> On 2026-10-15 07:50:40 -0600, Jonathan Corbet <corbet@lwn.net> wrote:
>
>> Weijie Yuan <wy@wyuan.org> writes:
>>
>>>>> For the Translator field, zh_TW just did a cleanup to totally remove
>>>>> them.
>>>> Makes sense. I dropped the ":Translator:" line from the example, and the
>>>> guide keeps the advice to leave contact information to MAINTAINERS.
>>> I personally think this is somehow a hard tradeoff, so my opinion is
>>> rather neutral, and I respect your decisions.
>>>
>>> On the one hand, I think keeping this field is indeed a way to give
>>> credit to the contributors, which can motivate more contributions and
>>> contributors. On the other hand, over the years, this field has seemed a
>>> bit cumbersome and inconsistent in both Chinese translations.
>> I personally don't see why translations are different from any other
>> contribution in this regard.  The credit lives in the commit logs; we
>> don't sprinkle our names throughout the source for every change we make.
> Yes, very reasonable.
>
> I haven't found out the reason why we had the "Translator" field at the
> very beginning. I guess it might be something like translating a book.
> Usually, the translator's name would be written below/near the original
> author's name on the title page. (?) However, the difference is that we
> have commit logs, so I totally agree.
Cannot agree more on this statement.
> Then perhaps we could also clean up zh_CN later.

We will also clean up these fields in the zh_CN translation.

Dongliang Mu

>
> Thanks!

