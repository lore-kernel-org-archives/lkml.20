Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0A22931FB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188328; cv=none; b=FikMejX4zFtCSecIU2Y58b65V6oxxSae9gXtaDT0ZUEB5/DfsveH+jD+zQ9Le9csL1UL6xpi7LxZYWQeHGOTVzP3jW5J/1X0gdNzPyH5ewZpBEBNcEZtgX/B1rgrMQU3VaV2l3TGadq3J/oFqsIj2eyShWXAhBx2JmBKj4zRUj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188328; c=relaxed/simple;
	bh=3X5bF77aOOgRxbUh9C9RVa5EU0OKKkrEkiPrRbuhc+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyXPTuctZ+ZirAkuuhDaQ+dqsarCiG30lX1m/vuFtzVwNSI/9Z/rd61iTgi/46N+wtDeXFYqg0/JjLVXiAhGWUC4a/l/WR5m+N2oYlRqRjEDxH7GRuWVOMuSJYnuhoKOYZdHeYJP24QM5rulMOkjg7u/MOAL/XXZ/plRaZsh4vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahwuWKbY; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahwuWKbY"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aec201b582so4390987e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788188324; x=1788793124; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m3XoILvJ3RaNHwju2reUtm54LguvYTKnFc3Vc9HYR5g=;
        b=ahwuWKbYAT76wuNNmxUEkoqgYPW1//RO3V+pk7cpW33QtfqvIHz+3OYecbEhzGn6Ja
         Y4gvRqJYaxKuFETIFCdUK+UH+pZSNyVcgfeCzCpYwWISPoRRDkcKX51eyRWl6J5TeKx6
         5vZWJXK8JNuOZLRGwCai5JYjn6P1kg9IR2w9Wz9Po6JmLkvAshCcJQABl3FvF1gsika4
         rVjLMNNMMDJK1W3rclRd7o8eoJ7kDptVgLljcMHlvonEx2XwvW2Q1iQxoRxIh68wWYBf
         N9dmo+ZPCOYUodFDMnOy/8h5IkKNNzLc8xfokEiG469eX/zLtk7HNTSCmdF8uIc/uaQK
         XS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188324; x=1788793124;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m3XoILvJ3RaNHwju2reUtm54LguvYTKnFc3Vc9HYR5g=;
        b=UF4lNOj9GNfMX6hEZjBhb0I0KGvF/ayKswzmCGZZHdOs0BzzNVwaUaYQcj2Hs2Y3jB
         CqRCf3GqFxpC6RQffoPz0q+dh1+1KVkZZ+WT00YJAVdOQ1t1VeFDQ1aq2olhVP6Umycn
         Xc90MgylhDZnfr43Kur2LGmjStEySipfivIVTNcKQrzhoea2IDI7wkHiK/KmdyIQ97qD
         yG9lzTuZe9Hx5ERyyZj+s/vvftSoLRWdOG6hPWIa8tnMek+xTB6Ci80qDNtQ9eh18AkQ
         mlKkB5xoRmSxdnkxXn0UJNNhmB2ScqSdbT5znSBy1CZMJop/l93xkfxl3lrzHqzRC7op
         PG2g==
X-Forwarded-Encrypted: i=1; AKwUvBwv83FCv+gkOWRDNcX0XijQv2Lu841z8lnZHzFGaaj/TouMZD59qzy8aAtkhRrlXE+fLE6xJEyM5HhHc6o=@vger.kernel.org
X-Gm-Message-State: AFuF++kbenXOKzhkNsuwA2+AIhqQDRF9AQFlkm/yKbwPxpLxCCN5+M1l
	B73mT7iEf3Hetiza22UORX/S4WFC5O3Vqx3y/v+7xElhPsj6jvMPeBJy
