Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794778074;
	b=bh9vHuYfsyqjTuxKkdXQn/Hu4dQAyUYb0ajgQOaAE/PCgWFgnr1vjSULxz/xw9/xvLKy
	 HMJK6mZx5MSiG0DPJdvMtnF2Xo8MI2TZNLnIGdsqC4QDp25PaaR3HQN8a+A0EAeqbptLr
	 t6oHb2XslpGnSE2NS6Kva7Kpe6ZkSo7QeTU+olpFlMASzPT+iXQ3Lu/umKRFBkhAzxYps
	 cCGKUzz/yX/8CYkQwLulCKwSriZNmK1INvTQNYvb7rqa7kfHWrdykX1876GIbHCeoog43
	 XiKM78tJZwUP2S+t9qY398zOkXR853dVwgQN4M21BrUJeeYCpgfnaqRGdrqcmvw7QAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794778074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZuV/2IiViiua6vwxy0Ev/3V2xwhpRAL9545gCJ2FG8g=;
	b=Ovu3cHt41pU7ZS8LpzKESyes8FBlqJeFVx00GV5bCLysjyCXAdbAFrg79+WthZ0tx7mi
	 H94BLL81ul7koBEGujz8Y4yvcbVsSNISY253gNanETTYHKa/wV4cIb74OufFnEe/CSqOI
	 lsxizp4HGCKK6i631x90qVydOj/JJK/3c2q7O/JBaWiCiWDvmwIqpCC3VvoKGCNln1fxX
	 PCW0FL/1Iy4o6NKN2l9X4CPdJx8ezpDl9wHS1TU46E2+EvCdOWN6JPPCYTy5QbpfHPOOf
	 2MJGYxzHAwMU1jFFKw4EylI5UDwVimc/hlmb1dxxtZYMJ1ff7nCeziGkmop7dEeJS7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=tsxRt8q9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E4B606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21E4B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=tsxRt8q9
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67da69e7c31so997515d50.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:27:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794778073; cv=none;
        d=google.com; s=arc-20260327;
        b=ivSiXG9g+4Ua821T55Kj2WLClgs4/MwcIsigAFcnY3LXYZ9b78qKkPuUBuJ+9rDuHJ
         bPwltZdQV/qUImtzhh4cpD6cpWrReyWZbnPrIAnbbWdgE+2kG/txbgcKOSuwyXDirYYh
         k0XKE0bKdw3i4wOojMENGmXDndzHZzO6IifxanAQrshCDG7vgB/dy/20sUQm+s1oeN3N
         E6vdYuMdTBYRCfsE27ti6d3sxX+k5qgXMtCSwumV1hKi/2A/LK2RjCuCeqDt8IHugT7t
         mSlbun42bNvecGDOoq8F8YbEVA4UZ6posh+8U9wn0fIpuywyZZ+raA7MQ0U9WQklRleo
         F4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZuV/2IiViiua6vwxy0Ev/3V2xwhpRAL9545gCJ2FG8g=;
        fh=CV2KpGzYoInYgdauCQ/2s/li98rRDb6k86JlOXNd+B8=;
        b=Sg4T4PUckyGlsBr354tQ+VHxMDw4GmIEfJoXhKKlrE7LKjuBhQX+5r4au8JPvhJEjJ
         ias29VY0vIgw+FhJPSp63gIoYr0fBtILSLz/nQEadDTThkjCWFvVIJpaI+/yc8tvKzjE
         RUta35QpjGlyMrOCAh92Rqhe1rzUkE9mtXoVmZZ16eHXnfgy+zPNnDVSrBmnQkKK1Dq2
         nKER3tfmFGKQDQi31gby13ZqR+Ushlg+dDgE5FV8b5FbcRHVW5e/27I8rBC48riPYna5
         D/hEWx9hokskEPSXggYjUdqVtTKX8edZDg5Tb+J9PvsIZMngMNh55VISuQeP13WakNBC
         Rktg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794778073; x=1795382873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZuV/2IiViiua6vwxy0Ev/3V2xwhpRAL9545gCJ2FG8g=;
        b=tsxRt8q9f0KX90Du1mkVtvnIrRJ91uI/VDkudcdAb4V8v3m9iWT1DPO8h52T4feYeR
         gJHCu1MOi8ezNmQSyvRRmw+eP4SzGDbsdwIu1UKcU5GnAf8Rw51+hm913Z9lLSkPjU4a
         F+8xa2LAUUZ7Ie6NsOyzXVGow6N7RTLiXslEkHL51fjIqh1hpkAkrrkUQpOVFXzrgtp1
         QvmhwpfqFOv5Xc/U2SBheC1k1NlGmUtIak/CdMk/x1rXdlsokyNtv8rkABKbfvyt+Sq/
         5er2XsQw1/H9jxgizo/gBcIrbLm29KXVhWrPII4KUzmeT9WNZavCUFrq6ZCj5YQYpFe5
         bvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794778073; x=1795382873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuV/2IiViiua6vwxy0Ev/3V2xwhpRAL9545gCJ2FG8g=;
        b=oKJL692CV8zZVfShIwLvs20u7FlVRBsInqqfGj3ncksZV0/luuGvnSkcHlhNposj5g
         AGBb/LumQnIbwnPqnFKiSV27GvWoL9VGlZ02i1nKFhNgdiWLMFHP+kFk+7D4gOzNoijM
         eg3vwEnpS5MpBTzP9AiSsoLO9YC0+i9ESliOmxQZwvZsLrzoRQlnW+pqa474zyPB4wxk
         AkUuoAcY8LzM76ZzrbjPyNhtMtLwxltZ7o++da7izJYnSMchLTCVi+Par3KEwnQa45HS
         /siCftWpCmRuwo/FykOhfN8dOvmjLHO9I2kTC8awPQNSdMSnWpkvOQbKpDXNenTLo44b
         l2Dg==
