Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793561696;
	b=mihAXjIrlb1itKiwF4waWs+ceWPPaFAzMAZgm3aYdx+FjhLEYGGCQlQ/Vb8Qw7iro0io
	 u9zNeSW2bWqK5oeDfD/6wbCe69XPUpe1/oDGBPJYhJLWSGaPmGKmrwyREbBm2QzVuDoh3
	 u+8y7eB4L+LOxIX6dvTwyYe1/jCXnlb7FD0GXyH0KB4yOZe+U6GLl3mNYjIBGuD1mXrl6
	 pZMALPdRzpP2C6vAFYi8iezz3aeGUzIjMuQWW8xaLquyi6V5X3u21AZ3bODDlI7ciIXTW
	 RlBW+89KN8omX91ECmbkbbaMMHiFx7/ISFL+CEzsPV10pbjjlGZgoSZzhTQbuSzxAag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:from:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
	b=uwFeI43aspoBke31p4VNMrHM3Py61P/tccxSwXhtcocketZcJfQZfpWmlu1TKD1qPEwt
	 bKHQugs6PvqDMhLtHgUZht5wpSkDwY7fym0+rg1Qt+r+2u2Nmc4xtHrNdHfCpXOYYBRqE
	 sFwu0X26h0BU7odN9JISv/iHUi1m4VeWk8i6kK15hspeSaWZCcCmbJ1VLlmHbKolQTNoW
	 Tnq1q73Hnah/P6UJPbrw03JyDeHAHKL7lWue2sl9DBhPgwVH20UNDWx54hhVp2Um3QHYM
	 RJBe2qVuHxWu/2MurvRivgYfByEwC8FI/ee62CzxFFDUE4peJKcatH+gMCaRt5Py5XQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Lfqcc5GG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F0B606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 19:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8F0B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Lfqcc5GG
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b4a13789b0so3192931a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 11:34:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793561694; cv=none;
        d=google.com; s=arc-20260327;
        b=Hd9ulfsjRgq1dYMqsQXlFsQEpWsfmnWRVIX2Y6sYgEEEK3nQyHjU0+5Qvfg9GPJjlZ
         mlNsdxjeOM1BzZJciDacApNuVcBUE1dHl+jbSTtd0A9Y7ZEgPgxPfVrFDDs7pekQZdpB
         f4VEYT/LXzox9yit/Yuc69FvcMUmERr85/V28HB/soEFEHwN4w8QTW+ZTjXBtvbGoVl4
         Za8r5Cc3IUq/JUeAr3LyOn/5P0rYzmcm7BQLItwnP0uwnzVKamcWxqDWWkORxPXGXlva
         GIDf50FvhhyW2BnEjjxbz0JcSkqFRDYAVsj3MxLE6QReAtsdfWSiVi9Cg+xERcUPm1MN
         lg9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
        fh=YQWzNR6QRNugeOpuDI/znfnkVPxIT5eVvhviwSAIniw=;
        b=LUH4bafjw3/lLAFkZA9zZz+ERZ5uBUFaBDLC67eOj2FvvmxhdRLZTuZIULkSiuSv+e
         7ZgwvQIalEjcbn1RywCXd6r3FEetSxlF+P4vPnZQnL6ng/DVbpfSGrG14nrdG29OWdMl
         bUnVqJRxA2Wi60YibzklFmpGo5iBd31bg5UcHFoK1ekDjObURGy1iAWPuQoEWaKWnzh/
         K/3XwsjBoabnwYdJ0nsNlj3/tT2EPKvwDy978lPxjZeaGA5vETmR5zUzXEntErLjAYoT
         gjTUSqtGs/j43Dmceh4WYJONUTELy8MdNrGMBzW9xiMnz1NgRDhPJkZszWXRG90Q/ZAo
         Vjew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793561694; x=1794166494; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
        b=Lfqcc5GG/SwjR7rhF6i9wN+51zewpGS58ukrmB9LGRdbbpKdip3M+YroJNl6U5AaZ4
         rF//L/DV6VSxmy/1UQsFeJhmoDWwkPFReDLBiC+oRpU55av1FrMnZVBw20fY7l4UynL3
         HVfRKiNvpd9FUkbDQyR76hW+g1Owj32N3MUEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561694; x=1794166494;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
        b=IgutjEYbL0X0Z1Jz20CfH1TVYbOLG/RqJNSFTWgtxuZ/f6McHK2mv+QwaxOalfL7zR
         HaUrYS0/9h0q1NoKwLFuuHP4WATknVBn+kEIneUQTYjRBzLwobgkmYJKC5hVIOq/bCoc
         wfrSaKnU9DpXzQ30cOR1WvZlklStYt8p4QvM3rJkGK7o4LIMaasz9y97bLJfmIkOK0Ki
         daFc0PEb9SqGs4D1GIjU6nCLsgXSdMytn2iIMasoaDMlvchCYICgLMr94Zh4gyUidOAG
         waNh/alTXJpq8kR5b0jAk7SjwMgnBaJjTy8a/bp3W1dorPeFzh0Y2w+wrnOhA6GJ+iGy
         SAnA==
