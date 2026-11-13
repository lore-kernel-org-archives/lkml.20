Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568700;
	b=HlLzAWIws4jZ7Cgts4MLHgV+pLqV8APZXPzSswL4b9gOfFPDn5GBWuuDiq4Das5hjt3l
	 TMg7XCmnJTGPKDtgykYSliy/+M+MIN86xH8VPiYVnv9VGVkCKgi6qmh0plq7w1y367ZQS
	 rvZbRiZUPV0zLFg8G26tKf7bfAK1i6U8vqXqEyMGzQJK6KGVZ2W7UA+TH47TN6FiXop6o
	 3iJJ55VrCjBR41HR6r3icERWC6/KDXQ34xvm/znK5YdoMwUhUgaQroSrpqQV/eC0/pcgV
	 KYtv4NbyzEZfatHpkYQ5+iGX7qrN8meAkS5ZVBxBp8W4K9vsj1AMMvL/HSD1ImO4dwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yTPSuLjHZ91Gzx2vuAX0dXJZsCPfkERGqnmcCVyjerg=;
	b=fOAoMTrlDeuTAmlLhT6LjqOWXAqKgH971GRoySqBG9BHc45ya2yEKdp+3aayuNG++Ep+
	 aFe8pc9A0GBBvPuvtV/bmZR1Lel7JZE/J3aq7v2Yc3YcoGU30YTZsnuSaYy9wZ00g/yOq
	 NYwo4zR6/GmYn1o+4o2goZz/A5LvPZiyeqY30mhhw+bqhmX8XMQBwk2BqHB8rRaENbXVV
	 Tyoaw4sHClMWGUfbauIEoNFMY4Ct17WVCw9t+5s92/63gmCiM81bIOU5br2+vLnoHNedX
	 A0GwrQYwqTX3Qe/+Hwf6YNreMgZ0NVgdlmJfhkydumYN5LOVkJ3xTP12pNJYoanAE2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fg4tjLlq;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDD2606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:18:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFDD2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fg4tjLlq
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c247f6687dcso203691166b.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794568698; x=1795173498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yTPSuLjHZ91Gzx2vuAX0dXJZsCPfkERGqnmcCVyjerg=;
        b=fg4tjLlqn+36rosqommxbOSmLh29Kjc6374o7h0g77d+Kb/CA9bJOLKEgNmjyMFdd5
         8DuH32ajkDktb5Ct2CF0wl7DBj3NqozDZtrlqbQdHALuotomAPjsS/FEDUZYHJjo9EY1
         hdd1WablpYlIi6yufYF9ZFrWcSLxqQGbvodSiiY7ySluid6GTje3MY9pxWRoj4HPGef0
         a+Od36Q5z1P23NoJjO5agEr+4UBBeOLEwB250mmUQ6e+CVDQRZY5f6H38PG7yLAjnKgS
         HzlHEfFCTzcS54+UTgjrSLa9J324BmvYZrC5LeRqg6VDtnelUBfJ5jg33GxHVuFS7lbP
         NDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794568698; x=1795173498;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yTPSuLjHZ91Gzx2vuAX0dXJZsCPfkERGqnmcCVyjerg=;
        b=TzDmCByCVrKPOztHvksYU5WfJh5rlkzTe8n/v70cmgjb3aaEuA6rKVoVoXBoRDr6L3
         gdmN+AsHPxASRU9P5e8S/Y+GQ9Nz5wdsKcQaJD0XBeOfYEobZjOfKubJDIkshqDSLi9Q
         FPLEKivg6X90G7aZ0sr8jYgaOmtgp4I0YKiVEsWRY62pE22PCBGjlPpDQiBgHMpNxeuO
         LWmYKb0fpGleRmrTs4gYsj0mZT+esZFQJN08N45BvnMpVd4a+FqjUIQVyXOWOoYHaQ/V
         +gHTHhbD+MxUx65i2Xl/w4l5JE2GPB+CJazg/P+dPXerWHp7XTE6T1VCUeqQlnAsyQnK
         qGhA==
