Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7384248867
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041208; cv=none; b=RTGU3z9He7d0GQ554WyEDBvP7veN5SyW8hGw4BsvXFLIowcktS7yGRcMZrMCoxmQtQIWv6AH0nrIWj5v6nvKoetqZyK5gAIJqVY3q5cDhOusHBvmSSisE16ckUYrPjKb7YFLZ9AOd6hSNltU9i4jUHyZKKxyOPKW/vy0OJo0Bdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041208; c=relaxed/simple;
	bh=yqdzkrKwOahaiTcGKgeDVkF+BPZ7AmMWsmMxrv7iTCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IjIdgcoB2im1vSenue/4o2B+hdA4fi77BDpN+K1R2AlkCFhwsKgZmZdhcxj3vRat04XLmouNV33PsklFbpwuFQo4hgkgmlWPkjUFlC54jq+iddBAjB9iXdRpWtLuWRGCgPOqd4+DgBzpbJKWzIHbMT4CtAqxV7BY2Ll0pUQ8SAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=qzZle15k; arc=none smtp.client-ip=35.89.44.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="qzZle15k"
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id H16Bxw4C3usRSHDmRxPSKg; Thu, 15 Oct 2026 05:13:27 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id HDmQx8fHdP7wgHDmQxIYRL; Thu, 15 Oct 2026 05:13:27 +0000
X-Authority-Analysis: v=2.4 cv=NMzV+16g c=1 sm=1 tr=0 ts=6ad060f7
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=_kS_R5bZiuQTXeyLJeIA:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TU8hl+7D0yVGu76FCyz6FFxbF7cNfmmKTlk5p+T+FSQ=; b=qzZle15kCOf/grhvr8MP/SS2yw
	//c9J1c6iBGarHr3MjDwb34pj3OgZWbQzZPjLIs2pnAtH8adNrOUzpTWbI5TG2Qyd59Y3eL3vV/2x
	EAVdC7AGgRkdKBy9dKbteX9D1xDfhAOQZGmLbu057mBmHXvLVGai2pv84RenMT4myk89K9/LRmeag
	vUcaglptmLy8SrAduAqrUZBAywQ6HvfS7IjNqU9oRJmNoJcvoVjhY0iPUFjHglYzSVXIRgBim7hQ1
	66XuOdGsuNceOh14jTizZyyqcmVRa6gFSQRLKsHKKFgtKJ1AhJwMTp9ZzlYBohZgn4eQHquRHets+
	r5cLUumg==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:36386 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <re@w6rz.net>)
	id 1xHDmP-00000001Il2-2sHb;
	Wed, 14 Oct 2026 23:13:25 -0600
Message-ID: <c6527d57-5c62-4209-88db-fd577c7c810e@w6rz.net>
Date: Wed, 14 Oct 2026 22:13:23 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 000/505] 6.12.113-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261014123803.944920639@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20261014123803.944920639@linuxfoundation.org>
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
X-Exim-ID: 1xHDmP-00000001Il2-2sHb
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:36386
X-Source-Auth: re@w6rz.net
X-Email-Count: 37
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfO8iwCbWyHMRozjrVuQukik831+fZWCpUzNaTqhaGg064d1whPaujjPCLFQ+t+g4QdYaYV2jlNlqa9JUDE4T2aPl3w8HgAsA4EmjdHdldDmsPcZnrHXP
 pwp/VvjrW2gJF6/4Gb4QqSthpiDOzPC88nAPs5YUJP/fSxrV1Z+3hroOJ2fPX3BlmRjmn+beZlDjCmL8XnYCcwgyWEBSLs0TGK8=

On 10/14/26 05:50, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.113 release.
> There are 505 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 16 Oct 2026 12:37:19 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.113-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

