Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793339928;
	b=q4pHclDAYHgAjWd9+cIA3/y4X4LzpyP+2vusxT/OmuXE4UQy4vYXUuN7ZU2uMeMMFuAA
	 DTcbfsGekQJHicBSavGrUu/r30C/5bVP3cr8EYBuxbnNOuRbQGTOQxHSvufcyu4JPXHce
	 N21jYgE7BbzwnttvzlzSSDgzhxPvHdwhh62HOVGBriCSvhh9Ng47WMYHsSu6KWoNAzfzX
	 Dv0spXC6kdMCSN1adUwq1SoYCNjIEWumy7lUW8qPrz4eYnQ70djZlFa7S9vhmjd+X27Sk
	 lZt+KlpvDfBVbFG2esYYTYR+K5tEOZzARq29NJS38CSBnnh1V9u4AexZjq+eO27E9Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793339928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=x1ZOonFo86/OLdHx4TEfvsl1dhP8QB7LtaQ6AkA34Vc=;
	b=oJj7iS338JhsFDLALrWHAfjjq76SvtTjDql1vM0u002mqOtaiiqysOS0Xc8Hq3uDqYxc
	 kALUGKTr8OtQwrPEmisPipIjEQYlG+LbT9d47xQ9ES4dJ6p3ixujj2kVS5MzriuxPdWBB
	 gPKpFFjaETSNEVgaYeirFNTtMv5G5YXoUOFN7ZxopCiiZA+eVZzT5KXijBcEl3TSLiidF
	 wI4cArfNYs+G7sHeyCyBf2iQSfsaAOlvIedqU9ewKQ4ixvu4jVp3fHWth0ai28D8V2IGQ
	 ENgY6C9AxBoRL3Fp2Oe1VntXLPnoFBEG6E919+mm3wtWzZPuwhw3R3IanOQbFA9lRSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UxOWSyi0;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD57606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DD57606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UxOWSyi0
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so275562a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793339927; x=1793944727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x1ZOonFo86/OLdHx4TEfvsl1dhP8QB7LtaQ6AkA34Vc=;
        b=UxOWSyi0ZLjT6K/CtEHFfVSX4upjGZhtjvTQuYaOgoghxRdqk6YuYKma/rstK8OnyW
         EnlMZpYbwB5JxxcbXq8zBvy+70m6AbbNzMP6+FwnV2skuLOZ6ipMEK7v5pYZrMDTRWMA
         AyTTdhQO6aHAZ+xHJkR7p1UXP7BbTaP+l3sXKECV2E/6YG8xkNC8Hzwx4lzFGnBXzpzh
         qye8ca0y3z2k++H2xxu1sQvDiEJY2Euq6dJmJ8wdUAnZTEfBMvK1RmzJsXaY7ZA4XjhU
         GuO0J7l9DqYUyarNsZNIDWJGksm/oUJs3nxPxK0HlTarEOkVg9jXhvNXEJBdgV3wfrIP
         naag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793339927; x=1793944727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x1ZOonFo86/OLdHx4TEfvsl1dhP8QB7LtaQ6AkA34Vc=;
        b=LeXwEytavHX2W9egln+Rtpk5o0Z77skZSb8JQgMQ8sOAZT+z4o4WoUu126STuY5Wr1
         IzzubgwKO+GMlcFBTlLG/scQCnFWbfoE8aczfjlCrP6pZEkbh71rBQ70hZsVPiOOU7ss
         jx3UE9IGOnb8RgB8WdjeWvY4tfM67MBOC9iofVxB+14F9bixRjvbaslINjQpkUHTEoq3
         K3LnbXWlwgiOIJts9CqYdEwHz9lp7KkC10fPgAe9erC0VkiD/tO9zVGQMq6UfTs3+ySx
         jY1YWdx4yTTpy19pxodyb9bEBO11huTOdRy+2NBd/lXg+YVF39ZWXgS60V283aVKAOaE
         JIMw==
