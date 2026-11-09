Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=207.46.229.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794194599;
	b=GYFIcjX6U2ExlSb94f0ecjiDCiksLBIfYFqXpGkHCgydv3zlQ56ickPnQNz2kqpctncR
	 IihAkhhPp34b+EhE+9QU7ffk3s4+bB4KLPUUMK8b0XTMUBdwr6IcORZiCt7K59+qSIN6l
	 p8OH7JqqLAWssEWroxx4hYB3+Ib6wLqPtIkZaA3haYESiQQEHo7aa1WEe0PsdabOaEup3
	 YbwD3l0/eEBJFkbUWe3N14ukMNgS9+2VewiDGc1EdABgxvEPo6w/kwk7CpxifvQ7FokVL
	 IniEQJRRVbU91MY+tyQOCIO5Mn8h3y3kP+7PNBZwFF29S8NZBav0niVLOCON9Il07fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794194599;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=y9skvVxhdUdkbeJlBe2yflIOrBosaJA4V+sD7P4VtQw=;
	b=o50Rl023aD58atdVr9wVM4q0k+zR7ZpX4lZDhmbhAHjC+YXADrDkC9vXSZ5y/8pqM4FM
	 /n0mT6ZAzODpCim1Q/c2/A3vL50A+N2X+tO2IEq/5pjnUMj71FKYn1Fjh6dW+QQGejjPA
	 65g8Hb26kmZxnOLuzyV5CEMD0kZbSMfzutRsy+trQ0kdPbyr9UbW3V+drVt2td+u3KxqW
	 8MO9PaEg59uviqd+4wZqtCrwgPb+3AWQ4p9U9MnjpHGWd2C6biWCJeOe1xKV7ZJf84dXY
	 /VkxOEUzQC+PgyPsPUuC/Ce9aksTlGVx+BoPdDn49aA41YHl9wGyDYS72dypj4P5cPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=207.46.229.174
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3119D606A31C;
	Mon,  9 Nov 2026 03:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3119D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with UTF8SMTP id IQEQrMAGLsaiPPFqlfgJAA--.22705S2;
	Mon, 09 Nov 2026 11:23:14 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wD3_x+gPPFqQkUQAA--.21389S2;
	Mon, 09 Nov 2026 11:23:14 +0800 (CST)
Message-ID: <ad09a443-9911-4c35-8f36-31d38e3efea3@hust.edu.cn>
Date: Mon, 9 Nov 2026 11:23:12 +0800
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
Subject: Re: [PATCH 1/4] docs/zh_CN: translate coding-assistants.rst
To: Weijie Yuan <wy@wyuan.org>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <cover.1794153793.git.dzm91@hust.edu.cn>
 <bb985e0f6f0c3e320cadcd007cfd0dbfd4102e46.1794153793.git.dzm91@hust.edu.cn>
 <avE4mPgZOx1th2FE@wyuan.org> <avE7dsawxAjrz-Ev@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <avE7dsawxAjrz-Ev@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:IQEQrMAGLsaiPPFqlfgJAA--.22705S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoW7JFWrJw18ZF43Zw4xuryrCrg_yoW3XFb_ur
	yrCF10kr1UtrykCan2krnI9Fn3AFyDXF45XFyDtr95Ja98ZFWUCFZ5W3saq343G3yFyrsr
	CrnIv3ZY9w129jkaLaAFLSUrUUUUnb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbHkYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vE
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
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUVYhFDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 11/9/26 11:18 AM, Weijie Yuan wrote:
> Weijie Yuan <wy@wyuan.org> writes:
>
>> Dongliang Mu <dzm91@hust.edu.cn> writes:
>>
>>> Translate the AI coding assistant guidance into Chinese. Link to the
>>> existing Chinese license-rules.rst guide while keeping untranslated
>>> document references on their English paths.
>>>
>>> Update the translation through commit 1e035297ffda
>>> ("docs: remove Assisted-by references")
>> Looks very good.
>>
>> Reviewed-by: Weijie Yuan <wy@wyuan.org>
> Oops, you may forgot to add your sign-off in this series, and this
> single patch:
>
>    https://lore.kernel.org/linux-doc/20261107000338.1243411-1-dzm91@hust.edu.cn/

Ah, sorry for that, I will send a v2 patch ASAP.

Dongliang Mu

>
> Thanks.

