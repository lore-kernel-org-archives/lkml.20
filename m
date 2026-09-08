Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C784154856C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872728; cv=none; b=ask3+7Fa9ZNt9c9u72OGRypL8/F8M4dtm880a1003MWY8Klr7recLTmZG0DR2g20PVptHLFfKsdF9w3e4evJ1hI93oyKbasZTh0TIxME3VgEvhSA4nopm93w1gIDLP58Ctiy3OmwHFI0GSBo83D1WyifbWP+iVFx+BUaQXBi4iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872728; c=relaxed/simple;
	bh=cnqNBx8pq7Z47YAsS+IDwbUQ3pdA9qA5zGP53d/4bZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kiE+Dly/DEzV0p+PZyjcAWWqW42trz37mxw75DYF7gcBcZGoBCwXylcFLnsmnsmBgz86Og5EFadEHpw84E3CqU7z6SFmHxBiYVwyWDdRC4FfMNuj5A7myWy+qM4Bhd8tdfZC2kOcZ52IPrKnyE/aLiltDB0OuwLyWjtPHK46R8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-74ab6c88052so1314081137.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872726; x=1789477526;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UFrVrNftIwevd1khEgO+DGb0fuGh52ZtRr2k3KbdQ18=;
        b=RS9C+bzP4bL7stUArOLEbiyZSyYkwMIjUu/l/3rZmMuBcEIxWulBU0veNIZkQWAaCG
         VWBmI03HadICE8j8qpA9xnDQ0qPlSl955LIQMbHYJcmmL4bPhHFJ25HwD0Rks1SPzmE9
         M7iocWqBjcfo8cnY24g3CNUNv/pIFtWhT8Rl6cC1bUuRiOWfrdc2NgW171hXNaC2Icci
         WnCYwTyLU2llz/Vz484QAMOK/bJ1UPHchp7OJMLTI1k6oNegxmvTQS7Tws87U16jSGEn
         H05XmsA5EpNIUO7PfIqfEqAkAFzrHpI0Ne6WafITdJpVxb3bg5tl2uE9DJoz4OZFYZbC
         fZQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzAB6KM4NJFqs2QeNZlglTeel80Mi9m46nlEDInjTLeLbuklxftDjp4mLmENE1/ksUXskUME+mhQjwclk=@vger.kernel.org
X-Gm-Message-State: AFuF++lAxb8W7zSF7I95XXNlulSLDtFQpYTWiDkMle/5Ti+GlCw2cmCt
	Nx4lJwI1RByJBOB633oPz6PKXNgQPbYs7Q3kgsf+5wktWYwJ2gJwoYgNIcykF5oe
X-Gm-Gg: AYBFou2F6Yor6YrQ9KYQ8k7lWCR6iUvgCrFUfGztDvtdkWjxACjQL2sX69Ih4pR246a
	peJ4nwkOBDxUw2tCDjqOlbzFClgIEJmIQT7oyBffphOxp8L/B1oTfiq32OKT+VdGnbLm877zQ68
	ACpxUISuDON+P/FZ9w8WbhaKTulpkpNbozPHuEq7tOFBf1w7tnLJp0sN7GRBzvyiAP0OCOxSpZq
	vUTXijBZ1SgJkbTfTPakXmqluPdZsI0l+Zle1Dk/1HTBsYUVlRtR95xT+nn9DX10bl37RpZNFJp
	Sig5CG7cRM+YtVgH9MbN/SdnsH6gIlexrn7CJnC36UOPxrPA7uxq1EvYo0nFRE4cZ+FUpK9bfjM
	h2HNFfIRxFPcucfvow2JDaDBlFXjxaawaA6TfCygLRQeiG4HFcd5jPb+QcyF9mrPN9n/z9L1Vav
	9LNNsj6jqiiLWhSjbkFWJa8RLnbyNMKiAM+srSfkUWPvYwy5I1EZd9lFc/+zKjAOThEzAyQI99k
	80siZaoSRg0+DCRYTSX2oHHp0p2vQ==
X-Received: by 2002:a05:6102:4bc7:b0:780:c715:292a with SMTP id ada2fe7eead31-78a4aa630b9mr9844145137.13.1788872725548;
        Tue, 08 Sep 2026 06:05:25 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47ae301fsm8529763137.7.2026.09.08.06.05.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:05:23 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c663437fe5so2039010e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:05:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxiVGc9Gcu4Fymq5O8Ekwrs2s4xCqtQE6bAw5jtMiS9ZuLlxde4IoQNrCxuFS4DojjwwVolc0oNVtS8V/I=@vger.kernel.org
X-Received: by 2002:a05:6122:3d0e:b0:5c2:c0ae:a2e8 with SMTP id
 71dfb90a1353d-5c7ed493f50mr13555766e0c.7.1788872723498; Tue, 08 Sep 2026
 06:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com> <20260826174854.199139-12-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260826174854.199139-12-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 15:05:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUi5+XYET9s2M6Wof+3A==ncJBB406HQuRMAY0mzYzObw@mail.gmail.com>
X-Gm-Features: AcwNN1X6mMBGvrXg-PhR8OjhDtaY51dYTpCkmLNbl4YY1ESwbdemVH7kSJCVa_Y
Message-ID: <CAMuHMdUi5+XYET9s2M6Wof+3A==ncJBB406HQuRMAY0mzYzObw@mail.gmail.com>
Subject: Re: [PATCH v3 11/13] arm64: dts: renesas: r9a08g046: Add LVDS node
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Aug 2026 at 19:49, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add LVDS node to RZ/G3L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4 with resets moved.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
