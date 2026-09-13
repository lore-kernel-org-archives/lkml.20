Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7C6296BD3
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789340908; cv=none; b=Vqw+6VtZ+3kePxu57kSHN4Cqz4lUXasBMyCoIA3dUsfJYcc4LzsDth2XzqgheurU7C1EqXYUIxGGHgrcM/BIovgXDcFrTy9OEA0OZstB9+l7Nd3LdnuGJ0kTdRyb+24Y5KR5enFD5dgpNarLnVMi5GeuPqGWpJfFNgFqohZLo5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789340908; c=relaxed/simple;
	bh=JXgNPJjU5kG/MXiqV5bI+ezcqPEx0Pz7C3BlJsgAwcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jH2wduTSXKdYLZBJWieoGmzmhTzB1/Jod0yJ6nzOYIEMWNOutYUAsl0NtQ7TzC/Pq99KkPMsbMdIOSAB8YTeAp/DiFT+QIAvlwvYh65OukibQ2bpt13nT8GGwvZK4WLBj/JHhDcDK+2slW9emA6eEA5iMFH3V/n2stIMEFZ/goE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=q7nDpKUB; arc=none smtp.client-ip=35.89.44.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="q7nDpKUB"
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id 5RhWxDJ9hc3Xs5tJCxsc1W; Sun, 13 Sep 2026 23:08:26 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id 5tJBxps8bfDqY5tJBxfJWH; Sun, 13 Sep 2026 23:08:26 +0000
X-Authority-Analysis: v=2.4 cv=HKbDFptv c=1 sm=1 tr=0 ts=6aa72cea
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=Y4NyFCxO9-uqU50Sy_0A:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GOd6y96kVrE/9kYqh/fJpM4z/XyMm6/LN6OwNgEuHuQ=; b=q7nDpKUBVpPNZJDAYZ2PiTEVgr
	FzOMQI21g8AzWP8H+WfUu9KV2AKZxIaGXDh2Jf7dgEnGRqU0IFTyUJ13N5YC3tpl9gQvECMo5CiAr
	Fkbg0F/hXJsDj4YghqP5vvBOaIlnNUZJhAaOD5EnbCYBAlrmc3xMPUtG4CS6ZZYDWMyRel/IriRuu
	vt55uNu3wqFHGWZKhLW32p2eR/CTkYiVXnU/QwejLDfdH+ZCS6NWt7GqvJSmUzOnde9cXaVSr+dLk
	LTaISmSvL+rYaCUkpVLn62a7WdNwWAhK6gfo3IOvouptsexB1s60xpkBSg91xP0kTuDaHahb/YsZP
	g21J7zZw==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:53188 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100)
	(envelope-from <re@w6rz.net>)
	id 1x5tJA-00000002Lve-3qgE;
	Sun, 13 Sep 2026 17:08:24 -0600
Message-ID: <09a8c5d7-9712-4d09-82e5-84b7bd78a9c2@w6rz.net>
Date: Sun, 13 Sep 2026 16:08:23 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 0000/1424] 6.6.157-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260912065607.279695368@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20260912065607.279695368@linuxfoundation.org>
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
X-Exim-ID: 1x5tJA-00000002Lve-3qgE
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:53188
X-Source-Auth: re@w6rz.net
X-Email-Count: 37
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDqxhniPMYxVbZd9KCFSa0yo+pvrj4Sd9M9tyczrivuekRiXFTpf8fROQPsyA/GdusELHcg36COnAheroRENTZ41OpToZcVgl4JNl42ZNJbIr0HZdcem
 FwbyRKdn1C9q0/LTCNCn+NKQgMWP6OrHHIB7i7v54t+EiK0ExPleHoZiQJs31XLC1SWcB99+jI0CEdkIu10ftOF16zrQJwtxyWQ=

On 9/11/26 23:40, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.157 release.
> There are 1424 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Mon, 14 Sep 2026 06:54:17 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.157-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

