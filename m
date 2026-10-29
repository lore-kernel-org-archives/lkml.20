Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283143;
	b=IID//AZjW3cde2Q1tpikcrbA1PXgzgxlPvDjnRxK0cxKKwrCy98jR2ZR0gxKPmWBsvrU
	 1hWzcHCbDnk9/AscSWaiRlBPv4goVpBQ5t4YEz0xChFKMb8eTe0hx7dDkHCh4QUM00U0V
	 0XLGy4cIKll4YVuYuF/ZNLEDL4304y5avOAm0l3pkPJmTey0RVxs/2OfsDubRpW7Z2xyo
	 /KQKrujxcYhnOGPOqkwL0kL8IrM2+Nt6YgKauA8QR6IBZgc7n8UXlq/9YIR5/jtDPSVcY
	 cCAtE4I0dN5NhgB3A7MM+LBv1HDBhBlMhPImi6wT6Ou+eOgFwVyzeAtJLJOyBItrXpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283143;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=CUu4JKG/T0VbWw91uFo3a8pQJkxWXhnnzdDiZtsSrPE=;
	b=c0bTWkabT8bwd6yFFxpCS7RHL/k3/ewLL9oMi1QcyYOBYOP8d3vk+LgUgQQcbjdv+pef
	 WTkhgQwNuQ7zJlE3SoPK5pNrjHAbwCQfpB/awI1Etj+P9Ry8GkHi4yQ91VqWztltb78km
	 1jotSZ3SixutPYot/BnqyS0NUItBD9nlEy3jAfvyHhIIy7gUPAVXNgf6y3ieu1FFG81Yk
	 G43NikutBSfsnzHjMi6AbxeZuv2q4KrtjorFdM0LSw+wN+OzvBbkdPjO1YnjVoWbOP/x3
	 D1T4f9NRRhkXMe3XyZQ/g1JLBKO48JLXwnuuabxNSd7n5Odz43scw7IiAzbYjRnZiUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=w6rz.net;
	spf=pass smtp.mailfrom=w6rz.net;
	dkim=pass header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=hYTwS7w1;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2001606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2001606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=hYTwS7w1
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id MPRYxAQXlMylkMQrYxVqG6; Thu, 29 Oct 2026 14:12:16 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id MQrXxmZCW1fkWMQrYxY6rV; Thu, 29 Oct 2026 14:12:16 +0000
X-Authority-Analysis: v=2.4 cv=CLMqXQrD c=1 sm=1 tr=0 ts=6ae35440
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=GxnsrCybi4LwF3y-YhAA:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CUu4JKG/T0VbWw91uFo3a8pQJkxWXhnnzdDiZtsSrPE=; b=hYTwS7w1HWTtmwdAsUQCzG8Hy5
	fTX4LXitEA2jlOVQdrlilV5UozyshTvfw/l7ljcwZJMO7PYOjSMH6hejr2fcRVCFsa9f0sRFyYGpE
	eVGPxW5MgGuQIbpiJcSstU/o8mmm5l2kOkONWlt7fI/iAvq2itpj8L6KP+7EPGPbehrZW/X+oTtqd
	tgdJ0Sxz6/hnUnzo9Mh2SHtcuEmlfjCAW8JyXH+UhAXXlL5PV4qYtTwoNbr658SX17WWSzaqUbFkD
	wpW412wH3/Voa55zYTIYlvYq4pW403M1VDQgGvT1JLiNHzv48l1cMP2e4r97FONbx4IDopoxhhw33
	6FbTKi5Q==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:51934 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <re@w6rz.net>)
	id 1xMQrX-00000003vJe-1B8e;
	Thu, 29 Oct 2026 08:12:15 -0600
Message-ID: <96b99a72-219e-40a9-bc88-5d21571fa5f7@w6rz.net>
Date: Thu, 29 Oct 2026 07:12:13 -0700
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
Subject: Re: [PATCH 7.3 00/38] 7.3.1-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261028165940.394092994@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20261028165940.394092994@linuxfoundation.org>
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
X-Exim-ID: 1xMQrX-00000003vJe-1B8e
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:51934
X-Source-Auth: re@w6rz.net
X-Email-Count: 17
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHJTi8jt9lOkseMQ8+BtWbDrIaGuCnjO5rj9ifw8YGiUHfoHo45GGWFmn3df2p1lsSttmOhV4d9Ww2zdY20m+ToELdgtZyVHjjY+n2X7QXWOVdIU15tp
 PFiHMnpwft50N7tPU80rryW+lc+KKeypStTXFdI75VRrazCCvc+w2y8/5c2Nnc73Bm9HXaIvpcr8JtrBCCy/XTmgeUaoooUyoQU=

On 10/28/26 09:59, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.3.1 release.
> There are 38 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 30 Oct 2026 16:59:22 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.3.1-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.3.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

