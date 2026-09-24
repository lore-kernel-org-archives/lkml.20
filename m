Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB42386C21
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242513; cv=none; b=io+5RwVujxskmajkMmGgXsisO5x55w4rBgwoJxpp0YUTQ47VwZGbaHk/aPj7cHVRfLAlVmeAfbRs4Qmk0HypB4dL+MXDU1KB7hI9JKrS6Wqb9zmDibwzWPq+A+PvrMvZo4J/7vwNiFhig0I6ysFJP7Bu7lDoyQtQ592sdukhg5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242513; c=relaxed/simple;
	bh=xlFr47uBNraq9Vfw+jhIc3orvyXDcJ8EdkBjzapnpks=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fGnaChy+090rirVu3gLTfdYa4RnYi5tTdffYdptdOGzKRFeFjQ5gCEJUADaWQ/ZE7VpVmCQ8O6VTbegNLOjX5chcJW3k4tsljaJfFmaJRaQCVFuijWOZ22WvzDf97AdKCHmK/r3rLcO6foSDo1Xs3LYceQCyg+jqdZgVnpPIBFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QNLXS3Ym; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QNLXS3Ym"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso8243225e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790242508; x=1790847308; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ntOIbWg0v6Y7sjUG+xdx4uPbi3N8TfY72tgKuI0bUbw=;
        b=QNLXS3YmCK1BfBF7nU6ZAi9jD+ARO67zOm1zraT43p3A2tSNmRmr3MxQYTTusl/9tQ
         W/cVYWYLGOLnJ4vhIS810/TLgmUC7/L2MtcZUoP3DXhdTAF+EjVVu8nvb9+Gl0ejglHh
         v3omTb2w2LbPW/R6nfy3hK3qAorfTVauqThaawmV2MlsY7D+VwumuwnHrrXDvxN8ortq
         mcGaSxf7Pk0ebN/C62TaoQFsRUj/Ml+r7N4c21inQPuFM5TXPyO3b5CZA2IyJLBPvsjr
         25fNcbO9AUjH9uR7pONolWo75YsJEcoh6ftZeGKZUkQRSGLiQMfhw3m3B5DJM/FvypUq
         ZdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790242508; x=1790847308;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ntOIbWg0v6Y7sjUG+xdx4uPbi3N8TfY72tgKuI0bUbw=;
        b=e9yhqcF/7yMVILauYAM5DoOGQG3hDycTKTQNGDwxOFtEs2iRnmabxiJpEdFhOfjxI/
         1JatgQhjjE1/WFKUfTym5M/Qlf35oJJ+4hHlkGefH5P6yXfmixiGAUFx5V4/7tqbhHwM
         3XQ6WxxBeIOup6tev1YSXFeIDZ9MN5XQyG23X+kj6xPh/jYNMuK4yxI0Wc+wPiNKYtOL
         zqEdstC/blS70lgKu7oaA9XhHvDjUriZNLVLnDr7zPhqkTdkkyDH/0NdbOKq/a94BAIU
         xnZwg8m4v8Shy2NaxCg1eNmcoxYFnywC04vrTSZGeF1iIpidQ3OUsqYLyiypv+V4weG2
         3jDw==
X-Forwarded-Encrypted: i=1; AKwUvBzbzmdA/i/uRLbl5nYh98nffC9xgYp1+NqJNjb6sELstCzqmnuLsx7A4YHX9AULxOMoOYWdbpwJbP7pTNw=@vger.kernel.org
X-Gm-Message-State: AFuF++kVZf5gi8p5GGmDHRR6pp5HBwOwZX8OwZtpBzKkDM5y80wHOPQW
	P8Q2U3PlqDGsfpb3I+DBcgDndg0UxRiMP76C0w+thmkd4+PQwf4+uxg6UgSURrhUXSw=
X-Gm-Gg: AYBFou0QtpWmGSFCkm32Mliq2IFpGQtb/I972fwdTiX7LyEW7sNGDqk/s8mlEcxmozO
	zfhBhIVtUU8QkyP3bN0WY+Dx1rRG/KrU1He6YO87Y1XPdwN4hC/AXu6G/uzEkLnjatS3O15WbPE
	g+p2lyd8mtuYL8NRA1Ttd9kMLmbZB7J2rfGsvO85ecjhv7lI5JVno67yaAMh/oaVAUM7S5C3Axi
	z3pvwInzBE/Of+IuaBCZBnUMcFkQbLwLRkWa4QoCexIP4/Z+wfJe18Fs2IOt8KL7R5z0yzBs5KR
	NFYZXcrPIMUrTjCfKfqbO3VpehPKmRob8PAAzJErzmRoGuSXWHEagkmwQYr/MtxWWByRwaXSSpn
	+JqzC4oyx2o0VLaGjsYscKGW3zDIRfrDx5CANt883/J5dj1FOLK1YFbv0GAos9IXamQ/TFG280B
	lnHh2hr+dnsx2W3El+GbScf7vu2HDkWq4u6JZ9jWFsbEcZeWWLnELehNZ0jWzEuzmn3TcjhtRa6
	x/0mJ7prPMiLzQnRg==
