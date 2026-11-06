Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999474;
	b=QKfJ/LSMvAB2wOIRJzFhbS43abJwFdpopIzoohWI3k8oBKVrrEwJh8E9zRyXzWFD7qwo
	 9WdVO7SABBQQJeV7iDUJemXVrB+8y3kSbjBc5jpqbc5ypO6YZ6cRsJ26HiacuhZktgCDu
	 Lu1vctyxiMvVU4iBLbbNBnF6VP1fJqGAqI4pqFpKxT99sewwUpCHEbjKcn45zyZTYaCq9
	 2dfKdlE+B/nzQ9alIvECT+wk+k09E+Qt33ZLhpctB7wkCLEKNzUsuxeH6yK4Xwi8MU+ZB
	 5SYDv0LY+Kq0lm4jU8y87LhbgiUjM7mdLMB/d6XO+GGtW4uZpX8qlzPSLXbxIV8pxyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xKjcuvfEsrQaalDXDb5/zzpQY2N+PE19jIG9FttWmsg=;
	b=gTEq5YT/oUA2zBNDoYI1uBTtDyvoUfzBvOUJIFYF0uYlDTHJ6pUqIUNUxXpQKVYYAZQH
	 x3Pp2HpriJmICcjOMT9WObu0FRNHTR1JBUkRhH+08k7VQCX+4CO0D78f5A7sHGTgdz4mg
	 SyDa3wNJNd6XXIFkb9neeTumj9B21KVsVh98nkVTyxknIRgxiTbrq9NfnEPJTqss8+/hu
	 RkVTWk1dfJT+e2CsEaevb6j0XpdSxL5FVG5a4t10NEsonqKeWtqMA3ES3vsDTQuPhVT7Q
	 bds5f9KUhT/rMFKJ4NiGRQ9Q/Cq61pCE4o/CrfaRcjgIOll2QrcIDlR055YcuLqOjKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=ULZJPgCF;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0346A606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0346A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=ULZJPgCF
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jLsKs2p6tz1XLyhh;
	Fri,  6 Nov 2026 21:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1793999469; x=1796591470; bh=xKjcuvfEsrQaalDXDb5/zzpQ
	Y2N+PE19jIG9FttWmsg=; b=ULZJPgCFJAs7uYkZvw/AEp6SFwoUMH3c5Qnz7PpY
	5IKb3jNrIg0ZYSo59tyqIVjuB5R6DifyGNZcgEfMA/Wn4Se26yorEzvWj73gYS3m
	Oet/VTaoAgubyEkAkQ9xZXSLDxM5kc39zd+2TkIt9/5RqGzJ2D3uzKcp+zNBL8o2
	bIZlY5rfN7bIWJsmzbqMvuXmnk4RHKrXJxMHUWHz+zJSg93btQqdKw36BcpBA5Jo
	VHmFHrWBrF7oFVhnKXDXpNyQy4nZf+F6oVF2S3lbv8/3jr8HHVW2NEtPOlkKWZo7
	CbidWRm9LHM0SG6QfKjAn8OcCIpndrhzAA8U0hwg4PoMzg==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id UDGiGonopHWh; Fri,  6 Nov 2026 21:11:09 +0000 (UTC)
Received: from [100.80.231.125] (unknown [104.135.182.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jLsKn2hQFz1XM0nn;
	Fri,  6 Nov 2026 21:11:09 +0000 (UTC)
Message-ID: <534257c9-6f48-4a01-8589-330e4e4e41e1@acm.org>
Date: Fri, 6 Nov 2026 13:11:08 -0800
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
Subject: Re: [PATCH] mtd: spi-nor: Reschedule in spi_nor_wait_till_ready()
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>
Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>
References: <1b755e40b80fded4b4b4c1f1c81f0d171012a1de.1793999093.git.bvanassche@acm.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <1b755e40b80fded4b4b4c1f1c81f0d171012a1de.1793999093.git.bvanassche@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/26 1:04 PM, Bart Van Assche wrote:
> In spi_nor_wait_till_ready_with_timeout(), cond_resched() is only
> called after spi_nor_ready() returns 0. If the flash is already ready on
> the first status check, the function returns before reaching
> cond_resched(). This happens e.g. under QEMU, where SPI NOR page
> programs and sector erases complete synchronously during the MMIO write,
> combined with a controller driver that polls without sleeping.
> Consequently, multi-sector erases in spi_nor_erase() and multi-page
> writes in spi_nor_write() may iterate over thousands of sectors or pages
> without ever yielding the CPU on kernels built without
> CONFIG_PREEMPTION, e.g. ARM32 kernels with CONFIG_PREEMPT_VOLUNTARY=y.
> This triggers soft lockup and RCU stall reports.
> 
> Move cond_resched() to the start of the polling loop such that every
> call reschedules if needed, even if the flash is ready on the first
> check. Doing this in the shared wait helper instead of in the
> spi_nor_erase() and spi_nor_write() loops covers all callers that wait
> for a program or erase operation to complete.
> 
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>   drivers/mtd/spi-nor/core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 90524c58602e..3e3b727d262e 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -653,6 +653,8 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
>   	deadline = jiffies + timeout_jiffies;
>   
>   	while (!timeout) {
> +		cond_resched();
> +
>   		if (time_after_eq(jiffies, deadline))
>   			timeout = 1;
>   
> @@ -661,8 +663,6 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
>   			return ret;
>   		if (ret)
>   			return 0;
> -
> -		cond_resched();
>   	}
>   
>   	dev_dbg(nor->dev, "flash operation timed out\n");

(+Brian)

The following probably should be added to the above patch:

Fixes: a95ce92e4b28 ("mtd: spi-nor: improve wait-till-ready timeout loop").

Bart.
