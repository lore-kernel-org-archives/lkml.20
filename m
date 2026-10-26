Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793028664;
	b=c3iRvqqhttHeo0inRzE8pEqkcBk1bZu/n2faQdTTiT1OCiCXZruAvtFCI+vYGKByiFdk
	 JuFOpY286T2iZ8/A8/OI13pbES4ZHspqmYIYVRTKPEfAUXYW8JykebvoT/L9EBOhbYwX3
	 SiGrPOGLV0ohn+jTu+G7bc/K7wgscVcK6Wd5UoOLBkqWcvvg2B+0AtTRblprD2A+cULcH
	 PnsUNO42Rx9QbaYtPnwtP9rg3J27+hZDAysAp4o0O2pHJ6XbE9LPnJQZ+f2a3XXxjNcqi
	 iVVMP6gyzr+lDzBcoUqSlBIBcN2wDBBsuBzDOxlHLi2AbjbASJLkqva8SrohM+msigQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WlpJk4wOlecJG2BdnZcrsDYtn2tbGnBek7P0JWeRAJY=;
	b=ZSd1RlGr7069Ipb1myw1Gy5R1s5SCjPgCGXiPkEtFsIShx5GSFea+KD+xUuDMBcvO3x5
	 k5F8oK5FRrrQGGLkWk54ZlmSwiHd1RpfsY/ViGe1CXUhEoxFhKoygf9BPLWdXvKS+I4+K
	 Y9mVNNiUlIFOu9XpZFUaUMiv1iaJbd4f7mbazuwt4nvAPiNltW77YL8C3ZHP/ZHMNb6JC
	 9mrRqw184r0Rju54betHfHZSocmukJ3bVarP8f0Io47hjpjCtXuPx2pE7BzcJSXTReEU/
	 e8HYgLQq/+zOQM4gRR+XuI1Ss/hE8gQ9jBAGtWDWRk9k+wZ0sQUoYHQVF68gDcfowsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59E7606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E59E7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6acb9c018ffso9667a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793028659; cv=none;
        d=google.com; s=arc-20260327;
        b=hp5+CywIc9o8mQS/2gT8qHnsaAbBOT8gS4fE+BX1v7qooywA9MCTPyoaQIoCICgN9R
         Oj9FLzF0UDO3PJlzAc5pN/rnJFvU0XHh5ArT+YY1HBL3n8xfAcDUr5DHq59K4asXCogx
         3vqmyphxEM0zGd0CIy1AdnP7SAAOdXYbVBpgku8CuYpv1kKm1b6UGa719oy2LPCyd5/x
         8VS93urbtRxcg+lMl8nETWgZXl2cVnPZgLknofqEJ+WcxuXQemK/pDFUxInE5UvVlRXs
         7JKYtj3BLzme5RVbj0p5c4K1x4jKe9xzp/lbYelHFxzWvMOgmj/16BEfWRCO3r89t2S+
         3zaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=WlpJk4wOlecJG2BdnZcrsDYtn2tbGnBek7P0JWeRAJY=;
        fh=hge9NpjrKHqtglYQARZil+WmQ7BREGvG/U5UMiBQwIs=;
        b=XjrDh9vLAx/GX+yb4ysTLPOwXIoZ553DJIRtTnxzGMMF5AZD1kcBFvVNQBnqt2k249
         Hp2OXO0SA9ZPq4LfFOsPFvWkpUEVW+xcUxjlEzaUzIiEARVXFNLb8B85IzABn9bu7QcX
         XcosuKt6jMIWq8T13XGH/vmuB3c0fVNBzfeBlCmrgAdzJVCI+bhDa7jpjC7iA7iVgCHC
         0AMSoaSSU7s3MNCqxupoORMdU1vE13AqDZLV15PAxV7doV0pnHFR1T+keePpW4/PcwTm
         WGxgEKRjKWnzoVyQjg5m/xPa/PAvmQiWJIjPqjHl3/1KzA74CqfblDXEJ72CafNLtAsK
         B9YA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793028659; x=1793633459; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WlpJk4wOlecJG2BdnZcrsDYtn2tbGnBek7P0JWeRAJY=;
        b=HdF7GBSrfKecNkLQ3VZyh2wB08QbA6YzaL0rI9DhFQXUEdA59fAoZClie/v/gWKm5M
         xoRLUKnXTkGEoGAJYARmg2ltCKZsKeImSsj9EnNXc3uVH/63uaJV+zOfVVjhvA6cc9rg
         zm6mGTRCjUyrHA6c/EF93c+Tqj2ygjQdpVBVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028659; x=1793633459;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WlpJk4wOlecJG2BdnZcrsDYtn2tbGnBek7P0JWeRAJY=;
        b=2DsJ2+7d72upsHgI2IB7rAyq+8qP/i+dUqXPMXgGNJJIR3Yu+V/JJx9p0S0wsXwpBh
         oxI43aGAgVRiDesCbzAEw7S1qH30GLh9/ke5KXY4AXYXorSoVdWCWnIVCEd5re9x6YdX
         spfK+vSoV2YU4JaGTvFJwAd6bJQFSNKNUzB04hSMTz8XbG7coiS4D7E5zmoCcBoroQtc
         4+TIzvRlvrs0+X8sHOZwiyLOZywm+cs0GvJU3J0kwg/kQKXMjbjVgz10ei9snuokBxcY
         UC0MuVT7Z3ATwZVEyQbYNSKCXwrYWJKHEXqvwRQCcOd9SHyJo5SgYVBJ0b/RCzN6PLiV
         y9wQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsX8oYAc4sbQMJ66owkVZQ/YttTjseMv6Yorn9ZS12V+hMmt6qcgXd/4AZmpeeBILcitQDKRphl6IMt1Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXOP/spwbbnZu7Iqk5/FsSjAkT8ByjaZ6X0kzZ4emHR4WofZqZ
	b6Fx1/5lGRJEBKg2Slkk+Y+SsiNFdAJmbCDaswlHCsnux0Phhe5elY5vqV3J5jyrehiN3kixSBH
	87g4cRCjRx0UZ4b9/8bLOH24YQQSz2Mdkqh8pSLWr
