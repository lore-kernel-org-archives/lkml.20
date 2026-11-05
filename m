Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897187;
	b=xDL6oZtP+F9iDi/o7gjoFt6LqEue8pSfloWjQPm5Sp5hOTHYXiphZ5SdO0Hnw+7b/Fn+
	 Xx7w7u4cFgajOt1Cak1CO2UkOA7DZzGVckQingn9M05BCDaZtPckD8yxWsu9Qg9G2Q/Xz
	 IAZaxb2wKwQQe/StjglRHfSTzmCXxw5AZ2wfonyqqfbahXnnLOYz4ks5ygT2YjHF0yLdH
	 wSOzdgNen1H2PL0zgOeG7eEsr53POKA77+xi6qPI1Q4qv7nSXWRvqAMA3QsMltqUvt610
	 SFiKmytTKgzPzj+zG9Gxlg8nUj6yAsi2DfXdsla62IF98T8I9JAXqBFG4SWZznGh+EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=UephkWnsxE2cWbdnAcjd07eNbKg68ODRUaQObxWfBXI=;
	b=O19rGvYP1lYE+6nBsyUINrQAnurxMF/o9YIkCuMjYj6P971b9eNBMcii8UjpmfOTarDu
	 wBWs2jn/tXvbOTbQ61x/RuX/JeGdFSU81RtlCEZ3I8mH0W2rAiun6463Y+2FstHwqfxXw
	 0PlYxgV1Bx/fgGO4Xy1TUHdqIghrGC3oXnC5Vjsk2JRHu3LbN07PUJrb1a7/K4Yqc+ToJ
	 QB7gHvJiV1V971xymxweOSk0DCu+Da/91H8bpa9h0ZdyL30ydkwgc1tVbDI/wYpgw+k3g
	 EbP+4d7nDyjqrVMAyiadmiCHf5cnA+Kp85C2CdA/nVT7u9ussPFlMTGJOGTyT3Nrd8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DAT3jIBB;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F54606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16F54606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DAT3jIBB
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so2464886c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793897186; x=1794501986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UephkWnsxE2cWbdnAcjd07eNbKg68ODRUaQObxWfBXI=;
        b=DAT3jIBBkvNW/TMlLUjOwalpPJ39DN//fNGPXUoo1TJ2h7XXmxbcIR390H1qNU3e8n
         nEv8qPHmAayMiF1xjnCFpp1LZgPfvfQ9kMMXEC3Gla9aWSXKmiEDhbFdcmjer03dVf8O
         TtNLR25KpRuhJLgYKKA0APgjARtn+ClddowT6lsPlSjjIrH8p4v4kXSlgm1fAjpyAMYi
         F6HirblkwzkTmR2t987KC+OtDjT1X+KmVBct6JEqYsf8YOPpP3hRrmd+RWuWcgu7fn6Y
         xf1jkAA+KdIcrYU7pX4Dm07mAA5CNNptK/dzuFMB6Tx59eQ6gmz/lHv2pA2xechYJVJO
         6XKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897186; x=1794501986;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UephkWnsxE2cWbdnAcjd07eNbKg68ODRUaQObxWfBXI=;
        b=FPLXyKucgAmNizO6DQj7jT1ENGBqSxr77lNMntatzb/Dhw/GSqJ2d+vpGpO69vVAf1
         aYrERwTJ+G7npS9gHqCrV6TyOXsKtCWXiSJuubyMJVZIV5HvRjp5xOV1QZn2nvzidKvB
         go1qtfwBWjg9SlMgf2cyrm7bhHH+cMbGYsmmGes+UlIrLsxmi394o309v9yBHUEz1GYl
         Gkt6w9UMtoiJ/jVTJYM43AC0hC5iSag9a0znKu17Gayy5KYhYJZU6gxBM1wSyh25ncbp
         KgEri5uxPJdhKp2j/ofXGAl2kuId6W12/+d5p3hKqTi05Ae0I5NmrVCTogpkNOZJjQ67
         wKPw==
X-Forwarded-Encrypted: i=1; AKwUvBzYsN+VZ1Mb3AbDUlPbajWwumEleORwA2IARF0mWME5xVs4pLniq/leDex0SZXypcwXTJkFOnQQoDf0S7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wUymakZLj64FswC1rnHsdsMOBneLw1MvA73WHwBaIn/18aLhY
	tkmVQsdi17/lkb1sX/95Vht8yaZBFXjECVipuBeFtebLFYIiEgxoWuogqtUeSw==
