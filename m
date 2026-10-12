Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5926244F557
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795429; cv=pass; b=NNZ2RCNGTx5+Iu1K9+hWoYQ/VW+lP+kqy+IS3Sn15DkWXeUrvgod++PDqs+yoaPujjPLhDzVl+C1e2Gh/WR8yTLV5NjtmTiUaaCBMP7Hk1NDSmSFZWI6jP2tS/MrqazG59gY/28b/L0aLqnHqK65HfDBV73053n80rBU7SjEWCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795429; c=relaxed/simple;
	bh=+hsanqcaRD8wERt3PKwcrFG5KTWWy58uIS8hjI8nI1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DLzd7ZrDb/eUBmUfLgNg8HesrveIPB4GHuRrH9/u6XN5gkSPuf9IUBf6HZVpem9wDjpiEkKFBmo0QvBr3KqsSB+qMGYLuWKcbBeCNtsB3NZXoxnoTSt/V72Bk2ynpxFG3cU8vXhSdYezF4DpP7kYof4v2A+UhV64pfRlxjlAvjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+Ara6So; arc=pass smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+Ara6So"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5e507e778e4so525487e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791795427; cv=none;
        d=google.com; s=arc-20260327;
        b=CSwIErh5YW4gyqyRy1AYxbcpq3+xviAY2N3EkCKGONE7C3MT/P/ekr4VMjzi1khnS0
         /A158Qeb/Q9z+fyHRlgXzrqyKKv9Z4uT32NrBGjsFFozEoBqszbrh46gs4mNjdJtYiSy
         lxSbF1aIGPghGXLq5IVk9nv9WUtymXUgbnomAXIi2/wkNGo3H9rz/7Wra5eeYDYbTGNu
         +EyoKpa0SCeXfvCoSoM/AKymAgIgUTRGleM7cqCwommDzapb0yyek8LKmRtW/89ohMcG
         ix4Kks42WlPspNMNZw+rdojqKjj3KHTDPLyd8ccBiMi5gd0KmpLeGVxEbeL9b49Pe0Am
         liRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+hsanqcaRD8wERt3PKwcrFG5KTWWy58uIS8hjI8nI1M=;
        fh=DGmk4xW251MoRUGCZ11RQR27KlOYo0yjQqPvX06zrI0=;
        b=N+pV3jRTPpFUWBoyQbtishQblwyx69X+SAqCoobUY6HEZOLGVHVANiYLaWBDYvniuk
         qsefJpJBDMQuXoy8+6qifxwOIFk1BOAohYvxNZil8RGyeLRnMQpGpiJJy4X53wtil7hw
         ajvFiGKxgStKq7M/mOHNPN6EAqwifcI1HQC5Qqv0bAavU6Z/PoeDTYz4mhjJXC2D0zZU
         K/UQgwo10ekROXwxgtrEEMAOdNHGJ3rLgkt1BF0gLvYZHZosK15s+FQ6bTCUkvc6g7Gq
         d4xTMDUCV42V04os8+HSdaPqXk/feDLFVWYjNpPVHCO+GzXyiEJjMM6ydneQ8E/TBOmC
         yO6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791795427; x=1792400227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+hsanqcaRD8wERt3PKwcrFG5KTWWy58uIS8hjI8nI1M=;
        b=O+Ara6SoNrBB2FSBPPX6UbK2RadUgZI4KQzRClFwS30a0geXziEfj3kRXg0u+y8Kqb
         Z6pqPkVuZFvLbU5gM1MPdUIAAyEd/FUx5+hwim6CCVH/gK1I+UYArcAHw8uJNAg/LGKZ
         XxMgtsMQ16n6I1M+znEzd/epzexWCRduiGdyA0QErbhNhaBQpr4CEH+d6lzm6Opcm5Q4
         HjSeDw6v7VWCy+tR9BkREUu7t7CgiEdXU9aJi9IMWVTO8a/IhoVs4SvEAhWJpONfrW44
         +WVrEQzXBrCnpSLuXTpSuqFX4HYkNPhr8FkSbfbFKmzJXspcRzCVCZCxDGn99EaFlPJN
         Tc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791795427; x=1792400227;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+hsanqcaRD8wERt3PKwcrFG5KTWWy58uIS8hjI8nI1M=;
        b=ziIxK/myn1FeMbnyqv9UP+G+9x3TCEejuUiBjHzS5MXGhMQs4Yg+M+9DKr+vUn1vdc
         RdY/s3n6DWVXvSYu+raSgnrVH7IRnCetq9P3H8O/Nx69KOH/nntyPX3HNBNV9kEPIBII
         IeRL5vCi54LQNLv0ORkCUUogeBPE8RNgZEyq9S1kxY62OIrKtX9Ehq6YJrazmLuN65ym
         nY2zJNVIxicAzzUO3tmHtjrru1nNt80Sph/7/k+nXH5LziZIYWHO/xKo6xZHlbssjchS
         xzfgBB5e1o9K+JjXzKQvWckCt9R9T+zOw5Oem8G5vBmOxwHAHEKa9s9SvFiuQvUblPfW
         CQeg==
X-Forwarded-Encrypted: i=1; AKwUvBznuv08O4mjNiaRF/sWxVfYmkYTjqyhm4aUWrtnDQjpiUsdQvUYxBjkWx/dENNr82W9Or9yEN12tznkvs0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJetyYAhSc6XIv/t6bc5vroUvQamQhxeaZkj907xS3BBMTBOtYj
	Nr0c00pj02wWf2sZPQkPZpu6OrGvsdIpsY05QyBa5UrisyWu4ZuTTcGA/qwEcPJNzA0Dhd0ENOA
	9C+sNL85ZrLXNOiPxRNtbX0+N3Z3Abu4=
