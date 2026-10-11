Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF3B360EE5
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 20:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791751813; cv=pass; b=aLEjqcvfOUa50/ltlNPxGtvczbnwo74z88nrtDOpvmQhFwlY1tNuP/SZZpuS6wxEV7d3QNfnJ7kj/Drz8nTJJ+aHNTn/2yI+V6IwBGoqs8PwQwPUro3OzRk64zgt9zTF0b7kBbIBw/d5Fp6rSZc+b76G8eocBNGtNZymXYrzQiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791751813; c=relaxed/simple;
	bh=DDg4auuOqPrEXGrToBLHCiNJTDyvgWN+z8Xmqs3ZOYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aewJToNutvUaATlYMiu1Wqekoc7dTEM6UCDySzu9q6PCGvumDLCabCcTHKWRiw+2r9IHGuTRo1uZ9ISRknLrDHMktFy42ZjmSM8gXg9XZ9Mqd/jo5DG/iJRZFaLHujv2C0WDzQ5UNQxWnCbR/zyHoRoITiVVwXw67ln2N6EBrig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=XjAPXvFX; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="XjAPXvFX"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67583c777abso1146708d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:50:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791751811; cv=none;
        d=google.com; s=arc-20260327;
        b=ERs7w+Lz5En+G6U4T3Hd3JmXlGwi3ugi9EG0OemY7+rPwW86iRRMzSvxU6TkNdVie2
         9u7+ZQfmJd9c5s56MOoZ719TWkeHSS1L5nSQWpyeIaIJ8g3EMgxVtL1FqCRPgNb4A0l1
         szHX8zay2Lxyh85QhKaytYEIyWTRb/K0iWtw77MrvUScfZvCfQcsjiApDKt9VDE8Zunp
         mIoauHuaoTIFtseNBwNeRbSpzAqDY0usnPKpdtXH86n73QQIgCGFlDjiTwBTLnvvFDkV
         tI/ypqtxlxnWNFzrkOZIxN+LSBZKGDzJqsgqSz6D3npGYPRPLJWoWKWAQb5Y3cSTCUdR
         tnKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rc3F184YUjrOopP/BvFd/ZpML46lL0W1tVVXp9Yb9rU=;
        fh=ZxGzqfPrtCRHz1tnBPZSFU8LZRcVhg5M4RWmZ51PHvw=;
        b=ONMUTL5enEKCcA5dyDb88J28UrduV65UgVy5ikfzeq6Wsqz6UMFXs1BgFAxxsoszjx
         URFW38oQ8o77ES934ggCsExGC4kZmcWFnwq/csjAMRjhF1GACWQai5/qUIDuE7cMrQds
         7EkHiath6tIPw2l2A1xFXLXuO1xCb/SUFOIBVMsMnVeVxomh8jsHSLLzNWOhlP6W/AD7
         YJyDLWUKvmPQETE3QPT1LcY8oLRDHS8tAB5iVJr1wcsACgTiZn98XsliYYgvbMB6CS+0
         RnJrPGeRplI8vDThdsJBIw5Qepc/gFhfd6NXRe0xwQDDtz9J431FYmdJ6huwqqNKpnt1
         m92g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791751811; x=1792356611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rc3F184YUjrOopP/BvFd/ZpML46lL0W1tVVXp9Yb9rU=;
        b=XjAPXvFXH8ronGJIvWKruGn67lXo/MgtL54mIBrVmqD1OF+/SP5hu1752BtKm2Lpa9
         xh0g4uWcnI2HCWxIuZ++rR/nTtAKuo4lvsF5KcytljNhSUSlYvpf9dACZOc03yK/SEAa
         kG7uOqpkjOHQLvPqyJoC5BeHlfXFjni0509WfoXbRuNQ8dbOTc1hH11sKmlycWdFqbfu
         2BxfHN0QPspETjcWlsrP6iZjJoShSqpinxEQzhl1zAQLTFgq5BFcPmq2jGRPXd5wgL/i
         2dsejMB1s/TQ8QjjxeFeCzgDhg8DNZzZXayVOJZzgXO9KAC7dkSRVTUUmRZMINUx5DLH
         9oeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791751811; x=1792356611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rc3F184YUjrOopP/BvFd/ZpML46lL0W1tVVXp9Yb9rU=;
        b=I4b/4684wce9m6onLFxJj3D3CyRzmmi3NGMToglYT6fgqnVAsUBlDpzqfMNmyjkCMI
         ZEVLG+PcEpyEUQBWy8fZkB3HErLc7+qaM+gc7Ihi0JdN1qP2jqa5cms77uDmwTubbE8r
         CAYITQN4exHUaLROtyq6GninFlkZ4wXfj/5ujANkJqd4TTOUJcI+j+Y3kwiG2YRue2/J
         8GJ0LdnRETVBP9rrQbD1DywVDXEnJYl0QHbzk1yMO9OQb7l5eLT66bXvYGH1WgGoBzNB
         mwpapwvZw4Z63G1epiDuP7a/dYNVNy/byMlrO/ZxnMAUkbdv57Y2XShiFc0O3zEHF1Wl
         fqZQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5OafSAjrBeaNHNXkcOPInkhnivPuhoJDsmL7+opoFqET5PNVa3VnAwmNFP4+4k4w83lJXbYIROnL48sQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMJ3oIeLXD3J4UtlMvr/1SX4svw/xDngusSk7AXOa+cACIFwu3
	r/iWtX/hZP0j1G+uvvyMLUijH+HjpK5BgT0BAKDKQonloQ/GPo9EOgyBMWH9++mJIPq5wnpf61W
	jdaYv41THxi23PyGUjUkFSYaVmJCZDto=
