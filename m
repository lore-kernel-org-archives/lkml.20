Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793160928;
	b=EYR4MkJlb+tFe2+yks4P0xuJqkYNz8ni7JEpkUaXevcBx+ysiFBs9NZeHIcDGjEAO1A5
	 VTyolJKobx9TXB6rKDCLqbkgNmycu+R/kNMQv1Z+MZvU4RGObAx7aoTokKNUPZC3FuiSa
	 n5qV6FzeHUbE9zpXe4fMDtfrbgO1qUsutz3sBi7glQBRVY4I6VLBgFdgIXo+H9C6a7AJj
	 RJpY1OFC13XmMoT6kJ4L+8dq49w4GX58NTxYwnurWAIVUUxPEWj9Ag2VPFzVvMiw6MBpZ
	 cEM4Cix3iOEvkFHTEF0ult2cXl9BZcDjxtOydpJpXrA2Q7dy1Cpl5SRTx5+nnKlXPrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793160928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6dpWoYlTlEAfWqEEan0QByNtEFOBLeZmhb3FVQn0nhI=;
	b=3nHTLB6l13AhF8KXnNqmRCFiCxq8wcZMrG+jF5fYV3QklvT8hxpbIWY3/tlELVJ7Hz3Q
	 RjvQogPGipA1acNvYeTDQFQ928Ur7W7Hqs5wkI1kWoDd7aFiNFr/mzEvD53SZH0RK4yuE
	 s43rWP7KLwGlrlTucQXDxP6ihg2L3zHerVLQkJNhUSptet2JrcltrxsabeITqk2exMguz
	 vX5XU3ggDZFZzlO6Gl0+xGSUw3ktUHIX1iC9OvbiEXMpwGpUgmd09JH4DUoM3qAYd4oUT
	 UMpkIXNY+t9uMtkA0YNncU/VTpJRXjJsLyyXyauicwVfLr3Ua/QroA2MCHJIYukjBQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=STMjG6vR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90465606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90465606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=STMjG6vR
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67921b515a7so528450d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793160926; cv=none;
        d=google.com; s=arc-20260327;
        b=fgkHxpG8NwmkS4uFtYzoHY04v99y25RmiZHW9Bn0d2c9qIG9+UHOtxnVy9wagRYuQT
         5JWQ6s5aF61yJ0+0D9j1zQWFZsfXkR7unqtozJ2yRz1ECxQGMTgWdyNS/+lWpnfG93wP
         UTrnJ+jT4qH1W2BxyqCq0NRB+5CMi7yeaMx6UD2NY9lAEq5cOgoEf+lFhF+5KoLXIysM
         41wLLPDToDivGZfslZF5h0z5a2s/gjyauX6PIDuyoN4RVwa7RyWq4joZy4qmmhJauwAG
         tI1X7sWI/tETrPjfAVAb0wXkNaVctGEM1cCj0I0KI29IGG3S1dgz37cQMUc8fVCvCuhC
         +VDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6dpWoYlTlEAfWqEEan0QByNtEFOBLeZmhb3FVQn0nhI=;
        fh=ggoQfbok3R46e/bybLepDYtqveuSvyIHYYwWv9ZkgGw=;
        b=bbZlSmKjFLVCXKU2egLTdKSskBm1cfR2YCUsjqRHeNKdzZyFDp7lnbWIszp/9BtA+y
         9Uv6VofuZtWsYVefS/NMqHhJ8ftw7lSuc36rE3ap63MHE/Mjos8UP4gj+Ie8kS9W58jQ
         OYZv69TkAeNw1u+FzjJaeooIHEM6rLfK+JgmtbFg4viVZfces/pU6kt4e42tubW1bv/T
         MLuDVFjhgxXQfN7+RCBc7LuiMqVc+SATeU9B1OtGa4EumDmQkaa6xLOuJPixRXtSmopC
         TerNsYuDl45K1LKdLiC0Iff4H6GX8kmBCwPid5MiQacYh4K5Q5TQLiz6FAJtInikYwlp
         QloQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793160926; x=1793765726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6dpWoYlTlEAfWqEEan0QByNtEFOBLeZmhb3FVQn0nhI=;
        b=STMjG6vRYGto2Nnv0mpQvdu9zL30sCSXuwyL1/KNgpXDiqrXjjvTlYfGDlfykbX+k6
         evoml7ifsss5MjWST6e3D1PK+MrFv0XNNgmzB3bYgKwdIMBjJuqisBMFt+1GYB56aPOr
         waYaYH3wAXrNHD49mNRBZS0N8154IHGMp8PCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793160926; x=1793765726;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dpWoYlTlEAfWqEEan0QByNtEFOBLeZmhb3FVQn0nhI=;
        b=iZH1p3uTn1fraZM57E9cmxEaCdF5lO8PcaGBpKkhypHO554/4ZqfP+XPF1R/PNiVXZ
         AQwguXpexW1aIzYZ3+NLCiaNdf/VIH8MWmGBTi7tcA1lvD3graOnKfygieCvkWdyR5rB
         JdEA7CuQa+wIT+sEHKk8kIvg01nAJHTq8EEWCdCqfIoyGOfZ/UX83CE8agR+9gSo7tQu
         9JNN9Crf1o2q2zrWo+lV2Jz1/lkX+IOEmThYSL4T15YfCQIFObYJKc87a44Sfv2dUUew
         asoL7tv4+GL/lbHtAuaW0//YJI4SViv5/CkCH9yG1IjrR5uHdi7Dd8Avr5k8l2+BEh9D
         d+Lw==
