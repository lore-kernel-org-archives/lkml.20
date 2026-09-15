Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1E53BFE3C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477090; cv=none; b=sHZ4leEA0F0Ih0045SJwzraszkwLgHKrvhkrrWJeh4mV3Sm528ZtC2x0XY4fQWhS4wU7s3aqbr5cU/iVjUVhXc9Bx8RLrfLcmlZHJYgbD1S7201rzvMEFmzxj9tlOVo4jIFZd5rptD2Sw21drlefbqIGq64sUuX1Fi9MKc1ML9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477090; c=relaxed/simple;
	bh=BRxd8wSlB7E2SQMnKygjHENZYzxvB1TF13r/v+CPDeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lv2l6U57d75d5bbpP1Bws9ZuAAPzL2d4lKnLkN1YEqaVVX0tSNSgvEba2V3+aTjNWWyIRLLY1GNdkRAsMvVw/QJTAwVakKmk3u4+qXLIAKcoZ3jZbUDTpenK6M0fGOBkZKigh4hzy6Ee9TaMYqC3AfY09vPwd/hRJ1rErFCdOTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-982838c4cccso580264241.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789477088; x=1790081888;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IgE9SQeMzyYPYC75O9wUrB+kCn+Vwoe0FuhgCIRqcx4=;
        b=kjVreuS2IbMlk0Ey2fdqsl3s2EUQyJbhfvK4DlLOyNeBIJFEM1B4UD2H4kJ0/6egDM
         /VFPSqUn1Neh/tjnRBo0+uT8K9+iNgU7dzhFWkQA4bySOwDz2tG05mo6Ymw2uMHz/qlr
         4WtBidDk0LcwhklRf5tFEFgjOVCcwO3g/w65fbtA70muqPZRgzY+NpE33RU/QvAVQprP
         obwrvOeWZaeSZfSrBt7QF9BDYibFMoxRskePWXGzw6Ba1oXNosOK1fQpkrXTFZdknS2v
         MgSDVBTH2mRw3ERYe5wT97QCpOpzolm3BQUA7yrRhsoTun4zxwnCIxtvQGOcHjyxxG79
         K+kg==
X-Forwarded-Encrypted: i=1; AKwUvByG4UIzIc1pIl+NbAJuyz3/7Ri0tcYeoOk24Q5bUD0gIgzehZSq+0mH6VFuSV66OLXZ+YQepsBVKY3WVJ4=@vger.kernel.org
X-Gm-Message-State: AFuF++nD3c6tSqpIu9kjbJySIhMijRCDHdcsYBDFLV4Bt3ShnHp0TvT/
	3pcFeGbU53JKDci4Smx7i1ti2XqjBlutCbPqBAb8FcChqCRUJpOOsY09O3PdfSgq
X-Gm-Gg: AYBFou1rb7MhYWhFg+WQ038J7Wfs4c1/72RALp0T2eiuNMzZAc+tK7811+FIvc7dZ8/
	bUsfo2E42JnXLqpzD0szYoG1UysFRAB7HMn6y107Y1vdrjJiRm3S/IBpt15ZPHUT2e6OWsS1308
	rEm4ZjZJR+wZVLp9myc32uYhYo7GjY0CcQj+5+a8vKB3o78gGDPE/5UW5G78933ioAf6GEVwZBs
	rSOq/v501fE+jFK8KrTYnRlZLEO/U64HJCeiY7pcbsnvhlzBIJCL40eIzZmAwtiMmAmcqlmoRml
	I/gFilQYflNTGGk5zDNnCcKMh7HxzB7ycaRUFl7MDLdc/HClZ6q3DBzLHoDUfYoCC9sen6qGnm3
	p0xE+dbWZdW/kOJHZgh9QZbTyWkDpPEfqj/mbGTpF4om1wLDL4puXL8Mso7dZ8MHTS6BzWJ5y1C
	+kFykx5IUHyDRdWqF6WQeVLCdtp8hJLAeIW8e/clDZhO0/lwc/KU1KnD1urHk85/86yDoP2XGNn
	LQZxSXf9BUGdwbLv+wva2KL5uLJvFyX60LP