X-Forwarded-Encrypted: i=1; AL+hErHte9631w1x9h7z5JbKjwIWwFokGJuAOJoDS/A4gE5mfKrsAypqN0+p3+E9bzaiUH9PzDfUSbFkpeHSPME=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MdGaUJDSWv5R2ZkyNhzdSJEFaK2zwX+d5LpDCK1sKZ9m0lDQX
	iRfI/XPNbhWcytaspDvq2hcoAxef4vm0jbKRus3AKkRhAYy7PJ56Iwi7
X-Gm-Gg: AYBFou1Hi6PDYSthmUzPrKYmkoffQJTRtLT85sV7uP/ji8rlSPu22ffz+6RahEvAg0a
	kaWMZVubwYsJBdF8HWa4VK2gpFzMPmDekt72pm49d0/w/P76iamTSmOmh9EtPyMVwrj8L0hyu92
	+dp9x8r86EWfyAusQnHgAzB7QZeA8EsAt2epBPVzaYANWFGgTHR2J9C+eGO2gvfxuL5V6c9SKF/
	OkY/NHTLIdSc0KIv2Wwe3MOpKjgHwaTqEqyGD5eu2fHhqPJaCxtB1EubqI5L1wYayk6DRjApT9S
	KVKUtr9Bl2S84YuMZOCz+JjoIzNgW090qniSTL9VwOX9P4+a+WDX/tbFcC+WTrhjfi6YRShL82B
	DQr0ZldztQWO8l7Ysti2gZQwGuVDs1v4rCFxXZt/3c2nmCPrgJ3QFfRLj1/oAi5PaT1ebqnsCYc
	lFK5gyEMIWsST/u8ZNe05frSULUXMml3Ci2CONYsKSW+rMiS+NWaiEaAvVsLG+4pMCY0Os3ueqR
	/uxPVJPcIjAxDkEYIlkLvyhtf/vqIob6uf0XryMJ4SCVQKAdBzHeflvfNNLpURwv6d9V5+7pLlH
	VAOiBYQQjHOW1ZEoknlKwleXh+ff/MSDEhiZrgVeoj5/JYDQOtjZDnrgKC+8/Y0=
X-Received: by 2002:a17:907:a785:b0:c46:a607:6922 with SMTP id a640c23a62f3a-c50963d90b8mr192283566b.25.1794568697967;
        Fri, 13 Nov 2026 03:18:17 -0800 (PST)
Received: from [192.168.1.89] (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5a78csm81839466b.4.2026.11.13.03.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 03:18:17 -0800 (PST)
Message-ID: <9edd23b7-8f91-4591-0803-7682acdcd02e@outbound.gmail.com>
Date: Fri, 13 Nov 2026 12:18:14 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/8] char: xillybus: Fix issues reported by Sashiko
Content-Language: en-US
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org
References: <20261109112800.48663-1-eli.billauer@gmail.com>
From: Eli Billauer <eli.billauer@gmail.com>
In-Reply-To: <20261109112800.48663-1-eli.billauer@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I'm withdrawing this patchset and will submit a v2 shortly, in response 
to Sashiko's remarks on this submission.

Regards,
    Eli

On 09/11/2026 12:27, Eli Billauer wrote:
> This series is a follow-up to the previously submitted patchset [1].
> It addresses Sashiko review comments on surrounding code.
> 
> No functional or user-visible change is expected.
> 
> The issues addressed here originate from the initial submission of each
> driver (Xillybus first, and XillyUSB several years later).
> 
> Regards,
>    Eli
> 
> [1] https://lore.kernel.org/all/20261009074557.19996-1-eli.billauer@gmail.com/
> 
> Eli Billauer (8):
>    char: xillybus: Use unsigned int literal
>    char: xillybus: Safer access of unaligned pointers
>    char: xillybus: Return error in fops read method handler
>    char: xillybus: Rely on FMODE flags in poll method
>    char: xillybus: Refactor flush function
>    char: xillybus: Correct handling of wait queue
>    char: xillybus: Avoid indefinite sleep of work item
>    char: xillybus: Cancel delayed work items before teardown
> 
>   drivers/char/xillybus/xillybus.h      |   3 +
>   drivers/char/xillybus/xillybus_core.c | 109 ++++++++++++-----
>   drivers/char/xillybus/xillyusb.c      | 170 ++++++++++++--------------
>   3 files changed, 159 insertions(+), 123 deletions(-)
> 

