Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684551;
	b=uDisTjwJzEPseRvD8/9gNQOAv35Lx55PbdlkNQUUVLs4Otfk5Lz32vIdt/sEgv8iXcqM
	 dOIZyIFhqtg01SLQos1KEKsXy4Lv2N7l49Msbzl8hK1J95YYIbEpXb000v6mGiR9FL4bo
	 82TKvYjokM4FFrbT4w4wpTfXeB1gjG8VaMuGaN/HmvSMRHtjFyVVbwbhdpnmNnM4iFm+G
	 rb7MEzOK2fhDVyi5bCyFvENn5K3NN9xcPMScMZg+JzANZ+Y86NfdlyBiC1ffD4UnMjTwh
	 d6FI6FFvrwtc6fscqwDNfakrMMHljA/RwDz7txlAgzQLnI4xOJcrw1Web9H9gTGmalA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ciug3N5x7fEBixrt4fajqgnJmaStQZXNWPKtQxH/3yg=;
	b=XZVzuaMm+wKXWnvMw9Y6ZJLb1KV6Eu6zDY/a4H9PdKsj766MRkHT05bmYymHWnRBLHUw
	 gltLOhpRP0suMar/z2bfXMMrzSRameh0Xjsz2ibNZOis0vi05iWBwb16Y55pDR6WOOCvq
	 nKHKj6nYT5MpGHAmTwArFF8BKZtcnCLKUqEXoJDSSMIzxpErQ+ZadoyIRNrJXUITUT/CK
	 OjkBUEFy7TVFuwW4GYoC+m3uNZ2hFjp5CquWFWN1cP5b18Qfx11HeEBMXFav5GA7vynAQ
	 6lajlQ8S5rY1SWhKFVHgUhwx9Y29F/Qsz6NTy3ysiRnYbSef9b3uMIxmP89MsYBkVTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=HFWH0hx5;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E034660A2610
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E034660A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=HFWH0hx5
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-843a4ca671eso1089011a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792684549; x=1793289349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ciug3N5x7fEBixrt4fajqgnJmaStQZXNWPKtQxH/3yg=;
        b=HFWH0hx5y+wdTJQlnogKEctFr4zCv4HmD5icgMk+CmZFvs5XHMCcYOkL5/c6C9cu/4
         tAsiT11qmocMmcN7N86vmb8mYy8SMkbj3g3RQ7G8o4n89/tn2yY9nj6gPf7Bt1usSz+J
         MEdyceMEcnvHeLMDEvCuVYGSABR64YW6+PuEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684549; x=1793289349;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ciug3N5x7fEBixrt4fajqgnJmaStQZXNWPKtQxH/3yg=;
        b=H+wqVFcW6LBkIr2TwFdBFtztpMrhVjjJtXUzEpKQKnfslaaR4gwPfumnA4Tdm+f8CP
         kqsx4ITWaRnYVQLehilPHv6/qQXWxeYimCuII+j1hqdtwJUQzLZAZz9lPc/fNY7tzpjy
         cnRSIhAZkW0gs6C6iA0n8S+gEZ0jCjQpxNnMvLQlBQNI0B4/9/E8LS9aEACXYeiAaRso
         XzqVfaht1RTn7WJSLCGCbskVRJemGFOIrQkiVgBF3V5EaHE/LP3hVChXgbx0W0t6/ruu
         WXZ5iyOmZTX9961H75XUEW7pN2McZWA/AT1rkBnnVziW7w/u39KHVrJo85QG7JCfMlNX
         F9Xw==
X-Gm-Message-State: AFq9FYJrCX+2RRu+J/iCuYVYFPrbqeWK19j06zYgJ5ZhDSxGREvw5QYC
	G3ZlyaVnNg83pESPfIuxdLLimvI7ASXCgjH8ldeUUtWtOANikKcdeKZcr9zQT1ahqyo=
