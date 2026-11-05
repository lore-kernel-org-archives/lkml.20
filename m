Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878357;
	b=45C1fJbfd+La75z3Q6MoWafawwcV5uiZgR79jOqFTsasJDKlruQykuJRjUUnpI9fkT95
	 Z6sxxZYF43mONloG0uBTUGbu6yTLcmJqrlxV6QHF2OWV2TVX1VIT1xbOKZcQsG8gLM5PK
	 wrDgevI1p6i4O8JIlo5yFFGhweaKVCU3j5mMLRa6bZ/PzIUGOPRNmaEXo/oRc2VgM6b7A
	 4ze4K3YoJBEWuJy/Uwah+fvr8wWCEo/aMH+i/BCW3yGFjM5Lq/9SFGi9wrLLvErY2cWS9
	 uVOqcOkQFmyj63eW/SSWzPOFqMSxCxUGAwsx66pZ+REzVQVqXG4+dHL3+Rw/XRuZ9hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Hv/YqhUcbRh9eWhND1HEmPv7Wx8/p/XxUOLWb+cXlc0=;
	b=cGZO5jBlm+d2F9hYOAm35qvV2IQQXfKwlJOFhbShX+vfNBkaGQOMahWyHGXjoiW2nDBk
	 qEMti9bBmhUX8sBA88kj98ZqnqfAh73CXu2NiHFKNOCjZiZc6wnzNJX39c5jObgjJb5PX
	 gFKjazkvX7Uz5CjqhCkDSyMe5fW7uH57dw/x30ACH++Zt/tC/5ZEKvaZtZYvoOMEbO2qM
	 WT0pjimzvaMzjhPKAJE1lua/WMKQ/Yk6kwa1DxXT+qeMWJRjxpmEumwHvJ0aMECeV8Iqw
	 9MGM9t0ivuBhU/vDgAezSrZf8+hRnQxY2c1b50QJoogeS0BCiyBe/BpNLwSyxMaC4Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gCzhsiwh;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3331D606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3331D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gCzhsiwh
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49231763f81so14043f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793878350; x=1794483150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hv/YqhUcbRh9eWhND1HEmPv7Wx8/p/XxUOLWb+cXlc0=;
        b=gCzhsiwh+9TzJMsLX87aGG0KzgXUNwVed4ZEt2dCuLs93W8hNgD2S6kh7CnhDWk6th
         c+/CJBoTDuiXWkKZxA4OBTMoAeBM651auVk8jLmD9tODmsIIGa0CQHfpUvEnJniX60g3
         4eaKVYlIIWc+97nFpdoSr0V/kz9Rm5Q7npP/adX545XmrufV/7p+1FuacB+TRxp2iMHo
         eDELcu9+7/fRm0sCUWh7ZPZLywlbhqt1WfY5cSBiksN56N+g2mjgxr04UtSMjA94pZc/
         ICfzzuVeqGRiu8Qzh/bnysZ8Ri9wHCdM8ME6YT9AM3k6WjIOmMWucFGBt5fCrYaVafip
         KyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793878350; x=1794483150;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hv/YqhUcbRh9eWhND1HEmPv7Wx8/p/XxUOLWb+cXlc0=;
        b=J4Lhmn5yEGeuua6gjh/VI3t+ZXqkSx3US/3zYLmuTJn4l0vWUU7vrn1AS96f8qRUDX
         ssGVIR8KQp+FQ7E77Vy2zqexPPWAJLz+bv1M3lg+c9+pVbaD7Nw67QyzJStpB2o2q0wi
         0g+z+uccykqsJ+xqYNd9L9o2ZcJEBUs8g0QgtVZ6gTGBYiPwo/iOEYFhaB9unJSO8fpL
         WvjTykCCj2WGrTAvlsR1v2zaqakYybpuIuIv0j0IFLPXPxHxuOXqrV+RCx6TTNnkqYbu
         zocpIgVM6YTfc35hUPvpl1xT6fHOpYqgd5R4R/+BY3BKOKOaFZs9hXX3U5eug3PVuUHk
         5xwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSdC5+RuGO/F0dZyHrPsxg6V9p1dixp0y/DGzsoSDy8V0aHGfH+6FAuwcENWDlbpN/93DlujPxlEaqv9Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nwjWGwW7DXqAyfar57jFo/Hiw0Uf+DeLqB2Ta6lCRZr1J1uwd
	xI7D8aQJ8UUS/0debGUN1hv4vYTbDYycD0805slv9B3Fs4V32wiveEZMqiXmObmj
