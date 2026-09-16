Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D174BEE44
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544978; cv=none; b=RNQO4By1CI6RwVigLTYpYPZuxZWhJnVhyg7A0vdOQpy9QutL2k6DySfmQ198KcMQFraHh0bQwY2oRPXApxIdHaBZ2jdji4Jb94TrIjgjG0N8dI4C7aD6C1chlNaCLDB+qceTYoZnFIdD6YNFLQ8kWfA5e/4W8bRL+KMh8B/XJbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544978; c=relaxed/simple;
	bh=b1X/VL6KgCPW1EytoHst9Ms7xkpEPjih5dE88IdTOCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FcDyUrxv6y54AHT+ZhCf7PP1p2Y2g9arN/rqXA6pCf9GT7akwqp+iZ3mLp0JtbCgS+gba9FhuE+pWgDa3ZhkL/mv3gtofXeBrTBfVyRk0yDUk68fdknkyN9wYihG0zwgS3aKNbMC+zbZwfvq0jtx3ij07m+0tRzcnmh7f74PbvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPaXVrgG; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPaXVrgG"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efe5so101926566b.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789544964; x=1790149764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mKEljjs1KH9jBW8pyJ5oyeq8Cfnda0HY/+swLZurgcw=;
        b=QPaXVrgG/zZo7eKIAbn1+Y8jn95QlshMcmb1X4jpn3ZuBTz1bCUm911xUPfw5uUA9T
         nnQuThdHAmPSoCKPkLu/qpDh4fMGyQbDPEd1oB52kskT4aHVbmLVDAREuJFUGe16WQhr
         /wo488UiXbOwuQHkS1tEdeZAQCYOpCXF4tWzgAGUBZG5Ay4o2JB94VBsGP7iOzA6TyDX
         ItewmWMROpKUh4PzPLYOm4fiW1o+CzwapZ71mjKxQoWI4Apu8U2cKrDTyC+pv8WaAzRy
         mGvelkE9GmQ6VVAnH3/Z9fqUi9PSNhcHDCC+CEq98jVcQNWMfGZ3cbdh+XAK7sdpBuhz
         WVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789544964; x=1790149764;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mKEljjs1KH9jBW8pyJ5oyeq8Cfnda0HY/+swLZurgcw=;
        b=vB+4Ene4XGZAJPGJOS4Wze+kdAtoafvbaihDmTC7PAGh6Xuq1dhB72WiNPpGA6xd3F
         z74yf4ccSfZYG6n3D+gFhUVJt9EHikMG3iP5yOqM1414DIuJYFx8K18VA61VtfEzjJod
         bfvkzqm/NRFUT1R1Be835Adv+8wxLnRA9Oj/Z9JQt1kJX5IZl9xK9hg3A1ajS5OEDfBy
         xCItmwJFjd9NLkoLTcG1eDI0f4T/Lorw9aZ+ihbqnkaKrgticlX4QAJRnmNPorOcmUyL
         ICO+ZcjgUCtkfdBmek2I3Gk15+WUOBKoaFnPrTugLFvrSY2Rk6mWGabWMKrieQSnGP9X
         wlog==
X-Forwarded-Encrypted: i=1; AKwUvBx89JmWr0qPgCpllro7QTRDGIVUkCsll5jKUgRgsAQCf2cjn/tZ7f2dR7DIzK2lRrucz2Cx2ly0quM2rlg=@vger.kernel.org
X-Gm-Message-State: AFuF++lLCAPebEMb8QCWMa0m8eoyaXhj9PhAIXhUSQEO0jJ62tIiLXmi
	su2f/27hUPidJNNm85uRftJ2sML4FuJKgSR0nEDT4YkkIVccSI28fNIE
X-Gm-Gg: AYBFou1YTenzugEvQgggikU9Z1ZZ+XDhDgB6cFskKTdqNBSUKVK9acSWRioosB54dYl
	hhAJan8DXSLzJ4z1a0myKpwmQfBbtf7NtXUCkWXO1IHzvS2ZfouK7dtdST9qJUdAR59Hsd/ftB/
	9QEVAtutznNaWnxt1AIaoCLYmJ2ReqdTUQ8qRjvHhmitrFDJ9r/P9VbVV/bciJYR7MbT9niAttM
	0uM/F5/EaCSRGZP5puHux0hS5ExmcDRhFoK8+JoAz7/nbb/wdwg9fNIS+TR8WYzSiooOuS5xrXR
	F6jTu0/WmXYjyL+dU8Tks3ESAdIf7/aEWU0+bbyOWTOS5QyoNDSD08dcFRp8GSEbjHdJRSlt4eE
	eQDT3FgeIdRsnXdNftY6vQ/U9+I/J55qo8laCjtfoTKEWJGgHr6gJgaOdfwFRf5GIuQqbUFVPEq
	mJ9Y64YKUZwRUZ3LEvuHdR6mt8VLWu2QJfGLqv+UPpmjYSU0wk7JYLhuKE2K/Vs5D4t1w=
X-Received: by 2002:a17:907:d0c:b0:c25:6230:dfcd with SMTP id a640c23a62f3a-c29e51f16e1mr113809666b.15.1789544963256;
        Wed, 16 Sep 2026 00:49:23 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de454014sm80123566b.13.2026.09.16.00.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:49:22 -0700 (PDT)
Date: Wed, 16 Sep 2026 10:49:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] clk: Document of_clk_get_by_name() return values
Message-ID: <aqpJ_pupkr8HDIz2@stanley.mountain>
References: <cover.1789451862.git.error27@gmail.com>
 <b3de48fdbaaade69cce126b59bd6dfb8f437b495.1789451862.git.error27@gmail.com>
 <1jzexhd58n.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1jzexhd58n.fsf@starbuckisacylon.baylibre.com>

On Wed, Sep 16, 2026 at 09:28:56AM +0200, Jerome Brunet wrote:
> On mar. 15 sept. 2026 at 19:38, Dan Carpenter <error27@gmail.com> wrote:
> 
> > Callers should test the return from of_clk_get_by_name() with IS_ERR().
> > The function returns a valid clock on success and an error pointer on
> > failure; NULL is not a valid return value.
> >
> > Document this explicitly to prevent callers from treating NULL as a
> > separate failure case.
> >
> > Assisted-by: ChatGPT:gpt-5
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > ---
> > There are a few other functions which look like they return NULL but
> > never actually do.  This is one which has caused some confusion in
> > the past.
> >
> >  drivers/clk/clk.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index f1756fe59372..a71bcf780de4 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -5430,6 +5430,9 @@ EXPORT_SYMBOL(of_clk_get);
> >   * This function parses the clocks and clock-names properties,
> >   * and uses them to look up the struct clk from the registered list of clock
> >   * providers.
> > + *
> > + * Returns: A clock pointer on success or an error pointer on failure.  This
> > + * function never returns NULL.
> 
> Thanks Dan. I was about to apply the change but it feels a bit strange
> to document what a function never does.
> 
> Is this a documentation that should be added everywhere the return value
> is to be tested with IS_ERR() ?
> 
> What about being more direct then:
> 
> "Returns: A clock pointer on success or an error pointer on failure.
>  Caller should test the return value with IS_ERR()"

First of all, I just want to confirm that actually it's true, right?
I've read the code but this isn't my background so I might have been
confused.

If it only returns an error pointer then, it's obvious that it should
only be tested with IS_ERR().  I would be fine with just saying the
first part:

Returns: A clock pointer on success or an error pointer on failure

regards,
dan carpenter

