Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792888219;
	b=p5cEVvkSt6Au599CI85ILxPVAG3GeBfgK4TLAaJE9TcqgoZDG3pvVrW6UgmlRce9XL+Q
	 WLMehutF/UVP4snxjlXcY/W+JvoHsWM/hHYgUvjnnejDVc+8fqK68Aaa2iuTYrge/QuU4
	 +anihLrXtRvp3XpoODxFJA+Ac/9/TLaaXyoK4Yqd/Wb1iVETZx2vv1gpM+HgrwQ1ZzN4G
	 2dgVzUeIicfh7cBtBbu9By9U9K21yZgXCT1+YNKvmfd5eq0H6onP0jHEg3bkWybMv+Xz5
	 17yeAzAfB5wgfKv8UZQt6D+3AkRASTTAHtw0xUW2s/SOjrd28Gb2hcZYOMJc5t155nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792888219;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=V6F6lQu1qmB71XoZp/HmSxfthnmnQbATGjBXTzdBL9o=;
	b=aHMAjDm2xYH+FJQg40NnlOLg+TS4AH/pM3F7cgrW0gYAqDljE27b4KKDiN05U6UzMr5n
	 MWP0vOVfzYnThte9EZ4g3tB9+WKMH1xHbr9JRDxkiScxg10tifngaIAcnds/W45vFDV3s
	 pKnv67eI5WlQsKIuybGVn8E16y0MYTjss3za09yjkk9sHviWtOv+2V7oMiMIm+eJ7xX29
	 6QWNrUUtmQpvC8bcXCtOJ5TYntU9HSQ2cRGnht6l6w5LeDQO7SlS9+vmJkvbU0FdjBIFU
	 5nrXvR5To1K/3tYlzpNQzQLBEax7IFaQeue8ncittjm1gFq1sp5IhgfnTfsbYkDBzKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=w6rz.net;
	spf=pass smtp.mailfrom=w6rz.net;
	dkim=pass header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=UFD5UVZA;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861F5606A322
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 00:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 861F5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=UFD5UVZA
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id KLQpxJUJLJFmFKm7oxxnIn; Sun, 25 Oct 2026 00:30:12 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id Km7nx1RvNnyjpKm7nxypmV; Sun, 25 Oct 2026 00:30:12 +0000
X-Authority-Analysis: v=2.4 cv=GJsIEvNK c=1 sm=1 tr=0 ts=6add4d94
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=VRr-wL_VGqTnNunMsMgA:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=V6F6lQu1qmB71XoZp/HmSxfthnmnQbATGjBXTzdBL9o=; b=UFD5UVZAQgTUNRbsX8XCBuYbmg
	XP601IUmysGdcxp5y9rvFDdQ05lu5w7MEhVZHEi0vZvLhNycsfY9l0rN1iwJ5ByFNbUo72R/4jkNn
	LVesCxtVEiUihqiMAjj2JbYjtVSwCCQvcUGQz0QL9TK5e0PIICIQ7WtUzCQuIujW/QiQ9QsqWwRS9
	UpdaJ3syyHxnDRD9FKDaNP58haxpEWR/8O7iGyem4L5ruqsrf1riw0re6tT5gLpA6TDdl/wjIdbH6
	XysvevthulPHwcyTYvGtkA83j7MCkVX+C3/GzQP15iiR0+iLqLNrwVtUI3dzzUwumPp9Wwh6zhkF9
	uKRzMZDw==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:49360 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <re@w6rz.net>)
	id 1xKm7m-000000039XC-3wqB;
	Sat, 24 Oct 2026 18:30:10 -0600
Message-ID: <3fe3383f-87bd-47fd-b5f0-8b885905954a@w6rz.net>
Date: Sat, 24 Oct 2026 17:30:08 -0700
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
Subject: Re: [PATCH 7.2 000/243] 7.2.13-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261024064731.125251200@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20261024064731.125251200@linuxfoundation.org>
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
X-Exim-ID: 1xKm7m-000000039XC-3wqB
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:49360
X-Source-Auth: re@w6rz.net
X-Email-Count: 17
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDLdyOdw+5gAXdbv9bwoArrzUr6Z8Qot8Yk6Idn54dQalEbar1kzicV+m9rLHF1ZmjPmpViTeqSE+oMPj6DAaDDjo6WYHUFb2idElsq/mwFznOVFE4Vh
 OSxnb10mCDdqU+QfZvCi7gfMSMHt/xJF/4JpbwJqSh0aLWLkvQdIv2se30uB1tz0L5EfSClZkAaLCvmwsu7/wkL20tf/EpHt94M=

On 10/23/26 23:59, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.13 release.
> There are 243 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Mon, 26 Oct 2026 06:46:54 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.13-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.2.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

