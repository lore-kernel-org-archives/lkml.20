Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565F82BCF46;
	Mon, 31 Aug 2026 06:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788156705; cv=none; b=RlMINvjBTKTiqsVxHeanyWWS9q4YmempRWrMAxNU4FHsmMvOoqYgg6IokEjVhuJb6XN/ax0VzKU+sN3kj+/rgjeSQ0zA8GjWC2VyANTO1Y7+pCdkpJ3hf0XFLObeHfHqDKFnG6bkTs+q5k6BuE0dV9J/pWTEaG8V1hFxRTkQj9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788156705; c=relaxed/simple;
	bh=9JLdV8usThthL1ek3EnlSHCTlqFK7z3/0yD5ndtx7vk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B/x4naiM4LiY05tBhmrXcNK893auAYg9jZic/hVPkqUJsN3SFDCtdhTmSfoUGReRD6ATrkoAeQXsGKufvRlsJPp/n72oL6vRnF3IEqxbllE2N8NyIbiEAbm8TweZ9XYns8yk4H50AAuqCoXF1Y5M1kWrGoJP+VaPKCAwlzNiiaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=eISkPR4G; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="eISkPR4G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=ZhR6FuzNVxgcqJYZuskYZO6ImMKIuhG/QhuJiKWuRbw=;
	b=eISkPR4GJhcFoLmfFc6ka5YKPSd3e2bWm/kqSkpc3w/EiZaFhICiipo/1sefM+
	dvHgax8soRBhb9K+3PmvbMC/GHLFB8vnHGZ4l+bFpjXxwZ4vLc3fxwJerdc4RkD5
	IyF5SlbqaZb3A7DujupcAXUYcq+FJ9vVc7DEo52lZdLU4=
Received: from [10.42.12.49] (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wCnD5IEG5VqG7xtRA--.59020S2;
	Mon, 31 Aug 2026 14:11:17 +0800 (CST)
Message-ID: <a4e969d7-4601-407e-a4ee-beb85846d711@163.com>
Date: Mon, 31 Aug 2026 14:11:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: host: sl811_cs: fix memory leak on probe failure
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: gregkh@linuxfoundation.org, kees@kernel.org, david-b@pacbell.net,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zongmin Zhou <zhouzongmin@kylinos.cn>
References: <20260827074120.49006-1-min_halo@163.com>
 <apHG0Pq3HagSo5BT@archlinux>
Content-Language: en-US
From: Zongmin Zhou <min_halo@163.com>
In-Reply-To: <apHG0Pq3HagSo5BT@archlinux>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCnD5IEG5VqG7xtRA--.59020S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF4DZF45uF4rGr45Zw4ruFg_yoW8CFWUpF
	WkX3s8G34kKw4a93Z7Ar48Wasa9393JFyUJrn29w4Fyw15CFy0vFW2ya1YgFWUCrn5K3WU
	X395XFW7ZrZ0yFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07USkskUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC0gXHc2qVGwWMegAA30


在 2026/8/29 01:36, Nikolay Kulikov 写道:
> On Thu, Aug 27, 2026 at 03:41:20PM +0800, Zongmin Zhou wrote:
>> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>
>> sl811_cs_probe() leaks the local_info_t allocated into link->priv when
>> sl811_cs_config() fails: the only kfree() lives in the remove callback
>> sl811_cs_detach(), which the PCMCIA core never calls for a device whose
>> probe failed.
>>
>> Free the private data when sl811_cs_config() fails.
>>
>> Fixes: c6de2b64eb57 ("[PATCH] USB: add sl811_cs support")
> The code looks good to me, but I have a question regarding the Fixes
> tag.
>
> In the commit you cited, a failure triggered a call to
> sl811_cs_detach(), which freed that memory. However, that behavior was
> changed in commit
>
> f8cfa618dccb ("[PATCH] pcmcia: unify attach, EVENT_CARD_INSERTION handlers into one probe callback")
>
> where the call was removed, leaving the memory unfreed. Shouldn't that
> be the commit referenced in the Fixes?
Hi Nikolay,

You're right that c6de2b64eb57 did not introduce the leak -- but neither 
did f8cfa618dccb.
The leak was introduced by 15b99ac17295 ("[PATCH] pcmcia: add return 
value to _config() functions")

f8cfa618dccb dropped the detach-on-failure path because registration
moved into the core, and its probe ended with
     sl811_cs_config(link);
     return 0;
A config failure was never propagated, so probe() always succeeded
after the allocation and it remained paired with the kfree() in
remove(). No leak either.

15b99ac17295 made sl811_cs_config() return -ENODEV and the probe return
that value -- the first time probe could fail after the allocation.
Since the core never calls ->remove() for a failed probe, link->priv
leaked from then on.

If you agree, I'll send a v2 with
     Fixes: 15b99ac17295 ("[PATCH] pcmcia: add return value to _config() 
functions")

Thanks,
Zongmin
>
>
> Thanks,
> Nikolay

