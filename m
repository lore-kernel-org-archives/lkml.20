Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608919;
	b=LHCI1Ee7hQDxQZNjXMt4kUh3YV4nAWIxX/a5ZKdEOmYpGpH573X/TAINolp4/xvfY6qg
	 NNnZQrC4gCTmdkGGAlKh6rTlUSOsqzhbmQC3rIiZpul+P1bmXTU8FBs0S4clgt6Jk6d0+
	 romcgS0F5hiAHqK4h2LzzsJJTN2C9Y01ZsWJxkbgeHU4jeRtJkGO/5RKx7edB2Lrw0zLV
	 X27kXaLIPy0i1Axh1eyJzJYCZAyLEgnUQ3JHd1CJENjdgjvKFS+3GMaSzCTfJVujEq5np
	 JHpAzO1TQgjbVrt+u+eqJX8ekTLt6MbQbjKn1XnzZt3Wa7ONbYTxmeUWC/PDTf0oH2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=f8Yyu14PmVzE14sqQ8IHgz22ahJAxs1j9mX0HpcMRXc=;
	b=C+E2j2ePk3veLqNp328nX2A+ytxbKZxL/xxKfHavFY8odr4PBklZghyo7qFaLt78ldJU
	 tseyY3hfGgGfjaJk1UMPdqzcR4lMS90WS7919vvmvCkZie2fo6+3mIej6ixBJOuyRR+hK
	 xIU5ewXW26NQLpvXwEZ2VXGGylSGnq3n/anAL3H5uDIhkpZPEBsUG8QfbAr4MQkx2/Du1
	 i5Y9T0fFOgaQErm88JrtaBQHbnI8owr7nVMh6r815NDPM6wcxJqIAbVyzRloEdqPRIXRx
	 I6c54YAuP+7cXnsIVkHNRaQeZuslqQD1wf3o3IEwDaTCPRPZsLCSDjbBvZmtvJFoPeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=fD4Rzlh4;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72B3606A329
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B72B3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=fD4Rzlh4
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8439fe796ebso1880602a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794608914; x=1795213714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f8Yyu14PmVzE14sqQ8IHgz22ahJAxs1j9mX0HpcMRXc=;
        b=fD4Rzlh4SOf+qn7cQa3+U4U7FnQpmRbMeUH+EJBfZl5XIBR2UfdITSAhw1J0PADSPT
         u7x579MUqcDS6LuueeZe3WA9CXiOWumX7kEOltxZThWV3nUdE5028o5LJJ9WfyERMAWt
         dE2+YD8cM9X72ni31r2n41mEqMC/ozw71ss4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608914; x=1795213714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f8Yyu14PmVzE14sqQ8IHgz22ahJAxs1j9mX0HpcMRXc=;
        b=y2jeUOcduidgGLZRVsgVj0iiPuS3XDCAoX/jVC3vJ0CM15umiWUResUQknV9cIrmaD
         R8BMBSRf9zGubirUkJsVBwjsfAD96sacoyQZBnLz+ErjnGU+twKn0FblgP8rFHsog3Ro
         UcU+nj5iJRoM3iwE6E64ZL3G6o8+Lhd9ok3YuVmOZFx1rCFQlY/E+kZ3R/o+uGSehxKO
         XjC33ZM56AjKUN55ZACjkHpm9bC+CzeY4rv21M68m99BFuQqMLlAnFC/+n4SdgGPZTwD
         B5cYaITW7LqAAFnxzjmO8m8rBjGljvZutc7cmqfhlw7EmhvKmQ5Jv9RfMdq4kzPooY8d
         UChQ==
X-Forwarded-Encrypted: i=1; AL+hErE3MhIVlJLmg9id3X00+hVL69HB0ynM42FCqIlWxtGYEbDrHuXKaDm+fiTptUMGo6LiKkiefFz7SUdz/iU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RmeEye49i/ZDkrAwdsJPEK3CBptgfd374Z2r6jtCAjShyPJZs
	ae2GBIN5R5AkxPzt4m1PNLmB7PRR8/e3isdrwlDCAiTqW6ebJu25p7XKxsyBqRkypi8=
X-Gm-Gg: AYBFou2dGTKNzTAdwpcmg9SdVIcfTRqfiMFxFq1f1QCulsyufBkyE43q311zu8kbtpW
	dlzeYfSoGQTT4jNnPTFHtO4YRYCLvPjQc8Bu2ptF34TqaFctqw8gz2/Yuz6oScUsvLcC2hJbqeu
	bpL9YM1SxJCG1820m55me60KOoj5MS/QknGPwy6XJuG95ZxVFwmpSQto4BE4UcjsbnVBw+bhiPE
	J0eZsZ6JT8++5BgJBsb8QZiB/hESfSj2EDFwIPT6XAMep2UMjTRvwpdLILo0TIxd4a/BhlxSXdC
	k7E9qmG1He1BrBKoMNAQda8jF/wnsrdmVLea2QpTnJ8RNkNJ2y6ksbn9hCBazWnEfpLtnQEWQLc
	rdKNstUDvSpKqx+SP/Rt5ZGQtPr4PG+79GbH/J4XL6aOs5wdKUcuCCF92fvKiwjAmSt/+lAgqF0
	L03473XHasnvT03BZ0a93X0v3rL0TKogF0knc6pSfJ/cF/L5og/AbJ8ZYaRcq2lgf0lQSVenmqg
	vbh8wpkxUjopuwWWzw0z347VeaDd7bYafmIr0IIlQgpchanjQMaDP/OgQvFlfjZF1TyAWPRUlXG
	o97i8Yh03zUvwAgif5g62FUGUi3xcdywQlLTXQ==
X-Received: by 2002:a05:6830:2692:b0:829:2af1:a07d with SMTP id 46e09a7af769-86289818d7emr3591229a34.5.1794608914557;
        Fri, 13 Nov 2026 14:28:34 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880e9abbsm3427767a34.9.2026.11.13.14.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 14:28:33 -0800 (PST)
Message-ID: <278205d9-75a9-4f0a-86de-fac192db4edb@linuxfoundation.org>
Date: Fri, 13 Nov 2026 15:28:30 -0700
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
Subject: Re: [PATCH 6.12 000/670] 6.12.118-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261113153811.177190860@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261113153811.177190860@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 08:42, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.118 release.
> There are 670 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 15 Nov 2026 15:36:17 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.118-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
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
