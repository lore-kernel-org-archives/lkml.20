Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792439294;
	b=JmfQzrN4/+/50vk931uxQO1Dhp0q8tca0UbXiX7FDrz2X+AAVzvEaid3hfjUCK0fppQh
	 ELHA/pBZZlvvk8OalKyHYG4Lb2IcnpXow8w77R+p853YF00Hwl9QOmWokPt3vMhQoI/Tr
	 BlC4NNZqI3H/nmNi7+GkQKxkxmUiTxUwsIJxlA0Fnq8YEVyAU/lG6gtzvxTuafuzf2JkO
	 3346wrEAEqJRNqgZ2WoHWmUU1x/+fPopHv4C7yX//1xQ7cEbmJdIuBXvSE5E70UTri/kH
	 BDtmfPhZMyU6EoIo8SgrU2/Wqc+z0Z7l4J1yHhYz7jTSiybHbozFeA0k9BYTpQtXKeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792439294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tmwGNNCW2d+wdPNQw8vyggjKJN0vflWnyQoTqa3ZJcU=;
	b=I3Qu9OFEasje1LzOn8BT4ilyJVqNex6IhRpWBL+/4T7ntBjLUCIouj9mKzdYXExceWsk
	 V1H6OsK+QJUzjOaktToXUtGxeQcVcSG45ECEc5cqhM4dcmAakOSubdRhg2JpMq5pH6zRD
	 0Jc/58HGj/ige8DB2lyLVqfPxDDCDY4BXx/dFVQ3vwfpQZxuAZqYRnl4ZpI8CJrb4tSv9
	 RmcwOV1sQ8qvv6JyzDA0VFdf/7pDhjvXhxiqaze/Xb+KgCbY/lbOFFhye9j85GLavdXWF
	 eS05GdKnZ5CP5ncWFzYfSvmQPMzTnCo5jlPQ4fyUrK4loynbWzlWZ+bdXp2IM3g8gPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LRxPkYeV;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0625A606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0625A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LRxPkYeV
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c418e215671so314907766b.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792439292; x=1793044092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tmwGNNCW2d+wdPNQw8vyggjKJN0vflWnyQoTqa3ZJcU=;
        b=LRxPkYeVQXwj8Is3NMIxabraRGvfPC6UniSRcKbhJ5Xn87Y052xZmgTw3sHZfHSZPZ
         dl7uaeySqJG7amyHSVucXwFgX+EbSF4tkG/vQWlh2CtMTzK+LhVumCHalg2NhCpM8XyA
         xd0KhiewgU69UE9DlbCHYS07qph0yu4cUdBS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792439292; x=1793044092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tmwGNNCW2d+wdPNQw8vyggjKJN0vflWnyQoTqa3ZJcU=;
        b=mUamWagG/fTdKx8OMi4hoIL+t5Ni6tDLAP9sBLq/r/CSUnfCsggOu0fifufYKUzsiJ
         kjU+dA5n/y6rPwZc8Xt/Dk/JCV/CApQKo9fMI+WOnIHBHhSlF763sdxjCs/+PbcPdhp0
         MQCAxsfSOM2nZ2AZ8sXN/OrDMqFyTIIeZVftK7QQJNxQR4t4exiMSTwbOV4jGopVTFi4
         oOMZxsC9GtBd5hGCWhPANKg7kjybkhptPL91/gVCAiwAhpEn8SIUFUD9xy2LJ6/quGld
         iLM3GvtXYxsFHzpTJrIDn5zSaT2myESn/ula7Wtk6C06GWrAYC/XwOYMa1chDWzst5QF
         ldZg==
X-Forwarded-Encrypted: i=1; AKwUvBxbuYitJs21qQJ94GitPLS5g31VbKoGQWFtkb5zg5Nkga66RPz8fXm7yUKybYurujRryzYQD5v7TQaLcZY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuBD5YS4GC9SoeYMbdeQAfY90Ej1nuSsXcYl3y6DeDxfSfSp/z
	+ZMWf0jJXy7VhBdqHqI/22On1VwaV/oE14VZELkTE95qEWQg+K+lJXAPYm4rjxi0Il9ixeLp9lo
	ZM2F3eg==
