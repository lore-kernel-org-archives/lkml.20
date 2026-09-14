Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21243F1ADC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371501; cv=none; b=h/rJJXorH+Qmo/lDS6ZYuT1AWOHFrD2UMqO4pq+zQensPKXMYIidOSgCQy47TfaWl8V33CQBPykn/qWKRre5KlDmpJyQDsSYmsA6CHARBtBZoYXjaygBGlxzdbdnrwkhjSlE4PK5mkFGZp26RPrnK7kK5E8qMCPMQmtyCpMNK84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371501; c=relaxed/simple;
	bh=am3YRQdfDAT3nmaBqC7y5nue7c7B51qzUVM5Eheco6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZqRCBsRcpvarHxxbjEOdmIzEgCG6sxGuP4ODtQ/zX3hSoCZQv/uZg2qZ9YU0Lw5BEwiFXMYq2ffR1GjOE/xn4b3LwIfspr7Y+23283tdQ+9K86Wmq9RsKsj8/1x1TRUzLgCkesVgE2zLInao3+hXx0H9NkzRFc7mUP8I9OpWs8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9828b5b20eeso1849582241.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371498; x=1789976298;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ig0KNWBSwSP4iz1PoFYIig3Kn8oJ6i+WfrIPn0M81M0=;
        b=llpQLaexU+7j9ObHs6D8RYLuLm7GIP84PZlDnS2NjhDYSnv7g4Gq4rOJmgxu59cKPD
         DloFEs50ZSWOvEAsfoOUSIy6hmCAWrN58mM5T+Ewny82fu81ZU9/0U5gy5MyyYitc6Ma
         Im7i//GBEU238cq4LHYdYXPTtpa480gTJYD6RmVXmzNkriNqgb2Hi0j4N9aI7eld653U
         xVHvYnEvwfcXw2YQxhWmiKTUTqi2otk62eEkhcKJJYHG//eC6yUIyMNaTnlzuDeZtr1R
         mnMF4Pg5JKgYCXf4t9MZ8Q3+FksCLqEGKWbYoRSU10WxLXl6MEusobQOwmzBrvIH/U1e
         UIRg==
X-Forwarded-Encrypted: i=1; AKwUvBzjAZj3dNAxLxPH7HCsVVz0GSlCp8+FEQUIkrATl9iuiHpb9sg/9KjQpV0pamiACVq8UCDZobDUtynsl8A=@vger.kernel.org
X-Gm-Message-State: AFuF++k6MtfjL8E7FcOwTvWGVO5d/c6GTndp90V4Ms6K03RdIlN50+ud
	5g/OHZE3q/QGIfzVjgRsXilJbxz/VdXB85PrhMEhKsdes/8dtFtbEKraJ2WAGFeD
X-Gm-Gg: AYBFou07QcXlSMgrvL3S7EUKeQ8GftEB8JJN2qXIjBGkfW40VnTe1b/pgfaiPyH+9it
	6u2CDaWZUn1wjLvnvicF+Rn8vWtRGFUNs7h8ZB7rRX4cSPasFJ2qw8vsEXD5IpjJ2EoMtSxk2PH
	nUId2HLntt2WOFAze4etqgKUsE8JCXtvaR4x4VxzRJ+62EU5UxlNuJWouVmeg5ioa4B9hBmIrX5
	rwKOZLfybqjmeO3EgnpZMIBip/OUO3W9H3YLZrA7CDP/Ds7gqQtJj6tFNIIowUWvS0MbpUE6X6q
	J8QCp3U2rr++4/xyWg6VhwKcK4qXNkQfDQBTriNpSzOzZj0Ee5fcgRlq0cNYFd9tsfYe7LNz5PJ
	QSi9RhTf/23k3+j9svM8DJhi9jLdMOKOuE069v0VNtqOv2LV1ZHwml+rOl2DR5l8ADFISkWbVrV
	G/DMqVrmu2vLk3aiDLojE1Omrn9z3v4vgzbji4lFGuZeWoJ1fMTeA9D8o6Vlrln8AI83rD4xLXY
	izWXmsUdF0qJ3I/w7XZ8RWbt0H9HebQPQ2lbKYm6fBGEGY=
X-Received: by 2002:a05:6102:54aa:b0:785:c960:ff85 with SMTP id ada2fe7eead31-79b5915afb9mr687813137.7.1789371497673;
        Mon, 14 Sep 2026 00:38:17 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7928023a9f6sm10414830137.12.2026.09.14.00.38.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 00:38:17 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-98089686ee7so1988915241.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:38:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByUQ6K1W/o5gODs6oe9//JcbCekX3JsB3vDLojtOoixCc7HqzLv3x9eJraIZIF4575t7HUDQu9yPd/dur0=@vger.kernel.org
X-Received: by 2002:a05:6102:2b89:b0:785:e444:15de with SMTP id
 ada2fe7eead31-79b588868b0mr615690137.6.1789371496720; Mon, 14 Sep 2026
 00:38:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913173009.1164899-1-sashal@kernel.org>
In-Reply-To: <20260913173009.1164899-1-sashal@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 09:38:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXvDrscWWod8HAqpTRH-VZfyVC+pKJuQy9enD8tbyhsng@mail.gmail.com>
X-Gm-Features: AcwNN1X-8Qz82mGtefbPfDrQ5FfGVFMErWxdtZEnRaKLFMPVj7qmjR9TiGuLaw8
Message-ID: <CAMuHMdXvDrscWWod8HAqpTRH-VZfyVC+pKJuQy9enD8tbyhsng@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a09g077: Add missing slab.h and cleanup.h includes
To: Sasha Levin <sashal@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, kernel test robot <lkp@intel.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sasha,

On Sun, 13 Sept 2026 at 19:30, Sasha Levin <sashal@kernel.org> wrote:
> r9a09g077_post_init() uses kzalloc_obj() and __free(kfree), but the file
> includes neither <linux/slab.h> nor <linux/cleanup.h>. It only builds
> where those happen to be pulled in transitively; on arm allmodconfig
> they are not, and the build fails:
>
>   drivers/clk/renesas/r9a09g077-cpg.c:966:35: error: use of undeclared
>   identifier '__free_kfree'; did you mean '__free_pages'?
>   drivers/clk/renesas/r9a09g077-cpg.c:966:35: error: 'cleanup' function
>   '__free_pages' must take 1 parameter
>   drivers/clk/renesas/r9a09g077-cpg.c:966:51: error: call to undeclared
>   function 'kzalloc_obj'; ISO C99 and later do not support implicit
>   function declarations [-Wimplicit-function-declaration]
>   drivers/clk/renesas/r9a09g077-cpg.c:966:24: error: incompatible integer
>   to pointer conversion initializing 'struct regmap_config *' with an
>   expression of type 'int' [-Wint-conversion]
>
> gcc reports the same thing as "cleanup argument not a function" plus an
> implicit declaration of kzalloc_obj().
>
> Include both headers explicitly rather than relying on an incidental
> include chain.
>
> Fixes: 810b8b6c4e02 ("clk: renesas: r9a09g077: Register SYSC regmap")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609101334.xgbNoC4e-lkp@intel.com/

See my reply to that message:
https://lore.kernel.org/oe-kbuild-all/CAMuHMdVBFCKA5gjQeXuTrOYbaY_sZg-Gnz-fgOCSKhF3cV8jhg@mail.gmail.com/

> Assisted-by: LLM

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
