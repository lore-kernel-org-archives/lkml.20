Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628FC44A3FF
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827037; cv=pass; b=ViZNQYxNuHGiAaFQ2VLxsa4Y40Oc51WFHGqVmIrU9NYezY4bg/CbcHU7J/rVPh8bImrJJhUjLdi6Arqhf7E9dNVL6qVZk9TtvpcKuPoyiM73dkgY1qCyDFHT19kyKyCL751uVMm/wMn3E3X0LoJraUP+qOc2MGDHWyb6ulD2pR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827037; c=relaxed/simple;
	bh=aQmNTGROGdvgxfWPGJ1OogqSDxU0dKMs1Ijyj+pgCT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WdTFgUtBzNlpvuA6KhsK9vbFuTDyu4VD7EGXer85AoX+ribOBnoFO/EMAD4VCV+8vX+1iGKYjgwHIvnoY23TOMYW0mcyH5hJVfuCB1O9w6lTjs0XIhJupxmTe7Vv3j5F81soJZrrY4ZoCH2SV/PIrWCyW/Wyu2sjJZ9Cg0HbW7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcUJw6yw; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcUJw6yw"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so2823560a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791827035; cv=none;
        d=google.com; s=arc-20260327;
        b=Y6sYJzZW/ES7IF+RxIsp/SLIyq5bdxiLTH3A9n7tFnRMHKjbKWyOa1KG9u2ZkNEb/R
         DObEzn2m6mDaVaGprBpmyWeO81ARYheoQFu5tCmQeQmw2L/z40zTaRVT7Nhn3VI1g94c
         JELn32Dal2n6PDYRraTdp8OP/q+TJ89NmPUt5OWq3PCZTAGz+iyXnqwEYwmU/Ir3ovDE
         mfOrehQeyG3U2lRW+S26hiGVv1/vsUFFWSuD5Cna41izGwgVrzZ5jON0jjrytSlp0iRI
         Mup3A5yHcu7CpVUH9HRvxlArN79vcWp4nXNiKAXqC1ZJKqGUQOpKsFyiWuxGgugZs4h2
         AaAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aQmNTGROGdvgxfWPGJ1OogqSDxU0dKMs1Ijyj+pgCT8=;
        fh=m9cTi31JQ+CUfl16pTeCdtiMjaXozzyuUTTrXUW1Iok=;
        b=TxZtV2hILBzmxcPLdH3omX59PFLJLfgJ+1nD8I83fblsuNq2BxqFKtl6HXwNcEC5ig
         QaDk1lNIm3OtdUGfQUEf5S9cGJ6TijqLJlMUFn9QrttTN8WPUp9Id9aN46Zr+uUjhmHV
         MIVlsmffKukU+2Ulpe4wOBM77Bk995mRUgC6KaZZK4FHuLhNFrR2LrjD4YQo4Lrc89t/
         fHQ3Ng3BWdzQcH5R0ZGMzCyoe6eC2jNXODyR3yUFwv3l46wK22Q6JO6aeU6NGbMdCyoU
         LwpLJz8SKdKL+t3FggQmrXEk8alEeu0hHeaArNxSdb+RpYvPIfmf2d7topJGJzeI+H+h
         sLRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791827035; x=1792431835; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQmNTGROGdvgxfWPGJ1OogqSDxU0dKMs1Ijyj+pgCT8=;
        b=LcUJw6ywaXUWSFgVNr+iY2X2x4fSEganZoXN8lnsLbPnDIfcrnq8RssjOOLYNl6inQ
         NL8TQ8trVRYn16xSZxIdiMBSmsVF1jLCYujuN50LBbYbr8JYBEBai2WC/RbrFE9f8kid
         Q24bNAXe83QZExOOpuBgJh4U0TKqWLYZ2tUB0ccJ26yU9h37dzut/Nk631b0lK/a4gNf
         Y/5E6O6/zBFvtgUN2n/cqFXpgAe4cGvox4MrCuHKQK+lgnajjRzuiBpaL5M2A2GAYJZg
         hgW8kzSkBS805Ns/b8YBJLLllzKzUSvOdsmmyoGHyjZSgAteDy3TwCM8Sb+EDJ1YUwea
         arlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791827035; x=1792431835;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aQmNTGROGdvgxfWPGJ1OogqSDxU0dKMs1Ijyj+pgCT8=;
        b=YNZNcNIojyTUEgSJOTdR0GOQe8t258MXO17VnLHYHiGhmHdbNVx6lpvAQ1ZpOp7ZO+
         gEgf133JGJEohXqOKUgBZW5hLu0LDb0h4YezqRgUUmHzS1IlqPHeITeN8cc8GvmzranT
         a+uopeZc8r4HwpUbkB/pcACsj35UwjOe5usjfH3T9HBr4e7LamegM0+aPZ1+CebpqKrx
         qZtwpMcPrycWbrzhpuXLQgzjISGIdYtxVuFb2DwnznAMmoN9mxzoq64ANUdhD1M/nKnu
         lB1qR022PTTi9ORn7BsGb0wSJMj2L3PZHpfSctBlcODQ6SIrPrgLRyU0Up1eBy4gZSuK
         1DUA==