X-Gm-Gg: AYBFou3ocbZLD2n4eDlw3oF+w5Z8pnihloxlaC45t/1AMm0AvCFTLbdrqRDrZr7rFFW
	S4M6YVa1/rfSezCourWj49xvPYP05Jg8t+LljWEGNulO6Xxdkm+yRuqY502jvkygPJK1o5b6NyC
	DVc7uJK2asEzJyw8jFDS5h0p6fmCbk8bnD1G/iWXVa/+RZIOHEF2+JMAgjPwH00u1I+uQgB5tR0
	YSGYMrr7g1lOQeljEKUkHqjVQS4LdprJOh8OMJ441gXSunpZ2jqvsGfqjB2vNW3VQzaopVZ7vqd
	I1rdNfDev0UdrQ1x080Oxhhq8PfpS67MeN7OktH8kU7F4xR4PD5DFoA3ibdE796BIwqrpL9NB39
	DHOcKfWKSLxAeDHUjIAeWhRUTRXwqoz4rEJVuO3NSUcP8R2y+wHkVexJi9a+5ZBVWsjO3HWbrIH
	rnSsMMJ2ibWA3i1P7JJdtoMixFKcLmWMn+EYZpHUPGl7jE2J7jxZFQbRHr8UBWvzwnUN9/bQ==
X-Received: by 2002:a05:6512:2586:b0:5b5:56b8:2fba with SMTP id 2adb3069b0e04-5b5e6902ee2mr8478958e87.21.1788188324305;
        Mon, 31 Aug 2026 07:58:44 -0700 (PDT)
Received: from archlinux ([94.229.16.221])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a0ce86sm2227956e87.62.2026.08.31.07.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:58:42 -0700 (PDT)
Date: Mon, 31 Aug 2026 17:58:39 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Zongmin Zhou <min_halo@163.com>
Cc: gregkh@linuxfoundation.org, kees@kernel.org, david-b@pacbell.net,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH] usb: host: sl811_cs: fix memory leak on probe failure
Message-ID: <apWWnyGbVFJ8SbiG@archlinux>
References: <20260827074120.49006-1-min_halo@163.com>
 <apHG0Pq3HagSo5BT@archlinux>
 <a4e969d7-4601-407e-a4ee-beb85846d711@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4e969d7-4601-407e-a4ee-beb85846d711@163.com>

On Mon, Aug 31, 2026 at 02:11:16PM +0800, Zongmin Zhou wrote:
> 
> 在 2026/8/29 01:36, Nikolay Kulikov 写道:
> > On Thu, Aug 27, 2026 at 03:41:20PM +0800, Zongmin Zhou wrote:
> > > From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> > > 
> > > sl811_cs_probe() leaks the local_info_t allocated into link->priv when
> > > sl811_cs_config() fails: the only kfree() lives in the remove callback
> > > sl811_cs_detach(), which the PCMCIA core never calls for a device whose
> > > probe failed.
> > > 
> > > Free the private data when sl811_cs_config() fails.
> > > 
> > > Fixes: c6de2b64eb57 ("[PATCH] USB: add sl811_cs support")
> > The code looks good to me, but I have a question regarding the Fixes
> > tag.
> > 
> > In the commit you cited, a failure triggered a call to
> > sl811_cs_detach(), which freed that memory. However, that behavior was
> > changed in commit
> > 
> > f8cfa618dccb ("[PATCH] pcmcia: unify attach, EVENT_CARD_INSERTION handlers into one probe callback")
> > 
> > where the call was removed, leaving the memory unfreed. Shouldn't that
> > be the commit referenced in the Fixes?
> Hi Nikolay,
> 
> You're right that c6de2b64eb57 did not introduce the leak -- but neither did
> f8cfa618dccb.
> The leak was introduced by 15b99ac17295 ("[PATCH] pcmcia: add return value
> to _config() functions")
> 
> f8cfa618dccb dropped the detach-on-failure path because registration
> moved into the core, and its probe ended with
>     sl811_cs_config(link);
>     return 0;
> A config failure was never propagated, so probe() always succeeded
> after the allocation and it remained paired with the kfree() in
> remove(). No leak either.
> 
> 15b99ac17295 made sl811_cs_config() return -ENODEV and the probe return
> that value -- the first time probe could fail after the allocation.
> Since the core never calls ->remove() for a failed probe, link->priv
> leaked from then on.
> 
> If you agree, I'll send a v2 with
>     Fixes: 15b99ac17295 ("[PATCH] pcmcia: add return value to _config()
> functions")

Yes, it really should be 15b99ac17295.
In v2, you can add my

Reviewed-by: Nikolay Kulikov <nikolayof23@gmail.com>

> 
> Thanks,
> Zongmin
> > 
> > 
> > Thanks,
> > Nikolay
> 
> 
