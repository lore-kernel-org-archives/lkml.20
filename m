Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794524741;
	b=QAHcPzhtny7n7Hz/dHYcVRqDuRMl0YucBdE9NJZlW27e+7k4G4PLEGFXwUNuuTuy6Hkc
	 ucBqIXDb2+tTvFgejYVzNmw+pS8Aq0BHVBCmMd0/qnQUMswvkcMOzkhk5AdMRojz3BEhz
	 XN1PeOAIuwESrU+6fK4qKcRVtv3g99TNcGg1OCjsTdn9jajpf4p0fYMG4R0bO6zRDTqpI
	 mqneb/5TFA7xoYjuLTRrx2rvS81b4tdiu0YzNp1a/RlPEzINAVWYp4dpPrzU3IYMrrC/f
	 gp5VNoYpow5US+ZPWaAEuDoMgZsLcgWNREDbsKg03We7eRB+Vo8mWIK26xzk8qIedBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=m3lRYJaSOF/Piz7YAKasak+99H1rHlRMQKrkdBErHvo=;
	b=y3/oNW1akC1CUk6raW5Onm8MgN8WAVmKOPYSrAC30JzfqgxNUSyzEllX4igR1r4212n8
	 BsgxEArM6mq2UXE29h58Mpxj6KitsYZL3ZTMA/iNq2NExpkfHS+9Q4Ke6sGu2b7LmuhBz
	 XQrIX5SPJvH6HsLKWRYYdaXKHA0jBxMJZmUm9SlpFK/fcnN9ALOCCD9kOHN2U4O1OXszq
	 XuOfWOU9rLzauL+QpUhlJeupZmJnsTvAR2nAKvnmUpepV8bqX6J5JCA7uk28NwMldFMgz
	 XHY1Mi44KlGIHeXfpawPOEbQXTct5Hc8nN4ake4UJeEFvbx0WRE91gIQKIqDVZg83gQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b="V9KihbU/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C12D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:05:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C12D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=V9KihbU/
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67bee1f693bso265779d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:05:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794524740; cv=none;
        d=google.com; s=arc-20260327;
        b=fw+dzq62JEEKHApSEvMrpIPc9RmwFdMqTKRsCw365WP2Cz3fIMjXXal6WzFOyZF8H5
         9uOUn5leKQDXZEVtWKWw0J7rfhuiwBr5FZGjoObFVGOV1/gwEYrMzEVMQZi+bXtyWU+r
         gp4O0nDqzQC4d5P4pEQO66aCLhbVVl2lGcimNELQ9GyDEGzhhwi9ZduLkKpFoEXrrheU
         g+4W2z6rYUHFA683dByX8qVH1K2S1T2GO6vJoqq+NHBQQY4sGwoQ6D/+S3aCVJHr4+Pp
         AnvPE+HChF9aqv/LNpVtUYvWY97jzl7trsK4ge+vbxCv+x5Tp/r/C2kxZEA5+s/IwNnP
         J/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m3lRYJaSOF/Piz7YAKasak+99H1rHlRMQKrkdBErHvo=;
        fh=tXODFJdKZCvqq8Cvalzc8EGG/fmf5INJ+UpcBHy2laU=;
        b=ET3U2qy/MBokmvrALBA/48tm9k2sUafel75B/RgOKtNt4P44yK4XddtqSy7M+Utxvd
         riBUZdwa1sqkSu4dxKpXUMUcccV0pEHSIFD7+OAGbzc3aMACeFY8Qi6ysk7Sc0gu1a1G
         N7mbL9NlLBvBhfv0j7vvvtp7UDznQPG4Owy4D6RaaqSAU7G3YAj1rCGZzEeg8BhAn2Co
         StrUaisVNDVf/VsxFH/DPL++w+CW+OJQyRL8bMWvDeQ/JrENc8vy3gpiVY1ZuETccTmb
         3/u5PdKNZ4zYsgRcP3p/N8ekPsnsDBuTJSzwro9y+2dI6r7TgGN0LX3O9lzBEbncKF8t
         5XxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794524740; x=1795129540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m3lRYJaSOF/Piz7YAKasak+99H1rHlRMQKrkdBErHvo=;
        b=V9KihbU/syh/zuEgYGPMEHg6J6Vu4kmxiIuYn7jbGDchBJhRC7i4e7vjObIe62q37C
         UIC/dMNeWWvj0c+Ri19HQnuAC2N0EukgIrIVe/r0tVig4lDDtfnTvT3GNjcCpde6ZA6f
         2fBbb2gtKgh4BaexjI2yq5YgM650evdgpb0TkveeDvetGH+afD39FAmg2i3UQG4hhp2I
         Yu0jRBZZ0z8CgZrW6smwAhhQyQN5QLWvcxyzr17DRFkBX4LsBpmldne4gaDQTTIIENEI
         FcD46LmU5atdzZg7QfzDPlgqbbSxlT9baEiWwsOsGqCnc+d0FUoetWZQx9oa0SScngnm
         w0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524740; x=1795129540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3lRYJaSOF/Piz7YAKasak+99H1rHlRMQKrkdBErHvo=;
        b=I+gd/RLBwVeHjSSJ7r0TblrvSoaErfrydFI95a3BijPWGOglaKE5P5wxeIMxK5zoQH
         OEs86jtI0ZiCbDz3aIbn3yrL1l3aOqnCMOIYhhmqjsC9xHC1nIz9YHEFzvTa8SZ8cMFd
         aRlFCI6o2Wnp/jQqSZQqJi5J1eM90oz7ODhGpCkCYsQHpEONnVrGTUIk/s0f9i2kNYyX
         3IxT5wm5P928D2EwgThuVys+zjYvmNikyfRUxulDmgDBeXVQ04+kaHKEidQDvIcfmjTa
         yPZkKaKXTXVNzWOZDN2yUbQgOVAMohZA8bp9izTIU/UpFXTJE4yW/xJrm0ZMiO22mdho
         SSQQ==
