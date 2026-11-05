Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793916119;
	b=f9UPAk2+AtS6x8xxdJbb0MwMpgWJ7btzf5md6Aqm6hGxwJAVQ4PcsnRlytI9LHk86cw3
	 zPlmv8ZUqb3ZpG4OB+CcvUfnSNqlRwotgK4x5jNkaK40YN45jyHhZdsfB4oVTkZO9vDRy
	 zava0IQCiLCYrfqFaJdxkgw4zneAgAJb2zU4Fu6g4CAYygpGr9/JC5U9Rf01WMvqQ0OBV
	 OKoxrusSmd8wcP/6Ja8CKEsb3OOmK0GhgvAhzkk95FY1zaf233HtOm42wIfHk4lsI+r02
	 t7hr/xF+gfpP7pyiFhJJAAOJtjRApO6YerebYxpgM2mvD5gR1QYyiaqSZSWIVlPF30A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793916119;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=lNt/NV5oKxbjksJAX7Ldj36p+CPh8uKKu4XLRHv+03o=;
	b=XHDwuMzMvDc2E6iVsq5TEZ3UcS7Sjidz8Vuik7oF+k21o5ynucliNqo0optvNXGNkeYt
	 4uStf5Y0KtxaxT6aZbEIJ8wDKZYvqCI3CXPHmmVpt1LK3g6UD+J2YQbfkKip8MLJiZoFZ
	 yoybOCqFsEGK1jsKtNuhEAvaRuHsha8iWe0tyev5P6N68TAHnLfQqFjlVdDIhPeqN5pRK
	 X5DD1TKLJDB9tptS7dhqz9pOGBawkHzWVZhXx+5p/Np3uUAyNif1GmtkUr+/pxDgCNb+n
	 OuQ7YTSe2rENwIvMfDhOMxR7CXbxLKxrHYWz8MNRVgiyhENmUQrfq5l5eg2qSq/hp6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y+d66s73;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357ED606A32D;
	Thu,  5 Nov 2026 22:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 357ED606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y+d66s73
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=lNt/NV5oKxbjksJAX7Ldj36p+CPh8uKKu4XLRHv+03o=; b=y+d66s73nWFtCs9jYnXjWVNPgz
	AmFlIH0hcq9dn+TE1IpruffHGi0mOv6Rq63L/8WQU1gKGv2UBg7fya2C+uWTChO/nY0t456OFCO70
	mSh5cizafME4qSgc+ugaydEJvMtjiAqDwirfAkvUSmvOtYlQU46VYBwtGkv5KEMq+Z6gmteLEuwQ5
	h740K/+C2FNxrrdkoUarn2ZkVX+NpzeEUXxhGjs3xyQctCfC2zjWVow0EX0cGAELVAcXKpB0YthCS
	GKj2bQCKfdQqu+LKkNSYJhUg97tLE8ipUZsVq0TLv5cGkf49ACZJyqzWjvzk2yjygNLSNHez9uNQM
	DM61Cg1g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5Wv-0000000AmIu-1xcC;
	Thu, 05 Nov 2026 22:01:57 +0000
Message-ID: <43787755-f0ef-4338-b0d6-fcffcdfcc402@infradead.org>
Date: Thu, 5 Nov 2026 14:01:57 -0800
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
Subject: Re: [PATCH] Documentation: Add category of subsystem-apis
To: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105181542.3071-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261105181542.3071-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/5/26 10:15 AM, Manuel Ebner wrote:
> Add Bus and Communication category to reduce number of items in
> 'Other subsystems'.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>

This LGTM but at first I was wondering why I2C is listed here but I3C
is not.  I3C is listed under driver-api/index.html. So are some other
buses.

That is a little confusing to me. ISTM that we need so *not* have
2 places listing bus documentation...

Anyway, this is a good start on that. It could be merged as is.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>


> ---
>  Documentation/subsystem-apis.rst | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/subsystem-apis.rst b/Documentation/subsystem-apis.rst
> index b1ad48bb40..4e886897d3 100644
> --- a/Documentation/subsystem-apis.rst
> +++ b/Documentation/subsystem-apis.rst
> @@ -24,6 +24,20 @@ Core subsystems
>     timers/index
>     locking/index
>  
> +Bus and Communication interfaces
> +--------------------------------
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   i2c/index
> +   pcmcia/index
> +   spi/index
> +   w1/index
> +   usb/index
> +   PCI/index
> +   peci/index
> +
>  Human interfaces
>  ----------------
>  
> @@ -72,11 +86,7 @@ Other subsystems
>     cpu-freq/index
>     edac/index
>     fpga/index
> -   i2c/index
>     iio/index
> -   pcmcia/index
> -   spi/index
> -   w1/index
>     watchdog/index
>     virt/index
>     hwmon/index
> @@ -84,9 +94,6 @@ Other subsystems
>     security/index
>     crypto/index
>     bpf/index
> -   usb/index
> -   PCI/index
>     misc-devices/index
> -   peci/index
>     wmi/index
>     tee/index

-- 
~Randy