X-Gm-Gg: AYBFou3yIUV/b5JArCKGqYwwz2BlpkVrUwtJ+VUY6qGyzN8XVEh9MC7/8OgBCCNw8t5
	w0gdbAl4e5TP90UjXa5fT9BfJoCvYZ4ePP1+0UKBnZgdPTz0w17Zk+gx95VpFBEsd77/6sbZEfH
	wrbXHdf1bstXkiGVxj08Sa4TDVm7JvnxBcECU9BCDGEpasJ28trNhQDAu4GpUkyNSYsR69l24ai
	rCJQShT8bj4RVTb0uixXCuEBCG5sFzEjPKOopJZCMhXeMqBkHtt980XGvxFgAgoOrmsBc1zrdDY
	Wr1fjkyfl82ISTAI/JI/jzTQGbD3Mbv2/1HsdlM/qGlhTXc73Jiub3KYh4T/fa+MDFTQYwRHXsI
	AfBRFiZ6S7ckHpG/UbrbLdVPrVUwFzF652ao6i6zA4wZeY0jAIE7DgLC8nF95TKc8Vmd+g0H3xQ
	8ZZ2P3UFP7p4kX9YqqC1VwqRxiI9qXFO5K/FxnUTLP7/wIFzOgzm/uVxqgFd50z7EjDcSlqV4s6
	LjYfy/x32fOCxMjr20CQa5Stiy/0STysxVyOgU2tZDbCjQpALw7fplbaupWbfWD
X-Received: by 2002:a05:6808:250d:b0:4b9:a88b:888b with SMTP id 5614622812f47-5535ae2721fmr3901944b6e.33.1792684548890;
        Thu, 22 Oct 2026 08:55:48 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b400ba34sm4819851b6e.4.2026.10.22.08.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 08:55:46 -0700 (PDT)
Message-ID: <271a7031-aa67-467a-be40-9b08efe3fae6@linuxfoundation.org>
Date: Thu, 22 Oct 2026 09:55:43 -0600
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
Subject: Re: [PATCH v5 0/2] Start removing X86_X32_ABI
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, Justin Stitt <justinstitt@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Neal Gompa <neal@gompa.dev>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Sam James <sam@gentoo.org>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Tomas Glozar <tglozar@kernel.org>,
 Willy Tarreau <w@1wt.eu>, x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261015-x32_removal-v5-0-2bfef9151fad@linutronix.de>
 <2fcf2983-0972-427b-ad05-b403e325ce40@linuxfoundation.org>
 <20261019103532.E7ra8pya@linutronix.de>
 <96d29c1f-d797-4f83-a65a-d1763f0cf760@linuxfoundation.org>
 <20261022150624.THzKWu9_@linutronix.de>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261022150624.THzKWu9_@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 09:06, Sebastian Andrzej Siewior wrote:
> On 2026-10-21 12:31:46 [-0600], Shuah Khan wrote:
>> On 10/19/26 04:35, Sebastian Andrzej Siewior wrote:
>>> On 2026-10-15 13:47:37 [-0600], Shuah Khan wrote:
>>>> For selftests:
>>>>
>>>> Acked-by: Shuah Khan <skhan@linuxfoundation.org>
>>>
>>> Thank you.
>>>
>>>> Do you plan to cleanup x32 checks from selftests/x86 Makefiles?
>>>
>>> Could you please give me an example? I've been looking through
>>> 	tools/testing/selftests/x86
>>>
>>> and didn't find anything Makefile + x32 related. Just
>>> syscall_numbering.c which has x32 bits.
>>>
>>
>> Take a look at x86 selftest directory. You will find sigreturn.c
>> and syscall_numbering.c that have references to x32 syscalls.
>>
>> Makefile has handling for TARGETS_C_32BIT_ONLY.
> 
> Okay. If x32 marked as broken it does not hurt to the selftests as-is,
> right?
> I think sigreturn.c can stay as-is except for the comment referring to
> x32.

Right the comment needs cleaning up.

> syscall_numbering.c has plenty of x32 bits and I would go and remove
> them once start removing the x32 bits. The reason for 1/2 in this series
> is that the nolibc selftests expect x32 to be working on x86-64.

Perfect.

> 
> But this isn't the case here afaik. Now that I test it run into
>     https://lore.kernel.org/all/20261022142425.3Wx-RrU5@linutronix.de/
> 
> so the test is currently broken.

Probably. I haven't investigated.

> 
> Did I understand you properly?

Yes. My objective is to get these items on your list to take a
look and address whichever you see fit and we accomplished it. :)

thanks,
-- Shuah
