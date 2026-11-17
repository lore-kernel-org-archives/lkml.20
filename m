Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794920680;
	b=0oPyVYb21zgx3mkX0qAu+jx9vd9yQ68sZCOkiVBdEKt8E67pCKNFZlEeZYagJFgdwoGu
	 c9Mx4Xhw1ZPYLtoh0eKitLCwIfKpUFczUVgxCwAw5pSbbBDJO1ATDlShfQ5bmrn0rruks
	 sw7fx9z70AJObnYAu+pfQ75CoDoqKoFTTlTxV9PxQ/8NwgA/i+W9HUgerYSR42L4meaLr
	 YVdDMR6xbWmi8F5mN/QFUumGHu5rfJ0+NrnDgT9tRecgtWhnC/dYexgGyuJFl/Rg6WvXO
	 dsXlAG5IhBxdIrlWfwA8FkY3BwwXXTfRfoNrH90AmeJUnO4Anp015KFCPyjMhy8AnqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920680;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=3sldnPBu0waTZ/5txqwNAnRVVWR9mIFe5mEWkyluFHw=;
	b=qgRGhlgA99cjzhJAJfqAm70ChQF3cKJcE9qGGQRVVbwl70Z/Mv/wNnw2c+x9m9rv/W+k
	 ysMYpW5GiqhRmegtcN0VK+WrZc4Bzs+t+I9B08EoI+tJv3ZlEUb6mwt0YG7s2kAE7iNp4
	 JLYQtPO3V/C5hyRSlXj+VzPvVpDK02gLmcRYqt4yQExhIFr0uCkLD5FGy3I7piqGDbbAm
	 ms7/NtlcEwcpnKuo3/zg37whl8tt8F1sQ+pClDATT/JfXA7hKffQulniRhVo+UssFgrGD
	 ltYUDwgsOuYCg8r/nma4ZRV8/1PwmkIxymfv9C2PrlvK4NIPknzP1cnbNxiwMRn2SpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ON1Up0b9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FBE606A333;
	Tue, 17 Nov 2026 13:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94FBE606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ON1Up0b9
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 07A3E205A51;
	Tue, 17 Nov 2026 14:04:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794920678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3sldnPBu0waTZ/5txqwNAnRVVWR9mIFe5mEWkyluFHw=;
	b=ON1Up0b9yaUOJGxlQjS6m9WrMbMpBJf8RpuzeW35eJPYm2vGuaZAcoZrSHXG8nUP/0bVsZ
	zUu7gyrQ4X5MZTVLkSkJcnYnUF0vBRaWrStk6MEZBiHUr/6FR1EZp5BtDSxmiTuLvjBwCe
	E8QNacvGB9lSDqdcmI2nSeot6qMBNkxbzWB53AbL4cHCY/RZlZNo/zb6dwN/YrEK61DR2S
	lnl/FoWzlrc/kVnnO6GWkxtfPundiLDGa63uyohc9W8+a/aJxczd31OcOCTJrWNs3Zdgly
	D0x7X7LNG8TP32+TnYeWgN2tS+yptybXOSTojR5zqgvLqGff8cRmAzov6trD/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794920678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3sldnPBu0waTZ/5txqwNAnRVVWR9mIFe5mEWkyluFHw=;
	b=YodI/S+gZYToN1CQQ4A/vCZIIX68x2bFJRbGoqrYriQnHwmZXtYKLTA7wZEYwQ6uT4zJrs
	VZUFfpd19P1DXBXOILx2RvOkug0/zGKZYixODuiLBtK0ictLM0sWbtzopWG1ljY9LQleD1
	HuaKZmEz7qj7cLF6RlInwYzEEXXQeQfKYNAfM0i9IR0blhqQhunGY0xUZsaqHWjTTd6+8c
	E7uilpwlXbM9M5ORxDFSFeG0B7gcGDgZLBJyCfePxEL5H/j8+fcGgZW2Rh45Og3nCJaED3
	bnSUFzxr+6cq9AOsgX/YYQfRGWGsx4flQr11iEJtvNIcuUzyU6PM2FUvVmn2PA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794920678; a=rsa-sha256;
	cv=none;
	b=FizaN7fiHZooAAithQdKcc3AWJcBe3i4BDHngA2I7AKlpz2gFx2hYjTIyHxzncn/KZor6i
	44EC8zOdU2f/GTLwe2Z+czI4u2gWJ6XggSXArjgGjKK4k1roVBs8sop3mUnTmUuYR8J+QP
	mk5kyDINlm7Tq1xCUM2fnXqIQ/5qOMnF3P7y/DnFmDLBTw43aje21TnYAYx3ws/xEl87aA
	skmML6kNol3lZSh52xAZD8L3fZFLZO/5Vs9rN990Sj/rYl49YEpX6kGesF8hf7UyBKJ1Y7
	Sxj1PIxy3K68yaZ2o8XzWfOs2eI2mcnIk9ow2RoNsh/ECermFzZ3RcFa1Zyagg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <80d4ca224b264acd5a2496ce5920e2dffd5f50b3.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] phy: sun4i-usb: Assert reset before deasserting in
 phy init
From: Philipp Zabel <p.zabel@pengutronix.de>
To: admin@roadbobek.com, Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec	 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Vinod Koul	 <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Date: Tue, 17 Nov 2026 14:04:37 +0100
In-Reply-To: <20261117-usb-sunxi-reset-fix-v1-2-c2b76e0e84e1@roadbobek.com>
References: <20261117-usb-sunxi-reset-fix-v1-0-c2b76e0e84e1@roadbobek.com>
	 <20261117-usb-sunxi-reset-fix-v1-2-c2b76e0e84e1@roadbobek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Di, 2026-11-17 at 13:00 +0000, Roadbobek via B4 Relay wrote:
> From: Roadbobek <admin@roadbobek.com>
>=20
> When a bootloader initializes USB before booting Linux without
> first tearing down the controller, phy->reset may already be
> deasserted when sun4i_usb_phy_init() runs.
>=20
> Because reset_control_deassert() alone is a no-op on an
> already deasserted reset line, stale USB PHY state can
> persist across the bootloader-to-kernel handoff.
>=20
> Assert phy->reset briefly before deasserting it in
> sun4i_usb_phy_init() so the PHY starts cleanly regardless of
> prior bootloader USB usage. Tested on an Allwinner A33 Q8
> tablet (Laser MID-786).
>=20
> Signed-off-by: Roadbobek <admin@roadbobek.com>
> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinne=
r/phy-sun4i-usb.c
> index f26eed0db17e..05e6dcf035a1 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -270,6 +270,8 @@ static int sun4i_usb_phy_init(struct phy *_phy)
>  		return ret;
>  	}
> =20
> +	reset_control_assert(phy->reset);

No error handling?

> +	usleep_range(10, 20);
>  	ret =3D reset_control_deassert(phy->reset);
>  	if (ret) {
>  		clk_disable_unprepare(phy->clk2);

regards
Philipp
