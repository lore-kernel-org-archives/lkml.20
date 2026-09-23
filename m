Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AA64B04BA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163959; cv=none; b=SusauHIWqaOVMQ3X5Zkzbzj8fBSuoaTvaRFiKLHIA8U9Exjt55mqgnohC5Rnqgh+ASxFeeXfpIinkDeKhUpqWyGzYQ7c5kOhHhRClk4xgNzGMrMuR29lTcDbe0cNId99TPxDZMjx2ZfCjE3gr5t2f+whHswBYJuOehzxBcdEBw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163959; c=relaxed/simple;
	bh=qBZsBwNLRX+g5XOly40nZlG/H+p+IdNWLBlhUC/CHn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mMxVpYmbSDx8a+u1urK2vXxQ0SxnSeEvoXLoitBKhQbvVMP4GhQGa+YHlrfHr1CCO2MRQttVYONS8Hv9PCM11lbMe5XQWGjSgJz+m79lYNn6+CRGYVtAK2v+IoP9zNiBzLZjx2gUTnozZ82cw3INy4PY4wGec0M2wACrCgEzqRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78ffc0e2f23so326641137.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790163948; x=1790768748;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pEC4AigJ1rNzvkNiOygWPr/6PCYaFxhpSnly8JjX1tA=;
        b=Z5xthglGW9ytAKEQEXO0GPIu5RysXCAHEwsN6EndCyLE0T2S1L10aQybXHBWtYG0vg
         eAZYZ5HhAYM6vCOMCXF+0ULeev1cSNC4MCa4ST1fKMvUntyI6J3XnsfSf+HiRUAgY0G8
         1aJ7zrBZFMVP4I6YAoZMekaAblwOiSmPdg4pzAaMothhZ8xOHCrr1mRbTN3T5yQYpdBd
         ZyNR2qXsLok5QOEmaRWxnhVllzPIzup+03L/P2ydv91mxKudgsbk37OFQWiEWey9Pl4f
         cXN1sGe8w/KNLnX/sm71Q02quU01g+m6fQKlHBjjlwqUTDDkG0V8v7EujjGfoAO9d/LY
         mhdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwd9aN1DIk8jG0G97vIo7hQ0Zxg7j4QgLAf6VUdZoy203xaW2TlIUCWFNThweXaSoS8hZfvpzG9MobyI80=@vger.kernel.org
X-Gm-Message-State: AFuF++mwwtSjUw3b6T6V7FpVUDV+V0g18zj3hIYf/utrvNXHMpKA5ZhW
	jzQsmoDIPGWWDAGXY55CF9JqoUUaMDjaSsukn5OKSwP3MAbtwI+XpdmeEeArvLPAgDU=
X-Gm-Gg: AYBFou1MIqLn8sj/PYBdRf/JRBQTh4o9y0CWLPrjtmM6J7MlUlTswWjQSRBa1/Rwcl3
	mFzbTwLuD3ioo26kN45UyXsC2srGl1eHmzN2Af6Fpy9oqjnKwlS6lR0ypJhfr9RE1rqVvVQErMz
	af9CsWe1aZEFdFx6oCn0vQZtuG7PgQGKcImiiKPqNY0LhxF5dVkW1fixg74Zl7U+olmUT7Hbehi
	BIK+bu320BUyFKZm5pxkiceywPCkK/vK2+E6wxQVETW6Kq+hPzB5n1xbt5mfyk3iDR8I2S6afRJ
	ZRmgKN31pLmpqbhzvUuvUtKJy5eHnMhVe98u0NlndFO6zRly7/RTkjk1J19C5LIlNor93VuEUiB
	waPmFuBoFMz6KX/gm5qQHGG/tSBmXrdtol8Q3EzN/Cn1qIPRviODkUq/KZtcWab7OGhGEnJXGHG
	MQpr6VEeZ3+1nlKFC/yfPvLlAze9vw7loLH9fR2IqtsjoLayd4ptUZLsX9XnBXma4i7BskO99D2
	TcXvchNgC3mnE4K4ALIorrwgVhkOAY1DjH4/g==
X-Received: by 2002:a05:6102:6b0a:b0:7a6:a24e:8130 with SMTP id ada2fe7eead31-7ac1bd52453mr1948026137.8.1790163948261;
        Wed, 23 Sep 2026 04:45:48 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f03c7d18sm2750428e0c.1.2026.09.23.04.45.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:45:47 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e512ee5so337201e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:45:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwRH2D3OOHlf0kWnb199Wp9jHJm4csmMrKSAZaBBb3oHJMmndne7HrjggMMn7yq/qx1Ju1aga8vl3Q4aDg=@vger.kernel.org
X-Received: by 2002:a05:6102:f85:b0:7a7:198a:c2c4 with SMTP id
 ada2fe7eead31-7ac1ea9919bmr2233594137.34.1790163947325; Wed, 23 Sep 2026
 04:45:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-7-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-7-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 13:45:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_jhgBFpUUBzYb_U8sp5u-M=h=4g87iSvgBK=2VULGLA@mail.gmail.com>
X-Gm-Features: AclHuK_h5MxsrDxhcMUS1bBcJVK5M781CZwgtQ6JdKTzUMPjzqK2NUlscu8dT_k
Message-ID: <CAMuHMdX_jhgBFpUUBzYb_U8sp5u-M=h=4g87iSvgBK=2VULGLA@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] clk: renesas: Add support for RZ/G2M v3.0
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add initial support for Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC,
> including basic core clocks, and SCIF2 (serial console) and INTC-AP
> (GIC) module clocks. The RZ/G2M v3.0 CPG is similar to the RZ/G2M v1.3,
> however it lacks some modules such as the FCPCI.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> - Updated include path to CPG dt-bindings
> - Added Reviewed-by tag

Thanks, will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