X-Forwarded-Encrypted: i=1; AL+hErGqM77sPQQSreUE4TXekrBSnC2r2R85zn3toqefC2z5GslsshBV7dZM9hkR7f7AwIQem9aj1HuN6Gi2ick=@vger.kernel.org
X-Gm-Message-State: APuU4Z9D26FKZ9TEELP0mNdaI+frMrulrA95ZFOsn45HWxh5a858i9fa
	Z1yg0ACFFpnNf8MIIUhO+vdNcRJYA7R0AbVtK2Tzs+til0L+Mwm7NJyP5wcNACLByKou0GrmIIj
	XBOnMVzU1Q/4Mjwlm+H6cx3m7dHU3rm4=
X-Gm-Gg: AYBFou2YD1shebiSP2TV0Y7cY1fvHNMSU3osht64gs/KM4zO9avWlReRksVMOKlN2Q5
	kHfFM0ABc9DOdV6aMXs3IyUyUO9016lpxWopzEftLPg7kIWaVzYwMWObQtmWq5bamQWGNqyxfCH
	pcVT04sRY2SQLIASQ2pbdV17ESh8FeImKmEw2cH8j5PwGMFCG4CEG3SkPfzNIAnwibv3XKfFNqn
	kBSBBmWs11GFfauIKVN/DRjNVOZl0ccLuovHEczbjYRzHlHiAO25uDpIf7k/A7OQ9ObGZpAv3VK
	WWb6MT2JIrgm7tkAa+SrEaQRvqY3ebpyv4DeOWANEhcpjr2E0FaCjv0QGeYebVg8YFtui/sC2tt
	vkjrWbs6quImnWyCKV5mGilr1JHgi5rUEj4305sh16Zsi7cQfIW1AB4idpQAL7NhcRFR5+Q==
X-Received: by 2002:a05:690e:4506:10b0:67c:1aa:2030 with SMTP id
 956f58d0204a3-67d897be561mr407000d50.67.1794524740366; Thu, 12 Nov 2026
 15:05:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
In-Reply-To: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 13 Nov 2026 00:05:29 +0100
X-Gm-Features: AclHuK_8bTUR51TRXYpLvWTsaJ7E1LH3kcGSVltDcpyem9ID-KxpWLn-7OZxH4w
Message-ID: <CAFBinCBLK3Ok7QpKUVT5XtOqDafVzGP2Tn1oBj3f=PUQ_DgnwQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: meson: aiu-fifo: prevent sleeping when spinlock is held
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Christian Hewitt <christianshewitt@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:09=E2=80=AFAM Valerio Setti <vsetti@baylibre.com=
> wrote:
[...]
> @@ -37,8 +38,11 @@ snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_comp=
onent *component,
>         struct aiu_fifo *fifo =3D snd_soc_dai_dma_data_get_playback(dai);
>         struct snd_pcm_runtime *runtime =3D substream->runtime;
>         unsigned int addr;
> +       int ret;
>
> -       addr =3D snd_soc_component_read(component, fifo->mem_offset + AIU=
_MEM_RD);
> +       ret =3D regmap_read(component->regmap, fifo->mem_offset + AIU_MEM=
_RD, &addr);
> +       if (ret < 0)
> +               return snd_soc_ret(component->dev, ret, "Failed to read F=
IFO pointer");
As far as I understand:
- snd_pcm_uframes_t is "unsigned long"
- snd_soc_ret() returns a (signed) int

Doesn't that lead to a signed to unsigned conversion error (highest
bit set -> large value)?

axg-fifo simply discards regmap_read's return value.
That seems odd at first, but knowing that its regmap is MMIO backed
(same as for AIU) means there can't ever be any error.


Best regards,
Martin
