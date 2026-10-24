Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829818;
	b=g0S7VxQ1Q4YeGCIW3Q/pRrmPiLpVkPLCu5qAsqCTSXcZGFTYi7LiTBL8bjch3vzwanj7
	 7ybwHjwzf2lkix9RjyDY/m/ZswWdqlkJ4wGLKkkGxg9MYgbPlA7fkAwmtgxHPeWByT/a+
	 BHAUl6888+zb19Ia6botGSPBoH4agtxzTO0V88Rl78ViM0wxhJMMNTRzU8/r5O9HY1eMw
	 E2XV5p5AAofFhcCcVCGNRnhdzTx0R8FcM1SRuGLOIdp1FPSk3fsro9HbP1f/Zw/iqfDc1
	 AEgqFH8Zk565/DCUfXB6p78GxiEl43jrjFefrJepIwPdgy6Ts1LJxhgZLirHUMVmt3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
	b=QDoVdHVwZCeVfjo0ZKekVhLmAs6MQDjzoW+Xg5AP2xndBlI0aAJ3kc608ruggOKbPzxz
	 vkR2OzsyvTq8lZde7+Svo2jbQuNrBWMd6riG0mE7MU7KiAMlABHLtHIhgWK0QqPjJ9aYn
	 t3xgjyRnCVsBVBJ1RQp3unKvvlKKqyAKtNEX+au2tNeJMBjZnFkTyZCi9BFE2Q7xROgoT
	 npgDWen96pmybo+xyGAJfOxt8ADmVYeMCorP2OfY3RVT1vfJYOaC5zwwVNtR+CLOF8onF
	 S8p50dnccldRzzATKkMJxUQ/aafelogvJODJSQLeoUuX7KwSGC8v00BMlz6kkLjYpMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=J7SknmwT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C451606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C451606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=J7SknmwT
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4395d31228so237176066b.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829816; cv=none;
        d=google.com; s=arc-20260327;
        b=msiSKCF0cKg2MLumWf5uCWhdDzclznn9ruLcx6cnYRQaE1fs9XnqNu3ozYXDMHpl+L
         4nWawZYZy1vSb2Fv5RVq2fFnHaPN1l/5bqYev9rRQKQfQWyngU/s6tDXFuSWxY7DPdfR
         wvHsFd6MRsX5EBw4dN3Kro/QWiuY3bCAzP5y4xQjd3V2ITWy21MKjpqSm7eyhlGaf6JJ
         6vZTMSjIo6GDD4wSfvCuhnpuEo02kfFWYLkToc79twngRJJyz3m8xDkGPKmCKafYE6uq
         KblNIzhNUd1wTl51p9UreQFcipRMNqn6tcAzZbPXq02VZfL7WK/zLO+U5BQFH0Fypp7M
         xj8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
        fh=2yXGo0ehaOmwtm1FRv4ZhoeKkmVmLCtw2T95dEK5wt0=;
        b=IqrlF9UIWjP0l1WMOZ3h/brSPk9bMf5QEOGp8ASsrFZNf1t2FoypYkBctmr+jXmHZx
         q7BLcyCJn9Qbvgaqh0t44sNqXHC2/pb4A4wMHyVa2dDhcXwiVs/14nt/AvI/QPD86Tcp
         iTTCxxrtkwRftPwUvsbYYZeX47ZPh6mGMWS6bD3seZ2UTyi4vnmh6kvDbUr5Ptzg1YUz
         fWQ7wX/55GbInSrWFB0uEBRVtJIjybTUEfay0rnhonG1cViXWba92gxPGRSvQ2lxKbZa
         4kG9ZNlLQfHnM1/GPSxdAh7ZbwLCiFdk6au1G2+oyXD4GeQ7wS1bVyLoCXcVfx1y4PIS
         3YJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829816; x=1793434616; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
        b=J7SknmwTTzL7ECy7vAoxuDafrONez3XeCWql0X/0YXhgvAQE2BfBECDlTFWueGZ8Jh
         klrfah4NQphtxV5+spcx32j1zY8Lj6vh+cJFzrPDn1Ptw8VqQ53UpyioqrJd6EaGMvWO
         eSd9MJuHBLn7s+f0x+KjG9NHtf+4lfLEvhiOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829816; x=1793434616;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
        b=iAwS2fo7Ij1S6rUBOjjTGlxo+ezNQVLVYw+tQWr6liVWNxPTeR/20Q8RtVlXtTzimf
         qXdXk+S0UfFU8td7m7t91JkS8C9w/NSFK6dogTyfg/kpAT5N0eFRP0muKsn+hEgOWD2n
         1pgTi8+SSp8lUdJze6uX99HykiDO3/r7DXiP1F0kVmmLy7a+iQt53VBZGjcaeCqb3gim
         Unuc8OWgVD7m8GXl/tSlCjoGmdLba6+5TekH1k+SQGdMowQumZDGsNv32UiYcGMhpnlc
         JynT2YgiKBHb3ZX30c4U/IV8ZB9OqU2XHxh4WHP11cNgYpSN5QUVVLZtHO4QGPA1ApoH
         L6bQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPoxhsTlGJ3c5LCbsIwsStFeasbf2mNcH4GKeT+w0G8QAr/EnJMY/DZlUw6AgxiJzDyCQ9N3tM94KD+rg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvDPGY9XdOyfVSQV1BkOdPCX2xGDfM96v5rJYqG1ErsuxLYPzT
	kNtjA2vQBq1JBTXrLaE4J/AdSBQnkmjwVA8T00kYslGZXJfqlnlPPiQFlicnX7NPjwosSnabfZK
	LsvjTLnd9RVohjqwIi6IwLpxipN0yJNZXIIKqpSEQ
