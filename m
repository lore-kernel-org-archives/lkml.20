Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909619;
	b=GwobHj9NiW0G/ws3dApxmRfDknpmhGh12O8hZvnVUM803PYXDOXsVvZX1JXY99+z6LnL
	 6Z60SgdBGZHo0+4La04gpZZ7xR2hnytJZIxGThDAMSOTvrtAX7QuruEirZRTK3Ax4fCfU
	 2RuJ8cRh4ZnHvWpwkvMNK7Zbn1ShGiyk/2yWhy0eTX4I2Q4G6ijnoYHtpC/+c+PqgPFzl
	 K1kfdPU7waY92OnUNUWN+KNKEfdxQQPROI2evOBcykty44UnV/JIlCZiIPdHsLgSmRDFQ
	 vMp5x4qq5oUkf8/Zu3NWCwbg5j8dSAoKYmZXFYoBUUOWeyJo6QT9g+k3dnTgCtxK30Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uINoRiE1GtHUaPA0Cv7RqFxvFT58JwcXGIedUlmNygg=;
	b=GHLXJyYZNuVUxYjpsQ87ZAO/bvrP17hvKuatnSrITWAnjKfSV2vIHt2sewe1kgqPMwt7
	 98QJYU5md2rP8F9Az9f4qao6vQaQw7cMGAb+3+2ZG+0W3a6qU5OvqQf0rLbN0SQRzCzm7
	 0bfpeEkgf+blUiFv5uLHvOUd9WJdKfJm/GXFLU8F//tHXWiX2t8SKAd6eGUuD+3X+mKJ0
	 dg0ZG+JjiU3tlU4+EuD4mjdTQv9+jvSzH8ViZBKMPmWyxCyM8/CghmSTE+lFoH9ejEWcS
	 7BSOZHlO1GtFukvPT4sXxAbZSXnsP+mhcdi7xy5Gi0LsFMTUYoSXBtdacupTYytOx4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UD47thWC;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AF6606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3AF6606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UD47thWC
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1326017eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793909618; x=1794514418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uINoRiE1GtHUaPA0Cv7RqFxvFT58JwcXGIedUlmNygg=;
        b=UD47thWCs8ygmghwMxYF4kpjAsRaxM/Mzy3DiP/yMMxSGBgDFbqxJhHtnbFiMhBlH5
         6pryiK/RRjj25LX6D0HkoKI4MsUW6TaULKOEQhmK+87d4hYPQ7KzCiURCqSziAcdWF24
         bdkFYmnmRiqqPEW+S6npb887dV09zQVvgiUm5dfA6fcOvwkx41SHmsTj4D4XB6aE0jI3
         UGs/KcjHzCrCDWi+1nyY46zVHKwhgtHyG0SjHUCCpMfO300/DDLPrnkHAOC4vjreyWKu
         rKzwMxVwCRkqWmo2YJOQ6p0EuXhrll/5RdOcrh1eMfl8mjiaRYUh/c581G7loQ1yaj+3
         b2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909618; x=1794514418;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uINoRiE1GtHUaPA0Cv7RqFxvFT58JwcXGIedUlmNygg=;
        b=jmFVa2n69HVZMOeiDz9eGQUvLmZE1RRRwjAtOfwcNlizC5/jusRAa6YM1eBURA/Gl8
         0LHXO8dQhBuW6BFW1S49EIL7QvOJt3sMV8YX7EPWxpN8DQbMto+H9rtlD1wolvkD73hS
         S9dpEJANCuc6iCqFp5UawvPYaKu7jDaelQQ1VKoo1z5SmF6VeVMNrlyhNrrk5x4hZpux
         Og2KOujevqIUaFUemT+wQqZioxY4Bbbeqfxi+zTN8VKvnSCBTMpABm+Xv0qjG/+VXRRX
         raxAJxxL20CVduFmodNgptOxv3UT3FZw55wTYGM/nYKY7OZZeKwOhCk/6bNV6RIDOUPp
         tkUw==
