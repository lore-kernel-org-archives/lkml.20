Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC745221F6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788556104; cv=none; b=IwqSjsF36LmG/sWQXFA4R1vrUYCrcSrqYfCPOrwX4NeaX874TQwCehGWxwwhnD9Shjudg3kyzTqEL23Hekqof9d+FD89fO+AVd4w4P0EnRIJgtj/+EgyPWmJQxkj8dcA0RsI/gG4wNPsFklIt8tqYBSNl96Amidbsxu9NwLu6qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788556104; c=relaxed/simple;
	bh=TLbkhy7UhS98+n2pJ1BtGLZtz1S+VYaSrwgfIluJQvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dwtz6pLkT36MfkTzP2RIearqEyPOlrlUy/N7ctU18S/MZoYDah5ybiaTBL5lM//NbTF4sTPTPiaLC4H7iiYuccMpberCxdDBLqwDPTVthz+HZFDBDKE0TxOctpRENykswtElDBK/YdhZgP8O0eSDPcobOxxKpGWGPeued358oQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hKQB6+Ae; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hKQB6+Ae"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4b28db31b89so984467b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788556100; x=1789160900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBcQO8IW5vaft9DEnj/gUzJmSXgNK0HzXFdKXlnG8Tw=;
        b=hKQB6+AeHcrv91DJJrKy/lpU0rfxaaj5ynT2KAELjDocSimnwmV2ArKafAUO93CCoq
         JCgGGfKSynjZ41PKBkOCzdDtoJbB9qkIh+dKj+N6RjEl+0x16RR5UIHgX2NzsyogZqYR
         HfUhmcFubkDuYcBSHz0yoDsT7CzhGqh4aevEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788556100; x=1789160900;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WBcQO8IW5vaft9DEnj/gUzJmSXgNK0HzXFdKXlnG8Tw=;
        b=YWGzTPzxdDVNwzKHwOqNsH66LYV4vr1O7ynUMtOrKIxS+AJzvrcVvStQQsdYg2iqku
         soCA7QHdXwKnmrSNBK7Gs1Q/NuexuCIqskTODBfDidd6i2JNrLYL98H23uviBeAuIoHP
         3E1fesPYsvZt1SiwXZ02viJaKw5Y+0AumgIKNLfZD/3dwrVrTw2002AaGIam28wxj3cG
         I7vsiMVhU/4vbc8HWqukDuAxR7mrYgM1ZgFzvOC2jHSyIaojkzz1nkAGuBrjYxqbMZV4
         zIVClN0tLsxhYvxDY+xQX2Ai/8lgezhO9hh2RcwyzNO03ULmi5c1Mx0YB8XwDpV7Xwtf
         b8gg==
X-Forwarded-Encrypted: i=1; AKwUvBzRM4eMFef22MEoB3ewnboM6Ec7hwF3DD+OmHwGRKZ0I5F+GUon502O+CFLefSdYz6c8BANmNXZ+kp+O/Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mP/vCgJyXqPpExiDET8lijaKPzcOtgYK/XIBtzNkshDu+9UTFl
	ReFYJNTPQyrzqVN7pMuQJtiy+kEo8/VwkozL9ydWh9a8aoczpq2KCSLhL/8SxpGwNlE=
X-Gm-Gg: AYBFou3HwQuKtDyXMr+f1XvZV6aAWxzCl0AemXSOw/lxsOisGq7+l9wrWRmOQ825g0/
	zPSUhJ8r1tMQZHDZ1h75aRCu91GrPsmgx9Ix1kkc7wbgRA2WadLjqQfhSktMSD/QUKfobMS3KOG
	HtXgeFS/W9YM0h1P9aKc0i4alo/TbA1/HxMHcYIr6Co9JhWktJAKcUMkjggncnAXmBInb1UMWs1
	KDJGJ2uZyrgG7u6mSmsuqn5pcnP+BmbiBpDrHBy7Q9hpcGMqMz56MxthcQtcY2wr1mDO1r7/qdD
	y0UyMzL5OLDfC+5He8pAc7FIjiGim15Zd4rmcqdrFjMwPSI2Jd+nCIhugFuuKClqzCez/0gVBxF
	lFoN2IRJVH4giwTDkiqxPNviE96THjxEbP+uueD+4x1oJlnxXv0jbyxy3Lh0dQYyMVUJgCXspyJ
	S3oYOxk3jh/OcXnL2V3Ba14tFc7pmtCntzAHZAO4W7xog3wcYYq4SVUGvu7ZoRbV6FREOd
X-Received: by 2002:a05:6808:23c3:b0:4b3:7efc:e970 with SMTP id 5614622812f47-4b96026e6ecmr6951990b6e.5.1788556099903;
        Fri, 04 Sep 2026 14:08:19 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971b97c72sm3487810b6e.15.2026.09.04.14.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 14:08:19 -0700 (PDT)
Message-ID: <fe373fd0-6577-4f5c-8285-d8398d867797@linuxfoundation.org>
Date: Fri, 4 Sep 2026 15:08:16 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7.2 000/713] 7.2.4-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260904045803.810145556@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260904045803.810145556@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 22:49, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.4 release.
> There are 713 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 06 Sep 2026 04:56:59 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.4-rc1.gz
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
