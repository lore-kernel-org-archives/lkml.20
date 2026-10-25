Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792888635;
	b=fADTBf8Po5CIIkMSW5OlCsCj1FPgVjxOtYNmGRy7g+viGoF/LBfgTrEBBuMQDR62EVGN
	 HlxCo2tLsLBfL6Ve5OpHDvNLEy4p1UF3m5pe0QRA/vk8GYu5dc6NXVJ1ABiSB8gFH/G4B
	 +KCPuD80U5qNPZb82ew+tzqSzzz4JxNk5BK2si6n2A1AJZj8FCGUUP8J4Hf3ILRUhlpGq
	 AoN+8ZUYsc8a/zI/9bt3YFLll9G8YnQX3dVm855qmtlKe1gRVA9gG5D1EUKDHjs8KR/04
	 6Zs+atGwYI6zNpWChJrhQe0dJmWXnXdwF4V7+qHXX6gcneGNYXhZDnSBIuwRoJsJ30w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792888635;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=y0J6f+7fz9qiuM+nKAPfCcyE4UpIjVqLueVjidOj29M=;
	b=mEk/lA6H05D7P2Xzm7iqUO6y4+MBBJWjKNqzjcsqLZ6xAGKYqY4va5K5qphZK7MgF6Cb
	 WMUdGMH4JvLdKNhoRUtKWPwexjucmJ23jodHh0NHO+UwYkmJ437gdZ0cFrIyUutxWC6vQ
	 00XmYkjBGS9DpB9hEKYoYyAsnCmmE1hx/wyDOZCqZ+fjCZ7T5Joyuj3XIk84C+rcySSV1
	 pP6ZN4q+K/GKn3y/ZOOIrgiKf2ASQvuJvRXpm7biSI1NcvH1Z0aC/EYR3j93Ivqq0aB8l
	 9zaJRN4daOck9DMhkV2CqZVzHoM9nSx1bcbn3fHvCX7kAnyW4gqq0aRcHtTNyUp1J0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=w6rz.net;
	spf=pass smtp.mailfrom=w6rz.net;
	dkim=pass header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=l7Pi0M1o;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE439606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 00:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE439606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=l7Pi0M1o
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id KOF2xcm9PaC0UKmEWxKHQe; Sun, 25 Oct 2026 00:37:08 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id KmEVxOpPdFB8dKmEVxCfng; Sun, 25 Oct 2026 00:37:08 +0000
X-Authority-Analysis: v=2.4 cv=HcoUTjE8 c=1 sm=1 tr=0 ts=6add4f34
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=6m-s6s55t6cD9z_nMwYA:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y0J6f+7fz9qiuM+nKAPfCcyE4UpIjVqLueVjidOj29M=; b=l7Pi0M1o1eL5xp7giHgphqSqqV
	IDdfjo8e29J0r8hNPso6l3gU6U2S9y7CCWwXpyXegh29BpA/paBbRiiFVl2lMRHbRR6xLoWBaZHKZ
	6fe9UyDCupD0Q5xSrWhCK9RDPUZrb8C0bZIoA3Oqnw7hBBJvPEbUL0zI6sjByVhXaSTRVWx1Z33ZV
	VeZ2gEx55XQ7kpK+H9kVcWwTmSzDCfkCcYzVmYM8Ca5aAIiCshHjMOu2QCHTUYCev/WW10yXfyhjK
	s1hgCaOW56+MHGwptoiZAiA6r+Zy8lagcvQEq1IdCS7ITPNqSV+7qFKwjV+souGcinARnuEwTD1Ch
	mf0ngrCg==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:51622 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <re@w6rz.net>)
	id 1xKmEU-00000003BgT-3Vzq;
	Sat, 24 Oct 2026 18:37:06 -0600
Message-ID: <f6d268fa-e8e4-462c-86ff-58c0eacbea5b@w6rz.net>
Date: Sat, 24 Oct 2026 17:37:05 -0700
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
Subject: Re: [PATCH 6.18 000/193] 6.18.59-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261023163714.201276352@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20261023163714.201276352@linuxfoundation.org>
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
X-Exim-ID: 1xKmEU-00000003BgT-3Vzq
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:51622
X-Source-Auth: re@w6rz.net
X-Email-Count: 37
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIqI4sb19AyiBUaq71V3mUsqYKWvGatJ/x5RLimXcbx09fMZARHP+R5cYbx6LYbZlp1JqGx0nLwLBZrARtLZ4nWJ1FUpEdjQzTYfApswtF5fX5fxrMag
 onnEbJ2uD91TJTXw/eoiuLwxuvdE2BCGAu/RZ15ouLccFRN/CP/d7YtvrUcW1UJFugmKUL2uhmexLPSvDsWYamdwzDwmfClbcU0=

On 10/23/26 09:34, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.59 release.
> There are 193 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sun, 25 Oct 2026 16:36:50 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.59-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.18.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

