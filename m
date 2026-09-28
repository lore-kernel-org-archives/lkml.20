Received: from mail-oo2-f36.google.com (mail-oo2-f36.google.com [74.125.231.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4677A4E2F35
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612426; cv=none; b=iWrnGiA93O+2Yjn5xGukYRPlnhmK+rQi2nzYK1Y3gTVTv+VRoIzwe+p1kcbEDYClxs+v/MxoTKyw7SAL+CcoDKef159JM+XIg15lm0d6JegCnDCFToMY8sVnegGh6630T5/2EBxQ7fyqUSQiDUMC6dWuvVuZu/IzOdSRmvKeWvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612426; c=relaxed/simple;
	bh=LmuWqcMyTwMuJpgDZBWpwTFm9kIaObVYzEuR7y9gTcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ak2Ics3ltTQBnq6bH5uGOpzgkKrJXG1NVrfL2ny85DRxu1VpUcWRKIAK8wB6t3IQw5BfyGqwZZJ/nflb0I+5Upl4ykU4wxNxTEI6+hNveqrCDB/GCywLXE+Nda34s69EpHq+X7BoJDxMvz6zr5hnz6OPFv5gvIp+pCIx5/vtnNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.231.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo2-f36.google.com with SMTP id 006d021491bc7-6d7530420abso1274411eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612424; x=1791217224;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kDbgXPFrnW3qUuObWck9tBFMLu1xDmnvb5Ge11TXK24=;
        b=pioIy9mTkVPOAjKKJ0Tp+QjFhMa476qG2RrnM5jgtRDPGSqP8DYPyzMP2N4WcC7L/b
         FeUyttmOnBeWiUW976fhfMMflp52IwU8mJGCIVx2Cq8ZvUGnBveeVLe8vb8DAYn4sUhb
         mPkyoeiSN1mrlfNh2k7wP1UcQ+7d73j9e+JwrqYa+sOTvlxADaN9uBQGR+ZTLiLY382G
         kj7A561FHgGJxFDv5BUQbxHkOL65nMiWQQ8gkbuJczS9RU3KinMsfPw5nmF4N+8lwov0
         r5S1rkmNTqd9NhmIjU4e68gte3JMLjy3QA8PGgRLnbDOe8q/qJGO4+1lY/dVxiehnK01
         +eHg==
X-Forwarded-Encrypted: i=1; AKwUvBx7j7JJ1Gv+WVQ97LgmJBPqdDphdBA/SROSq5xucoUjtKAVT1Xw9eI3+gcBhniYABCKWlOgfG8YtMTSF8Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lvNqwmoao40QDieccSx6xLda3xyvvT/B1KdMiGzjVAwEy1OwiO
	bH6TzgyxR3AppuqS1g7vPP2xbrx0S9n3bruo6smTUfUv1aT5uNjn6Dnpgz2NO+Zjg3k=
X-Gm-Gg: AYBFou0OxE+PZWfPcwxQda4gsxfKo01PHvK70aOdWDWFDyARS+nTPbT73CjrDyL/lZY
	UJFHxHuwLVhXwSRrlRWolQh9OsVMkNvVvduienrIh0/8qGmgB7Hn7UNpMxxUwvmI9buRkb3KSx1
	/l6E/ofYOaVj+ksWp7ym+9N6jzfgIQI+3R1aWfl6RzchDavldzettMIcHAL1tKdH5DF3gq86nBr
	Xd3H/jzIEA7WfsYby1gWNCzYF6pUTCjLV1RI4Xa1HqwhezcysadtugZAeWof30guvaCYj5x+KIh
	aRnf1d0Akk8tF+vo4Tdq3x3kfA2uneHgi8ZSeEb9SYjfXpO49218Dzepw4RM1l36ofb654D83Zb
	bCWoPY2eQtxMVpC5uTDNqHjKk7nETaPpSgvhGeCreNjaPdCR/bTySvJGHS2evrVDXO1wutFwsAd
	i0Et0QZZV06Ps/6bjXZv23jbdzQVnElP0rfl3vQ4gnqmWds1p2R7VEkG4VKwn4+/+ve7b8DIOFS
	gzvbp02I7D3FvazgnONKxIlDQMOaJgCHXtSBNev3tWIiPKE
X-Received: by 2002:a05:6820:c8d:b0:6d8:59ed:bbd6 with SMTP id 006d021491bc7-6d859edc139mr3388131eaf.88.1790612424019;
        Mon, 28 Sep 2026 09:20:24 -0700 (PDT)
Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com. [74.125.231.166])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d88221983fsm5785819eaf.3.2026.09.28.09.20.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:20:23 -0700 (PDT)
Received: by mail-oo2-f38.google.com with SMTP id 006d021491bc7-6d8a0df68dfso578156eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:20:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwdmv3V0R5eRTwQuEc3tNfmz11oiChFzh71ugTsHVe1YkUmQfI52WqZYnKUxE8AaCPHXqFt/SZinf0TU2A=@vger.kernel.org
X-Received: by 2002:a05:6102:36d4:b0:7b1:6028:5475 with SMTP id
 ada2fe7eead31-7b1602862b3mr1908825137.12.1790612054596; Mon, 28 Sep 2026
 09:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com> <20260928-rzg2-sr-boards-v9-4-5901e0fc9e44@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v9-4-5901e0fc9e44@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 18:14:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUC2yTTnciUg0RU7N2JCRT+fLeHf6dx0bWGfhfAytrz7w@mail.gmail.com>
X-Gm-Features: AclHuK_AjFWmrE4_ymPqY0VlrZBpkft59awZIm-1fGOKVExdklYpAhT9I-Cw7Wk
Message-ID: <CAMuHMdUC2yTTnciUg0RU7N2JCRT+fLeHf6dx0bWGfhfAytrz7w@mail.gmail.com>
Subject: Re: [PATCH v9 04/11] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Sept 2026 at 16:40, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun RZ/G2L SoM [1] on HummingBoard IIoT [2].
>
> The SoM features:
> - 2x 1Gbps Ethernet with PHY
> - eMMC
> - 1/2GB DDR
> - WiFi + Bluetooth
> - SDHI Mux switching between eMMC and Carrier Board
>
> The HummingBoard IIoT features:
> - 3x USB-2.0 Type A connector
> - 2x 1Gbps RJ45 Ethernet
> - USB Type-C Console Port
> - microSD connector
> - RTC with backup battery
> - RGB Status LED
> - 1x M.2 B-Key connector with USB-2.0 + SIM card holder
> - 1x DSI Display Connector
> - GPIO header
> - 2x RS232/RS485 ports (configurable)
> - 2x CAN
>
> Descriptions for eMMC, microSD and RS485 are provided as overlays due to
> their dependency on configurable mux states.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
