Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510953;
	b=hjbJQ7MS+z5QUvYdtdzsY8/YbIIXGYhgdD4fRYbusSAiK0kCFjGqNxG9Li+dBn0D9Omy
	 rCapEy9ny4gb75SfLLwAV+K8twDdcn7s2PWc/kaGC9iMnsXoTFJmb/RugLCkLZvPnyNZc
	 DTNUOZtoAdehuHkf5e45FHZ8mvas7pWYmQGG74k+jYe0EOIGhaWfwdqEDDo0FSaCCCTtA
	 zpbj6HSh0oV6QGVOGVQNBuoquI6WaCT+ctsiBLhluYErpnipDfQ17pJka8WT8KR+dPDbK
	 r3pK+N4t9ZOUueUjrWpCgoHIkxh1pqifuRqcpti/y0n5JVrIy6l/woAbkKaynToD/OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ha92501mYo4eZ+6VzZrrZAGeSZLwhK583D+B3xN2u3Q=;
	b=OkpenEs0ny4+8JXf8tUpjjjRiMy6dKiPqW/NfnOPP0nRVVcWziti47eg/bStaK115Ce1
	 MBbv/Jxef6w94miFAJlNbB/MWslxFWono/HOx47ab867qkM/iU7hMqp2jAA2Bj9zEy5uX
	 a+gQWJ7vZwFmi0VPsuwkZQX9SD/qzqoVGtbkRueZFwGDQkHv5U7MWw0ToevRmwfwA8817
	 NndvfdrL2tdW8jFUMdZb8/0cGaHueLWfa+i03U+pirpVi7FZom1M6kNQ52/9sd3ApFkT+
	 +f+5wui7tqrV0es74nyxzNcdQbfISnhO3b6PvZVQWp7F+3qXg+Qg2+AfFdBvgRJlAnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OvDR6hCD;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB827606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB827606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OvDR6hCD
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1438d9363fbso248750c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792510952; x=1793115752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ha92501mYo4eZ+6VzZrrZAGeSZLwhK583D+B3xN2u3Q=;
        b=OvDR6hCD7KSUIrLTxwD+wM8ADil6OW4AxS5vuW6sWk0BvkMY3CMbwghhU43+BmgJhT
         DvimmAe5HljJSUwdraf6gsxC0dk24d3w6zGKH2G9zyPKlhF3K/QZ8XIHZdGU1hMIYYbG
         XnjDO3hNqVUht8VdY2o0iWPfe/9C7a76hs+Yqq1Qo0ZhHszVSa2FrbpIko0JctqaygrT
         MTeao5fBm0Z2sOKOBK/R275yKwdGt9f0LD9knr5o6nalLkEw5z+WhcihWBcq9vqclucA
         Rmg2aX0vPfydwDjnF6AVhExJc65Ocqy63jBVYV9aeY30z2W6Pze2QTtGLciAgNXdQJVN
         FQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510952; x=1793115752;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ha92501mYo4eZ+6VzZrrZAGeSZLwhK583D+B3xN2u3Q=;
        b=t5AkKEBMjGADD9A8SrG2fUeGnNDUurkDaDJUmmI0TpL25We6DU3sOYk3uHwn5bzODp
         m3S3Hfp+pO8nVbbDW+HGB3CL33f8QLUxfJ4p0j3v9ysLe7IVdakqNMoxQyUEaEWBGzVT
         EQ4PgTk5z+WZ371k9QJpXJ1D+aWRBfl3Di085IvwYnsdWrb/Vnu+X5QyBrUTQse4nWmQ
         vbNBLSE7qEgpGekzahQ4QLarWrhKEYduHdxifVlNuwyxk+hTosMb0J1FRHfMZCy80VCi
         bEDHd6wslv92Mv78aB4pLyRLvjsqhONZKWJ0yTfz0Aq+gtOSeyX8ocAkaP/RYgXwr6YC
         HzPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPKqLYKk//ySGKIsadEsqVwVuc8YnkoYgcXLVIu3JFQT2FILCBxa6S6WlaI88ol/GGcir7+dyWhzLqDL8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQLZqMN69CqaqkYV4Mc6IexTfmZdTCDqBxkX1OKRIqebdqHPUE
	PCwlc3vSt4Z8JDGYm8epNN/iqjYpc5Z/Po/2w6mIksypd0rBClTwiaXp
