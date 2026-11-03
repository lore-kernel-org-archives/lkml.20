Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680535;
	b=SIxsgvWhdpjvtTzj6LM5i0gTZK9EBHrfJ1aUOVALFwE1U1F7M+TWOF5eW4O/hGyKotV4
	 nC8HpSuqxeF/D3kBrzqtfrWJ2ZleiEcNN91xqrqNr5WLmNxBTkb2CzDnIXQ/frFKKy0Dr
	 kbgCGzgbrkR8HTyKHEjX0pwdXmem3wd6Sc0XrfgfB7yyITlzQ4cqMoo/eWrWRztUzPdWp
	 u5NnFeCCKrCg8w8bgZBuySvENVQp8Aa3jshUic6zxwV3/PdAg6uSb8IpIiT1xQV7UJFKG
	 tNTygZbEEtrbNGIfrr4l2k2YlYwf+sFnloDNz6BzXF/Dlne1R5BR4ImjbObQwhlA5YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Cc:Subject:From:To:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=+haBGwyiWfU5fK0i8XKvoQcOJxAPZRgUZLulxjt6MCY=;
	b=AtLQsg9l/b/4tXdkhnJvk8WRtdfKSvKmQ8UcFDplDODlHp2ArAcoHTrrPkFJAxT5CG1+
	 kgus0aqoAUwkPAXCL0i6w0w4FJVujHW6aJQEVzyrvsX9T0nTjjXxgpb6VaygIr/4psbOS
	 IUuZ99c5QhfdCQrFU9fnkpbG5oWGXz26ZuUWnVMEHNrpo1rVK1n84dPWH28j/vKb8SICz
	 J0cKlx0+VH51dwZYS4loeoeh4n7CpeQ7oWbxgX0phDdcvSOoTKivWCWOHK80g9+26qoPG
	 oERVL7Od+IhYGqFAhheW4l/6EZII19z/fmT3llfw/mzHOtsE8vyDavFTXB/zg+mCFpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EUYCg2Xx;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BC7606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49BC7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EUYCg2Xx
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso1992876a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793680533; x=1794285333; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+haBGwyiWfU5fK0i8XKvoQcOJxAPZRgUZLulxjt6MCY=;
        b=EUYCg2Xxy1ACTZiwCq3hVMXK3t3no7wXjeF5y600TxKzaCOeyHe6TFA5VKnm1dGTv2
         RE09ZssXDv+aqW8biwBm1hwinP4uyCGsLICDt1Efl2hfEtiwEii8MmclL+9IpyOImz5b
         AwsxivXu5eWr3qyWNguj0S/WDcxvchQjfL/5nbHeIwn0ANAI957Ix7HyaRhauy1e+nlt
         JZH1L9XFVf9cRYx/gktVcXG8Yq1l/GDsUgyTUrH/Icd63ncCCO1oSNbNwVtDd9f91PnM
         MH3IuDh7PRkflveanVTkY2w+S8d4zVeML2V/yT4mJJegWfn0NkQlAb9eSAICdfuZtP6q
         iBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680533; x=1794285333;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+haBGwyiWfU5fK0i8XKvoQcOJxAPZRgUZLulxjt6MCY=;
        b=Kp/d49GEfD80XUsise9KcZEu4HUcvyMaitEsOyYEr2OxSApRB5sHt1C8QFBgGv/zUn
         ew/dElCM6+v/Ua5ubUpxnqnYMZVrkwmRxpoCw1MM+CLQcyGwB0CIddc6cuvDRWYL//ts
         Z0RXl6T6EO0OJf0UZbGLzP0KkYM/OW9F3RswTx4AYvkvDt8a3fgbcugRSg73jp9H5hFS
         nRlN+IuIsN3cEhXu/JoBjMeLxkyXzGPX6qH3C2JONpAG8gqRgSVpfo/asT+0/Pas3z3O
         py8OiQenY4sVppa9mmslxbYZNM5rS3bI6spKdfRgthBrXlhoQtdkhpBPUJBGzuoc5wwh
         dvEg==
X-Gm-Message-State: APuU4Z/Q8WkFuTEDr+H9nnmEzn60dkKlaQK4hFZlI8vKWBYihM+D+Rjk
	2W6w2FXHnrIwawIVNvPx24x2DPlJLTlA40gj5+wiuis2B+Rwj7y9yjw0
