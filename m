Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793409323;
	b=fBZDChpAzCkE+9mUI+3L3IACCepflNEz8Y2P6wgNt5ZuS24uE7CeB8YV4/YpQBOZ+e7/
	 Nwcw/gGp382pHnQJq8WA7bC9HCCdTGO2lhnrNO9TNPK5lwc+DBNiwMgm4XaAg3RUCNzbk
	 ghvBvPlSaEokh3tHD23WYmFUNUjaREZx5BE81Xe3R6aLTazJlNzCvi7GyvUGHqgZUf9n+
	 /g9FES98PAptr6W8obDxtitPBpmsx02FZSjNPvDHM8KXbJfhnva7cZrvNTCS+dkftEghy
	 8znkKkDDZWqe4eCjyPl6uf67i7HN3iZwihKo1IHbGqslga3jGUbhCeQvYy4yZHBbB9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793409323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t12/gzZv3Vh9NEgi2dyQThdTzmEZzU4w5/1G0K00qvs=;
	b=wwd/5f2dw3yz0Y37+5Twju7HAJd3M/CkHj1FdkiDQBtsRfFHXZCthxD+UWMzpgOjEIxK
	 uCo0rJJqy1KWOGfOfYmVXoP/kMLV4xEtxmyh+pSIqj3K519TqM141xFYnD2g5cHp/9gkq
	 vu3CW5k60WmOACsRUQFUzQj7/q+dOnKhczeo6JlzaGWG/deTzC96ffrfSrOQe5Wg2c3Zi
	 7wx47QDU74PDouCK1dyr3HHLlgYGoTDRT/MzWVwyz93oHpSbclGq3rPnSp4Z93DfsmPBs
	 U0qPgVNGSXIC6GzOSq+n+for5WrhnazpGhlEo24WzY3pcPFNByJjnFwDk3oizn8aOTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QQzj+TIG;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B574D606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B574D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QQzj+TIG
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bfc3292d90so1020415e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793409321; x=1794014121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t12/gzZv3Vh9NEgi2dyQThdTzmEZzU4w5/1G0K00qvs=;
        b=QQzj+TIGCfKVZwSwOq0kw2h5Y2H+qzjgt/oapxnW1fIXqMvOmW1hNRHlRKlgD6HHlk
         wnqSSeQmWBtFpDx8M5s8XJ4F5Z+buIZYGIDRnCemqtsX6CR5MD+ASp8UcxuIwAMPW6d3
         h93Kt0L78cFn0PelOQ9g8F1IkESSgBEViOYbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793409321; x=1794014121;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t12/gzZv3Vh9NEgi2dyQThdTzmEZzU4w5/1G0K00qvs=;
        b=bQBqzDUxxI4z3OiroX2/iqpi3tnT+QBySl9uDBwjE4BGvy2prA8oGHV1/ONAEhwdhP
         hiKBjx1kqIm3jfw458+44QhAe7xb/sOVoXrt5hqku9dPI4qzb1XoIkcwGeBew8X4uHMy
         8u4t5ng6yWFJXAuqZf9P1MN7AOImQPcJK+sjP9fgxk2toqFHuBGmeOBduTfpCcqfGljb
         0vn54qX+/AViokHdkiuEhmOraNl1z1ANU3FXIhNCRFyly8D4zgQRVmSiQESKkpKlnzg7
         6VoY+wM9q21VMDkcx1rbpVpB6KPbcYg5QZJX+SKU6Eu1OxXAQpn9T//xZdosRAOGVK+8
         kNLw==
X-Forwarded-Encrypted: i=1; AKwUvBwfyfHNii8HIZyLadDV1weqCQUJJ26YW3tfuNa93qZ6VBOnz/JQ7QVbnJyV1XXaEinxAo0HT9cSKvY4J0Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAP14Bs8Ffn0nQSEyUAI9XrFrRhsXk3Q+pUQ6ukR7gnlmUFTP7
	CWcyneJp92Pswi/yBDCmo5BvMoGqI17gj97xnRcd9zW7OYAaEWuFL8B/t91xpYMdgmhdUfS/DhC
	uK2G13+hU
X-Gm-Gg: AYBFou1+mv9wpiRwUNwZr30XmW+DlGiHoyEK0qEU1xrZYhGB1tDRO2oVMxc1robhPAH
	pVkFbP2dOnTr2RE6bYl4+1Z7vAoYpgZtZtSgwt5IPGp5MkrdyYa2D656tBG1oM2r77iAtMVvVOa
	/W1nYIimBSImvDwn4jTXFKqsaWTRYrLOgOO6vRnpYD0Gk0G7S2is1+OBg6FeeFeR1J1AWibsnsT
	+hxnmPF1WJH2GgAYO1yOl/pT+WR/aji+eygcnp6Rn5ImhhWj7YhGAFhO7gsvQU2yS71TQWebiuu
	ujoY1aOpvw8ttIXMDIU7LDMGPHZuc/WP1zgpfMYN5euqZ5hKgaBDsBNy/3uCxuLWbq4Ns3ayyn3
	c9ztygaLqd3gt3pidVBt2tVRErR8B5oOyvnE2wbMPLRG5982qwqcxO84LJXWIjiz84xGveFUqkh
	bFkPCBQPu/qsUT/p3kqagAJeQarQoITg636G8YoHtdx0VR45j7XwDuOEyagVuIn+0GTexwZoM9l
	RUCdXYhUWH7bGk18VpwLMBMIL8VeBUsOrSuORVdlqPX9RttpsN3VCyvKFmj5uwlM9/SxEt9Cp8R
	sPT3bh1Amo5HH4Gmp7n2avqiWAN4/BDe+s+Qty5sDgTb/bpzomHJ2vHoNJVUNdxMUUhH
