Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424890;
	b=UTf6j1/tMbCOJvm3D+FGT2vT5FsfR8H3AoL56RwMP+IU4RfGVKnx/62AyqrnFC0uiySx
	 /vdEUtzsXOF5K63jHw161WBGbm1m9DXhxm+PDSgEwa88dPeJoCgMW1JSZTOkPD08dbvPZ
	 zw4UHJ+o5gYMeyVdqimBJSznUkNRIE50FShaJtL2W5XhPve87qzulyDdaz1hGkECBfvQO
	 OWDeWq4GEIgZMjybH7pdX86myeFZZKbuCpJeiS4vvn+WYeUW5zr8orn1EWsSot3PBU7RB
	 2EHFguGdUm4Z/hgr5lPuXKmioGHaLeRNYNr+qumbB4Dt6Q85TpyDJa8FSP1IYeerH5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=EOz/+k6Rphfauu1mzh1ygpzQgMQ6Co5lqmSQNO16YRU=;
	b=XF2kEY48ClQlvW91RCDihGnkXJsTFZIwc69h6dXPDGY4mZZzGZ4bpS3U0oDbSPEFeHBy
	 ANIluCQD02u66mDbRtLpFuQ5+ArTlYsaWsbqnSAtTyLul1cTpYn9yGuOC3BJY86VjOTcv
	 E7R5vzfDrcEZz4AppaZYIYxpSNlA+p96z5GSYqVRjIQ3BqzCn3XPD66H+fbuCCbGx9++z
	 BmXFNKO910ICN4SVVvJN4hoGXpw0e1wBL/FDEkliiA2hSMMKbMnReACWN6Dm2Kd/ejYq/
	 KbGKjL0pdwCatY7jBJMuylYtFSaLOPgmW2kdQ2ACN7ELoKWRukGKvLc4Dnz4Q4bDaUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0aNYUXD;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D55606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43D55606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0aNYUXD
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso1788078a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794424889; x=1795029689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOz/+k6Rphfauu1mzh1ygpzQgMQ6Co5lqmSQNO16YRU=;
        b=t0aNYUXDdRAZpqsbOIRoanjkWthLrq9de/FZxXADbekc3TgpX5MGsP0isyhoiLOqHg
         04lnghKOUMfOOHWfuePk6lKRbCLcRBcNrmM7q529KZNdIGKrJNCUQnGo7ndGsSEBf6Rp
         QssCN7HeBGbLIG2BwTcpJ0OtCo0ikqLkYlngBgW0R78Asv2OI1UtWkQ5dNkACWhvPKiQ
         MnF/2AP9lPuNQFQwAR5etpUQ3+GU6/eSb6EkdVxWs4s8DZD+RpgXC6DwpmIUGZ0PT8UN
         TErDiRt59CF6DjrlXofNjc5t/3SiBT7qwPf28HtWRhUTbONWCjDln5BjHvWJOLPKBsr/
         rIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794424889; x=1795029689;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOz/+k6Rphfauu1mzh1ygpzQgMQ6Co5lqmSQNO16YRU=;
        b=AftT3jTU/JsihP0+lVG76ndf5AkRtvnHkgSHOpQ06lw0NoVJegUMPuosBwOwlYPtRr
         8Mz5fRF7xtjmUOeIUFI2CWcOpfeQTU1gY5+eiLj+9A13UbhBmjzyuL7W3qFFYG5YjEZh
         XE1FJvEY4HuvCpCCNdkKCo9j4f5JrFyxMh/aG0OgzaTtQqol0tbvfe4NYzWL43wTn7lq
         cgdBMXTogJpiGh53g7jX5QqnvZdbtEi5m31ODXqit9LSVg5FMiAOCsS7okTZyF9ODwnp
         ZAtP4UhLldqydk1SxsgEGMoIzKexaUeti955qi1JDL9Y7tAR3CrpHEK6g4GW5muQZ8YV
         o0dA==
X-Forwarded-Encrypted: i=1; AL+hErFB50ZrsrATLQrBUQclBzF0wYJ8CN1spCd0huETH1LIV9iBTNZtN9s0PhQl+S+UoCgVt+oyf40gjp9b1Eo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3mwQRNEwgk2s5cYp1IYaMIlcWR6WkKIKW56yVPdRvP025oZK6
	QiImXjNYY9LXVPjLv6mAn/tGuh00jxNS6XOFwcgOjPBVbrNiIMXpOGJc
