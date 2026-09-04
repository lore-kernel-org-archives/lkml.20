Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1A546AA97
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525932; cv=pass; b=h3Ts3gY1xpiUm8pgU3yZq1IJcRZp3ur990LnBhniLm0Zw5XE8DXfHIHG8y70xeweLmxBqRf3+2p+eBYLhz2rLqRSLLrIpHDF2coYR3gz+epoHwzgnYkRhUpTvr9LQrmwv0zzEynwzQaZUzQIoafYmq47c3Y22ZAsgFJN7V0FXZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525932; c=relaxed/simple;
	bh=SzDs2yWMGbqw4SuOTjqilOjXglSn17D0yFwlVfQoGko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VD/XVhzwzn3tsfuAENT/SxS5oNAOvHlUH4rjLJ4LrHRsfNAzH1r4YR1Xx4K854JgLi2Zo14Jc6IbpPYggP+FPZWWWQM6mLkVz8/hXeyt3CHm1bqigSTZsh7EeUaLvYI4dJLbhuRAW0nexw9PC4G+Q4ND842Wm7vHzaPGtYX/t3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nlj2Z3NM; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nlj2Z3NM"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c255c58156bso178619366b.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:45:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788525930; cv=none;
        d=google.com; s=arc-20260327;
        b=ODGaFC5x24DDDg64oCpYqS9iZaboMHrWlnaBdXITiG1s1EF8gZRgi2A/+KKJntSRfQ
         o68x0nWt5+/i5r632lteOF92TnQ2k2B70b/Y7uBgmwZyQ8R7ZWixJ6YaCWAGlKYTz0Vi
         eSUnADYVZuI28gbeCE8+EYPzZIldLsbBpGt1rXpcg7ictsKGZz9ue80//pxFi9IF6+ka
         frWh+BLjADmTaRjOO6djOFUHzJGoKiwpREdUtAGXyo0dWVj7my00xHrTjTxp96MxLu2d
         IsNeNuUN8CXI8ghnRp0kIPB/f2Qrg4Py63slJ+v+zJceZFlzHBxWz0Rr1Dljblr5ReEg
         NVaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SzDs2yWMGbqw4SuOTjqilOjXglSn17D0yFwlVfQoGko=;
        fh=YG4b0GBipV9KdTUKlSok1l4SZwoZw92AFFZexLe4jsE=;
        b=Ki3qGEOi8K6+qPYI1801y+w0dGwXm5zXM3n07aZ6Xbqft2k2ApZsw12P/uNNEDJWaf
         8LA0l55TJ/LEHyDM8GVK3KUtZ8WxgllC56zsLG/li84Nb+QejdRU4yXM556PeaC/nbtm
         LlgqC4KZeDSVW8kgtezKGsQhznuPrE0cVBV+fkPCpuEU56iMnPHQ4vGMIw1ZfuU2vS2E
         VcTaLLTgx+ziFvzCnMGuU357rthjqV+JWZ5ShRtkErUhiz0meYPLLYDKmXJ9VV8AiqLT
         1KyIE7b5SXM5QHGOuoiQh8nhG71zxRWBif/eaz2yoXz4saGO92WYDyDwKtGpf/ud4E51
         eyPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525930; x=1789130730; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SzDs2yWMGbqw4SuOTjqilOjXglSn17D0yFwlVfQoGko=;
        b=Nlj2Z3NMP945vYPmFS8A/T+djK5rR0QOM/Sf77FlLxxYI05mI1l0HnYr3Nuce5iSRO
         QKeS7bHvw6LjQfqEfx7Kt12GPatAVlpUaUXz7QT3xdTOm5p7wX5k/0uI4vGuzvFVmnIi
         Y2mH+HtMg7cSKyCxrFTiTSbSKon1wdYgt+HSH2v4ORuB8vU2Md2By3TeX21e0T/8OdAx
         A6DaW85w3yMlHgKOSd3JoUqx8GImv1rVtR8W7FwtyaJU6YglUD2AAXO7Y4O3Y4wujYnT
         cTAhkV3RJ3GebedisXrFdvdpCJ5VttrjAEO0NrOvFgZsri4RSE5vADGdpYTomFt5os9X
         uMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525930; x=1789130730;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SzDs2yWMGbqw4SuOTjqilOjXglSn17D0yFwlVfQoGko=;
        b=Nvt09WbL2Fo2KYXRJFW+B+hrlZDl3+IOKypfJ5OilVb0E6c/1Y5uy5y32QQuIwfBUo
         4sppe/qnNqFi+oqhcWUrdIcHuLWf/hCEJRsRVuiruW7nxmIDSh0W5Kph/EOT9yJPnmTQ
         nKS43QMi+7EO0zt5puwJzxh9ZTZeawNmHSfBo8v3G9vGqAEQpFpFXY7OinRTod5czQ4y
         Sa+ZKyZojdWxJKo+xJhaCFjuYp26o0N1HNSbMvAz2g9rOaTFvbkjjsJUkG91pKXbjSL1
         nUxkUFoWb5EJ0S2K2+zX79s+IUhU2b5OBKDanEZy5no8QfCY3WixsiE2y4c0G3dS5tTA
         hpKg==
