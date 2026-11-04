Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753874;
	b=irP7mCV90teB8weMChWiGrDjaBT7Ro0p4D/yWoyTu/amlYK1DmIZ/jg4Q3O1OvYT1f6g
	 DABbxpPP6kBIhoJejfJp060xRHu8hgsssAyFBWV7R3Na6sX3DRLxkyMpAl2tvdde+zJLB
	 Ilx1u7CVNe90s1MBD+ZpPbmHrhZVg77+EttFeWnoLv8Q+vGZEDRq8pmlUKemcH0qHm2El
	 o5qX3TY5iQR0FsEoGoakfif4s44xYT4uKlHpcZxCRNhOo204KxiHoAlrTJ+thc46m77Iy
	 1hu/Bimg9GsEJsEVGdjwKe9aUzwLRyfAhcGjyA2jmYtYXIQihVaeqerC+305+pXMfaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Sk8Hr0fhc3C8eQFrISEupQ4YS+zYJDt+3X6d4EBkWvk=;
	b=5iSmDWwT1YxaJrsUXtg720Rth0vWJoPHNfD69VWNTlqGgR6JYlsXtAF36FAWDR+ZTkny
	 +mBjDip1SVvmaIme0xdB8RZzH0DYPbE+YCA8gciIqwNEkYHdN6/k8HPHCKpRkrKk5MURn
	 njoHj2sNLMWRegIO4tD4Fm4XSeqd4XypIbbJf2zwpKaTl3Biq85RFuts0oUoDhRWhRKA9
	 IH27RRsiBJt+ffXogrmOdxH1SZ85lZ9VEWJ29gxP/qyNCdo3cs6vF4DkMCaH/irpL70ev
	 li0jefFi/riIpv0tZpkEZ3CeIwxnR83kovQGSs1F8VdkjI5YlK8pWjTLvXVB6OX1JFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Cbod9g/Y";
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB47606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAB47606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cbod9g/Y
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1931ff67a29so711059c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793753873; x=1794358673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sk8Hr0fhc3C8eQFrISEupQ4YS+zYJDt+3X6d4EBkWvk=;
        b=Cbod9g/YU3+tOlTtTnbUSHpJBHl6gN8BoKQeRJP9pi5xeiIv1FPevko0jwJ+aGLuLy
         9+Vq0qwtYZhy1ZPpENlk06KJavb305By1d6MkDFwSS94Kb6MIUB0aPCZyna27CAn7nKa
         5qPYzapHjs6ljtS11Yg9JQyVgMkYRqEZjf5pCJfeYdjPZJHnqGxPSheIJ7o8Q6jKz4WX
         A1WQiE5SigEMfFCImoYerpJq3aJaLTVBDKu+btRbLQAt6+T7SXBCUpxxa13F/V3FNOgp
         CvccOATz2nUzmYNW+L7KhgaTkfkqgypeLVVw1GbDcJvVMaSGuL8YWhYn4Er/QeuFqmKG
         q7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753873; x=1794358673;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sk8Hr0fhc3C8eQFrISEupQ4YS+zYJDt+3X6d4EBkWvk=;
        b=o0uO5+rCgAfjA82QkoqhbII0YuAOmt9RVuQ7u1U/bxDxP08aZTP1AYjSxXtxH5Yi7V
         ZFxom33dyYtfdE/eg7daNOLK5zRdxDcddp3Dsg/W4JbS822/928/Xb7SORjmggNj2/Y7
         UItz6lclmudZiBB2VDK7Vp1b7OdJFdWjxI54Xq0lbR0WEKZINrHtg8LswC7OKYz9YxDr
         UGEzESDisK/EexlZWzl5CUesIP5vow+EKDg3ZMDxE5pEPQCFO0JoI9sciDNjvQqzRZdS
         pzKjv0H3TSP9IgV1jHOf0cpiEAjrB+bMZae0TY37PuVpMBrxLO/bTDeLQdYVTPrwUlEx
         ve0w==
X-Forwarded-Encrypted: i=1; AKwUvByItAEO0R9EfzIO9YSHlJGruablZVfk+YRVtY817KnMR5nH7UJ453Xy8ZBXHM3l11jdabLloXnSWjBBd5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vTjGhbHXpXjoqGvAHvDx9U3QqCOoLpz8TEBpTW+UC0oEGfEQG
	0Lr271XHX4SHd0YagihCnm6rogrWSGvJ4Yoedc6Hzjjb/Uv3DWze2/2y
X-Gm-Gg: AYBFou0gHOz4tTqIimR1Jn7xdHcxYGAAnHtBjD/U9G5kETK9JFaYpDbdsWXYG/ZM2dA
	f3cNyU4UbShI8ITgtCj97z9g3A9QeMIP0Fu/koMuqnR7MGvgsqwmXcnNq22tloaFT3PNFinz8Y4
	QJ1xBgGQow0UL4RU8bUXZEAAkefgjnq2Ty57iGDruU41kcj6o2zxiY8/KzGQ2Cb+6NemiF2LnFs
	FNSWP1FenaEm3Qo/6IWKtsgyGn07zHKMyCJ9qY+KNBgH6LkflqxJ7B1nJAn/pZvlLXNJgLW4gjF
	qCInwI2OYfXl918kzXJD7xMljyMaIPjaI7oByRagPHyhrQ7xLhGx9Ip/Pa0NgRuviL2hOKK1KkM
	rhIeqyiYbW9IkNnlqWs7OVr6c6uSQQ08SMLlD5jC+4lMwEHHdZJaTHZnID3MtRsvS8qzQWLbNrP
	LqU1AMNTPwDH5Mw2XmVarxTGiMrPRKG2SwXgmgZFWI1tIk4kHVBp9e2LI95j4QzxESlpxHYGMRh
	7/7J6BfkveLSp6xi0RrwNOkSXUHpdrtB4KMa2QumwH2m8KO6CSg1lDQY2dJcbJnoTdssRuOXbE2
	38Zm7t33MF7oBTTH4Tu+
X-Received: by 2002:a05:7022:1117:b0:195:49ee:94c7 with SMTP id a92af1059eb24-1ac5a0b579emr19552410c88.8.1793753872638;
        Tue, 03 Nov 2026 16:57:52 -0800 (PST)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2c2ddsm2546423c88.10.2026.11.03.16.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:57:52 -0800 (PST)
Date: Tue, 3 Nov 2026 19:57:42 -0500
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
Message-ID: <auqC9jOIQTyieQUJ@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
 <20261029-spyglass-evasion-772697094cb9@spud>
 <20261029-amuser-savior-6a6ab062f471@spud>
 <auSDJH9V31wmbrYv@debian>
 <20261030-slider-finished-360b10521e0b@spud>
 <auXQaY25XfYzxEb1@debian>
 <20261102-throng-botanical-b244058ecc37@spud>
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
In-Reply-To: <20261102-throng-botanical-b244058ecc37@spud>

> I'd rather not really. I shouldn't be the maintainer for platforms I do
> not care about, but I will do it if you're unwilling to - in part
> because I expect that the volume for the platform will be pretty low.
> 
> Please read through Documentation/process/maintainer-soc.rst to see what
> the expectations for a platform maintainer are.
> 
> Cheers,
> Conor.

I'd like to take on BL808 platform maintenance. I'm new to the
maintainer workflow, so I may need some guidance initially, but I'd like
to give it a try.

I'll update on v2.

Best regards,
kwang.
