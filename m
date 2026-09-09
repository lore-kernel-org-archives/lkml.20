Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689973CEB8D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945702; cv=none; b=GZkmuMfiYtNl5dZT+41dDhctdUcq/lme3PG2wsOthKb0KBsCpivnp9rGAq+su4LN2TgIholnyJ1294cgT/DaJoyUM55mf3Qn9nMC32JYCZWIdYfNzhtpvLZ20MeGMi3POlXwnnYBVIVfQvB8LNA63pCon3PaBpNPHsy6rUKHo0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945702; c=relaxed/simple;
	bh=ICGMTrXpwIIBXAJnFc+I+pomrUKlAtLAiFtXWd8S6ng=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oSNAW4IfDmXyk4KWWukne9+fV741tEC0YkpjYCTqdp/xeHHPfnSgXFBxZQ6hNxXeVWWMt8fKRgfwjf5FcjMIGWq1CnFfYAu3LrFZPTe4liv30cR/qJSZZDEizqoohNROh2faZOEHbHbtCGNK4InTjTfQhsna+jDqkyhku8pvQxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iiU/8qZ+; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iiU/8qZ+"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso9661f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788945693; x=1789550493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+bx8r12BeuAYLf50LSaYPgNAKicF1/HQoL76XK7CuDI=;
        b=iiU/8qZ+6tWq1gzUi/Ch9L9OlIo1cxyyzvjb3qHVqoYprK+sRykh8iomBDSD6qpz2A
         Gz2Kzs214ItwAflHDwBlnmBp+akdwh5o5BKdkggSuNt0m4AhAh28LXW9VjwsrVeZaaGp
         Id51FcYuU8EIkKBRKoBXNdy5JYMyGtI+9hUsy8TIKMoLpEdvnBVItO7sQLwC/bbxF6wm
         vvkU+leRyGFuWHduVPYf7uTnCNxBN41r0Pj8q2QQCGvkZAKObBHq0+LJkLmbrG2Rw3+O
         bM4CtrFkxh2b1RAKkq5DsmjsyN91KVh96YcgSwEr4BNGh8B7QuhFByfCY53EC8UOjEzd
         oAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788945693; x=1789550493;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+bx8r12BeuAYLf50LSaYPgNAKicF1/HQoL76XK7CuDI=;
        b=JzyhoJQA4SxdELFpZws885vYjnjAUfiIfW1inTe90upxxLoddJmJDwAIPKMUwLsxVh
         NE8xgJwZBrIRwSHpuvoWrTuXc4Fw7J0+JEok2vsz1XngAAAg4G4VCFoh9DUUAmume86o
         UEx4D8j+fW98vwnt4f9HkSH/0dsxxkVi9eBkIylUwaZulTb7jWBqinZ10kGSjuh0viwN
         DnQQdmLZO8FbLGt/wIm9UtAxJuRXBlGfhm/4d00qynvJD7uawsyg6gl8NU4FeNf0X0oN
         EppL3004OWnsBSMlf7TCm7PCp70SmG9DCpB4c42WmScjX12T52CIZbLYMHPG/OKBiIU5
         Yuuw==
X-Forwarded-Encrypted: i=1; AKwUvBzvoAIVxvItvWixf7QSnZPFGj0KdJ++en1njIE1gL4J0zT8abZoTrHAypBr9eKcwPTUl1RiQspT/TLwQsk=@vger.kernel.org
X-Gm-Message-State: AFuF++kzLCL84P84R/7DDPZkLKpxDfp8rqd3mpJA8RvqycWGD1Af4mnL
	6be6drzjupuKXZBBRQRyoyp2SyGIkpCBEiQrxNhunrvLBoCXIvNerTr4
X-Gm-Gg: AYBFou1FPtBJUfiIbYfJBMRXPxFzkHpVBX0ABcL8Gxm6bFdIO+1Hw74//qOFAn4iMOh
	dwe1re1qxms1wbfXZZpMoNKnsh9FZNunpQzAyE+3HNn0JbjXBXieYsk6USsWDoJX7iO9b4LyJoj
	iyHPnDqdhxU8pW9CGeMemAq0h4yNhGCBwSPAoWZQ2ej2fI5ypMEwHdtSos5B+IjIJeozPyGgAxt
	nolzmgTk2DHF/zOzc+kl1OgR+e4mBlIz56PRjw7TDiImUUgt5owyQNPAi6rJyoBODyNFAgir2y6
	Yznxb+YLv348605DRpYfCFnTGeTWY8FQcbhro59HjCyCoHjvjS6DV7QbZo2y7xuJ8N06KbTfnLn
	DLOiz3k2IdMJLSuQLdXnIcpznbcSn/y7Bq7WeqrAaIyH8qqDJFhJx9BXSkTt1m3tZS0rlosOlWd
	A5RngCMRnM98suvjhMN+eShCOXnYBNNIcFJinx3p0MYeRIUkjwW2KrER/J48k26o+WyopIcvo7y
	fDTKhbEX5VdIT6NwvO/Miw3S0nZEk7AcHCqZpBcNZM9dWoRXX2CEndKg3cLqGoVZPzlKHsLjfS7
	bnsw0cp4xmGR4bOwHYM9VOwATHYoby3mVJAuHhkxIL4w0UEkkV1mdtjaTYruvtkTMAZ/iKqvXLH
	XrRJ6OWC8QJ1ZWMEy3NmIAOcBymtisQhZgH2zJtsgUtioh0DKrAQxtN9FxMcN0uuTddXNa3Hnp3
	witBtg
