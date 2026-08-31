Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471463D3339
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166983; cv=pass; b=hjHEvUEctkXWqbK8pPvhN7g6ykSihmdU19hfOvVRy9Z3HN6ck/vlVz6IqnGnfG6Sr62+DKEaX1T8whTkTjtArSqIiki2IWv+EVAcpNfXDxAcD1UqwqONq92DoaEnHKFOkcAIyJNJ7eMD3QJiGIp+EzufCBDN33gzshJnc3cfMAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166983; c=relaxed/simple;
	bh=6Gdm/Jwa++tYCYBFL3h6ykFgGzgM/L/iYtKQijxE/DE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xgg5cKsYRUY8+5jmz/Afistvxw5z2g4T9xJl9/pNdIiTMQPp4j/d6yG/lqWkQ4XE5RvqXk33FszRM0SPN+Hw7S0XG/ZSRK9uVsKFw3e3oickHBTAbtYnQE2N6k3yWDeuPV7xo6HhQ5n5c/q7FGw3DKsaXKtt0T9TJP7lWMQrfKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gxS25cX7; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gxS25cX7"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66e63afda8fso972881d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:03:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788166981; cv=none;
        d=google.com; s=arc-20260327;
        b=gZIQMivTlEBFOipBxGG9n6FmB6TOo8fEU2IQ6d0JJA2DnfaYlI7Y90FMdX7HioUnEt
         MOW3LlRJ2zhWRB1aQlBM7ZUoDpC5J9QL3hl3vTSqVJGkH22I0Vp798MM9CCnC/h2y/vr
         l/mEDmkcnVmDOt86m3xvy2X3mMXlp/nXGPwSH1m8Ojfq0sY5JxQVMC9jbFFb+NtZ0kHR
         zDuPsJ2HFo701PQt3EMNZHg4AE2eZT9AvEK7kSh7mkDOhn5c7yGecitUxnan2OMiw/Fl
         3qRGmScNvFgn4SZawkINGk0r8mte4pjv7McmqqYb6pSUNeYIdJglloFAeAtEPDSCbdWY
         0TfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uJC6+3Z9te5tWmjIrgAr6jz8Uxtgp4B6abtI+nY7s+0=;
        fh=GcIaJ0Wp+1yOdaFL4ru2wdNTdTMsKqO8+kdKaYsTHgE=;
        b=Ig9MdeQ7+ptvb8WrOco137cwFst4pHip0Bxcr59df90hwUpJN5e6m1jOvRR4gdwb04
         jcvGtdHpRiIP2tYnbpK87zVJDfmAekjvqHGyzOJo+3qasXeBKP9dOxu5R+rwjDhsWM0r
         qVVxgrFPuISc37sQ5CS8NwKZSLNqcSoAcgnXOgJiTQ5cGcZBec2VIW9LafSkO7HIgm15
         uO4x58kvDypHXAgKVRAigMHI9WNU3uDswz6ly/PA9xyiWNRB9zaty5Zn691xI7Qoer6u
         yUU6HXmUf68iHoFsrnOY4bX//1KmlR6bnoTlL1DSqQmKwwC4Z7rYZZd0Y8JSJD1LoAq8
         K/mA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788166981; x=1788771781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uJC6+3Z9te5tWmjIrgAr6jz8Uxtgp4B6abtI+nY7s+0=;
        b=gxS25cX7MAPuDkGYYMpRu/B0tb/U0Ofrw4GkY2KSp6/H5JP+q4J+jB55lgrTVepUf4
         /8A1RxtOvXnosSZHZiuH6cmmTbqvJf5Ohd5hYc0kMRscToOmolILKEWSELXv7u3e7NCL
         h3ogp9DXbBBPYOmhxmcFjxIPP/6tUW+Q/Izx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788166981; x=1788771781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJC6+3Z9te5tWmjIrgAr6jz8Uxtgp4B6abtI+nY7s+0=;
        b=DUlK7QjrwZ0PJDI8gCvyhkIPNPdtl8/QqGRcTgeIxnywXhRP32lzYJvUY8KMX9VGea
         1CdVY8aKB+8C+bV/KQyT7FNayWaN0W/vjaKD5gOTqDVLBj4dGVo4lJ6+fvlUEzykvgG9
         AlWZT+s/YcmfjmYeVrkjeb7PM+8Q2t58c3OBLCBAmEAz+QHves+8tWl8EetZLbPSZ/c7
         Lt3AqRECCPxIQ29hEOBJHIdulFgt7DbUT/evUhhUi71CxoJRf0U2q6tJJds7qaI5Zg8J
         22pIIjWe6qHGaGvz2oxxzWMdl5AnmiqRHIiaC6q1qd5qahadDwxW6UFwwr6gLC8pAGJ1
         x5Ew==