X-Gm-Gg: AYBFou3AuiLSGMgZPG8AvMPu8UlGrNmOcSVmbbjVCEY1TbP6rhdH6OHPDXw5iLqfkKh
	if4irFgCxHcHJKfs2YMChpXUydEkHKYaXsWLtfK5OraW5Y00KiYYFJrROVaKOTdZUtM4wlO/0RV
	7miJPGM2Lr1qYSqn2KgETgpFFnmUIiwiYaaeADQQ4B13oDgFAOdUZjaXzMK/ihphRV46snZje0y
	hV/OJn2xhVbYQZxXyzfI5NR5OXcG9yUUWs6QZ0OoV/aK6cm49XOCqrbh65FcFnv43GEvRigOInO
	Seii/aqjBWyVlY2RuVBIJjBuugo+8SvgSYTrvIIMIoS7jhqUAj5WcNCELQMh4TUiwwvt6CDohi1
	ymHBjGBtkl6oH
X-Received: by 2002:a05:690e:144a:b0:672:bd30:83bd with SMTP id
 956f58d0204a3-679369c2fbdmr2874224d50.49.1791751810698; Sun, 11 Oct 2026
 13:50:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com> <20261011-odroidc2-dts-v2-1-a3a4a752f2ab@gmail.com>
In-Reply-To: <20261011-odroidc2-dts-v2-1-a3a4a752f2ab@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 22:49:59 +0200
X-Gm-Features: AclHuK_PzKBu8m_ohCyUp7PhTYe_NgQTHs4WyLsmyGpLktVRlcmdBIs7NzTNljY
Message-ID: <CAFBinCAOsJG=ROP43+pj9dqYc4yWXs4RQisRZghqzbtspp=e7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: meson-gxbb-odroidc2: read the Ethernet
 MAC address from eFuse
To: filipp.dunsky@gmail.com, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for your patch!

On Sun, Oct 11, 2026 at 8:31=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:
[...]
> +&eth_mac {
> +       reg =3D <0x34 0x6>;
> +};
Question to Neil: should the eth_mac node be moved from meson-gx.dtsi
to meson-gxbb-odroidc2.dts?
Odroid-C2 would be the only board using it and u-boot seems to derive
MAC from SoC chip ID/serial number instead of reading it from eFuse
(so I'm not sure about the status of MAC address in eFuse on most
boards).
