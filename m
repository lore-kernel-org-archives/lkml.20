Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2518E35E1C5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314167; cv=none; b=R5cUkWzeHsXo6i2QNnfZGns8sR9IdeQ8qL+QZm/lkcYFhrkHD5hy8ZLMPQQD8JXsfT+BNWh6U7KD2lIcdG1XHUb1MoFeCbwRgwe74sZQ4Ce0JkHI2BnnPlWsc/lJ21z8HULs8T6mY0b4XANy7E5lNjbIeDm75uuE7FRA40UX3JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314167; c=relaxed/simple;
	bh=BLFYJfElxSI06RtEtw8byJqBKIWSSSLCxfBzKw7BQVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFBlEs25Yi0DieAdEdFtrCuFMKpb0ld2JoG0sRmUy3cP5BRAzQcoBupemnboCZCzcZqnjzt+YaF7L44x8dZl3IfRtXAktxBZ8ndDHnQ09PGSPxAbMSs6K4o8Y0Icfqn6xlWR9+4qsdN6tDaBj+jijip1HeSJil6rx4oyGB3a+vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=linuxtx.org; dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b=e1mI8kXb; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b="e1mI8kXb"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5301db51586so5779061cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 18:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1788314158; x=1788918958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kpF3RtJ2s86zgT91pBwtMVnJoKBYW+etBqjKLDzF/lU=;
        b=e1mI8kXbaDBK4WG+5SyHGhGZHsgd3BQ7XzrpkgB6H6S6AHFs8Rw/pCrOUfCZf+27oo
         awbtnCPdcK6+zuM1wEIY03qMOfZeiEApR0vPcOfrc/bfByBwW/YpQ+1J2kNvHvjquhPB
         ee0AUDUScYc6Oo61MZznnmEwC6MR1BIqOX4WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788314158; x=1788918958;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpF3RtJ2s86zgT91pBwtMVnJoKBYW+etBqjKLDzF/lU=;
        b=XdddgBXLqwC9GI8x7au5EDHbhsDrVkSstFF8E9E6J8PKz3FTDD16VdNvL32ZeYOi2g
         x39qQLNxHPCFmQ1Vqc9yMyujb281EyO40M28jr87YLx1zW7yjGeoziy9DpzRWqGAK1G2
         MRw4qD5hje3UBZegetedoomxx9Udk339X+NMEnEJRF21xstLpmVFx5Y4EuqkTwFYea/h
         s5InF43DJ6i7PW7u2VAggj/9q+P6db9FF4FR4aCryBvsberzI0FzHw/Az7ZXl9gTkKJx
         ZzLop4e+lKgm3HVr0X88xmd3f7bKXj5NOV6sqjoofH49kNaug1oYBWoqmGSZ1YLdFmQC
         QIvA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0xrCr8ymocYYJw7bXU5OhQ8dvgwaYwEnKWGuqZWGXVtZGRUKyfKpVcRQ6Kki5u4Mw79Pug4aXbwQ7/1M=@vger.kernel.org
X-Gm-Message-State: AFuF++nZGTrxWHJWYqIWQr6qqRz6aZBifkunfI914YZ6Qwhxe9Rf8G5f
	0peJpaMQzqD6dxK6S5uUN1f78i6XiR5EHtT5P4OZShPN/OdzHHo4t3MkDYJManhCbg==
X-Gm-Gg: AR+sD11PKYZ4l6bwy3KJ689xFtJVWWIvKHi5hSFtaVntRv0QYmw8O2gHTr6/Kk5045O
	FZMYeeD38davLIFr7LEwaNkbpUOAcrEXS1weUJ7beLC2zJM9k0Sbh3g3Mg84EhxJmxEwyjWnfGn
	cRwiNDqVkDj2003ofYRTsn0334G0hUx0okJVI49iiUILGlRHdMXJyx50uzEi0qV783DscKstgPu
	LP9Z/UDIdCXRL2i/VD5kObqeaUKa7Ph4wtVlNfdVHSmtLviLMtFML0kfGB1OqNgXvIbRdljN7w5
	vmRkgucxbfx+38R+cQ3URJlSYi2l8ilB5r7LnZu35/4thocKjgteTWRE9Ug+BnOQt9TYXB+6UeQ
	dp5Og2lFshGgc1UKnW/LwN3BHk4iVSOxjjRoAYBgYYPjhi2VM+m3ff9NY81Z6LVdfs2zdhGDke/
	WLIbl5ZJhYhyvS26ti/jnk94Gnf+91MnyTgcNppapnQV0JliQdZVIgi70ltGnLPyvGAlGCAEuBZ
	bqVIA==
X-Received: by 2002:a05:622a:1b2a:b0:530:15f1:b16c with SMTP id d75a77b69052e-5303699f76amr16580421cf.0.1788314157512;
        Tue, 01 Sep 2026 18:55:57 -0700 (PDT)
Received: from fedora64.linuxtx.org ([98.97.106.144])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec848dsm7240066d6.28.2026.09.01.18.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:55:56 -0700 (PDT)
Sender: Justin Forbes <jmforbes@linuxtx.org>
Date: Tue, 1 Sep 2026 19:55:53 -0600
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
Subject: Re: [PATCH 7.1 00/76] 7.1.13-rc1 review
Message-ID: <apeCKeB4TxAWlTDI@fedora64.linuxtx.org>
References: <20260831133359.185608553@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831133359.185608553@linuxfoundation.org>

On Mon, Aug 31, 2026 at 03:33:32PM +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.1.13 release.
> There are 76 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 02 Sep 2026 13:32:19 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.1.13-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.1.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

Tested rc1 against the Fedora build system (aarch64, ppc64le, s390x,
x86_64), and boot tested x86_64. No regressions noted.

Tested-by: Justin M. Forbes <jforbes@fedoraproject.org>