X-Gm-Gg: AYBFou1OEd8q2Js7998bTX7UJ27qWSoPYcDTnOdHMzHZBcJ9PZSJDYLmTIDAtccb9Dg
	8rmGhsRfdVCYYK1RrIgjNaBOrnCXbJbfXFx5tOX52I4/XoOzY1e6RmAIjqQPgZCWBWLRzFbulbi
	JCWwmdtDOtTOa80Ks1x4OZtomaFVwNAKNoDyAQ9wqnwFb4gY6LRu37T9gAw502q6k0z7bZfXuhF
	rgIb3veejloGc+aeiSomCB3UvSFnrT/oU3w7LguQWcSGrRV8EgF/H3lcPrbsO81U1HJiy7dpkKP
	5S/BbW90wZUOFFri3D6SgJl+xHhr4PFNAtii66+0v+Wtm1Od+mB4NeUN93w8KCkFSrYjD8wMfAA
	l7P0EgUfRr3OhzRC1DLV3
X-Received: by 2002:a05:6402:c116:b0:6b1:d8d5:4500 with SMTP id
 4fb4d7f45d1cf-6b442ff1cc2mr5244408a12.19.1793028658987; Mon, 26 Oct 2026
 08:30:58 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 15:30:57 +0000
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 07:24:43 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261015182221.2931742-1-dianders@chromium.org>
References: <20261015182221.2931742-1-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 26 Oct 2026 15:30:57 +0000
X-Gm-Features: AclHuK8aG0D96i-cNQ-5K5VTR-Mm132KiROnF5-iDQubeTf8Ba_jJIWVxAlDylI
Message-ID: <CAFLszTjB-wcxTEKVNo-z0PctkhqavGEh+eiRyiPsMZBPkQbHtw@mail.gmail.com>
Subject: Re: [PATCH 0/4] fdtfactor: Introduce fdtfactor to auto-factor overlays
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, Devicetree@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-15T18:21:33, Douglas Anderson <dianders@chromium.org> wrote:

> The fdtfactor tool can either work directly on a set of compiled devicetree
> files or it can work on FIT (flattened image tree) file. The idea is that
> you'd create the FIT file containing all of the duplicated devicetree
> files and then fdtfactor would "optimize" them.

This is an excellent idea. I have been thinking about something like
this for some years but then when Chen-Yu Tsai wrote something which
used the kernel build (Linux 17c31aded9a1 scripts/make_fit: Support
decomposing DTBs) I forgot about it all. So thanks for taking it on!

Ths script's post-processing of a finished FIT only works for a narrow
set of images. Apart from signatures nodes (where I think it should
error), it also rejects FITs with external data[1], which mkimage -E
produces and binman[2] uses a lot. Of course, mkimage does support
making the data internal, so it's easy enough to work around, but also
likely easy enough to support in this tool once the initial version is
in.

As an aside, this would be a great feature to add to binman - trivial
once your script is applied.

> Add 3-board test cases covering default mode and `--strip-local-fixups`
> to the `fdtoverlay` test suite.

Please can you move the tests from all three patches out of
fdtoverlay_tests() into a separate fdtfactor test set? Then they can
be run on their own with run_tests.sh -t and skipped cleanly when
Python or lz4 is not available.

> 3. Better savings than just a simple partitioning, like between SoC and
>    boards.

It would be worth including numbers for a plain SoC/board split on
trogdor compared with fdtfactor. The whole set compressed with a
large-window compressor would also help (as David suggests). That
would show how much of the 87.5% comes from the factoring itself.

[1] https://fitspec.osfw.foundation/#external-data
[2] https://binman.readthedocs.io/en/latest/entries.html#entry-fit-flat-image-tree-fit

Regards,
Simon
