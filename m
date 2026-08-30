Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDF13B47C3;
	Sun, 30 Aug 2026 14:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788101150; cv=none; b=iXtDW23YXHNCELbbRwBmD6WsAbs6gK2FNtVrJvDuUDuZ+Y5L1qdDHbG7iGzW+t6pgdO76oLuptqv508dXVrzXwJFDiX1xLzCHUDZhPa2dL67RIfmuYsRvFgfin4+oHeA6BrtnIGdcE4eaEfJACURnIo8h2vWtYGWnAmFb36kyUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788101150; c=relaxed/simple;
	bh=CSRsAmlEGdXvv8L+D6uraOHhCuZS0iuReJv7z4DIcR0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TZ6Wm+IwbRAvxmzi7Fz4ueS6wQ0CyddCG/ZtEslqCSZdJ6fxzd0I+Yb79TG051zXUAK/HNEPxyjuMoi0JvVchw41AefBlduQpuiFPIO62tgCDL6UEY8V+xWZHMAq+/MvlbEzvFf3rk9nvdmbe9uj0g4h+vhRmP8Y+UVy7WV8x08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=LFmo4/fE; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="LFmo4/fE"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3257B40430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788101142; bh=KSwHaylzujYwz65gMRgnf6/prISOr0onbHrOuXbAQus=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LFmo4/fEI4IF6dN/UEdWgYs4KqSgD7VtZ6qc+06+bWk9ynvK24SmiSPTx82TqMrRB
	 QJSRMjGKbIH8OhNAYD+HKrnLtkOEvjzSy5Vbm3nFbBK3O6vYSv/T7IbkeXNAIxxMnT
	 BHjaIcggvCEe/H3aVZbIVn8buYQc9We4/Wp4NEUFPifWD2SdhwJguwXZ6jTlrKEhwo
	 oxgK7ho/DYYjORSJyAbcycwoEMv06OVq6+CDq0TXLPtzFUAyYxceZAmPK6gAP7xqwf
	 o5vTLDTg7wtRW22kYVQjMXeW/aYMOA+Awk5nFOlU39i2GSem2yldawrqMzxfmKyt9a
	 72zzrFrOVHg6w==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3257B40430;
	Sun, 30 Aug 2026 14:45:42 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dvb-frontends: ds3000: validate firmware size
In-Reply-To: <20260830124034.95459-1-pengpeng@iscas.ac.cn>
References: <20260830124034.95459-1-pengpeng@iscas.ac.cn>
Date: Sun, 30 Aug 2026 08:45:40 -0600
Message-ID: <87o6ejll9n.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Pengpeng Hou <pengpeng@iscas.ac.cn> writes:

> The firmware diagnostic reads the first two and final two bytes without
> proving that the firmware object contains at least two bytes.
>
> Reject undersized firmware before the diagnostic and upload path consume
> it.
>
> Fixes: 09ea33e5c696 ("V4L/DVB (13493): TeVii S470 and TBS 6920 fixes")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/media/dvb-frontends/ds3000.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/dvb-frontends/ds3000.c b/drivers/media/dvb-frontends/ds3000.c
> index ce7ae424b27cc..76d2eb98932ae 100644
> --- a/drivers/media/dvb-frontends/ds3000.c
> +++ b/drivers/media/dvb-frontends/ds3000.c
> @@ -374,6 +374,8 @@ static int ds3000_load_firmware(struct dvb_frontend *fe,
>  	int ret = 0;
>  
>  	dprintk("%s\n", __func__);
> +	if (fw->size < 2)
> +		return -EINVAL;

So, you have generated an awful lot of fixes all over the tree in the
last few months.  Can you tell us about what tool you are using to find
and fix these bugs, and how you are testing your fixes?

Thanks,

jon
