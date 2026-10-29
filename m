Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793306636;
	b=oZxRY2XwEdutKrY1wm5e17NSYKx4Qyz9FIoO8VoCc3R4nrb6Bd9qGqxx3eZP3p0eAz2g
	 h3NrX0m8tuhHNxbGoPq5GQtMep2/kMkzTp0NKfyAxO+lUrf+oN5FvGY3EQo7mdX8jco8I
	 uPDkxh9qMoUZKPFppXOGaT/1MChop3envdTu9CfwLTZO5GfPaMkf7nEBYwWY4uSeY3h1B
	 kxuRGm9KaWk0LErndMRJ+TneWL/2SFBnw//X/4j9is2dVtug0JQwZyTfeu9nO75yjIKV4
	 vanig7ikeb08hiOTCtr1E5Gc3GsiJSCVZmUGBfrXIZnZc2/vK5qHq2VO2mAlkaUcdxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793306636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UbmFjhL1Yr1IGodMB6f7gL/eg0MWJVKXYMJM5sJ6SX0=;
	b=woLgEoiR7z8+JfTCmhyEHURDr+oblK+dkpH2JSKHDU4t7uk8DFrap5uQDq7J8UHFcpaB
	 JmSRHC3kr2CP9ZmZH0mGUmIh7nP3GSDaTV6PR94QjjT5W/+S1jEAY2ziSgwbvCAWw4DcN
	 rv2SNgpVT/KZd8pTFxqfGiJHJD8SS1SvQnMBn7rlEPdhXZbwGFy+H5I7G9MSeuFtDWbsg
	 B0mpsrEdEkZTJmf76+2+apoPC8KPzBIA1aKHfy0jMi+N3VemQ/hjntbu1dZNMZeJHAKph
	 zjLYyuCs3lX5AJZLZAepuAJVqo3KnVPh0cbHPRpIVWB84ylATzRgMD9Fy/pHv8qiH3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=EzloVelJ;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95404606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95404606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=EzloVelJ
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c45551fa84eso328150766b.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793306628; x=1793911428; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UbmFjhL1Yr1IGodMB6f7gL/eg0MWJVKXYMJM5sJ6SX0=;
        b=EzloVelJMpFvlgCSyB3rzHG1wJohLuxYC7EDLh8Moda+0MKiJRmOAcyVC6uAV/Mng3
         T3350d42T8eqefdtCVVwTj1GNdqOitmDib1LjHnzhuvJlZh+lyYTB6nKZra/aAVSf2ZM
         m04RxrUr8K09nypIknQfqGQhUzkVeu4jvYkvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793306628; x=1793911428;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UbmFjhL1Yr1IGodMB6f7gL/eg0MWJVKXYMJM5sJ6SX0=;
        b=CHhoQfZ8phTYUSN0d718TT52+dbwz0iYAK/jkIcgjhMeALUSIw5rEGd4BmKoXxpmkG
         QgpDBZpve5spTJ1PRm1rkrtq+xLUECJSpWPQWAGpeB1I8Y0uT/EOK80feiist0e5ufPN
         aVAA4wL1T0XFYIgpvEsb58BBFHFrj2PLRXVhdaocFYnYKFWuSXpXuRbSqqbfRp/hFkt3
         gjb0+VVrtGem+bq28R7zNlsTPUAsKFX8Iwgv8Ogrc5afhsm16su1ry5B95rlo51/3zlE
         nR53OOY01FAnieac+U4VFFDrQDncUcOrdnOgbtmH7vhh0PjF4TWBaTok9gKNPZgsjyRG
         4Uaw==
X-Forwarded-Encrypted: i=1; AKwUvBwxW+MDFix18XkUomzaDUQHnsx20+lXZ4RPS+wdUzNBf78Pdp1HMCeaCUrVcnSytGjMlpZM8If9c6LFwCw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1FezjSCUMITSEcG+jDnEjqUJc+mJSCPobzQ234gbjWMQsM4fu
	NxH4EvoxzsqTZJcSBV7+wbDNosv2gloEjLlk5xGWNeKJ5ITtiF8gT90sIMr28P9W8bafqjuqILP
	w3GKYyAE=
