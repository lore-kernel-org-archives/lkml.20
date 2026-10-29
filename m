Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285394;
	b=jDZRqOy7uNel+CloCjtd5/+TuGTjO7C9hNyBYGXjOYfFc4/GF+Wc2OBLTxyumpdzhVuY
	 Y8+P6qGEx5RMJYvxZ70pxv2lw48o9jmko+aLHqHWB/Phrs7RRRSfUh+PQmDTfj3YZdbtP
	 WWBVxHPKxe6a/3Tr5KcOUaKFTFE69IQinWamxCT+NLJDJG/UjHVdasB2qy74tmsOcAl4U
	 eODOlva/vAClT1QQsEGZ449hY622B1QcHF7nX4pRhgnWMII06IiU2VAk/nM3yHX3FGyQ8
	 E24T4+ZZGIh4FqYfUxO9ZO59iqtVg/GOrOVr1XOAZYmKsKTbNCHKxh5L8YOjU68HrWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285394;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=8Bml/5bu9wMcZyWcH8BuLuQVKiAGaoIYJ2WKx1dpfxI=;
	b=cIPncWLukOLrqQXL8XBriK+bPQUT9c3rrnwPCn+T6Ni3ty1twjfsgkTOB2UBf+XFQHjQ
	 kKU+bFoKkuLzIYhctP+oA0PF0HGVOpUTktMDjnpQuOqku8hKkgPxt/Rhm4dCgPOalnZyK
	 QOKXyr4GU7MOTqF9UcbTy2L9pAFb/x4itdAg20kakUZnIYSGjCiaAx/gIp2UFb2PeDTKw
	 0FmjQpLML/Nikqrm3EOb6hsrTLTJ9EgyIR1GWVxht2GdFvykoLoX0A4tK/Eh7GNbMQul3
	 j0U8PsqFepcl0C0dj5pltbSm3Z+ZcNYfmCs0Npf9lg4B0OwBl4jZdsVCNGuSFLPD+oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=w6rz.net;
	spf=pass smtp.mailfrom=w6rz.net;
	dkim=pass header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b="e/qgHQ5A";
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C810606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C810606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=e/qgHQ5A
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id MPPlxxsvxusRSMRRxxNIPZ; Thu, 29 Oct 2026 14:49:53 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id MRRwx4AXsvtkxMRRwxxHWD; Thu, 29 Oct 2026 14:49:53 +0000
X-Authority-Analysis: v=2.4 cv=BbzY0qt2 c=1 sm=1 tr=0 ts=6ae35d11
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=fesOKqsbc7FPpAGmQjUA:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8Bml/5bu9wMcZyWcH8BuLuQVKiAGaoIYJ2WKx1dpfxI=; b=e/qgHQ5AyhLAe6uJpI/mRfRguj
	DWmYmz80nbUjbVukN8A2erjcFFsW7s08GoQrJUSzKd8BhkeDVeKmv3XuryaYl8gHsLO/98RGjbTO9
	sLkIsE2cpBnQlujup/zIH0bSruId8zGopLpo6NS0zG1nmY0NV+05Tnl9FHcDj8Fq30o49XkkIzMke
	v9ubObMDvck5oJB0+qcxzjyaA1yJNZPgFYG777Nn0LIXF1Z762D7+gFCaC9L3rx1+6GhlFVpLte4I
	AU63xtYTLSto6LouxA78zhCNlxJnxfZc60kmA5umbgP6bfiPch+Z4DrWGyhpCtjyqxxnQF9VW/xeF
	KlnP9sZw==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:59112 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <re@w6rz.net>)
	id 1xMRRv-00000004IMX-3KLC;
	Thu, 29 Oct 2026 08:49:51 -0600
Message-ID: <77e4ff6a-dbb2-445f-999d-40b8838447a0@w6rz.net>
Date: Thu, 29 Oct 2026 07:49:50 -0700
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
Subject: Re: [PATCH 5.15 000/571] 5.15.224-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261028170008.009143722@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20261028170008.009143722@linuxfoundation.org>
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
X-Exim-ID: 1xMRRv-00000004IMX-3KLC
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:59112
X-Source-Auth: re@w6rz.net
X-Email-Count: 137
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPdJS9BfDm62NvxWKF089OA7S0mXEhljnzOrgLyjmMz6AK98kY6627nYZpGPEiV8sDpi6SxvUNqB7FuDvV2Yv/EqgFSZWKbWl7wt5IrA5BIen9GzTsht
 0Q4UmLHrSf1E6QNrfio4hd5P9S1SZUvFZBzWjewVNp5OoHu02m9lwKk9oJd/WEfgwLLT7Mgkkdgo/4RRgQ3X74Sp/gTT/T78K0Y=

On 10/28/26 09:52, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.15.224 release.
> There are 571 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 30 Oct 2026 16:59:22 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.224-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

