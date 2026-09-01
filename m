Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4113AB5DC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788304779; cv=none; b=gDpIwYisI+N/HT635VbpT2nWmduGF+Zdl+wtQtqrVW5VpMmbi4bcJhqSEVfr9CnrU4KJzQDLfu6WMLVZwkRLlBlNFf77vgL/muw7azdi+2GEN+1kiOd0FyXhzmENCrMlHzWttOk1ppVkSr2IIDeCBjRqqbijZPCHScSLH/9DuoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788304779; c=relaxed/simple;
	bh=KkpkrxwT2hn+gLpdH0LQyg970zML7xATzIAvmxyJOA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gb+j2/Dqw8j6JcWac7LCYWnkqqy8DMR+HQzh1FrmqrlODgUvJKzmxBNlBuDpFqeaEVKB2g7o9N06goQ7/zUg0exL9mbpzhK2CePznmqyU1Aa+a3vs7ZK/V1TRF/n1t08zc6wkizcQ7wf/Sp8bIhn+hhcfp2G1bA0DJnfYsU4pas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=VRm9PSpC; arc=none smtp.client-ip=35.89.44.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="VRm9PSpC"
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id 1V8OxsrLsaC0U1XlRxO0PY; Tue, 01 Sep 2026 23:19:37 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id 1XlQxfisAiutH1XlRxqMa6; Tue, 01 Sep 2026 23:19:37 +0000
X-Authority-Analysis: v=2.4 cv=AYuxH2XG c=1 sm=1 tr=0 ts=6a975d89
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=y2ERv7ko0hlTFnYyMTsA:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ueLA56OKoJ2gEO0tJvz0OTqOEECbx4sFX3AtjQuUgF0=; b=VRm9PSpCkjmHNpvYKmVStvLVZ5
	9nOqzALgFRbd468CstBC2UcC3W5R+jXwAoSB0/65iukG2pbhCMFYL2A5Mml8CiQaXDZuoYx85oQ1j
	GrcPnFVf/4hT5DdeFAoOzxDUUXURoHIY1c0bWBQZlVsF27SEBmhwM5AM+kzYg7l5rRHimn+osuUjf
	kYTSKhtivb6R132PuKRnZHy06SLa848bJnW3fGiC2S9bBofXXZszr5aGEXoZrox6thiquhy9Yw3rb
	H/14qVq4DoWRDpweFl+1DryZBwU6heLkbxrJYdZ7XneE+e8QjdGVj3ppeX33NU2fb2J9BR+EYL3Fx
	muE6HhGw==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:42326 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.5)
	(envelope-from <re@w6rz.net>)
	id 1x1XlQ-00000002QS8-1CCY;
	Tue, 01 Sep 2026 17:19:36 -0600
Message-ID: <8be7fa21-20a8-4452-a978-cdc68d2a77a2@w6rz.net>
Date: Tue, 1 Sep 2026 16:19:34 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 00/91] 6.6.156-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260831133359.468089036@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20260831133359.468089036@linuxfoundation.org>
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
X-Exim-ID: 1x1XlQ-00000002QS8-1CCY
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:42326
X-Source-Auth: re@w6rz.net
X-Email-Count: 57
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJ//RCpUHBAifDb9gF0uoH/yPbVtbRxtGBWAl0ohafH0j/GeKdSL48onvpNRDNE5Z1L8pfV0TjHfGl5pe8Tg237aG83fieB9Z8v7ibUp/IUPbGgDjclI
 1od7dVx3xJN+GRsMmH6ZYO9H0CSvo8xWXT5SZVGhA6Espm3kulTw46FT3m2xbBPAJmSUXvOSGyqwK71+OOccYHwzjc1nBxE+UOw=

On 8/31/26 06:33, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.156 release.
> There are 91 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 02 Sep 2026 13:32:19 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.156-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

