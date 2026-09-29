Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C413DD528
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790696888; cv=none; b=I0nV1c6a5JUsyJRVlIyLptrjl3pUNicLK2CNqCp+sAmLY2Ey9cwXMtJuMgGdVzGz5922Wn021W1XhakyhIcYyy+YglSIosUcjrwvUv+v60hTtYTz2RxGm78ADXQtopOMqqcAqx8OEcUTjb+entxjX2YBIjK4i71ml+2VQCc9iYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790696888; c=relaxed/simple;
	bh=vzU0w8F+HlGmZx4KQqQBaCbBovkeO3I44GgdCcYCp6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CANaRSlswZh7JIsrH6qkEiwWoZfxDLeycZoaHXECok+XfXfDTttBSeOzyaqtjFnHxvqm0Yeb1oErVNKbBFU+1Pz6Jmqj4hyVlqD4NYnPdIA23KNTWIYHcE5prSu1C6WlcKC9gwJPCKWzpd6uCLSzPT6zTJ/Bd8po29yqap7VZrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QmBdjXhU; arc=none smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QmBdjXhU"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acb88abebdso1002672a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790696885; x=1791301685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/dZbuYFRWaYPbHqq2vBKMBfGE1dD5iM+GHzPgRrdI6c=;
        b=QmBdjXhUNTw1XZAE/BaaCq79KY4JLadVS1F/XK+68WLFsfcLGI+EXOy4a+8C2hZG1p
         BPIdgaYly7WVOJlrjLSnUA+Eqp0fpYelkr8lYKMtdshKBbItxBJwrETKkv7BrIDQFl+y
         e8QKtrHGlmDR6FBGWq7oIbqHy8tEvT2Xmvg7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790696885; x=1791301685;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/dZbuYFRWaYPbHqq2vBKMBfGE1dD5iM+GHzPgRrdI6c=;
        b=un6/OIX3I/x03qIUc4qNoBuXJJu1KhEPWJcE2rZ9AC4l0Sow9ptvUqPzEGdSW/hQ38
         YMcBoG/Maca+qoMxWOVqwlAozMeMsvU7V9tK5NqPmUYKeiGVt1hcuyTxGVdm2hunpb+P
         LTcVZXFJpqMuGt2aDwQnIg7KA8tEB+APbkZkrJ4ZFSSvVAIz36BnEz5N/yOEVm8maJaQ
         Wu0IeMToO275b/ovws9VBZzeXqBsHkepW0qfsL5UC5pFTHAzJkl5y33rr0dwMKgyiJKw
         YIu8wHjkQzo+gFaXC0y7DcwpwO7DpPBB/qiw1hI6jeL4KNz3qIDRMtOdQUVfiWb3nsx8
         nUBg==
X-Forwarded-Encrypted: i=1; AKwUvBxF2eQ7x7soAOdRy/X/syuUBT6VyUd93OXyBoN+LgBf5z+ugPl7IdrOtmX0yPr8ynQI65sIqlldnzS9FR4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLp/0vxFKlwRBzV1108MhYebVRLPfXl8/+d2S1eMh+LEdgZXJAv
	iHIDmQfyEAPDB85Z1beC3vvhJksxTuakIFqF+MvWCjcQVNcgVSI3V3lut9VAFTOww/eFtreEtFr
	A9zcQOy8d