X-Gm-Gg: AYBFou1rLN1P5Go1wAYXIZbAHydezmsMEHJPILIZrX2RefCWSfP1MwU+FMDp1ERYWRB
	ot2ZHozy/Yh7g3h8ggNtFS58USPK2tBmDnlCP7+Kc0VJGwW98nyb6cP8HaFqsXco19i+YiCDr+N
	oSRXG9qRQNfV06v7ansxbLtRh4vHtfcYHxjULQX5+Y4ay7wbvTFG0cFUjMqIfOBE0m9Ure+JXN/
	ZiBDL5Fv7GhbHV9FZRkFjADq/g0szwfwrz1zM2vrYF7iTOuZ3q4ADXNSjYEuUj7FoI5nrn26NHx
	dNuOCQFGKx4b6s9K4yIIegr36cQwxBOy/wOtC+ZIRPAqCmQ2JsA6qcanOXKIRXduDRTn6VZxTHW
	oO0eC1Ky8PHlGsFUGl/oEoaIOSduIgDa3LDcI5PJCWEu5T+yvprl75SfOliEINVbOhwtwzCidQN
	Wn/IiG1HnEMKZu0Spix1c6EwszU5bX6Ze2BTq+LXVXcpYD4NFDjFv5mkwDXNVtwZnSOGkgcdJv9
	U6yM8Vo3KUnUknPHWBueZ3PKx7H5/NEYcNBBjVyQZrDQcP16BVsqheTa/wwth3F5j6TfnugaNsN
	eLBW96TYH9mXpJOE9XsDPGdAVT/FDjS9L4fKiyg18fOsFFdWyRvqEw2gxaGIkcJxoTd1nXzrGLw
	Jf0ZU1yQDp9DGALwks8d4vK+n9AOjejx2QlY=
X-Received: by 2002:a17:90b:4f87:b0:3ac:af8d:c839 with SMTP id 98e67ed59e1d1-3ae897f6e6dmr9433576a91.35.1793680533365;
        Mon, 02 Nov 2026 20:35:33 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85cb91e5sm9616698a91.0.2026.11.02.20.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 20:35:32 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Nov 2026 04:35:32 +0000
Message-Id: <DMLAOL0238CH.43SXF0SFHONW@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <llvm@lists.linux.dev>
Subject: Re: [PATCH bpf-next v4 2/2] bpftool: Make the LLVM disassembler an
 optional runtime dependency
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <socketpair@gmail.com>, "Quentin Monnet" <qmo@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, "Bill
 Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Nick Desaulniers" <ndesaulniers@google.com>
In-Reply-To: <20261102-bpftool-plugin-v4-2-5a853e973db9@gmail.com>
References: <20261102-bpftool-plugin-v4-0-5a853e973db9@gmail.com> <20261102-bpftool-plugin-v4-2-5a853e973db9@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Nov 02, 2026 at 04:44 AM Mark Korenberg via B4 Relay <devnull+socketpair.gmail.com@kernel.org> wrote:
> +  else ifeq ($(words $(LIBLLVM_SO)),1)
> +    # Don't link with libLLVM.so. "prog dump jited" loads it with dlopen().
> +    CFLAGS += -DLIBLLVM_SO='"$(notdir $(realpath $(LIBLLVM_SO)))"'

sashiko is right. realpath was my suggestion, sorry.
Today DT_NEEDED of bpftool has the soname of libLLVM.so.
Every distro makes that name visible to ld.so.
The name of the file behind it is up to the distro.
The two are the same on Fedora 44, where you tested.
Where they differ dlopen() fails and "prog dump jited" doesn't work at all.
Pls use the soname. Something like this (not tested):

    LIBLLVM_SONAME := $(shell $(READELF) -d $(LIBLLVM_SO) | \
                        sed -n 's/.*(SONAME).*\[\(.*\)\].*/\1/p')
    CFLAGS += -DLIBLLVM_SO='"$(LIBLLVM_SONAME)"'

[...]

> +	lib = dlopen(LIBLLVM_SO, RTLD_NOW);
> +	if (!lib) {
> +		p_err("failed to load %s: %s", LIBLLVM_SO,
> +		      dlerror() ?: "unknown error");
> +		return -1;
> +	}

"bpftool prog dump jited id N file F" fails here too when libLLVM.so is
not installed. It doesn't need a disassembler.
prog_dump() only writes the image to F.
But do_dump() calls disasm_init() before it parses "file".
Call disasm_init() after the arguments are parsed, and only without "file" ?
It can be a separate patch.

Also common_options.rst still says "linking against LLVM".

pw-bot: cr