X-Received: by 2002:a05:6102:6b4c:b0:798:ce7a:c46b with SMTP id ada2fe7eead31-79d29ab3d41mr1374215137.20.1789477088125;
        Tue, 15 Sep 2026 05:58:08 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9830fec2d49sm400971241.2.2026.09.15.05.58.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 05:58:07 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97cc700fcf5so590732241.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:58:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzxv/yhnwZFa/dDA0Lw0aq6Jg7Qh3wKbLwdFjUlw23OPuKQAKfZOv5lRLhU5sqm444heg6Vnz/2MG9hsG4=@vger.kernel.org
X-Received: by 2002:a67:fd97:0:b0:744:d517:b0b0 with SMTP id
 ada2fe7eead31-79d2757b2e3mr1341211137.10.1789477086677; Tue, 15 Sep 2026
 05:58:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787978627.git.kmehltretter@gmail.com> <e9659617ce2f1466f227d562f47b961f340ab3c7.1787978627.git.kmehltretter@gmail.com>
In-Reply-To: <e9659617ce2f1466f227d562f47b961f340ab3c7.1787978627.git.kmehltretter@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Sep 2026 14:57:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcZ5cV4-HrjLYfFKh6UshiVxq5eXCNyp0Z1k_SMAvF5g@mail.gmail.com>
X-Gm-Features: AcwNN1We6JvHroelTMDgiuev4qCnhIIlzUn7-aK8UKQI_PPoPrsqy0x60B6d-t0
Message-ID: <CAMuHMdVcZ5cV4-HrjLYfFKh6UshiVxq5eXCNyp0Z1k_SMAvF5g@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] lib/842: add KUnit tests for the decompressor
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Haren Myneni <haren@us.ibm.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Dan Streetman <ddstreet@ieee.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Karl,

On Sun, 30 Aug 2026 at 05:05, Karl Mehltretter <kmehltretter@gmail.com> wrote:
> Add table-driven tests for the 842 decompressor's output and history
> validation.
>
> Three malformed streams cover an indexed copy larger than the remaining
> output, short data larger than the remaining output, and a repeat after
> fewer than eight output bytes. Every case checks the return value, output
> length and fixed guard bands on both sides of the output. Successful cases
> also check complete contents from a poison-filled destination. The repeat
> vector's CRC includes the leading guard byte, so the unfixed decoder
> successfully validates the CRC after reading before the buffer.
>
> Three valid streams cover the same boundaries at equality: an I8 index
> consuming the final eight bytes, five short-data bytes consuming the final
> five, and a repeat with exactly one block of history.
>
> On an unmodified baseline the malformed cases fail and the boundary cases
> pass; with the preceding fixes all six pass.
>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks for your patch, which is now commit cca072cb1423191c
("lib/842: add KUnit tests for the decompressor") in crypto/master

> ---
> Review notes:
>
>   - CONFIG_842_DECOMPRESS_KUNIT_TEST=m selects 842_DECOMPRESS=m.
>   - A fixed x86_64 CONFIG_PROVE_LOCKING=y run passes all six cases without
>     a lockdep report.

> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2225,6 +2225,21 @@ menuconfig RUNTIME_TESTING_MENU
>
>  if RUNTIME_TESTING_MENU
>
> +config 842_DECOMPRESS_KUNIT_TEST
> +       tristate "KUnit tests for the 842 decompressor" if !KUNIT_ALL_TESTS
> +       depends on KUNIT
> +       select 842_DECOMPRESS

Enabling a (modular) test should not silently enable additional kernel
functionality, as that may increase the attack vector for a product.

> +       default KUNIT_ALL_TESTS
> +       help
> +         Enable stream-validation and boundary tests for the software 842
> +         decompressor. The tests exercise indexed copies, short data and
> +         repeat operations at valid and invalid output or history boundaries.
> +
> +         For more information on KUnit and unit tests in general, refer to
> +         Documentation/dev-tools/kunit/.
> +
> +         If unsure, say N.
> +
>  config TEST_DHRY
>         tristate "Dhrystone benchmark test"
>         help

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