X-Gm-Gg: AYBFou0Nb7Tn6UTUlkDVIhLbwK8WoSSsIQw5JpdtAt+uEvfbFv+i7a4t3l85oKotYDn
	rCOrZHUWQNoRmMUAelTyVSsXbTzwNpcNUpClTISl7PDpLnD4Pzz1Yx1aOFGEFhkVYwOmrHRWvkg
	9xPqhM5L2tYmCAkp1aMPyJRN9oh3NmlFci6vZFmt2W9AFB1W789dPh88fDY2nevt9srXv5FdH7C
	g4dRogZiMpZg2ogecu+ZPChJFdxpz5slQI76nItb4XDCgsZRn2lNYEfPfizAIXybx6n/fHMvxdg
	FoDVHN4zNYPTHQiZhUnZiWJLYwXJ8faLZOlsamikBMOU375zpsdApueo/hcWkAqDLOId7dpIrvS
	r7CMsSoYBtzF0oLGUnpxat6HXKgEZDnHHxXvGsxqimrJJzcuZVgMSzcV1KieG8SGXpJb5IC4TGy
	sfFGcYW9hjXfYtCH716qLdtWjTpCRuMzmBQxE1NBio/pQj
X-Received: by 2002:a05:6102:80a3:b0:7af:4843:5ec9 with SMTP id
 ada2fe7eead31-7cb3728268emr2044842137.8.1791795427219; Mon, 12 Oct 2026
 01:57:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
 <871p9v4a1x.fsf@bootlin.com>
In-Reply-To: <871p9v4a1x.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Oct 2026 02:56:55 -0600
X-Gm-Features: AclHuK9PgSRU-9yDfcYymMtt4yQDEEGqg1HXAOlwk0cudjnkkhK9ivdvdn9hMz0
Message-ID: <CADvTj4pZEH2wj2aHSL+S+jO-MeFjRx+XMqhv+XGLiiukvf28vQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 2:06=E2=80=AFAM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> Hi James,
>
> On 14/09/2026 at 15:09:46 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > Allwinner NAND firmware leaves the bad-block marker in the randomizer
> > data stream. On H6/H616 it also places all protected user data before t=
he
> > first ECC step. These choices differ from the mainline format, which
> > keeps the physical marker plain and maximizes the H6/H616 user-data are=
a.
>
> [...]
>
> > Assisted-by: Codex:gpt-6-astra
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
>
> I am sorry but I do not want to proceed further with this series.
>
> Even though I am not capable of finger pointing what is wrong in the
> diffs nor in the commit logs, I do not understand most of it. I cannot
> clearly explain why, but I have had a hard time trying to understand
> what the commits were doing. The risk is that nobody would then be able
> to further maintain this driver and I am not willing to take that
> option. The kernel policy so far has been to ensure readability and
> maintainability, and my gut feeling is that this series is going
> sideways wrt this major constraint.

Just to clarify all known real world usage of these devices requires
the vendor layout due to BBM's themselves being randomized.

From a practical point of view I'm not aware of any way to avoid
this constraint for any existing hardware.

I mean, without the vendor OOB being in mainline it's likely maintenance
will just be abandoned due to the mainline driver being incompatible with
real hardware so that doesn't seem like a very good tradeoff. As-is the
existing code has received very little maintenance overall likely due to
this issue.

Is it better to have a more readable driver that's effectively non-function=
al
since it's incompatible with the hardware or a less readable one that can
actually be used in the real world?

Keep in mind the patch adding the actual vendor oob format support is
only 270 additions and 10 deletions and is fairly cleanly separated from
the other format handling via the sunxi_nand->randomized_oob flag so
I'm not sure it's really as bad as you are making it out to be in terms of
maintenance burden:
https://lore.kernel.org/all/20260914-submit-sunxi-nand-vendor-oob-layout-v1=
-v6-13-2fb084fe0751@gmail.com/

This code may not be the easiest to understand without LLM assistance
since the vendor logic is somewhat complex but since those tools are
only going to get better as time goes on it seems unlikely to me that this
would end up being unmaintainable and regardless most of this series
is unrelated to the vendor oob format and is just bug fixes or optimization=
s.

> Also, from a Linux kernel point of view, we generally just do not
> support vendor specific layouts. I already told so Richard Genoud back
> when he was working on H616.

Hmm, I'm seeing plenty of mainline drivers with vendor specific layouts:
https://github.com/torvalds/linux/blob/v7.2/drivers/mtd/nand/raw/rockchip-n=
and-controller.c
https://github.com/torvalds/linux/blob/v7.2/drivers/mtd/nand/spi/gigadevice=
.c

> With this added to the pile, I prefer not to merge the entire series. I
> can still take some of the fixes if you feel like they would be relevant
> anyway. In which case I invite you to send a v7 with just the few fixes
> you think are actually relevant outside of the randomized layout
> support.

Patches from [PATCH v6 11/18] and earlier are unrelated to the vendor
layout change so you should be able to take those as-is. I deliberately
structured the series to put all the bug fixes ahead of the vendor format
changes. The ones after are mostly just optimizations that didn't make
sense to implement before adding vendor oob support but for the most
part probably still make sense to add either way to some degree. All
changes