X-Gm-Gg: AYBFou1TojBw7L0uOJbFX4ptZDGTh2eHEWVqjuC5qBsfCWxeQUIx4Arpx7vc0ChZQe/
	5zX/GU5IZ9JvX5I+/yJJC6qSQ84Uo6nIpn+u5dZn+7QU6I+qpmfttJ/2YfPAvqNu+N+SPHG436V
	9SPbnphlNDlEUMcANJPDk+1KAtL3+QzHsyXNSZ17IIciW8c2Q8HuCBXt2pPVbZ9iOO/23CO3ort
	UGrkoQl5XLHWgXHgi/584AcBKIYC5r9nugAckuBRQPN/+fNdU9FirIrmkOxP6UbYjSO3RZbbWPm
	ID4SJK5t7JOfNCq6jgLNECMRIf0rRbSqKHneHOqTOq/2Aj3fd0ZFvd/oxJzQQ/8jqyYC1i20IhT
	cGD6JOcsMQmEcIHwjXck4qXYju+fom8qI8rv+W5aS5NnYn2Mc3eaxkw7XBVbm3C6UFDzR96Oajr
	buq9Lde16m4IfiReIfVKwR/nM9E9NJ9O7uUE4AUMjqj64ZUPhsTDKEe2e+DVV56648tTZ40PkoB
	kpZpx8QiVOLdSfcL9Zyfn9yTJPwQd5WC/NjjCQ=
X-Received: by 2002:a05:6402:4020:b0:6ac:26f0:15a4 with SMTP id 4fb4d7f45d1cf-6ac26f01b6emr7099657a12.27.1790696885038;
        Tue, 29 Sep 2026 08:48:05 -0700 (PDT)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com. [74.125.225.141])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6acb90128e7sm1096903a12.18.2026.09.29.08.48.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 08:48:02 -0700 (PDT)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso41071945e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:48:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxb6VAq1DfWinlBAGMrhll9XsI/lG2b7QQ39ad0P2Mp/mIdKgr2BHheMqCpcO27i9RvbfSd46GXULW5WSI=@vger.kernel.org
X-Received: by 2002:a05:600c:310b:b0:49f:bd3c:bc18 with SMTP id
 5b1f17b1804b1-49fe66f4c72mr292995155e9.19.1790696879396; Tue, 29 Sep 2026
 08:47:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-pixel10-initial-dts-fixup-v1-1-b304868cc3e8@linaro.org>
In-Reply-To: <20260929-pixel10-initial-dts-fixup-v1-1-b304868cc3e8@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Sep 2026 08:47:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VAiHf0-9sPvgGKji4j47rL38Ja3S2yiEfztubgZqBpjw@mail.gmail.com>
X-Gm-Features: AclHuK_dL-VTDHnUEUTR3x2HZaC9uQoYf0vNl-UJk1UZAv-h2C9KslcOuDr2aQQ
Message-ID: <CAD=FV=VAiHf0-9sPvgGKji4j47rL38Ja3S2yiEfztubgZqBpjw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: google: lga: fixup #size-cells DT warning
To: Peter Griffin <peter.griffin@linaro.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, Juan Yescas <jyescas@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 29, 2026 at 4:11=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Fix newly introduced DT warnings:
> Warning (avoid_unnecessary_addr_size): /soc@0/interrupt-controller@588000=
0:
> unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or
> child "reg" or "ranges" property
>
> Fixes: 80f23487d554c7 ("arm64: dts: google: Add initial dts for frankel/b=
lazer/mustang")

Is the above git hash correct? In linuxnext, I see:

54edd8698bb1 arm64: dts: google: Add initial dts for frankel/blazer/mustang

Other than that, this looks fine to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm64/boot/dts/google/lga.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/google/lga.dtsi b/arch/arm64/boot/dts/go=
ogle/lga.dtsi
> index 26a14b3a1b190a..919ee6619d9ee8 100644
> --- a/arch/arm64/boot/dts/google/lga.dtsi
> +++ b/arch/arm64/boot/dts/google/lga.dtsi
> @@ -370,8 +370,7 @@ gic: interrupt-controller@5880000 {
>                         reg =3D <0x0 0x05880000 0x0 0x10000>,
>                               <0x0 0x05900000 0x0 0x200000>;
>
> -                       #address-cells =3D <2>;
> -                       #size-cells =3D <2>;
> +                       #address-cells =3D <0>;
>
>                         #interrupt-cells =3D <4>;
>                         interrupt-controller;

nit: Leaving "#address-cells =3D <0>;" alone in a section, with blank
lines before and after, looks a little weird, but it's not a major
issue...

-Doug
