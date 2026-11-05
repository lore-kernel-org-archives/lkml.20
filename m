Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888189;
	b=y2E78SnLqxzJ9/YD5BWYnh+y82Smx2rIGo/2Dp6fl2RmgvgpJ2i+m0gCJkW1a/IIx0XB
	 O6ntDUviD7iExWO7VASGnLm7LuWA+aa7XFl2TQQQKN5fl04g49szdwv0+ZZb0MQfG4S6l
	 BKnDvZgjbpOPmUa3hjMjgY9EJIKS69aATt54UtnzWEd29bWThhTBsm//XjTyw5kb5iHKX
	 WL2xqKVKFAkoW4wkySx0UKwbUJgD0I9Dm8XzuGQe1Qk9Ip/3SQFULEpEaK2omGKkw6DbD
	 9usnwYamlyVLH5Lq66u6BRpmdMboR1hh2DzjgXMoQqwcd2d8HN0XhxKocVP7Xj4KNjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888189;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=rAJsX7tX1O6eyar/UVT5L0lDjUzhUYuddF5rtYMCgtU=;
	b=yz6A1dwQPn9qHssaHKOB7z3t1ismuHfoKVdqvdw3wvBdf2hop59lpKxN0rVA/IY1nPeq
	 Gy6L4DUemE4qJsxC2AlVpyyH17mk53bjSmbJBeeIw8gtFGGDeWrt9CYPgiF5C6epZt/a/
	 a9zRSyu5BSHipQC1MhxML5QM0rFau3TvTTC1dIVAG3Kvm4Nn6CKCUurjV0NLc+Vq9edmH
	 OIvB+VMSr5cfCADd0Oe40P8UD06uKrWmVYJk54iMSmBlXowtTZzIGndsO1UG2P6xyzNTs
	 m69p2aSJ4xlawPEIy7XpY2zrGxZa5SAulgj9mCLfnL8kSlOaFmxhMYsAh7P4ZlfBESw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=w6rz.net;
	spf=pass smtp.mailfrom=w6rz.net;
	dkim=pass header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=GUAw7TB5;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2604F606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2604F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=GUAw7TB5
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id OxAWxaR8Z4vCDOyGSxezYs; Thu, 05 Nov 2026 14:16:28 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id OyGMxJKGhxqjjOyGNx2hl5; Thu, 05 Nov 2026 14:16:23 +0000
X-Authority-Analysis: v=2.4 cv=bZxrUPPB c=1 sm=1 tr=0 ts=6aec8fbc
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
	bh=rAJsX7tX1O6eyar/UVT5L0lDjUzhUYuddF5rtYMCgtU=; b=GUAw7TB5T7sbZkip1C2bDIqUHQ
	VoZfxL5dfLJeDnCOzd0k0/SJB0MmwdXUeWcGzdaRD/JIDce9S/Jf0DYRbsbrbjtX3cLlftnGko17J
	6ZgjTBe1tnS8GkpsyEFSdhBeXy1QoUVyRIqAOPhU0aP5opq4WAX08d0rhTSJ8khfYGF6BtHijorVP
	GVWQAbY/1xNSfNJGX1OVvn6qP2MMPcsdKjnaSpvUhTjz4rYZcPzpAcwdQUJxxnHmnWNgTyOGmSnXL
	VaE3xRRJ06FATMnOZv/TgaiiL6waXHcg5haAQKe+ViBKRgRbJrEPu9Io5BozYxGm3SoolMfEmjD57
	G0XnLeAg==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:33262 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <re@w6rz.net>)
	id 1xOyGL-00000000VVf-47L5;
	Thu, 05 Nov 2026 07:16:22 -0700
Message-ID: <788c2383-1bbe-48a2-b667-226e311bf8ca@w6rz.net>
Date: Thu, 5 Nov 2026 06:16:20 -0800
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
Subject: Re: [PATCH 7.3 000/547] 7.3.2-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261104211038.406938024@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20261104211038.406938024@linuxfoundation.org>
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
X-Exim-ID: 1xOyGL-00000000VVf-47L5
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:33262
X-Source-Auth: re@w6rz.net
X-Email-Count: 17
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfG+ERCAP0Qip5X7jasti3Da19NCrssI62YlK7rgetrbm7CIi1pakOWGtsc02xsTBjhb/9y19vqqDcAZBfHTwNabZF5yNPwrjxhq4xvowRsRAOh96kbL7
 v9DOfyx5kmsPaq7DOSYgUMT30Fu8y+J3aWGwUbsqjDkRg1xhiz+eWVOYVwJjsP+0xibI2iFD7WV2gDpVEcvmyxjhgi82CUAax7Y=

On 11/4/26 13:03, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.3.2 release.
> There are 547 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 06 Nov 2026 21:07:23 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.3.2-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.3.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