X-Received: by 2002:a05:600c:4fcc:b0:49f:df99:ff1a with SMTP id 5b1f17b1804b1-49fe66f344dmr32157945e9.17.1790242507705;
        Thu, 24 Sep 2026 02:35:07 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd2bacsm50613795e9.13.2026.09.24.02.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:35:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>
Subject: Re: [PATCH RFC 0/3] clk: meson: Refactor PLL pre-divider as a
 divider clock
In-Reply-To: <20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com>
References: <20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com>
Date: Thu, 24 Sep 2026 11:35:06 +0200
Message-ID: <1j1paj9elx.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 23 sept. 2026 at 19:14, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:

> This series refactors the Meson PLL framework to remove the dedicated
> PLL pre-divider (N) parameter from the PLL implementation and model it
> as a separate divider clock.
>
> Currently, the Meson PLL framework models the PLL pre-divider using a
> dedicated n field in struct meson_clk_pll_data. This makes the
> pre-divider part of the PLL-specific implementation, although the
> Common Clock Framework already provides a generic divider clock.
>
> This series separates the pre-divider from the PLL and makes the PLL
> DCO take the pre-divider clock as its parent. This allows the
> pre-divider to be modeled using the standard CCF divider implementation
> and simplifies the PLL framework.
>
> The series currently covers T7 as an RFC to get feedback on the
> framework design before applying the same approach to other SoCs.
>
> Series:
> clk: meson: pll: Remove the dedicated n parameter
> dt-bindings: clock: amlogic: Add T7 pre-divider clock IDs
> clk: meson: t7: Model PLL pre-divider as a divider clock
>
> The other Meson SoCs will be converted separately after the T7 PLL
> framework refactoring has been reviewed and the overall approach is
> agreed upon.
>
> Any feedback on the proposed clock hierarchy and the separation of the
> PLL pre-divider from the PLL itself would be appreciated.

So if I summarize this RFC, you have simply taken the divider out of the
PLL, no futher addaptation. right ?

I'm happy with it on the general principle and fine with the change as
long as you test it on as much platform as you can, clearly flagging
those you have just compiled tested.

A change like this would likely need to land early in the cycle give as
much time as possible for testing.

However there a couple of thing I'm concerned about:

* You've drop the table support: are you sure this is not needed anymore
  ? don't you want to be able to restrict mutlipliers to specific values
  sometimes ? If not, then OK.

* the determine_rate() make no call to round the parent rate: Since the
  parent will be the divier, how do you progate the rate change so N
  moves and the best parent rate is found ? For sure this fractional
  multiplier clock will need CLK_SET_RATE_PARENT to adjust the
  pre-divider.

* Goes with the point above, but I'm not seeing anything that favors
  lower N for lower jitter, Or mention of a minimum input rate (which
  could be a property) ?
  Those are constraints I think I have understood from your explanation
  here [1] but maybe you've got new information to share ?

This is overall going in the right direction but determine_rate() and
constraints need work.

Note: you are more likely to get test feedback if you add g12 (sm1) as an
example. Those are still the most widely used amlogic platforms with
mainline.

[1]: https://lore.kernel.org/linux-clk/c9c4945f-cdfc-4382-b8ca-71b69d91deb4@amlogic.com/

>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
> Jian Hu (3):
>       clk: meson: pll: Remove the dedicated n parameter
>       dt-bindings: clock: amlogic: Add T7 pre-divider clock IDs
>       clk: meson: t7: Model PLL pre-divider as a divider clock
>
>  drivers/clk/meson/clk-pll.c                     | 178 +++++------------------
>  drivers/clk/meson/clk-pll.h                     |  13 --
>  drivers/clk/meson/t7-pll.c                      | 183 ++++++++++++++++++------
>  include/dt-bindings/clock/amlogic,t7-pll-clkc.h |   6 +
>  4 files changed, 181 insertions(+), 199 deletions(-)
> ---
> base-commit: 43e1705ecab981c66baee89041e6f728c0436f19
> change-id: 20260923-meson_refactor_n-e7f25904e536
>
> Best regards,
> -- 
> Jian Hu <jian.hu@amlogic.com>
>
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Jerome