X-Received: by 2002:a05:6512:2311:b0:5bc:ddf0:d96 with SMTP id 2adb3069b0e04-5bfd957b9a7mr1484755e87.59.1793409320903;
        Fri, 30 Oct 2026 18:15:20 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe07378d3sm302144e87.45.2026.10.30.18.15.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 18:15:20 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso1430800e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:15:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx73yJA9E/FDh42DUPieRMRt16ww9viOjGg6zcjz2JqvrIAqmmR8Puov45mEya2sE5vNJVSI6HfKJL/530=@vger.kernel.org
X-Received: by 2002:a05:600c:609a:b0:4a1:7c56:d4e2 with SMTP id
 5b1f17b1804b1-4ac1709aa77mr83103245e9.16.1793408992269; Fri, 30 Oct 2026
 18:09:52 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org> <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
In-Reply-To: <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Oct 2026 18:09:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
X-Gm-Features: AclHuK9Km6WTJvvTvOnJ9g5USO9Th2gdTGYh9-cjnPaFh3hhpAF88g-93yWA4Zk
Message-ID: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
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
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, Oct 23, 2026 at 5:26=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > 1. It uses a checked-in .its script to associate metadata with each
> >    board's devicetree. Other tools can parse this metadata in order to
> >    craft a package that the Pixel bootloader can understand.
>
> One thing I'd like to check before this goes further. In lga.its the
> metadata is a string packed into the configuration description
> (board_id=3D...,board_rev=3D...,soc_id=3D...,soc_rev=3D...). The FIT spec
> treats 'description' as human-readable text, so this turns a
> free-form, undocumented string into an ABI that bootloaders and
> packaging tools must parse. I'd much prefer proper properties in the
> configuration node, defined in the FIT spec [1], so that every tool
> can rely on the same names and types. I'm happy to help get that into
> the spec. What do you think?

Putting the metadata in the configuration's `description` property came
out of discussions with Michal Simek at LPC 2026 (where Xilinx/AMD
already uses configuration descriptions for similar board matching).

You can actually find one of Michal's files here in U-Boot:
* arch/arm/dts/zynqmp-binman-som.dts

Then parsing happens in:
* board/xilinx/common/board.c

I honestly still think this information would be better to live
directly in a board's devicetree itself and then extracted to put
in the FIT, but I've decided that fight is lost. Honestly, the
allure of using `description` for me was that, since it as
free-form / non-standardized, my hope was that nobody would really
care what I put there.

If you want to help get something more structured into the spec
then I'd be happy to use that instead. It's my opinion, though,
that the metadata that we need will be different depending on
the loader. For instance, on Pixel phones the loader has this
information to help pick devicetrees:
* board ID (number)
* board rev (number)
* SoC ID (number)
* SoC rev (number)

On trogdor Chromebooks, the bootloader instead had this information
to help pick a device tree:
* Board name (string)
* Board revision (numbrer)
* SKU ID (number, though actually made up of a number of bitfields)

Michal's loader obviously has a whole different set of information
that it uses to figure out which configuration to pick.

The proposal I've tried to push a few times is that it's OK that
different loaders have different types of information available
to them, but people don't like that. They want a universal standard,
which nobody can come up with. Thus we end up with no solution and
everyone does something different / downstream...

In any case, assuming we keep this as 'description', I'll document
the exact format in v2.


> > How does this series help us?
>
> The FIT_ITS path is a second way to build image.fit alongside
> make_fit.py, and much of it repeats what make_fit.py already does: it
> puts the root compatible from each DTB into the configuration and
> compresses the DTBs. The series adds fdtget/fdtput, sed parsing of
> /incbin/ paths and a shell loop in Makefile.lib to do the same for a
> hand-written .its file, and the .its files repeat the DTB lists from
> the Makefiles.
>
> Have you thought about extending make_fit.py to take the per-board
> metadata (e.g. from a small file next to the DTs, or via
> FIT_EXTRA_ARGS) and to run fdtfactor itself? That would avoid the
> in-tree fdtget/fdtput, the mkimage dependency and most of the Makefile
> logic, and trogdor would come almost for free.

I certainly can do that if that's what people want. ...and, yes, I
think it would simplify some stuff in this patch series. The
question is: what does it look like? Is it a file that is a list
of devicetrees along with descriptions? The list of devicetrees
would be to limit which devicetrees are built into the FIT
and then each would have a description. ...and yes, that would mean
it would need to be updated in parallel with the Makefile, but I
don't see a significantly better way to do it. Yeah, I guess that
could work OK.

If so, I think a bunch of the patches in this series will be
dropped or look very different. I probably won't directly reply
to your comments on patch 2, 4, 6, and 7 if we go this way.

Should I give it a shot for v2?


> The new FIT_ITS, FIT_FACTOR_DTBS and FDTFACTOR_ARGS variables aren't
> documented anywhere, including the image.fit entry in the arm64 'make
> help' output. Please can you add something, perhaps alongside wherever
> FIT_DECOMPOSE_DTBS ends up being described.

Sure, I will make sure that any newly-introduced variables are
documented in v2.
