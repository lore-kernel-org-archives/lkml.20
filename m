Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F913955FE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788556326; cv=none; b=YdkelAeMGVYLnGvhBEf8DAZKLpmWa0C/Nlsp6dqFAE1mwOoqZe8LLfjm4mxVTxXrjFnIsEIoIxaf5pyAynSRMeqwOvYoHivzITyHPhtGtVTy7F8ZNh0v+eLY3ye0bvYSomrxntsm8UtgTiTOz27pzcxilXgFhCFf7mAW1j7+L6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788556326; c=relaxed/simple;
	bh=XZ2O6+CuggsNKjJUiXGcVa4gfM4JZiv3nmeSny7FCe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R1+V9qTNulkhvtNDLw8gO4Zm0CJmazNih231AmfVgeKJ6cZ/D+K4yjsdi9RTEe6KEr18B2UJYZe0hyHteQQjnq1AoyiOL75sQwIU+Iu7VLI8kcJZiqv4MmBaa3bP+K2ndvx+TQHquZxJ2cnQ07QgKkIRv7RvWyjOaJifyAGcKME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y1GEkaYu; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y1GEkaYu"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f4df360cc9so1802009a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788556323; x=1789161123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5AT5dBqnr/v+Pip1Q+2K4mDw2hDT4rcmlPRVl1ccW1U=;
        b=Y1GEkaYuRJPVsuyM1iyN5x5+9Twg/UlZOBeCAk1v97/vyg12JfXXiFUUZwwELybSkA
         +K4smh1eypeywKyKW0ZUoVPA6pEJ2VqJmycx4vPxtMLoCIUSGv5uzZdBfKzHcJyAjzmY
         U0VUqvP5Dv2X0OeOjNhqanARKofuYufywQYfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788556323; x=1789161123;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5AT5dBqnr/v+Pip1Q+2K4mDw2hDT4rcmlPRVl1ccW1U=;
        b=TeWvKa/CdmrVkWwGcoZUjy6QwKUg6qBPNWiifiZqvrjAAfMNAKZGdQLXtUgRkfmZrg
         KVWyG2GmomdmgCnD95XS5G4s4gYLxpbTDsTlJvS07UUdiRvt8R5XvThrGnPit4vbEfHq
         EZKzGhQvA6AQMHkx+kQkIOjsQPI1R3hs/oH/Ba1YgtOq8UOoJt7s0SigGL3ywHHdxWke
         0IjrDEhtC96PLr1PFAiup5C5H/i0BImOTOgwndaqmhgyK2UUzUOUawvDY0tOi4auwbZ5
         Cc7WIXxFkE+7m0LP3q51JHdNBLxrPoczcgfHLwIY/yk7L/cKxi+bRSEQ25Kl+MtVQDHj
         0NBA==
X-Forwarded-Encrypted: i=1; AKwUvBwfdrzcen8xBhFTdglk3xj3+U0tI4Cdk+/IxM/2AnRDztqefHCg4OEbLdnY+DeKpOXW5h4h6rEX3cy8vrA=@vger.kernel.org
X-Gm-Message-State: AFuF++n1XTNeF3aaMBoSpOd7OnXfjufQBKr0Y5g5yEthx1B3InuK+qaW
	AUTfahJSl3s1WodxESBIiUq8VUtf9+VOEICh7C9jsgYSl5ofEo6G+RX+8t370/EhXzw=
X-Gm-Gg: AYBFou1lNjRP43I7Iw1VXz0PY2NdYd3lj2eoFO3weoKhyu5zj/XZPZExn5QOwDThdnG
	rHX2mA2/mO864T0A8eMCN2MJO+bVq7nPp4AtZjO4IEHdu+CoHghDF7wlGNrudEVeXCLiiTUhRgm
	aFJ05lyWdoxc4hMkJnBePMXBk22LOpcEcaX06nXt7rNikqBatJHp5lmyPotDorWV928Z/v/byZ1
	pVu/EC8fupZaMTHhvvE4felpRQLgYyVU8iLXUnNDeVE7FRoVjwHV5iKRlH3yxi1Qtzb05uMgU1s
	Bke6exq3tkssJVlPaDNzw7K+u3vofpjSYZCUwBnSvMStmYWGD/WmOVzisZkf4cVxAOwGsIKfCc6
	h6Ef859NsH+riflnLJaax0NmK2xxrh/FHiUqgxLkWjZ2F0NMHEKdKsYLVjUWqPKtBvkHxTn1x0n
	v4uQyGwQ2tHr2nnY3lyzprO49jAH+kY4cSF2C+wY0FpBTNfFOMjiTgyqnBKLO5LHKp5qTQHQ==
X-Received: by 2002:a05:6830:4392:b0:7f1:e04d:fc4e with SMTP id 46e09a7af769-7f899a8aa7amr8040035a34.2.1788556323643;
        Fri, 04 Sep 2026 14:12:03 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f7aeac18sm4031241a34.25.2026.09.04.14.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 14:12:03 -0700 (PDT)
Message-ID: <82febd53-023f-48e0-a0b2-c5da95f069e2@linuxfoundation.org>
Date: Fri, 4 Sep 2026 15:11:55 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 000/403] 6.12.109-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260904045734.806166532@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260904045734.806166532@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 22:56, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.109 release.
> There are 403 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 06 Sep 2026 04:56:59 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.109-rc1.gz
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