X-Received: by 2002:a05:6000:40dc:b0:485:ac96:7251 with SMTP id ffacd0b85a97d-485c23e5bbfmr212565f8f.21.1788945692975;
        Wed, 09 Sep 2026 02:21:32 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm41842268f8f.3.2026.09.09.02.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:21:32 -0700 (PDT)
Date: Wed, 9 Sep 2026 11:21:30 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Esben Haabendal <esben@geanix.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Lars-Peter Clausen"
 <lars@metafoo.de>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Martin
 Kepplinger" <martink@posteo.de>, "Sean Nyekjaer" <sean@geanix.com>, "David
 Lechner" <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, "Martin
 Kepplinger" <martin.kepplinger@theobroma-systems.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 9/9] iio: accel: mma8452: Support interrupt sharing
Message-ID: <20260909112130.0000307e@gmail.com>
In-Reply-To: <87ecf581cn.fsf@geanix.com>
References: <20260907-mma8452-open-drain-v8-0-c17407e22118@geanix.com>
	<20260907-mma8452-open-drain-v8-9-c17407e22118@geanix.com>
	<MzPTxQYymt0hmx-TacfSh_fIDYxz6pFiDnu5MTWC5w7AsH0QPasKb40V8t01ggjLJlDF7yzQ4E_7o_kqDvMG6w==@protonmail.internalid>
	<20260907171022.00007100@gmail.com>
	<87ecf581cn.fsf@geanix.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 07 Sep 2026 18:36:56 +0200
Esben Haabendal <esben@geanix.com> wrote:

> "Joshua Crofts" <joshua.crofts1@gmail.com> writes:
> 
> > On Mon, 07 Sep 2026 16:51:04 +0200
> > Esben Haabendal <esben@geanix.com> wrote:
> >  
> >> Adding support for sharing interrupt line with other device requires the
> >> interrupt handler to handle runtime PM suspension properly, ignoring the
> >> irq if the device is suspended (maybe even off). And while at it, we use
> >> the PM reference to ensure we do not get suspended while processing an irq.
> >>
> >> In order to prevent the chip from raising irq while suspended (that is when
> >> using fixed regulator, where suspend just means setting the device in
> >> STANDBY mode), we disable all interrupt sources by clearing CTRL_REG4, and
> >> then restores the value again when resuming.
> >>
> >> With that in place, it is safe to add the IRQF_SHARED flag.
> >>
> >> Keep in mind that the device by default is using push-pull for the irq pin,
> >> which might require additional hardware design to allow interrupt sharing.
> >>
> >> Signed-off-by: Esben Haabendal <esben@geanix.com>
> >> ---  
> >
> > ...
> >  
> >> @@ -1784,29 +1796,62 @@ static void mma8452_remove(struct i2c_client *client)
> >>  #ifdef CONFIG_PM
> >>  static int mma8452_runtime_suspend(struct device *dev)
> >>  {
> >> -	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
> >> +	struct i2c_client *client = to_i2c_client(dev);
> >> +	struct iio_dev *indio_dev = i2c_get_clientdata(client);
> >>  	struct mma8452_data *data = iio_priv(indio_dev);
> >>  	int ret;
> >>
> >> -	scoped_guard(mutex, &data->lock)
> >> -		ret = mma8452_standby(data);
> >> +	guard(mutex)(&data->lock);
> >> +  
> >
> > Hmm, this patch might benefit from breaking it into multiple patches
> > (the change from scoped_guard to guard, the local pointers etc. along
> > the fact that these aren't mentioned in the commit message), but
> > that's up to Jonathan.  
> 
> I will try and improve the commit message. I don't think that breaking
> it up makes a lot of sense.
> 
> The change from guard() to scoped_guard() is closely tied to the rest of
> the changes. At least I am not sure if it is even sane to make that
> change without the rest of this commit. It might be fine. Probably is,
> but is it worth to risk causing trouble for older kernels?
> 
> Regarding the local pointers, I assume you mean the added struct
> i2c_client and struct device pointers. They are only used in the added
> code, so I don't see how I can split that out in a meaningful way.
> 

Ah fair enough, no need to split it then :)

-- 
Kind regards,
Joshua Crofts