X-Forwarded-Encrypted: i=1; AKwUvByOJl2VucOLKKwp1H9h3Wt4T06gaxzWgKz5MIIyi/iEa/G3FSSTpm5nno0nI5SJTN4gD+LuDfLYou3tX9c=@vger.kernel.org
X-Gm-Message-State: AFuF++kqZA/LbnQR1iNWtbTg/KqbUSY6YXaMrJPnrgK6g1fpmqCrZzH5
	sCSLIcq0jBXbiBSHUBtpyDCOE7C3dfMNiNWxEixjfyNt1KwG9lg6boHRZpI0eXPJxME9AeJwelZ
	I7xXCfgmjlGCPvKsghEnTghVvtPk21eEFU37G0AAc
X-Gm-Gg: AYBFou07N9N1TGBLh527GON4g7yx8B6F66P3QkhURFrOiJgfFJfEdaNDR4d1E5M2LZL
	tTUeuseHn8u6ax8FClw/+RqrJrOUHBB3yZZiUuOrri1LyM6R+37R2FlLb3WiEvcUhWi5nuY4q2u
	A10GSrWIrdWRBcW7AAW1ztlwziHvx44PpOg9bv0P/J69R02bowl+9B5bh5w9FpZtMS6TcaY1jos
	yPd1X7FXvDsi7pamVqwgdUAKxh40aWZRm+b7EyAhwwNtr4HuzEtGX6n9ZTLDQP10zq3x0OMKVOO
	Wt1hF+ObPTsKC6qrJPYsBh1Q0y8nxwD9gdDZqMGzFsDwcsB2mGbB1jRzWEgI34i812+OiZhUIQ=
	=
X-Received: by 2002:a53:b9c9:0:b0:66d:289f:6498 with SMTP id
 956f58d0204a3-66f814d5729mr574191d50.36.1788166981090; Mon, 31 Aug 2026
 02:03:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-common_clk_mt8173-v1-1-2d7241f70379@chromium.org>
In-Reply-To: <20260831-common_clk_mt8173-v1-1-2d7241f70379@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 31 Aug 2026 17:02:49 +0800
X-Gm-Features: AcwNN1VqX8uTSrN71dAKaA8eOGbgkkf6CrhjupqKO6wVb7uBj_O5pF3ip4I9SqE
Message-ID: <CAGXv+5HaxFCfe4FkPih4z_kPKc_k9=uighfoxjpD1r+KJ=PZ6A@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: Add missing depend for COMMON_CLK_MT8173
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Brian Masney <bmasney@redhat.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 4:50=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> PM_GENERIC_DOMAINS_OF depends on OF, by adding a select to it without
> adding a depend on OF, the following warning is triggered:
>
> WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
>   Depends on [n]: PM_GENERIC_DOMAINS [=3Dy] && OF [=3Dn]
>   Selected by [y]:
>   - COMMON_CLK_MT8173_MFGTOP [=3Dy] && COMMON_CLK [=3Dy] && (ARCH_MEDIATE=
K || COMPILE_TEST [=3Dy]) && COMMON_CLK_MT8173 [=3Dy] && PM [=3Dy]

I guess this happens on COMPILE_TEST=3Dy with !OF architectures.

> This patch explicitly adds a dependency on OF to solve this issue.
>
> Cc: stable@vger.kernel.org
> Fixes: ebd0b73d2137 ("clk: mediatek: Add mt8173-mfgtop driver")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Thanks!
