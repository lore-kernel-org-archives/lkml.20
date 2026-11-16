Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866010;
	b=NFFJI2DdK2HoSzLE1PrU/ZEg6xkeL0P1eRJgUxJr5lDQzhg8q3JoJJVBTO45rtqnTmfs
	 cTEsgX5iLntZ0F/arkBPa2FvRuux2ugcxEwfSddFBEx09+FR4ZnqUg3oBTAuOOtDejg1F
	 r1AegUuy2MYlsHaYMGuVO8EcfIY+KVVBGqrYIV78ev+iykHa9fU7dTs75Y/6g36FkbIqn
	 4TE8MM7LERdXoT1/P2SsXSwF3a6w8k+dlhwRSB0eCp+LLnPCUIqYaGR9yN8rdb8dCErZ4
	 av2msIUWFhSVRlrfJ8Lor0NO1sHfJ6vpXZHjE6kdGpWN1J6rQ/W4CHum4b7QW2tiE6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZxM9DBn9x54akqpkzn9sBtaRSKG943eg3cl8Nel3kzo=;
	b=lIpIHNZJ98pjnOV3paanIwOQWgBGWLes+JDI5F1Z1qJ/3j31WyYykcowKlk8eEv038p0
	 M6sSkjkLdAeCcsxEsW2k89Jbhd7k3ekja/xAdYTUJSnIhcbBBjxZg4OQncKqkRKiNy0/m
	 YuyIv0kMYEmmeQ7DcUp2iAYfLi+C+k4lcXa49Gv9zW3rpiXbiXI0dNYE3JSp+QbQGDX9N
	 SQOdbFWUM1ZugSwarEEp7b949p91u03aLMSeTYUIE6GRf7M8V/6V7yIPvzLiwmq9qDLdy
	 Z3B7QSBxUxkgSnqwDUKs8P0M+5TutOEV4vyYaxmxStE/deP1GbHkh4gai5825Evh5vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EGFEKEqv;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354C1606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 354C1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EGFEKEqv
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so42004365e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794866009; x=1795470809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZxM9DBn9x54akqpkzn9sBtaRSKG943eg3cl8Nel3kzo=;
        b=EGFEKEqv8Wun1nH9x3q6NPhZLAuJ35WMTdBXnIGHyzw2sFb+CDsdn2o1BH1Aa9kU9y
         uxoft//SzoGgO8OppW6Q+yuFjOr9ovW7HM9svUFJHBpR6roS+bXL7zhKj7DOzfdYjYzz
         M8QMv+k2U6H/hbAv0qGIpiO0PE8sqWKFT9ALnrfwq5MOQwbKjOmgPd8zMRqAbBMpeq5i
         beE1Lw+ORPcVdR8xLarxv1PDsC1yPPvjA31dLDzXHtkPBXegT0EfVhxvdyklK9HiKhsy
         ZsZUCGs1WNa8vehACjDvUeTFkhxyolzxs8fYLRYohY9baiJHgmihyzgDbEo6MwBhsz12
         rEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866009; x=1795470809;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZxM9DBn9x54akqpkzn9sBtaRSKG943eg3cl8Nel3kzo=;
        b=LRkitwcOhAVzouQ80UTjq48OUXUXN6y1nXGQvmeHag7cGwqCBKzbwf3LbgFdNTYGi1
         H/K+cGM+AvgR1gjBqj4K4jrMJNMi78qL/ry9dugDYxTpggMilx9d+zy440XfOPb+hpLd
         S93zZPnfNMwNJLVR0NeX36+PGvz1tzKYrnAoaGgoe0AcZzv9G77Kdv/6XRnW4a4m/Ek9
         jGn4mCMo5F+qsWu60NoKdtaCzOA3F6SIersfGRr0MjiHNiHmhXmm9PPek3ys2ExmXuHC
         8ALn9bBD1dfiIkabRX7nHKkMWjeZBeX+TqQSh7kVU5rUJxSmpXn7uXDrQMlPJBjb+Pf0
         Kyqw==
X-Forwarded-Encrypted: i=1; AL+hErGfeGNvaJwFurHRgLWYBMN9aW4ziLYfmUEaZvHPlhoAzXVjGzLjLix4cpzAUFulnZ23ivh9KIqm+YfLhxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wqPLkFJf0hwvoohn+VJMahA53wGInYVXme+HaSyJ2KWnsSCz9
	ijBLsudd8ibgKe2r/V98xIMnH96AlQq1DsnpdRtJ+hpJRBnr8rAUcNft
