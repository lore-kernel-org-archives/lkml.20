Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793276030;
	b=PuoAkpH5wu73ND9Plqm6HHRfxWgaL4fQJmBQKBYmEn1GmZYoyu1UCvRj76zJ95UUEQe9
	 4/hew8E0HcDvQA6Mb26oDRg+xp6dfo2AZ/hcb2wVjyrbAlBuS3bckC2Ib/WuLN9HSxdqd
	 Za0qxuLiLezKFRX4Arv/kkfV9jIlpXA6m7tJhp7+BZOuuxwGvbiCaePL99OfR94+FPhgY
	 MEzhmF22RBah1jTAUXNCHeCtV+6GmPLcLIqKguuOlPjdsBPdZHbn/eAAi/yRgTAuAouow
	 tgxJbjkGQQDfaXMBZjGLHhYsPK0jVqSc2snc0yl7bp1qwnJAbeP7fhMLfLrNtEBNMiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793276030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
	b=jb0/9WKI94s/OzrNRA4XiCAiJQpeTrDSZnOZsCBMvoDE6Ns7cAba97wuoOjX1wHtjTFz
	 tHFFqioRPa7ZV9Fp4fBteGzcPpy1SvzWJkkx5ymUS/7C3BGui+1q1O279OgLl8RFAPQd7
	 WoYpth/FAzHLdOOy0S9D9WLLpoOgYbACaYogvyuF6/uxyTbQwJ24raFW5vrLHXvmossBq
	 R+m9Fts3Usl/gIRxIX/enSx4T5cLvxA6JEb7ndXJoaS3Lq33CxXYgWeaYah5c70FdwruG
	 AqVEhCEbh1n4J6oNz8E6Ve483WI3pLsZeuHypoJzsO9fZ1If592JdZKrPMr+mKuW9fg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdjNoLtW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1721C606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1721C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdjNoLtW
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so1283580e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793276027; cv=none;
        d=google.com; s=arc-20260327;
        b=q2OQCBoI2N79HjHRqDsdzpHqwzr9+0HnEc+NmGeFPJUClK/NXkVlTfkscByuxmOMcG
         xH3NIROjNtUmBr66fNQZ4znoCOoSw6AEjJCQgIpv6QXNe9IMqIWWE73Vb+SDvMVlhfKc
         0VZ7xjE8QZ88+bLKQhwoFg9yMazI9lQz6MJbt4cXssYFD+twOYLHld6kzIWA86XZiRf+
         nq9NymTLm9+C+nkm7WKPqNxVrTpgJIcApuyGrxh1VWLeoOenmPYzyYttbJCCSHzBdEhA
         oLklxKmAiXMKxDHbm2UuV+5iL0hr4yeHVjUpHRlnuKyTEW4UPKTIblUPPxHepbTTyclw
         MXCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
        fh=tcmljap1mu5s88jwg+IJpwHE9P2SUqHM61Vp1uvOC38=;
        b=SdnSpyGpdOpH+EGtqk08WX8lSY6PsL0wdGIyqRPmGvjl9hdGOlysmbk7BKf1wQZeyW
         IPb//quNBuWWDcJDhNJtS//ZyOc78iio4Pf4M4t8/5lD4RbP+7bCW0QGcuCQrITG+3bo
         ora1wlc+P9sNb+NVKjwQkV/Uz2+r9UF1JBIKJrynmFNb9EPsl3KgMevC1fWm/cz1NYZe
         UtOtH5D5Z/nKNYBsh7ucm3v0kKEQYR1bkUM7Ywm+wGJioMDiV+L6AdeqS2vDmTlflHHv
         On8vVzscpf6eJMa4qRKJXZLC3j0iJ/cUYBZyL5DDKfW9WCkuGUO4XzIrqGf4SFhoYOKj
         K2aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793276027; x=1793880827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
        b=SdjNoLtW9qanoocdo8XfaenLx7jG1vntJFcC8DkLO+gh6BZGq+GtSu/nUUaUUAYTV6
         2zn+32xB2BovX6Y27RtIK/EOCo683DTCuzzCkh1N3PXsFycx0m5ifziqVf6DIcldaxjb
         xFeM6ZZLoJ4TY2/2Z18WlvenLwcZiahgNKalU76tqMfRGU/srBmlyawiUjXoi2bjolO7
         4GarBiynJMxY7rC17kv2QulQqG8X9H8zkpNGO8MErSx+sneTtM9vL705EE0XGqM6Lp1n
         sxShBlDR4AcyaoIZLOQXPB6Pc2aChpyKoUsoA1iN6gOHBP6Xmg9sukVA3i5IM8zab+dl
         uQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793276027; x=1793880827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
        b=oriJ2fk+apiOg1scizRj7qutuzGZYxJRMwcxnrL1sdnO5iX17TWzHrtxQFIC5jA1C2
         /bU3BtVLAU+IWqS/5+qQyVSplFKWWKYmGXt6cBde8JokFppkujguNxM+3hWuWWpitJLK
         DMhmJZ9IwJWdl413vZMF++AXru5zCnt+sSt07Uaqg6xetdUH4Z7j7d3lR88+Nxt9Gs/1
         9W4mhaLpBh6A+rB2KQgCng5mYDg8QVTNgQc8gWG+eP9jLBF48m8/Rm4wqy8gG4SJYeqx
         Sq9rBFxJcZlbBiy+tke4HJW9irld5CtUuOu2NeV8K+buExH8JgCNHYwvPfuTpWTkdm8/
         zLgg==
