Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAF8352C2C
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 18:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788634039; cv=none; b=fT8E241cDwtLuzs/waQUSNYjqzid8GhounT7tMf7L7lFEgKjS/hMC9v6lLgBH8v48+lvb0g9GCr6qnS2festrTGXdvgRhgq80fU+21IQurEKCD/sYx2TIvcU91XwQjCCqlFsaz49ypymkHNa4X9P/nyI40ntcCsJCcZKqhmPgBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788634039; c=relaxed/simple;
	bh=VRk6A+H/YTnYz9SG2xBYyr6COKAP3kF4D1entXahM0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qpIpXsIXQKegwWxhTNwO9Esti8yBk0A/jwDT2ismh/W6vRF4tjtFJOcrstdLaX5L/dsKfFujhCWa7lLiTAe2YZTT1vewsruIgDN6PauhXCjfTzggjSti5FBH6YX34LqyJh19jg+IaCrpKlWe0c3tw4QckXX0w9Mcu1zW1E+wOqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=3JNX43T7; arc=none smtp.client-ip=44.202.169.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="3JNX43T7"
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id 2q02xqnsCJFmF2vPzxXW2s; Sat, 05 Sep 2026 18:47:11 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id 2vPzxVKFh0FbV2vPzxtBFB; Sat, 05 Sep 2026 18:47:11 +0000
X-Authority-Analysis: v=2.4 cv=Nv7Rc9dJ c=1 sm=1 tr=0 ts=6a9c63af
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=49j0FZ7RFL9ueZfULrUA:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=R25wJDua8JL5D/hP/FoueD5gH7uOrN14uzEfeiqYA+U=; b=3JNX43T732K0IBwy+V2Mcy35ro
	4hwrZCHs865GJbnHyM92fR4FQdPgdU28pv8pMOVQ8N8r8bUxi0ocv0f6d6Sknbl6eDoJPRaX9turN
	vJsVWgD3+qfxCYryeayjnNL7iu6ns8jXZl3dz1UbvKj+VbITerCmBp9GrSwWdvKJLN7x7GZLvAwB6
	r4mM6bHukleX6vQJnfhijib4DxJdQCqWk5zLZatsnxJCPIlzPSWocwf5xKJB+dIxkf/FcZGwrXPrH
	FPHzVc8f9lEkSpmwNnNQTXGT7/sWi7+i36DqxogoLbKw4Bu8eDoCH/TixNuOfcpBdym/eFd3FzaT5
	1Kz7/z2A==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:49992 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.5)
	(envelope-from <re@w6rz.net>)
	id 1x2vPy-0000000098m-27e1;
	Sat, 05 Sep 2026 12:47:10 -0600
Message-ID: <6d25a2d5-b7b3-4f9f-b9f7-d79c45ffff41@w6rz.net>
Date: Sat, 5 Sep 2026 11:47:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 000/400] 6.12.109-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260905115627.670276262@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20260905115627.670276262@linuxfoundation.org>
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
X-Exim-ID: 1x2vPy-0000000098m-27e1
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:49992
X-Source-Auth: re@w6rz.net
X-Email-Count: 57
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDaScxtUaMvVNZsxD77U5uOhTey4McYo9qd5ujSPtu4SqWyonIpu2rgzNffluhLM+n6XSwZT/PSVK5Co+KgX93gBphQxunAlnI4Jzb69P12L5cgVKhdv
 7BUsZV62mPPgJDhAnXEA3IyPJ7pUu08aNCsr7lRiZtZFlGEj7411wkWKKl0KrybNhPL0LexeEokRgZUZL9cuExbsKATiKJq0fUc=

On 9/5/26 04:58, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.109 release.
> There are 400 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Mon, 07 Sep 2026 11:55:05 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.109-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

