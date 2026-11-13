Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794547404;
	b=LaKF3lcTXYGfbBTXUCvUMqdw0cM73o/+3QDO03CMzwEBrVRjWYmMn7JvBbe4Fvkylfw/
	 r518oAWyZn/DEopBVwlChARMiFeGy5i+q0AGWINCXWXUPypQsT/bNkHd/dHcxsu5dbZog
	 kjb+qUf7DKWRVtxgK3uSQgiDatvLHfUzT38oFduNYjbuHilX4dfTOC2gkdGLGMTk2RaDD
	 I8Y+J/7ssSfo0lu4Tv02d+Qfs1SjlasoV9107QZ3mOpwRcL93YPJ7CHrF3vDKlNE6vzLb
	 TGvfkNuxvhZgxDhoW5e5UcKVN2kd2eEjVL+Dgsg36D2LCcexmdzXvFShJFpE1XQDxyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hu9Bl2aKV+qWTG9SKgrVwWdxUFqgIaURnoD0XjS0m3E=;
	b=2z++ld/S9Tig07PE6hG2LYaV3DqQJUDpVsxxVBCxRXFkPBYejLJatLbS75on19cricMw
	 Qyx+inShstHWO8pF0DSwRC/sgLAyGoRR2qquT9ip9AXPceau56zuLctMDs9nx0Ffr+ozI
	 dcN0cVnxyvql8AaaMIoN72hhXxbW/BR/wtNryrWQcvJ2jotRuPsPTEwus5S5deUwybhHP
	 uWorCY+CFWMyepSXMs2zXNnGgeD44UjwdGFoccEBgq/HjMpJ04/9vP005dMpTj875Pkx1
	 S7Tp0e6Pq0hVt0Z8XJymEgcH5fjBonJC+vYXBfvVRPnpWvGor9U6YYCI2SaLRDhw8NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JP0Y09cm;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5260E606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5260E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JP0Y09cm
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c50715c2757so81622066b.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794547403; x=1795152203; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hu9Bl2aKV+qWTG9SKgrVwWdxUFqgIaURnoD0XjS0m3E=;
        b=JP0Y09cmzGGumOnAWR9fSacxwYhTHvKhAfi/RDRvGMGhAixSt4o3we2jY/gqMPb81W
         nDZKHaiqlhGv/m2wCQC6nWYD+VO1VockPQF7YvFqr6rnEBrdA4U5s243fJw6KwxeUh2S
         pR9Qp8YqtYRs6X5abTCUUK8cGSbm7JM8gpyuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794547403; x=1795152203;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hu9Bl2aKV+qWTG9SKgrVwWdxUFqgIaURnoD0XjS0m3E=;
        b=h570PmW0SKk1KHhfO8YYKJ5msDv+A7xOrnEe7785rPcfbBSyNm329FadMGTPAkzvGn
         EOYUUKEJghqngAcHp9P8LUL1MiqBwMUmdRJ1+1hcoaaBZkN6WqorqjnyUHjYdtXyA+yJ
         5gBvE+TjhU8PvOepspCY7sbGOgcRP/a4oCD9yQjeDc6bH8satISGRu9mFMXPMLr8OgVk
         gk69WuYr4aOiPXx6CzJnWWrazDx3Hmtqw92btnCjffCCGauclxt1v9VoJM9RT6Q8a5Fy
         athToIVOaSmoaWyfpj6qVqbN7v3XPujaY8hn/JiupmIxFeureKKkhTP6/+11R0eL2Jy/
         J5Ig==
X-Forwarded-Encrypted: i=1; AL+hErH++1gNch7pP9VPARFWauQ4RxNeNL51zT4rhdS+yHYOjlTwx0wtA9inJxfJpBQOL5wdh0cZTxt1al2y+HI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pn3fEklR/8q3vxkM3HXn3qQh42r3z1U8T3E1/NRMxmSu41Yg2
	mHLuQQMArFfw1Hy7QH+jVNNAFbaSwf0aBLG9ADyGcHPkTlqBVW3DpibGM0okbNmSg6j16ZbsgND
	lAmAhPFo+
X-Gm-Gg: AYBFou3s//o2mCXHtjYt2uiUs3gocNj90yb0xHu4zplkKXN5HT+N1HbCKBYemwKEAlf
	n935eNphIqkaYZpHDALbCepLOLNxCwG73WZ8lyliNAbPafRoG5Fja2W4jmDLQSJA9U3bve5lJg8
	ymlFEOr3Zk5sbO9KMZu5ulf14u9R4oxDb/dXrC52kiCEIvYkkIRzci8juJQPY/WJAL0Of2HxrJe
	6A782zjG3a3kBh+mcGqoSIrZEttb8Xzd6jGXn3yGGRq3Pg7HU5xUTz8kBkep5MChHdRdZODJqUv
	OR00ogRNYb11P292LGFdUkUUF2EzKb0Hlq+CYvUj31MPJSzzsdrasCidqC/N6YUEirvANcELboC
	egRiDFSWCFSZHr5k99/Funxt0Zcw+szaW3ogayLynyUw3WLPsfhUAw7RkmtYyZJ02T/yEqz9WP/
	Qbz5tSNrZ0FPmxhPzEOLjZbLOg22krxIk9Cu/yuZvub44MjCFL4Ih8/acMk9vzn0hLLjPAExUav
	JE1Oxkjvek8l1FdZQcjfX3UFD+TgaykJjxyRlsp1P5kNp2evLQ1zSJoEpXkXem8q+C2lti8YOSe
	s+8YJRAJ3/r+XNBcm/1/XtUK3tfQq+JxwiFeBn6r2wTk22W9Atf3pSZ6nIxtJEtkJnJe
