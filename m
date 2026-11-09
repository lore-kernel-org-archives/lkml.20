Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216858;
	b=L/HwYg4qf78Brd4DBbMAy6Yy4M81rKob+iRWjd8Pnzojd/VBOWDcS3wKSXQCm+UaTWqZ
	 40bpvdarp8xSIPJDKFSMILloX7XPW0gEh5D6XkCvPzVrqpMAOBVDNV+1u5XPDgWN1O3Gy
	 p+VG9HyaKTrSxwfKwDKkS71grOgkXQmXVJJunjbExDvVDjZEZ3ayFR0UZ/+oa24kpnUGY
	 eoJHuFcjfkXf9+YcgPO4KOWUAyqeNZpe/NLf/NgABEtrtkswSYTkDnwBKd7Ptt+l1g3qG
	 dwQhKDDooAfEzKDXme9DM7PW6EvSKd3vQi7I/d8btWoS89YlNEEBB3x60ZHE3sU15Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216858;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=GQyZO4u8YwN90ZByf/x3nUIg6XKgQaPmDNuRTLK33HU=;
	b=KikafbP+gVrA/2DX9Ha4KwgoVBdFZ+NjRm/M1rAlwmkc78zLf6U778+IlsJjE21exvHe
	 1/JpG0WoVyb/O1PoMSZDa2qSkaYqX/vxLWBi99c35kUqdFM1acYGIriIRpEfFBdGZTj7s
	 tH/nTd3w5h4ZSVzibNDgVHbCOjaaIT3jM70nv2QVokUaiOvYkXn8m7ftwXBlNhvdQ2mas
	 CweO+JXaSs0geaYOqqI1NA4Ols3ZHH2qSGLVbUPPExUAqj39MOAx2J+gJ5JdyulCh4ZXC
	 11Eu9CEuJICUobG/43nBf1Lxoj0ITgRV1eN8LeszQR3FaOJcCHyLuXIp2iBqhhT9Dbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=w6rz.net;
	spf=pass smtp.mailfrom=w6rz.net;
	dkim=pass header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=ffFzwrsI;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF04606A33C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CF04606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=ffFzwrsI
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id PnW7xjf6D4vCDQLlYx5JfW; Mon, 09 Nov 2026 09:34:16 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id QLlYxgmhv8cn4QLlYxrI6S; Mon, 09 Nov 2026 09:34:16 +0000
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=6af19398
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
	bh=GQyZO4u8YwN90ZByf/x3nUIg6XKgQaPmDNuRTLK33HU=; b=ffFzwrsIihC2IZHN4c1Vhl8QT1
	qaYnsD+LnO7MW6D8+IPLNJl6xT2jlZRZ7ZOCOGIfReavOz8WIkKmYaGFlYH6GfLPYLY6vQINFC7+3
	P/tS9ubF1T7yrgbOrHdqQ5uKF0FJjlOd5S/165JFmeqSyt9VFGrpbmkqHYz31At/woc3BEw52/+cm
	xuwWEu32SN5jNykKQQve9XCfPKqtcxfJrPCUfzEUh8sVjhyjIxQHs7UnQpdeKgsIRD4jBsIzKEqcf
	KRQZTTeAIOWowkwvAiup157cD6eReVAr8UMDHbmM38deGnyUekzv4j8aK8k5rOtQUChVOI9imd/wI
	bGHax+yw==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:57736 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <re@w6rz.net>)
	id 1xQLlX-00000001Wnh-1RD5;
	Mon, 09 Nov 2026 02:34:15 -0700
Message-ID: <6d323bf2-541e-4cf3-8b8b-b5d566bd6f71@w6rz.net>
Date: Mon, 9 Nov 2026 01:34:13 -0800
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
Subject: Re: [PATCH 6.18 000/869] 6.18.63-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261107134852.069646174@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20261107134852.069646174@linuxfoundation.org>
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
X-Exim-ID: 1xQLlX-00000001Wnh-1RD5
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:57736
X-Source-Auth: re@w6rz.net
X-Email-Count: 37
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPpvhpI3WNor4sRBW5hr8lTOpMH4l0iroMPYU7Noy3aXn/wdwwGw5i3bfD4Q2v8/xhcNIGpGGDsysgPcjA/fZxb2K6cnCHQvEQz/TtFmsYVHwUDRNOCL
 87woJpDwJJ4uQh1bjdMJOol4QiKG3BV+ViqOv8qMChu2ldwvjVeXKf98vRZnoEjjnfZinzY7HNmhFm0THH69BzbZEcVroRPstv4=

On 11/7/26 05:44, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.63 release.
> There are 869 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Mon, 09 Nov 2026 13:46:08 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.63-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.18.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

