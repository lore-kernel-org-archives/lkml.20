Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793307960;
	b=DyFlUsGsldtEKYc5UTdEM/AFLZtETHiZakDz0Ft8Zmnxp6asBmKliEk/QCdSOg6WMPm/
	 MEgx6/rF8eJ0VrStB0Mz36JcSkpa92ZItsJFAAtOddAehCYxP1HykgNmbhNYZ3bUNIYJI
	 NuoBDQQ6md9r9l2gC4NVbO7r2MtryDn7+b4d7tOA2oA2pfTRF7qsiwfwKGAEKUGhgEOPp
	 0iQrp38hUAHL5U6I+Dc78HQOqFX0hNXGHco+JqWuovdZ14QzzFxN+ZfAMR4F8rQxrmK6F
	 c64F0R6lzsPnnco4gGeVZ9jhWSJhSXHiMkOVaXCKo1BiNVw/QXnDyT8A7FQO2m+EQZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793307960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QzZgEsssnoB+AuxdvMsdWQqxuT55/Gc/aLq/H/rR214=;
	b=Mo73i/v2jzgsWZTMK1KoNRwRXRlryxcdeMOCKaa0psapTaFQAPnkCVLnYHZtN6DMsUVo
	 znDjxPC/aNTaRsJH3+z8yEtEak6MAy00L3hfVJ/ZMBhYh4mKW6sd7p0bOjolgGK20xCem
	 DDSU/gxwIrujx0/9yVETwqgIEtuquphwOh0srQ8KEMSOkIuW+T8ZrTSs5pTKzEG+QT3as
	 B8PZ2zAS4LWcbiNDV5U7aZt0GsBs56BIGo9NwPhW/e87IfcmAcvktLwL9no94qjwXhi2M
	 Qa1bzaGZz31vMS9loXGSiPoqC2BqebhTnV8n7uUJrH5RfXiHzweG3ZJxPVYQbWWQQ1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=Zi7cShPe;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB06606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCB06606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=Zi7cShPe
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6df5e315bd1so3800eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1793307959; x=1793912759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QzZgEsssnoB+AuxdvMsdWQqxuT55/Gc/aLq/H/rR214=;
        b=Zi7cShPewJupg0DQM/embdHavmZ4kuaSu+2PkEY2z+RdlRD5fdmPsmi6zu6QM+xvfr
         x1UieGDMws3XfrLND5nBfrpDVoDRbkGvcRpqUgbdM4ZLZvCZVbGLMXY0CFd2jFdINA6i
         AhjR39SWqMrSFYU9nY7SZaH97+PLD9ZBHE5hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793307959; x=1793912759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QzZgEsssnoB+AuxdvMsdWQqxuT55/Gc/aLq/H/rR214=;
        b=0aLnbw0GPk0HCSTVuVFaYJ6HqrkJdwoAppHnSnYES8WaarLvROuda+4wU0AniZD1tz
         rW/By6ueajsPtAg0UB7ap1mUyOd3PTcr6luje1gIsupwLutmJxQJXoBch+LyoQ+EZODe
         RLaxZKiR7dMCrDnlUKxZ3nPm0+V9W7w81mfwXZixo4+Y8c+SFX2thpBIHH8iofxqKxXj
         sYHeNkcxBbpKDJGg3KyPvNUieMAy0O4clrYhpLzqTinrKrT5tvSuPB66mdAgbeBAarE/
         g1nLwPkEz3u+9CZQkcms+xjF6kFC5PMGROc31kFUHUMgHkNt6jt/A6wYgE3/wwDbF41w
         DqKw==
X-Forwarded-Encrypted: i=1; AKwUvBzABGiWMg8YMkkz/6mhFTJ6J5R0r81aVfb9uSow2wg0Vsil0Xf4tKkby4HENib6HhbLd3msnrudW6XqZ6Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxTMAXdwOSlmek0IFCV8DAPwK6Iujno7WLiSouQVT5DI8dsTQC
	ZqBtIRSuXMCn/jF6gXWqiDg0ALj6BOol1M+uZolj4gup/p8ZjzxjE7rZomeygKThOw==
X-Gm-Gg: AYBFou2Jm3l34gUgDjwbYtQbQP0X+oygZpWzIKZVFWuEL9/SS2LhZk5xCbVxP0FcXL1
	YhG7W05EW9umgJAFbsDVPdQQ35MnHe29CmPAjVcpuu584YYrdZhDL+t/n39KNMRfJwTyZQPodFU
	bFy+TS7dVEfCxB9fgiRATAc1zAIfSCkHZ0d3hPL7ZY6f3ZjaL33iMZKY6bfT83/l+sUUOMHDFwT
	8AfTNCuuhy9URl3wqk0equMcY3GCa9asc00aYXKpZfVguzAatJ2lMkWBSyzh6Dc+DhJjTInSpHW
	Orgw+l9aDYV+nu3n3MQc3JEZWkk6ya0qMIhHiT/CYtL32/FLKrt2CLCaprilk1ZTre7w184F8gT
	f7C/hOCpGpe38zY+o2umSFEZDPmxWtUdclPjTL/eBocq9VtNprrt/GuOy1LMhne/FyOIWzqiHeW
	o4bHtqmcwvk/Mo2+c9juN/7p/d+tSL9+LCVkcEWihqmR5Bz24N8vvXi3c7YzrcJBX2WFPQNspIt
	/MJ3gCrkAiuFVWNeU8CMAsCeiwPWLm9sn4uwQ5MlJe59b0r1A+AtyY8lFaLeJIQM7uEujrX44i6
	IJlFnB35DUxJ/FCaXCezXIMW
X-Received: by 2002:a05:6820:1505:b0:70b:a287:72b5 with SMTP id 006d021491bc7-714f23fc465mr372599eaf.20.1793307958727;
        Thu, 29 Oct 2026 14:05:58 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-4a9049af7d1sm442982fac.12.2026.10.29.14.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:05:57 -0700 (PDT)
Message-ID: <f9fdfc77-8387-47fe-ab0f-3d5d9c542185@ieee.org>
Date: Thu, 29 Oct 2026 16:05:56 -0500
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
Subject: Re: [PATCH net-next] net: ipa: Drop unused qmi_elem_info arrays
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20261029111059.85020-2-krzysztof.kozlowski@oss.qualcomm.com>
 <97e9474a-f491-4447-b128-e4a5687056ab@ieee.org>
 <a9910bba-5a4d-4eae-905f-4e576b03e112@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <a9910bba-5a4d-4eae-905f-4e576b03e112@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/26 2:17 PM, Krzysztof Kozlowski wrote:
>>
>> Did you find these by inspection?
> I was going once through all these QMI arrays through multiple drivers.

What I'd really like to do is define these things in "source
form" and have the C files containing structures like this
one be generated.  I'm pretty sure Bjorn has a tool that
does this (maybe he doesn't want to use it though).

Anyway, thanks Krzysztof.
					-Alex