X-Gm-Gg: AYBFou2AlrIwTyUgM0deZ/C1zlCZR1nKXUIocFq+2560XPnXvyMnTd7VYs2SUcLAf6X
	Mqtwim1+8n/miLdZ+r0HahSHCoP9FBENDsoGpGxDhWKzCrx7T/dMbXaavN/LsTbCUZmMXPrAIVv
	ybtfhe0qB8PsKXT77rmkqEU49QPTk1656MHDrvNeHAhdGu3commiidB8ZbwM9BXxxgiR8Aj9il3
	uANM9+AvilMAFiiD9a3rsF6ME5UHK/7OLMBujlS6BxRWi9ceW9dV/z5kuLQU/NrbHbR22YSqQtV
	WBsOFEG0ZXH2sIBuyLQwbBKaN+kmlRjd2dvF1QXCPmABy+QXwmy1P9RimkJ8oqVDlz7gBDNgjhX
	uC52l5QUrVyAFg0uFz/jTINu9SAx+M0NrXk1PhndTxvSesML3y32fsILIjCbZqnFJABRugkV3ED
	UmW4xcGlTSHE1rqDUJ6kNmB+G33RZUueW41HrIA+gnmzVh5JB1Cjolu3RFzFhzczkoYgb96F6Ew
	F2ET8wHUqucNOTxnxzvHjivnjANJOIxxyP3e9o7U3NUhKmmUNdhdcQkNYtMYbL9kzG8M6yvYYtB
	iJkjz8/sepWSDGsggc3U5TL6NoII25fJt4dbdy9YyepMMEajq4Cd3aHpfQVOwrOEZE6D+rgmqPV
	liyj6f/jDT6DHvVlsRkLrBwc1lQee58msipIhrdYqbddJ+V1ZCG/GgU0d
X-Received: by 2002:a05:600c:a313:b0:4a2:397:73fd with SMTP id 5b1f17b1804b1-4bb55a50c90mr194484255e9.12.1794866008541;
        Mon, 16 Nov 2026 13:53:28 -0800 (PST)
Received: from pc.tail250202.ts.net ([87.110.86.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5f350d51sm104287115e9.4.2026.11.16.13.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:53:28 -0800 (PST)
Date: Mon, 16 Nov 2026 23:53:26 +0200
From: Janis Edvarts Lacis <janislacis06@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, wellslutw@gmail.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: sunplus: check budget before calling
 napi_complete_done()
Message-ID: <7zevuoiao6ildvkxt5baqnalb3nrx736krdxkbrbxouelukveq@2wo6m6cfl6rn>
References: <20261114222744.535158-1-janislacis06@gmail.com>
 <26c5c08f-d6f5-49b2-9fa8-de6f8c244a78@lunn.ch>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <26c5c08f-d6f5-49b2-9fa8-de6f8c244a78@lunn.ch>

On 15 Nov 16:50, Andrew Lunn wrote:
>On Sun, Nov 15, 2026 at 12:27:44AM +0200, Janis Edvarts Lacis wrote:
>> Sunplus drivers currently do napi_complete() after each rx/tx poll is
>> done without checking whether budget was exhausted or not. Interrupts
>> are also unmasked before the call to napi_complete().
>>
>> Replace napi_complete() with napi_complete_done() and add a check for
>> budget_left. Call napi_complete_done() only when the budget has been
>> not exhausted fully, e.g. budget_left > 0 and unmask interrupts only when
>> napi_complete_done() returns true.
>>
>> I do not have the hardware necessary, this patch is not tested on real
>> hardware.
>>
>> Fixes: fd3040b9394c ("net: ethernet: Add driver for Sunplus SP7021")
>> Signed-off-by: Janis Edvarts Lacis <janislacis06@gmail.com>
>
>Does this bother anybody? If not, net-next. No Fixes: tag.

Will do in the v2.

>
>Given that you have not tested this, how confident are you it is
>correct?

I am fairly confident the change is correct, as the documentation
supports it. When netpoll calls the poll function with budget = 0, 
napi_complete() returns false, but the driver ignores the return 
value and unmasks interrupts anyway.

During normal NAPI polling, budget is set to default (64), but the
driver has less descriptors and it looks at each one at most once.
Therefore, on this path, the only benefit of this patch is that
interrupts are unmasked after napi_complete_done() instead of before, as
in the old version.

Of course, actual testing on a device would be great though.

Best regards,
Janis