X-Forwarded-Encrypted: i=1; AKwUvBwbDXDErU31pVsDNdjSFnzGgqaGZG/dU+uznaTfrqnDq8xpV54wS+4fvdB8wXQAxYobXm3jeBRCiPvsWH0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQc8QYA7w7jL3Plo6nyrGUSC+d2TcXMngCjnGLH8zkDBJfwML5
	ZcYJzQhOa+AfQ06IatTiZBV0McbeRyss1u+n6cI3VDWRpHUGbq4X5wC1hHsqlFSAxu9crD5YyYw
	mrrz+kVkIpcdIWV8CUo78gueHNRIKoalX9xeBEgLM
X-Gm-Gg: AYBFou0cedW1aTcJM7z7Sl976kemDKoVgwE5YvusOY2Mq4QyhIfSxjGBsX6mi04RfBU
	a56131ndmV0pzah/IIVZriMcjBtNcbFmV5uqRYZYr0HWaIVMUfUoBZik7fIea1FCRm90EDj37S1
	2muA86SWU7KtSY9JRFKmTi9dfUfOCzvFM+RvKf6r5N9S3Re58eU6wIZkzP1rWd8FzEpoz06idRW
	0wsIXDU7Gw3kJ0oJxUHLtAkID5TipI3bXAnM/go0Wovo1LyMkidAb5J5N0Y44UK2Wvb4a7vC4Gw
	acdya1y84BtyaVJkLZ4h830XUbHePUe4ojDBDjisPInmi+oYHMvcEEELDJ67djCVR8h1aYhfH7+
	08ZCb+e6a4FFlmjFWdq96STQ2dJa7c1RpB1kuUP1yinj5ia9ylB8hj/xbAaIyEmhuAioVYdtEmT
	9Gwik8JUjaJ7fM
X-Received: by 2002:a05:690e:2047:b0:679:5ae6:b290 with SMTP id
 956f58d0204a3-67a7b9a67d5mr1033094d50.3.1793160926582; Tue, 27 Oct 2026
 21:15:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027093306.2812695-1-lee@kernel.org> <20261027093306.2812695-26-lee@kernel.org>
In-Reply-To: <20261027093306.2812695-26-lee@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 28 Oct 2026 12:15:15 +0800
X-Gm-Features: AclHuK-igjxt6NXixiazz6taDDNXzzugHQY9dV8o_clIASacctwSUFB4CoYNooQ
Message-ID: <CAGXv+5F1WthGsE0zFqThBge=quNQ+8_LTtH4Shsh1dpdvGHV2A@mail.gmail.com>
Subject: Re: [PATCH v2 25/27] mfd: mt6397: Unregister PM notifier on probe
 failure and unbind
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 6:38=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> mt6397_irq_init() registers a power management notifier block embedded
> in the devres-managed struct mt6397_chip via register_pm_notifier(),
> but never unregisters it if mt6397_probe() later fails or when the
> driver is unbound.  Once devres frees struct mt6397_chip, the dangling
> notifier block corrupts the global PM notifier chain and causes a
> use-after-free on subsequent suspend or resume transitions.
>
> Check the return value of register_pm_notifier() and register a devres
> action to unregister the PM notifier on probe failure or device unbind.
>
> Fixes: 4e2e7cfec13a ("mfd: mt6397: Modify suspend/resume behavior")
> Closes: https://sashiko.dev/#/bug/linux-edb62fbc-213a-49a2-be55-c002e234e=
554
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Though in practice, if one hits this then they have bigger problems.