X-Gm-Gg: AYBFou18LrWkmirnJssutP61UNUqrd51FWo0NVw/CMPscNHeVvibY52Ibmq2A+Qgw08
	nVJRltWFFbIJfPDQwfh9kK5fjI5mdMdTKFGOksn+h4evmcjeLUN3byYspDP+HZD7RBVLuMK2SR2
	sE/dBzZmeAMjc3RmuZz84HrAu2oItOd1BBnazUaUHyu1qp8eaRAayW4YPBSb8vL/GPndLVbK2YY
	eIEWQUJYOtdwWaLj6f7o/XEEU7TOj7NAqxHPXYtouW9cm07GuZnWvju1d8jPTD4yJvpTrMWOywt
	/qdkEY8dKhXkraZIRSLNlraCc5iJBaAbO1L0T5YRJVHULCl4t+sJwjXewIExEbU4Xij8bm2wQ/n
	jMoElna/3Z+C+MCU+553U0mSOy3E/XjZcD6cz1ySFutLupalzbCqNLIHiXWzIP4UjMcSbU9hr/S
	sOOGuOPG/FKHHIqI6JFI9alZOy/kGfvT5CNpQ/11dg+vVyuOCboz+kpY59FkMSDL75mV4aXkg1N
	NJAbN8qcO+VJvRRevBLvQKLgMDqF6nklA2ijDVZ3Tijhnm97AgBD1WTJu7XiA2CUSanZXn7rRu4
	rSD8PhWmnxNXYMZ40nCBeM3dmhU4QQgogUX8UmIDpNHo4/v69rXnZr9lrC97fYarHO2UlB04Moa
	qMKc=
X-Received: by 2002:a17:906:c142:b0:c46:8063:220c with SMTP id a640c23a62f3a-c4ca7a09d81mr22700866b.11.1793306628054;
        Thu, 29 Oct 2026 13:43:48 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca322f64esm19782366b.84.2026.10.29.13.43.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 13:43:47 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so4442394a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:43:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw/NETBGNZ8BDzk57MyAdAN9ogjlZSfE86FPzwDM2awXY/AZq4VvnFeY0+wEpAetbJ2DWXm+ZqYpq6BZX0=@vger.kernel.org
X-Received: by 2002:a17:907:96a9:b0:c46:2a05:b257 with SMTP id
 a640c23a62f3a-c4ca7a4066emr23266366b.23.1793306627099; Thu, 29 Oct 2026
 13:43:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029180116.49074-1-ojeda@kernel.org>
In-Reply-To: <20261029180116.49074-1-ojeda@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 29 Oct 2026 10:43:30 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjt_ahzkGAwnExc85O5RArzFiAV-SiFzY8eP7RCXqWM1w@mail.gmail.com>
X-Gm-Features: AclHuK_WekUyoZUl-q3rSVga5UWQQ_ZOCnmNxHq579Z3ukDBrM2pBi2mbGQaVpI
Message-ID: <CAHk-=wjt_ahzkGAwnExc85O5RArzFiAV-SiFzY8eP7RCXqWM1w@mail.gmail.com>
Subject: Re: [GIT PULL] Rust fixes for 7.4
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 at 08:01, Miguel Ojeda <ojeda@kernel.org> wrote:
>
>  - Fix KCFI failures on every call from C to Rust IRQ handlers and
>    'hrtimer' callbacks by giving the C enum bindings the correct
>    'cfi_encoding'. Also prevent the same issue for DMA callbacks
>    taking 'dma_data_direction'.

Bah. Is there no way to just get bindgen to do this automatically for
all enums? Would that break something else?

                Linus
