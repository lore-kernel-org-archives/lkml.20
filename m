Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF845472530
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 22:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788303589; cv=none; b=TEg4g7CIBISW+idzgp1GE/IHlLQHBL4+lLMCm4QeCLL9sH83JMQ12M/R4Dvtb5KUbEylWIYDAHNbzWqlhRBy7JwQtwMQ37ho6FyDynDFLFvj96KbCVEwSg7K1YDSC1GxFylq0+o9sF4y270AkpYdu3Wh9RqvInDamWLxS1Dn+I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788303589; c=relaxed/simple;
	bh=4GMS+/yBL/lJXcjtveSASb4XRsIUTAywoH0nVOmZOp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q6Lelf06hyTSbRFeSyAM9fgpswO/3yhpiSId/xxD4xopUkhrPacMDcPAMSmtmTboBUVAjNiWPqF1vwntx5LeIStBkBEwLOHW3vamogXJ6WQ8ae96igdVsd6+nTtW5OtUsZqqLy2scEQ/WTurWKaA5HsYyYNcIM8hs08Wxr1m34o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=AWic3lz7; arc=none smtp.client-ip=35.89.44.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="AWic3lz7"
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id 1TQnx5aXhusRS1XSFxjl1s; Tue, 01 Sep 2026 22:59:47 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id 1XSExweZkadLA1XSExQbDo; Tue, 01 Sep 2026 22:59:47 +0000
X-Authority-Analysis: v=2.4 cv=Aqzu3P9P c=1 sm=1 tr=0 ts=6a9758e3
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=y2ERv7ko0hlTFnYyMTsA:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iXNZetiU/q/ap1rhP6NZk7Y9tyvDwvMyrxKwCTccJGg=; b=AWic3lz754FRJknq3+4zE9j3DF
	roUgnU59DKSA8FerByaELF35WjLoeuH41PAnhUI7GbclPMDVD6lISXjhdty1PdgAgjEtJo3Oq2cQs
	Jcr2Ni9IMYxKSVMpQY3wfId4goAFzRysamnRuXMMycTEOXyfbbPwK89dHa15siZ8ohND0F11iTwLb
	YmXLaNo0tVuulFFIwHTlePRVRO4fnDxh92dAhPiBHGSkQiiYbYa909eSJyZwYJxDyF/3WFE1EETak
	8um03KaG7OPSN+ff+l28tOgqADc7etH95pE7+iOxP8S9mGgPApKOPpcVzoAY2uqKs4Apajr2vxZRC
	FvR5nPpw==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:52242 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.5)
	(envelope-from <re@w6rz.net>)
	id 1x1XSD-00000002ANl-491M;
	Tue, 01 Sep 2026 16:59:46 -0600
Message-ID: <77ea1387-4712-4289-a1a8-d2d849884908@w6rz.net>
Date: Tue, 1 Sep 2026 15:59:44 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7.1 00/76] 7.1.13-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260831133359.185608553@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20260831133359.185608553@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.162.206.103
X-Source-L: No
X-Exim-ID: 1x1XSD-00000002ANl-491M
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:52242
X-Source-Auth: re@w6rz.net
X-Email-Count: 37
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBcrGtkUg8/F8ICxrFrok20ybanGf+9h0Pwx5J/DzfcHby7lMcdzqRELUqu9iDlLMgzWai3nVIp1SQ1f3Ah8UtGRq2fyt1VNtxuB9PBc/WmVnJCwOS3z
 zIZ/N/Y2APdYj3COA/s9C3wXC5pTk1Ow8DZoaLL1PxMZzbOgFMRoKQFEjt5b5WPR0h40B/k2IwAShwnY4iCMDulD50HEGkGdnoA=

On 8/31/26 06:33, Greg Kroah-Hartman wrote:
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

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

