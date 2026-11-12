Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523615;
	b=qx8hUCbkPjVWLf1/Ij6WzfzpkEGQ103WIFaNAfRK9EG+OBUF7OA3Qu85ucwGlxiOUt0a
	 3Fyu/f3ZPzRFd8+NnEo/iwTsJRSLDMvOVrWzYSyaHr1IPreIKclcWJWnGo656TqOVSKH1
	 /2uBCQ2kF7hAHB6FU2f0MLkutkXh7OMczkbhvj4uyrjls2oVH37q02UURkcIUdLJRfNzC
	 tPDz/Soc3KufA4yLsc3Fx5VICiSPNJqxck/FKUIp1G82xuUYyT9ilmIn/pMkChKXoBy94
	 P7i3MiP5d+4ykwwcx7W++YCDLXy16cFuXhf277SvxZZLxNKTiwyq3TtWy7RyMG5rQ5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pVSpryHAFlCLz3rbBucSelxzHLz0CacAipJZykSWsqs=;
	b=RUnmc4B2cNNKF43z/AEVbl2KINzF6++bWy1TgoAhDjK38es2opnUhGST79pHc0ke9e3Y
	 ndMIXfSKL4bOaoKioFYjgfG30P+zGggyaENCxr/VzOdinJY900AobYoBct8nUqOZrzEMp
	 /IEZ0owsqjx6Mh1OzweQZ/gEuB7nzHXxNMz5foxdnFQ8cdw163dAcPRHkSZeP6oxoP8vo
	 tBuMaajya/1Bh5TkRTmSxMRHNV/o3IXSbnPqSPfTm4e0OgSDMdhaOavfce17Y85fSOJT/
	 nxBmiUgTKn56pL0KgYJuWENV9DZrVECIW3rbwuBzhGTp68FfNJXAbjdTi/XfXMA4wBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=gd3ELEKr;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF69606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF69606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=gd3ELEKr
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-7190d9bdb2cso334808eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794523613; x=1795128413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVSpryHAFlCLz3rbBucSelxzHLz0CacAipJZykSWsqs=;
        b=gd3ELEKrqfLsLRUZQygvDf5TRKPGFeTSyf88xZ0LlqulMvCMtN/hYW1gOeLatc4Zx0
         GGBSWN4tBQBrSKRnkIP1tW+APOwZ8rGyIzXcG86SeKHlMOWh9KrD0AHuTLC9JBRpV1bQ
         ILEUrQU+apv19q+8iC3/sWvxdXcYGXp4vZwe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523613; x=1795128413;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVSpryHAFlCLz3rbBucSelxzHLz0CacAipJZykSWsqs=;
        b=Jp3aAPzEFug2GhZMdOA7DMSIgkCzEjLVLzEPfjmMYDg/LYnP4UxZdRnEJ+y4JE9q2U
         e3X1vk2YT4vjfn9gEQ8zfdJ4NqBpEO8/U4raEixeycfbvE9nu3wNEyZxbStjbihCWEjc
         dRKuJ8sKHnp8ATpvUsQ6uPge0HfDRvuzBPlKhyetNPqxbFRuiJQIkosdcfiY45AFCKqf
         ZlC/3ufhNS3ce1re7k+rOLaOhR6rZSmn/ZquWUMpCQF9OxoU+auNXUZ9CljAzNQpD+hn
         sfrysgaivGramndRt6qvpBh+jniA/ManMlbG6cnukEpxtHbwYj9Jk4gttw/6IAAcUfnu
         fkmA==
X-Forwarded-Encrypted: i=1; AL+hErEEA+Si8KSSPqus6HAK7/YuS8zOQNMGCSVF+WNWZus131wnhin9qjYKhqym8XQmqqnUFxmPDh8qLl2fPNI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tAmxizErin4trgMydSQarFj/o0Mli14AnTsnJSlQJi8gUsr7K
	5BSMSLa6ijN6yzqkfBl0kUiSrS6UtUKTYbui135M+OZKg7VaVQBnmrt0l8KUJniA7AA=
X-Gm-Gg: AYBFou3b8pgUQOZEEqQcuF/I648Au8cl3hf/fb1wPiOSvEgjoNehQMepbRDnGp2yD3e
	saMHGy0ralKqozq6y9Oi6zlGhbYrTc0sNeKt+BUe9MlkmIk8HOBgr5s0jymqDyx85BM+7zjYfYe
	puk/dOm1EPXWbMMZzNUbZf0/nDD4W/m0ckJwFLZtYOtFu+i3GvQn9t2fnN25rmpxtB2hNJJWoMI
	j6zTFij+yLDFsf5X+BwUVVaJkskWjCQTeSGmnEaA4p8h2t7CtVubk7oGa+4ZGSZy2SQafunL35l
	JktFPlsT57946c2W+yVRr0YqvMb2oSlvimEoGl2RmqzwwwySvX/y14n96m5EolTx9kvUYJoo+hZ
	ftrzqM9zAiKwMnQIdmvXtDHpamkqPg1RNUc2UqWTsmTrD7YTPF0R1tBUFCb3g8Tv8jk6ZrFn1m3
	eW2T4or560LLQ+4zttMYmyeIvCgeZs9Pw6eT9RIh1PX32z70XJrte0Bl5htwCjfAGH7E1SNF1jJ
	T3SQZ7jNS/OAWKd9bEOukzm8LZkudHkhio69rspC4/ErM1gl+jI4rgDIIAdIWBXvDpr/gjirk7l
	Aip9Hy61y+dUc0dqLnO8+Wl6ERXvUa9nc2yQ0A==
X-Received: by 2002:a05:6820:8599:20b0:717:10a2:89b1 with SMTP id 006d021491bc7-71ab5218123mr278831eaf.84.1794523613129;
        Thu, 12 Nov 2026 14:46:53 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880e5148sm831187a34.10.2026.11.12.14.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 14:46:52 -0800 (PST)
Message-ID: <131283b8-0d92-4277-9dc7-eebfe30de5ae@linuxfoundation.org>
Date: Thu, 12 Nov 2026 15:46:50 -0700
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
Subject: Re: [PATCH 0/2] usbip: stability changes
To: Michael Grzeschik <grzeschik@puzzle.ch>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261111-usbip-v1-0-da5217ac71d7@puzzle.ch>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261111-usbip-v1-0-da5217ac71d7@puzzle.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 04:34, Michael Grzeschik wrote:
> While using usbip on kirkwood embedded machine, I came accross
> some stability issues. This series is addressing the reference counting
> on and usage of the event handler itself.

Tell me more about the stability issues? What doesn't work
without these patches? Do you have reproducers for these
problems?

thanks,
-- Shuah