X-Gm-Gg: AYBFou1qtdDj1Kk9lou1ymzb3A94k+Y0rMNle1JCmiKrcd5/wN6sGHjPaVZ0IJJFyeZ
	zzAm79EAfnICrTXHSY7+oA2FGUyHlp+TOf24MYPRbl4NMuZhNLkT5iUjbmUsw7/W1wcntXKDr++
	QoMjAn3jtq18BDOR0soIO1XkzaxYcToC0ateW8uIzFVLTJiAXUB0TWB6ShnCco2NcHbf06VAYyA
	RPvajYN0xCFW9/UVgbF0b6vTGDmXYeZPGmbN7cV8NjmCj6AM7Z0flN2u+zHAFscDROXIaksnnNA
	7/asUxc/5Mao98kZ1lI/UjBvzqOijDp4ApwvovFH0ZTZa/qiukgJAVfJH73BgiQZQkGJUpA7brL
	39NdPMihNYUyW6QJ71c0fWYHHhwGiiAb9m8onZJHJhBuRN/9i1D/VjdoOq1fo8uzTIUwjcxuXq9
	UyJBqP9qmQVehudRnpUDWCahnxhSsMueq2OH0TNBnU70C27FMzBrcNl2KFNHMH2dPOyN01XiyOx
	+D8xdHZqyTHb82asKswwRmkIrLB5nUp4vb7+AbBYt6Z90IUbggwxtdgmmKtOlpFi+KzvZEsmya4
	ZpVSUDn5pplgM529vmcnHjSCr5QT/UVRWn9KjokL7fbPVF0prcNoN1p0fw7c8tZquhXOVOZc3Iy
	yHQ==
X-Received: by 2002:a17:90b:57cb:b0:3ac:7872:d1b7 with SMTP id 98e67ed59e1d1-3b182eec0f1mr3136688a91.32.1794424889401;
        Wed, 11 Nov 2026 11:21:29 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c42a4csm596583a91.4.2026.11.11.11.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:21:28 -0800 (PST)
Message-ID: <dd549ba7-8c19-4c77-aef4-b3607298f6b0@gmail.com>
Date: Wed, 11 Nov 2026 11:21:27 -0800
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
Subject: Re: [PATCH v2 1/3] clk: ingenic: Poll JZ4780 CPU1 power status
 atomically
To: Brian Masney <masneyb@kernel.org>
Cc: linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, hns@goldelico.com, paul@boddie.org.uk
References: <20261110043131.1985993-1-f.fainelli@gmail.com>
 <20261110043131.1985993-2-f.fainelli@gmail.com>
 <179442247882.1131744.13316822371180932611.b4-review@b4>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179442247882.1131744.13316822371180932611.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 10:41, Brian Masney wrote:
> Hi Florian,
> 
>> The CPU1 clock enable callback runs under the clock framework's spinlock
>> with interrupts disabled. Its readl_poll_timeout() can sleep between
>> reads, which is invalid in this context when SMP powers up CPU1.
>>
>> Use readl_poll_timeout_atomic() with the existing interval and timeout.
>> This is a prerequisite for the JZ4780 SMP bring-up path. The original
>> CPU1 clock implementation by Zhou Yanjie is already upstream.
>>
>> Cross-built for CI20; the subsequent SMP-enabled image brought up both
>> CPU cores. Development and validation used Codex assistance.
>>
>> Fixes: 6673db4f3f26 ("clk: JZ4780: Add function for enable the second core.")
>> Link: https://lkml.kernel.org/r/1582215889-113034-3-git-send-email-zhouyanjie@wanyeetech.com
> 
> Cc: stable

OK, I will add that, thanks!

> 
>> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>   drivers/clk/ingenic/jz4780-cgu.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
>> index 1e88aef7ac0f..f5983033583a 100644
>> --- a/drivers/clk/ingenic/jz4780-cgu.c
>> +++ b/drivers/clk/ingenic/jz4780-cgu.c
>> @@ -242,7 +242,7 @@ static int jz4780_core1_enable(struct clk_hw *hw)
>>   	spin_unlock_irqrestore(&cgu->lock, flags);
>>   
>>   	/* wait for the CPU to be powered up */
>> -	retval = readl_poll_timeout(cgu->base + CGU_REG_LCR, lcr,
>> +	retval = readl_poll_timeout_atomic(cgu->base + CGU_REG_LCR, lcr,
>>   				 !(lcr & LCR_SCPUS), 10, timeout);
> 
> Since you are making changes here, please fix the alignment of the
> next line with (.

Certainly, will submit a newer version shortly.
-- 
Florian
