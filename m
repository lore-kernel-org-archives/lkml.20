Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=207.46.229.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794197399;
	b=Ntias8bzgCkYK9CU0YJBl+VIWtrPLh08Qho5/N0wH1DWO8NCE1gMNrOmECgRrLLDMUEI
	 VjDpMF6vb4inWEZ8e2mRbnv/ZC9ZS6Kvj4gfkHnOnl8e1KsmK9HBh5SN0gi/zMZd3haGW
	 /0OOEQUGwN89wtH/Ff2WyRuicwm3wJZ+loNRTmxaCNg+h9+cEqAj81ctYnuTXA4ERNMyA
	 NqOfLhO6XIjSgs7eaFxX8SnXhbPK9DXXQGbQXrk0m/xTmFHQ7GB1ONaI6URG4EwsUXsKN
	 Mr6DmmRySuG6XTMeNl40C76+m4/hFg9Ra68Ap19s3Bnumoqd6pN075W6F7WmScVd/LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197399;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=IYD2oSweeBs4xm2WTa90Mc3CacGxXDWMr+jK6llJ94M=;
	b=Kdd3TOFByVd/t2uVFOAquiCf6zbMiYbFRZW1DMJGehOPPLwstlTQNoy4FCyDUD0q2wOm
	 Gpxqz0/og2eBpW8o9bbM/OKbzWeeA7gCWihonVpz8Mtg68tGAG/9HevXXbL9H8fJjiYhv
	 EW8gpLI9BInBPX08sRTIouePo41oflBHxF02L/HZsbEF+jyPnA875PmY1Yt3f0L0LB9JT
	 Yl+8zknFdVfyKVu4HNrNB+JjPQluhrHBYyynlMK7wgKXWgOlzYhxp3lIgbXLE+OS6VppZ
	 ZKqLW5GTOvJ1X03fs2CIH/JIC5SKRln9YDsGCw1qmh6pf8aQBQqqmrSyf+Z1iYqkVrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=207.46.229.174
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9CA606A31C;
	Mon,  9 Nov 2026 04:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E9CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with UTF8SMTP id IQEQrMDmDcaRR_FqKREKAA--.10976S2;
	Mon, 09 Nov 2026 12:09:53 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDHz8+OR_FqlHAQAA--.14573S2;
	Mon, 09 Nov 2026 12:09:52 +0800 (CST)
Message-ID: <5b1d5dd4-5c39-4fc9-873c-39cc1aa1d76c@hust.edu.cn>
Date: Mon, 9 Nov 2026 12:09:50 +0800
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
X-CM-TRANSID:IQEQrMDmDcaRR_FqKREKAA--.10976S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoW7JFWrJw18ZF43Zw4xuryrCrg_yoWDuFc_u3
	4xCF1qkr15trWxCan7KrnI9r1fAFyUX3W3XF9FyrZ3GasxJrW5CFZ5Wa4fZ343W393Arsr
	AFnIv3sYqr129jkaLaAFLSUrUUUUeb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbHAYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxkIec
	xEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0XVy3UUUUU==
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

PATCH v2 of "docs: improve translation update checks across locales 
<https://lore.kernel.org/linux-doc/4c0221d662b7e8521d93000ad6ae09300dbda9c1.1794196480.git.dzm91@hust.edu.cn/#r>" 
is sent now.

https://lore.kernel.org/linux-doc/4c0221d662b7e8521d93000ad6ae09300dbda9c1.1794196480.git.dzm91@hust.edu.cn/

Dongliang Mu

>
> Thanks.