X-Gm-Gg: AYBFou2PAGRxGZLIQpab4XtaSfW8liRVlZu0P0s5Z9eeGegEfdPmvNFRSesE4p5sxyY
	PnF+O3NWIzh9EfuabGyuwai75SOykHciGjtvy34Wn3d6iuD0NJ+15EdZYW6lqUQr0gJS/vRFwRz
	MpcowvaeJvE0tKzwlNMIHjxyfTnEFoq8jiQ16Zy8eXxYEYRVRi02+Tnf7l+7P9RnlSlA4VaGHr3
	x9fGb74SIk/HRwISPIms4uTb8DQ4jP9zZHEq7iwJPhA4gshOnn+R6uUNchjfYYX1tnAkRK6AULi
	CFBwdP9wkfk6X5Z+M/GVzJrWxUA6nLg1XjeabcvWbwlGm0L9fFNb5ZNIDkm53Av9yORY7pvdVW+
	KO82sFXQ3UGOCEMaRm3vahHdBJxEVskQgeFg=
X-Received: by 2002:a17:906:9f84:b0:c44:494:692b with SMTP id
 a640c23a62f3a-c46bde198e0mr151110066b.22.1792829815874; Sat, 24 Oct 2026
 01:16:55 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:16:54 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:16:49 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020153652.2907186-1-dianders@chromium.org>
References: <20261020153652.2907186-1-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:16:54 -0700
X-Gm-Features: AclHuK_VJyuusU7nyQWEvJVdBRj5rBge31M7RaY0GTXZjSe04p7xrEJjqvNNRK4
Message-ID: <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	cros-qcom-dts-watchers@chromium.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Doug!

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:

> 1. It uses a checked-in .its script to associate metadata with each
>    board's devicetree. Other tools can parse this metadata in order to
>    craft a package that the Pixel bootloader can understand.

One thing I'd like to check before this goes further. In lga.its the
metadata is a string packed into the configuration description
(board_id=...,board_rev=...,soc_id=...,soc_rev=...). The FIT spec
treats 'description' as human-readable text, so this turns a
free-form, undocumented string into an ABI that bootloaders and
packaging tools must parse. I'd much prefer proper properties in the
configuration node, defined in the FIT spec [1], so that every tool
can rely on the same names and types. I'm happy to help get that into
the spec. What do you think?

> How does this series help us?

The FIT_ITS path is a second way to build image.fit alongside
make_fit.py, and much of it repeats what make_fit.py already does: it
puts the root compatible from each DTB into the configuration and
compresses the DTBs. The series adds fdtget/fdtput, sed parsing of
/incbin/ paths and a shell loop in Makefile.lib to do the same for a
hand-written .its file, and the .its files repeat the DTB lists from
the Makefiles. Have you thought about extending make_fit.py to take
the per-board metadata (e.g. from a small file next to the DTs, or via
FIT_EXTRA_ARGS) and to run fdtfactor itself? That would avoid the
in-tree fdtget/fdtput, the mkimage dependency and most of the Makefile
logic, and trogdor would come almost for free.

The new FIT_ITS, FIT_FACTOR_DTBS and FDTFACTOR_ARGS variables aren't
documented anywhere, including the image.fit entry in the arm64 'make
help' output. Please can you add something, perhaps alongside wherever
FIT_DECOMPOSE_DTBS ends up being described.

[1] https://github.com/open-source-firmware/flat-image-tree

Regards,
Simon