X-Forwarded-Encrypted: i=1; AKwUvBy4D5zwskut6gVNw8Ve5uzeHIXO1u8NXtnuX9HhyI3I7HPbhT9o5rhCfAr+h1awzJcmOh5HkM+oyCsr6B4=@vger.kernel.org
X-Gm-Message-State: AFuF++mY96JsIq3wd7sF+nUryLEGBZEbvsVylhu/RRxM1DZG6tiGXKbj
	EgOGuIae+vunzlXX70dtyWg4I4poYP45CtiOORKJyN9j21bngzSxmTq6WKwKbw7dZJBTZ/QKFJB
	/+dmOeNYmh8Eg524TiKBWkFtU/fvkpl4=
X-Gm-Gg: AYBFou3wGch1A2awWObgTDVi6baKqtta5mEvPD8kgC188zmXosje9sORC0/k9v1fi0g
	9drUpSNdZPr6Sv6UacIrkvq4oZFpwTzXl/x9pgcKLixBexlNGTQhUMtN1OpW/+asgFfJMgrXG+w
	Vw4QX6LVG58Qwu3tJBSJ6sQ+9UPPX15aHQYuwnkwL4HTGfjzBuBA8/kepymdyAuj8g6ubYfd6Jn
	fRpPmTlFZsNsf2oeUK+KR8OlWqu/wMHpi49sYpv1+EcesRNuKwqFD80dEEW0gg9bhY0ASykk0e/
	qZqeBK+4oBL5IPjjE5qH2fLgvVMSzRO099c8OvbxkVyncQ==
X-Received: by 2002:a17:906:c14e:b0:c16:2dc0:e1ef with SMTP id
 a640c23a62f3a-c260c988de0mr274506066b.14.1788525929567; Fri, 04 Sep 2026
 05:45:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904111731.673341-2-main.kalliope@gmail.com> <e473cea93e948db9c27dc4ae0e993eb3e09011e7cbe8c8e4b305c3b12d866502@mail.kernel.org>
In-Reply-To: <e473cea93e948db9c27dc4ae0e993eb3e09011e7cbe8c8e4b305c3b12d866502@mail.kernel.org>
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Fri, 4 Sep 2026 08:45:18 -0400
X-Gm-Features: AcwNN1XHcgBQzn_feFro3WF9Vkiwio-_jIt5iIjF6wB3SyaChhdHyChwkqqr430
Message-ID: <CAJZwKkgz6h7cjeduFqh8yFsPLZrHaaJ6jp7BYrxjV40YDgnyxQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/2] bpf, mips: Factor register moves into helpers
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, johan.almbladh@anyfinetworks.com, paulburton@kernel.org, 
	tsbogend@alpha.franken.de, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, bpf@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, martin.lau@kernel.org, mason@kernel.org
Content-Type: text/plain; charset="UTF-8"

> Could the two be collapsed into a single sentence about why the move
> lowering needs to live in one emitter?

The first paragraph describes the problem with adding width handling in
build_insn(), while the second describes the refactor and the state owned
by the helpers. I think that distinction is useful, so I prefer to keep
the current wording.

Nicholas
