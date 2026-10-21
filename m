Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572980;
	b=wcah5TrjKIHQza+WAMB4wVbiLImUkVzDVM9nJyUzoV+Pduj3nhgD3zV/XieQ5KtYkm+3
	 itx7LrmdmqqutcC4b5t2HB2cZ/MrwAaelxOIG7MqhIhP0pO5Vjz5f0o9nX0dW1BSC0aty
	 8CTcHhQoPlviJ3AqgyAfV5FDdXnLTh0AImAAfxhMAQ6XmsvgrROqujF8MX3ZJ3Zrsll8C
	 Fqq8QgDGC/AemXgKZBr5qCdM70y/KD0HymqnIM+EH3e/v6FIa6h/ph7o1VSHsF7E9KPcO
	 wbDxz/l9cKEL708VyzY6YUqsGkAI9euwQ9lPD8eYLBF0i7mo0gaxdM4EXOqBrED9QXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572980;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=rGAUX7WyHtctAYQgZ/UWtEbDP48u5/oD/M4xo9z35DM=;
	b=2KJMhZQGu0lvHM6bYlhbGh215sNJD/6CpmrN6I5/E5e0qWGIfykoMBywpAu8gCJI8mJI
	 4evbskuB3COMloPbnH8ck0G5qs1/skRAVqRqGFisd/OLRtjFia4TXsBMxcYiJCujApyxS
	 qTcDCkY3Jt/2XHJmzWrKdC2v9WPpfOXAGrYRDdN3H8jDWO8kyITYKveSt40nuGt55pO+A
	 OwRIPaKyw9eELYgbvBpwOw1IjK50NURrrFvkzbhDNfNkVLPCIBGhHQV5pOn6vtGZVEEsh
	 9IDXS4X5wcF5EA8o1FN2ZjU4yEznldEATXO9oDjfphReRFsSKNPTL9Wa4LRDhVll4Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cMtazZgr;
	arc=none smtp.remote-ip=95.215.58.37
Received: from mta1.migadu.com (out-37.mta1.migadu.com [95.215.58.37])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB85A606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB85A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cMtazZgr
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=b0hMr3I61lFJI5IrfBvnsnfONukXMVBIX2vAjQ5aK5A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792572976; v=1; x=1793177776;
 b=cMtazZgrmuHDOBt/B0DWhbnun2z5lTHkZkOlWG8RZM6ynVMUqj7JwK9D437lOWWrj8xq45GD
 KhD0H4OhziBFyJwLhoSirxfYolwuf4xjgIxu85tUd/1QEgvnaTXsnY0kxpNLi5ePg+DrgxycSVk
 kA/lzHAuBi79360gUTQ2mibQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 1a71eac2f28c557e;
	Wed, 21 Oct 2026 08:56:16 +0000
X-Mizu-Trace-ID: 1a71eac2f28c557e
X-Migadu-Flow: FLOW_OUT
Message-ID: <c1282924-f91c-440b-b683-b663765a3e38@linux.dev>
Date: Wed, 21 Oct 2026 09:56:13 +0100
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
Subject: Re: [PATCH] scsi: libsas: Add __printf attribute to sas_ata_printk()
To: =?UTF-8?Q?Adri=C3=A1n_Garc=C3=ADa_Casado?=
 <adriangarciacasado42@gmail.com>, "Martin K . Petersen" <mkp@kernel.org>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: John Garry <john.g.garry@oracle.com>, Jason Yan <yanaijie@huawei.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261020195934.250768-1-adriangarciacasado42@gmail.com>
Content-Language: en-US
From: John Garry <john.garry@linux.dev>
In-Reply-To: <20261020195934.250768-1-adriangarciacasado42@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/20/26 20:59, Adrián García Casado wrote:
> sas_ata_printk() formats its variadic arguments via struct va_format and
> %pV before passing them to printk().
> 
> Because %pV hides the format string from the compiler, GCC does not suggest
> the format attribute under -Wsuggest-attribute=format, and callers do not
> get compile-time format string validation.
> 
> Add the __printf(3, 4) attribute to sas_ata_printk() to enable compile-time
> format string checking for its callers.
> 
> Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
> ---
>   drivers/scsi/libsas/sas_ata.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/scsi/libsas/sas_ata.c b/drivers/scsi/libsas/sas_ata.c
> index 61368e55bf..53eac56c3a 100644
> --- a/drivers/scsi/libsas/sas_ata.c
> +++ b/drivers/scsi/libsas/sas_ata.c
> @@ -372,6 +372,7 @@ static int local_ata_check_ready(struct ata_link *link)
>   	}
>   }

I checked 
https://gcc.gnu.org/onlinedocs/gcc/Common-Attributes.html#Common-Function-Attributes 
format section, and this looks sane, so:
Reviewed-by: John Garry <john.garry@linux.dev>


>   
> +__printf(3, 4)
>   static int sas_ata_printk(const char *level, const struct domain_device *ddev,
>   			  const char *fmt, ...)
>   {

