Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793221605;
	b=DVs5U5UHVdufne4vh2gKSOZGycMYDp09jbjAx3lLrxvbJ7lF6TmoYxT6rnUVloKj+d23
	 uVgS+Gbqu4Y9xvIBhcLr70FqQpwoR/f6zBlppF5Njeh2uVz5i0EWJ27Erm4WKHLPW9tuT
	 4oNUR89kQfTYU1niTNwpf6tNi9epmwwLm3tp7f9EApfvY8m0lwkLfYHa6LoJ8lxtq+XJu
	 PaSPA0g1+WoHdySoon70TS4Xrq3FhFT+7dup4XnNN/35WpwPCNOQWbpgR1zRAMYnzjHLy
	 MaOqNL4F7IysOwOWbBVpbiezno7hTFU9eKG09JxdoPzc32sUghgxWB2suZTNPopigWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793221605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dYdUZQkYdLc0vauWbIqi3zABPNcb2nwtA8yBjqhaLho=;
	b=a7kI8L6/CDUDcZddZW/GwFHvx14ZVuCIgX8ByYfcLZI30y71PsvzfLt4Kmn9MttebSfw
	 XxSNcQaDpDmMwCEHIlXIvcsKceBQSrQgiFx2YUWve4MnT02QrE3YrdP0RVkSKHdtV59Rq
	 ZOSLM2LCQa/hS7soGkMmfRBZp8cRJYvvBiSM7AkEYkuTq4uEGjD1xIPpXRnWBPCJxGXeR
	 OedofuMUlzUmJ2GtSHpqJvMiXiD3mNJei2c7Nc82sw/KElX9QN6yxIQpkFAm8fyp4rBA6
	 EJERZSrob7NaygnsVMvCNyxYzoQn+quKkGoLozvxVidhFgfasKZgwm13MsH9IvNIbmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=RZKnL3TU;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915D6606A322
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 915D6606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=RZKnL3TU
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-486f013db83so548538fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793221602; x=1793826402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dYdUZQkYdLc0vauWbIqi3zABPNcb2nwtA8yBjqhaLho=;
        b=RZKnL3TU91MknhH0PBI6QZVMUcwt1SUpPSrfgEKjkIikcI2UgLeVieNt6W/vKdD+ni
         ZlzEvAK8j+4uYNKqrUDlDHihQtPPOUoBEy0s0xfMsaOvZ8lBWNpEMl2uWLzPY6g38BiG
         HkEslqoetMhPitOO7lA3e/fOsmOLctT24KIE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793221602; x=1793826402;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dYdUZQkYdLc0vauWbIqi3zABPNcb2nwtA8yBjqhaLho=;
        b=bSNTSyRAlxhTsZ5wZRCq0g22l5hRZIYFzZTlzx+ahoFO2r4nG8Q/jdYSjPpOBlHqJV
         ioKzrzUu05aeL/T3i/t6869qll5XXtMptHX+wIDEMO7H+mP19FOj3mn5DmlvHhaJIJT2
         SJGVUTzNh2YyvQu8nCJYi5EIcKPTZjN7HO+j3oSKnur4k2DOzS/OihuanFv2AupM3ua2
         ftpE8HWOBVAg0W4jH5mO+X8jC4RWnyl/osvAmYMg7CZQWN/P2wYNjQLz9ye4Ew1Av3mb
         9d7DE88Nhz4rR2uJDnHLiKT2nT5FRsTxuZyBEgbAxK6qCBLrSY+qCF9MZ7Lo0uCt5K6J
         OC0w==
X-Forwarded-Encrypted: i=1; AKwUvBxNQdJh1WuBkOTrht8BYiPdbZI8mo5GoKxNmK5EGoLiV3V2FDWt1JIR285ZgjJuM4YRVnouEDe9UlfPgfI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpc4ANmsez2F1p6ImZ7Ypg0NyR1gOsyxmfPiYI7SBoCX/rrRZ/
	RSbnvMeGet3dll8g3UFDrBBk5vp7sI8M1OytfQ8AacoGwDJp1XY7i4u6UTqEOfZH1qk=
X-Gm-Gg: AYBFou2+g0ZmE8Gx77UwX8mk1fM4H38dt2lu4T8Boi2KCX/w85D0hxqwVGop8dPJrko
	LI6jCtd2QV8YvgHQc2NdJjtQCL2/y74B80NBk9DxoZxqJaAQgnWUBnOoi94XpJUX17vXpNlYzOz
	R5gCr5UE6/Cq5nQ3TjPe7uGS7zdkOhxj1fHpESFzvgEjCp67n9KWD2kr6rbU0Fjr1qyrrsLJ1T8
	bDNhgSMwa5DCAvFR2lXwtPIH7KbngPWi3j02IHeVUcYBciLoj1OFt5eZFTpNUvF9C32w9eSgKAP
	FY6Tzi4mnQaqeXLddydrowULlI1cTS0h0nZVpZ4f/SfONIEl/BywZjc8ukB07WKq5mZYy/ApzMJ
	lIq2VocSVseAukzlg7TKrxQD83pjpjjbEkOxoFgsbQdNksIG7UO68VOk0CGe72KGA1c/D0nt/pt
	ZkRfbRiGnu6LqLxshkYDV2Ltbi2Tl0in73HgrIKgPCS14Vvyd5v+PEA36ESteBalqYh7gnBDP0p
	AWKIScWcmE9tgffuAnrDKxMlnCxKuIDJ5o6gdvwooBV2+POjGhRfqs9piupzZvICF0b6z1X7DvG
	1DIQ9o56hvUEYl9+SWZqiacrBJ1lihhT7RtGtBU=
X-Received: by 2002:a05:6870:d184:b0:49e:4ed0:11d4 with SMTP id 586e51a60fabf-4a8bb701e65mr2458445fac.50.1793221602376;
        Wed, 28 Oct 2026 14:06:42 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b77ac4e4sm3068523fac.3.2026.10.28.14.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:06:29 -0700 (PDT)
Message-ID: <9c65a285-9144-494b-b4d8-e3d0deb671c7@linuxfoundation.org>
Date: Wed, 28 Oct 2026 15:06:26 -0600
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
Subject: Re: [PATCH v2] selftests/ftrace: Add missing spaces after ! in probe
 syntax tests
To: Jaewon Jung <jaewon8868@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Shuah Khan <shuah@kernel.org>
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261025075044.1750113-1-jaewon8868@gmail.com>
 <20261028011923.2050009-1-jaewon8868@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261028011923.2050009-1-jaewon8868@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/26 19:18, Jaewon Jung wrote:
> Add the missing space between ! and grep. Otherwise, the shell tries
> to run !grep and reports "!grep: not found". This always skips the
> conditional checks without checking for kernel return probe argument
> support.
> 
> Fixes: 25f00e40ce79 ("tracing/probes: Support $argN in return probe (kprobe and fprobe)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jaewon Jung <jaewon8868@gmail.com>
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> ---
> Changes in v2:
> - Add Fixes, Cc stable and Acked-by tags as suggested by Masami.
> 

Thank you. I will take this for 7.4-rc2.

thanks,
-- Shuah
