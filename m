Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497009;
	b=P44gKHznW3wwILQNvilPB9Tq59B3RUVKdgKU7Fe2AMqxeZY5xuFR0Xe5IpU9fl5cmTwh
	 aUb9vmCfK0R63sQxwP+Hve0KuGGp//fHkGQkk/JU/tHkbL31D16OazproKt32lYP6Yg0E
	 BFkYE86oQN5TaDlpYu6mPl3eIQDuxAhnL3T78jlDK5iKGCcXhi0OwKjuiq3cCIU04WwWi
	 xMB4UkPd1UlO2xuNgYkih6r02g7rYUky+lcCNfj3krIKdJ6fQQODPifaAQMm2PViYVzSx
	 1OLrN5xiOuLOPjB6uXt3Bnsj7eFKN7uSENCDQ0bizMhA0tsR960oKWu8lWteN3Hi4yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ykN2lBUtf6ymGAIeUL7rd3VrIbiFNDowZV9GMRTZITM=;
	b=Pl91D3I8aRsYgLRV2YRaG70P8in5xg00joa5masp7fiNQDRux2Zu7n2e13hHnu28Az0N
	 bKcITyD3Y2hj0JCBte1kwORtR8q3anKPTGq8vYXRpK/iwcwuIoRw8asL2Arg6cwMDNHDq
	 WeAfHe09MY4VCSKi4fBaC3u/K5q3AgMvCl+O/UR3WFYlyZvnxbvLy4iSH9zgTv9cOa7l2
	 1e3GA+1etwEfegFYKWHiSi45pBNGNRRpdvluFgDSx+GmA8Dx0f+fWQdSko1ggPBgm8y2X
	 RRFyVJ1aMhNnYqJZ9S9kI754HpKeLaB9af01bG890lCddVxVJbb6SJhyBbdE1BNE/rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0c1E4JNv;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14D060A382B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E14D060A382B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0c1E4JNv
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so9576985e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794497007; x=1795101807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykN2lBUtf6ymGAIeUL7rd3VrIbiFNDowZV9GMRTZITM=;
        b=0c1E4JNvnSW3Y7NixbmubZsac7eLcUXLkIMtzoMbkxG6k9cazBcj1ZfkDOhyBbyGw6
         HZChn+jfz6zkokE1FJWDlAFsMI1Fbv/Y9nLWcLIllA6rLHNwCiJt7bQOq4gcjs8c6e9v
         R80W6y1jhaX2dWqv8VKRXbNl55VmD9aLcBCAdMuo0ViOY2PKQyYWViFKP/Qv/ORj8/2R
         T4/Wq87fMJ9pHcgdxbm8asTXhjUdi0JUqU5KXL4qO2TgB7uCHSeo8FIquRbhITTrp3xC
         VJdp5yyLjutOV2T2w0eBlFRfUWsSsQBxm1/piuAFw5whudGyn4d++zCw0lmX6o1vRi2p
         6uZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497007; x=1795101807;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykN2lBUtf6ymGAIeUL7rd3VrIbiFNDowZV9GMRTZITM=;
        b=E8uxRuhyUuIwP/nJ8GzWxAry0c+jIzsp+xA6qIJdjHbmz5LWGDQ698ZP/nu9WGVupc
         rA8xnBhQCZYcquLVFHtJBlNXgqoTXjBa6Fr8NXX05jb5tYPxevrJIc2ZaaFA7WEnerJm
         wb6qNu1yEpCCXBYLudlv53GZMgocagxW642ZF+WRbexeV024Sm0fHWc4ItyHQC3QRStL
         3niPSuXyWBd2OobLySnAZJho+vh5r4K6z6YnLUO4bWUuh2CCtXOSkw6eWL2IYjhbl16U
         dmgaa4GXZuVONALeUaoULpxEUZQ9AewLI+AIN3F3usBESNeOh8HpfY3Tw3fE22aHYgfV
         66VA==
X-Forwarded-Encrypted: i=1; AL+hErFgZJGe66KXWFARavt+xf8hnWw4T17lzAWcbKa36XrTm7P7HHb1o29uJN5o79OsWFYe/FUaLMtWQnkjoH4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ClkfQVkdneyQBY3dFnQ3TUfcS43g9BQCT6qjb7iODzw30jSth
	gM+6R8NQiKSqIGa9fXfGsha2tnPY/nMHBpOZpITcO4sR2NsPWiiIbCrO
X-Gm-Gg: AYBFou2ljHkMcggR7d+y7MpB64RWaJVoT5x7HIvFEhazpMGTbSWflaki5JZZUo3AILO
	sLbJSi1SeZ2CUqzu+Yh8O+KtVx5Gf735g7Uz8aufu5TuePDFt5unG4n6y18tbqL5yuiWL+AmsDC
	YW8O6bzto6pWQtciOObY0eUTzywbOmSS5ldU0MetIHo2cyfDKTQr7fe32MYtZu3r2Hk5o9KoYDz
	YlG71AAIIWcGNMOHm+Bu1/ZPn1ABA7znxk42uW1XSQ/5e3d7AOox62aMBC3yppYeh+GtLjd0x1m
	otgHLrvQ4a21hyqxoOuz4JMsXDGM1LNyETEJ8KJhMrhJM+FQeTTNoLMwbxJv0KDiNBjZnIDfZ+S
	mgmRwJ/RhspD1fRSWBCNZqsNUkQgDpSI7NFMNBoQuRs2DyUtzvuIQb197rMLqZawM4zEbwsatHt
	U8y5CirldALIPCKJS3p3MbQaUwyF99z7OkWDtJpxh3v5uddyIhl+d9wKtS3pdzHFKbmfGFoHTFA
	SVHbefDA5cEqccbUomKDTD8JOqMpedB+uLBdYcErnt5jyRGpV/CHo/Rar7ZcDmlJvVzesXHTR39
	lvExhCcmfoAq8js0vfad07bad+M=
X-Received: by 2002:a05:600c:860b:b0:4b0:b9ff:1e7c with SMTP id 5b1f17b1804b1-4bb4e296a9fmr58453255e9.15.1794497007254;
        Thu, 12 Nov 2026 07:23:27 -0800 (PST)
Received: from [10.2.0.2] ([212.104.214.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e251686sm75915855e9.3.2026.11.12.07.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 07:23:26 -0800 (PST)
Message-ID: <0734cdde-3c63-4a53-b405-5cf741f3a5e2@gmail.com>
Date: Thu, 12 Nov 2026 15:23:25 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v2] hwmon: (dell-smm) Add Dell Pro Precision 7 16 PW716260
 to fan control whitelist
To: Guenter Roeck <linux@roeck-us.net>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261111150435.75965-1-shady.abh@gmail.com>
 <20261111172733.84217-1-shady.abh@gmail.com>
 <96902e72-6a75-42b4-9d30-ea54e82ee933@roeck-us.net>
Content-Language: en-GB
From: Shady Abu-Hussein <shady.abh@gmail.com>
In-Reply-To: <96902e72-6a75-42b4-9d30-ea54e82ee933@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

v2 only changes the Signed-off-by/Author to use my real name instead of 
a handle, per the automated DCO review on v1 — no code or commit message 
changes otherwise.


On 12/11/2026 15:18, Guenter Roeck wrote:
> There is no change log. What changed in v2 ? Do you really expect me to
> track that down myself ?
>
> Guenter 

