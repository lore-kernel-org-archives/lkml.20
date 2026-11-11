Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413767;
	b=c8BRYxJxxB5x2zBQ94sVygEbkJX4lQ7FkdoWJ9qqM+WiF0hAA6oanSTjWDqemk9Y6ZEk
	 1adpEC4qCeWESpAcnnpVTTJuaPqVwSMDPZ20R6nU+p0uIhC82eoULwAJqqIGmyD8hCCD/
	 /IBblaEahVy9vQhEvu1mvt8A0uXaF4ldRB0Yr9WwkqB2Grnj7z8SjSz3h3XoXWKcDnt8L
	 U31tNrVarIvaR5RPawAE1clsn2e40Da7I7dt7QYQ8kmAmU2a61YfZi8JH35lV6uUQVAXx
	 ASNjHkvQHqOu2tZWbjBLMcZf5aOvigG5MkohBT42Qo5e1KACbUuUP8U9czu+PmXcmnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413767;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=7zvcBokX891xQLLS1M+3tKPdObUYVeRlsjhWZbl6o74=;
	b=uko5ucgJS+24ls3FmuDKkRPnWYilkKIYjUTfqzO/nVh0b/kjLdXGdLDUsLov2siDmh+w
	 ERfEx9F/Hh3zUBGEnrKJiD+LXtpoz1XN6SZRYjWM5oCJBOlkDOIpCXyb3x88fv+05kX7h
	 MthJseq9Lp8WJRWXOSwuWFauVhv9VltXVCfc8FxAI/u1E/sYQ6H5cs4PCkLIgMmwusrDu
	 A0IEKfaTO7zFbsTCUHb+idQveClq7vKCuT88GClMoHZ3vce1HutSyum9BJHYyQXG22wtm
	 cKm4rDGsqz65sOlyaSCchgYpt8G+D9ToNYGJS3h6JFE1RU9tnRFQMSYzsiUHF1iG6fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ur+RS9gO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FA9606A338
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ur+RS9gO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44E31F00A05;
	Wed, 11 Nov 2026 16:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794413767;
	bh=7zvcBokX891xQLLS1M+3tKPdObUYVeRlsjhWZbl6o74=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Ur+RS9gOxkVOb79J2iW2wyhlFf/+IDQSmy/nlQzYqgxuQW+txpaVJHP0RQF7zAF5n
	 S1BdjX1VV+qL9DjmuszZhMGzm15QQ1yCjyBGuOlZic/mO55s4t4vr6WWzxarvkZi/S
	 Q3sbIFU5KJcS8p9dmcrcQYbZOpJ+zcQDuCRMnHNCUDVxoh+QOH0FDS8PCDvJeCc1aY
	 PaSHvGECzgaiwQPZxLGLXIcao+GUVeJ/kukFdDsRvLeBIZjSEIbKinHg/asUfrm2Ay
	 xGDWGbgoZLxuXg2GzFk9fjVL5hEMhey3jP+rTSERyD9Wvb3A814XMveDX7pfi4EG04
	 8nvZj7Uv9y8vQ==
Message-ID: <d2ffcf73-d495-4e65-96a0-4af2eb77ff2a@kernel.org>
Date: Wed, 11 Nov 2026 17:16:03 +0100
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
Subject: Re: [PATCH 1/3] x86/mce: Add CPU_SUP_* dependencies for Intel/Zhaoxin
 MCE features
To: Dave Hansen <dave.hansen@intel.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org
References: <20261031-processor_select_is_not_an_expert_feature-v1-0-6227bdbbe5a9@kernel.org>
 <20261031-processor_select_is_not_an_expert_feature-v1-1-6227bdbbe5a9@kernel.org>
 <a7555a3a-10f1-4066-93fc-a5c60f8deea8@intel.com>
From: Vincent Mailhol <mailhol@kernel.org>
Content-Language: en-US
Autocrypt: addr=mailhol@kernel.org; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 JFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbEBrZXJuZWwub3JnPsKZBBMWCgBBAhsDBQsJCAcC
 AiICBhUKCQgLAgQWAgMBAh4HAheAFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmrTM8wFCR1O
 HxcACgkQq1/riG27mcJ2KAEAhG19xBSkjiA9dtatvq2WJnGaes4SUmY+LSn7dh1Lf7YBAIwB
 lsMMmigMTk3Qgwymg1nT+Z8z1Owc/TGtRlo4ZcwMzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrb
 YZzu0JG5w8gxE6EtQe6LmxKMqP6EyR33sA+BR9pLAwEIB8J+BBgWCgAmAhsMFiEE7Y9wBXTm
 fyDldOjiq1/riG27mcIFAmrTNKcFCRUFdT0ACgkQq1/riG27mcLEVwD/VmnQtTf6yhowaIFj
 AjUtwiyQz9ja4NRu9GOvz/pb2L8A/3QcADR0dcxADGsmOiBpN2M9KI7nqdNIq3VPM/3/5fcB
In-Reply-To: <a7555a3a-10f1-4066-93fc-a5c60f8deea8@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/11/2026 à 16:46, Dave Hansen wrote:
> On 10/31/26 00:51, Vincent Mailhol wrote:
>>  config X86_MCE_INTEL
>>  	def_bool y
>>  	prompt "Intel MCE features"
>> -	depends on X86_MCE && X86_LOCAL_APIC
>> +	depends on X86_MCE && X86_LOCAL_APIC && (CPU_SUP_INTEL || CPU_SUP_ZHAOXIN)
> 
> Is this to help end users? If so, it seems like it might also be nice to
> improve the only human-visible part of this: the prompt text.

Ack, I will change the prompt text to "Intel and Zhaoxin MCE features".

By the way, would it also make sense to make the prompt conditional?

	prompt "Intel and Zhaoxin MCE features" if PROCESSOR_SELECT

One of my initial motivations was to reduce the number of questions
asked when building a custom kernel. For a kernel with broad x86 vendor
support, keeping these MCE features enabled by default seems reasonable
to me.


Yours sincerely,
Vincent Mailhol

