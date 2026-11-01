Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793569018;
	b=sRzoRWqsOechV4xh9BfGx0B5yOjcBPWLHsFX2bRcvhnegAqI/i9oIbLLjVZEfVTLHrVP
	 ICJivvw00w1ZfIexLJmC5b6sy3HUrES71ov6wyCgT22xkv3BvxbvxJAYQPDnsz4ApnXAT
	 dJfUGSwPQSZnMjJ+FmOJFfRggr697cexd1NI1HgyUr1sfoG7Vdnt/pKD+PrazEpgm2C3Z
	 +/qiH1DBLrEa2+qGhRFTJktUcr55EDTYJoNrqF9B3rOP7mR0FzZcyZ6l/h87wpA0jMWZp
	 nmWVm1rKznnCwx6OsRbMF7vhuFo8lVliY9xAmL0M34svv83DDtLXtYcInpbn/+FGiYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793569018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y+s8DhqIO5ki4BPjT0hMEJ5bMlWwwKI5gQlDegeYWw4=;
	b=P0z1Yb3dybrbPTJuuQlOkzHjRvMGI4XT/E74745RwzfuRjtDUNPYLBXs6IGi/UNndwBu
	 hconR1IEIk8uNO4rjimIV/uVUd/vYc69CNg2Vol/LmMVcCR4mav4z/tDAYPb8CH4YaxQ8
	 D25TGV4AOn5JPA27Cl49327j7tecoV8sBSERYmmeiIHXRjBVQA+DXOYQQhU3zGFXQzKJj
	 a9ij77krY8FSMsxc4IotvcRfZ2c6gvKRhPITSiQXr1TuSaoMU4OUYEHoYCPPsDm0WhQNj
	 ztbrn7qvNrY+Sa3LxztJTlgUuzTVKTKFbEpytUNLyRvW2m95OjwQ2j08/xa4LYCnOCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PDdT5LQx;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCD3606A327
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 21:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FCD3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PDdT5LQx
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c43fbcb4393so355146966b.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 13:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793569017; x=1794173817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y+s8DhqIO5ki4BPjT0hMEJ5bMlWwwKI5gQlDegeYWw4=;
        b=PDdT5LQxBo02AZCHNUCgiS++wwHzZJU01W3jzFiioq4j5XngRhz7bihojtrFkZ0HyQ
         5Tji5QTN2DAgBkk+dR1kkTwGcNj70on94t0bO5RXk/+VQd9Dy/lX4C4uDq7q0eh79gS4
         v3F5FLmk4lSirwDqI9+tdZoMkkM6cb5njeUKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793569017; x=1794173817;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+s8DhqIO5ki4BPjT0hMEJ5bMlWwwKI5gQlDegeYWw4=;
        b=CwAVYI53n4UE95jwxjuWoat+kV+JknIMQkEPaXnd8C2xUACsJ/KVFYFfyE7PhMz58C
         ggjAJKancQcwImce449EuyJHs6I5KXzbyjmLXBOPJs5d6B1mwwmwR/8Ntng+jMSu3guq
         kOiSDUstNaKGTdc7afWFQH5eVgWqdtT8KlnzzQuX2xtkgyY8TmneHMp4JbYjBp//vCzR
         QNC/yPlPUEgKGSpFkh3i31nXgYqVvjTHMo8/jqWjbpm7O2bUIogEID3MeKl1I+sc3q6V
         Ph1dscIFxgkz3HRtQCG4S1iN2MhqQOSrOfReTHpUbG+79S2i2UPOmsIhj8vtbAHUuaom
         BgOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpJ5xiEsObHa/i3DAtvBCJvRvI6o3G5f/u24lP542AsE/EbW8b8Bagf6wY6K8OF5LgRWTjbfzEQ2o10pI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKl/411AwQZA2SPW+iwjILh7IgC9JgBUku4DdK0vWWQKqdfA8Kb
	KTsA2I7xeqMm1Cz50/TInhSvaGMF8a4RXE9QoZymp0r/AQ5TuA3xJ0ylAiInYUeDLzYa0LqPVn5
	O9AetZA==
X-Gm-Gg: AYBFou0iyqJFxqa84NvdRqOQAqSnjufFQRvPfw7em0J5s+tlh38EIhDyP563eGoob+i
	8gX4E7GoUhcTTprXfdoD4OzP36oy1Ijf6uY8/7zsi6VXNI53+K7FgRPuxoWojjHIxhg+KvW/uuN
	qO0aTXa9mlcDzfsmYT6KUiS9SldS101q3PgmJ08QhLJy2+zUq1iOGvXNFGWTIm6gS3hIy71m0XV
	0MStLzxYSTc0UYvT587sgF7fosrj9PyDJHQlbO3SBrTZml77PDRpB7bsgUP2uKeZxPMRfVqDdBT
	0RmW0VTQTPhYoAqpzRus2FbVSDu0UBafihjwzHjahLGz3tr9utcKKFQnV0NaPhbFEkCcLYIypCp
	aT0DVq0J/sJ1O059p1HdlC+tttykm1ylckFS49FTjKQC5UMbmNsxsB/DNzYmQhjj1rjsbki8MQw
	vG4vMoDfNEozeecOo1DB3Lu6NxUA84UPB6DdFmtZQs/RUFLbqSPxwbk0uP2+mbfJkMc2Ia4wbG4
	5oW099jNcdpb6+7hOHlXlXpnaTKGn5VkOi2OUZDiYTvaIRD/mJdxUw9G6sUS+I4UFwM+6pSPRww
	loWRCkwuJ161MnpbPT5BidOGhaVUIZ11sFo5WyrzXuLYf8ls78LJaDmnYC9sO55HtJodHSRC2Oz
	Ff45gC1IMhETj
