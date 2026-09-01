Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1047E414DCA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788281197; cv=none; b=g1wI8LbehyHQnoirX8/3b0qnC186xe9AXVznH97kVSr+yF4bg3P4ZI9X7gswf5QuFHKoa59HdKurtBFRE5OzWAdwyScPmLTQuv4sCm1exuEt8Oi7Hao/gyA7Ji59Gk1NcXVyTlADiIkUGnOO+YUFeGdMezNom0dDRivDFZdHK0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788281197; c=relaxed/simple;
	bh=vx6IVAIfvGi2YN6wuW2bjqrtH7e+yn11t53xGem1iAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/bLiCBQeKjE+mY9wuPJC21AITpTWUkwR1V2S6z9IceKfzrNN1LeaqOLYKbzuC0loB0pWTeoLYDiqkro7KppTA4amoOhYnSN1Ok0Rdzgo9D7TbCDWss6A2je/aTWMox1sOIlbMCShCoNw9VpJzKzYg6Xe6z96NyDepiHQUZShx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NgvX+Qa2; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NgvX+Qa2"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6b1b233ca98so17043eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788281195; x=1788885995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQ+8Eg5A7HAboa6Akxc2ZyEa3pqY0HjMm6hBUa0qhPQ=;
        b=NgvX+Qa2DLcoDbMTsIEqcZq9Kiu4CrROWhj8nICP/2PJ2h6n+2ZarS/BsYh6O8tZOo
         RrkZil3RIP0J/54NjI64bOz4y723DvPgSugeMkZdK7lPD7CAsFdVjumpAiGnRnzOsPUr
         3OFQVK+yEasjpdRCxrnPRPQghNlNx+QC1teRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788281195; x=1788885995;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gQ+8Eg5A7HAboa6Akxc2ZyEa3pqY0HjMm6hBUa0qhPQ=;
        b=Z3Dm/oNy0isQYjMNv16jIN+VYvj2SX6rRw40kGmQeqmlm2zGBfbF8JdTVu/ZIGVJ/N
         HeTmk35JOrATqk1nDf6aMSzLyGrZJyY+Jwrf9sfMgi9nWgGrUcmXPCloZmToaqtv4eJO
         tcmLnyoLpyTh9STSBUVM2LBRyoeHhbMym6oya4HfmIh7bHToJde2UGcGXSktQv+fhmQy
         jB1dVU2dW+gHbiT2KXFqK/9rpKKnA+2rCyQZvQVBCsDIEqw+QNWYdLUUGqJpKXFW0RXG
         RAA93rW1tKw8Dh4RzSfS6JpskoLxW0nd3m81Hp7GvWw9exZZsGg1dJTBHORIbgOK7lgY
         spfg==
X-Forwarded-Encrypted: i=1; AHgh+RrSL3wgCASHfEDFt5mME17cX3XzOfzB1KDYHCicbsh1U6Udl1tfRdrt41hiCwDvPySXDadUe0iC/GAVP+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kkbH7tJOmPZbZ9xxFPsfVF5AMqfzvUCgyInJKptcutKDwb1oIz
	uPsRMp9EqO9+lEGy62LrLKa8cxbOBkzHU8FO00ErKg2alhAOaBDHfJci0w74yeKOzTc=
X-Gm-Gg: AR+sD10dQ2QYaiSHQTeAO+/NnaITU+gC79s6/Ps6Ur9qOZgVJqx6zey1h4CH6RMFDfG
	SMewgVuUGg/d0MNHoOfYiHdXlUa/E/n/3fPJBgmPHB284OP2bQUQAwkj12KJ0tqeGi6rbfy53eZ
	Djxf5TXZHAq6vssS8dvbL3RuAKmzL9fdODyP6ft2dx2gNsF+gi2SdgBWlCAitZ6QMZFAH/PQSZj
	9px56f6fyXYGZCBxXD15EZb/oMu8RigB2uyZbLiseQbxVQ4CVUNewoqmXEQSjj2Cc9fegHzC2MY
	dGzFfUKBjvSqzYhAtGzOlvErzbiQIpOK658n9rR2odamBDP2URF3Yrp2JS0TxM0flIGWIuA9wP2
	jVBy9ryn+VQ9FnbIE5yAsOtdL2C+D4OxjWlSwq8N9uRkliIKRYpzLvR0hzTdMKVAnX9Me9Of1xM
	DL4+hJ/yQ7mvCVK6g6smch1mxlya0XCEdbzedhw/HKabfYQYGFLrV7Gs+r5Sn23WobUv/E9E6N4
	mKfsWIr
X-Received: by 2002:a05:6820:995:b0:6b1:3cb7:f535 with SMTP id 006d021491bc7-6b1c638112fmr34990759eaf.0.1788281194736;
        Tue, 01 Sep 2026 09:46:34 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f3046b139sm221497fac.3.2026.09.01.09.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 09:46:34 -0700 (PDT)
Message-ID: <bc7fd0f4-d2ea-4d49-9b5b-ff2e04236878@linuxfoundation.org>
Date: Tue, 1 Sep 2026 10:46:28 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 00/91] 6.6.156-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260831133359.468089036@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260831133359.468089036@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/26 07:33, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.156 release.
> There are 91 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 02 Sep 2026 13:32:19 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.156-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
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
