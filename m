Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002004;
	b=oAow/nvbDVxRDzitjtMvdLTCq294YxerH3NnscdiqyIpAlFEaG1jbvCGWGKL6ReUBSID
	 fELsJn3PAz0NCRZrY8kiyWXFw0+/HzjQRTGkMCdarFROi+dD6OQ1Xv9WLpD9ECUYGgGz8
	 WAufURlfXG0Lxoco4mHU5xWM6WF/b9vfR191K8X7p09DqrDWsajg6WTNuNTrsar2YQs8e
	 f/xb/LQjzZytfskd5SZWZ6yZMaB1HPhaIozu1gLiuA50LGV5fyIf5nzWphXfVuxXkuy8O
	 5rxSYCI0ISXtlYZn+/viSgtSJqoJFMCieYRewPgwDU7pY9wsraEq0B+afD9iR9wwWhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002004;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=hZZxXdvW1/f+hfDzWZ5LPBRqprL4GaOSWhztMtIsmCQ=;
	b=VupOOSPoRT1DQSq9Dy9d8nuRkqxoLV+buxQ2OpRpi+gWehIxhTQAhS6W7QpUnZLGoNql
	 7tLVbXrdztHDxteaUJ8G8o89+iVC84BGBJFgcnJ1/4i1gx/lUGVbAECYbN/5L6V6B0jGK
	 IMM/9JDqhrWYVrUMKT84/V0Op4quSoj/W0F33AImmqlRLGYT48e+SnfP/gGmEvTaSzoAj
	 jmVZPOh9+G74Jkl3bAE1YIXonq5VukxTvY9Vkknu/LSDSnWUDMA0uNpOrSvCiOfwJ4qMn
	 RGzgGU4y89b4rhSQpjOhZXu1tJ0r2ItLWpWZogueDE7fikoYf1WZbhOejYURuKxm0tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b="DVopFl/I";
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=gNld+YvT;
	arc=none smtp.remote-ip=188.121.53.17
Received: from sxplsmtpa04-02.prod.sxb1.secureserver.net (sxplsmtpa04-02.prod.sxb1.secureserver.net [188.121.53.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D95606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1D95606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=DVopFl/I;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=gNld+YvT
Received: from [192.168.178.101] ([82.69.79.175])
	by :SMTPAUTH: with ESMTPSA
	id PRrtxwZdCcIxnPRrwxBplr; Fri, 06 Nov 2026 21:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1794001990;
	bh=hZZxXdvW1/f+hfDzWZ5LPBRqprL4GaOSWhztMtIsmCQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DVopFl/ILmB7A1cn5339qdaKHCqy/O0ILCwoT1pKfC+Xyh+2fdnnpqZZ+VKEif2jS
	 tdVdBbUsbPyvyeCC6gI+KMKlI3PhiWw7Z8QnNN0caGJpoX2dbbNXtZhXR0hP659Gz6
	 9dCqEw4e7pHb0L9yO5O9nE3M4Gy2STn4rktsoR6E+634mnDqsUISe90TXMEgLQziWU
	 gK7gzaTZ82OHgQ1TM6TpYzKxG5FC/qht7oEHSmESuz7tehD7c1s5k11YY8hLFeWWYR
	 zrBJH/sp4SPjYCcuXMv5RbjCmrYoDdpjgHfV0p4aiFXphwfdFtRzEbQxkWwERqYfjv
	 MVLhBDHM8KoNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1794001990;
	bh=hZZxXdvW1/f+hfDzWZ5LPBRqprL4GaOSWhztMtIsmCQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gNld+YvTxdpkwOGzxcV7YL3GR0gXd0yXwJRXIUsqBGBoRob2GevLByqboIzYXh8tq
	 xFp2Pdn+ReAdbHnSEnIKqN6G57qPp9jhY5MpR2p3AWouf2rNsKH00b1ec32MKcWAoQ
	 bGP1q4KVhX8pri5K99srGuOz+cGAWQss0fI/oQaM/ROChPQheM4Wcu1GGgqrv8js+M
	 wluS7eTfMQRwQLLUdNxCYcU1ceLga7ZWeS9I0SV6uC28KE3niXxW5KHLzu4vffSme0
	 U154vF4wuLYhO3IUZ4r63bEeOStY6eqdCMBhGuUhYDIKPJ3288+wtnFYV+TvbqOXMp
	 HTd19MJAVcnfg==
X-CMAE-Analysis: v=2.4 cv=RrJQvymK c=1 sm=1 tr=0 ts=6aee4c46
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=IkcTkHD0fZMA:10 a=FXvPX3liAAAA:8 a=7CQSdrXTAAAA:8 a=RaF3lfFyEwhm3Sx1ChkA:9
 a=QEXdDO2ut3YA:10 a=UObqyxdv-6Yh2QiB9mM_:22 a=a-qgeE7W1pNrGK8U0ZQC:22
Feedback-ID: bc046444923e57c050ffa0655c621bc5:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Message-ID: <a408850b-dd83-4e7f-8eb5-891c9ce881f6@squashfs.org.uk>
Date: Fri, 6 Nov 2026 21:53:05 +0000
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
Subject: Re: [PATCH] squashfs: identify device in mount errors
To: Christian Loehle <christian.loehle@arm.com>
Cc: linux-kernel@vger.kernel.org
References: <20260912145314.788588-1-christian.loehle@arm.com>
Content-Language: en-US
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <20260912145314.788588-1-christian.loehle@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNcGrA2gonhwU3Hx5v8AvIycoItLFs5tfSVqqdTeIxjmbJrPAhDg3xw3VJf34UUMQ/irPoTk4GY1T0upeEiZY5r8RANJSxS2xOPV/g7p45ribTh9uksv
 kqJ44gxuM4AxKl6zN4+I9UrewHeVW/AaIFE9t54tdqfQVKDyvUW9NLvU+Y0WY+XWa0GDBgvPDHzrXmGk7/Qz6RyUq8AjO7kq8yuscB2CiL1OvI6vxU0WUCag
 M61sFGW0oNvtNW4WGzClyw==

On 12/09/2026 15:53, Christian Loehle wrote:

> Squashfs mount failures reported through fs_context do not identify the
> backing device, fix this y printing the block device.
>
> Repeated automount failures used to be ambiguous, for example:
>    Filesystem uses "xz" compression. This is not supported
>
> All of the affected errors occur after get_tree_bdev() has opened the
> block device and setup_bdev_super() has assigned sb->s_bdev.
> Use it to identify the failing Squashfs image even when the mount is
> retried. For example, the error above now reads:
>    Filesystem on loop0 uses "xz" compression. This is not supported
>
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
>
Sorry for the delay, I'm currently snowed under with AI reported issues.

Looks good.

Review-by: Phillip Lougher <phillip@squashfs.org.uk 
<https://phillip@squashfs.org.uk>>


