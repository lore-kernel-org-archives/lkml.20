Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635015;
	b=IGefCnQLnRoCNyDw2MTszE0v2peu+1qsSqfFKgcTOlM+S+7q/+MQKlH2fq0Sk7xJ0F6F
	 /r7af5tk6U6VSIXP7FulrZLy1rG7EoGznQh/tnS00fPadgEYc4IpsKuTXldI7lhV8rCtC
	 TODubeDZVpUjW/DrJjCq5osx8CUHOs8amA5dCj6KFjeNxPdiIcOYB3tdPTS2hNenuuM14
	 59dIxh70NSRLe35+xpcofD+izvQZXZqC7LB2hbzxoRy2EvuPgaHQBgKsLxnm5ZMnV3wk7
	 DJWVgzC5nw0b5dJBuKbO63KZJPvKCWWsmA0QU7yZlZyORcyLR+nLveKIIHk8CyQ+Whw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635015;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=svdWyrsgF+90eWwYkwJ+BgLca86Hpg504Cs6W86/4gc=;
	b=LM2vUB733k96WFvqMnRYnNXM4bXNB5hJaBWEJGLajjP4+0s7LZjBLWqS+vwdbyew+2qv
	 6KBVJIiyw3h4NgnQSfmG+Z/0veTCcV8ZXrSMejfM89I9UHTgT3tT8myN7brlrctDCEiZR
	 cUhy+AkQeVtJX0bbrwInkH/dV23Y/VB4s4n4OhrXgAIxYeuFZco0PQlo6chwPOu77F5Bn
	 OdA56S2ZSSUMB5GqdSsA/nvsJg0AMdPnxJFoT1rcpvjCB+OVDUmZ7WvGnukjk/TlEqTfa
	 8bVSDWB6n8n3ocYY0j/ZWuVNUx2Td8qsPQhNpZHb5qsKwxXugzT97/b86vcWNYIgwTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=QaP9RCUe;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8622606E032;
	Mon,  2 Nov 2026 15:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8622606E032
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=QaP9RCUe
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A1E4C40430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1793635013; bh=svdWyrsgF+90eWwYkwJ+BgLca86Hpg504Cs6W86/4gc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QaP9RCUe5ki0aqKAVxXwzM8AvvLCGl+a7hvHW+vW8zAhuTUX6SdY48QO0fk4GB3CM
	 VVqaWGt7mo7i/XBErrZvqhKtYlpFh95r6QBsc6S+UIt8J6kCKmG8jw0wMxZYuF+s6V
	 GqfP1bgMI9XfRMA39x93ZHnXUYfZp5iRUH3cCEmwE4zbsXFfOF91a11I/+Gb5cCT6M
	 TPnq7F/Bjnk/y3tt8eZVeL4/KxpAMRpfQI+T9OKiDVx0U19FnS24hFcsRwGzkaCOxi
	 UQ9I5jLqdZ5+y8Gb+aMBrUybVGIlx9r2GEY/O/q1ICKOQA3zEkNqew6ooIz6ptf9jP
	 +sr4zneWhEWDg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A1E4C40430;
	Mon,  2 Nov 2026 15:56:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Andrew Morton <akpm@linux-foundation.org>, "Carlos Bilbao (Lambda)"
 <carlos.bilbao@kernel.org>
Cc: danielmaraboo@gmail.com, skhan@linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Avadhut Naik
 <avanaik92@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: remove bouncing reviewer for Spanish
 documentation
In-Reply-To: <20261101184806.11850a34e2dcfae9c3f55af9@linux-foundation.org>
References: <20261102022923.686974-1-carlos.bilbao@kernel.org>
 <20261101184806.11850a34e2dcfae9c3f55af9@linux-foundation.org>
Date: Mon, 02 Nov 2026 08:56:52 -0700
Message-ID: <87fqxjdy63.fsf@trenco.lwn.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Andrew Morton <akpm@linux-foundation.org> writes:

> On Sun,  1 Nov 2026 18:29:22 -0800 "Carlos Bilbao (Lambda)" <carlos.bilbao@kernel.org> wrote:
>
>> Remove Avadhut Naik as reviewer for Spanish documentation. Mail to
>> avadhut.naik@amd.com bounces with "address not found". Translator credits
>> in the .rst files are left intact as historical attribution.
>> 
>
> Thanks.
>
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -24843,7 +24843,6 @@ F:	drivers/i2c/busses/i2c-k1.c
>>  
>>  SPANISH DOCUMENTATION
>>  M:	Carlos Bilbao <carlos.bilbao@kernel.org>
>> -R:	Avadhut Naik <avadhut.naik@amd.com>
>>  S:	Maintained
>>  F:	Documentation/translations/sp_SP/
>
> https://lore.kernel.org/all/20260316125324.396889-1-yazen.ghannam@amd.com/
>
> suggests a better patch.

I don't quite see how ...?

I've gone ahead and applied this one.

Now if we could get that translation active again, that would be even
better :)

Thanks,

jon
