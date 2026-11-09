Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216337;
	b=t7HHK8HelFkwDD0ndwY4zXz2wJdPIipQrDipqwcY0R5OMfG1oE9OBGXpTxEUNyfJDN+E
	 J7SSXokNnRocLoyYIG0k+gcvtRRymkR00wRqSdqgkfdDLbhuJ41zifNMOmIrDdtGhA4kS
	 AmPG0CAgbbHjSwYOUNiIVNV/xQJjAzIylFuoTHMGorvC0/iFzwEIsKHmeVE28qMpHEkM4
	 XtGZfLMScVm2r8COMZ1LgTt1fb7k2gJiXnQ6I5Sh6ulsUC/foXonVHZhYj5U4QSdncvbV
	 YKmysp2CET761T3r2XoHLOUGOA+bG/m6szpvP3JcP7ToPzqW71fsNmu/7BItjHLUwnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216337;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=qomxj4lfoPO9QXwfpSMD8HRawzKzamUyZqL9KhD7jvc=;
	b=2ltzKXFVW0bUkANi0XiUinQ8VAIsaaR8fJ3SZrkx1yQ6m0KHoPa24ro9Ep0i/mdG2B66
	 w55Dhnz8D4loFzK2G2aFKqUt4CCl9wPj/RHXHZ3HCPNt3DSXoX2vx9ajpe4cw8SS+sqBM
	 fx/RHb4W8aEIs0qBHi2HrKSSvRwlwQHBgqYgGHQFFX8dbunh3G3x+d74GRZywhNljVuGe
	 ibLLqNs/1Bz8T2NotjuNlP5jphJuCQ5ZaNed5y4bVGRjNr9s6Lql1PuC4B5SqlUOCj9vE
	 n8kSfkKzRAN11lhhsZgS97ncu/uYGeOFDhO0TKBGSexPqTyKy36gFhkjxjBHtQAlfuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=w6rz.net;
	spf=pass smtp.mailfrom=w6rz.net;
	dkim=pass header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=WaEydoSY;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7847606D801
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7847606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=WaEydoSY
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id Pu4axkOTO4vCDQLd3x5HHf; Mon, 09 Nov 2026 09:25:29 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id QLd2xvzMf0288QLd2xTXHn; Mon, 09 Nov 2026 09:25:28 +0000
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=6af19188
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=49j0FZ7RFL9ueZfULrUA:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qomxj4lfoPO9QXwfpSMD8HRawzKzamUyZqL9KhD7jvc=; b=WaEydoSY1b6VZq9hbDFHGs7Q3F
	Im0LrirtlkJ+QqFUwT/dtsFZl9wrwSvQJyzWR0Yb9qOWlNxmEfNEajzbOMognzYH7ZIyiCa2p2CEP
	UuriQ6ZyKovO1FemgRyIKe9m01hr6irwLzy9ChNrSkIFo9oZStxCsOReeGnr2cTHGSulbZMChL2NM
	ZaBU7ZWtkNEBpRylrrRfwQp+INfUMvXj9rI8EgVElXyaxOJjQvnvs4emisitz+olruyI8Sj6xsbVf
	/qw/I1/X7R2o218MMOMl7uHMzxOAge5cKVsuFtYL5i1Cv1ZDQMPLuIhLnjFZMfq4SjGsL8s+Pq5YM
	F8IGONfA==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:46368 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <re@w6rz.net>)
	id 1xQLd1-00000001PSJ-3UGa;
	Mon, 09 Nov 2026 02:25:27 -0700
Message-ID: <49dbc035-4651-42eb-b6f0-884c7a55e4d8@w6rz.net>
Date: Mon, 9 Nov 2026 01:25:26 -0800
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
Subject: Re: [PATCH 7.3 0000/1257] 7.3.4-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261107134939.434104957@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20261107134939.434104957@linuxfoundation.org>
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
X-Exim-ID: 1xQLd1-00000001PSJ-3UGa
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:46368
X-Source-Auth: re@w6rz.net
X-Email-Count: 17
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKCdEWGfzjpI4zdBqiJMexO7XLzdEo8kQxyTtH74TREIqMMFVP9h6F0Aien0dKEOd6BBmbSGWtiK/yZJ/4IZsqtqOqSpf9qcwpgt7StE/RiEaOgD0dv/
 FYk+ZyPxWxeJUXkzgYTEnsfF9i2PP36Q37opL1+WXip1ibekfzxrSzKPB+a50QKi2AH00oTSYwghA367ffs5E1b+oG/YImTfNIs=

On 11/7/26 05:38, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.3.4 release.
> There are 1257 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Mon, 09 Nov 2026 13:46:08 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.3.4-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.3.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built (with CONFIG_SCHED_CLASS_EXT=n) and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

