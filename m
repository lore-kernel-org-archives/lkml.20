Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752010;
	b=h5EHvyT1lrft5Ob0jpjgBh2P7Js9H2mAPsNSBlFLT8Mmyp3DZWTXlb2P1d/NwseOxe7P
	 L/vLTVBoPM72+twsRi3FdFjxZ2xYTpj8/ptBU/hNMDyfTAvnUlD6p7xQdFJfZzw/bLg3e
	 dukJHV/NlZSHTlbaM2fXpGo3xgIm3g7QK0X/mBIOpsWXX1uu9c0kZXciyrgS6rQ7pC3Pp
	 SqWsFqT/w57za2gf0CwNnot5dEe9iVcQFGmQJXoNMrk22fHlry7FOesiFD3DhF9TwW2/e
	 58o308JEdzlv3PIfr0TEVxu1QSjpqjN9BzDELT3L7r6gIZqq3FVSluOcZaVi/+4BkaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752010;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=0xim+q1z6hKsGOa03BvjGqO7rsl/bsEW2TceTriCWhs=;
	b=jQudaYo53NcnBubZifTB5BJpiri5af5zWw8aFmjgm42996iKoivs/qu6WbU4mqQ5BdgQ
	 YkeO6VNW6/HwJuzNGuqMP8ebyJVuIsWPjX3UreWEmZejaInF7C87TQkWVfl6GnJMPE4hZ
	 rcUllC+3oT0y+7QmdgQKjrHAyEYErGl7nxuZtVoSL5XN7CGKXDRzxUiuwcXVArSrr0F/F
	 R8hEYVjPdNbLybsceui7mJ52CWqhxnJSE/tioO6xU3IWYmY2HGk1wtJ2Dr/fme170QXNq
	 /q/WuhiWroGGxIdhdEwaD0dqc7Bno9quaM2Gw+ywy5wE0QvyPTwz6S9XQma8lPtqlNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=w6rz.net;
	spf=pass smtp.mailfrom=w6rz.net;
	dkim=pass header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=iOZau65r;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92751606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92751606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=iOZau65r
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id SYtvxN0ncVK9USaz3xqPv1; Sun, 15 Nov 2026 14:13:29 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id Saz2xCwAn0288Saz2x5JDJ; Sun, 15 Nov 2026 14:13:28 +0000
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=6af9be08
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=lrVcCulGc5HbUcuc2QIA:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0xim+q1z6hKsGOa03BvjGqO7rsl/bsEW2TceTriCWhs=; b=iOZau65rg9utc7aZzy67lPpjHG
	6Pfcd4FyUKX48RkDBWa5vcrvlgUCr/xpH8lX4bPfaaw7kWplKHUc3V65zfXlIaqWAoe3+h9hhc5ri
	pXsJVBQBtkhsB6Szw+1nVei0aobOXL74P6dFwRKp3YceqcY7rLFWmKyLNfWKMeFMJgra4ARecBHGS
	a7zkwtPs9ivQoVZKRXHNciW7GBJ4x3q8zNZ21aIK3yEhqwIhCujx2UdEgk1rcseyCgW8Rp5DOOobZ
	VK3kxYAmAPgAPgaja0hf4ErIeXJhh2OjTJmxvUhDLpAq7T4b43tEreN0of7PU8WTjoaXycYT+AJuD
	Q3zjVybg==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:39976 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <re@w6rz.net>)
	id 1xSaz1-00000003Pm7-2fd6;
	Sun, 15 Nov 2026 07:13:27 -0700
Message-ID: <0ebe7e46-ed0e-4afa-a4ca-6921a2d2fb9e@w6rz.net>
Date: Sun, 15 Nov 2026 06:13:25 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7.3 000/507] 7.3.5-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261113153753.358973689@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20261113153753.358973689@linuxfoundation.org>
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
X-Exim-ID: 1xSaz1-00000003Pm7-2fd6
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:39976
X-Source-Auth: re@w6rz.net
X-Email-Count: 17
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJmD2jJO/QyAJVa2mWb8u3WDT7EU66E8X8hOjAv8gH7csRpcjwLJEdyQysEUJtG9OHPCv9+KOBaKYRiEDazVCQfa3K4JfOcEDavo+BZ7GWEyHnrSD9h1
 4kgYaxe+Ki25nyAm+Tf4i95CA1xkPJZeXSstFX69Hf+vRvzed36uxYX0tpqONSKjWkbFPRAHZWU2apPL7Jt62JPC8Ek+JwAajZ0=

On 11/13/26 07:45, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.3.5 release.
> There are 507 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sun, 15 Nov 2026 15:36:17 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.3.5-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.3.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

