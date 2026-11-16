Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832704;
	b=bf2uPpJ9dojPtiPxHG6d1BvVNoRo5tZlGrSpB0/dnBwpFAX7s+IE3LLdGQzl92SZudrB
	 +sHlIXp7cvh/6YDfEDoKGHYibl61JsXWz5eZB1PEUum+LOSnbo/wl/MF8hO2+jTA53HSn
	 NXfXf58pZM7Qb9+EMngziwPFdsonALwB0PK7hlgf9UKn3mtBEAL1tSBaTuSY0N8kVvgam
	 EfVhPU/aZ/b6a2ffXbr6rqyNL44onFDP+fbCQrvFKYR5ZL4TQLE2YJPC3l9KdMP5EjHN2
	 wC7/JZmmGDFoQXABNGqfn/WZeWR739ockcnfLZ8+gLTscaSn2cbnI8FfoJzhuZW0FcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xs7ruyFa3AhcPBVXazJxZ8vpDg+GWQjFG2lYecJvOs8=;
	b=KsdofOJ8JhLvW4qMrSZJpUZlE5zB3/Dl3QdiXbwaytUQhmoakuszZ95pXg4O/DEAiaIx
	 epDtX9yM90QwVCyMXdpdUfKvQbUOKUad4QWOMRBNTQGbia5pfFAV4IMum8VIj+lXToqOH
	 fVtEJFI6jxvNk1LRU4tzJ0q/GXctwlJ7juoUBI2c4v2aJk/qccPaeZ7qwasO0amjJB9Zo
	 2lGWOcDbyIrYII+HymQxDsYLDBYTOTspvYg7RUPGCzGwnwrRffnF9wMJxBaHeYUhO17D4
	 unWekXqOMyy4QmslSWupQiV3i0vgHiTWsIzJ+GH6ntTspXRA/IsvKm895rypfLbvjRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RUM7JVPp;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2201F606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2201F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RUM7JVPp
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso4608911a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832702; x=1795437502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xs7ruyFa3AhcPBVXazJxZ8vpDg+GWQjFG2lYecJvOs8=;
        b=RUM7JVPpwutEm+7F+zdgJvTtidJzwpNDR78QTOyTKu/Nib9oNtNDJ+Ii0H8bLXRiDu
         6jcfRxs4wy6N7ULvVGFRxaIeCqaYaGkmvauOlvWryvxuVzntlmDQ8IuQ3KNKGwCOohj0
         hxFs5s9EZpSeztkVEOZQPC+DQ8auyp14KbMbUQtRTyBtChIiVepRcn6fbXoO6aCD90Eg
         MW/dcTzPsN3/5XuidKVr2FijMJWAreHkkZuZBOU2A/WX8+qSmwMivQr2vFlyK++enW9L
         Jaru5PwZDpfY2HopFRKT6h4A9wDXkYQqZjluO9H1/L/dVWSUaHa4ZehCLI4b1ctG7WCr
         FIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832702; x=1795437502;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xs7ruyFa3AhcPBVXazJxZ8vpDg+GWQjFG2lYecJvOs8=;
        b=xOpQq1S/7BaxPtr37HxRq09PgwfAfRd9Mp3iLs8OqsvKHxbsRnNru0GvIDnTCs92MQ
         a3SXtn0bzJFJUAmAznjpEtUK1+83S6JJeo3+U5HrSdQ8DP/PvyN/Nbx2sKgQ4CbVvWE9
         4mEfO1scyBnUT6sQJk7cfUBUvn9gHeV0zzqOi+V+56vCNTX71QvBQpQs3jqNHWyvZ/pn
         57LSeV+K2ncH8/PHnNpCO7dEKSV2c5JWqMVNsnVYaY/X1s62pcTOYzZw4luQlk0rHWRl
         V9tW9Yy5Mab7VA6qf4krxmSWUTcYz+n4PEK4cvIOxY4c4D7HGX/gEgLnMB5rkkyFx/q2
         Ge4w==
X-Forwarded-Encrypted: i=1; AL+hErE9aJMj7Wyj2Yi8jyIUbSTMLhBkb7ocNl0ROGDp/4+bnuwCJKRVtGGyzUi2G8DC7NcWl2SULD63KwSs1Sk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1yIj7DbsiUt59vIP9k9dKD0dEyzGkUsAxjJu+jjqDvlhlG2Ap
	VzXr0lh6bbrmpbz55hEdqxsNHj8LHrQdBBvquaRS63KwhAFKkMaOHZuV
X-Gm-Gg: AYBFou1F9ZgN00LxHNb1xoJEjRV2MYI9ZLpWGW+1NlaImPMaRJJFg0eqpNcxtFaGX9u
	vq2SL1LHYv264gYJp2yuKGV/7XhV1iEqj5xKNY3VeL9uoTMJL7GjzSucL6pfnEOTNzn5E/ap8oC
	qrDtNgx/adgJKqfdfEp6E58MiWueN2CwLJOpWcXrzekedTjWfG3N4OXVEC4WmH1Fedv0iaR9DWy
	IBW1e7IvLEKy958vgmGWXYtI255scIANlSzVUnRQ0qXWGZQTBZ3sxH5drYr4nEIPiSR9K7sk4LA
	qIFyl6aDA4Hja7vRYObE/0MsDihbOY0wzGFIUKb184yVLI4u8ogqCbvI0QLM1qp3u8hxTBpBxHt
	HtMDoXJlnWbeNzUXWjsQH5s6LEBKrNxuzw+AP68NkFTZhj4izi0IRbsVhWEr3Zs6glmpjUHpSrJ
	0noEQqbVUBqET1aelQ12D20fNSA58dpH23bpZZGE60HNxFWNIAaHQKTJWj4kMQQhWigr1cAYGu1
	dmrr3N+rHkzTlL1sizXCCV4y7lnrEi5bmZOpg1WQlNuf/f9OGtSH3NjCeaklTxB79oEIwnfNcL5
	Vzear+2jFG+4vlLGF1RgTc35pLRaaKL193VDBqpu3XEGJdcEXARpOgokzuc5u2TId6yNff2w44n
	rWEvqzTS4aBTG0DISzJLRMPbdPbk+QESK9Ew8KVyDvdXFZgBujXvTCNAGZcTB0+x+ydEb6WY4Bn
	/SPeRf2PelERa0
X-Received: by 2002:a05:6402:2113:b0:6b5:962e:e00f with SMTP id 4fb4d7f45d1cf-6b7c0c6dbe3mr8755642a12.28.1794832702439;
        Mon, 16 Nov 2026 04:38:22 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm4600398a12.9.2026.11.16.04.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:38:21 -0800 (PST)
Date: Mon, 16 Nov 2026 15:38:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Avishek Chaulagain <chaulagainavishek14@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: atomisp: Remove unused any_virq_signal()
Message-ID: <avr5OsqqZEuOD6vh@stanley.mountain>
References: <20261116120703.6681-1-chaulagainavishek14@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116120703.6681-1-chaulagainavishek14@gmail.com>

On Mon, Nov 16, 2026 at 12:06:56PM +0000, Avishek Chaulagain wrote:
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
> @@ -107,7 +107,6 @@ void irq_raise(
>  
>   \return any(VIRQ.channel[irq_ID] != 0)
>   */
> -bool any_virq_signal(void);

This leaves a dangling comment.

regards,
dan carpenter