X-Gm-Gg: AYBFou1WdwP5mqnfZxEh8TSqpD092kLxLQZBzMSuNH/lJjLESrYC8g9vgIbw3S0mqVF
	pxEk8s28fuGJHExLDx0Y2Js8DlIYHiL3FL3HXAclWI/1Ws1ft8c5T/d3MPDKO2a66k1O6PrXtFT
	80C61heWkd4v8j/JffBA66HoSKwSNwGNt8vqF1pGFgO5Duy7uA8kYs0gPOZJb3bHfOkipY1vaJK
	pNs+U4wRIQMFp2J813Gq5+lXs+ITmfHLDE+4stk4azCVVF0AS9X4JYA+nW7as4lJEHQDUK+bSfv
	M5yrg3W6hvbFLWyOwxWlVc33ee3NLmhtfqiltwahraNoP1arZPnYWYK7TIyuA07eReRbWkdt/B+
	kw5IMbDj29ljeB44pRCqW4ru1dB8PLkEAg1QP0yZz1oRAcoaX+TPUw54tkm5k21On1fPx2HYcH6
	ZLMJmsW40L9T1d/tvufypc7vByk+iwONoNCv6GsnBjUB2dE/Btdfyp+LzUF+xG0F1yaaEEXGaO2
	BAOfs/reWjsa2+CXCZMWLFNk1j5R+SpKjugkKG+8TdgVHjHBNC0aDuePf0WN3RMH7DD1Gd9pJDE
	sfEjRBzGP3um05qzs6reS9Rtz+6r8meFu+DmUENfBeEkz1vfuUF9fVgCUTvdm+//
X-Received: by 2002:a05:6000:46ca:b0:48e:679a:4aeb with SMTP id ffacd0b85a97d-48e6e2bcda2mr28288827f8f.3.1793878350394;
        Thu, 05 Nov 2026 03:32:30 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99a5dsm9469614f8f.21.2026.11.05.03.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:32:30 -0800 (PST)
Date: Thu, 5 Nov 2026 11:32:29 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: Mariia Nikitash <nikitash.mariiaw@gmail.com>, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, kees@kernel.org, justinstitt@google.com,
 morbo@google.com
Subject: Re: [PATCH] media: siano: Replace strlcat() with snprintf() in
 sms_ir_init()
Message-ID: <20261105113229.4126d872@pumpkin>
In-Reply-To: <ausVkYs1-3rJ5Fj0@devuan>
References: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>
	<ausVkYs1-3rJ5Fj0@devuan>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 Nov 2026 12:25:17 +0100
Alejandro Colomar <alx+linux-hardening@kernel.org> wrote:

> Hi Mariia,
> 
> > Date: 2026-11-04 01:02:39-0800
> > From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> >
> > In preparation for removing the deprecated strlcat() API[1],
> > replace the strscpy() and strlcat() calls with a single snprintf()
> > call to construct the IR device path.
> > 
> > Both the source and destination buffers have the same capacity,  
> 
> The line above seems irrelevant, and potentially confusing.
> The size of the input is not important, because since we're appending
> stuff after it, truncation may actually happen.

And gcc's stupid format overflow check is going to complain.

David

> 
> > and the return values are unused. This preserves the resulting
> > string, including truncation behavior.
> > 
> > Link: https://github.com/KSPP/linux/issues/370 [1]
> > Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>  
> 
> Except for the small comment above,
> 
> Reviewed-by: Alejandro Colomar <alx@kernel.org>
> 
> 
> Cheers,
> Alex
> 
> > ---
> >  drivers/media/common/siano/smsir.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/common/siano/smsir.c b/drivers/media/common/siano/smsir.c
> > index 283770d583d5..636ff228108b 100644
> > --- a/drivers/media/common/siano/smsir.c
> > +++ b/drivers/media/common/siano/smsir.c
> > @@ -55,8 +55,8 @@ int sms_ir_init(struct smscore_device_t *coredev)
> >  	snprintf(coredev->ir.name, sizeof(coredev->ir.name),
> >  		 "SMS IR (%s)", sms_get_board(board_id)->name);
> >  
> > -	strscpy(coredev->ir.phys, coredev->devpath, sizeof(coredev->ir.phys));
> > -	strlcat(coredev->ir.phys, "/ir0", sizeof(coredev->ir.phys));
> > +	snprintf(coredev->ir.phys, sizeof(coredev->ir.phys),
> > +		 "%s/ir0", coredev->devpath);
> >  
> >  	dev->device_name = coredev->ir.name;
> >  	dev->input_phys = coredev->ir.phys;
> > -- 
> > 2.43.0
> > 
> >   
> 

