Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19D6347C6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790572914; cv=none; b=WbQgCPl20mH6FBs417C0WJqzZINzUQyTXQR8WwxkflukUMKmeQt/mq21jiyqsmRP/dNsIBTg7EGeBxwTOB5966hMs8K4UuJ2oP3IBfoKJeXaNxdQReopE1GhgrjkTy6h0QmuF96m0IwuKtxOiQzvhvwTv3aGYjMo5kf7U1HICoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790572914; c=relaxed/simple;
	bh=NSgjgIxlZWIP91WRA68CtWz6iKTotqGWktSzB7+lfPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oof4TqLxk+X7HhPH35NZsokRi4ECB4MLxweZaPl3cD2BG449aVW1S+c5IEOEuCr7nlquOwGC7f+CUzuFueOPiUBo5P/ioeqxQV20s/4h3duLuzV7dH5PGrJNGRwrP3U/NusvuvPKz80Zvb8vZwxt2llGnSKvXWXpx6uNjOKPBuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=h6tzgx8q; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="h6tzgx8q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Reply-To:Content-ID:Content-Description;
	bh=NSgjgIxlZWIP91WRA68CtWz6iKTotqGWktSzB7+lfPw=; b=h6tzgx8qZTPckLfOqRI7EEubF3
	6GL77s+pNOiJtc1K+lkLJjnRUrqM9D5UB39t3RF+kAwbWL9LszJF7J3BCsjmJm6xTkDWKMsxH4x2t
	9gH9fZ/CFfvqz2RlefvY8WEKlOiwee/2i/di5odjviFVDyVd1y4tF1bo6Kz1gaqkPSSOqyd7FaLc6
	jv6eCwwAsZGiewidIA5/C6EvIG4yqY/ITE3GtoB37xYS87SJdACpXzK307NDLcNq0CiKl1aDK/HGk
	bqe3RuRjc5kWsh39ej+UJKI9H6DTg/yuRUGStpxX5RVhCuAVD7jdUuuWe3cp/wWLwtvcqit8QjDGh
	j+5fpVoQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	(Exim 4.96)
	(envelope-from <domibel@debian.org>)
	id 1xB3o9-007OdB-04
	for linux-kernel@vger.kernel.org;
	Mon, 28 Sep 2026 05:21:45 +0000
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-881a3a28e72so341493b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:21:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwN2hMgym4XeDij4iO+Cn+hlLYCnL3ka8Rzh+A1/am4+R9FOK4JMIjvIKPGSTMUKUi6iv1tMczckh8e7DY=@vger.kernel.org
X-Gm-Message-State: AFuF++ldskL+Ff9GQ/fbdmHxaqWH5b1YlVNOWmX56DITB35lgOwYS/Tj
	WQ/uuqUTPm1qY+91n8BO+noKYhxf7FBKGrHy38qbKCyoDNFmG3TiVIsGRFADngUF6P3I5vyvOmY
	QCmwHKuuHQ1NrSbIK0j6X5NFsdfmoMKQ=
X-Received: by 2002:a05:6a00:7096:b0:880:dfaa:a6d5 with SMTP id
 d2e1a72fcca58-880dfaaa996mr4280850b3a.33.1790572901657; Sun, 27 Sep 2026
 22:21:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505042631.1916555-1-domibel@debian.org> <8d1e3735c40b452f7ab89228ad5a0040f5f41b35.camel@iscas.ac.cn>
In-Reply-To: <8d1e3735c40b452f7ab89228ad5a0040f5f41b35.camel@iscas.ac.cn>
From: Dominique Belhachemi <domibel@debian.org>
Date: Mon, 28 Sep 2026 01:21:30 -0400
X-Gmail-Original-Message-ID: <CAAvaLCy7jC-jFM5ZpPVeg7gKpweAW4nPKn4HXR+xpqUHD2soXQ@mail.gmail.com>
X-Gm-Features: AclHuK_UWybYUev4CCs0rM775Ij7Xct5Xij80ErUW_bz9ilg74HVWT_ebZnQGS8
Message-ID: <CAAvaLCy7jC-jFM5ZpPVeg7gKpweAW4nPKn4HXR+xpqUHD2soXQ@mail.gmail.com>
Subject: Re: [PATCH] drm: verisilicon: support non-coherent DMA framebuffers
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Simona Vetter <simona@ffwll.ch>, 
	Paul Cercueil <paul@crapouillou.net>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, ganboing@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Debian-User: domibel

On Fri, Sep 11, 2026 at 11:33=E2=80=AFAM Icenowy Zheng <zhengxingda@iscas.a=
c.cn> wrote:
>
> I am still thinking how to decide whether to use dirty-tracking-based
> cache coherent maintenance or writecombine/uncached mapping.
>
Hi Icenowy,

I looked into this again and writecombine/uncached mapping is the way to go=
.
I used Bo Gan's XPbmtUC series and Michal Wilczynski's jh7110 display
series and finally got the integrated BXE-4-32 GPU to work.

https://lore.kernel.org/all/20260316060328.1173634-1-ganboing@gmail.com/
https://lore.kernel.org/all/20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@sa=
msung.com/
https://github.com/domibel/visionfive2_gpu_bringup

Best
-Dominique
