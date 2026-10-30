Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793360686;
	b=IzBjlJV/ak1WZvCepRdqJUWwV6qFUEQbCtD/wZpU2PLHUeplQgLbljubN+NY463+fHUr
	 rOQQgaLD/1zCpng+WpOnxLe3wB30sgkIy5+WMeED297bWDRwqud9H+dtAo+PJUy0me+CL
	 iURbocpXF7FzU7/y8yXAMs7PHobCUfGcm6y/zngot3E2kKchx06mFUbpGpFMJUfoCGomL
	 MXY9Olnctj0auQRvBg8wmlzUntazwm2FstbU9zwDJvBO+jpVWrqSWvVoJYD1kvd3myJJf
	 eH7NyP5SbL5AiTalgPs/oc7518dhmYweT21/PYb7LcYwlYKj7+KoZJEQoPNrPrjJkLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=J/6UIvMwC+2M7xk6hrl7rsj5PVVyi+u7mrNva4BtF6A=;
	b=GE5XRUDNDzwvCSWSTUj7gx/9O36/0fg3xnj9ASpvf6nlrr0m7cclFmo9+nLs+ensVTRo
	 t6aO93FGW//KpIXAzptQROXyQ/vBGKGFTFwx8Rs1mKACwCRhGi7GNTvBio42SngsbYtrX
	 ag3D8XEhZU4c66nX6Pf9w1mq5YWtrJ79AraHNUncPBsqfmPGX2ia+aqkeLttJDnxEne3U
	 vHwkE3RuUBJBne3oDUnJf8pyVjJsOcrMmakxUtVquDhbThiUF3z007tAgFoJcf/CEOXE4
	 ME2U5xymWNPtHc2iXuwo7sG1VyUTPYfvXhpsL53Jye5p/d25qTYyh9uJpn9OmRgP7/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2ZLV5dl;
	arc=none smtp.remote-ip=74.125.228.5