X-Forwarded-Encrypted: i=1; AKwUvByEzYu+yxafp9wejaD3p+dgK6DGL8xB0WdWOra1m4MgpzbDf/bYGkQ5Otqj/OsrsEWal0pxiUORPVvWYJA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjI+dsz/mRbZwLs/TM2ReYHy/BE+Tq+STY2RdVafRQ+zAEOf62
	EOgCbYbYpnLl3l3UnZ891aA1o7q9Mim5aGXC27Zk7Tq5bjOi8IGqpdD9QL8rQnoRMTQhjdSgZeJ
	/f5kVK3+ulcVXGi0zkWoUQoU3cHlhzxM=
X-Gm-Gg: AYBFou3BXPDoi4lTTUSHyghOk1TD8Pvs3MKUzgu6tqK1GbXlcnPBAk/QwAoOGoKgq1Q
	fOsOe2NB59WRFUBu0fVd6zVW/VV0hoX4Lx5kZ+k2Z5Q9gt/59DkBpE66iBS1QX2nb+olr4SwxsJ
	8jVYnnw3BdTSiY5WmHVqDes59TzW3x3q6Tih536XYFwBAHtRVp2dCIw88y6GQzvx1f9jFCUHDuf
	+JNj45CBAq7xPMmNNdpeJGV/aGGVrzhcGVlNTch/zcWjp7FjNPaoR9YEFrv7FxV0w3X725uBjvw
	cMof0d0tQZGyKihEE0ys7RM4kHM/jfXOAkOiz4sjsG9t7Ytveaqb9w==
X-Received: by 2002:a05:6402:4341:b0:6ac:8761:17a1 with SMTP id
 4fb4d7f45d1cf-6b17c27a7famr8072014a12.36.1791827034421; Mon, 12 Oct 2026
 10:43:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010115539.9237-1-l.scorcia@gmail.com> <20261010115539.9237-2-l.scorcia@gmail.com>
 <20261012-quirky-emu-of-renovation-c217dc@quoll>
In-Reply-To: <20261012-quirky-emu-of-renovation-c217dc@quoll>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 12 Oct 2026 19:43:42 +0200
X-Gm-Features: AclHuK-aSGZTx-4HZF0vtpTq6BBo_BN-ay9Tv6iz0b611lBgirjVShAwSUrYMCA
Message-ID: <CAORyz2KgX-7=gfax06+Pb5SFq4dVTtcTY2pbH+FDCRNZ+AVXOA@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: mediatek: hdmi-phy: Add compatible for mt8167
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Fabien Parent <fparent@baylibre.com>, CK Hu <ck.hu@mediatek.com>, 
	chunhui dai <chunhui.dai@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

> Why do you have flexible clocks?

Hi, I'm sorry but I need a little help in understanding your comment.
If you meant "Why isn't there a constraint on the clocks' names", it
is already provided by the existing conditional block [1].

If you meant "Why does clock-output-names have only the maxItems
number and does not specify the clock name", it was there before [2].
It could probably be added back with another conditional expression.
If you meant something else entirely I apologize and would appreciate
some additional guidance.

Thank you,
Luca

[1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/phy/mediatek%2Chdmi-phy.yaml#L90-L102
[2] https://lore.kernel.org/all/20251217-mtk-genio-evk-hdmi-support-v2-1-a994976bb39a@collabora.com/
