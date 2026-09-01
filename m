Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BC84A2065
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290948; cv=none; b=NNCc5biKrWwgSuHB+A6ljx6CgJDv7J8jgCrpaMelMPYTZo5D8ivVg3GyBIIg8IBTi72b7KCKJI3dfZ3NHV60jla+4Opk/V11DPSogq5CHM3wmZUIS23TXBHepy4chkYuC5ByzVuOKpTs86R0nvIw2BFZVZAoiwoJBuEc2H49U6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290948; c=relaxed/simple;
	bh=hcfFp4QAJ0s93Y9ZPeL2vP/9gs+ibRsKA8MfHqqXmek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ssZWqWCPhMiV3alWHxg6yyRLkKvcgyhUaSPlF+UQe/RzZG/K9ovnI2dTV+rDDQHKt75fYBiIorx/rIJVXj6svNSVFn8uapp6KtZiElQbuptp0sVJ07NwlxwZY0wSV17UCJRwOuk+qDKAl9bdaM6jyPRQK9lHR/zY+xzSD/Brh9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bB+8wmKa; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bB+8wmKa"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2055573c8cso17101266b.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788290945; x=1788895745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hcfFp4QAJ0s93Y9ZPeL2vP/9gs+ibRsKA8MfHqqXmek=;
        b=bB+8wmKaoVxTazyNIbaVdkl59enY2hYEBa/LGa65szKuCNz/1Ksf1+8xAULIKS0tLA
         2EUyugynOfUAv9M1PCOiVZh+3gFd8CGP2I3g2+htlaDZYfMUX7acXHR0hW0gbbrdajhg
         aUS5sGtx6J3gwrWy13k/Y+G2GuiLOekJfsm0S6pv2m0DdH/sUTnrwmm0jY7mLtrQsAPn
         fibTIEu/XK2NyFn8UQLafNvs78iUzevOeEl3opWliLlma9nRXXplmQcVGD29M2GAtsTm
         wJlXxdtDAE9M1zwqM291e0oAvAZY3npRWMkh2DBmRPF74vG19CJBFuJQJ3EA09N0drto
         KLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788290945; x=1788895745;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hcfFp4QAJ0s93Y9ZPeL2vP/9gs+ibRsKA8MfHqqXmek=;
        b=fHEs5P5uDNm97MQQUQacT5/EH8bez1yCygAGZknoe1BzuGyIImMf03nQ1nQan1AsK8
         0jErq/IbLVtyKR+csaWNYmEpHfF9pCfnMJHsado+RecBx8tFOmbkre7OodGvd2CIX/+3
         ennQCiuMZH8ZKMAoh18LzsekdPQA7bjojO/XItTAsdMJMgG8ASkDCSc4Vd2PXsmQclwD
         AQkoC/hFHZ6x5ujHuWBrvJhYPXiHgW1A6K/9zxr9O+s+7299kzRHDfq8FSYbB/7Gq+td
         HlPOOh8WcSAKcHq12znuEOiSrDI7i8YiM/X6N7AIGTCXLiUSiu8EDcaUdj/SRM2zE/AM
         L8Ow==
X-Forwarded-Encrypted: i=1; AHgh+Rr+PlgT0WbtBUiau7gEoO/TO91xj+7cUO/e1PQA+6b4HEi1Wnx+ai7gx9WOeOtM85obVz25t+0COGV1hN4=@vger.kernel.org
X-Gm-Message-State: AFuF++no/w92GqZDICTC7MJBQk6J5mvlrOjBP0rhs2jiD6rn77mfKp8L
	H9ktejEh5UoqJw4n+s5vhgn4LX6kWWbY5q9XMowc19ti9OXln58Qjp3lEhAAqwvV
X-Gm-Gg: AYBFou2clqVjex30977pjVkm+S85SYpVdM1Q/dTypFqDpBF0jy0BFCQYSQfyZA1Dk6C
	gY3aP0Horj7uE9gukB4gc0azXcUXMe01tyCNtQZvOEiEu9tOul32Pspa26cwyqzXtCZwfKoP0a0
	G0nGm8SVf8goXpiyT82n0fBxjcFtjb6QO9d0rLxXJI+XNG8BiqR1QuUVm7Dlx0r6F7J2yQKxaSA
	YxFt0MyIbXhKzh5tNoSLZBKcfLsZE/BhwsdYzr+Zb2eV1zbD0bb5SG7FROO3qV4N0K/fyV9L0w7
	QESkNMYYC4JjU2ZHumh5vn91y1T9bbtC0SJC6/OSQ65xGyOAJSqChkvUNgO0Ck/FvtbzhMU5upa
	eIVBpeyJKQOOGFjUCiUIGd+pLpoHEy5QSle1tbAnvpY+3C+dlC+hcFa/xivAfQ1MYYbobZYaBn0
	zRpePNpYlP8qkO/xDKPKvlf74ztW0yLhizR50FZn4989P8yM7PRJGDwS3ZwsVGW8bWfXN6aNnzZ
	hHWy+fYGiU7u0W2UESCvBjtY59AtFpc
X-Received: by 2002:a17:907:7ba0:b0:c25:b597:60bc with SMTP id a640c23a62f3a-c25d13c0751mr32104766b.23.1788290945180;
        Tue, 01 Sep 2026 12:29:05 -0700 (PDT)
Received: from [192.168.86.89] (81-224-151-184-no600.tbcn.telia.com. [81.224.151.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d008a7dbsm14602366b.27.2026.09.01.12.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 12:29:04 -0700 (PDT)
Message-ID: <5eca65ce-d1f5-426b-8148-30ae151a369e@gmail.com>
Date: Tue, 1 Sep 2026 21:29:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: logitech-dj: forward Bolt receiver input to the dj
 child device
To: greyxor@protonmail.com, =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?S2F0ZcWZaW5hIE1lZHbEm2RvdsOh?= <k8ie@mcld.eu>
References: <20260901-bolt-scroll-fix-v1-1-58bca7ae487f@protonmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Erik_H=C3=A5kansson?= <erikhakan@gmail.com>
In-Reply-To: <20260901-bolt-scroll-fix-v1-1-58bca7ae487f@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi!

> Interface 0 is the keyboard endpoint, interface 1 the mouse endpoint and
> interface 2 carries DJ/HID++, which is the same layout as the other
> HID++ receivers. Set no_dj_interfaces to 3 and drop the special case, so
> interfaces 0 and 1 are claimed by the dj driver and their reports get
> forwarded to the child, where the multiplier is applied.

Thanks for finding this!
I can confirm that my MX Keys Business work fine after your patch.
However, your patch basically reverts to what I had in v1 of my patch.
The reason for the change was that Katerina Medvedova reported that
without the special treatment for Bolt, her mouse became very
sensitive, including phantom scrolls, and her keypresses were scrambled.

> Bolt support was tested with a keyboard, and a keyboard has no wheel
> multiplier to get wrong, which is probably why this was missed.

Katerina, you tested with a mouse and two different keyboards, I believe?
Can you perhaps test again with this patch to see if your issues remain
or if there was something else that caused it.

Best regards,
Erik Håkansson