X-Forwarded-Encrypted: i=1; AKwUvByEQc2gyq3MYWlyE9oqyySRim8Ay73mXGaIJQtG+3jzuxETw/1IroL1Pf8Th+WYyFOvc9IHr1shcTzR6xA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9J4KkjvjmO1EieV4oAAdOH/3mEO1lWluWIkAKx75vLQ+WW5UPi
	D6ibrtnhpwNDIhTplaCxp612X52aUHe64EhLiAtgjr90WwqljspTQ5IEpXDSLw==
X-Gm-Gg: AYBFou0/sObdi/8rRis4z7l5o6umNxqKmzRMLWZJJfCGn74mJRo7YzJd5iAl8u08Dkm
	s0VHUk1XaQNPrmCsz23oidp9g6oqrt2vaWKiIaUeJueX/vGJrZp36jTvMldkJu3Oxs/O7Zwub6y
	aa2NXTcjmRAOKpfV3cZAm/dDTsIktiytd155mmTY53/u33Xe5KqEnbQCcgJeBV+iN53IgBYNLPn
	aFLqo3nOvDxSsB5gLs3/CBy4mUh20Iom68sVhGC3/CEbM7cFqFn5R+6ivDgbvZ5o1rTu2FzdpyT
	3vb77vBIerxK2K/C++Xy1Jy6piZ0PzYyfk9vAKjeid0x6htcPH6Wd+hVELDOdnnOI9fG0iUPT81
	wvEltml/jdlybjCKjUypuHkNC+Fd3x/6JoKmmYRHd2Kuxz/+Hm6kgzjVi2ST7yEe6hutpzwL7MX
	aOZx8lMTukXS4v68qXA5wk/PUsp2EjyAkDSIkRFUardyMRJwgWh6R12Nwid/L4KoenC71P1yOMv
	wti9fazaaAe8SvDyOMUGKyrnYA9QAmWDtIxnT1StzllkQuSF/QrNU4q/ktBEVzEtYxJ3dKxkCac
	VMMjA8JNZ0CzAkf6q7qZ+x0U1GBT1FhOL9Ynd4JthNHincVKmbOeOy/NKjf6W0zgYpCMO2I4bLb
	6xQCeQIzH0Nul24M=
X-Received: by 2002:a05:7300:680b:b0:36d:394d:e690 with SMTP id 5a478bee46e88-36f785b760bmr248122eec.40.1793909617470;
        Thu, 05 Nov 2026 12:13:37 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f722ed274sm523275eec.18.2026.11.05.12.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:13:36 -0800 (PST)
Date: Thu, 5 Nov 2026 12:13:33 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Kris Bahnsen <kris@embeddedts.com>, linux-input@vger.kernel.org, 
	Mark Featherston <mark@embeddedts.com>, Marek Vasut <marex@nabladev.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: ads7846 - consolidate coordinate filtering logic
Message-ID: <auzjWxQgGItAMoHp@google.com>
References: <afl3WtbabMFNjE24@google.com>
 <cf9e30d8-f51b-4a19-ae7d-914e6bccb265@embeddedTS.com>
 <afzo03UP-shPfNMe@google.com>
 <aimsXWeg3wouoiB9@darkstar.musicnaut.iki.fi>
 <ainpywl0lj_K2_Lx@google.com>
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
In-Reply-To: <ainpywl0lj_K2_Lx@google.com>

On Wed, Jun 10, 2026 at 03:49:20PM -0700, Dmitry Torokhov wrote:
> On Wed, Jun 10, 2026 at 09:26:37PM +0300, Aaro Koskinen wrote:
> > Hi,
> > 
> > On Thu, May 07, 2026 at 12:35:04PM -0700, Dmitry Torokhov wrote:
> > > I think if you pull 'next' branch of my tree, then the following patches
> > > seem to apply cleanly on 7.0:
> > > 
> > > c68bc840f06c ("Input: ads7846 - restore half-duplex support")
> > > 011bdf9f3a9d ("Input: ads7846 - consolidate coordinate filtering logic")
> > > 
> > > I hope they also build ;)
> > > 
> > > c68bc840f06c should appear in linux-next soon too.
> > 
> > Did you forgot to push this, or was it dropped? Because I fail to see
> > it any any tree...
> 
> Well, that explains why Kris could not find them... Pushed out.

Should I just merge it?

Thanks.

-- 
Dmitry