X-Gm-Gg: AYBFou3GXVmLALtSNUss9W3hnyOLu7L9Ny9u2TNakhxNWJjiZqGR4kEl+npxdeuL7KZ
	7h6wDvEvkW/qWijnK0IWHHD1eWywM6GA6Igf9ks9kWHkhQ/QnEfGna8j6jG0UIs1YSpws7o9fHT
	aAai0sNGjYZPlmZmZat2x3QD32JtvIEsawe6jzaEGLa/zoJBVuvK8vJKsJRsyS560jFNb4oQnRG
	IhLFW87gGZ+3rVnS8bIYfMTJIegPLuixSHp8R9QcdOr1P6GCm8mEF8Zl/AKeSHLqZaUqemiZtFG
	3tcZc32F9hJv0q3ufOwhaYDfCFx6K8fL3tOBiVmucXFmrEst3c6UPE3TKWIxaIqXfdKTu3FzmLP
	sMpbIVSpIywqP2X2j4y11Y25OXpTX9kpWpdLCBUU2y273jM8bRAu+KzcLLYRvQoO4JXm4GcoqpI
	FmX0cK3ou3cY6hVr/XoVoT0gNFXESiA3JZXdVXBNd9Kk32kNJ47HGEBIHg9dlJS8mkzF0yXhaU6
	sblpgv00K73d01yTal4XD0uSq98lPyiGFrdO0oDv57BtUykTCaDcsFZy11YtJozHBdC5MdkNNfR
	ZqayRg61IAPJqzeZh5LRje/TNuHm5Iwtov+SrmXYM65JC+ezbFMe93cBkJwiu4qHEMy2Kg==
X-Received: by 2002:a05:7022:108c:b0:163:c5eb:d42f with SMTP id a92af1059eb24-1ac574551afmr25949024c88.5.1793897185745;
        Thu, 05 Nov 2026 08:46:25 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25100667esm9417659c88.19.2026.11.05.08.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:46:25 -0800 (PST)
Date: Thu, 5 Nov 2026 08:46:22 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: bartosz.golaszewski@oss.qualcomm.com, marco.crivellari@suse.com, 
	arnd@arndb.de, tony@atomide.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org
Subject: Re: [PATCH] Input: gpio-keys - do not BUG() on requested wakeirqs
Message-ID: <auyyyQN6_GIqeDox@google.com>
References: <20261104160305.2501369-1-andreas@kemnade.info>
 <f5c1435fbfa7568a107c864781897d6e@gmail.com>
 <20261105071952.33c39dd8@kemnade.info>
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
In-Reply-To: <20261105071952.33c39dd8@kemnade.info>

On Thu, Nov 05, 2026 at 07:19:52AM +0100, Andreas Kemnade wrote:
> On Wed, 04 Nov 2026 14:28:15 -0800
> Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> 
> > Hi Andreas,
> > 
> > On Wed, Nov 04, 2026 at 05:03:05PM +0100, Andreas Kemnade wrote:
> > > Having the IRQ handler called when enabled IRQs arrive should be considered
> > > as a feature not as a bug. So do not BUG() there when this happens.
> > >
> > > Fixes: 3717194f24922 ("Input: gpio-keys - add system suspend support for dedicated wakeirqs")
> > > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > > ---
> > >  drivers/input/keyboard/gpio_keys.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
> > > index fbc31c5db3db..f1c31c5366f0 100644
> > > --- a/drivers/input/keyboard/gpio_keys.c
> > > +++ b/drivers/input/keyboard/gpio_keys.c
> > > @@ -412,7 +412,7 @@ static irqreturn_t gpio_keys_gpio_isr(int irq, void *dev_id)
> > >  {
> > >  	struct gpio_button_data *bdata = dev_id;
> > >  
> > > -	BUG_ON(irq != bdata->irq);
> > > +	BUG_ON((irq != bdata->irq) && (irq != bdata->wakeirq));
> > >  
> > >  	if (bdata->button->wakeup) {
> > >  		const struct gpio_keys_button *button = bdata->button;  
> > 
> > Doesn't gpio_keys_irq_isr() have the same issue when a wakeirq is
> > configured for an interrupt-only button?
> > 
> yes, it has.
> 
> > Also, neither gpio_keys_gpio_isr() nor gpio_keys_irq_isr() uses the irq
> > argument for anything else, so instead of expanding the condition, could
> > we simply drop the BUG_ON() from both handlers?
> >
> Sure, was just unsure about the intention of escalating things so much here.
> I think we should trust the interrupt system a bit.

Will you be sending a new patch?

-- 
Dmitry
