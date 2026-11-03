Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793715339;
	b=rYaaKdBWpnKHgnCRE8bp2yfFnC4PpAOLVXis3cNpYLgwg3Nv/Tm5PKkmNPnTHY5tcJAP
	 8Try7RbquHwOCpNJ0Om8E7gb5QmRrKbsgAULSygOBv8UYwXruK4x1Le9/cA1HqptDcA4j
	 osIsALJT6XjjcIW25HfpfNsSaP84l1ZkwOOlxDgR+mmf6Os/Wju9Jx6jIdXdZNpYSxJME
	 tGL+rll8682E0a6eIUXieniescdc7YvOFYRFWyOipfj6gU0ITJZM1I+xO5K63q9hc3a09
	 EbpIkyRAX+sxUz9I1lkXVEWX6nk5Nhp2Sbll8hwEhhzhB28CLRvuwSIMBXPCVX4eO2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yDWpNrUsXpotQ6nNGJk4nYnh93lFCeEGbbdd70BhOpc=;
	b=J4nLChC7U9NAWhS++Lo18RYV/0i2EFKtWYPFrJWW8izsYHz4ABzsGE1vNEa8TWt4Y3ZZ
	 OZo5bQ2DBXQCwJkB5ryWYs+XkJTVkre07fV0Gigdck5y/SL93mGSAONxgIXQR9I7Phnw5
	 GJkZx2Yr7DGGevg4n8G5mAC80Ie6Y6ci0KahffUHBThIJH4UnEapq1nTYSx2KMxYq+zR7
	 uQou+6Fl+E64XoDnI10FGH5CTqDaALQnIQi+q8bv+pc/L4i8TuERm+tdT4U2di8TbvJoj
	 W1NY8fMvBKnV/q1nSvkYmHW67xgR+i1+XSpUih7YRpj/EkYPI+bEKqUTLUluJlKUATQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hUOlkfG5;
	arc=fail smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068FA606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 068FA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hUOlkfG5
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so2536367e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:15:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793715337; cv=none;
        d=google.com; s=arc-20260327;
        b=a493+jL1rN3DxMXAlrlITYIPSd/DEhE8kIXprZlf2/ypKvlVwFCR4nua1G91Mw4mMg
         LtjyebeizeFLa+HgnFqDLdJTeijeboOuLcPZSgLjePxPV0tjP/GQ1qWXF8ws5ozLNnFk
         lem5OWVy0vldVWowvZccvC9eFux+Z06sTFIzINYZz8LZf+ojD9JLYyst4FO1w5sV/pw/
         0AvKKsTq54M/90J9gTlzId8bLP1EP9kTG9Qm4dB7okjWNfiYzpWE3uYKxhcW6Nkz5yWz
         QDF90McdLZ/zGcBtt7X4dxMB1Ko8Xv872N4NoP5+JaCz4lvLqzEcRm9fDKTMKBX0BxX4
         bm9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yDWpNrUsXpotQ6nNGJk4nYnh93lFCeEGbbdd70BhOpc=;
        fh=1o68a2Ic52FWy9sQoPOa1PwkRiO0sqxxBwaKH6gcxL4=;
        b=Xps9AZXWhChb1EgcVm30Tgpv6zXNuqcrGv0c5opcwpqujUA8nM+Os2NKO97gxgCzHF
         NmZ7AKosq6/H6U6WyH/3q00+axuIouf9f0sj5gDgkM5uc6gpMwT7NJF0kE8LA92pA5IU
         ibz/aadzIKu511HdnToua/1wmJd/5yCp4EASE5jHqUD5HY/8YWoQw00TBZUFfqDoRE9d
         EyS2lVvwmsf03DSLjPu2EjrkAa1ImIQM7wS1I4USAQ+oMGmobGIcUknirsWUZVPjjk9x
         WoSPQbos3MYVIz2awN7jyMfFaQ14Z0b+MoWPMe04PLVBXSiJDIC0khYEhhsvUQxoaFXN
         ausw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793715337; x=1794320137; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDWpNrUsXpotQ6nNGJk4nYnh93lFCeEGbbdd70BhOpc=;
        b=hUOlkfG5WAMcs1RconWNpTny3UWvGBRJKYPQV6YB0NHk2a6fzbaDGT2sr2+zJg4h29
         JVJ5K+cjpwamivKJIic/018tnkPjWwOVO8qxkzxZuT6FCpmYyIEprc64vIwx9FwxRBZM
         ciBMVX3FB5b9syVFwH3aADqvk4k/+I0WLahTZkG51GFYrbPYy32g+7ked9ewIZkBJsAc
         m6EQu6mOii+Ulm/shipEvCO0e27F00Jgpvix3FlBFTxBs85FG90sWB4014WevUtKKTvo
         Qiypq3AVWk+DshEj6fYkakDsw+Y7a3jB9hLiYHue8PSw/uuIS9LVcILHghTxFym8HSDE
         6VBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715337; x=1794320137;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yDWpNrUsXpotQ6nNGJk4nYnh93lFCeEGbbdd70BhOpc=;
        b=oCf/Rj4Ip/eT3eU687x4oO7Uct2WLhhVB/hKBOxcJYP+FNwtwCA9JDOBg8IrrXH9h6
         tK0ZjeWGwdqfArESsE3T9Xra0oIlZRqUYEykQJDtfykHHoxF09eyhlw6ykndJ1E8GbFE
         eph53bQuyAcCqirBHPOfMHLhULKphFMm4r7jqzX6YqHVctXbRe7tPbi2MLAV13DRuEXJ
         OXL5Z50SvmKEQIv52WIbkq8Tef+v8ON416EnO6ZNlLgBY8EqL6Cu66Rb/Jd0jNafQuUP
         C1S5MSghNm5R3SCNVcH6qzSRGHHh6c4FdKh/Os4hlv5Mw8QpToAKe0ol3BukdNicsi7E
         IIfw==
