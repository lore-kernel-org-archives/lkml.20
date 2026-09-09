Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C991DF98F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967192; cv=none; b=e2NdWgncOsRIMx7YGeWUiLYtTNOzwaQLOIXEYP8Msz5/uG120KhDSKorMHHcNT8YLWbnze0JaN6BxSWw+rKcFo0btKb5XDeF9ya88SOjED0wlrT8kBrc6jldktU6zDBpxKmL5muPwkI3zpVwyVYb/nrzTVLUUlEiaWpncWp24Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967192; c=relaxed/simple;
	bh=mQVTvUE5EMefp3N9PRRXFy1qIjow9eV0PSCua1TgAD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UECvaSbvsfKnnkjl8YGnlH2I9vKCct1P3V3kQtBPf4lXzUcEGhjZ+Bc6W5H90G3ahr5FI3KYyu+XXWunU8ezBLSpygHvzfCgBu6qpVCZbJ8LhPWGoqYbGcXVJxK7spYDXmiNPeLgyi6sy82cNcIaXvNW0Qeb+z7jOb3SF9V3Pxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-779d18ef706so4241628137.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967190; x=1789571990;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ck7KwbjNu626e6RdS1sR80rNpHN5osHYGNVSLeBH+E4=;
        b=mQ6A6LMYb51RvmrKWxuJmZBVkhMUIOL9I+jjvQcwBS1Yj7M7gDM4m6aoha84xj3fxP
         Iw1nkmlsLxC5Gk2/DsjGiAWq00lbN3GeKzLHwnm9zaGeZFuUjSNzdaEigXrFlISWV5CD
         c0IvTYE4EdKPEI39XW1XhmjOUpSdFMQzUCOZdxalgukXUmps0WKN0XKjgEq0ZTGc0G0j
         3k0PUhPY/j008ATAghbveq4Tb5gh1fHjY1TRRMiuix5NXF6qas1MZyqXaevr0wipWeq8
         MyxR1wZpVTJcG4mG2Kom61DzcD0Wz9mq3nGeUSD9z7o4uBlKTx/WtIqGu+6fdPpVfCcv
         Qpzw==
X-Forwarded-Encrypted: i=1; AKwUvBy3LgpEJNAO8tTR0j8pHlfYRWvH+lgNDzhLfytZwLvASEca5wIcWATu9Ydr2r8BkIs8fM6W/w6SkWxQvyk=@vger.kernel.org
X-Gm-Message-State: AFuF++nF9UQy2JHgC57phcVhWeN/gsoEjS08qqTBYI9PO9WFZY4rEpv2
	fTOUlqFnea6jzt2zkW/77JTZWUVxMjCggKDRRt5513Ksh0nJOsnrvaFKdctylM0JV/4=
X-Gm-Gg: AYBFou3vK0htB/IruJNbrKTPC2AXZA72E6qyvwTTJ+xywzPuySelxDDx9113OrpNa4c
	3YSxyxCCP47e+ZedXNasABUtZKD6BcJ1buGU2XxVfshow08kk/54900KcJUB8hWsoWKw1urPlf1
	aBmXEKjay8Jie6cxxm2NrTjfXBtci2fmN61zuSjl4zRZ2yTx0Nn45T1hJHzfzMJqJuY1joMzNdg
	y2fh8qSZ9Q31A4wHhzD21aTkRvIjdXiEKot5klnUpxj8G0ONlj94AyyGN3fyi3POO54B1D4Q+hB
	D7ryCzsmvigyAh19w1sYXuFAQEoLtbytyEOyB1SrIARxR0kQ1pcMdml6TdlHjA6Wm5R1af8NqJ9
	Mc2+Tl03+c2ZM6lfottJ1tQ8gbolwSJ6Em/YET8IRbkpB+1ZRtGZcn9Dz8oxl7NNLU/Wq3kV19d
	bdOCjzB5X70rcqbjl9IQojkACwUCPmFMJeg6pOLl/hQcUk0VzsBvdnVC6P4dSAUKYOUcMnUQDDx
	+8ct+saMjVDy3/UwzeX2f/bx7FFybAwtXI1
X-Received: by 2002:a05:6102:560c:b0:786:aae:aefc with SMTP id ada2fe7eead31-78a4aa9d9dcmr17504152137.13.1788967189688;
        Wed, 09 Sep 2026 08:19:49 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a478bb21esm11264247137.1.2026.09.09.08.19.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:19:49 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97fcda3952aso1646129241.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:19:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByXTftrLsQoAsNRohOrN/ErvTWxutWVEPbMxTq6w8neIWFjcRQUeLinfbOSNg47wk2F95fYhnMg//k5yBY=@vger.kernel.org
X-Received: by 2002:a05:6102:6b09:b0:77b:28c1:210e with SMTP id
 ada2fe7eead31-78f67ba56cbmr4525156137.1.1788967188938; Wed, 09 Sep 2026
 08:19:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com> <20260908-subsys_initcall-v1-4-cbccf4cd4288@redhat.com>
In-Reply-To: <20260908-subsys_initcall-v1-4-cbccf4cd4288@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:19:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVhEuiukgHN3_KjQbOmeJo_+i6exDtJeidfm42S8sEx9g@mail.gmail.com>
X-Gm-Features: AcwNN1WrudhTWyzE-dMx-744iV6jE5_0S03_iG05gjwf1BiOXXU0ML55Tupw88U
Message-ID: <CAMuHMdVhEuiukgHN3_KjQbOmeJo_+i6exDtJeidfm42S8sEx9g@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: convert drivers over to use subsys_platform_driver()
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Tue, 8 Sept 2026 at 19:47, Brian Masney <bmasney@redhat.com> wrote:
> Reduce boilerplate code in the drivers and convert them over to use
> subsys_platform_driver().
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Nice, thanks!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Works fine, and no change in generated code (besides renaming a few
functions), so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

As conflicts with renesas-clk are unlikely:
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
