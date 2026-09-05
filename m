Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F62539E16C;
	Sat,  5 Sep 2026 02:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788576336; cv=none; b=dfe7jwVrJjujaNowdg7zLoxEHax4uAjiU5u2BvzE5qlCH5koTlrAXoWkOju4/tFdB9TYapkAOl2TfTPuKufBpP6oiqLsgvDy4oWp3lBMM4jGX5Z39OHTDHjPheXQoWFyTCyUbIfUJTbCxkPQ0D051UtB/EQMEUoOMj0ya79ooz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788576336; c=relaxed/simple;
	bh=1q1lbuv/E5oQ7vafHBsHsaHKHwqb1DcXXqGrYYLTLJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=afrpphqk529Uzh0KqWJifWM6ydutqcS204AA7Y0kvkeJtXAeJfTs4QeNj95uIXPuDCSmfmz4PWCNaXa3CIQxYGpTi2jyisoCQStDwRMMOasaXMOMQrwhbg154O/iYoIpfnQQeAv/BHZ3j6ocLo+SRpm9ImfYU4eJJoi//e5UD3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=W3z0JK+n; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="W3z0JK+n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=bfTKRiuoUxnIvVqKGOdKuv9fLbVWUs1+16Z2ifSaOak=; b=W3z0JK+n9q59wWuFLfarXq4rXn
	KmcBTyLeeGRRnpzm46zWv8KmykPrXvZxWtoM1WidP/R6NL5J2isje2lo4b8D2F6Py6jkP5cgcOVKw
	DRcNRGp4BhSmfCDJllO7mqWCLriw2JWRZX8T+OkZ3pd8EmRWYaTj/fjrGoeAi4wIhhe8WldtKyxlz
	D7v+5GV6RMBV8AfQMPc3trk2Ak2XeRDqbr/Z0LUxncpNmYNsYqUByhq7YGlRFQbNfuJYq0O4vqpfG
	2oWUGsqsvk/48dqQO+Gk9QrbuZ/tb0ca58vu2KsEjAgeCA+5pdxpyO0qpFTeBkPrLiLUa3m+xCV9M
	rWi8Q7bQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2gPM-00000003c2J-1G1C;
	Sat, 05 Sep 2026 02:45:32 +0000
Message-ID: <08821c36-416f-4905-becf-cf463c3e707c@infradead.org>
Date: Fri, 4 Sep 2026 19:45:31 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: sysctl: Remove obsolete sg-big-buff entry
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Yang Erkun
 <yangerkun@huawei.com>, Bart Van Assche <bvanassche@acm.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905010952.57451-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260905010952.57451-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/4/26 6:09 PM, Karl Mehltretter wrote:
> The sg-big-buff sysctl no longer exists. The documented SG_BIG_BUFF
> macro is only a compatibility alias and changing it does not alter the
> driver default.
> 
> Fixes: 50209dec14f8 ("scsi: sg: Remove deprecated sg-big-buff")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/admin-guide/sysctl/kernel.rst | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index b6328cd0f43e9..d9e9b12136eb2 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -1334,19 +1334,6 @@ seccomp
>  See Documentation/userspace-api/seccomp_filter.rst.
>  
>  
> -sg-big-buff
> -===========
> -
> -This file shows the size of the generic SCSI (sg) buffer.
> -You can't tune it just yet, but you could change it on
> -compile time by editing ``include/scsi/sg.h`` and changing
> -the value of ``SG_BIG_BUFF``.
> -
> -There shouldn't be any reason to change this value. If
> -you can come up with one, you probably know what you
> -are doing anyway :)
> -
> -
>  shmall
>  ======
>  

-- 
~Randy
