Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794776985;
	b=bmu0gWyRLzroOTCS5MY4XgjZ9zXZ1KF3ZNQhZt5Ydq3uYUlVNh93XEwcY0wBSG3TkXn0
	 DF0VmdWw/YSzmv1kr6zNmRSC2vt0nKNOYqJrfJP/InvaMaze+wJUyEpKrLFJteu5Dgg1X
	 2+4bJ4DqtbPFP3TplK3UEmx8+t/s5bt2sBx/vRlNDnlPAaovpLJP5RilkIEnrmcdF3fC5
	 PS99b0173XmJR2hEvxgI2jpKZaeZ/b+BGNTVxnhPQIdAndRXcIo5O43GUa4p7+tfO2FUL
	 2bbcFYuMAhznjnXsVPgKXa3mLuz0UQCDW9qJ6WQdp5+g/D+oyft3uUsMcoTm5c+RRsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fFm2AgWq3aMA2NgcD6hx5PZ2S4O3KE/xlXyx3feIpKw=;
	b=1BdNsetwggVytGHlyg5OHt5oDm92+5tVCgmaoJzR8k0hJdxER676h1O9MBj7ORTDypp3
	 hUvFkS8mslxfZ7oN3CzJa5WmkB2nZyHfM9pcpLlCp99XNFVBNvhXw6z8T+I7hjuTCSBo+
	 nkvjTW4NS/1BdQ1+IMp6pN9ZHd9BWXqFNG9TJ+p9+oxaXg25Kqd/SUvZWeJHc1yyrEY9k
	 8fKlV20pG/P1b9Re0UgFdaUjdbMGO7/2vr6qLuVXC03gtlMo5iwbFcoIFkBN9dqUx6PAc
	 gXoP370UbbLFXE03Z3lWcwumf9ahei06UZ5ZnUWdeHFvZGPtEMdpqeHUVv2x9tlAQUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Sl1nvHNh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E59606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35E59606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Sl1nvHNh
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67db763cec7so270596d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:09:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794776984; cv=none;
        d=google.com; s=arc-20260327;
        b=hx03x8MQqWjd+V/D/+1y9C/IzzvQqflKKW1kkg9PYqsB70tiMfMMdvphjnuGtUX2bQ
         D6NQNZUtxZ2GurRn84xU8sSHavdaMe1mJgj2HJ06m4kjWZ1JtM++EEKxa3+d026is7Lp
         AzfkPsXo7Q6iWpEm261ZjWf1Ah6Jverv1gxP9Lzch/bzgofYd/jv8RgeLJgXMy0IL+HK
         Fs19Wn5uYxwSRgGUgqAT7aI6WTDL2Xgc8Uc6jqT3qONw9P7jVRvPgLIbrEDVdYGnzomR
         3NjVBpyWqeGP+TU2EFhe1nabDi0YfYFs4Nq9f9iemNZrhMH6tTQsQnIJTtC7+vH4IAe9
         /DMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fFm2AgWq3aMA2NgcD6hx5PZ2S4O3KE/xlXyx3feIpKw=;
        fh=RV6q7Gi4/ZAWbkqXdOtWjndISwX0D56b1kbz3HoMMAk=;
        b=GzsQb3df+XLHmv/mTiRrMzcisF/N8DRGBX84uYuBjide2an2pHzk55LIYeYK/PA1L+
         hy2t+kUxhTt+wNe6nGptGVNZGeF7a16Mjl2h2jRwVZjB8blHQRFfuk10cIyzSge/s6z4
         3VJFgYVhxMqgxZrXqy5NT27qxPzlWyrHyzdoMZHdz+DPVkKTffRV4gepJJsE4MFESJCd
         n2BJ75cSeCTdkfIdCUASuXwrFzkEd9zvrdD0CV1rINzqtnRPGIWuCbTGm3S2Nxid1wqe
         iPd4solgTYKrrUww+oGPFl+BhAbz+RmYURLUoCCrEzZyX5sTHeXD4JA/kx2Ecn3VlDMj
         mz3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794776984; x=1795381784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fFm2AgWq3aMA2NgcD6hx5PZ2S4O3KE/xlXyx3feIpKw=;
        b=Sl1nvHNhKhAgdXV6eF9snxogwmW2KEFXEoeKXPziOPzyezDqEnjQx3TE0b28sh+Z/V
         +zUtEMZXBWIL+bImfjhwOY9EzABl/+THfCGwt+VpR5XQUeu7sb/uXXCDApnXxXDNYRfE
         vBQabVx/xnF0cJVgfBj3S9VV363Q2JmfNtzSPwpluFN19sm79WgEjt9AuobRARUTinxq
         Iuf78MgXoV0suIFS5xhpesJFOkoQUuABV+Tjhn9yI3IIf4Npj0G7kIhlSSbGzw/vyOrD
         gC8gzgQhjpgPTpNqfKRM4yz2Oq9/mGxGcRdndxlJwq9y48BmGcPAJzXkgPymQdDGb80K
         s0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776984; x=1795381784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fFm2AgWq3aMA2NgcD6hx5PZ2S4O3KE/xlXyx3feIpKw=;
        b=MqrvPp7UG5yFOjIY7neKOSZD7OGLuH1siewRRipEdAljXEkSgTS+D8tB4ro/ZgF39x
         NGIvbkmttbEYP1Qzyh2tUdJwfvObL1CrEB17BojGXjFm3+Gza4PINAxWQMYUVshnWPHR
         Ip6EofdN3wLleGSJZFnsXzFPMz3/5j5VPE1Go5PJ8LXZmVtPmmZsA4n2o6iyZsjMSOv9
         m/ctxVOg7cpF5T9H12KOu/eMjGECo0kRNYn21zSQIRA9bLRWmLGSk4WzcRTh3B3T4dTc
         ccj15+gO7eCPUGV+BJHqefA5z6aNjDfhIh1IZtTK8PX3A9Iig12u8OygfRJqRWKPGcPj
         fGJg==
