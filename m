Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250053;
	b=Bgqbq72OUgSkjAeJ+jMKDST8CQ5b9GoornFegc2vzQR+fn6yqSHCQKozYv/GE76JxUWK
	 /FJ1AGJMMJftK5BEpIi7LYPuUKL5326zXE0/pgPKAzQd3mDBXK1QiQbIhBcZjF8dijuPp
	 cuJFwSvn2nEpch0ecECwzR+pz03HXtPXBBRRkuolw1cq5JLb3/a2R6IiPuYkVOQIj/WL8
	 JG2HlHnPXoi10ba6bSxCXv6+jR7OIhr9/KzY5o8QacwaPO+lvVm6ccgFm0EvkjnYskHHj
	 ++JAife+hlDwcaZdgwwiK2rlUeaTWq+yGUXw19/lmcpZ/0jDxuoihxGQ44zr1YUkPQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0FmQ940rulC16JggvuZSFuarwnsVy2/MOkII+LL+oxs=;
	b=Fjmm/uHTEjhua5Dxh4YQiUw8SAceFnJ2bBo6IAsaez10WSkAp5aY4HRQ4TYGXYl710AZ
	 Xya5sgDYKcRIqqUXbOaObKOIDuOX24Qf68SqCkuJzRD3s6hxNoMoD1LIhHpGdS7Y7lKm6
	 NTb+n1oQU+rBPSeOL/rjzk9CmmGf0DJDF4a4xq0JRWFDjiZ7z9nGYQMUpcBwAx/8Eryfm
	 9pQKIOH/oh7fccWzkK2TfaAnTUt4WE5vz9r0Y2E90/5bJDzl9ycw36d52pgMsBTbrHiXc
	 jaf7S4d2bRf9uSFCYl9gerngCPPDU/N20UbNpBMQZtXXIjdvdHIroic86phsM3FgcvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=SxkzgZhv;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C113606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C113606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=SxkzgZhv
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1469388f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793250051; x=1793854851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0FmQ940rulC16JggvuZSFuarwnsVy2/MOkII+LL+oxs=;
        b=SxkzgZhvYBb/yZWPQWT+3J5RHBu4CldVxTn1snxGcnxWrEBqbxkfeR//h/Jn3vSIHy
         MJaT5o6rpOwM5rmtq8bMV8Wc6hCStf52ID3V1erADFkk8DygglIYayVamKxmZkr2HdBS
         n6DLf0JW1R3ksebPiVqT/qFBZNuU5RI1OqeH7pP25rsl4pITDI2v+JWB6OB/Fdv4Vy0c
         xtL/tp/JYbRddBDmmttyjL2fB0ovyJbFviYmsCCOQYv1UX+V5Zj9o3gTyGDo773C26S5
         EFoppS6fP2lqFtu9i4gj0jW7Jt+7z3j3EkR2S2KVWzWkOmxZoNh5oQRoaoSgjXkxPlqY
         6QMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250051; x=1793854851;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0FmQ940rulC16JggvuZSFuarwnsVy2/MOkII+LL+oxs=;
        b=pMd6HF2KgmIxvxqI2sqsEJ6qLr+VqJ21lq4Kte0VvdSzUreZEkBx1+sREZOXNyIVf7
         tacLltLEip2XovvkHpMc8w4t4T2QXn3f2oxgUSCQWTKItnKCdRmVHz3QIN2Nnm13Jzqx
         tjZsgbpEWlxytJtREk5C4UrWEPwej/n0Xz8vDQ+QK85MZTVPKHykg2hVeuoodY96K8eo
         DbgJi+4zRIkPGbDiTvNM7NyO1NVyH0ffq0A4Nl6LHSVLJFTV8mXEpYD3vVjVLH+L3Bv1
         C62RQFtG1XOQ60KrXSpSfcQuJXyXNbJUKNB5iHCCcHZBz7KaCEPboX/x5yTFNqtlHQVg
         4GVA==
X-Forwarded-Encrypted: i=1; AKwUvBwIdkPqzQbPA/psjv4shfm3FLjqMy4xeQFgPfgWkhH08koD5XzMn/1c53Jeo7Pk4mtFXflyQublxxWIghM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxmlvXjvsI0nKKKNf4RZq0euZ8kvAwCzOJCuica9sOyGKhHctL
	IYxKHQteXbTpYPY5zE4vDS07uCYTxZgeu3l+uPSu9UuQJsDd8h22Tm4=
X-Gm-Gg: AYBFou3IgUw2YgyRPJRbs4KhdtJQJPw68NckHITXC3Rrt9MOb7KlJwB0HzdguKYGmgK
	6GrVNHjz/wZPq0Ua6IOIuk0vHzCqJT9Rb07egoXZteGa1GIedN0/tkpSdS7GLuVA370aVaueZoN
	MS4XequxxXRdCnvhKqkHmjnd+7LleSl88TPOg56j700LtDaPT+tLWdySOGw3faY65cf6RqW9u97
	2+LINnOIOf2SfXnHDXH7VQMF43w3ert4A900LjU/m0EiVpdWKHl/BHLpdWPuSzuy3b0Z6Hd4SW3
	L9rul5Bim9UbLaqODFSa7pWWlKJfO2NByfxPyatnSgNIpVjIT4P6+oWNVQt1AhvvxRKkCf+TKro
	qbyS6Q7B4HRoDVrbKsuaQX8j37gsqhDcDrR6x+rAQENHCJ5tZdIVLoHAKezwxvcdwssWssL+XkT
	JERo3GviI1JGqIyaXujIgXNKliuenABdaC7kK87DCeDXd8SIzDi8vASsbWkVRxOaXbVYwzAHIh4
	c0bZVzp5dSP+qdJEpRfQscRD5qGOSm6bL6AhcoDufqMOF8pLRogkm1ehY6woum4X/fMJTSAgR5o
	4aVeUYJeBA05ZuoDQg21iwH5ETkAsYVui9K00ogCdY7HPrFOtrhMdrzVuI2hPcftKMFxx0ETLpX
	MYUTOESpp2UBO6CNu0BV43aCiTXM=
X-Received: by 2002:a05:600c:6209:b0:4aa:15b1:d4fa with SMTP id 5b1f17b1804b1-4aa15b1d512mr72370735e9.5.1793250051594;
        Wed, 28 Oct 2026 22:00:51 -0700 (PDT)
Received: from [192.168.1.3] (p5b2ac3f1.dip0.t-ipconnect.de. [91.42.195.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3932sm33329612f8f.18.2026.10.28.22.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 22:00:51 -0700 (PDT)
Message-ID: <786d7ae7-b713-49da-9e28-0f276da7e6b5@googlemail.com>
Date: Thu, 29 Oct 2026 06:00:50 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 7.3 00/38] 7.3.1-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261028165940.394092994@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261028165940.394092994@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 28.10.2026 um 17:59 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 7.3.1 release.
> There are 38 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Builds, boots and works on my 2-socket Ivy Bridge Xeon E5-2697v2 server. No dmesg oddities or regressions found.

Tested-by: Peter Schneider <pschneider1968@googlemail.com>


Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
