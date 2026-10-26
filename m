Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013943;
	b=aoy4Cb37KLtdjgG3UuP1Qo0QUeEFhem8xIWAl7SyvF5+mghHhPKyV2XD67NJoyGO431G
	 jFRfztlR0AjOd004FtYSY5xXqhq1zqklfvhwzamfb8Jt4VQ4LJnUgwo+1kQVNFFSPjcyx
	 NHjYiN2qeNlaWv2cIdstzVxRHJ3VZkUodMAl/pD4b1I608SmyEtWmuc4SEAPi94Eir2Hk
	 Yt8iJ5JwVWn0j8kgmLRqHMTBfFmcvNPpvdeF2+QixCH/zY8x50kebkyEty0XnE7bh64U0
	 q6CY6JEVZW6SfOs4JKKMhDDOwT94IIrO8epf1w4PnzOs0tj6O+yo5Z2duPScIdTVKlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=6eCgEceiFsvuqOLL4DtIMBpdvoUh9ThW46mPVQRJDrA=;
	b=AiaeL36Gw/QZVSll8JwU3ZzUjD+K8gxPKYwEUoHiIx8FcgmnXN79s6O8V43/GIDXuHuY
	 qsSVZgf0fb4+VvHTyZYza1jcTjTJiziPt5dlH9qjC7DaqpsbUvVZOM46BNl6MBYcqoVBQ
	 5M92stCpgPRKjtzfEkEl6CoP6hij2AdIGGfGz5NORixdNefnoXpKRDysNIK0f1feeWJDg
	 nXXtvLI0/Pe7XTBDX07RJ8SCxGRPx+21uQdArtCugWQSM3EZRE1cirGmFiwq1S5nwVxjF
	 cZa+er+cUVLQMBu82qgwI6im1MBedT3C11QiM61jdT/D76s18UViEVwV9LDmPLxPIIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eV5jybMS;
	arc=none smtp.remote-ip=74.125.224.131
