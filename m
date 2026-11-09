Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794234008;
	b=p0A4Ra2/Y+W2KXxyPxBHkxvKtWF54vdzVnt4f1goKt13wBwiUTLk3ncZ9kt+kR+NTe/5
	 tC9lQqGJYL5iEq+tqbnGth6EDbRv11YvFgMc8ifVCjN5/Y48EJLY3K1FWSKavMSIeiaNA
	 JhSBi78h8nc/0FUL/uDM12GRXulHcTAB84GxpxJ4Lg6KN0fEBPHF8EFHGt+Z5GkJ2QE6Z
	 LeL6AGin53HcprN9mN2ExHiTSifxumEUWJ/PmEnE//TWABEacsFSrEDK6JY2CaIoh0VOa
	 QKnxxSbtJhAOu0oduiwJ0/bHUWmrriQdaZn/V+Ob83XL2ke52obTvVT8U157I4zqWsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=KPphWv5faerQ+f+y2QS6kBpPhy/DbtYHiDVCfCM3mZc=;
	b=eW05PG/9WhPuqm+lwkpbJIY65v/a3RMDqDLaLDtFbCXEj8ZEeSwH5AH5eOZbbFktbFFl
	 lOYnKzDHoLAKsWxBxBlIxDzC7QFeK63oklTZFBIspK/cYrTq7JXZlFku4GhQLX1PG7OjL
	 8O7pSZNONB9OE0eabbYDzF7HpRJ3PHQx0wLbkD8DVen+XG8ytbdMAqVuoBlx1uy3sNF7G
	 wqNePrWv76UiDfVP5iDjr68RKZ245/nF7N4O8At6V4s+KgPZIvXdi/QJ/Y37reZqMAw6T
	 LB8y7plOuYafVZWaedLcWqzCv6Y2AnxytNvgSDfcc564EvjxdtTNUg+pYK4jS2f2zwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aF4vOIxk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1008606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1008606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aF4vOIxk
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b32daac9d7so6389987b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:20:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794234007; cv=none;
        d=google.com; s=arc-20260327;
        b=KRci/mtY1VycQCLTaO8A6sGTErC8EJK8A4VgzXmh94OM/NkPZ0M8zWOxsHG+ahLe1a
         b7ZPkhIKWvV8JBGTbTfceZBFvp6BSIDAjm+uS7Pr1u/uydGYQ7qjhP6sFfcK2WXiNRdW
         esqrWi3TaIL0a4qOyxr4VcaVSeu/KgFIfhQxRzzImoat9RQ2KoGHzPzKc0OTKYNMoW9B
         N0ASKB2hIMsmaraLtS8kjF7iLS/9X1rLC3xrGa25gWmPTRWm+LDXeX5CP24GegQKM+i4
         88WLdvVgVaL3IWO4oim0u/2waer5CIFyvhRHD+b8y6MSIKLLXdLmp1DT1RgMTY9emu2d
         gZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KPphWv5faerQ+f+y2QS6kBpPhy/DbtYHiDVCfCM3mZc=;
        fh=hNWA0W+mxccsdC1lsnFM/HVPdTwwIWFCpgxjhFThz+c=;
        b=me1aOu26HwcY+/ciWeAEYg/QPDJDf0ptou9gghRGcyb/oOMVEnVON3fIl/I/FAc6ZK
         6HvansywjEBCCUjWSzCSz1yfi25Oef9ibxhEf8AK5bEldK8TwH6kMZtHaRvH8p5lmFkv
         5/WXAGr0arOWNR+G/TeAw+OaW1wyu0tZmtUEggBWtkSumqq6pvxMN0FysUiDS366tsZ1
         e3HE8w7AgyXvkGcA5hBARiaNdqnCQN+rq6KGCw+Ra+VubElFj9hc/94yZ3qXyKhrYexp
         GabfGfcIP+Km0w4rvzU/08zvYYrLaX+2JeB1Ud9BV92e3C7jqTfD2rCn0S0aZNkt6AnX
         X7sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794234007; x=1794838807; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KPphWv5faerQ+f+y2QS6kBpPhy/DbtYHiDVCfCM3mZc=;
        b=aF4vOIxkJCgakd8KOW28+MZPpGfUWLWvNDxZI1wYbvZaqxUwtrxPGJ9k1IRwxArxxm
         LSfVJl5rdSN10qfwpJuXHdYQ18DwCOy1tFe5Y7OVgk6EZWSXw8pZeGS9gLseJmX9gb3Y
         HbGGsIBVP6d5a50oym45y23rCQWs0/rJENM76OO8//1j0yWSfBsnkswoSLY1x25FHFtZ
         LvM8k0Lflv9gWyCdqAe4e66Yg47o45xV58C+Qp5GCkBmx/kgabFJPjXevZ96eiBqZS3K
         KLQ9USIU1eVFFvM9X9UJEepwUKF/7dstuOe0bpsIZ+Qwhj6Qn/HsnSGjXT8Zo2EtX87Q
         znSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234007; x=1794838807;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KPphWv5faerQ+f+y2QS6kBpPhy/DbtYHiDVCfCM3mZc=;
        b=J/EiXr7PDYdD92+Dn9fu1bZEU5TYUh4qESq/xTDYAAPhm6I1Ya0Mdoq064G2Lye6E4
         UNUJoYl+NXIzMR6LCbb5MrhQO+VO0JY1SCjS1U9H+tdfUNxt3uuawg4HVfXN7S8qiVUQ
         6yDqYguvqsPTj6LsY9WJU9AFWu/VJaQfKeIEN34PUa/WiJdCsz+yiYN1Sjy/LhGf3V2x
         SEXtzwg0iToRikUSdtCkX/Yv+CVi/JB54ik6guyFew9jUgbXQOO8uWbuvGuHgi/U2BzS
         be6gcPAl4+Q0dXk35Nvlq4ECJIeAUf/FH7wGS8wLHyDDCvH3VDBw7gS0uVxH4ilDCA/Y
         tXTQ==
