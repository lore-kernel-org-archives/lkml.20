Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024296;
	b=o6jYOMVPnYARSRpRdeIjueftTSXxiijdpYELanEYR0/lfN4dkPxE5D/AEczA87J0qC5X
	 ErKCYnpNQgRSlbx1oiNK2fN+6dIRziHhN0Wbnm0kvgnuelV17rZ+iha0gfI7FYlSPelO/
	 kMl9/3LfX7+20ntY5HISz1QA5UpcZt/LKHaxKuPobtSOgz87BXToZDa1Ha3gWX/jF+PE9
	 oTDFEzX7e+WclVhS1vdkViQjvZO64ooZ0c6jQFoUllCXVAukQsviAqDS8a7mg5EWkf7w5
	 vkwELk2dZBljJXhsconC/UHYhK+8cbi6eFvv/5G4mkoEvj7pUtwzmIr79ZGnmFkL8lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ifM+PXldux5sH2cm3CGnH/RRo/Iq9tlkwFAZTBnx4+Q=;
	b=oHCOZ3aaOyCQzjk8vZVYccnDERJBsklnmZpKHOAOjiuJrm3Wag/Kns8qhZqe5skXUv8U
	 CvYZjm5kxVVrnETY0QeXASn45KRImQEsWcLPY06Od0SVSnN+QFr232nDqBvYkFwMTjpDz
	 IICdQdTT9DTlUFKvSzKJOdzUTyOHfXwgH9Nk7EuqM8koMdZwRdH3lvKFqMNua7QNvwk8l
	 FCxDlJXqiREeHB+MCdkK6WDFQz7l13tQdQxwYzRgaimw+icXcJY1K5pQ2HG2X2IRyj4ls
	 PkBkHqoGChrGo6hXXgFre0oE2sKuLKK6fJerxjNUj8EdR68524V1xjvYTjZQeLmtlhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=arAe2ryG;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46C9606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B46C9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=arAe2ryG
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so11480725e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793024294; x=1793629094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ifM+PXldux5sH2cm3CGnH/RRo/Iq9tlkwFAZTBnx4+Q=;
        b=arAe2ryGITQNaEOL6zbSb3LMwQmpaYIjaYHVlzJt+RwVkXz+ibO9s+qLO7YT1Dexse
         wjEb/ve7fTopNBXX3YVni2GCZ+uWleeRmGhQOxUpH0OpM9W+4VuvjPijH+D66GQeaCKl
         trLGCt7AqToC4FKcJ5oXvR4QIrkTuGShxtajFOcIIVcNVL0KlAw3RsgRa20lHE7EMgA+
         pDpSpHcxEMQvzDhCfFJDZ5IP45budIblqKHrLqt9Fj8lrT/GY0hw7SfxT1pBYhc+6BRk
         wZ1KYLk53bpOQLyS3knUrpi7z2H9z66bVOjWZg97H07dhGu531lOyOGQ571VIaKoWRSY
         ImOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793024294; x=1793629094;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifM+PXldux5sH2cm3CGnH/RRo/Iq9tlkwFAZTBnx4+Q=;
        b=2atDMmBWTUF0hN+ygTrhi7sdQMz3Wq5roc0snNSlld+lY4vWpHtxJZkcfDERfOseNX
         r1nfo6V2reUyVsdmugIeY6ZyvXxBGazOwNxPuAXAQcAs6zcwEKpw6m2OLeV09xze7a7J
         vG2SpDRXQj8qYBMNfBfpOPQWhu5POyExI2kxxy4rwZ+5yewY8tHoZLwOjwC8FM+6pudm
         IgvOxpC+z8vQhXaw/NDraxg7MYSmNUPbUOx4ubpnda4ZgZAw6xX/minakZZh8GXhKh0c
         rRxogNRutM+j8zhIPELGp+n7zafqTf1A/pfzMJebAzBdFF56vt/OWXxM34f61rNdzdkD
         Sbdg==
