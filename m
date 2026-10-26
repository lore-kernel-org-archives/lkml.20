Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003825;
	b=E5/nBETESXREyFzPTdr/gM6Mm4QDswPTvBMg4SVq38WNLC7KWDyKzdEznxOUph2kMend
	 /YR/NFxb23pmM9HWeMrfxLQLzlyjUTaez9yGYyegOpJfaZ5N543JpTR9Ne0Kf1S+Es/bf
	 qnvXP3vt7Egs5DCulYaUotYYkc7MoXdThSBXhyVt4XryO5V9sCihtz4+QeZbauU8aKsBj
	 61OqZZuEDedbgk+GeIOjsKcMgUcSQEaTBFkVtLvmj7OY8CEGYxQ9/TlFVo0phnrd+i5W3
	 VKXlqzuv5Jw4ZbH2+YJ6Sk/wBVEQWEeo0OyEaCctbA0Oi/y9nISCZAvtLOa8X0jys0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003825;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=/tD+AdggQ8rn3t013FfJIhJkQ3UCqIWgHWwfFpeCerk=;
	b=RUuLsl2EH/YESOjUQDPviL0uNsqakqq1WsjCHzgfuYIciFDyklJQGPucpTZl7NIR9ae2
	 7XQlrVtfMRNiriX3Sg70/RXc0f4Q0wp99/3x06q2WESGdIwKRiWqPq3izyRoL+zAXTn9g
	 dZGpKg4nFYqfAW7Wj7omkBfQu3R4Q6IcgVgYAWvokoEjakcPCkuI0Tq9YmimTF3LkN726
	 L6b2gePHlM+wSdBcU+T7LqcySALgkinyxPZrfqxyc7jTSxdR43YnEvKeqwLYQBA05sPBE
	 Oyjol40PiKCstTEigQlUxMphAzG+CflT+ruLkqvzfDPgWU9GVTtypfvdvapvONHyWYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kVwwLWcH;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6947B606A322;
	Mon, 26 Oct 2026 08:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6947B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kVwwLWcH
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AF21B1A1339;
	Mon, 26 Oct 2026 08:36:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7ACCD60740;
	Mon, 26 Oct 2026 08:36:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5EA8E10328E76;
	Mon, 26 Oct 2026 09:36:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793003812; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/tD+AdggQ8rn3t013FfJIhJkQ3UCqIWgHWwfFpeCerk=;
	b=kVwwLWcHIhHeD43jHUzfytK0VC6XBUa76/BASP5MYWKmgkJg1swUYm6Nbcz0qa+xG5p/oL
	pSeE11DF5ppRMuS7rksMeF66KVn11wWdOUivyfokhrKZ7xErbqn8fIEl1tJks0CHAZtthZ
	cWhbZ6XN8mPWp5LHNKJV0xwp7XxAWQMkVja2480JdWKiGwSDfEDwbR0oEDdwIOvyhm0MUo
	hNNJQLIFP5zJ8wQynpxgiIjyl1Y8iIjjX7Jb57RIAvdh7MSzFiMJg38wkp959gysNKqBVN
	Cbu+QePb/Kdb07waujHNn0n5ZGQWS72h3IZcn3LWXr8X7jTHGp84GbdAD7WMdQ==
Date: Mon, 26 Oct 2026 09:36:43 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, David Lechner <dlechner@baylibre.com>,
 Ayush Singh <ayush@beagleboard.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, devicetree-compiler@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree-spec@vger.kernel.org, Hui Pu <hui.pu@gehealthcare.com>, Ian Ray
 <ian.ray@gehealthcare.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 12/15] libfdt: Introduce fdt_getprop_offset_namelen()
Message-ID: <20261026093643.15faf244@bootlin.com>
In-Reply-To: <at1qO7oEdCyhX6k8@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-13-herve.codina@bootlin.com>
	<arDJmHPwgvwwmITG@gractus.seuss>
	<20260922182547.6cc7475c@bootlin.com>
	<20261023092559.7608ff25@bootlin.com>
	<at1qO7oEdCyhX6k8@gractus.seuss>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi David,

