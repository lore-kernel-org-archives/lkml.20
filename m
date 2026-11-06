Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793992675;
	b=i1IAWY3OOisc5OShjErAulfKyB5cAzyPHAwh2mrYELVkap5fUtP5Q4hTVKbPICPQZRLs
	 dgY5/uW7yzE4Iw7KW9cbDGZBBcakRp3Ic2O+eh/d2R3j9mXGi/Ez1Pzd/In3I1V1Er75r
	 NuNJ124LCzBzq5s9AcTRkLZMJnDTp/TOWYSVK5tul/fTHiIIg3Fxalgv3NXdVfWOrDv9F
	 GO3jPnzxphNof+HnTJo0QMgjyl+F5u7pNtF9VD+CJwPsRJm71m6UUjXVRlsfPVj4/5+9v
	 jhcp9SSbuMT0HPfAPXs8ra9ibVJdsdXjioglaOfewqt9Ds1orctYJoudPc880NEHDJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793992675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ymJzB0WN5FbKDzsluXNV7fmXp6O2GJpqiouyp8507gw=;
	b=EjW9EKMeZKKB8kS/tCgmdiNrBPkyvU/Wxx+HzMcFGY21oedbZBy/GCFBxdDuWPDe7+hS
	 fxmlYY2iRKGPugP8dN4Y03UEwrwZrYJ6EVgLQaC40ipTxHq24iv1GkhCaylNnv2IISDUV
	 UekNhfYPEcXKm7YGZvVHcsHIFigo3snX8/8OdDymZ3Ab+t3frpDMkd4kp9NnX6kM8cVKK
	 M9P2Y5GrRvIqiePacNjjnxzXTItkDheM4suRm7atBHKx0x9TsfcKKYIBRgBql3NRm75xu
	 au5oP58z5F9MwSqxV8t5NYaYeSs5iKHYRE0fJKMoPI6ofmbWSScCzfUtkKIHoAuuQZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ew6S5qex;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08E1606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C08E1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ew6S5qex
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso128301366b.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793992673; x=1794597473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ymJzB0WN5FbKDzsluXNV7fmXp6O2GJpqiouyp8507gw=;
        b=Ew6S5qexV5qWeuX6X5vRBcE2ISMnLuronhr2aJPX7VOKzmIrU+DuUX+IdTV8F1+xEp
         xhmTZ9S7Q976JY7+pit3uG/D2mLnUP92C8ZJoNpDvj0q4VuvQOMUqecC7Bbug3lBnoqz
         l2EIVdl84fYcOohqeViEeAtvvrAg7lQ+QU1ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793992673; x=1794597473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ymJzB0WN5FbKDzsluXNV7fmXp6O2GJpqiouyp8507gw=;
        b=zzll36Pw1L9vvTk7KNSXYHN+IAbfMghWd2by32X8znKzLQOON9HLY/5K/7mVDWVcff
         /hcz20s6QCZkPXWGpLGifDs1K/xi/KbteEtlDJ3LKlAtxvekBj3/nUcIqmMdcbI5Iwfb
         T8+c5KFmbI05U2ipmUlfg2W1uQEGxWx2mcbnXBigtHOG5zoZP4pWDa0ICzgA6mSC3OIg
         DP0Cug20EFmEHy2n8IcJdo/r1pnmIsZMT4gkeGNQpRdDhu9RfF/NIUte+++DAPtJDKtJ
         PVe1pOsPkAy6emqYhRL2yVcPywt0T6vbqT3cQGX4lLwfvorPiwslY45AF7C2ThSUSEvz
         88mA==
X-Forwarded-Encrypted: i=1; AKwUvBw6uHlf7pB72YEULFuKCyct52xWUZhIYpJvl9YbFoBvoGXeMiaNASpElpEkRksUtUVUQBdv0FhIsRlQiPk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q+PTLFA3QYVI8nmVQzsv+G5r6uUid1/bE+7UsRK6qdM2EJT/8
	go37ZOankvvdIgq/f/3yMRLElABFxDNqyDf7i85hmAHML1otKaSmy/VbErffKPKckx4bITm1Lsh
	5Q7PN3rD0
