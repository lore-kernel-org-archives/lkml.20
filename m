Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988499;
	b=HOWErdjmtR69FENMAfEieVwyoUZnJsR3y4QF5B+qF1/dnw/pTasLTxoMYHZef9LQoKsD
	 jr4uFLpqdfsJBAgcQwHsw45BvbPodGpy8SFRsuCcMqWHhQe8HGVmwGZyDap7EVfmqXarm
	 ae9fd8lbzQvKlE9ofHofrmiagSMyO1YzeSCLd6MQO7am3B3kCQdLTUAG401ILB1qTK82E
	 9+TmqMcuxWC7smVXLIN1BBXWeiXxDeMcI2DS1rRNaQNInUuAyHsstvCRzO7N/4UIjhIB3
	 KuWjLVIwlYABUegtSEvmTyWe8E9LQnkOrlr6i3FlaHtr++uYg1wGbGcFBI6bZFhIMEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+D9ErcY1cg1H93A7kgsl3DQ/jvK3dao4218hxA++MOQ=;
	b=LeTenul3KcoJjgqJypCJReYx0IUY2WY2jSAevvRj8rOAoQ3rXgakTxj6G41cEr6Ant6Y
	 ob0f0AFy6VCewUsbupgZkUduqxXadBCIagNCpf+fVtoLPIBjBEpV+FA449vmglh5IZUd5
	 GA2omuSFM06zhMbRFbgfCdxtUUvkn9TYG7ldk+Td/9xhzVJ2Y4FyzXOEsPBvN8oLIBs9Z
	 cVDKwwueAHbY2E8CSt9/4RUZOuqtaUUIl1mrtRVpygIobHg7EmrHMQZXizAHUOI7FDJRm
	 KLPWunZcTHUe80HbMoRBo9ixhZ8vcuHSvtuVeMS3nArVMLUMhu9fgYCMrwufuWKEhSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D9860A263D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95D9860A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6aa9606ddadso582285eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793988492; x=1794593292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+D9ErcY1cg1H93A7kgsl3DQ/jvK3dao4218hxA++MOQ=;
        b=UblIupfwewWm3kbODGTK7uih8CzS+q5+ojxUuK1I60tKEFRzBfCgfcUWTuilVxIV7z
         S9VxA1D83HVQooY3QRaaNcpMD03JMWzjkDtFSoVBM3pYBYCZj0Ft5ENi3M1P3QpjesXO
         q7Olvp5hYauvaoCT3QrTRrFmlpTx+pJeDKtS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988492; x=1794593292;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+D9ErcY1cg1H93A7kgsl3DQ/jvK3dao4218hxA++MOQ=;
        b=TtgB3wVhD/YvSEWD1qOtnG3fvmErHwBTo2QbbcNYwYoazlMaJ/cLrDDQf9rcsqznRN
         4vAuuAQlOuJIr6bOYqUICdiAI29MjEoOvDMykWXxdmbivr9eJElj0XOE8FFHs0pPvB/b
         Cg8esK4izDtM4zq9O8fYSwFWLWBXlyS+fLzaQ4lHiWjVgZbNVufIN8makTMCg2sAtKio
         V8gi0kLUygBZJnw++Un4OVWQXVmgYEaBt6ftj3VUQPfxh3YyaIuj0EpWXlQOb2Ky2wPn
         HFs5EnYk/gf3Xo13Ff67dWbnfokyeUPHPJEjB5EDVnvQpxGx2i/DwuqUXpXV+VgzOJEr
         NrvA==
X-Forwarded-Encrypted: i=1; AKwUvByCL1LfHcXfpymTt/A/awthbs4F/dR0dKT0rSxeeNUAIyt+jZyJtGUC+It6gRquiuaP2RE/K8C7p0rL8dc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wEhkYH9SLZHDr07dAJ2YbiyH/imQznufY8FHEnpORRkj7Wsnk
	83uHB/Tk3mrZlwSmjO1Y3dQrAfid34znVsJLmEJVzShGUj/qiW49R+Cg43/vNNYGTMY=
X-Gm-Gg: AYBFou3ulGchTiFZjaGmG16ZNJhj56GQ5n41gOLd7KwHJfyUxixTehu5octqY7UGg4v
	/9QvNXSap1e1Xg7GKHQ1MJb53Av4V2gtyM0FzzRMGhV0XIXWe47LKvXmfU5C9Fiaax4H9qiWILw
	kiIGbo6PzqnU2TxLSulg/hH0PEx7gKzfQlhcjrotkkM5ttv5k2x92OJTy5BXKxE+p4kb1p8a1R6
	me5NIpXDVJJX1+V1qgleFbyuv2NTcS5sDVDvnFzSfHGH2ess4GGuPY3SP2M9BlZGfznimYWsvgT
	RiQSUKNrhW+TURi1dUYX38x14n39G5ReSpnylHaCho5iLzjgM1pREFioIzaqossB68Sg3zxRddF
	jczYWCWPNddyw5d9oXmZNbGZa+nRiEwgItunWzjmiLoW0fWqix8JxHGrfX2fv3dmhKR3GQNzTwC
	EDYR7KOIsUvQhLPyWpZsrjs1EkMb+clCiD+y1dQ1h6tHRWX4MXeUXjXj9HB8Hmr6DoP+tWPkDKh
	saCPShBtC+0YzD/NM6c3plzm5XfBAeLerwF5Az418mSZYslUr024EcBMytD7cZPYaRBVDPL1Pyi
	QbIO6I7H4PffECJLQkTMy3zZ6ohJekLY4nh7Yks=
X-Received: by 2002:a05:6820:2088:b0:6e0:1599:a4b with SMTP id 006d021491bc7-716e7913562mr2314159eaf.18.1793988492496;
        Fri, 06 Nov 2026 10:08:12 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb29acsm2301463a34.4.2026.11.06.10.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 10:08:11 -0800 (PST)
Message-ID: <b6468c17-46ba-476b-9182-0826df6bb9c4@linuxfoundation.org>
Date: Fri, 6 Nov 2026 11:08:08 -0700
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
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, "Maciej W. Rozycki"
 <macro@orcam.me.uk>, Bill Wendling <morbo@google.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>,
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
 <20261106113147.iCEmPCOW@linutronix.de>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261106113147.iCEmPCOW@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/26 04:31, Sebastian Andrzej Siewior wrote:
> On 2026-10-15 20:47:13 [+0200], To linux-kernel@vger.kernel.org wrote:
>> Patch #2 prepares the removal of the X32 ABI and has the broader
>> reasoning. Patch #1 removes x32 from the selftests because it does not
>> have a depends on and assumes x32 to be always available on x64 and so
>> it breaks.
> 
> Can this be merged, please?
> That (syscall) test fallout mentioned later in the thread is fixed in tip.
> 
> Sebastian

I gave my Ack for selftests - I am assuming these will go through x86 tree.

thanks,
-- Shuah