X-Forwarded-Encrypted: i=1; AL+hErE0qvfQ20V2MStanjBQAxZHa6ltUFhW102G9PVA4yLwoidv0BxMZyo7nYqc6ilo5bH1qNyTkZ/csQr3sRk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/f2buhklyeBXh4tOJ490D8un/xcKsleduK4SEvCKV5AkqqFQdp
	TNFVjwfK737l6ztyZBCWM1Dxtj0gH9l+KBPBDi4B84lVjdWfNDNfUoh04MvDuXEravQHCXBEVdF
	u8CBwucaiA7B+xkvEVT7hgH4GCMgri2Q=
X-Gm-Gg: AZFdTZfhhOXeWa7mjwCchIoYMqr1k9eaCjUa+jiKRoDUSsPaHyktkq6Um8VqkLjlkyp
	Pbr4IptGvXfOQ3H4AYeNv7r9l6va7MfEwbMzKOTi6PYMmAiQI7VIisqXlmMBZT7RdRQXseY0qNG
	eRtceDCcXsEvA6tF1YCIkmVphXBMBCEKCfH9jlwneYl3pWsVHcMy++37tkwzi20pv3937E5+Fgi
	r4gKuPrpVPAE/Nd8+g+Co7PHs07TnxokP785hvkzek3V88k86az8yUtrZCp4mpwm5DZhUaV4lYQ
	clWVnHP/Ry5iWeiiad7u3U6fFxoWiTfJ2soltK5ftP/dfAwBiKO9oa77OrBm0UF48VCBGshus3M
	7jTnP5/zi2HFGARdN2aK/OoHdEJhIpPp3vkKm41yFsU1sf5soNJB9/5fqNdNc2W4QTgQUjw==
X-Received: by 2002:a05:690e:130e:b0:67d:bcde:a150 with SMTP id
 956f58d0204a3-67dbcdea64amr71968d50.65.1794778073162; Sun, 15 Nov 2026
 13:27:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-5-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-5-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:27:41 +0100
X-Gm-Features: AclHuK-tHWEVaVNE_O7wlDFFBv_6XVrqFZ8dhMwLJs0OnAdbKC_ynIhtYeGD0qw
Message-ID: <CAFBinCC-R=apWQ7729NueJYSi9d_pn_z9ukyFL5qPMXe=VQqAw@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] ASoC: meson: aiu: add I2S Capture DAI
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 12:18=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> Add capture stream to CPU_I2S_ENCODER making it able to handle both
> playback and capture streams. Captured data is formatted from
> "audin-formatter-i2s" widget, buffered from "audin-fifo" into an internal
> FIFO and then bulk transmitted into RAM when the FIFO is full.
>
> As for the naming of the stream "I2S Encoder" is kept as base following
> the same pattern used for the playback stream and with the goal to minimi=
ze
> changes.
>
> Supported format for capture is currently limited to S16_LE because it's
> the only one that has been tested. According to the manual also S24_LE
> should be supported, but this is kept as follow-up.
>
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