X-Gm-Gg: AYBFou0hHxs4upAEDwwSL9i+/NYhe9KwePvcZHdDY+hcO6xRM1gWKaNEkT3U31pTF7G
	gEkeoeWP2P4tUM6BvOoSC0FSnkrmsmsez5AvqW46mBqIkpO1fPsAFgFiXplYDqqp+KvfRvD/mgm
	rtHmcDjD2yu+3J16+V2ATkqUrLNQFQaeN3XbEiar5/pnIvM0TfRTRxky7t9sUQq79UWvDT8p3iP
	TDDttkKwJUYCofT7I3MroB2TzZ/6BkarIsF/brlCqXF3VOX1/d6YKqFWSU5jHmHXajM15YIm/lr
	oxB3WOHeMrOQL5iLA0QTdjqSIxqWsSUa91cRs4ETg0mnxBYoJ3hiUbxziBSXzv0xa3fW97VTevJ
	w+EXkm/qbD4KI2VGtscB35g8iinpnyMXt7hS8nXycNOc3e7legPXVNUYvFQWzPjcV3q7+SmNaRD
	rI+gfzPRxYJ1Qt/E3zw0wpERsXF6e/EYHjI2Nl8keR1t/iyITnXzCUMSlSl+Ap0dCQ1ZpFnwLPn
	rO/aW8wdceIT9qZ+0pfekMcv544Lrgwc0Dg0zZF+eMMyvxW5IUqfqjUVV1nHkXaCTNKvQjkZMeO
	QsOFJnApSN8zgYvKtmJtxwWM4Xvn6B3d4dqDqzNsmR6FlPhT5FQ8h/io8a4bU7JHIR2p
X-Received: by 2002:a17:907:c5c3:b0:c46:9ee4:8f0 with SMTP id a640c23a62f3a-c4d34a64b33mr301683766b.10.1793992673088;
        Fri, 06 Nov 2026 11:17:53 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356eab3esm100830066b.87.2026.11.06.11.17.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 11:17:52 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso918998f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:17:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFu1UJ9+eJt1MrBI1sm6YbPyR5LsUwfgX2ioxGOd260GMZzyJZuxj7W36CbVX0iN6MVj/FV2ad6bOOgyAI=@vger.kernel.org
X-Received: by 2002:a05:6000:1869:b0:490:a3e7:8af3 with SMTP id
 ffacd0b85a97d-49277219a56mr7321822f8f.35.1793992671239; Fri, 06 Nov 2026
 11:17:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-panel-edp-boe-ns140wum-l61-v1-1-4c9747ec9186@oss.qualcomm.com>
In-Reply-To: <20261106-panel-edp-boe-ns140wum-l61-v1-1-4c9747ec9186@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Nov 2026 11:17:39 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UaXzyEbzE2iuz9_Sgsw8FZ9ueaTTwZkwgHFgLOJ-_dfw@mail.gmail.com>
X-Gm-Features: AclHuK-_kku1KjQXSkbP2droWmHGBLJtmBrXMtrNqV8mW9pN1c52FbMy49q66lY
Message-ID: <CAD=FV=UaXzyEbzE2iuz9_Sgsw8FZ9ueaTTwZkwgHFgLOJ-_dfw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: add BOE NS140WUM-L61 entry
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 6, 2026 at 7:36=E2=80=AFAM Abel Vesa <abel.vesa@oss.qualcomm.co=
m> wrote:
>
> The Lenovo ThinkPad T14s Gen 7 (Mahua) LCD variant ships with a
> 14" 1920x1200 BOE NS140WUM-L61 panel, which reports itself as BOE
> 0x0d9d. Since there is no matching entry, panel-edp warns about an
> unknown panel and uses the conservative timings.
>
> Raw EDID of the panel on this machine:
>
>   00 ff ff ff ff ff ff 00 09 e5 9d 0d 00 00 00 00
>   0c 23 01 04 a5 1e 13 78 07 53 38 a3 57 4b 99 25
>   0f 51 57 00 00 00 01 01 01 01 01 01 01 01 01 01
>   01 01 01 01 01 01 10 44 80 18 71 b0 78 40 30 20
>   f6 0c 2e bc 10 00 00 1a 00 00 00 fd 00 1e 3c 4f
>   4f 11 01 0a 20 20 20 20 20 20 00 00 00 fe 00 42
>   4f 45 20 43 51 0a 20 20 20 20 20 20 00 00 00 fc
>   00 4e 53 31 34 30 57 55 4d 2d 4c 36 31 0a 01 2c
>
>   70 20 79 02 00 81 00 15 74 1a 00 00 03 51 1e 3c
>   00 00 6a 3e 6a 3e 3c 00 00 00 00 80 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 87 90
>
>   Manufacturer: BOE
>   Model: 0x0d9d
>   Made in: week 12 of 2025
>   Display Product Name: 'NS140WUM-L61'
>   ASCII String: 'BOE CQ'
>   DTD 1: 1920x1200 60.000000 Hz 16:10 (302 mm x 188 mm)
>
> No datasheet was at hand, so use delay_200_500_e80, which is what
> the other 14" WUXGA BOE panels in the table (NE140WUM-N6S and
> NE140WUM-N41) use.
>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel-edp: add BOE NS140WUM-L61 entry
      commit: 2d5a8313d9cf989b8f53a5689a96e891bf99fb2c
