Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792607514;
	b=D7VtuOE4Z8p15bC5Rqwi17wxJzAGNLHfOVg898rvO0Nk7xkVnDdvYlXFBipDIE66x78p
	 6ToYa2/39fBpuTTYH+Si2/lDbNLDGFwItKSkoMR50OVuxSZc5lPclS12g/WSjvayLk4H0
	 dkFEMlSeYCpm4RrYtc6F9mqNazKw1n93PTIDEAEBA7I5lBW6yRHkkKAFXgAp9rroiHT+Y
	 RYUrY3N1k9yKtVZQBMWc6usQ9bvWRo6wfLQqD7bbALkpUqpUFnNkVTME8ESVdK6HynvKP
	 gCpATj/zQbkwmNYiwWNYmU33+o74cOxnXU5r1Vc5vSvJBvqb4j1DoXPFBb7s2td1dMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792607514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=H/C92bFGslXNt0AknMrgNcyMQFOZNr/Li4FPW9jxEpg=;
	b=atV08bb2meEx7wTbGJIPe0WzrYgf+5Ud6KLt7IhDmcHZMkXxx/47AT08qHZyJYQeTYUu
	 x0MdmM9nR9C3qJ5BD8xHTi/CoMsKNl4geOogmqoq2Wd1K9gvkOOLcqgtca7i4PJIwAMNo
	 cCksTnc5xBxd3WozUyQIrl8hj0qWyCSEOi5W4o5PVhOj61QGCdWd0z016dm13/sEgtCg9
	 2W/BVkOYJ8Yc7vIsp/UWEQCNDPSjvkLd5qep1gsebudyLsPAPfiFi254pOBL32raJZMbB
	 VZ8+B1Dx7vQUwvBM/gLLMhvvWpFdqnKDpGwBvAAnSvGz1CEJkJ9Ceew1d4tKDti3x6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b="c5ODpY/W";
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7B2606A322
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E7B2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=c5ODpY/W
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6dd4f3f696aso537651eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792607512; x=1793212312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H/C92bFGslXNt0AknMrgNcyMQFOZNr/Li4FPW9jxEpg=;
        b=c5ODpY/W9uYSYWXI70jnDoAGs8eBtqNpE9xks9pXRR35vGNK+JHifcBRjAqEOXS10g
         iUTXz1EI/BMbkpZp02fd9CbJkCBD7ujzE47viANOF90uKW8LhCrRej+EqY+LlZheqril
         LSRlWKkK3RzaXhrzP+FQk8Ms9BuLw+Ysr4Ofg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792607512; x=1793212312;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/C92bFGslXNt0AknMrgNcyMQFOZNr/Li4FPW9jxEpg=;
        b=QarzdAQAG6mZCIuntYnH4eHvVAxVT93wpZuEcU/AmX5BFII4tr6g2WloOhm/LgwBRv
         JmslyhMAcge4Uyq5QXI3ZyiaQRloPyL/OyzXUHDlZbBD51czPE/bW8e/QdmCbMOHBINe
         7TxpNAPhC2D1De8Iw5V8nareIow3l8tgs13+uNEALgOrKYcP9N4HxfOytSCN05+xeJig
         IT8QZD63F17UeOuNQQ0by5PpEVCSncGH7FfRB325yyGgyZ1gFt50+A+m6FYLMMy4T+zT
         0asj2S872M3U7cPnxMLMDcPVoYXFfUNl898Btyfxpj8DklH1wLlVQ1gk1j9J/G5OVLD1
         NgBA==
X-Gm-Message-State: AFq9FYIUQK2+Lwlr2/B1QQWoKv9KVEgx1RCwz4QbzRch/k4dd7hXDVyi
	P16UM2X3GzphiLftGImPyb+OMUmD81Y6O+SsHnL/lTqqaL5zUZSn1qmqgrkq5AqsZus=
X-Gm-Gg: AYBFou21E3xHrLV1f14bU0vXHS2A96C/UwK1PXqS1nVea9bnt5PUmZvWZV1MTF7aFTd
	B8QvLl6wgjpq2DEkyphd7lnSHff2Dd3zmKOPNPaw91lUEJEbemQIgHSngwa0gntl85Ch2eR8Vjg
	Pa7Cv8BfiTd9L4KZQg2DGPfVzMw4UD5kbNthcJwznFqAXAASzQZ7qHFw7z/L8TcVPbmyAGvCK5S
	e7JsXZGu+nXsZz56uKc3DGp3VNzYfo4ueikPXwl8PIrXYor/VOChQi2o3L2PYH65b8paMvtwelF
	XJQtDKZ79a81GM5qOanDbyHH6r0NM8TKtHVkA50y9/kPDj/lAPLRn90tkxvHbNVCK+18OCYSCde
	YAzgVyl1I0MuYZgNlIdIlxAWX6SW3s4zzZ+uNF1wNF4nHqB84deJCVW9meoXJq7sxDjpI48kP5l
	qcqlqtvOSBQvyUgqr1MJ9RXenmk/nYxLL5qmirH7+6OJpf6Rm/78U2NUGApLUdO+BZVDTw4FsuW
	NyR7SZsGtfPQACzG0Vk6KuPkXgnlTGBeoeq9QHNl6IQhm/wJM3FiLXLR4jEza3+2sc6EqVzjJCa
	UJiCaA+/I+Q=
X-Received: by 2002:a05:6820:2088:b0:6be:139:c032 with SMTP id 006d021491bc7-7093fcba6c4mr1493986eaf.18.1792607511905;
        Wed, 21 Oct 2026 11:31:51 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70a543c313fsm448703eaf.12.2026.10.21.11.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 11:31:51 -0700 (PDT)
Message-ID: <96d29c1f-d797-4f83-a65a-d1763f0cf760@linuxfoundation.org>
Date: Wed, 21 Oct 2026 12:31:46 -0600
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
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261019103532.E7ra8pya@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/26 04:35, Sebastian Andrzej Siewior wrote:
> On 2026-10-15 13:47:37 [-0600], Shuah Khan wrote:
>> For selftests:
>>
>> Acked-by: Shuah Khan <skhan@linuxfoundation.org>
> 
> Thank you.
> 
>> Do you plan to cleanup x32 checks from selftests/x86 Makefiles?
> 
> Could you please give me an example? I've been looking through
> 	tools/testing/selftests/x86
> 
> and didn't find anything Makefile + x32 related. Just
> syscall_numbering.c which has x32 bits.
> 

Take a look at x86 selftest directory. You will find sigreturn.c
and syscall_numbering.c that have references to x32 syscalls.

Makefile has handling for TARGETS_C_32BIT_ONLY.

thanks,
-- Shuah