X-Forwarded-Encrypted: i=1; AKwUvBzBSssF/4xy/7BBsQ6IFCI5VZGHzfkxRNa4f0Kzda2Rje1NUiH7GIKNEi9RLMQJmJ6kcUsD8EtvaMZQoPc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKj46Iv/XkXHgHvc4uWY8d1UdLW8jpIxPnA7ZepdiIDlsXCRf07
	rIq1PJhGCdvDMU1/a8xEQh21fP+YgI+YGRlhTq0qYAion6Cc6/k3zm9QWndk3TIMcygFLS7tlDJ
	xE1WvTUHqffuJkGjQ49NW1KnVuC4FC58=
X-Gm-Gg: AYBFou2M+MXkWz6mEGOZTc5DF9tZY6PduxMwDLEUivneV03WL4MR4VjDrpOfIymrr0h
	L5NLBwa/bgtoqr3sXZV9pklGlb+lEjanu1K0j84+LdKbnrht181NAnROQz6Q2RGVadPW9kJJMXs
	Atha1RanTifWO7WO0ilzfcSXbRrG6ZKJn9fzosRS9W700YHeKP8g+5QH3pIyzGedNoY9ZwmGpHi
	0zNU/n4Am3fmXPBiy5pyUZ3PZTaoUmW/JxxL8bH3uLx9ONAwEzB/PKiFbqLreCYqHHqivxgJLmr
	8IYPoyYjP5X8lPELUO1shVhEpmxRBgHSL2SHpwK592aruDFOgecvyBCEEroFB2fY88vdmgVCPGI
	rQrr/sDhkAayhlkTDStmTZlT3g2+hKCRNqV4DaikVrTi4nzVs7rzTExFv1fvr1Jt443E9aD6e6C
	6yR3K8DOHMQKzBCw78wvf/ht4=
X-Received: by 2002:a05:6512:3d86:b0:5bf:b5a1:3c09 with SMTP id
 2adb3069b0e04-5bfcaddbde4mr1985707e87.31.1793276026925; Thu, 29 Oct 2026
 05:13:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
 <20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com>
In-Reply-To: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 29 Oct 2026 20:13:08 +0800
X-Gm-Features: AclHuK_9NKjNXktxauulycDv6ofwBJPad2Bl9GVrdKZysKXzXdts0yEdkZdQ85I
Message-ID: <CAJhJPsVQjajTzOwXyqUkdTT+Cw8wEX7-0NOS63S9cByvDSYLng@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dmaengine: virt-dma: share the DMAengine
 synchronization callback
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Longfang Liu <liulongfang@huawei.com>, Andy Shevchenko <andy@kernel.org>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Taichi Sugaya <sugaya.taichi@socionext.com>, 
	Takao Orito <orito.takao@socionext.com>, 
	=?UTF-8?Q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Frank Li <Frank.li@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 2:43=E2=80=AFAM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> Several virt-dma drivers implement device_synchronize with a wrapper that
> only converts the DMA channel and calls vchan_synchronize(). Provide
> vchan_dma_synchronize() with the DMAengine callback signature so these
> drivers can assign it directly.
>
> Document the requirement to stop the channel and prevent new callbacks
> before synchronization, and the context in which the callback wait may
> run. Replace the equivalent wrappers in the existing drivers with the
> shared helper, preserving their callback-wait and descriptor-cleanup
> behavior.
>
> Suggested-by: Frank Li <Frank.li@oss.nxp.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ...
>  drivers/dma/loongson/loongson1-apb-dma.c       |  7 +------

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com> # loongson1, virt-dma

--=20
Best regards,

Keguang Zhang