X-Gm-Gg: AYBFou14HwngsM/UYBnnCQ9PxTohdA0aL+noBzi/K6PgBZboAPcjOe9UQws8zzCthdY
	EAhjZoMfUyJbLbwzWoMwK2uP3PkQXLPnM6AiYhp2gMNBhTQJesq5xfHX8Ehg3ASm+HSi5KC758/
	9HGBLu5K6STEmwwb/evgydBX4W01AJkJhE9Vc8gRk0x0NcMEy0Ykn0PKTKkenzSgcgIjRt2cgH6
	hWQklu3YDdJPLmKZz3/X5VO0RtK1Wr0vsQjCXpCOd7JNV5Fu0yrQCZupMFpP7agFOck0M7jI4Gs
	zLx9iqP9KndjbD1CCyJ/fVNbZeIAvUarjbLdhyibdX+ceGVR98XQxP5MUzaiHHNT3/GojweuXjj
	XMzqnzvezMm5SF5urm68oCJIF9RA2QARcvEvJwrHfdzHVrl0J9vlRnvpj14WH+MHZTOVOKfxaEc
	EhEtQy9OXSwBXeVYsECzaKCLPQLd2M+G53i5EoZIH62lftG4pKt57eF0HApx2+LYExiJWcJbEj5
	R6ALJDTJhSynA2bCPcetQQBU7MdsZoQDHnbsC2kGVEUkzuuNiLMR3lIvvEJS2ctvlCg9clY5BvQ
	SnmwDgSIlxG58+u/bLJYCHFHVDezkQ==
X-Received: by 2002:a05:7022:419e:b0:185:e68c:904c with SMTP id a92af1059eb24-18dbe2af64bmr5061788c88.7.1792510951564;
        Tue, 20 Oct 2026 08:42:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fdfesm38145624c88.7.2026.10.20.08.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:42:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e92d62d4-cd2f-40a0-a973-2f2a0e392bd1@roeck-us.net>
Date: Tue, 20 Oct 2026 08:42:29 -0700
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
Subject: Re: [PATCH v5 5/5] watchdog: w83627hf_wdt: Add minute mode counting
To: Tzung-Bi Shih <tzungbi@kernel.org>, Paul Louvel <paul.louvel@bootlin.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261020-w83627hf_wdt-improvements-v5-0-90b226684fc7@bootlin.com>
 <20261020-w83627hf_wdt-improvements-v5-5-90b226684fc7@bootlin.com>
 <atd1wP1cELjiwjXT@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <atd1wP1cELjiwjXT@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 07:08, Tzung-Bi Shih wrote:
> On Tue, Oct 20, 2026 at 10:11:58AM +0200, Paul Louvel wrote:
>> All of the chips supported by the driver can be set to minute mode,
>> allowing timeout value up to 255 minutes.
>> Add it to the driver.
> 
> I didn't review the patch carefully as I was thinking about a fundamental
> question: isn't 255 seconds already more than enough for a hardware
> watchdog?  Why does it need to support minute mode for timeouts larger than
> that?
> 

One would think so, but oddly enough there are people and even large
companies (like the one you and me work for) using such large timeouts.

Guenter

>> @@ -49,7 +50,8 @@ enum chips { w83627hf, w83627s, w83697hf, w83697ug, w83637hf, w83627thf,
>>   static int timeout;			/* in seconds */
>>   module_param(timeout, int, 0);
>>   MODULE_PARM_DESC(timeout,
>> -		"Watchdog timeout in seconds. 1 <= timeout <= 255, default="
>> +		"Watchdog timeout in seconds. 1 <= timeout <= "
>> +				__MODULE_STRING(WATCHDOG_MAX_TIMEOUT) ", default="
>>   				__MODULE_STRING(WATCHDOG_TIMEOUT) ".");
> 
> The patch is obviously not based on the watchdog-next branch (see commit
> b152ca999c5f ("watchdog: Replace __MODULE_STRING() with __stringify()")).