X-Received: by 2002:a17:907:72cb:b0:c41:b94c:4538 with SMTP id a640c23a62f3a-c509640727cmr92011866b.47.1794547402674;
        Thu, 12 Nov 2026 21:23:22 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c213sm50923666b.7.2026.11.12.21.23.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 21:23:21 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so699697f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:23:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEXBR6/7Q49ekwUFRBDoeVKFgZIJ2+y/wuTdcEGn7kbanGGvFh5EC4nO2Fkl7INKMDthkzw1JMzedQOjvA=@vger.kernel.org
X-Received: by 2002:a05:6000:4688:b0:488:7d08:edbc with SMTP id
 ffacd0b85a97d-49c714a2a99mr2054397f8f.24.1794547398778; Thu, 12 Nov 2026
 21:23:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-15-dianders@chromium.org> <avUgDyB9p0_OSxal@gractus.seuss>
In-Reply-To: <avUgDyB9p0_OSxal@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Nov 2026 21:23:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XdPm0zQJe3rbeKMDnBia4qzuetxn4T2CMeh1+7tLOt+A@mail.gmail.com>
X-Gm-Features: AclHuK9aXeqWfCXMZOPBMpM60f8-snYNUMCFOIZWOgLzWEySRUCP9VJFMXuuRXk
Message-ID: <CAD=FV=XdPm0zQJe3rbeKMDnBia4qzuetxn4T2CMeh1+7tLOt+A@mail.gmail.com>
Subject: Re: [PATCH v3 14/15] fdtfactor: Support compressed DTB inputs and outputs
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Wed, Nov 11, 2026 at 6:10 PM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Sun, Nov 01, 2026 at 02:01:21PM -0800, Douglas Anderson wrote:
> > Extend `fdtfactor` to detect compressed input blobs by magic bytes or
> > file extension, transparently decompress them before factoring, and
> > compress the resulting `.dtbo` and `base.dtb` outputs when appropriate:
> ...
> Hmm.  Whenever I see a pretty complex chunk of code dedicated to
> auto-detecting and guessing the right thing to do, I worry about it
> doing something weird with an unexpected group of inputs.
>
> How much usability would you really lose, if you required that the
> compression method be explicitly supplied (I'd envisage a single
> option which controls both input and output sides)?

Very little in practice -- build pipelines factoring standalone `.dtb`
files already know which compression format they're using, and requiring
an explicit option catches mixed or unexpected inputs instead of
guessing.

In my draft v4 I've replaced the magic-byte/extension auto-detection and
`--base-compression` with a single `-C` / `--compression` option
(`none`, `lz4`, `lz4_legacy`, `lzma`, `xz`, `gzip`; default `none`)
controlling both input decompression and output compression for the base
DTB and `.dtbo` files (with `--output-base-dtb` defaulting to
`base.dtb.<ext>`). (In `-F` / `--fit` mode, each `/images/fdt-*` node
already explicitly declares its compression via its FIT `compression`
property.) That also lets us drop `detect_compression()`,
`split_dtb_filename()`, and the mixed-compression stats logic.


> > -* `-s`, `--stats`: Print size savings summary.
> > +* `-s`, `--stats`: Print uncompressed and compressed size savings.
>
> I don't think this hunk really adds anything useful.

Dropped in my draft v4.


> >      parser.add_argument(
> >          '-s', '--stats',
> >          action='store_true',
> > -        help='Print size statistics summary',
> > +        help='Print size statistics and compression summary',
>
> To, compression fits already in "size statistics".

Dropped in my draft v4.


> > +    # Compressed (.dtb.gz / .dtb.xz / .dtb.lzma / .dtb.lz4) modes
> > +    for comp_spec in "gz:gzip -9 -k -f:gzip -d -f" \
> > +     "xz:xz -k -f:xz -d -f" \
> > +     "lzma:xz --format=lzma -k -f:xz -d -f" \
> > +     "lz4:lz4 -12 -q -f -m:lz4 -d -q -f --rm" \
> > +     "lz4:lz4 -l -12 -q -f -m:lz4 -d -q -f --rm"; do
> > + ext="${comp_spec%%:*}"
>
> Because we use 4-character indent depth, we should consistently use
> spaces to indent in run_tests.sh, not mix tabs and spaces.  Mixing
> them here has the side effect of making these lines not look indented
> from the for statement in patch format.

Fixed across all patches touching `tests/run_tests.sh` in my draft v4.

-Doug
