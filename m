Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCBA3BBFD8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976487; cv=none; b=YkBqmFrtnthJ93G/2ioUy3vfWfxpkIzj0IzMo9CoWJm5qnX1icAsvR8V9m+OBLn1L0NCS8lKg66doTNelw6y9DyrFmeKo42NX7X7vzCaG081EzwCe1VYVM5+cWd+5RLC44vDsQmiD7pJFBkQtkQdNAKWafxOonyuVkVRYXRy0H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976487; c=relaxed/simple;
	bh=nRr2NwONb5MDiY74TwbEFnamWl7CEbEpARCJXKG89CU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W2HEif3RuszuMNu9pXez9BeGLpaTS8bLj6kzcrh23x2Xnsn5pRJvzyNnN7tzeXyB7GhvaZgD2YVkMqFjvwV10rL6scdb71UhoS+XWN5e48A6sXBTHTuFgmlVw0lB0BZlXyaSQ1BrBT/KDotMsLjO/++gMxUaken7masQLJrY1pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e4d8d8aso1816925e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789976485; x=1790581285;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FDUPsKvRHny4pMpTXrqtNbtll59mp87r5rbb0L/oblw=;
        b=P8NsOTzJK+yHD+szkljhSVSE2wDdn0DJsg5hD9H6bSz4fMFwLObrQIgtNwzCeeiZ/G
         S+JK0i7EvcX7JayDI+mzyzdxfugShEDoh8EnYrbopU1j5BfCj+vA7f/Og+6kwfhWz98v
         J56ITJIlsj+XaCqYVOHbv4h9IGpYr4xPj4cGj2n9KR92G9R4jz/UWmUhauykGCYA0UBr
         lxDwBBrmDpz0LluufUSmMr/Wof70pRcH3nK65QTjHLGUXf7kO4jQp++Sp/I9194llrhf
         VA6Ghjt+flAVSGIggW4PCDK5PVbRp9TFYNw+NeChSoL7w8a2SU0kPApY7tJvSw6taMJ4
         lmMA==
X-Forwarded-Encrypted: i=1; AKwUvBzfjHH3YJek+2fZfKb01J9R8LIVBm2f6vO93CKfrwl0KVtuMuv11bwedOzZUzz+ZvGGQfv/IJ40DUMV/BA=@vger.kernel.org
X-Gm-Message-State: AFuF++lyk9wDHeeD3oMl8Ep8UMC7/khkK4PnnNUb6FF9hkwb+Rgh/tnX
	XQ8wfxq6l+3jV6dQI0lEzA83m81ycLfwRJSikEX9Yx/yLlI90/bp9KigS+29DtYA
X-Gm-Gg: AYBFou3+vefFgOj42kbIeEjc/JuhMq+j+syoD4jpEXn3ysb0cQ4Q1Mvcc5+JYidppVv
	aLjvMrZxd53VtAVd+1D/9qgIrXAGvRYOVKZFX3DTgnxhmKNGgr0/Jp6GarvpW3p+VqjbuhiOeW4
	0yiReAc09SoGv+MQhikIB2x+39yfwc7HbNx/md8ZeePBFFbJ/R46Y7kgAhY50klouLTa5+bmjf/
	0qc+A8QgKa1JKKVTTZjITZ5mDwxj+WYXcNp4r2JSQNjN16fhyZHBN6yuGyJoOxgKoFU74AYwjAx
	vWJ3vLrygjcneO62okHQHmEG22rrCWhgBmfSkiSTvDS6/r1WwdUrGyn3N/V1ShdT9aA9AHgR2Uw
	zkU753b34eQ80l98xptqTOBYnUwsVlXkJYYQIUlGmnUW9AYbr9l0o4dSeyj8BtXue9luM8iQh6h
	tFoRXWClZtryNsmFEu/xDPFxYZ8LbRh4t4d6C5kbWXc9GCRdd2ljr8eDlucaOa9xDK1+MsAIfTE
	huSZSXtJKbv6WejIdBSQ96q0d/KVIMld2rG
X-Received: by 2002:a05:6122:d89:b0:5c9:a60c:2735 with SMTP id 71dfb90a1353d-5c9b598e3c8mr4029117e0c.13.1789976484812;
        Mon, 21 Sep 2026 00:41:24 -0700 (PDT)
Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com. [74.125.227.40])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9c17a96c3sm6319820e0c.1.2026.09.21.00.41.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:41:24 -0700 (PDT)
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7aa0603e450so52028137.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:41:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzXikjYqdR7efx5mEpXY0xIMoXCMdQX1rGWwgY7x+Ea1bJxUYUOf9i7cjLRJsrV0yznhYhV/jkuRMDO6yo=@vger.kernel.org
X-Received: by 2002:a05:6102:83d5:b0:7aa:17ba:3dfa with SMTP id
 ada2fe7eead31-7aa17ba42bbmr32910137.31.1789976483444; Mon, 21 Sep 2026
 00:41:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-0-dbe9236bfd22@ideasonboard.com>
In-Reply-To: <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-0-dbe9236bfd22@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 09:41:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVC2vNp2nTHUi3saTZ8UD4ggeB_aBEvN9XP+EToOr7G2w@mail.gmail.com>
X-Gm-Features: AcwNN1UjZbDPnIaj-fYRvcBoX7YE3K7C7k2z9bWrLFQVkND6DSGXX-e-oumCCsA
Message-ID: <CAMuHMdVC2vNp2nTHUi3saTZ8UD4ggeB_aBEvN9XP+EToOr7G2w@mail.gmail.com>
Subject: Re: [PATCH DNI v2 00/11] media: rcar-fcp, vsp1: Enable on R-Car X5H
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Fri, 18 Sept 2026 at 19:07, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> This series is based on Geert's
> "topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v3" branch [0]. A
> branch including this series is available here [1].
>
> This series enables the FCPV{B,I,D} and the VSP{B,I,D} blocks on the Renesas
> R-Car X5H SoC.
>
> This has been tested on an Ironhide with the vsp-tests test suite [2].
> VSPI:
> 145 tests: 138 passed, 0 failed, 7 skipped
> VSPB:
> 115 tests: 104 passed, 0 failed, 11 skipped
> VSPD (a):
> 114 tests: 99 passed, 0 failed, 15 skipped
>
> VSPD (b) hangs on the tests, so that needs some investigation.
>
> The first couple patches add clocks that are used by the FCP and VSP,
> but as the upstream X5H CPG driver is barebones at the moment and we
> don't yet ensure that the parents are enabled, these are marked as DNI
> for the moment.

The DTS patches use DNI definitions of clocks, so they should be DNI, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
