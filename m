Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9390553E31C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791921350; cv=none; b=gTnKSBUOICkPCtYcVd0yHjop6NuaM1MMyVfB2y7SKTdiG6yNIUexsFbzZxdl6sWs0qWn+mOZyfBDVD4oGvvr9D/pTeWSP2EsHvVaUOOTCUI7LNKXWxuacB2yCgjZ1iN7Zz+DFc5mAfLrl9z+ZjqAP5dlb7WrOMRpg7WGgDQADdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791921350; c=relaxed/simple;
	bh=kHUiE5axvYANqYFGTvm2buddRW6YsS1oOZ5DJXHz0O8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gy3avJdvEM+HAyE+fKstxmHxn+VKmUa5LOPwyqQZPm0RJJ7cQm1LX+oMcWbi0lE/mvIpEMUMbVinIu8fwnj0/sZcf3kHbjJ7IpW97YftmdR0mN/UdMhgEyRCUeCZkBO1ePRtUtINp8aqqbt8OXMWQQDYoSEeCjeeV3AclRz4kaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Srdx6vqR; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Srdx6vqR"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48bbb06e746so2005965f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791921347; x=1792526147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jv8xjU6QFIXZ0JAxxYKajZr9UsaBaFM7IIOQawJA+84=;
        b=Srdx6vqROq0NVTMRrrffiLmYk3qn1XVfZ+hzBrRmtIyy84Ju+j1OGZmmyZ06cpdV+M
         QYM3lo1AwpogIHZD86EfkNZtQ1lYUBkYTXNISEhN9CwO0d7iIyp9yOZ8UZ7jJo8BrLcz
         Sz7+GXOUuz9CHpuweADeotUEevEkLpuDSewjPBCyzQwhfYzQDd627nnaYOIs9pJxUHRJ
         ejLhh5rIrTHzu2F7wFYYNtMfgUgOkIQJWaoC98BMjHBRgYeL9KjFwOp0nvg9ZmmDa3yx
         9I2dTf6bqjkKMSdOGGf9Cxk88u0ex+BgABrTt8WJIQz7AI0CHV2kaCrrHtKBuJCGA0Po
         K8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791921347; x=1792526147;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jv8xjU6QFIXZ0JAxxYKajZr9UsaBaFM7IIOQawJA+84=;
        b=f6FShujzBMYfLVJO7RbThzAatfpGaAPPJammuIXp1yZ6c0m12OGYMCXxH9QAy3Y5+O
         GpC4ydjgMGKU1oYgHMCRkf1wXyCxma8ma3G/zaoLF8qUmbFK6mFkQ05l1vTOAeZWMChI
         VzJ9kPc8LZ/lPbZBzvKQzUiOvfgQT6MDy7fnE46UjeSJwY3mz6W0mdq3vgWeutSwXxvz
         ZmOy8koDgIwkUjbnE5/0w0+II/v+Ouc8Y61KxdQJpsfWy6ykXG2GUlXnh8a2TmE6CMS9
         /FgqpvXk+k+qaTL1xMFoIk4IYjwf3dIZKJvj77Pnazp5Qt160lELY3xsuRPwk3Bi2kgw
         5o6w==
X-Forwarded-Encrypted: i=1; AKwUvBzIpY6bqRMDAYkf0SG8mGrb8LPAt5aXvPY4HlBg4vwHVbSq/wLy6kXqhza/JvRgmGwTXu6WTmPFqjZ/8Go=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwKuH7PlVaGEaM+p5X5mmPYXAtN1H/jHqz99r+VidjqN0YHZee
	+EKrzCEhD99ZplAjx+LBf81LRNsoXkGbAsZTgZnlZSP0p/7CuwBHIYs=
X-Gm-Gg: AYBFou3upMrGb7jd9uSii3R9pHaR8UOd/FS07JwJ62c7Mrm/ki4/DQNj6ULWIX/Zblx
	X3QDB2pJf7fIU3vJafeLG5fRzQ2Pm3IYghL1LKFxIgz+Lx3i/rq0MV/7xbfctyhzc/DaXkZKCEn
	5NcSldBb4WfYTOJzEWmNfTzzj/3fr0CHjXgbGY03QosM2EXHeqjQ0We+LGWGr5uWgZr4iQd4OHl
	W3cBCMD7B5ryBiY2GzjfpB7WpeoaMM/owcV/C8QANxKKfBnZeIG8VZ/GtE8PQbtlB098SEu4Oge
	GEDb3f5gA7/s9Y7zFgZpp81QihK+6Xd83+BhvZr/yUBmDuus0xImvHJYsP2LCwvaB2dgubvSNp8
	rB095tZFXOAk3kPQTy2p/jyxNR4zJJ6OD+EhHwdrKqKgyqKH2/qr/AZMLYFDkNjDuf1WWwbEVH3
	EAjhiLGL/EdmRR1ykTxgMxjA42Fbp/xVIe1lomHVYPDay7CLvOSO9NJ/J6gUfDsE+whjNDBC2En
	bm4FXfdAUu12+ztrhIDOikvt3kbrKaMtaveM/t1+wVJdOp0
X-Received: by 2002:adf:e005:0:10b0:48d:dec7:974c with SMTP id ffacd0b85a97d-48ddec797bfmr8286448f8f.7.1791921346559;
        Tue, 13 Oct 2026 12:55:46 -0700 (PDT)
Received: from [192.168.1.3] (p5b057b0e.dip0.t-ipconnect.de. [91.5.123.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac52d3sm7133340f8f.43.2026.10.13.12.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 12:55:46 -0700 (PDT)
Message-ID: <44a8e6dc-0e5d-414e-8e30-e3ea53b034a0@googlemail.com>
Date: Tue, 13 Oct 2026 21:55:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.12 000/497] 6.12.113-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261013112907.864180619@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261013112907.864180619@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 13.10.2026 um 13:32 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.12.113 release.
> There are 497 patches in this series, all will be posted as a response
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
