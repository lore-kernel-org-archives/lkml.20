Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E3248CD4A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404805; cv=none; b=ZnIOHxFFN5b2dDOpRCAG9wvVvXtEhIMpsvy4HhdoEaIgx6Bs7esylun7yZk/6WOMvEkSCUKy/lGtKuHxwdbXM6Ab54aROXF2rCpQOD7BU8OIbEOnSpLRICxGu1+jQ7FGTYWkDEnACPVtbwb/YB733a+uM96Yn6ItsMyhmLhzkDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404805; c=relaxed/simple;
	bh=6TMcO2Y5Kw0EVrvk20oE12w5dXKJk7zNaPDpg06x4co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EwHGqJeeknuQOuRwVGzFDkENIMlkigq7C46CpOs+RgdHlCI+6oFuK+E5RLPmTvFbzT6L8hU6uGvi290j7JaSi7kZgAZ7rs2l572JgKrvSp5Jbrj9guwkM1/udEMp6XGc6WFTRrUm24/8CL1o73hPrh0aUGCepBa3gkjYPZDwymM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=tmAPQT97; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="tmAPQT97"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c29c6a3930bso29842066b.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789404802; x=1790009602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lumnmvwB9uVaRviDsmnKgFO+t5iIy+oIBHk/e0BQmpM=;
        b=tmAPQT97RXipwx22SVY7eilw11ufAShLltIZBxzpdRu+Rb6Vx4ql15HQftqIgUzmR/
         AogICVciFlY4KDFhNP9bsNreAJvnLfIVyUD/0GnABbD+fznHAIHwnP6GXfBRrWqRWh6f
         seLuNzPcZxmSd6ecEhjUwnYLlpvnT2jIPkATA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789404802; x=1790009602;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lumnmvwB9uVaRviDsmnKgFO+t5iIy+oIBHk/e0BQmpM=;
        b=bcrWVSDNhEYUaR5VlUuoy21/rT0k1f1ei/luZTtQmor5gA1j84d6SqG5t6qsNTDFR6
         aj0SxVuAwuCXeuhmDNvAVMwRUAznFSEQNSONrGwtMePtma7gMdRfaZ/8o2URmB2flCqp
         LsKVsbNuBezf24WQ954sVsLRKDTYMXounlbR698ZJTDI8iAUNkVkPJNenF9hzgjSN0cx
         ngGu9acv8Q+/gd0Dj41c2mbROxZkZHxez6KvDLRQFM6wPcbI5NA+Ge3PZbNR9b8d2Zg6
         bnKFH8Q+aiZyMNhjm6T4HinnWvx1I3Y7HwEER6kqHfk7ZFMyrchmBKiMGUW4a05UDS1l
         e7hg==
X-Gm-Message-State: AFuF++k44YGDvM2usWc2/iv9IKVHzhwm+uCOBQKeAHgdyQezmcn8XDEy
	DTdBFbH/sBuVuhPzN6GMZbmQpLuJ7K1G7syvJXznl7N+5+gaZ77R0LAGyAjU76dN8i1eezf9NIo
	s8A8Q
X-Gm-Gg: AYBFou2iyLO3B7l4BTMgIMnfqJ47m0CQcrlM5OjS7wDosGGMxLCtYAGV7onJ7e7QTRC
	ZCAwOCDDY+ajlKkq5P1LVqh2B5UoeAiDFSZsQ1rH04zgtUnTUUjrHSvNLmHHmbSPU+PJrfkDVBQ
	kXrF4QuU6oiWCA3veXpbP6L55+9uV1UTHOTDv5tB6l7oXafwZwpyAjbyvSvBxJHYCYKFgtN0U3p
	EE+6sIz7fQ9y0b4uBvtc0FS4gSzmY+V6H1/BjqX1oyb9oH5kHWh9hbit6uED86rCLD2PPJHzycL
	wuv84V/FikC+tpqLhhI315LGToUMRbZx8kMNmr9XbwCZAFJT95XTfPk3BJip4Fq9Pq+P8GVfVjL
	i4rZscnohOzJP6wLAyFM4NMihcLWT17suZBvzuyhKXI06Gk2AGmPM7qk9lsoPsTQ8o70bfKkAAI
	thxTSOK6Zl4+JuvZMVf+FabJqL6zfqfdUIBlJbCTp6ywo4UoVi0FFVFdEdTWUjSxwKX1Sj/tHB5
	1tSWNwJRg8RE311IQ==
X-Received: by 2002:a17:907:9616:b0:c29:349e:7c1d with SMTP id a640c23a62f3a-c29b879a34fmr217563666b.49.1789404801836;
        Mon, 14 Sep 2026 09:53:21 -0700 (PDT)
Received: from cabron.k.g ([95.111.117.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e8a1sm467264566b.6.2026.09.14.09.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:53:19 -0700 (PDT)
Date: Mon, 14 Sep 2026 19:53:18 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: altera: add Draeger M48 Module
Message-ID: <20260914165318.GA10966@cabron.k.g>
References: <20260911150755.2803736-1-petko.manolov@konsulko.com>
 <20260911150755.2803736-3-petko.manolov@konsulko.com>
 <20260913-perky-resolute-badger-6c5e96@quoll>
 <20260913133214.GF20345@cabron.k.g>
 <565e4f26-69c3-4129-b4f1-29d67c381591@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <565e4f26-69c3-4129-b4f1-29d67c381591@kernel.org>

On 26-09-13 16:20:54, Krzysztof Kozlowski wrote:
> On 13/09/2026 15:32, Petko Manolov wrote:
> > On 26-09-13 11:18:16, Krzysztof Kozlowski wrote:
> >> On Fri, Sep 11, 2026 at 06:07:53PM +0300, Petko Manolov wrote:
> >>> Add DT compatible string for Draeger's M48 CPU Module, an i.MX6
> >>> based board.
> >>
> >> Sashiko comment is valid.
> > 
> > Sashiko doesn't know that this is indeed an i.MX6q board with the Altera FPGA as
> > a separate module, that is secondary to the NXP SoC.
> > 
> > What do you want me to put in the commit message so that everyone is happy?
> 
> Your commit msgs for bindings and DTS should explain the hardware and with the
> current explanation this is just so incomplete that basically wrong. i.mx6 is

Incomplete - yes, but who cares.  The only consumer is Draeger and they know
better than anyone else what the board looks like and what it is for.

Wrong - how?

> completely different vendor. Altera FPGA does not make it Altera SoCFPGA,
> these are two different things. If Linux runs on iMX6, then what are you
> describing here? DTS which never is going to be loaded because there is no
> SocFPGA?

I'm no Draeger employee, but i've been told that both the i.MX6 and the FPGA are
running Linux (both chips are on the same physical board) and are monitoring
each other's health.  Apart from doing whatever whatever their primary task is.
Whichever fails, the other guy takes over on the fly. This is a medical device
so full redundancy is a must.

So, again and in order to save everyone's time, please elaborate (preferably
with an existing example) whatever it is that you expect to see in the cover
letter and the commit messages.


		Petko