X-Gm-Gg: AYBFou0y3ltwYDdBrwg+DRqvVkklZqV18PROVwhfPN7teE5wR1H9soame7EbN7NNkYM
	U9B9fUVdg9kEvyFm3HT58/+/BOSviUm65gka8z9igZjY/07JGBeKVwnDV8+f/1Vq3K/qUrw0Bwk
	BPHI8++iSFpI9nFTOYHdrEULJXzUZ8UyluK7wzvLKQ7c9n+9taPVVaxhT5/avuAwP/PsJJX7CMh
	ZFUHZ2/9IO4XRWuKGc9tHPSxNbotwp+hrZrkzEX7rzyg1y4Hryq8cae7Sxtb0jo196wNGQooswN
	10qxc4eF7yNOeaPDGyxBvrzKKi4hfSOayMlocbUDiwDbpnuuiiOOlSHC8GMgPmuI7x6xgbrrZb4
	zuqsqgPPOuova7R/FvWl9qUNQLTkJdaO21syg01A2MFPonuGaFy2M1lkmHU9qsAtFc2ClZpJJ9j
	1uEueru63TUG3YGGcPD5VIhojHaT27Hg76Vp+pypnk70aZTWKUab8a6/iXiM6W9W+Ecuny7/r6T
	Fz0cclAjUANxnfGqsuL22YKKsR/qEoEMC0G2g==
X-Received: by 2002:a17:907:94ca:b0:c45:c030:732a with SMTP id a640c23a62f3a-c45c0309ca1mr74256266b.35.1792439291863;
        Mon, 19 Oct 2026 12:48:11 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd1130sm400832966b.25.2026.10.19.12.48.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 12:48:11 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so2075328f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:48:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy1G2LiDeMdfxkcy/qiP5QgBBHMMkvUIlIhye5av9k3KWVgSc5DZH3ixb9ojLf/LzEwSNYTCddOUhzfgTk=@vger.kernel.org
X-Received: by 2002:a05:6000:2f86:b0:48d:fd0e:a117 with SMTP id
 ffacd0b85a97d-48e079759c0mr21203426f8f.5.1792439288293; Mon, 19 Oct 2026
 12:48:08 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019185857.2381360-1-luke@phorex.org>
In-Reply-To: <20261019185857.2381360-1-luke@phorex.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 19 Oct 2026 12:47:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X51pmUxQd=rFQ333DiympCUh6ChsgkFcjz7hX3LyeRJQ@mail.gmail.com>
X-Gm-Features: AclHuK9rQvtNMpUIS09Hn_DNkYREgrHvZlpXBPUSvrKp_n9lGM985rbebpJYrHw
Message-ID: <CAD=FV=X51pmUxQd=rFQ333DiympCUh6ChsgkFcjz7hX3LyeRJQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel-edp: Add BOE NE140WUM-N41 (0x0d9b) panel
To: Luke Macken <luke@phorex.org>
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 19, 2026 at 11:59=E2=80=AFAM Luke Macken <luke@phorex.org> wrot=
e:
>
> The Lenovo ThinkPad T14s Gen 7 (Snapdragon X2 Elite) uses this 14"
> 1920x1200 panel. Without an entry panel-edp warns at every boot ("Unknown
> panel BOE 0x0d9b, using conservative timings").
>
> The panel's timing requirements are not published, so use the same delays
> as the other BOE NE140WUM entries (delay_200_500_e80). With them the pane=
l
> trains and lights up reliably on this machine.
>
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 09 e5 9b 0d 00 00 00 00
> 0c 23 01 04 a5 1e 13 78 03 ce 51 9a 5f 58 8d 26
> 16 4f 53 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 33 3f 80 dc 70 b0 3c 40 30 20
> 36 00 2e bc 10 00 00 1a 00 00 00 fd 00 28 3c 4c
> 4c 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 42
> 4f 45 20 4e 4a 0a 20 20 20 20 20 20 00 00 00 fc
> 00 4e 45 31 34 30 57 55 4d 2d 4e 34 31 0a 01 ca
>
> 70 20 79 02 00 81 00 15 74 1a 00 00 03 01 28 3c
> 00 00 60 42 60 42 3c 00 00 00 00 8d 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 cc 90
>
> Assisted-by: LLM
> Signed-off-by: Luke Macken <luke@phorex.org>
> ---
> Changes in v2:
> - Include the panel's EDID in the commit message (Doug Anderson)
>
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel-edp: Add BOE NE140WUM-N41 (0x0d9b) panel
      commit: 748ca393b93885e255d3da3897a2a540441fb0fc