X-Forwarded-Encrypted: i=1; AKwUvBwW/JHRyb+Pl6UR4cwQKeyv1nJXi5TwL6Csgxuiqmp+FPxn0vnTNKiO9n0ybQhyzKZLLjzDJ2JiOBxgJSI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9TS8uPPqEq4DvaUjYbsgeQD3xsMd/E8JK0tQMr5WLxSGfNgiM
	BmlASrh+IhdIWOusgkY58URzkn/TGSN6bZAqpDrdGH7/CSwgivNqnuJH
X-Gm-Gg: AYBFou0YKrqeHVrbkH18OEC9GHFEUbz9RkMxQRWeyp+gX1ZKprjzJaPiv1RiNNVKoP0
	GcyQfS4fi6Pu7E4a3o6YxcuQMHRW1+3CgZAsQ90j+D8sKnuNDHuUqRNfUXFStdnnHeBqwvGu1fL
	gqA5tajatktpYhiP9TzY25lxNROqhLZsC0EJRceox/4W/HZHh7vUqLvxobEoNJe3yKU2KqteuIE
	GvOYnDGWXOwX7T5TsqGxALce/7wx90noYr6Hi212lUQQVSujZ+ZhJcEZx19btRpd0+zEQZQGRuN
	uSmMqS6Xy9iWp0u3hgLTsz35PLfcLYSqutJ/jiQLqUfkp8vCVYVGCGu673AaqNdRDCBOjXtResk
	7jsyo5+d4R8kbQxJ/BtOcksjxsKrO9v5prycJWy7AWUS3jPbF58x/nBBV8+pjLSnrTfE1JF3Wzv
	6E3Q+WFV2pNHNitp+igvAv9mhLfQF52cU4bYzc7UgMyUa/kCzLnCS17mmRnBGw0/Iu+DjltoQpD
	+P9399eL0MMT1MuinLmzIMTEmBpyS9X7QGtwZnNDpTkKpLIokkUopfrWLyti/sAth3m08DBp9Vn
	rogYd/kdewSqIH7wggyH0yGuvq7Goi7de+HZaZXCgNASeNgiRhy6rJDmMEnwSkdoKM5BIg2XGqA
	TjBD7LUgoS3AG6p8fbcm1D+xtLic3f0FWOiOCJfiLSfL9qp0/M6gDkNFkBJa0zYeJSGaiJ0gkx/
	jFdxPhv+EIst28KhIHlV1R7HVDH163vUCnyzc9W26JG6r9JgbsQswY4zbK2W3UwG2+uV2w3889k
	cmpkHcDK4c=
X-Received: by 2002:a05:600c:a318:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4a35aee2cfdmr95663085e9.31.1793024293964;
        Mon, 26 Oct 2026 07:18:13 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a58a0e2sm246428935e9.13.2026.10.26.07.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:18:13 -0700 (PDT)
Date: Mon, 26 Oct 2026 15:18:11 +0100
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Cercueil
 <paul@crapouillou.net>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Message-ID: <20261026151811.00002233@gmail.com>
In-Reply-To: <20261026-hungry-masked-anaconda-7fadb6@quoll>
References: <20261024041357.34346-1-olivier@mgcrea.io>
	<20261024083809.000026e5@gmail.com>
	<20261026-hungry-masked-anaconda-7fadb6@quoll>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
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

On Mon, 26 Oct 2026 11:50:44 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Sat, Oct 24, 2026 at 08:38:09AM +0200, Joshua Crofts wrote:
> > On Sat, 24 Oct 2026 06:13:56 +0200
> > Olivier Louvignes <olivier@mgcrea.io> wrote:
> >   
> > > The X1600's SAR ADC has four auxiliary channels and none of the
> > > touchscreen or battery engines of the JZ47xx ADCs in
> > > ingenic,adc.yaml, so it gets a binding of its own.
> > > 
> > > Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> > > ---  
> > 
> > Please use a cover letter when submitting a patch series.  
> 
> It's fine for two patch series. Please do not make it more difficult,
> than necessary.

I'm not trying to make it difficult. The cover is usually a good place
where to describe your motivations for a new driver, plus with a cover
it's easier to pull via b4 and Sashiko will treat the two patches as
part of one series, not separately.

-- 
Kind regards,
Joshua Crofts