X-Forwarded-Encrypted: i=1; AKwUvBw6Ip6LnD4K6eLQVkjFMWie3QQtRZZYlbDSwTrvDN4cIZXLwKOBrGVzSa5ep2mfyJktSFkoTasRoz8rSnY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NKhQ1nRm9wuraTBzuFfHAUauZBC/NNJnw5AavsC/TFFxl8X36
	IKGicoIgCnqN+TmSfe43bUMIokFENtX/99b4crGx9InCNtaeMkbXy6XM9ABE/hIpl330e4NtEr5
	K+4MeQMTtLcvPtta0b0iBgtvIMefVk1eLa9cEIlB/
X-Gm-Gg: AYBFou3RsFPgV6B7y6NNi+0Kkt6Doin6mhvI2ZVUKxJp8hB8nPwoy7tlu9141JkVkBL
	WtOC0a5Z++PnsMUwKKrmkKGh5X0Fk9z/kPyx0aYlWCugZMKU1/Hl3Y/58YIHDI0PiocDEdaYFI7
	mFzNkWDZGbmR6+oNxZ3o4Uzi3Kr/r3TM8KKtttz/iwfap9hGmuX4/nGIK8vlP9WB6ZP0N9qKxXW
	gTnUcqHLvch7ds+8eBFQEu1RhlUbZovtQ1Y+ODZ7dNPoD57wIDB1RSKP07Y5h5u+sX4kJYb0/Ep
	ALL0wTlH/8lLQvme9+PlxT0PIgV8ZQVga5KpbcZ/jqmyI/aD8cYy5kL+cSyfBKfX0RGPFop0sEJ
	YyHN/V7uooq51BPtCB8D93lX79fZ7Ow+GAsRQCxWnJIBy84jpbVu+Ngt07/e7x1w9xEnOdV95
X-Received: by 2002:aa7:da45:0:b0:6b3:e89b:128f with SMTP id
 4fb4d7f45d1cf-6b4d4d6d938mr4052419a12.9.1793561694122; Sun, 01 Nov 2026
 11:34:54 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 11:34:51 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 11:34:38 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
from: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
References: <20261020153652.2907186-1-dianders@chromium.org>
 <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com> <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
Date: Sun, 1 Nov 2026 11:34:51 -0800
X-Gm-Features: AclHuK-OENc2MfogrHTK6nr_VXdYPKQaHTgRVjZY6Us3vAfjaHxM1Qejmm0CbCs
Message-ID: <CAFLszTh8geCqamVZwO00fx6t8SDfVHCFP1Fx9PnA2x9TosDKqg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
To: Doug Anderson <dianders@chromium.org>
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

Hi Doug,

Doug Anderson <dianders@chromium.org> wrote:

> Putting the metadata in the configuration's `description` property came
> out of discussions with Michal Simek at LPC 2026 (where Xilinx/AMD
> already uses configuration descriptions for similar board matching).

Thanks for the background. The Xilinx case is a bit different, though:
the same project writes the string (the binman .dts) and parses it
(board.c), so it can change both sides together. Here the kernel would
write the string and the Pixel bootloader and outside packaging tools
would parse it. That makes it a cross-project ABI, and I'd rather that
ABI were typed properties than an unwritten string format.

> The proposal I've tried to push a few times is that it's OK that
> different loaders have different types of information available
> to them, but people don't like that. They want a universal standard,
> which nobody can come up with.

I agree with you here. We don't need a universal set. I've sent a
proposed spec change [1] which lets a configuration node hold one or
more match sub-nodes. Each one names its scheme with a vendor-prefixed
compatible string and carries the properties that scheme defines, for
example:

    conf-1 {
        compatible = "google,lga-...";
        ...
        match-1 {
            compatible = "google,board-id";
            board-id = <...>;
            board-rev = <...>;
            soc-id = <...>;
            soc-rev = <...>;
        };
    };

Trogdor would use its own scheme (board name as a string, rev and SKU
as u32), and Michal's loader could do the same. Each loader still gets
what it needs, the types are explicit, and nobody has to parse
'description'. Please can you take a look and comment there? If it
works for you, you can point to it in v2.

> Should I give it a shot for v2?

Yes please. The DTB list already reaches make_fit.py from the Makefile
through the @file argument, so the new file only has to say which DTBs
to include and what metadata each one gets. We'll need a simple
per-platform file next to the .dts files, passed with a new option
through FIT_EXTRA_ARGS

Running fdtfactor can then be another make_fit.py option, like --decompose-dtbs

[1] https://github.com/open-source-firmware/flat-image-tree/pull/66

Regards,
Simon