Received: from mail-pz2-f5.google.com (mail-pz2-f5.google.com [74.125.228.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B889606A333
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B889606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2ZLV5dl
Received: by mail-pz2-f5.google.com with SMTP id 41be03b00d2f7-cdac05f11bcso110169a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793360684; x=1793965484; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J/6UIvMwC+2M7xk6hrl7rsj5PVVyi+u7mrNva4BtF6A=;
        b=g2ZLV5dlxpbuDPCjK1MaVrsjqjHMaipBPBqsisVQUZ6Ty0skoAdWgIyeA/J9clATlp
         1p31QUCLSPGy4TWe5KV53YJ0M5p3O8t50RFB+4xnBn+6p7AZfE273lGPVGIPHOozNW4I
         Brk88Y8w+9TGUkPqvbXhVtdn57OSLzIo8kkyGSJKcqqMoGP9/9uk2gR7hADIIutWzDjg
         7gpHz4vxYE0+7wo7MVXxWBdrsSaWVdHnQ86v2oJOfSh+JISrsA4SZCk6lj5ulEpnJ10Q
         ulC+27nUlFpdausCL04tV09g1AbYKQxaiCg3/e6n6n8iqx/cOEYX/bJmH8eJ822ICDF1
         m3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360684; x=1793965484;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/6UIvMwC+2M7xk6hrl7rsj5PVVyi+u7mrNva4BtF6A=;
        b=Ep6fB+JSzfvJzens2X1N1EhyD+lfZXdJCFcJLr70+h2zKY381lMn35eAgMFpefXGZw
         FQoP/Shzst1+XqHFzkm+ZiXymhttr8QFJy5658p+OVFT5qvN/lzQGciyeqGjWmF5vNXa
         6CdQdLGo4/CfbSAVsoXXv/zMUkcv4ZfjIB1Nc5mAn5nX4Q2VxOMtT7ZWBcFsLhq11OpR
         G/zwG8kvdDLNbUa/ZeSyC4F6sDLkirMc7vTOjJi1R+FFD4rIy6m2751Stn57KcD9ytKQ
         CKqzKG1wV0hrjyVbpZAnAqFOmrcrvlp5cFol+s+V10tugl3sM4dpmY6R80h9UprP0dJW
         zi9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwpECcQAH3GjV2tDyN+9uzahmzUZY+njuy70Eav1gXxV1YliUhoP/F028gfjiAfFGTTGaiu4YpV3sh9EJA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLR8h65b9Dq12Ut3BeDrqcSzzXbEnxKCkK5HTJzMlLE9jHyARiH
	+6dO/iSS7TPUvVWoBPNx7a+j5ormOIkVvqwisPtgUOGJOGXXxzS53qTK
X-Gm-Gg: AYBFou3EADFrAc6XU87GUA76weod5TDjAVoFjY8IdouJDe8fcgrubly0IQHkUb1ryur
	+x2cX9z4zNWfp6w9/8omdVxE/3lzApPsDUfrNv6Qz6b3kefCf1rSYFn1YNRbTSoNbbRgueUvnHu
	RxQ1WezPlOJRnpEXWrJrqiMbKLDUqRn1rtNh+yzuSkAZbwvWLMfE+z3mq6mYsBtDaTL/9TyTFAk
	zpCf+G5b40PpyUSdkaJUjIj13BncT7YDuz7GNVNZnSM5SOoVx1Enl6X36sLTF++YrNbYkOBuP29
	1zbGZyNpA9JtKT6CJI6S5frlVKOvB08Q7mvLmgb0W0NrTS1B0aRTgAOUBKwW89mtyWPU8iayn5u
	BeM0xMcYd0FBFM7TSsQV0p4mOIcTTfjlFqcilrQIqjOfWo9BtO3C8+/3rE0tVppvLGJKovfCaxp
	excBLLs5PKMuC683yaXj28I0I86w2b6eoUaT3GwNs2zI0Rf4XXNytfuUBHs+Yfoco09h3d08Sm4
	0Ak6+llLLmaTVSqEbNQ2cc44plO0OBGbxeZQV9YIaSBS1aL8valcnJ3C+H02k1DlEgJHVFnshK4
	hlpKnkzgM0HX1DOJcIsZyA==
X-Received: by 2002:a05:6a00:2d1c:b0:8a0:7dc4:95c0 with SMTP id d2e1a72fcca58-8a9be5896acmr1842901b3a.15.1793360684421;
        Fri, 30 Oct 2026 04:44:44 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9eef957e6sm660253b3a.15.2026.10.30.04.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:44:43 -0700 (PDT)
Date: Fri, 30 Oct 2026 07:44:36 -0400
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
Subject: Re: [PATCH RFC 12/12] MAINTAINERS: Add Bouffalo Lab BL808 support
Message-ID: <auSDJH9V31wmbrYv@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
 <20261029-spyglass-evasion-772697094cb9@spud>
 <20261029-amuser-savior-6a6ab062f471@spud>
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
In-Reply-To: <20261029-amuser-savior-6a6ab062f471@spud>

On Thu, Oct 29, 2026 at 07:20:41PM +0000, Conor Dooley wrote:
> On Thu, Oct 29, 2026 at 07:08:56PM +0000, Conor Dooley wrote:
> > On Thu, Oct 29, 2026 at 01:05:53AM -0400, Kwanghoon Son wrote:
> > > Add a MAINTAINERS entry for the Bouffalo Lab BL808 platform, device trees
> > > and Rust serial driver and abstractions.
> > > 
> > > Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> > > ---
> > >  MAINTAINERS | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 801f964899ba790a8f71fe61f9b3777a494dabd5..b76d3e168468bf6139c958a81b626c73b422c0d4 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -4926,6 +4926,19 @@ S:	Maintained
> > >  F:	Documentation/devicetree/bindings/iio/imu/bosch,bmi323.yaml
> > >  F:	drivers/iio/imu/bmi323/
> > >  
> > > +BOUFFALO LAB BL808 SUPPORT
> > > +M:	Kwanghoon Son <asdfkwang@gmail.com>
> > > +L:	linux-riscv@lists.infradead.org
> > > +L:	linux-serial@vger.kernel.org
> > > +S:	Maintained
> > 
> > Missing git tree, unless you're expecting me to apply patches for the
> > platform for you?

I added this entry after seeing checkpatch's MAINTAINERS warning,
but made its scope too broad. I'll separate the BL808 platform support
from the generic Rust serial abstractions in MAINTAINERS.

> 
> Additionally, are you actually going to add wider scale support for this
> device? Like a clock-controller driver and the various other
> peripherals, or is this really just a vehicle to support your rust
> serial driver work?
> 

Yes, I'd like to extend BL808 support beyond serial. I have local work
on peripheral clock/reset support, pinctrl/GPIO, SPI and PWM, including
an SPI display on the M1s Dock.

I'd like to bring those pieces upstream incrementally as they are ready!

> > 
> > > +F:	Documentation/devicetree/bindings/riscv/bflb.yaml
> > > +F:	Documentation/devicetree/bindings/serial/bflb,uart.yaml
> > > +F:	arch/riscv/boot/dts/bouffalolab/
> > > +F:	drivers/tty/serial/bflb_uart.rs
> > 
> > > +F:	rust/helpers/serial.c
> > > +F:	rust/kernel/serial.rs
> > > +F:	rust/kernel/serial/
> > 
> > These should probably not be maintained under the arch support since
> > they're not platform specific.
> > 
> > > +
> > >  BPF JIT for ARC
> > >  M:	Shahab Vahedi <list+bpf@vahedi.org>
> > >  L:	bpf@vger.kernel.org
> > > 
> > > -- 
> > > 2.47.3
> > > 
> 
> 

Thanks for review!

Best regards,
Kwang.
