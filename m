Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43D24B1295
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790949038; cv=none; b=b24+EnbM8kyCF5DSYHnBSASO9JsArYkb5C3q93a7SrePlgHbjJHkwU/7o/t2EvU0kTBGhKuXBOT6TYyMXFEGqrmV6kGlPJkgbTvb7f0Z5y0sPQiTOP6aMOCRc6ajwov+dt+K5c5MS/LDzPCqxrUM17Q2zYBC4vw0DBT2eMz2BvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790949038; c=relaxed/simple;
	bh=YAbhCEsj1Xow+kprODecviF0SnZgAch7eBzBEf5i7yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYOUd1ARdINgKJPbYTN95y1laYzBc/q4HvOZ63ZyuFvPUGQ1sOy55Q9AYjbrq5YdrTVyMHJD3DBOytERetUJJuvb57X6CiIhshe8Ms/i3zwWvIH8tSZg5No2PAzAOXqvEruvS9gkBXwP6g8VI4k+UQWFThYP6DC7PAIwY0WrCp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=linuxtx.org; dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b=Uc7VvP9h; arc=none smtp.client-ip=74.125.230.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b="Uc7VvP9h"
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-9178b9b7ecfso788156d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1790949036; x=1791553836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lS1VVahwxyy3uHWOK8ukiwzRDiQgwlDYS5Uok3wV7Vc=;
        b=Uc7VvP9hw+/KML86BNYTdH75zqNW0AAN7XHghFdwAfe0ffkY/4tC/3u4uFXbxXIiaB
         vYKO3I3PuS5P4944i5X8zgjUgMryhmVPp1SStJ+b2aHK3rr2ucUk2mD0tZqDnQ/fiv+R
         lgGfSN6vVBGYD6RQRdKSXefDk/beouC5XXWoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790949036; x=1791553836;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lS1VVahwxyy3uHWOK8ukiwzRDiQgwlDYS5Uok3wV7Vc=;
        b=Ab1N/zU1+3RqWVGiww0mbnn2sY/8alItarHXVCL2uE4Nw4fnB/fe7RTD1gep2qHfZj
         f3ovsq79vaCkT1B7w24YoZitSI3ybBMXgzgmQmHG5XjaNia3LfCJHlB92qzcUElEJmF5
         wbrNNFmtb6lmooubIEZlaIzfDx7SOXCPPhilNuGkpG6mf4WOetZJvbz+Cz4gfh9zuvRf
         8P0mpo/5cszWWGXEhfFiJljU4o9Ja1o1lzA1MndMjPLrw0PJfYcHCcbiVHaWyX6sZFgd
         A1GdG25wxgrSeEpoge4H1UQ1PEQMF/LCl2kxrSis7MJJvpt4cRELlf327BhkMKrIVc+v
         izEw==
X-Forwarded-Encrypted: i=1; AKwUvBypGj5gZYj9lGjGgv603MwFguMosiOgSFJFTxIM8sCzRw0Hd0wnTt41WItQnaYm3PlhqakxJ8LYlyawCpU=@vger.kernel.org
X-Gm-Message-State: AFuF++l6nOf6vw3amL4C02wlps5LoC0Lu2+58/x0AJxWoa2w18vL6mWW
	h2+g+EqIF+geh4Alzpfi8s3SsFxl4OF2P44+CSxf3IlSuHzODszioSSQLtE1RgTGtQ==
X-Gm-Gg: AYBFou37JdnblwZjVuQ3xI0anCrku7cnM6CYUZiifD6fjs3Ku/+G/G2aeIhYaPtEC6T
	6ZZpQpw8jFJyVCDUbaKfQ9mI3o4l38Rqh+w0uwRi6peT7e+89YYK9RxVpoQnoooNpM0FFrdApQB
	QukWyHRieSvhJLzv6W8MX3QfNKmH5N2z7bk4plLsJXcOfoUqag8mn4unxBtO2n2vH/bmSxywqzQ
	ee3LW/Abs86NU9MPWzEq3mC1oCBTsfzeyZZ3djR0y2MN5YF3evfIEKVFBQ8bYvXza2cLh6eTvU8
	PPvivWPFwamRpRn4qPhahSg8VWFpBaUO0pGEmjjx1pzI7Vh4pJGFaGF2ojMg8tTsd3HkLX3qyQ1
	HP0ApXDQhF4K8y4MbNiyicvQvXlf7n3X668h+IXher58m6WwbImEc6i8HLjhvRxT75//TwKX+wf
	QL6FPts40LYIH43ocN2iJMMz2jM8/szrOXkJplcT1I6X46JMtansyMS+TkvE+xy8ZGhYU8tXWw2
	zjScJHJC/5J6vtRPw==
X-Received: by 2002:ad4:5dc8:0:b0:917:8ea8:cf48 with SMTP id 6a1803df08f44-917c0023954mr55938026d6.11.1790949035586;
        Fri, 02 Oct 2026 06:50:35 -0700 (PDT)
Received: from fedora64.linuxtx.org ([98.97.107.167])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0c17b8esm19945606d6.43.2026.10.02.06.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:50:35 -0700 (PDT)
Sender: Justin Forbes <jmforbes@linuxtx.org>
Date: Fri, 2 Oct 2026 07:50:32 -0600
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
Subject: Re: [PATCH 7.2 000/457] 7.2.9-rc1 review
Message-ID: <ar-2qLGYAeke2TUl@fedora64.linuxtx.org>
References: <20260930152346.024115587@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930152346.024115587@linuxfoundation.org>

On Wed, Sep 30, 2026 at 05:21:45PM +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.9 release.
> There are 457 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 02 Oct 2026 15:23:04 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.9-rc1.gz
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
