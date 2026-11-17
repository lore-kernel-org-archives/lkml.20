Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918414;
	b=a+THEjDgUsbDB7dcZ/JLelNOMK4V0VToXEiyHeD+mbO1V6dqrWJP7+vgz6tmH6vFJdGM
	 6btny9EtIopjXAP4OgTkzWohugRE5l5/VfX+EEvLY/GgLal0qS46JP3gXTkMryIZgAHh6
	 t1W31B7WrOr3qx11llooB6FJj46/eAZFdCGPS3KEA5kHvXRttttYX3yvYDJaArAI1RYdj
	 NKUaEsaGhzh/+VtubfxbTs00N14lDQNbo6CbX0xmn/SSKtq8M8jXVLJR3xaj8QTOFZGrZ
	 bY0xAKkTQ7ZVbghD5lkqzqm7u++8YFU17occWFAqX/uOrcde41RgNyUrxpz+gknh97g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pw66cazUIbMSivljAjFqcAVts39UUm/2ZxFC5sg/Ewk=;
	b=s/y7zEu+KgWA/5RCfWsxTSVUJdv9dyUUll/EL2JrgQECOuUDANOIFp85UEqV/6Xj+ZcW
	 LDyF3coBaf107du3ljEfppSp/R2d4tBD/fow8bTZA4b1LdoSvBXAIi394Svznbcq1vFrD
	 nrT/IEb72ZAZ6FbpGEnSPAKx8jFVjvYD7xxJyggb/RW5BOq8xMKxTumQg4tyzLnMUKSMY
	 ED5hKCNUh2tfz6Lu3GmfB3DjStgCRLk7VVemCsxPR5P9DmN1Rci0q4ZwgWlS4TQtmKbuU
	 vDz2hWlUF8TVmuJUL8rqcZV++QWUZoPBm/NHvQ9c58qYvMLGivWgzFs6xgi4xCCwV6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CclzPqBA;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB98D606A33E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB98D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CclzPqBA
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-372bdb942dbso4172852eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794918413; x=1795523213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pw66cazUIbMSivljAjFqcAVts39UUm/2ZxFC5sg/Ewk=;
        b=CclzPqBAPvQNM7so5prRLiQoBZU1d2A048Dzq15q5F5qZSTMmwKP8McN5KO5UFYcSJ
         WMQWmupwmNzVX6J7nfJS2NjsGG9yQsW0X3KqWxflsl6wk64kosaxvYDEzc3k41iDKPlY
         gaYhFlF+LAw+D552SmX3Y+wF3GPTzxBksfCJjuWvIqjVZ6q31vcXkaxqLXXEozfErFWq
         X/J4QcuWEjhEUVpVEh39vE9R5OANfo3eEiVOanR6n+PrUtoqchunqZsHvLwLn6w9V5dZ
         kK1g5iHq/A6HFZKllKdXmLTmfk5+2muN9snMhkUlHqLx06ABruo10z3WgiX2jyCOqDzz
         wIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794918413; x=1795523213;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pw66cazUIbMSivljAjFqcAVts39UUm/2ZxFC5sg/Ewk=;
        b=nZnnLEItH6fx3TmbdtXqBp3HMLaK/WAFyKROBUmDw5jrKJECdn6dBGl5nJONH1vrDO
         VD8WY9dTAhoO0uKwBbX0vIU1mM2nUcx0Q5zFzigdseC+nxYahJYhXuzRWshwJWo9iMVf
         Mb6ZqBHH0rkRPUhXbRwO7rPlT5xyIGMU+X5pCwLzQ1Ij7RImB1/cqRhAvFWxa41fYEZN
         NUbZyC0e0H/KGbrGOcT4YEGjyD7aXj6rX/JT0WGYWbFkTe/IKN5Kz02SBtYJm977i+/3
         tdT/7ogO23AZfEik+x8v0e5A1BzKq5V0WNQgZ+ZHL8xlL3ntf9f++PUq3AYvE0MGg4oM
         qL6w==
X-Forwarded-Encrypted: i=1; AL+hErHPjB60UWCv0qqgAGl8f86DKkJQFOvGUyYyD6A8dGEYgaJp4CJOGY47DF+qtMeh/wdhUbaIhMe35QubFmw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wKsAmqIAnzjo+HD92ozZh2/FUUM3lFSveEup/SKbE3P3Mnrho
	82/l76L5iijtVreFfZ3pEjEWJluyEtIHgQe70UFJSI0up1prtCaYjoMeCsQkYjlQ5Ug=