X-Forwarded-Encrypted: i=1; AKwUvBwNYVSO4x0mOXk9PcTUFvd1lYctoIS7KQLDRuuFDX7RCtLOJoRhW4GfD98wmwxQPp4yAppZP+s6zXlXsPI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+S3jM/qSuUs2HOaQU/SgPigyWcyyyTd2vqaFz/ZjzuKzDkpr+w
	mtIDazro/MLc94x6jf4foB4lfGnNXd1ej+iH54TUZxXZcdDXQM8TYi/waYPaG+c8kTQYz05v8My
	mH5N55nG/Pi8Brap7ePSW7zBhDVOAhKc=
X-Gm-Gg: AYBFou0zowPnKfcR6mmy11LFBUvfSV2re1VKodt6KHLTeT8CZdVOFSON38i57wrlCxm
	k2+nVoWk+fIv2yUsQGNg3yQD9rvmSReDEbncmw079VELWSHb10DnhuiBJwrwDlv42K8VKYQROC2
	aRfcDVE6ftXq9DE71Moigo30jJRprEofC3OlqpU4/7niQAhOQCgYxgpIx9eX6nvXZCfot5ntAyB
	jow1bx8ynlH8kFinmQokYuIN7d5JLfaC9FmGSXGFBnJeG3Ia+w+kLJjMORul3HEc3nZTPHw50XW
	oOAyQmMe6I9fa5CP74Fqp3ISuz8czMVHN5/FieBiBiqTgTvU1SKQ7M1x99XZxM3sWVZroGi0RLY
	34GW+AZx6y4Qxh5l3Ub6jvefxSTNYhPARQEJSlJVjmG2I/ZG81jLnEYt1C3geYty7ZzpwLsJ0NK
	fxqxxHnbsPe7weJoH2ZKphxS4h6AXVxudsSFxfBtxiXNFjkiXVO2LmdUlInK037hSSYa94vqqBQ
	e95+fcoR/VSzg10vfFlGQg=
X-Received: by 2002:a05:6512:6689:10b0:5bf:db9e:7520 with SMTP id
 2adb3069b0e04-5bfdb9e7553mr2538316e87.25.1793715336819; Tue, 03 Nov 2026
 06:15:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it> <20261102-remoteproc_virtio_map-v2-8-26b300e01c62@valla.it>
In-Reply-To: <20261102-remoteproc_virtio_map-v2-8-26b300e01c62@valla.it>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Nov 2026 11:15:23 -0300
X-Gm-Features: AclHuK8cFyqPPDbhURLrOci--cGby4Nti8tUDUPWT8TrjwRXBOSlhnxIc9j5uBc
Message-ID: <CAMAsx6dogk20pTtpGaD_Ci2fam01UuUEe3KXDTH7UVjwRBRqnw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 08/11] Documentation: remoteproc: expand virtio
 support section
To: francesco@valla.it
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 01, 2026 08:28 PM, Francesco Valla <francesco@valla.it> wrote:
>
Hi Francesco,

I only have a few language nits:

> +supplied by the remote processor should be marked as dynamically allocable,

"allocable" -> "allocatable".

> +try to allocate it using dma_alloc_coherent(), which will resort to allocate it

"resort to" takes a gerund: "which will resort to allocating it".

> +either from the first ``restricted-dma-pool`` region associated to the virtio

"associated to" -> "associated with". The same wording appears several
times in the patch (e.g. "associated to the virtio device's parent"), so
please fix all of them.

Thanks,
Daniel
