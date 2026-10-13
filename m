Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ED641DE0A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875688; cv=pass; b=QW+NRwvB2yy72Y2VJfVbJSoQeahPRWrnELKP3naUyqpUJnDUzcFxTfJqSrQn5F93UbW1jU3Q695dhsxgxnncvZ1xq6HvQexcOM7S6gVokQb1SlGt/LTiDqhr3OWO7iACzyljYWMhZWG913QIojwMJkNqelnZlc/g5bqslVhFXG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875688; c=relaxed/simple;
	bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DAZnqO25D0qWS/MGSxGhoF7ijJmBYjC5j2g2AQ7H2daVj1pW4RZCGIZaHjsnr77p9rzkmeyG1zFykge2vRe7u2MRgrML7yok/TDpm89uFfwzUppM0p6CTUWZ0M1iYX3fxBSjw51twSyqO7MvxkMmZRFQ4sGGpx6n2LVHUocg3pU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gM2OZmHe; arc=pass smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gM2OZmHe"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7fccba9c675so5629625a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:14:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791875685; cv=none;
        d=google.com; s=arc-20260327;
        b=Q086PevNJ1zkgLqFZubeqjRIMH/tlXeSqRDYxgzl5Ok+OPd0PABNQJapBJzZcjX9Tf
         O1+mRPaVQpfd6q0+31EIE5o4HD/YGac4zlAyk909llz8QFwGlLXOt9JEDTJV4nVQUCT+
         fzBp53Q2GXPYSYwwWxelCI1VbWQlICeOTLQpWGiwgg2+lnkci4ZzOixE1SSQaiEseGAO
         lmta4abGV9OCUrN4gSkVKPlpVTB8CQRgsaJm3Z079KX5vpkZMxuuOMQAu6GfUg3zuww1
         XlTrhy5ugtsBK6110ASVKKGo+5FycYxe9zcNy08DErrRWxOvP3IefN+LZWaKLHDehGYM
         pOOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=;
        fh=zI+3jt3vK/uCgS8ncNgcX0eiUdWdj7DddzDRrHJ9/zc=;
        b=UphdH1+5CxoE528VdBhDNT8+zBn639dkEyIA/JceRWd4G0pOJEx+KhBLSasPH9SxB8
         ZVR8G8GS/sEHuWLOfVnhfZ4UaSEDhhZ6PmS2DX7BdV4W7iXC3fQtEaAkRxRnScU5/9su
         I54Cbs56o8229eHrW45HEASTKNrGYw4msMFajfjGnzFe1CpC6JcKux/+TFAo8nFfmVLn
         f1J3K+WR1mE9xQCRBwC4plGejYQsFNftZodEkJ1eTuGKogj8i47YKRZHwXiR0QBDVlz9
         DeeyUrnepeMVE9rCN9OGTHUrJ11RAjpq30q6+u6VgMyg13bnxmPA3g8KEfaBxOuukkd0
         SkrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791875685; x=1792480485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=;
        b=gM2OZmHeiqL0xiQxjAAqlsAzVMHrKVPK2rU0w4j1ofH6x5oIWWQE/8SdowtSvQE6Cr
         +5Mt/BOyAsGiEwR/zTUHoU9/Hy/JH0TDhQI+X3tlIt3kiZXrfmzT534KWBSZ2hkkN4MU
         klHALIlA0ZemLbRTZlm8Oj891qv8jdwIMvV7ohiniZSrE5TzIOOSnEj7gvaKCpXdzEgs
         lh+wtVbK/RwB03cyoRwNdxMIf261jTq6aQCHBhHLemDPFHkuNpN8e2zlKsinJHJ+Ckvl
         f/9uR+Y3cFBs39F2zA4Jw430o/94XPaVNCZgLMWGkxSHhr9XzFWd/S5xwyVv3nCAGGdQ
         hhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875685; x=1792480485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=;
        b=vsXW6Xr2xKsMUAQGpcXKDF0kUs/YPo9gt9Uaafi5Ak6SfRHtMGMBlEEq3yuel5P+7g
         kdcqOLCGApiiB5r6J2XJy/Q+74wcit8rNgX+q4GDSMysOM/8t1UeJoTRl4dnT81IhL+u
         HkkKE21rZmCs0MeGAqbPGozNF33wCm79JcE/RcXMEUWX35ng/xgwcMC2dT2e+vhDpFE8
         I9e3SQ+hdq0JeOWyZAHFHygoPk3ihhU+5HcjrBvvFMp7VUj4E0piiKXBPOA1dEDI6NdC
         UxuTuu06sPSlKZ/DF1VJPILJ8BUAPvvbbo5GWupT+M1CLWt6uncMZBkZ1wcnJ2QP/3mu
         ZXGA==
