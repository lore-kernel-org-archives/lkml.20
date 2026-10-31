Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793446019;
	b=4oOrfsDPCj/3EjCQ+XJDgmoLXtfmGY9JRodpS3IYq766pmhInRLOtiR3qV7v4ISBEtSA
	 Yw7Iv06HroiRAMhr62TVcEXu+MPuWAol1dG+ejL2kj7hA1XwFlz4+ODfbJo3LkUi0Y3Qv
	 GwUhKnS+IQeo77Dgsv+lp+T4l5e+YrIcc42LblMwrCJZfKVS4qrGFy7pO1/X/0avvjVb4
	 MlmbBO+JzyIhEU0P9GlJFqahi2wSPU1e5LyerCSYjhpBqjTlHDKsf1eSUwlS9CmBFk+oP
	 wBUlEV8oWzkHGitSEplDwIpew9+gm9ALbxu+I01GqASzDNQlLLZEnAJpuyhi1mfbLGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793446019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eBAqeg3P7IjkzEoe4Ha0kzpqAxzRiyS3drMdSnkFfrg=;
	b=StndlJzPzvj44NkYZkMN1CbcXYdFFfABQ73v1nEIcE3m/Vsl54NcmSDTvXf38DUqCfj3
	 xpoSRJCwWUA0tckFUAdk8ApL7eLepiyBLY7c+1wee1rsuYRwmBU3ekOe46Yum+ZgmnQFV
	 Re3W9dIsBAQJSsk3Fg8pRT+XujYxlZjdiSMDv96drp8XeCEgQiRtkmymarhH7G28EpF00
	 vIl0MYnGSgK6K+dZtgXCZXw0Y+KV5EijZSYkQOlroIdhqE0GvE27ErTag/joGTxhOI5zt
	 DE1v/mipRaLqDGjQ4JNc02yRBKI1bpfPChBEf/NhzHmAUPBjDTzl7XgBWzJ1A4oDn5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OOHFPiJv;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC62606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 11:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DC62606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OOHFPiJv
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so657367a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793446019; x=1794050819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eBAqeg3P7IjkzEoe4Ha0kzpqAxzRiyS3drMdSnkFfrg=;
        b=OOHFPiJvJJp+Y8vZjZ0nvwcq0VjDLqEY0recjcf2GspS9dMsfqZlPeR5uLbH1VAgb1
         ImUtA2/oSWkURP9z3Ve7mYKAlbqumGkxj/mVlnRC5F40hh32RIdYXwz2u1Jp13G2qiJa
         h3HAWvRG/fMz8z2Dg5dYecnZT79LHQ3HlKAGcmkhWRBWng8CStQ5BcH/sfce+uAl93i7
         +hM+NRY3XYz1mXB/sj9jwPhtimenwm/WVCClkuoROdDITpbUakuSFRdIHeVtOS6etuXq
         XEfzvrhDSPYLDX6E8gsuC7AXrRKXu+QT3q5f4n0h/Wfsm9VhHcEIYA6mCncBZErfpBy6
         Q49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793446019; x=1794050819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eBAqeg3P7IjkzEoe4Ha0kzpqAxzRiyS3drMdSnkFfrg=;
        b=pjwuw1IvcaXd5pFqaK7OUcuoaH8LEM4JWBktG3RmeapkEMZnw+MmUIBnVPkRkSHhRZ
         ZNw3r4qmY8kTUDjVsjYavwuAmaqsL/uf5/2X9l5cIN8Mk0Q8J/STF0C/39fDSiLuvyLE
         PdIye5RyIShRqISizGYvUf6cQGg+tUoQzA4mji+xB4Xo6t4FvOyFSWG8614yeMKBAxtH
         AwQIBAJY4n41XzBOF8z/dOoLmXPgC+WSHtIhI8PBNieTDSrg6PaZOslFYslo3L3hQGOM
         XrRuMLF8OuURbLceL2W2lD8y4YWWt8Dcb8Cars6IbL4udoEJv76NE00VT8LMsOeyEWVT
         ccxg==
X-Forwarded-Encrypted: i=1; AKwUvByWl2rqk/R/tDjVsCOQHgiJQnOgIi9A+wVywYi6Wf6qTIYqpUOlD4rt/6Nrh7VJ11Dx1DeLxjFyrKDwLC4=@vger.kernel.org
X-Gm-Message-State: AFq9FYISwF43oOM0gWYrCCqB2njwcHDvhfnCB+gV6AYPmxJiztjxkcV2
	WKhFFyyhBc97uuzrL9v0ow3NuTXx3uT7yc8GITqYvWPitX9JUPpkc1oZ8ejsiA==
X-Gm-Gg: AYBFou2Kc693DmE4nOyzSiUgxXlsfKdeAlBDh0QLaTau/l3MRDs/bR5JYJBoCniBGE/
	8vozHs2Nz3YSxIRXgP3xpQ47bJdewdWm/q8z0OW8frv/05ZE6nTIpdUmjEzORw2wEMWp2UMYzHm
	NI/7gBUwPGd8UDz79RxFulYgikgSw1Uiw2FFTbZfLM3YVcHW7Y6PlVjtytNixon7TWzkniAPznp
	oymhhkVTRNGMST5XPzbKCLCqvwM2sR5uOjuMvm4Zx/Jiy82iVfAek5ppCLSO3caK9rTn89adW0C
	thyBakoHdVd6Y83yJ7oWS2ilr6OmD08f4207BlzR88S1bVRqt4XMMndkKIUX50LicbBgaRy0Cs8
	HqlG7/JyqeoFP9/CbUJCDSFIIbCbp9ZJG89A1Fr67V8b3re6fbYQHQSapVvissB7IcROsqaZpst
	Ir6CdGbQaCfbU0G9vtP5zz6rC+25TsqsBohRKhM+poBLEJLm4TDrZVmxwl2+FY78y4VIy3DRQ/2
	OE2TL0xclg2mdOxORNdcNyK7QD2IZux1L+JmgQaAn7LTImAQYbayiq0ydbqcp8rn6MadZ/+OTJz
	fjkhY2zNshL9NNNADc2Gzw==
X-Received: by 2002:a17:90a:e7cd:b0:3a0:8050:2ec9 with SMTP id 98e67ed59e1d1-3ae897ccf9dmr3920644a91.16.1793446018866;
        Sat, 31 Oct 2026 04:26:58 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8fb2fesm11638646a91.4.2026.10.31.04.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:26:58 -0700 (PDT)
Date: Sat, 31 Oct 2026 07:26:33 -0400
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
Message-ID: <auXQaY25XfYzxEb1@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
 <20261029-spyglass-evasion-772697094cb9@spud>
 <20261029-amuser-savior-6a6ab062f471@spud>
 <auSDJH9V31wmbrYv@debian>
 <20261030-slider-finished-360b10521e0b@spud>
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
In-Reply-To: <20261030-slider-finished-360b10521e0b@spud>

 
> Okay, that's good - but that's more of a response to my comment down
> below about splitting the entry, not a response to what I was asking
> here about the lack of a git tree. Are you going to send the SoC
> maintainers PRs for this platform or were you expecting someone else to
> apply the patches for this platform (IOW, me).

Thanks for clarifying.

Could you take the BL808 platform patches through your tree once they
are ready? (If that you okay with this way)

Best regards,
Kwang.