Received: from mail-yx2-f3.google.com (mail-yx2-f3.google.com [74.125.224.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871B2606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 871B2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eV5jybMS
Received: by mail-yx2-f3.google.com with SMTP id 00721157ae682-8a72cead747so6821527b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013941; x=1793618741; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6eCgEceiFsvuqOLL4DtIMBpdvoUh9ThW46mPVQRJDrA=;
        b=eV5jybMSqOG9bpl2tJh0auk9VkaeAh9svu9HUTruj0TE6ut2p9ieQtaT4334wJijWQ
         j2OijJAAmWx+5EvpkGrgmmAdJy2eLkbVeOKuy9UDdGgvmdXb0o6hx2+gd2yCR1JVI7qg
         a/Ldlbva9AtFcMz/L3AtCnjN8Mtg9VBqhTq2HtkaFyxVFeLvTFMtOWXX1XIw4GfZK27e
         GdNhyZAMdopArMDhbBb5l3qliu+MA3NyZIAUJjn9S+5JpXKaAuWtmEjEEnaNLCiqi908
         xcW7Gq1PEIPwQTsWgFsWh2UKoIszphwpxcgTVAnJxXwhKbyINS9e6yxF1kQOZ2DgMrHo
         CJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013941; x=1793618741;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6eCgEceiFsvuqOLL4DtIMBpdvoUh9ThW46mPVQRJDrA=;
        b=cxhfloehLkc3t7l2swJ9I4e0AE/nZIMToZfJdJCXdy2iXqVVOir8J+0QRLNOj5mSLZ
         yLNEdx1wDVNLrFRMcz6T7TW6gbXqO1oim8AkAjOcI4ImSu5aAOT1gO4GjG+gWaNih9HX
         sip1t93+uNzxuBzkKVxpGaGWu3xNv9lZiep2hvEOYqhFfvyB2K/WPHMWjbT7C9MVyUV8
         eEhgtiQOMFfoXKZBt4uZRLR2XJvFnsEgnH+ZX+IjGRto+JhNwQmousTR4kav/zzsZllK
         lSEchwytcy44qnUOe131jHiFhRpQw6FLXQDumWvYPHrXPNkv8MBjKNfAK3ioL2fVvCHk
         vngA==
X-Gm-Message-State: AFq9FYJv0XgqeP9DOS60QS/sDXDi3/1LZrk4Ggfi3ryE6NYB9U5e/Nfd
	QxO1/CQ/4GGyYNECfrwnrcftP9UdFV2FSddh89XrR5vHV4AcqwlmeM/1
X-Gm-Gg: AYBFou0VYOsLQ0HweLJ9EYp3eTR4xhaVXeh9+e5F+S9b0IPhx8ChtcMOZ46bDjSr6g0
	yqCNqGAH37+bKQh9LgxNLd+0M03XPOf3yqL/DH2TqVIc5mr+zl90R1RStnTCsqDDTbx6VaUYxLe
	mPiKZl4eH0kZ6GNTtbTybZtXdRzuBfhMPSNJpGlCTlip65M4IMGnX1KBEFtYAfNlIfs9fJLFhiT
	tnQ4+STXPcFOYLBJgfYuUdgROHzXfs7K8DtZbkpWmGloRPXvEBrrb+u55ZhOzLP6+e0XHFciccF
	4N52aNwa7mO8NAcGhPXPIqrVIayxnVf1KStCpq1Bxz1SzYLX+7mzzezxlcw8ptxdKa6HPfde4Kr
	qq+N5973iynakf8LymXmylIWVB68UZH8mWcpOKMXzlghGZS2rgaVHFXYIxJkVc+zAcIjOD+8eP9
	coAMZarDHSaVt0/AjiXIrmS5VAVwyxkdDMdOCyFVZDbzZ2UzpWnUOo9jY2RbfYUBOdDDhs0gNEw
	/ixcuFm15I7BHVgrxNNGh85ACyW8hAos967H1jBIwSQzISrtqna1u7j2JbMG12g
X-Received: by 2002:a05:690c:2788:b0:8b0:eab2:f502 with SMTP id 00721157ae682-8b166c93421mr38305577b3.61.1793013941439;
        Mon, 26 Oct 2026 04:25:41 -0700 (PDT)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166c5d605sm29719597b3.5.2026.10.26.04.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 04:25:41 -0700 (PDT)
Message-ID: <c0c4dc10-8999-4c4b-977c-69beaae7bdcf@gmail.com>
Date: Mon, 26 Oct 2026 07:25:39 -0400
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
Subject: Re: [PATCH RFC net-next 1/5] tls: add HKDF-Expand-Label for the TLS
 1.3 key schedule
To: Hannes Reinecke <hare@suse.de>, John Fastabend
 <john.fastabend@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Sabrina Dubroca <sd@queasysnail.net>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, Chuck Lever <cel@kernel.org>,
 kernel-tls-handshake@lists.linux.dev, linux-nvme@lists.infradead.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Martin Belanger <martin.belanger@dell.com>
References: <20261025-keyupdate-rfc-v1-0-60b7756eccbd@gmail.com>
 <20261025-keyupdate-rfc-v1-1-60b7756eccbd@gmail.com>
 <c75aa5d6-5037-4489-99e0-3e38528e10d0@suse.de>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <c75aa5d6-5037-4489-99e0-3e38528e10d0@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/26/26 03:27, Hannes Reinecke wrote:
> On 10/26/26 1:36 AM, Martin Belanger via B4 Relay wrote:
>> From: Martin Belanger <martin.belanger@dell.com>
>>
>> A TLS 1.3 KeyUpdate derives the next traffic secret, key and IV with
>> HKDF-Expand-Label (RFC 9846, section 7.2). Add the helper for the
>> kernel to do this itself.
>>
>> Only the part of the key schedule after the handshake is needed. The
>> input is a traffic secret, which is already a pseudorandom key, so
>> HKDF-Extract is not needed. Each output is at most Hash.length bytes,
>> so each derivation is a single HMAC with the library SHA-256 or SHA-384
>> functions.
>>
>> Assisted-by: LLM
>> Signed-off-by: Martin Belanger <martin.belanger@dell.com>
>> ---
>>   net/tls/Kconfig    |  2 ++
>>   net/tls/Makefile   |  2 +-
>>   net/tls/tls.h      |  2 ++
>>   net/tls/tls_hkdf.c | 82 
>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 87 insertions(+), 1 deletion(-)
>>
> And another HKDF implementation. Maybe it's time to split if off (again).
> But anyway.
>
Yes. crypto/hkdf.c went away again in 6d888db2cfd9 ("crypto: remove
HKDF library"), when fscrypt and nvme-auth moved to the HMAC library.
tls_hkdf.c follows that pattern. It needs only HKDF-Expand-Label, which
is one HMAC here. If a shared helper is wanted again, I would do it in
a separate series.

Thanks for the review.

Martin

> Reviewed-by: Hannes Reinecke <hare@kernel.org>
>
> Cheers,
>
> Hannes