X-Forwarded-Encrypted: i=1; AL+hErGEl/HQFAp2YQMs0GGsGNr0wcClOGDI9/zVaAqur3D/OheuuTIg7iUPPxjzK4QcWHLs3MvBpZUir2F4pxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pjRp/ns1LgAuJCcBRbmbR8nDU38hGH/8JOi+nMDC7AyAp3138
	aL+6k4Krzw2cXTzpOqqjdZDVMkxCfPiijQXV0OimTJlWPL+VPwJ5FVEpVt2c8hMjL8/BXCr7GC8
	U8HetcuvCOvJoPAObm6t1MUUhF4axfKX179IiLV7QJA==
X-Gm-Gg: AYBFou1d9Rdt7cK4Cxw/G/LG+McAQrbwoI4DnMIbgyT/iB2zAEVOe/XcJEt2tiulRX2
	/4unX/o/YrhpOcKojva/aqxGdag6Bi/8+0TLJJ34WQOOhsEOI1BBJA0QC6FaTCCggXvuxP7C+5/
	KxdnRSa18t5p7I4WejCwG6lgdQfxJmivGBERkpmLNBingJABbARXpqadqCHI3kQctYUqpzHaUUZ
	eIFOBOPI45DZPWQyIM1jOcHnaNxkxDyBoHL8u6LeKrfM1iORFKMGf6Q0gQGgwNv08JBqkGLMtL4
	KN5WH6+j5TksRpqpjatS/NNo27iUrFBO2OPwBY6cs36JVRvolzbouaZkT58HXE3t9+Hmn7Whvyn
	6T4e0Gu9oU3k6l56gzoGbKPhzJcR4bhp1LIz5lfh09yRB7+iydFE42btY0Yh8uGdJdmXL8g==
X-Received: by 2002:a05:690c:f02:b0:8b3:4911:2dc4 with SMTP id
 00721157ae682-8b36c9fcd1fmr27817757b3.16.1794234006642; Mon, 09 Nov 2026
 06:20:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-remoteproc_pdev_decouple-v1-0-3dc2fad4951d@valla.it>
In-Reply-To: <20261108-remoteproc_pdev_decouple-v1-0-3dc2fad4951d@valla.it>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 9 Nov 2026 08:19:55 -0600
X-Gm-Features: AclHuK8JMBM1Zrd1Fm73Mt0ilMAi-qlYe3cHAl4uEn_pkEsQwj_7mkScPt9WXZc
Message-ID: <CANLsYkxRsVOi1FiD0CosRop06LA8yyFAW43Ex150fKHrCa7OYg@mail.gmail.com>
Subject: Re: [PATCH 0/4] remoteproc: virtio: Fixes and cleanups in the
 vdev<->pdev relationship
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	Joakim Zhang <joakim.zhang@cixtech.com>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 8 Nov 2026 at 16:32, Francesco Valla <francesco@valla.it> wrote:
>
> Hello,
>
> while proceeding on [1] I noticed a possible simplification on the
> rproc-virtio registration and tracking path, which led to the discovery
> of a couple of bugs. This series is the result of the work that followed
> and thus contains both (proposed) fixes for the bugs and the
> aforementioned simplification, which consists in less poking the backing
> pdev from the vdev side.
>
> Patches 1 and 2 can be collapsed into one, but I preferred to leave them
> separate to show the reasoning behind (and to allow cherry-picking, if
> that's the case).
>
> If anyone is reviewing [1], or plans to: please consider this series
> first. I'm in no rush to have that accepted, and some (critical, in the
> case of iommu) details need to be squared out, while this series fixes
> what I think to be real bugs. I would have preferred to spot them
> before, but...
>
> AI disclosure: an LLM was used to review the work, but all code is my
> own, as well as the commit messages (I'll be happy to fix the english,
> don't hesitate to correct me also on that).
>

Maintainer disclosure: Code and changelogs written by humans are
preferred and given priority.

> Thank you!
>
> Regards,
> Francesco
>
> [1] https://lore.kernel.org/linux-remoteproc/20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it/
>
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
> Francesco Valla (4):
>       remoteproc: virtio: Decouple vdev from the parent pdev
>       remoteproc: virtio: Rework memory release
>       remoteproc: virtio: Drop rvdevs list and associated functions
>       remoteproc: virtio: Stop de-referencing pdev from its children
>
>  drivers/remoteproc/remoteproc_core.c     | 34 ++++++++++----------
>  drivers/remoteproc/remoteproc_internal.h |  4 +--
>  drivers/remoteproc/remoteproc_virtio.c   | 53 +++++++++++++-------------------
>  include/linux/remoteproc.h               | 10 ++----
>  4 files changed, 43 insertions(+), 58 deletions(-)
> ---
> base-commit: ec1f9ba57b02fe12a6fa5f141206d439ba3d044e
> change-id: 20261107-remoteproc_pdev_decouple-9933eb3a5998
>
> Best regards,
> --
> Francesco Valla <francesco@valla.it>
>
