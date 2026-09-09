Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADBC48F838
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 22:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788992591; cv=none; b=nPLhSYPzkcjW6mg4/nd5YfHfjvSqabU1eQcjBj+BynktTz16C1TidgsWUOUksH4YtCHO3UKe/fzUdYCWGKcErktl49z1nH6rwDp3+aRWYMcYtcGQsL84ctTplUJn6yBkH/+9oOrYjaUvsYu48++TxRd/1UualgpYcBgFlYhXP4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788992591; c=relaxed/simple;
	bh=EE93P9JaUK/IWvFQ7DBmgLnl1nyw464WW68C5E/9MDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AYl607lj07wrEV3xb3NBZtSuo47R1YNYv1vKEB84NEBRRdHuUXWl8Cdqf96kRpDxffJ4zZwlR6vJvV48EiHjW5vy0dcuKz4q/bHm7ldEFykAj8HF9Gsi7tvMx6y2vzX54+aduh1Ohpgl7HEq88c63LRv50TCHYmpHhGfV5dHoMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QcNuPi9n; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QcNuPi9n"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-801a52aa540so828098a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 15:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788992586; x=1789597386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+UF9QqPpTGZ3kEfYDBVlbL9sc6DciTd1OvmLrZ0VC4=;
        b=QcNuPi9ngw4Irf9ZCsKnuW6eIi3rDctWzJNadjDfevNk9mGtasgX/WqpNenp9LajVi
         ypf15a/xw8omEzOJWUeuX1KqJHoCqXHrt7GYaWDR+KlCV3tAHPkgU2rJQ5y1aN2j0ZEx
         iM12GV0rv/Bfxri+PvJjQ7hpQNlcmUqHD8n0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788992586; x=1789597386;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+UF9QqPpTGZ3kEfYDBVlbL9sc6DciTd1OvmLrZ0VC4=;
        b=WFUQr76O5pssjbjsi9cE4FEYmQzYcdFgSKdHURdWI41ZkF2gXkMbaA1oK0j9vzQG2E
         T99MeVPd+bPmgRedHSYNSuBFq9wDMvyDd0GOTJB/vBHIshPLKx1+eyzTFCxGEPkrnUGV
         bRXtigcY86uqXE2C7miP5kbR4Q3VicZqj1V+2v1gcX7p0ezcEaJuEOxEilXd5LaWt4sf
         TFOl4752lXjXWvtpN0YptMmDSMPUQoUtcEYq5yPqJh7io4wBdpHd7XUgss8EKLFJoqLb
         sJcis9ZnIMexYFeFvzR63I39V8N/TfMqeLuJjqCTxriGHjVCbExr4/errleCMipQupzk
         vKlw==
X-Forwarded-Encrypted: i=1; AKwUvByB8KMQyeZwUkxbiTLw4HPkEPfU+dIIommi3kD2KaS2CoM8bdvLMFGUmewEjL0LYvYmBbYJJ0Ei6mxVagk=@vger.kernel.org
X-Gm-Message-State: AFuF++koW9Fd95uDVVGPlHzmAgdZ2pTPWYH61ExKRDq67jocYVuEnxi7
	Va4th0LN+n5DuCgYG42z8BcD23joHCwrvgUfZ2/XEAHOdF7Sk92TjubSWuURw64v8Qs=
X-Gm-Gg: AYBFou2AJfJPERm5Zh1PnFQmGBfaJGpoexTk5v1S1jFLRAi14yW/+NB+1+9VT5EXrCa
	MyjFUzcJCZJLVSnCBi13GGt4MIzBYBDWQuRU4JBXzF8W1rGVMLzb1HtYS58xL4Y6DjR4oShkzzC
	B/RC3jN52bpd/Zq+eoSlqzZqXIkKXcEEYGdnLGC7a5q306EaDz+d4T5Q14pz3dR5upp13XAwzSg
	cse+MPeIDja1zt26CgWSE4UUUzrmQPdcc0KFAllC9KwF7PWnD0dMZ7aJLFrvYj+ZkVoWcb/YbQo
	X8blvohqmldpuldQPm85Yf8Ra6a0atrAaOMEnkJTNDT8s932+sv4CviiBhAC9YRik56o3TNvhTE
	Et7A0b6d/DHRFEudrEwucVieJpehWO/YkQ+zjBcTw9uM+OpmQY1s1AMneyoiiJPuOE8/xchUoBB
	lKw3TGMYKb5An733iysIefceWDhx4JhMaIF2/AzAKcRid2iTlrXVWGNH4sRPLrdtc6RMOuVazmQ
	XruOG/u
X-Received: by 2002:a05:6830:3989:b0:7e6:d54e:8fe3 with SMTP id 46e09a7af769-7fa1f92c50dmr23754536a34.9.1788992586339;
        Wed, 09 Sep 2026 15:23:06 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f6794e22sm17892719a34.7.2026.09.09.15.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 15:23:04 -0700 (PDT)
Message-ID: <a312900c-9de7-40b9-8687-82ecd18bd563@linuxfoundation.org>
Date: Wed, 9 Sep 2026 16:23:00 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7.2 000/556] 7.2.5-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260909134230.441546314@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260909134230.441546314@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/26 07:34, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.5 release.
> There are 556 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 11 Sep 2026 13:40:31 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.5-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.2.y
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
