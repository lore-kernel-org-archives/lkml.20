Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822056;
	b=tYyIhO25jEEKPgNXfl6C+PZqOXlXy4pT2LlKtbkhQpQtgJLF233zM6Zk5Heu9TCehTIY
	 KO+UN6VE3xPNh+D7PikQOCxLZ56YT3hhj9GiA92s+KYWDdF2sDolwK/EM9Gda8dgT8vjf
	 uf8WsRqCIeB57mHoi3bYN3dYqP3WxftWj0sZnImb1f+Qi4SOPMXziBO8WtboVhbRzbvTd
	 G4iA5uj4m93kzCkb+NuygbzK6t1kIaZ6dlJVEnp8CQYgfyMloUAPljoToHM96UklGXECZ
	 HU8dpGuTfwQr6OdhNrp8Hzimf7gONxhOTxgTQVhl3bS2lc2pu2ExOPkQzftxOWPOeoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822056;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=t0A4JqVei88PAda0QTFJyXNVpSQwkMts1vM2mvYyV1M=;
	b=181vHcB/YstQIOoXOq2Ggzjl9eRI6J/hSIt6LEguyQaZ5wikkcmP3kGFRGv3nQukpI0P
	 nxOtAOZM8G3Blz6RwPkTk01z9FbrrBsOFaIK2FzU1MiUHx3QaEjauVS4jivDuu/zwcLRd
	 yWbIKDTy9Xm0g6d0lsxVuHchPa7SeIHrkSty7csHneTde0jvZqCtply5WcBjgf3dmMiNE
	 TtktqHih/ScJDmcMYkbhoBIBzJrCg3/E6ZbNT26dPsjEt23rDKjusSH0Dek5IsR6d0pcJ
	 2d8RjE0octiFuBTis7sfk93p4AQcU/2Vyui1AHO278/zPHvQOdWi2nMXcuxBQLaVo2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V6zOiqdA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A27B606A331;
	Mon, 16 Nov 2026 09:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V6zOiqdA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FE01F000C9;
	Mon, 16 Nov 2026 09:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794822055;
	bh=t0A4JqVei88PAda0QTFJyXNVpSQwkMts1vM2mvYyV1M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=V6zOiqdAAzNzhN6GeWrTqb5jIK/4Sf+HkBlfm882cesBU4JWbExjQ9nV0kFYnU+1B
	 BYT3gvtWB9GRTlbHP7mZn1SlrvEweW5r8/+je4W4DA2PFoXBh6PK07HurzXIaxjY7G
	 Gcv06gKTPkko6hKveMoDjCbOyPbtjG2gM7QBkhO23rDJ12p4TeJVsAzBRyt39FLMQ8
	 RH44YRU2kMUzw6U48XzHuWgGDdTcWJrlnDWjS+aO4xd3YLr4m888jP78r8yTgQ7Mjv
	 wBU5DRZ28E8lrQb5ERtFCaTzimLb6e4DFY55jLUpqs47JNRpVDG9LXZtValOAeM+Rj
	 UlOHK7BGtK18g==
Subject:
 Re: [PATCH net-next] net: pse-pd: realtek-pse-mcu: add RTL8238C device ID
From: netdev-bot+sashiko@kernel.org
To: therealgraysky@proton.me
Cc: jelonek.jonas@gmail.com, jonas@jonasjelonek.de, o.rempel@pengutronix.de,
 kory.maincent@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 09:40:54 +0000
Message-ID: <179482205440.3136.2338492217413626298@kernel.org>
In-Reply-To: <EEsDzyK4pKqMZ9P6eCtfk5Qp2SXyprlFB4e4uQ7_O1iw3BuvnNm95DKBxuHy-mp3vdmUWhob9UWOzN9VWXoYyQIADqKPNvJt_gfaLaWpSkU=@proton.me>
References: <EEsDzyK4pKqMZ9P6eCtfk5Qp2SXyprlFB4e4uQ7_O1iw3BuvnNm95DKBxuHy-mp3vdmUWhob9UWOzN9VWXoYyQIADqKPNvJt_gfaLaWpSkU=@proton.me>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new RTL8238C entry (`rtl8238c_info`, drivers/net/pse-
  pd/realtek-pse-mcu-core.c:163) copies every RTL8238B value:…

--

net: pse-pd: realtek-pse-mcu: add RTL8238C device ID

This commit adds PSE MCU device id 0x0238 (RTL8238C) to the realtek PSE
MCU driver. Some Ubiquiti USW Pro Max 16 PoE units ship with this MCU,
and before this change probe failed on them. The new entry reuses the
RTL8238B power limits, LSB scaling and power limit command.

Link: https://github.com/blocktrron/poemgr/blob/17771dd7b3a74a64c14351d1cbf8e61676934cbe/rtl8239.h#L13

> diff --git a/drivers/net/pse-pd/realtek-pse-mcu-core.c b/drivers/net/pse-pd/realtek-pse-mcu-core.c
> index c70b09ca20122..9ae61184b5734 100644
> --- a/drivers/net/pse-pd/realtek-pse-mcu-core.c
> +++ b/drivers/net/pse-pd/realtek-pse-mcu-core.c

[ ... ]

> @@ -159,6 +160,14 @@ static const struct rtpse_mcu_chip_info rtl8238b_info = {
>  	.pw_set_lsb_mW = 200,
>  };
>  
> +static const struct rtpse_mcu_chip_info rtl8238c_info = {
> +	.max_mW_per_port = 30000,
> +	.name = "RTL8238C",
> +	.pw_read_lsb_mW = 200,
> +	.pw_set_cmd = RTPSE_MCU_CMD_PORT_SET_POWER_LIMIT,
> +	.pw_set_lsb_mW = 200,
> +};

[Severity: Medium]
Is there a source that confirms these values for id 0x0238?

The commit message cites poemgr for the name. The argument that the
high byte tracks the chip revision shows the id numbering is consistent,
but it doesn't say anything about the units or the power rating the MCU
firmware uses. The same table already has chips with different units:
RTL8239 and RTL8239C use 400 mW LSBs, the EXT set command and a 90 W cap.

These four fields set everything the driver programs and reads back for
power limits. In rtpse_mcu_port_set_pw_limit():

	if (max_mW < 0 || max_mW > chip->max_mW_per_port)
		return -ERANGE;
	...
	prg_val = min_t(unsigned int, DIV_ROUND_UP(max_mW, chip->pw_set_lsb_mW), U8_MAX);

and in rtpse_mcu_port_get_pw_limit():

	return min_t(u32, config.max_power * pse->chip->pw_read_lsb_mW,
		     pse->chip->max_mW_per_port);

Suppose the 0x0238 firmware uses 0.4 W units like the RTL8239 family. A
30 W request would then go out as raw 150, and the MCU would enforce
about 60 W. The read-back would be off by 2x, and the min_t() clamp to
30000 would hide that, so ethtool would report a limit the hardware
doesn't enforce.

Now suppose the part supports more than 30 W per port. Valid requests
would then fail with -ERANGE, and get_pw_limit would report less than
the real limit.

The commit message says "PoE works on all ports used". That covers power
delivery under the MCU's default limits. Was a set/get round trip also
tested on this unit, for example setting 15 W, reading 15 W back and
checking that the MCU enforces it? Vendor material that confirms the
units and per-port cap would also settle this.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/EEsDzyK4pKqMZ9P6eCtfk5Qp2SXyprlFB4e4uQ7_O1iw3BuvnNm95DKBxuHy-mp3vdmUWhob9UWOzN9VWXoYyQIADqKPNvJt_gfaLaWpSkU%3D%40proton.me
