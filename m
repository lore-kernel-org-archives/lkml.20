Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08092AD00
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 20:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791751207; cv=pass; b=o2jrFojKWusWym22sQp+X2G0RBWDUS26f3dN8rs0/1itpaeaFpKx8fFQYG67dIt961yt0gotBkD2Ykc4nJhkIG0qos6z2vwX37O+PzfPvzMoEZG0EjhKfTJhxFEmzk5B5bdwwsgGbyN93uOHWYg3XYbSCjkUGhwiSFM7ss9z/b8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791751207; c=relaxed/simple;
	bh=s7QSs9fGt4VMsaclyqUaQwH1ssV6iqtI3sGopV8EknQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dk1LelfAGoIsynkslFr2TljIglL9eGf+yGDH41Ad30O1977SWPRyWrihFdIkxAeonSktcgormoT9p1RXtSVWBlzRH9wRT/jUeiwfbPGOM+QIS8yicvc6660YYXsr0A72TzTCrF4dRZzJjGvUHNnMiyQ3U1J+i/dt9zrXp37OesE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=e4+9MM+q; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="e4+9MM+q"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-676858d42f8so798533d50.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:40:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791751204; cv=none;
        d=google.com; s=arc-20260327;
        b=Mhekjq2WjOaNaRzVAjsRE1aVbpaaN7mpGuAfmiONrgOf5m0KEwKoQZvLCQAOjNdyKc
         AiOL1iwNKCzlOMKgq3+GABD41BluWGpGVqArA194yHzd8kvpw7SZ6H4Hni9SsXyZr732
         JKNxCoo5Ey9XDgstw6oeXNRg6nxjOlsi9z30S7jOJ1+uhW8CdTevOlP1bt7vlHPSdkG1
         XV9LljAAF1BKUl0+ehVDGfJgjN6ovMLwOlGDO5X1ehT1HC95zEf5oICxRz4FSLhpCfcG
         dGFIXmoGYTNYxMdiOOtbWSscxUcED0qtGgWx1U2MFbOM/i0oEkPCWtAIz8dn05RD5XCq
         Oehw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cMamgJmk8vH3egtGQxv4sn3Q+mvCzsBokUwIGTdvv7Y=;
        fh=z/Aum58RxF665/0vERfN3dLzgIL4UoisZlVDwZUvvxg=;
        b=NicIBft0m6l/GQHdG+gTh4nSGnOG1N6ig70I3xxRT4s29fjcA9uFoY5ROpS02lJG3k
         MLH5kv2UNdQrnzfgoODeE/kFpshppXhjKXBUxVT1q2wSjiWyR1iKW0Cr2V95LpuYxiM2
         0D24U310eCHxT2HtNMBMau+Lh27Ak4dwlGIluQM4jTC/sBseCTVdzfbvXOwGIiUV/weX
         vjdctkpTzU3LN7FqzJS9PVZOAB/rDl2/+GGqzWOg1BcyqW3/xCiNZvXMKuF8B1y/enz9
         PmiowW/nzqU2N2h+4S4zkY5AZwy/Hjf07ssOxdgiGJcsNCKg3mG8YdgnR50YDEkfiuYd
         5vaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791751204; x=1792356004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cMamgJmk8vH3egtGQxv4sn3Q+mvCzsBokUwIGTdvv7Y=;
        b=e4+9MM+qr0JxGl+VWxmS/FNz682ZepVXXvzJaFcio5cnrBi8/Tl/RYQAAWYfAfHYTm
         IsNplr0M2fCTOT5RkZuWP3+Iewo04JrLpbNpg2Qp83Vuv+XoMz9wmmNoADE5A5TtSOKh
         ZT1MQQrRMZg9EG7pLnDFiVtTgEDZ5af2vlB0uQvQEH9sMzu6n9UHzrhTDx2QjjRkli6b
         b78kRbOYls9wM4cby3GcOOAfiqlr3EdLJGVYCMvsVB7ran7bR3NahkHUKYUSL4o9JDGS
         NaRsZ8OhpqEary2VgzniOcJWJEJuhCnN6YLCudfkfUiryjQhbAyObMX+DaMPYrrb4gC+
         UcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791751204; x=1792356004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cMamgJmk8vH3egtGQxv4sn3Q+mvCzsBokUwIGTdvv7Y=;
        b=XK9whByzBcGgspQ9KD/QxEB2vzri0qsj3M+tTS7mQPv/YitysNBJtBphkD7ij3w9D0
         p88tQN8cAA39fj58PpeQae2iKAa+pgkpDgZnlbswS3BN1mAa8NLDluGCzY+qKZidc3cu
         a94wk6TlWgXN0GCA27R9A+9or2nY8NAqL05O+z3Op/OS8jVV3ushURvfZdpn5F4nWPOG
         vt1/sYqJa3BDOE8rXtYCI3/CB0YhTllChpWiWKU5uoizJIBr26Udjb7qQPdX90Sk/lIA
         mj44JEF9eUdebnWPugVSYNvJfHtgwV3hYe/Ofv2e1CnN2BumOIJMZGgLevl7+x/lu12L
         fVZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqKDQPlQPZaKWlTOOQ2hWnHNYw5SfBphNUBHF/DpZ03L2Xh0SdLzbd6kQJUyR+N4mgUKgzyU9okaZsqso=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfwaorAuwvGRlOdeiTV30mcjGbTDOPjtGE10SMsclUgGPAWgSO
	fSO7AQfby5eJk8C2AEoR72qnM5gfDO5iX6lHbNNs5WdtjMWHhCA+40dk3x1lSBnyB8R/P7OPEpm
	FdwncxK155VFca+rXNKuzDlFV56DlcRs=