X-Forwarded-Encrypted: i=1; AKwUvBzvc+X8+r4eP8aV3crTD6RSj3E7Qa1UmPrv3Pu5XJvBYmrscMkn1qzO6Ri4HKK1ApcmD0u1KrmCwaGv0bE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeS3CGk5p7o6YFJyUAhrUbtHFx5caqKbVgP8MEK4wfdrZTyUmO
	AqCi2yKvxmzsdmso4YHzuYhqn/OUTKcX4XBj5NAA7JOFZk78lRItJvj3
X-Gm-Gg: AYBFou2CFgS83lyqeGtwZ6mUMbCbCiCf4/7y0/qlMxhsZWHUyZayySStKQz7XpZ+9eK
	IzR8DkUMo48QXE9/njs/haWYx9pN/928rFLcsrWV0WubItkTCp2qUiyS/XW55PjR6VUUVlTGSDI
	VB/i5haz3/G3+E/ukju3RvqSyIENf1VT0fxXDC5J+T8nl0cTfjT67mfta7WxDwhzFhVqzTjYS5i
	fbfKS2ZHVsS8uIkP9ecW235n8YeNrSAvXUnuXDrZDM3HelXO6cnx/SX5WMuZEL7V9q2YaSotzLZ
	haioWFmc2dVze8d/doKa7PJMbr3CC8kT4XEjQRN0E2EoWYSetvaJylOR05+49qFpRccmrKpabyw
	Q5WACWO8Z+y7t2ezLluj9xzMpqKR0a0dziCXU/ayoCToXv5vqIn9mNrT4tYTFzIX6WsfP7kR5c/
	HBjrMEkuB2Wau7uvYMFLFxYMPKiWRnMgIlbXvnTzHEQwc7HPxWwVYhx0z3yEBEbS1LVqVWeL+ej
	XEaZHpJ8q6UbNB/C75GGwFhwNtB5CWfd8uigQ34xP+nJE+/AsxFj0fxeKy2g7hcvycSmkEURqs1
	tZnriI0w4T41ftezYhjlZA==
X-Received: by 2002:a17:90b:4e88:b0:3ac:85be:cd52 with SMTP id 98e67ed59e1d1-3ae89867829mr983310a91.59.1793339927439;
        Thu, 29 Oct 2026 22:58:47 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8fb2c5sm7211185a91.3.2026.10.29.22.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 22:58:46 -0700 (PDT)
Date: Fri, 30 Oct 2026 01:58:38 -0400
From: Kwanghoon Son <asdfkwang@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 08/12] riscv: Add Bouffalo Lab SoC selection
Message-ID: <auQyDnBA2tS2MtxV@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-8-b736ee920078@gmail.com>
 <20261029-urging-dimly-3747c8bb9b1f@spud>
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
In-Reply-To: <20261029-urging-dimly-3747c8bb9b1f@spud>

On Thu, Oct 29, 2026 at 06:58:41PM +0000, Conor Dooley wrote:
> On Thu, Oct 29, 2026 at 01:05:49AM -0400, Kwanghoon Son wrote:
> > Add a platform selection for the BL808 64-bit D0 processor, including
> > the T-HEAD errata and common clock framework used by its UART.
> > 
> > Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> > ---
> >  arch/riscv/Kconfig.socs | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index cecbce0c498384d3283ed23cbf2514391eee361d..ea4667da7716a9a8d2ae156c422b277064b42530 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -12,6 +12,14 @@ config ARCH_ANLOGIC
> >  	help
> >  	  This enables support for Anlogic SoC platform hardware.
> >  
> > +config ARCH_BOUFFALOLAB
> > +	bool "Bouffalo Lab BL808 SoC"
> 
> Ideally, this should be more generic because it would eventually include
> other bouffalo devices.

Agreed. I'll change the discription more detail with devices
information.

> 
> > +	depends on 64BIT && MMU
> > +	select ERRATA_THEAD
> 
> > +	select COMMON_CLK
> 
> This is not needed, there's a select of COMMON_CLK at the arch level.
> 

I'll remove the redundant select COMMON_CLK in v2 as well.

> > +	help
> > +	  This enables support for Bouffalo Lab SoC platform hardware.
> > +
> >  config ARCH_ESWIN
> >  	bool "ESWIN SoCs"
> >  	help
> > 
> > -- 
> > 2.47.3
> > 