X-Forwarded-Encrypted: i=1; AL+hErF6aE2VMhQ8BWncPici/gXV7ZTW09ENoG8rkc36awdyLPYIK7Qyoho+EZuZSrTguxYOhV7rWuHFNmME0bw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8emOa7z77qqLybwM1oCJwRoshMOBmgsd7X6fFCfdSxuIHBqtjB
	jMAxb7TkFQfZ8SA9DTDLpUFjWvlyC00b0Hg3uU1NHvFH/CfzhlooGDCrqUnHy9Wuh4t6FXFisqp
	UniAwp7N9a4XHXvccnrn6iS8mkSJshU8=
X-Gm-Gg: AYBFou08HBeWA0WQUhPh4S7nhlCdV9Dh4+O2ye6152e/noTrroTaemMFgftv4Xly3Rk
	XciU8igS0J8BtZmCxgPqcNPoJYFyVK6uugHM+QPFI/lnIr+EYKq9cXNZFWNADUQCiK0oZRtIOid
	RgX4+TUlDZkGfF8zLEYCd4oN+1qcFHWaeliztgGzx7bA8RlbkLqK90bA+YRc13CmV2hnuqa+B9+
	j2a6LPm2Ox7M3uY7nmYG/s8kbvONGW+PhA2K0LJLL+Yf5lp+gbpuuB2+yNp5D+uqk2DvxyaGdBg
	bbgbQ4RIt2N90MoKvAQtvBqjsVO0GoJFJlZLkhzW8PszPJ/Wrv5EYdMEKrTP5Lx2QwWP3l/ZqX7
	1px+dtL19hT1EcPPOmRtxGOFnr3erDDl/Fz0VpaGzA2L9F6cMfs1kf86a5Pg34xf0r2uvhA==
X-Received: by 2002:a53:ac9a:0:b0:67c:cd5:f5aa with SMTP id
 956f58d0204a3-67d89731e46mr4496105d50.122.1794776984233; Sun, 15 Nov 2026
 13:09:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-3-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-3-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:09:33 +0100
X-Gm-Features: AclHuK_ZuEq6J89mo54PdzP1OnTq4mPljqW6aT-mLz76EZXNOrQC8XCfvE0QC_0
Message-ID: <CAFBinCDB93uLnY9V-tLt4n77Oh5keji=rwA-VNbHm6V8rkYkJA@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] ASoC: meson: aiu-encoder-i2s: ensure clk divider
 gets disabled in hw_free
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
> A recent Sashiko review [1] on this code revealed the following problem:
>
>   If a user opens both streams so snd_soc_dai_active(dai) evaluates to 2,
>   and explicitly calls SNDRV_PCM_IOCTL_HW_FREE before closing them,
>   snd_soc_dai_active(dai) remains 2. This skips disabling the clock
>   divider.
>   When the streams are subsequently closed, the ALSA core skips invoking
>   hw_free again because the state was already changed to
>   SNDRV_PCM_STATE_OPEN. This would leave the clock divider permanently
>   enabled, potentially draining battery or blocking system suspend.
>
> This commit resolves this problem by using the 'clk_enabled' field of
> 'struct gx_stream'. In particular when 'hw_free()' is called on a stream
> the code check what is the status of the other stream and then only if
> both are off the clock divider is disabled.
>
> [1]: https://lore.kernel.org/all/20260917212019.4ECE61F00893@smtp.kernel.=
org/
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
