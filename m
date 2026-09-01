Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608C52F2619
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262297; cv=none; b=Rxc6ky16YOcnunn6aVzb81JIRnIRPzbPlgHPNkrjC8LYA68hgvAFcmF7H3jz8awmjWI7Nbuml1unRC04kXHf/FYg+3KPCdLKabDmTBzw/KBHDhEU684bfzBbAQLnjJDZDF/ZcO2V4CWgWMkDQzfFxz5FBh94mWGW7KS0aM/iKvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262297; c=relaxed/simple;
	bh=dpUUXhGrTwOOr6MTfDNkGq3Gdc6J6xFB1ifGJI77iUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnpotAjSJrwH2k9OVEKMhsVlyTjuO6hcVqj4kmTil5hUkxEpTWywaPd+JtsRikL4UC/16CNTPlHd7Ckv2l3rbittNCuGWyq8+gutx5NYvi1iPxG/UHWV77rBJyYdmrIMg1cETSLyYSYGmbV08viM5wTJAgETHcNGzwDCdMK8dM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXWAKBXu; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXWAKBXu"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ce98cb8165so10164345ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 04:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788262296; x=1788867096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aKwDzY/mc5JLXQgUwalukrAvwZdlGt9fYkaqxqR1Bbs=;
        b=XXWAKBXuntNttGMZrprD4thL7w01w7R24gsrfq7gunT3wYaT5z25AVYlPeQARBsMut
         grWME2z0RlThOCat+SuMKbe0CTrL6iXK9MfVcZFJwjtWid5afrr71I3MOk17eOrL29RX
         2fPZ+aqX+bt93PAzSzLsg5AGegB/nEaxPsmjcyzSoWRr1vASM4Q/P0Y/SmWK0/YImJj0
         Cbj6xeA8SDY8i9/QdrykqFxu+pEitHbTG6k7RzT/iobWqEqKQUxH+Efu4RmhkCJxZ9uX
         Ls9MDRNuU8khEL/RGAW8QEWdUepSPciwlw0EO0HemiGw42e0rkSTGj1pmcMbXmwEbLyr
         kYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788262296; x=1788867096;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aKwDzY/mc5JLXQgUwalukrAvwZdlGt9fYkaqxqR1Bbs=;
        b=hevVCekgbzYyX71TvB3SUNA49D2sXF2EbTp0x6CHDjJkvjITfqNe8U3OA3k6NKVE63
         JiGsuG/yGuR1j7/mP6vcdfjq+mGgKcqtOnxcb1bybaFEfTvmmtRzfutegqS2R//Tnrpw
         bESQ2xZo6SVEkAqz2+R1QvMo3/tdRXzNcQ3BaGdpgzLefDfxu27ekumII/7+7NXgDFsy
         o4C+PS9ZdraMJ4pxM7KwQI0u7R310NsqFTyQqky+GEq4SmSB1LkdPdGzTDUBTFoZVGgR
         Za6qoOHgkMintX3h5gQasTtjPl8qo0R9WSugCv4lI78k3Y5LYcl7mY8MAprJmoxSl85f
         HzJg==
X-Forwarded-Encrypted: i=1; AKwUvBzS32B+RNsHllICDGaqsefebyAJCAzvPnY9uvtn+oejXtuxbJiI9TZX/iwnNoxjawqKTe4cRyGBWe87pOQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ntbMxz3wWvdCBtv9xMZJhjcrepsqBjLMOG4UaVnmvmLG/O3eMY
	UBX/1ebCUy79nmX96iWr1mrqrOsD6yyWjHWeIg/12ylxdZRl0Fk6sb4U
