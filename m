Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855363;
	b=4NgX6h/JN5buqJPCALolGrbkIKEKZc59kF7T1iHejPIxm0tl+bIXcLWjJdBWyMMEHQ/X
	 B6fLU5l41L2cEVMEd5hZ/X9wcpkYwgGmxss7P4WA0BeV0rBe4ep8n0NFYbqS0PqUW2N4r
	 6JnmWPeg0qM39RFGYSS/JdMo93vLVOawOr8sdX1ZJJ56kcgPxHmtZn2rhTbMdYitWgou3
	 1bd60XXVf5/a0F58JyvUmLG1EgVJTVyQPh6kq0UF7iyaQRtpW3IAMEYBWrJEYGZRsiecB
	 NoZcoEGNHE6EqGhUwo7i3/aFqM9CUf3baeFiHoxiMMKvECSlgdp2LSpC+hMUp5C6ccg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855363;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=dskaboM+PKWObDQPl8rS3WRd5zgfKKK9f364EmuqknE=;
	b=zcupGIwQEL02dhRZsvnvLyjOglEuiW568gJXuKNo0/+uz/fb1wPqiqbl5nVCg5T3Wh4B
	 o0xkr5qDJ9LERAAR1bHK0a8HXWhRjGiyTrgb6LlLBOXAhh/yhGxVrW6A42ePT64fEcK2E
	 gtXAALY1Hvca5uaoCBqTTikSfOUEXa6Pt6vl1OzmfHjVMWiYlzbW27eNOYQtk7HbHUQYS
	 AfB2mL74sJy8deM+ypmtE0E1ZNsuyC28xoU9IJ9pCGILp4tiGDmV3HF4JmYCfoXYo7/e1
	 A35VtA5KSgC7ns5JQQkIS44Kq1s7JAq3MKAyRXsQvXAwCLx2HU6W2gccVrD1QnGJMbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mEcdhUn0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B413606A884;
	Mon, 16 Nov 2026 18:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mEcdhUn0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03FEF1F00929;
	Mon, 16 Nov 2026 18:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794855363;
	bh=dskaboM+PKWObDQPl8rS3WRd5zgfKKK9f364EmuqknE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mEcdhUn0cR6yQly89al7B4uoyd5DXvUB0gOK2JxLbkzs0mdfoYeyFNGF/UZaVAhGq
	 QJwjZnamNrOiwEQsT0aAwkG9DT6L+qI9SIN8UxWeSrEOhLQ8GCt6N0OU2UaVgiDPNc
	 hPRjJ8+kWXwRQhKr2XpuxdH+J56EIzaBhhRF5Z/zZzK1jVewX3hpfXbQdEzj4IjBRW
	 5fgq+Ol6bXPPnQLh463CtvtfzfhmH+wusHC8EgIFd8MvtQI54ut/NCCQTNURRcAmKt
	 0Kef9b48dylBbP1dq5tz98zvMTH0m4WPMlTH1c3vHo+MAfIIRa18KOudiRcsUt6vNW
	 3evUqOQFvP7ag==
Subject: Re: [PATCH net-next v10 12/12] net: dsa: realtek: rtl8365mb: add
 support for RTL8367S-VB
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
Date: Mon, 16 Nov 2026 18:56:01 +0000
Message-ID: <179485536152.3136.4120441501421213878@kernel.org>
In-Reply-To: <767d6461-abb8-4411-a8b6-a7bfaada6d10@yahoo.com>
References: <767d6461-abb8-4411-a8b6-a7bfaada6d10@yahoo.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] This last patch in the series does not finish a cleanup that an
  earlier patch said was temporary.

--

net: dsa: realtek: rtl8365mb: add support for RTL8367S-VB

This patch adds the RTL8367S-VB (chip ID 0x6642, version 0x0010) to the
rtl8365mb chip table as the first chip of family D. It also adds the
rtl8365mb_family_d info structure, which hooks up the family D callbacks
added earlier in the series.

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
> index ebc7d19fedd0a..1ea11b4016c0a 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c

[ ... ]

> @@ -812,6 +821,21 @@ static const struct rtl8365mb_family_info rtl8365mb_family_c = {
>  	.l2_mc_to_data = rtl8365mb_c_l2_mc_to_data,
>  };
>  
> +static const struct rtl8365mb_family_info rtl8365mb_family_d = {
> +	.family = RTL8365MB_FAMILY_D,
> +	.num_ports = RTL8365MB_D_MAX_NUM_PORTS,
> +	.jam_table = rtl8365mb_init_jam_8365mb_vc,
> +	.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),
> +	.ext_config_forcemode = rtl8365mb_d_ext_config_forcemode,

[Severity: Low]
This isn't a bug, but now that this initializer exists, should
rtl8365mb_d_ext_config_forcemode() become static?

The earlier patch "net: dsa: realtek: rtl8365mb: set speed for family D"
says the non-static definition was meant to be temporary:

  Nothing points to it until the family D info is added together with
  the chip table entry in the last patch. Until then it is not static and
  is declared in rtl8365mb.h, so that the build does not warn about an
  unused function.

After this patch the only user is this initializer, and it is in the same
file as the definition:

drivers/net/dsa/realtek/rtl8365mb_main.c:
int rtl8365mb_d_ext_config_forcemode(struct realtek_priv *priv, int port,
				     bool link, int speed, int duplex,
				     bool tx_pause, bool rx_pause)

The prototype is still in drivers/net/dsa/realtek/rtl8365mb.h:

int rtl8365mb_d_ext_config_forcemode(struct realtek_priv *priv, int port,
				     bool link, int speed, int duplex,
				     bool tx_pause, bool rx_pause);

Could the function be made static, with a forward declaration next to the
existing one for family C:

static int rtl8365mb_c_ext_config_forcemode(struct realtek_priv *priv, int port,
					    bool link, int speed, int duplex,
					    ...

and the prototype dropped from rtl8365mb.h?

The family D VLAN 4k and L2 helpers should stay non-static, because they
are defined in rtl8365mb_vlan.c and rtl8365mb_l2.c.

> +	.vlan_4k_read = rtl8365mb_d_vlan_4k_read,
> +	.vlan_4k_write = rtl8365mb_d_vlan_4k_write,

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/d9da17af-f49e-4878-a8dd-59a8919e6930%40yahoo.com
