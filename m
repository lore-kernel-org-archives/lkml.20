Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD57E27FB37
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792391907; cv=none; b=Rn/73tIGSjSIkFJLPYo5a9pynwiMPnBdZVR2JgdbJiYelUlwF66FrIFlVVCkhJu1INUdyOb5IlwaXjHECk8L1QBc9NippHsT9S4y/fcbyAAMK6j3z0H6zKAWo+bbMvZjvQKICPXop2HjtB54Nh2pklhLBfFBo5FnUDVd7pLILVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792391907; c=relaxed/simple;
	bh=JEUNy2ucDYQjFwtEojj3Awu049HzmGVkRpeXwTauz/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJ6XxGPKd3Kckl4jbU32255nIwnR1tOAh14Dhd4X6LZToeJHhwrij0nQBlXXsWEOaNdr6aYs8sLOlUhAeFT6+L1S71kwLcGFa6jUnela4FdjdEJm4CApFa5KyBFg7iqPn6DWrf9hHwr51JUCnCF4WsCKsRy8nVotZS7saGvueQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=oNoNlOG1; arc=none smtp.client-ip=35.89.44.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="oNoNlOG1"
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id IanOxLeYXv0ndIh0lxA9zA; Mon, 19 Oct 2026 06:38:19 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id Ih0kxzXAPFNcnIh0kxkZSI; Mon, 19 Oct 2026 06:38:18 +0000
X-Authority-Analysis: v=2.4 cv=K+UiHzWI c=1 sm=1 tr=0 ts=6ad5bada
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=B1oJnwGNuL_Lrhb_h-EA:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=c35x4WNRIcvySCmt5e6+wGfMeVwbuNLBVfgVqFu3NiE=; b=oNoNlOG18CLzdosdPdtdIEpoer
	fcXcZM1jst+9Ptwjo3ZKCILymhN3+hqb3wQHoOKST+2kSU0AZBzFR/NRFGwJa1VbAQiP0w5twIlxW
	NPCaX5XcuJHZRge4GGpHYQmmdXOfyM9+uxNM8/A5GfEsWR5bCz6xXTtFokfqfO+oTlZurVhMe3rJf
	ERTrwMIGoaTD4es/lqDSpFeDWqzggWtg37iB8XI8HRZVwyVpSs/yzCj47k1paLwqOUZmqpaDX5PJz
	wFSl8+oiXe10fdr0pzYmFiFFpEDsalkbsuDYYBMV/ExaCedkXRTdDQAJhn2z9xNZSllev/XelSlPI
	g2n1cg8A==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:56870 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <re@w6rz.net>)
	id 1xIh0j-00000002zYH-3fGe;
	Mon, 19 Oct 2026 00:38:17 -0600
Message-ID: <77174969-df1b-4515-92fc-badb2069772a@w6rz.net>
Date: Sun, 18 Oct 2026 23:38:16 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 000/869] 6.12.114-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261017160036.979869304@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20261017160036.979869304@linuxfoundation.org>
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
X-Exim-ID: 1xIh0j-00000002zYH-3fGe
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:56870
X-Source-Auth: re@w6rz.net
X-Email-Count: 57
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAhby+xlRWHEH4J7KOch6aG5qjdrQHQ6M76dkKxwWTQqv/clUMDKkGVhAiD2pBPKg7SpHQ5cIKDQD8Xr2CjTNB4lli9zV58CyN+WJwdm0MeRACUhltgl
 b7iGS2/fnkKtzKk8adlYkBqOcjq69QxGnp3hOxoUcuU2B1wM7722HIGYx3nUA1wy1+tBbPFP3yuC2fJ7nG/BP2q+ppA+4ZVgWrI=

On 10/17/26 08:47, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.114 release.
> There are 869 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Mon, 19 Oct 2026 15:59:15 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.114-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