X-Gm-Gg: AZFdTZeLdkitFIyTRZLF6x7M8o8/PN54OEn0O37puQvC65n5TGeQVrLnEct5I8K8Sx9
	Al+Xc0ZtwVYqic5fL8/UZS8X28oDNLnyU7CK2eaX+xbYolUhT+3Up5lDmcGoBvamb7A5sGuttn9
	Y9snMMTPFgBVd//ol5AwmFIlHAGfWD5uWwbh/WczdRjWwSQQfGQ2yYrqK4Ka78qxF2R9tol6dx0
	90L9w3J6OJLEdLQV3SgP8Xvm1xnNNnGhWd+/4VkdNjBU02Wz3nIMQS0trAmMheEvjkwe3/rO0ii
	ZU210a9hwlXgG51RQd+5EdfnMstVXprVyRbeoxZ9vLiK/tLs6pyMFmLAh2zRudGvW+MO4yG87fS
	eb0GQS4UiSZJxYGCGjieGFy9z7O0kFp4oCqFf5rU7s8aoxTzeFyGDWUy3JrFhJE/CY8VVxVHfvg
	6XM+wXFYQhrK2UaWgXT2jyba6ws1lN40MSqDzfiENvt2dW8sM1AyjDauwCQFAtVnrPfQJjp3/7u
	G67gT8Ret9+6/OONZokIvSuHEHzS0nwqDk2Id957vOX4Zb0WXYpHe915GTsc9d70CyMiep/QA6i
	N0rBA2bX2AbR63kYD9UOmsC2ErdB4lRt2Q9DVBUD/bGK6bElUYfESLbuZEyUVavqZEVFADp2oSs
	z+UFWKhliaXaUqB4ewD+45IMWb7vz0zvvVpfGGmKKpFl9MHqn
X-Received: by 2002:a05:7300:e9c5:20b0:361:167c:2364 with SMTP id 5a478bee46e88-37966e3ab7cmr14780189eec.8.1794918412639;
        Tue, 17 Nov 2026 04:26:52 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380d5135221sm9026343eec.24.2026.11.17.04.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:26:52 -0800 (PST)
Message-ID: <9e96afba-66cf-4812-b14c-faa2958caa06@kernel.dk>
Date: Tue, 17 Nov 2026 05:26:51 -0700
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
Subject: Re: [PATCH 2/2] io_uring/net: Add bundle support for multishot
 recvmsg
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@meta.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116111744.702159-1-cleger@meta.com>
 <20261116111744.702159-3-cleger@meta.com>
 <19c6db06-d63a-4dc8-9b0d-11fba039b714@kernel.dk>
 <e29f42de-64df-4c38-888c-64d7c89a81da@meta.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <e29f42de-64df-4c38-888c-64d7c89a81da@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/26 5:06 AM, Cl?ment L?ger wrote:
> On 11/17/26 03:45, Jens Axboe wrote:
>> > On 11/16/26 4:17 AM, Cl?ment L?ger wrote:
>>> IORING_RECVSEND_BUNDLE was disabled for IORING_OP_RECVMSG because the
>>> envelope and control-message sizing was not implemented. Enable
>>> bundled multishot recvmsg by reserving its metadata in the first buffer
>>> and accounting for payload spread across the selected buffer run.
>>
>> Patch 1 is fine (though both need rebasing against for-7.5/io_uring),
>> but a few notes on this one:
>>
> 
>> 2) Why not support incremental buffer rings?
> 
> I deliberately left it since it required more wiring/modifications. I
> can add it in the next version though.

I think it's much better if it's complete. As a user, there's nothing
more annoying than having random features only work with a subset of
others. It's confusing!

>> And the usual, do you have a liburing test and man page updates as
>> well?
> 
> Yes indeed, I have liburing tests, just didn't to send them right
> away. I'm missing the man page update though. I'll add it for V2

Great!

>> A minor note is that the commenting is a bit excessive... I'd prune
>> that for v2.
> 
> I'd usually remove them but they mostly seemed useful to me. I'll
> prune that.

They seem a bit LLM excessive to me. Just something to keep an eye on. I
like them to be shorter and concise, leave the bigger explanations for
the commit messages, if required.

-- 
Jens Axboe
