Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831834C042D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804455; cv=none; b=ujIAbo+M22YICfYnR9P5ZO9n0X/1C1JlocLCF14R8owjC3VK4YCmyd5ipY1N0xmnhvflnGxIOACQXPzFcr4IkUkm/am15DO+iAH8chaoGHRXeJ1VIXPi+W2I4zmQouF2S9T4iECS0JECL6ychjt9F2mmy5uLG+YbCpHwqquUrew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804455; c=relaxed/simple;
	bh=lu1+SJCXQ2EpuIPYLuobvbha9EEZ2hsucDtrScwJEVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u3bxJuaaf7kH5sVaWbYUlZ8YRH5ThlaesYDXqrKjdXXuLamgb6aAn5XqORgbVlvlVj8lqcWosLReJZ8cUbAblqhOzIPJv3+o+r0B49Ouou09xBlIcviMqFh4Z26WBAfm9EkbBdcVfObgxivNka6qLmV5gaRG41UaxtYPTE63zC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=MFg5OLDi; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="MFg5OLDi"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48aff58e6abso766381f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1790804452; x=1791409252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGfnmzZ1b/kZEE0OkLpLBVu8C0jcPTvby9i4SQKX6jk=;
        b=MFg5OLDiKj6uOPQe16pR16HT37eJMisIdBUIE59EBRiqjCNFCRYruzkB5HGJQrkMuh
         WqLSJ+syPOemkCB7Tu5Rzv/ALGzmpMNQw0eGmcLACkyeh1LQerxlFwIJQ69IBMHaeXli
         IVCbLT1sZcfyyR3i/jzRsnAZejP0WZNrvwyMLGLwLw1uZGZEgDCK8z7qTJSNmIwK5u3I
         ccFpR46JruT9Xhdw12p5yX515MOGnIg7tb9ECdZg/cDzD41cuLWgUkyRHi+7p+QxHT3K
         JC3pDsDvAh+dvt5AmuZSUunCmv5Z+xKv3dn8lYxXKcPHQfS6x0o50QdHFardk/ZL6dQt
         ZK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790804452; x=1791409252;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGfnmzZ1b/kZEE0OkLpLBVu8C0jcPTvby9i4SQKX6jk=;
        b=Z+dhSHxR/445sfYZ13iWapbOYnNiCZtAdjGMZSQWdiol0P9h3noHhvPoDo+MmpBNhK
         k1TVJk3KAKACJ7+XLzMre7CDN5nJGmxXsDW3/91xBXVAUAJ44LTE30p2C2ZPvFsgEz+L
         NrhzmKEVW4ly/Eo5aO0c5EPHcuSEXUUhPupotaMlRtWrIhKFwnYKxjVxZ3HU+4vl+vrF
         Er5I/pYTeK1W7nECdzRY7fi+rxWuc3489S76zYq6nfCfWcCbr7wutmA++t4U+ip14YoZ
         p5rGazxPe0IWpi7WKX0pilY8HJw+SrAMdtOKzFjDnHmkRLBd7u8WCWISFRI/M+67DnfF
         +O4w==
X-Forwarded-Encrypted: i=1; AKwUvBzTWD594eyD/k/1unpf0ZIFCLMHgHt7D3lSFl0qDKB8OoHBNCWTfnS6jdAkdrzwPZuomeMJH+dQsV4z7y4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhRSS4Ev1QQzO+f22/hCW+Jf5lECkUEwbO5UzQrge62UIVqjy4
	qlhsdDb04GjY4cFd+/d6dj2Gop0iy6obio9ehb7T9WN/lY5H1GAg0Cs=
X-Gm-Gg: AYBFou2+zOpT4IBBiZi7+cExwvI/UsHo3eo7kAXtWHBsCRtuUdA2qVESwK18XtfnHsB
	Jxr5x0MafGwINyNtHLm5b/GTFnXWvfHX4G+R3c2tFXkEnInODG9O2AR1wNgMIJQJhDI4PHYd52n
	uY9gBnj8Pm8BpTejtoTzG2zaaAJsIPeq2IQDaMx5lOOrVT65N4oh3hIPjptmRFW5x/SdfrHeMYa
	CSgH42pp1H6YhjJCJ3iEyl+H81Axd97UWzQhqHbMMpvSgeq3KhEkynh4/QDSvD1e+QZpmXRI5dG
	X49272PZqT/n9ii0X7T4XPe3GadTP1Fn2gqlWPUPOW9jFNNWwO05uQzbQ9+9nhWdy3AM5tkQ5PI
	v03w8ftmOcUif0tqEXOclDeFyYHVTGkySrQJ6dYgnyP0XtBatLBtisuCUPSfYsVDvVTepVySFr2
	ofSWd3I7o1J+P1tkbltPCcIvB/sJv4QaH97agPv6z2ipfCF50vKE880aMj2rJiWEUh4j3Z69IgQ
	2HEAQnuiHq28TDs/iLmMTTt42aCX2kwRCz5zZNLxJiQlVC+tQ4=
X-Received: by 2002:a05:6000:1ac7:b0:488:823d:5060 with SMTP id ffacd0b85a97d-48b02544bf6mr4972784f8f.48.1790804451479;
        Wed, 30 Sep 2026 14:40:51 -0700 (PDT)
Received: from [192.168.1.3] (p5b057568.dip0.t-ipconnect.de. [91.5.117.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b06a2fc98sm1736606f8f.35.2026.09.30.14.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 14:40:51 -0700 (PDT)
Message-ID: <b6209a1e-953e-40b9-a893-64a54e475728@googlemail.com>
Date: Wed, 30 Sep 2026 23:40:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.1 000/982] 6.1.189-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260930152416.775402466@linuxfoundation.org>
Content-Language: de-DE
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260930152416.775402466@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 30.09.2026 um 17:12 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.1.189 release.
> There are 982 patches in this series, all will be posted as a response
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
