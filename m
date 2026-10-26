Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011322;
	b=oVe1Ok1M3FAyfpUxf/0h2zHlYlEjyNgRmlEfNJ2/Bz5hdI0n3jFuXwZfYZtS9bfkE73g
	 kB4neD7rQ+U5ZwuHxzl+6YaNuIHZHv8Cr0BBpsS4y0qE1cHBl3QfxFxXXxRdNPPu7GqTX
	 tAVXbJLr8S/E4ZTTnNCM9pcL5GNXmgfYapk03pWq9i4xk6+teng0IItT/khf8/uQTPDfJ
	 kXwXEb+lb/U4F6DzRa3esR9KwcXatYwmsL5QKrV8OfCUlfwUNRzm/w5NrV8kC5sbu0e0C
	 w5AwUwOeXukuG5kfbhbgYPfWxLcvwVtlltXOBBUblFhzKbmQ6InIkvZ3jPx7ZdtluYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011322;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=JnLd7yqZo2sTSYpeLVFfEkeSIyRs5fgheca4JBr2f7I=;
	b=Avo/n1XmjzfH6fi8QI5D8jUGVp0GI3Ttg/yEuL97dHZK/MV9SeJuUcFXlV5AzV3OUO7u
	 7bIKJ/Sdkb09FYMaRcyx0o0g3qlguCFq4mSElCzjDwp73G4BSMEC8LZFZccM5lqLCSjfG
	 VUN7gGeRaWd4Ri4x1IvFM6YVuOWj2AgzA9sqbJRLYx/n7baitC0QNkH2jEp8vuqxqy/pf
	 KgUHW9gvDx2ECKIoZ9eB1z9ocoM/V0JOrQhSJqoP2ai/P7N9LAb0sHv4PXKuKXt8Zk74j
	 fPyPjjGvwNTlD9c2TqIu+jbEHO0NBTlY7Q9tiHFSc4S1pwp8/dqxRq14hBiPNvolW5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=w6rz.net;
	spf=pass smtp.mailfrom=w6rz.net;
	dkim=pass header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=KklSbKdV;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB95606A333
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AB95606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=KklSbKdV
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id LFY5xkNGZaC0ULI9LxTFve; Mon, 26 Oct 2026 10:41:55 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id LI9KxFEcAWuAqLI9Kx0iLH; Mon, 26 Oct 2026 10:41:54 +0000
X-Authority-Analysis: v=2.4 cv=IpUecK/g c=1 sm=1 tr=0 ts=6adf2e72
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=sETsnAVlRaBVmuO7ubEA:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JnLd7yqZo2sTSYpeLVFfEkeSIyRs5fgheca4JBr2f7I=; b=KklSbKdVOT4UY0Q0PTJVczHS+C
	VO4NmsJJ8lvswvTFvnYMxJ3HDEZWagmJX/i/5sxE2aRtRaIZt35cFT9mdpSMxen7FV6taNK1PR4u4
	IZQ8elRUbhM6LzhVGPgdnsjZCzXeH+hhOAz1qJlAtvXG+FqGp34wd25Wz8/8NTY60GpBIt+v9qg2K
	UzoSmmlhrNJl/761YJ82nDwY40PEeEg92Xbos+tcUqtPSYrwLwOUdTo/rslYkm6aGmMZW6JII7ae9
	ssr+UwyI51tGOf39qEDzEsKMT83xHQVlsbsstpRbEYINH16p2AX7CrupW1Z2CJjhUn3Dk+qYOR0fa
	3+vjfj9A==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:41948 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <re@w6rz.net>)
	id 1xLI9J-00000002HCg-31Jq;
	Mon, 26 Oct 2026 04:41:53 -0600
Message-ID: <0df16df8-f20c-4bed-a4f4-3fd9eabe090d@w6rz.net>
Date: Mon, 26 Oct 2026 03:41:51 -0700
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
Subject: Re: [PATCH 7.2 000/231] 7.2.13-rc3 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261025125805.309934791@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20261025125805.309934791@linuxfoundation.org>
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
X-Exim-ID: 1xLI9J-00000002HCg-31Jq
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:41948
X-Source-Auth: re@w6rz.net
X-Email-Count: 17
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFZVYeLLYH0FZWuO3hnIr50K71t/fLTAX+eeEhh2XGUYcL7FPAdDCURMoi9DbBoWKlb4P65EO0D9l5Adu4i4M/1vk+CbrTwTiXe7ZTioOCNuLmHfeqrP
 qs4e7B5zU3tDzeCIkE7jylFYOKuV3sjFWHlNbpBAszNkX5hETdvY905fp6kiBbhEZX7i+qTgb1srTgqnBZQy9vposfOy2vVjsvo=

On 10/25/26 05:58, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.13 release.
> There are 231 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Tue, 27 Oct 2026 12:57:40 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.13-rc3.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.2.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

