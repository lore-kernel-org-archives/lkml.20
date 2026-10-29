Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287082;
	b=CTF934TsoD6o6gbTlWHzAYywyRaSlKQ9Xy9ppm1EACRkk6+zJNGhJtUdtXGOVhenkQuh
	 TPBy7KYUjC2B8E6W6tgZkc8NQXDLJwUZxl640V1NB0Sy+2r7R7YUmYNjCJtyam0u2drSE
	 M0PuKSDq9XWGdKOfib0l94qqNWItCB9Fdp9RAt9gAoU1VxdmZDR3o8+BiybdeizGUd3g8
	 hElEQAM4VCpkHVUbFolxNg/ZfW1qzlE2ugi3Y4GvntP4uIxdJV1Zre7aq74SeqdlAVljg
	 XErC/CatUBPxh/8YtnBloozz3AsULs2jGesCP0XFQKibDLzDN+IrdVBTJHGLuAiAPLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WhrGqebO51xfUsjiZH9anbqm9PSjMbH6Lkt6vVEX+10=;
	b=xzuWo3WWyjMpofMrNyS9gjBVzXKfEY7lHiy8lf3HJtn4kGomLlEvZwsMt6isQOusNwHr
	 5MFQwTQIdpysTu5iyRMuYBGf14GZqQGAN2AWGOJ3WGuubOsK7Jpx+adt6rZeuwiwZKJxJ
	 Aey4em3aHq7x59N25cGct3TOOIw2ShdXrbseoxDfPmD4DJmKdlr6VLWACeh368krE4Zzd
	 LqkpwND9v/vuIAwTVs00tHYfqAB+hFII765Ie/4yWig0YLHik6dmE9ruvDF7Lhp82y69U
	 pg8LKTciMxhAzCsWf8BbQ8XNh7spZQhpcvPZnoN57uP/b84E72ucMfcDFK45cm5Bz0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=ZTGx4TPO;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D065606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D065606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=ZTGx4TPO
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6e560e00a86so1703724eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793287079; x=1793891879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WhrGqebO51xfUsjiZH9anbqm9PSjMbH6Lkt6vVEX+10=;
        b=ZTGx4TPOuWLuSzFHhiQNuv4QSd3AN8jhqJ7w0iDeaFz0SkdqzU4pIw5IMSVSl1KbSX
         CuXmOh+nB623wfFmpWdgnlLljr8VPYeILyyooc31JLxStNHi1hXSjrRRf4tWEPquxq+h
         L2sTN5GD/GyQYrgKJl5/FhEHdVuFJ8HPgYwYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287079; x=1793891879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhrGqebO51xfUsjiZH9anbqm9PSjMbH6Lkt6vVEX+10=;
        b=hOb/SJi8eiVL326Sx9UP6pwYqoSEmxBpIUoRyNBnaDDHBzxxKo7MKx9LanLzhTFG54
         p0EkSJ+CdOFxb1qAnRO6pXFEpI5jQzunXoQ8CJdHSz+TTwDQXYDKTbmpyRijKJ/Zyo2U
         uYG/zLkIq5mHnAmEKZc+KEFcpmBXDLyg+59RqXiY9JMuoMgNXtOT7hyRjCU90T3uSYd4
         WsbqXSMCDgPOmCgzJULKlJZmIGFESd8tTc2tAkDKt7E+seZMvzox+8w34401G/hX+4j0
         0llTjZ7H0PbQ0zQYCYLfNjG2M7Q3n7Bph2WAp4fir78/x7BkvdxpDxkxE9lauBoLAX29
         IdEw==
X-Forwarded-Encrypted: i=1; AKwUvBxAjun0S8ZnTPeTKGNycGYzmk0kHcVFEJhBIOH8a14v8UYNUYY8P3/nruAZwrh2OVjaN4oTCc8zIxEeQIc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIV0Jm2QZ4vlPirkFjeUcZlsTzM7J2GVYTRVh5f3VU6ZmiuxoYc
	jkNeQFGHfgxCXHvZ9YhoeRfcc6xyVbKosE4NeU3eCXHf6LkjBvFlV7mXkbQFasFkHck=
X-Gm-Gg: AYBFou302/uHfdlLIPj1N1sn/HbQ7ESS/XcDsK5shQvCK1zNvVEvbhFISyP9ypws/Cv
	hZyQikDkkllfO6hqDRFND+z+4BE56qfht1cl0ICzPhGF4dqzhYZnH9g3Dd3BYWdTtPcJIDOvCO0
	DO28eV1ABGq/FtqlcoUDGx3eSWhNxytsHd+iR9KDfjHqDHzUQl86lJH9L/aY2JYl0w1rwAtqyd7
	BxJfQaL9FOOWwidhH2+TBnTpLO7mIFxj/RstvycC5wsf8dYDJZ3Y5WwmQnVtH2PcXae0EpLNchw
	v1a+Amb4WGab9FZC5LGSq7W8l8Zh00Odw0PpbSlxjPITU2t+j7/XVCTM6JmtaUq/jFO+Wqwoent
	kSeTu9OwXV2rCosWF1mcj6cas0tLdl20FaY1y/xKEz2RZmLmzaSD0sSgNNZeouavTbYiltoU/Fb
	YzZsdQ8mHH3Ur/q6WFcIMC5QeCvgRLR76C6gt99+opy7JeF+QaQHfYl24GxJvTIh65gQAsghz5B
	AQjHantLeK9mTmMeqFaWC4hyS6M+8CR5cAncJzU7XAo2q7h9o6MorGKPhoMxKG2J6pVZtrGMfd+
	9krv4ruQ4B4mU+VcAP3JUcgqugUG6EA5HnZlNygk
X-Received: by 2002:a05:6820:1343:b0:6c9:80d9:5f0 with SMTP id 006d021491bc7-713f195f778mr3311997eaf.49.1793287079139;
        Thu, 29 Oct 2026 08:17:59 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d33fdaad7sm43385a34.17.2026.10.29.08.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 08:17:57 -0700 (PDT)
Message-ID: <d61a42b6-b92f-485f-abc8-0808fb395a87@linuxfoundation.org>
Date: Thu, 29 Oct 2026 09:17:52 -0600
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
Subject: Re: [PATCH 7.3 00/38] 7.3.1-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261028165940.394092994@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261028165940.394092994@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 10:59, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.3.1 release.
> There are 38 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 30 Oct 2026 16:59:22 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.3.1-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.3.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h
> 

Compiled and booted on my test system. No dmesg regressions.

Tested-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
