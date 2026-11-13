Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602564;
	b=OJXaG7Wo00BUHtZeQVVpyMF+qWRTcZDOl8RexiwwQDze+/dgE7UP+e5HIVax6Nyjjnay
	 +KuddsxKLds5BZXfqs6e3V/nf8OPt3B4njFXkapPpmXPHB+47zBWGlfWfaABgh1tSbOSx
	 JjSecbbgPYHnfqX/WrGZ8DeV+XfclsWS1yTwNi4qSEdC2BXNUFiLz+u+7TxrwZ17pNZSW
	 MPSvkEPjAOJsfb9PlOAbOMH6yVj7ws4jryhUY7QVApQnSJdHfIW2bOQN9WxPepfJbs1Dp
	 DcBhbfqHOW5YB0nG6yYgvKJh0vO+CcxSkAY4bDoI3XEkrkmRQd6y7HCX/GzL/qtcgAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602564;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=YAdamMR8GtstdFSlMhrRzbOBWBG4qIbe0wTjGGjDiwA=;
	b=o3cDOr+dcjHr733AHcKfq9kpC5owokSWqPdFdF0zLDJnSJ7ajn+ZnN7HlmmHivkEZ99k
	 Zk/PXHPL+fXDTpERRWlf8yJU/9wp4fw1rMdf/v/baHxoSR/6W/J0Jx8F4hua7zfDjD960
	 QBuntwmh50bmJblGHB3xSWz2iGsRG6B4yHhB/e/t+Was1SHJadAjzjqhynCgqdDsik6xT
	 cufqcPhxbVx6rhm8NV96+EMJubC2aEkkF9oGdZJv9tobxmg8teQlLFz5Lmtl3vruOjWez
	 Rgwcvun+ACfRvv68e/j9etw8BFFsytB8Id14Mhuk9ybdc/QaKgOtmjEMVzb1mTqvjyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b="L+/347sM";
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8B6606A331;
	Fri, 13 Nov 2026 20:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA8B6606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=L+/347sM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=YAdamMR8GtstdFSlMhrRzbOBWBG4qIbe0wTjGGjDiwA=; b=L+/347sMtegLNHELLY7zT/q+Pm
	5TB2i1mEmMSSFoaCdgHLQxsIqVR6KvDa9xynuBb369HFBNfHLmT78nh8sY4m5mgTzR7fxEPydbq7z
	WaP3ADlq8anyST6nFH4pIL08mptZNcCI9c3+o6VbEXjgatNh8RTzh9Dkx8B9jOVp5NMG8HJQ+tWVn
	5yoDlXzESHbetaSid7t0LNPlpQ3ucb7gSsk6Z5ChMjnUj8+Xpwkl6F91x2IEnu23yzsZU1/szk63u
	tnVvx7WRGUOrYbIcA4t0g6nmP7y1ZOFAmLBMmhtkwxb/wHlE/+CpibnAAiYkLe6ObSOdjtKjXRc5l
	cIZMQ88A==;
From: Heiko Stuebner <heiko@sntech.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sebastian Reichel <sre@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, kernel@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: rockchip: Use DP AltMode defines
Date: Fri, 13 Nov 2026 21:42:34 +0100
Message-ID: <6TUX_NmlTWq-Z5zuCxQLsQ@sntech.de>
In-Reply-To: <20261017-dp-altmode-dt-defines-v2-2-7ab3d93553dd@collabora.com>
References:
 <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
 <20261017-dp-altmode-dt-defines-v2-2-7ab3d93553dd@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Samstag, 17. Oktober 2026, 21:59:31 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Sebastian Reichel:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>=20
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable. This also fixes up announcing
> 0xffffffff, which is simply wrong as that allows using the port in
> upfacing mode (i.e. the board receiving DisplayPort data, bandwidth
> above HBR3 or pin configurations not handled by USBDP.
>=20
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts        | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts         | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi      | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts     | 8 ++++++--
>  5 files changed, 30 insertions(+), 10 deletions(-)


Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Could go together with the binding contstants or then one release after
patch1 gets merged.


