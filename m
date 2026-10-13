Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D22053A894
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791933091; cv=none; b=tbL7m33FUk3z3UzXjDfZIiqsuJipgbiGWQdovNvI9XjOUAM5fYU8fdBHcp1KX0rnjlC4ceeIONHeRRIOaOxTBIdJ4OaDrnDpBULylIwMzKJi2W4mbLOADPGXBatLglKYFnwiQcY6B+NuRfAaKpmOVC/WyNck0I3N5WPNhzML3Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791933091; c=relaxed/simple;
	bh=5IBhaLUp5MdLPNUcVu4QR7/5QsLhjzo7lK/mXulxCHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OfYdyboO0mfNRuKEgKeGHruAkKjM96Cf044nUGia04PcYnCIOJ4TOjgRih4J9Sv5p2XDdiVTgD4Gn6z3Z34W+dt9kqGAXxZA0ATNzkJ7jXsVjJqP3fRKnz3yIp+djMC0/pTe6xO6MprBj+4wxEK41BVW6ow+cjM52mpHu/bmU8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Cd60tQ+d; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Cd60tQ+d"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7fccba9c675so6632878a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791933087; x=1792537887; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b/a5/AdXnTf6cDcdZphHu5UXWH0M+sRSxBHGhoRv5/E=;
        b=Cd60tQ+dNNPULA1mMHJSfnHi9O48jP+52GArxc38nhUyI7hJHlEa6j44+hQF2MXadU
         98DkdEq57cVskwmn4R7/oK7Kq16huWRvRZr80IX8ITnjvAzfR+prRyC3xR0cYn9kkI3N
         hwiz8+moPHwXK85LvvqodDUKKDPVo3dEDc6Y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791933087; x=1792537887;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b/a5/AdXnTf6cDcdZphHu5UXWH0M+sRSxBHGhoRv5/E=;
        b=0MQNR5Wn3fXog/lNCETf9g23Tsj02e51Bl8HFof7pDG4d5AX1tGdM+d7cvIeiJkHIc
         XgXISAGGq2nIt3hczWFGVd6XBKEix71YB18T7hyo0ERIkpPgmodnsyO9L7XbLPkNPEmy
         szyPZ8jRBDERcCsUGGN7mQVZXMiGIbtSB6AB8OChV0tO7Jxr6BG5HHL9vX24rx4LEhYq
         BLuPxIDXmjlFmkLOkWVZ/KR38jJcxksynq2MKOvM3c/mvNh0PgGKwRP5+IkOgvrh3ib6
         o3M2PS6CYbTfXi/DJ0aEBzF9fcY/a+9IVVVf5n2vAGfwCC7tPiXI9aEhZpD4Al/wGYG1
         zFkA==
X-Forwarded-Encrypted: i=1; AKwUvBxTk6LQnkDe4n8Nk5VTQYpEMA7HdCvA4DMNqpkQi0n4+yDVuESsPcRCsiexUKEjFYv8XX8QP8bnyaZIG+w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtvPVm4sciBbvvjv1nWJjoCozWvtxgJavV74BOXOX3LgV9KRpm
	I7MqPm/sVV6rSkDF/Fok2lS1fexukkDxhYHB97Ftg1b3wataEz7Ub1/gDC15XITSLPQ=
X-Gm-Gg: AYBFou3jaQhdG1RQLgPN9k1YgY9kBupnra1jowFCSgZdaXtSx/oNZ6F+XWDqKsKLL11
	KNLV6pzGEt21KiBMpFaceHKszbLPDgJarjlkrSAzv8i+RlNxH9pmsrKe2rtVBaUZ63QkKLzXL3R
	CiuTQXPH3YGo5L6JIU9TUqlblRop9oCd1XEskPyrWcxKYofdT+iZwqyJRngkXbls0HZAqfaBHfz
	bJ2RY9e5nhUr/jhLWTJv8R+PgOgOruYKSXDvwtu+6clcParcZCWTlaq82YCdiY5lRNudEXVRQdy
	O/6HUYIpLi/lbBBKudTku6F6fDVudp3nY0AWTV2ZojufvtlACeSId7NF1hvlJFuEzvfXLlkI0Rp
	K1Ww+Wf6+3Cvkup7hIUPdqwvOcFvvNK+KCA+buAobaGtnVgN7BHOC0JTsBhFB0aedlni4MX3b/u
	sliKgY6v/IS/vRVpUehtl43SjiX+BZ7VAdH9o3oT7pvomj1uQjDCpKMZb0Co0sF273M9A8oTLiK
	wYp4Kg=
X-Received: by 2002:a05:6808:250a:b0:4b8:4703:db91 with SMTP id 5614622812f47-50b621adba4mr10283311b6e.26.1791933087183;
        Tue, 13 Oct 2026 16:11:27 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfc44a5csm860681fac.12.2026.10.13.16.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 16:11:26 -0700 (PDT)
Message-ID: <6f18fa43-9fda-4787-9e2f-63eec412ad9a@linuxfoundation.org>
Date: Tue, 13 Oct 2026 17:11:21 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.18 000/621] 6.18.57-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261013112920.855194808@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261013112920.855194808@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 05:29, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.57 release.
> There are 621 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 15 Oct 2026 11:28:22 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.57-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.18.y
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