X-Gm-Gg: AYBFou3ffXXFmcZrhtbfWAk8kxD1nDuGzbX0biMr2Gd6+QhPPGBQZJxm/pH/1nu/CoN
	69VgdRqjAlkj6lA/yN72oqNJ/39lVsr22gzBhx4nlIUdRqs197XYmN/z/Qcp1MmfnlJysrlJH+R
	Sb0jo5bBVSUR26Qnc6TF5SvfNy7bpsGqNf3mH+yDuwWaiir2uiR3QATXirOCCXUxBE3TSYnm/0d
	X+/Uw7f8WGdRs6vSX3mcBvQ6mGrLFzkqCoqOW55z1L/rTz1lhIioH3qjZlUPxe0KG0g+28bHy7A
	HwluLoBskN5+sDjiEMww7/XE8OltzWy8qvGL4AQv/lx6ZsvDYNfhUO75ZHx5CVX9OMYsThXkGQc
	ZeyD4GUT9jvyAN3JMXCMmINJPOOC+dRAgNUY8aZ4X6Y4b7WXuWoT0xVOCGT+vnJWDdiLOLz4z7Q
	DOUJyOQQClnYBcZQSzhDj/xO5mhh8Zj1jGoE0c9PaH2eOm/KrURmrud6TpiMGJuPZtJ5gu
X-Received: by 2002:a17:902:f689:b0:2cf:7ea3:7cf1 with SMTP id d9443c01a7336-2d95268ac2amr48470875ad.5.1788262295659;
        Tue, 01 Sep 2026 04:31:35 -0700 (PDT)
Received: from dio ([103.161.231.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d759869cfdsm49632265ad.51.2026.09.01.04.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:31:35 -0700 (PDT)
Date: Tue, 1 Sep 2026 17:01:28 +0530
From: Supreet Singh <singh.supreet14@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: greybus: spilib: Handle SPI device types
 with a switch statement
Message-ID: <apa3N5Z7VCWMSZju@dio>
References: <20260806101118.146685-1-singh.supreet14@gmail.com>
 <20260807071542.200192-1-singh.supreet14@gmail.com>
 <2026090143-skincare-slacks-540b@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026090143-skincare-slacks-540b@gregkh>

Understandable. Thanks for your time and review.

Thanks
Supreet

On Tue, Sep 01, 2026 at 11:44:26AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Aug 07, 2026 at 12:45:42PM +0530, singh.supreet14@gmail.com wrote:
> > From: Supreet Singh <singh.supreet14@gmail.com>
> > 
> > Replace the if/else chain that selects the SPI device type with a switch
> > statement. This makes the code easier to extend when additional device
> > types are introduced and improves readability.
> 
> But let's deal with that when it happens, you are adding more code here
> than removing:
> 
> > 
> > Signed-off-by: Supreet Singh <singh.supreet14@gmail.com>
> > ---
> > Changes in v3:
> > - Fixed the memcpy indentation issue
> > - Removed the extra blank line in the commit message
> > 
> >  drivers/staging/greybus/spilib.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> So it's not really a benefit overall, right?
> 
> > 
> > diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
> > index e4d1ae8308aa..39d5bf234c61 100644
> > --- a/drivers/staging/greybus/spilib.c
> > +++ b/drivers/staging/greybus/spilib.c
> > @@ -458,17 +458,22 @@ static int gb_spi_setup_device(struct gb_spilib *spi, u8 cs)
> >  
> >  	dev_type = response.device_type;
> >  
> > -	if (dev_type == GB_SPI_SPI_DEV)
> > +	switch (dev_type) {
> > +	case GB_SPI_SPI_DEV:
> >  		strscpy(spi_board.modalias, "spidev",
> >  			sizeof(spi_board.modalias));
> > -	else if (dev_type == GB_SPI_SPI_NOR)
> > +		break;
> > +	case GB_SPI_SPI_NOR:
> >  		strscpy(spi_board.modalias, "spi-nor",
> >  			sizeof(spi_board.modalias));
> > -	else if (dev_type == GB_SPI_SPI_MODALIAS)
> > +		break;
> > +	case GB_SPI_SPI_MODALIAS:
> >  		memcpy(spi_board.modalias, response.name,
> >  		       sizeof(spi_board.modalias));
> > -	else
> > +		break;
> > +	default:
> >  		return -EINVAL;
> > +	}
> 
> thanks,
> 
> greg k-h
