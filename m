Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540F54B53FD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269714; cv=none; b=Xvp+6fTSm2KxyBYV2+zPDeSgVL/mTGdLoZYqsNrHm+kZdnuMVdjBwWBpYNRUfRWo5YW9VpjUnQAmkYTYkncyI9plVTfxKiUlswAlFQSzzxDh/mc6rcLSxdE/U7aUIkdfuy5pzTij+Kl2y9NZSfJuAlBgecNEWRbTO5ouuOOE8ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269714; c=relaxed/simple;
	bh=Zumv4Leb5WdBFx26uMvOk1o3BDLM1XnvsCTFYNNDQrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6r+RBjt4x/LEEswId/eQ8X/rMd0Al7Py9UzNpDsayGBWbjRuRtjWkj8OiX8R6sgScVlyJsMY8j34yFPxmgbGXTPzZlz6TzJSVYtRrYPShB797nqQgZ1s4IJtRdAtdGRYSYDdPdk/ENN2Bo7A7es/Y7GLcIvWI6wmYcXFsahs+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=linuxtx.org; dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b=Aj+unuvX; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b="Aj+unuvX"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93bfd70b08cso1016185a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1790269710; x=1790874510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h/hfVHJxL5+LrP04774kzPI4k7pmHvdsjzWtlUjUHhI=;
        b=Aj+unuvXfqotlTSyKfesoZfSPLSaP37qAv+XfIxx5tEXzvq+YCiTEIqHOxjNa6gGZk
         1gHBNTDXgA5OFjo+TOYcV8z2gDmGEMv8dLh45b+nxO9FRl3BwhTUTqdco5+H6j4S1tpA
         NkqLo4rmlvlHasAcHxOwaTbpiTO3c8YtMUTu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790269710; x=1790874510;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/hfVHJxL5+LrP04774kzPI4k7pmHvdsjzWtlUjUHhI=;
        b=wwNIu9XF0VcOxKGv7XRKXNJgJ5jYJkAGaceeZ8Gd7YkulfvXG2o1OGmZV9ltb3/Klx
         EEqkhuYJGeR1yaK6aIrWJeSm8qCB8+HDaEC/oZeX3aHAIk1xY0/pQdbAA/KvNLV80SWJ
         zSC27kw9ayS6WY2fK6pHxbVp1DkGCpJeTF6e3z/KWSq1CLovvXMsyQmJGkd6mvSdQwDf
         jlZ/DbuYJ7VDWXvy2w6X6cyeTwR/fXmsvOesbjdHCokzV1i05lekO/P+wFSeRDYK6hBt
         CfrVrQAXh+HaIASl8QgNr84qRPS3JAf90yT6lHN4g15oU0fkP4GYn9jAFch13B5ty/Vr
         si/w==
X-Forwarded-Encrypted: i=1; AKwUvBwml0Z1aArCOLGEhsd9C/WDTP+ykAB7FuA4odChjw1mR6WMJRCSA+BfF1U30RXhXz6n2wdpjILAE+c2AW0=@vger.kernel.org
X-Gm-Message-State: AFuF++mbPXJRWP2WKRNTp4VR8aAVpRUtLfv5cSUHEOiEks2bw/NJ0deq
	7u4XNTtSq/9D46hCZAf1ORIng1oyP+3vikw2F01JMa38hywRZTWS5o2YV53lceJ6Ew==
X-Gm-Gg: AYBFou3LN6lEW8jyVMO/92nQQ4xNpy7piN8wPV2+5hOyRqw9sY9//3Fss/1KLn0iTgd
	iNCEJDnCu0iaW7OWx4ngyAtlf+97qd7OVZxH+HUvul7ReK1P1pvd9Tla10+vjzasxgrdrX9M82P
	XCyxy6++7fzjKZfvp7GQUdlkH9LGLcoUDnAvv5mKS+qIfd5SXAxuamoDROTtDdYrT+EcTDcyref
	LikFCxvtUsVoQc4QB1u/6QEqgaRsNBO8BRl022EEGTQbkPH6qs5GIvC/wagNXwP1Zou4NPDy4Ot
	Oqsf3Wg71zBxWQw6yduVY3wQG3zVx/bIAzWDBVBeSaRyiYcsOBTqqbWzhIOKRlYBUlL51wD0BRt
	G6A6MadB/n4/MWGHs+QAXnfd5hmUrMALFiIFmou0boFj/rlNHHxzUCf+Mi8brzaSY4s12976REo
	M9eFuIODdLVKII+Yt5p/r72xe61G6o6Rwac/ZYLqpvZKOhayvZHCjeUaV/TkYFpt5weAPXflXvE
	IecEbdfGB/V9lJU
X-Received: by 2002:a05:620a:2a0a:b0:932:ddff:1241 with SMTP id af79cd13be357-93c362bf196mr376026485a.26.1790269710150;
        Thu, 24 Sep 2026 10:08:30 -0700 (PDT)
Received: from fedora64.linuxtx.org ([98.97.105.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c3376863asm243434585a.15.2026.09.24.10.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:08:29 -0700 (PDT)
Sender: Justin Forbes <jmforbes@linuxtx.org>
Date: Thu, 24 Sep 2026 11:08:26 -0600
From: Justin Forbes <jforbes@fedoraproject.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org,
	pavel@nabladev.com, jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
	sr@sladewatkins.com
Subject: Re: [PATCH 7.2 000/438] 7.2.8-rc1 review
Message-ID: <arVZCmjZxn9Paksd@fedora64.linuxtx.org>
References: <20260923140644.756254324@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923140644.756254324@linuxfoundation.org>

On Wed, Sep 23, 2026 at 04:00:21PM +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.8 release.
> There are 438 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 25 Sep 2026 14:05:46 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.8-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.2.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

Tested rc1 against the Fedora build system (aarch64, ppc64le, s390x,
x86_64), and boot tested x86_64. No regressions noted.

Tested-by: Justin M. Forbes <jforbes@fedoraproject.org>
