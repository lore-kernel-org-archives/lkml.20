Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391B847F2E3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790809026; cv=none; b=D042LfekQd4ZFIts/a2lpw3OwQIFaAe57p8pTeMTbGxFZZ1i60R0ZMReZ+zxNZ2q1DJJwjuZ0XkmebWeQCI3usCnd1wme1FYor3816D4Biz/DFCcsxE/IUGlYvaTKTUBFSeivsXAW9ZFsDvlYl8xOOQuprty4R8W4jFW+GEJMW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790809026; c=relaxed/simple;
	bh=Hke2G+4Wij2r2NahZT9DM+vUuFtMN323JUACpTjNzGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rS42rIOoaV8yOwLEj8uqJnpxOUS/5CiIrlNreFgEk6wvoveeRfKoTS4FtPOfeSeqjEdc8IjNmkixL7V5lmkqR5YYJ+brW6zwcEFx874TkcMFH2F4xtYtp8O/z94qJHgJx2mtiaxRcolPriO9W9d8QK4Y1/GsB+avMR2osV4MVqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=D92YSpCu; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="D92YSpCu"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so37732405e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1790809019; x=1791413819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lBtOSawkeFkXP42NM1qSxi/aAPisSJdBIxTS7Qmx0XQ=;
        b=D92YSpCueqj9+rmxrOFHIcZ6rUQxdBrcGnCjtgJlKS76lQGCLi5Na1wyPoteJJ/4WB
         u+wrSyCRKJVKX1sT+WJfi4qeXnw3mX3eYVC6gzaQH9uclZ7Azc9BpRp464rmaOJL5vvM
         DZVYz5hOdOPKrVz6B8erJQj84q+QkwAWgiYjlPUjqZscfYpVhdus1kjxSYvSVkwkrOQ/
         80b+34HDtur7JIxQibcWtesnRcxuERqpUIG22RP4IJ/o2lWWmGurX03m+vkecINGnFL4
         EbIXUKdHU5V3eyJ+/eAcxScH3VpSADcGC6j0Yg0MhJSKfMEebIarqrppV7i0Vw/r7QG+
         n1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790809019; x=1791413819;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lBtOSawkeFkXP42NM1qSxi/aAPisSJdBIxTS7Qmx0XQ=;
        b=SB722UE/O+cMdsqtX/lbqTPzyhAW/uu0dT3XZ1AGR7lWImFSKTiwLavo36UJ9BDeRk
         BIl9Nzk7hqAag+mfhdCPtZzKrco9Y0PsjWPEYVI0aHBPn0XnI2MzdF+ZVWQyMQ34EDzD
         SBwVjZAwOvhIkNc4B827ScrzHyXfRFSV7twOVRRqXVfCbKfTBIZN2A13/CpUG+IO4Q2V
         DbLaN8DNQ9d5iq4SM8mfFZv5UTDP8kIgv/9J7fopP8/YOB9Ur7LHzGTwdlsF5y2Jm7qy
         rSppE2g8F/RfGOxYf2BnLFqgB2ayg+YL/hPMxOmNJqlkrTe3Q5NY3ozCV053C1Ks7lX7
         q6Dw==
X-Forwarded-Encrypted: i=1; AKwUvBwZcHtbHzfAdHLX3fIKfweMcKLLE3Ihjf1RcDNtkl0zcFdo74IAy4kTkQUfQcl9je5plYtWApTrYp7J9us=@vger.kernel.org
X-Gm-Message-State: AFuF++lWAEoXA5uqt9qQt9T3lsUQlmUDnmNCy76lPpF4PQdmjC6vxRJO
	Y8sheWrGaRHBwyAcKq0Moub7sSI5sT+t/v0yPOuXmo7yvojgJEPGXi0=
X-Gm-Gg: AYBFou1bVKtHSXlqYC1wJC284ExNl8MNzd0B4/B2e9/ISBbopLjLMKMG+pEk/prDYuv
	90KA/n/c4o7D4NlKZeDGtmqzrU0v90SeVxUF/jidTdikBPt/1RrT71wzwlUCqi9a8wSpWtqpG/6
	MuqcEMTKET3Dtw183JMdFxSXL5u9xUw3PbSoLCb5VX9Jem6AZa8FjqQDA3ejPRlhGBwzKwFC9nz
	OENX2HHpfvPV6/V6TF31QTYnLN7xV8yol+6PYWNk+FzQuKML0UH6qv4X3GU7yv0a77TSKkd9oId
	DHXBd5ILbEFcVhOYzgHPwWijdNbzyDHC6MucnGa/CV1ev8WzjsOuY5yq2gqpH4ae30KZ7TFRosd
	VHAR5hmUDwdFiC8tvQbLpajk38SM/V2atO/4E6TyTduDKujctpEfWynTgvE18oKz6WGgm2wyOKO
	KwwL+EY/ErMJzCOcQQcrq+FStNKwNod1zNFJe6EG43vJrbD3J+HTCGk+bOvjJg5/KZnPfMNdScJ
	4gx17fc2FVr35pzlGGQmqoL5/gA9Kbv78dJi+tooygoQPyDiw==
X-Received: by 2002:a05:600c:628b:b0:49d:1cc7:5ec3 with SMTP id 5b1f17b1804b1-4a01afe7ed5mr45606825e9.9.1790809019416;
        Wed, 30 Sep 2026 15:56:59 -0700 (PDT)
Received: from [192.168.1.3] (p5b057568.dip0.t-ipconnect.de. [91.5.117.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f922ac4sm16784975e9.6.2026.09.30.15.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 15:56:59 -0700 (PDT)
Message-ID: <d3f4f4bf-9839-45f6-a3fd-e8b0062ad032@googlemail.com>
Date: Thu, 1 Oct 2026 00:56:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 7.2 000/457] 7.2.9-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260930152346.024115587@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260930152346.024115587@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 30.09.2026 um 17:21 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 7.2.9 release.
> There are 457 patches in this series, all will be posted as a response
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