X-Received: by 2002:a17:907:7253:b0:c46:7de7:e432 with SMTP id a640c23a62f3a-c4ca7ab116dmr687319466b.42.1793569016593;
        Sun, 01 Nov 2026 13:36:56 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabf43b19sm311303066b.87.2026.11.01.13.36.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 13:36:55 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso23230335e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 13:36:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByz3MDklXOzBAJak7LohFpjPS9qLMOIj7Kv/hBEAZEtNxBYz/sXp/zCDqB0vREOR6cD3XRgC21aBG+tCJI=@vger.kernel.org
X-Received: by 2002:a05:6000:41d9:b0:48e:646e:fb61 with SMTP id
 ffacd0b85a97d-48e6e305b9emr20425341f8f.34.1793569013833; Sun, 01 Nov 2026
 13:36:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
 <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com> <CAFLszTh8geCqamVZwO00fx6t8SDfVHCFP1Fx9PnA2x9TosDKqg@mail.gmail.com>
In-Reply-To: <CAFLszTh8geCqamVZwO00fx6t8SDfVHCFP1Fx9PnA2x9TosDKqg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 13:36:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WGtmBxQhc+ujm3qtVgftfKupqtp9sUpg_ubeQ=-_QG-A@mail.gmail.com>
X-Gm-Features: AclHuK83p4a2Vbxf-q7Oyea7vApFkqc_qnBlge2O9IlGicuQhVVmFjLkwyEXh7A
Message-ID: <CAD=FV=WGtmBxQhc+ujm3qtVgftfKupqtp9sUpg_ubeQ=-_QG-A@mail.gmail.com>
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

Hi,

On Sun, Nov 1, 2026 at 11:34=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi Doug,
>
> Doug Anderson <dianders@chromium.org> wrote:
>
> > Putting the metadata in the configuration's `description` property came
> > out of discussions with Michal Simek at LPC 2026 (where Xilinx/AMD
> > already uses configuration descriptions for similar board matching).
>
> Thanks for the background. The Xilinx case is a bit different, though:
> the same project writes the string (the binman .dts) and parses it
> (board.c), so it can change both sides together. Here the kernel would
> write the string and the Pixel bootloader and outside packaging tools
> would parse it. That makes it a cross-project ABI, and I'd rather that
> ABI were typed properties than an unwritten string format.

OK, fair enough.


> > The proposal I've tried to push a few times is that it's OK that
> > different loaders have different types of information available
> > to them, but people don't like that. They want a universal standard,
> > which nobody can come up with.
>
> I agree with you here. We don't need a universal set. I've sent a
> proposed spec change [1] which lets a configuration node hold one or
> more match sub-nodes. Each one names its scheme with a vendor-prefixed
> compatible string and carries the properties that scheme defines, for
> example:
>
>     conf-1 {
>         compatible =3D "google,lga-...";
>         ...
>         match-1 {
>             compatible =3D "google,board-id";
>             board-id =3D <...>;
>             board-rev =3D <...>;
>             soc-id =3D <...>;
>             soc-rev =3D <...>;
>         };
>     };
>
> Trogdor would use its own scheme (board name as a string, rev and SKU
> as u32),

Sure. For now I might just leave the "match-" out for Trogdor and
simply have the config file simply be a list of DTBs. Trogdor
currently boots OK with the "compatible" strings. Maybe Chen-Yu will
want to propose something for a newer Chromebook where he can take
full advantage of it. :-)


> and Michal's loader could do the same. Each loader still gets
> what it needs, the types are explicit, and nobody has to parse
> 'description'. Please can you take a look and comment there? If it
> works for you, you can point to it in v2.

That looks reasonable to me. Do I need to respond directly to the
github proposal, or is my response here OK?

Yeah, I can point to it in v2.


> > Should I give it a shot for v2?
>
> Yes please. The DTB list already reaches make_fit.py from the Makefile
> through the @file argument, so the new file only has to say which DTBs
> to include and what metadata each one gets.

FWIW, I still liked the idea of limiting the DTBs that were actually
compiled based on the list of DTBs included in the FIT image. My
current v2 draft still has that feature. It adds an argument to
make_fit.py where we can give it the "fitconfig" file and it can spit
out the list of dtbs. Then the kernel Makefiles use this to limit
things. If you don't like that idea, though, it wouldn't be the end of
the world to (slightly wastefully) compile a bunch of DTBs that we
don't need.


> We'll need a simple
> per-platform file next to the .dts files, passed with a new option
> through FIT_EXTRA_ARGS

At the moment my v2 draft doesn't just use the FIT_EXTRA_ARGS but uses
something like this (which will be documented).

FIT_CONFIG=3Dgoogle/lga.fitconfig

Hopefully that looks good.


> Running fdtfactor can then be another make_fit.py option, like --decompos=
e-dtbs
>
> [1] https://github.com/open-source-firmware/flat-image-tree/pull/66

I don't think it buys us anything to have make_fit call fdtfactor
directly, does it? The kernel build can just call it. That also makes
it easier for people to pass non-standard options into fdtfactor if
they want (via FDTFACTOR_ARGS)

-Doug