On Sun, 25 Oct 2026 13:32:41 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Oct 23, 2026 at 09:25:59AM +0200, Herve Codina wrote:
> > Hi David,
> > 
> > On Tue, 22 Sep 2026 18:25:47 +0200
> > Herve Codina <herve.codina@bootlin.com> wrote:
> >   
> > > On Mon, 21 Sep 2026 16:07:21 +1000
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >   
> > > > On Wed, Aug 26, 2026 at 10:31:43AM +0200, Herve Codina wrote:    
> > > > > Future operations, such as handling unknown tags on dtb modifications,
> > > > > need to get an offset to a property based on the node offset and the
> > > > > property name.
> > > > > 
> > > > > Several function exists to get a property based on the node offset
> > > > > and the property name but none of them allows to get the property
> > > > > offset.
> > > > > 
> > > > > Fill the lack and introduce fdt_getprop_offset_namelen() and its
> > > > > simple variant fdt_getprop_offset().
> > > > > 
> > > > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>      
> > > > 
> > > > This seems redundant with fdt_ptr_offset_(), which can trivially get
> > > > this information when combined with fdt_get_property().    
> > > 
> > > Indeed, It should be ok using both functions you pointed out.
> > > 
> > > I will remove fdt_getprop_offset_namelen() introduced here and use directly 
> > > functions mentionned in the next iteration without wrapping those calls in
> > > a new function.   
> > 
> > I've started to replace fdt_getprop_offset_namelen() by the combination
> > of fdt_ptr_offset_() and fdt_get_property_namelen().
> > 
> > As a reminder fdt_getprop_offset_namelen() I proposed was the following:
> > --- 8< ---  
> > > +int fdt_getprop_offset_namelen(const void *fdt, int nodeoffset,
> > > +			       const char *name, int namelen)
> > > +{
> > > +	const struct fdt_property *prop;
> > > +	int lenp, offset;
> > > +
> > > +	prop = fdt_get_property_namelen_(fdt, nodeoffset, name, namelen,
> > > +					 &lenp, &offset);
> > > +	if (!prop)
> > > +		return lenp;
> > > +	return offset;
> > > +}  
> > --- 8< ---
> > 
> > fdt_get_property_namelen_() was called.
> > 
> > Switching to fdt_get_property_namelen() introduces a regression.
> > 
> > fdt_get_property_namelen() calls fdt_get_property_namelen() and this function
> > (without the '_' suffix) performs a check on fdt_version() returning an error
> > on version < 16.
> > 
> > Using it to replace my fdt_getprop_offset_namelen() function will break
> > write-in-place setprop() for dtb version < 16. Indeed, it is used in [1]
> > 
> > [1]: https://lore.kernel.org/devicetree-compiler/20260826083146.304291-15-herve.codina@bootlin.com/#Z31libfdt:fdt_wip.c
> > 
> > Now, several options:
> > 
> > a) No problem if we break dtb version < 16
> >    Ok, I will use directly fdt_get_property_namelen() + fdt_ptr_offset_() to
> >    get an offset and remove my fdt_getprop_offset_namelen() wrapper.  
> 
> So, practically speaking this is probably true.  Version before 16 are
> truly ancient, and versions 1..3 were all before dtbs really caught
> on.
> 
> > b) Keep my fdt_getprop_offset_namelen() function without any modification
> >    We support version < 16, problem solved.  
> 
> Still don't like it.
> 
> > c) Keep my fdt_getprop_offset_namelen() but static inline in libfdt_internal.h
> >    Export fdt_get_property_namelen_() in libfdt_internal.h and use it in the
> >    static inline fdt_getprop_offset_namelen().
> >    This implies that fdt_get_property_namelen_() will be no more static and
> >    usable internally out of fdt_ro.c but only the fdt_getprop_offset_namelen()
> >    wrapper should be used.  
> 
> Eh.
> 
> > d) Use directly fdt_get_property_namelen_()
> >    Export fdt_get_property_namelen_() in libfdt_internal.h and use it
> >    directly to get the offset.
> >    I don't really like this solution. I would prefer to have a wrapper to
> >    explicitly return the offset instead of exposing and using directly
> >    fdt_get_property_namelen_().  
> 
> Hm, I think this is my preferred option.  libfdt_internal.h exists
> precisely to "expose" things across modules internally, but without
> exposing them to external users.  Maybe I'm missing something, I don't
> really see why that's objectionable.

Well, my first feeling was to avoid exposing this function and use a wrapper.
I've looked again and indeed the wrapper isn't really worth it.

I will expose (internally) and use directly fdt_get_property_namelen_().

Best regards,
Hervé