X-Gm-Gg: AYBFou31mbo08NItDAtdKxfejcPMBzLICDhUDZSoAQEc9L1NSQbZwD2yKDM8ycTuC7m
	mhxdfM41StTno6L46d71cilln+NsuZEtgpjTbxWInm9C0G5w5AUKC7ocyZsvXZ/EcyywU8mA/ZL
	RprahBg/aSbrpSLeABG3/PMSXuqBi8jXWoTKTZqBKSKKWT/NRydl7jGh1Azn5XVoFXdeVWqIaXZ
	5AZPLBsYvmsK8V34jwksWXlxREYsJUIapS81+CghAu+BoAZO0/yjxCQxy8rIhANLjjbE6JUnm7M
	1vwJuPJkTPjznZBZpybcQTT/un/AziBnI4k1fF2sHNrHMUReU8O6SFWxXy3Z00CQ4gvBG0xpxSx
	LF9YEmSTTQhQy
X-Received: by 2002:a05:690e:1519:b0:677:af43:e258 with SMTP id
 956f58d0204a3-6793629ea83mr1945754d50.117.1791751203712; Sun, 11 Oct 2026
 13:40:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com> <20261011-odroidc2-dts-v2-2-a3a4a752f2ab@gmail.com>
In-Reply-To: <20261011-odroidc2-dts-v2-2-a3a4a752f2ab@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 22:39:52 +0200
X-Gm-Features: AclHuK8O8IYZ2ORxL6RhWYJwVEzArYZ9TYqeOkNcn6oWSppRxLJliDi6XNzarl0
Message-ID: <CAFBinCAwqKZcUegwsFzom6398-BVmBFH8sekgyDp4ZPm8qYvUQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: meson-gxbb-odroidc2: use color and
 function for the status LED
To: filipp.dunsky@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 8:31=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:
>
> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Replace the legacy label on the blue status LED with the standard
> color and function properties, following what the other Amlogic boards
> already do.  The LED then shows up with a generic blue:status name
> instead of the board-specific c2:blue:alive.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