X-Forwarded-Encrypted: i=1; AKwUvBynhcxbuH9yaHYa05MBY9Rji+E6cqB/0nwIMbQOqNxK/1dM6DzZ9owVsifqtYWpG8+4B3kpsa8RO1zw/+0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDumIw3eRFW3m3XT+MdK2dflhzVWcAnNOADqKaXGKVB9YGWlZj
	xRHoiMQd6gZAAFkb/RnNpzQU8g8ubzALZglTvKCncoXINNdviDSER+6+cAWzolSpm8lWUbFweKG
	pz8YPRSnazAnWU/FQ3enqM0l+gHQEj4Q=
X-Gm-Gg: AYBFou0DjMc97v8UUSucqtClJ9MAVFD00OglT0kjwwHvbb0O5/UHjDL21wAxoSY7mrG
	sSoXu+4LyXlLqWr4lCtv6ThiYs2xKS8ek9X0VXZ/2mBMvveWEnqbbBDrUPUDqqAhd7MdoFQif3S
	akjIE3auYYvuvp3ozUWHcXJXeuIqqIesBc70altwDzbDKQdHC67YLSh0KnH93yO4s+MJrMvIRKD
	HPRmG4irMESPhHLYESTjiltR0omtR5GKqBjkL6ziHQKgzvd0H8HKkj98wVVHNuIUxW24Z4bUzDZ
	B5o/Dih0ebHRqphyeGB/df6wUud6WxTuV8N+NLGdg4zn8tuqaaE1oTRG2T7HbVHeHzG3htORRzJ
	eYO3RwrgdOCoEx8xUMwIhJuF56d+eMRlgB5GeFgfWQ+7hAqTWvC5icIC6QRGK09dCRV95k4wxv9
	LwZsm2xNNFrA9Iov7ORcqd6u6YsS7bXJJk4/3/oApaZ6RocDwSIfk=
X-Received: by 2002:a05:6808:30aa:b0:495:ce6d:7d48 with SMTP id
 5614622812f47-50c4e67cdf5mr8677005b6e.9.1791875685589; Tue, 13 Oct 2026
 00:14:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-9-7b47ed6335a8@gmail.com> <3698d260-13c5-4050-8f03-61f7b7185514@intel.com>
 <l_pd6lBHQaWNYoohhfxhFw@gmail.com> <8fcdfd97-fcc5-4ed9-8a9a-3e7eac53fed3@intel.com>
In-Reply-To: <8fcdfd97-fcc5-4ed9-8a9a-3e7eac53fed3@intel.com>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 13 Oct 2026 17:14:34 +1000
X-Gm-Features: AclHuK8TJXmdm-cxsbCKrijwUibcd22A39HSUGZRpbNW3PHDJmMdVBEajRXhBY0
Message-ID: <CAHgNfTyTQW2vMieSo+U7CTTuckrLZL+PuEKXfKCHYMFDBCFWng@mail.gmail.com>
Subject: Re: [PATCH v2 09/21] ASoC: apple: Add macaudio machine driver
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>, 
	Sasha Finkelstein <k@chaosmail.tech>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 8:03=E2=80=AFPM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
> How does one know the speaker died? Is there some kind of signal, event
> or an interrupt we could depend on? As delayed-work is a mechanism of
> choice here for handling the case, I believe there is still a gap and a
> chance for bad things to happen.

speakersafetyd is a userspace daemon, not hardware. It cannot generate
interrupts. The daemon puts a magic value into a kctl every run of its
safety model to signal to the driver that it is alive. The driver checks
every time this kctl is put (see macaudio_slk_put) and schedules delayed
work for the timeout, resetting the timeout if the correct value is put. If
the kctl is not put within the timeout (e.g. if the daemon crashes),
it locks the speaker amp volumes to a safe level that will not cause
damage.

We do not want these checks running when the PCM is idle however,
so when there are no longer any active DAI BEs, we disable the timeout.

> Czarek

James
