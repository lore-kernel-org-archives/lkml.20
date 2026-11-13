Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794600546;
	b=1uqAXz6tf3T6w2IhbXpOZ4Qz0GmxCf2BcnwK+VTcPxB1sC3hS0ywKPNUBnddoaetj4Wm
	 2NA05SxzSZhXxGte029v2M9Lt68uRSS15BR091nyJIRtkujlULnkzrNkpMeAxBUc7lBuJ
	 7z/HXGNSmRNQX/VMo6hIbmHJJb9TEwwsk4B9DNIjqRtxSoN1NarArrHl2RebsnjiFeC4T
	 eD6r0IeM2LEm6atv2HgrGqidsXhMvLkmP2evQny1AMAm0zNWfZ7xlOaNNpy4hgW9o85DO
	 sAzK3bUiuEBp3CXXS4yLyaaf04dZl0hbU0Lc1Zzfb7kxcdyMCkjZu6wBDGtNGIkTp+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600546;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=OzoadZhT6+7BRQ3IJcP5Fei5yMlRSCEB5hfbLUnwCWI=;
	b=YJcdF3iNxlJtyaKmfGLqlm4F949UXlBRlSDwpV/ypsGB6Hgb2ATSZ9h3gQOnWxM4HMhK
	 EMhdlMHHPr0Atj8/9csgP4qXcSu0pTt1KeTHjL6h/CwEQ6FwkCZ2GcDPmwWfboQDts8Op
	 XrgO11FitgUEbwBUWGwXRajT3ls9iwgauuygjUWBD/Em1rghgvOcpjpqeDHmVwdmCO+Rf
	 FGnmVTQBOvOSqvmKTL8Z9iFAYVZJTk9wVEzLzkkR25dxr0Z5Dt9yaBpJ+6tVz0Mnmrqyh
	 19jP+CkTcF6QV08tRclYXoLVULoiImGGC81dBBaGzmqugPVhnRMTr11J1//LCV54LXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=WSWhl2K6;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E22606A897;
	Fri, 13 Nov 2026 20:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94E22606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=WSWhl2K6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=OzoadZhT6+7BRQ3IJcP5Fei5yMlRSCEB5hfbLUnwCWI=; b=WSWhl2K65oqcQXRPW3xwJqF/pO
	zFtu5vaJYoHz65FakgJo1v2gCjH/3pMRL5An5WODpB3VF4tU8B1kIEVDK70z/Z+OKmcPZr8lhisuc
	vYSSOWoFAW1Igw+OpjRecyGJ2ZIgMqjr44BiO3MXe030HObNNVx6RcAeq6i3dEaPndEPyYsWHu115
	oaq7Q+0o3At+Qv9pq0IPMNyxOW6BeaKnDGjS0/gc/iB9vE+7DD3FuorFsOtHO3OoPUZSio/IUCSzq
	bB1rIRoQR3aO0k3a2aTl+1DNMx//skVXripCpxQ7dzEG6hFYhbZar0ZChkWFdgP+A7dCdVObJ729D
	ff/NKobw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, iav@iav.lv
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Igor Velkov <iav@iav.lv>
Subject:
 Re: [PATCH] arm64: dts: rockchip: Enable SDR104 on the ODROID-M1 SD card
Date: Fri, 13 Nov 2026 21:09:01 +0100
Message-ID: <ozv3Kw_6ToOMhu6IF4wDPQ@sntech.de>
In-Reply-To: <20261110-odroid-m1-sdr104-v1-1-8edc6d5c1bf6@iav.lv>
References: <20261110-odroid-m1-sdr104-v1-1-8edc6d5c1bf6@iav.lv>
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

Am Dienstag, 10. November 2026, 03:50:01 Mitteleurop=C3=A4ische Normalzeit =
schrieb Igor Velkov via B4 Relay:
> From: Igor Velkov <iav@iav.lv>
>=20
> The SD card already switches to 1.8 V, but only SDR50 is allowed, and
> clk_sdmmc0 on RK3568 is a mux without a divider: dw_mmc-rockchip asks
> it for twice the card clock, 200 MHz for SDR50, the mux rounds down to
> the 100 MHz parent and the card runs at 50 MHz.
>=20
> Allow SDR104 instead; the MMC core still falls back to SDR50 for cards
> without SDR104. With the 150 MHz max-frequency from rk356x-base.dtsi
> the clock comes from the 300 MHz parent and the card runs at 150 MHz.
> Hardkernel's vendor kernel already uses sd-uhs-sdr104 on this board.
> With a SanDisk 128 GB card, direct read goes from 22 MB/s to
> 58-64 MB/s and direct write from 20 MB/s to 47-50 MB/s.
>=20
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Tested with an Armbian 7.3.3 kernel (rockchip64), the property added to
> the DTB with fdtput: reboot, sysrq-b, watchdog reset, poweroff, s2idle,
> deep, hibernate, hybrid-sleep and suspend-then-hibernate; the card
> re-tuned and came back in SDR104 at 150 MHz in all 29 runs.
> ---
>  arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts b/arch/arm=
64/boot/dts/rockchip/rk3568-odroid-m1.dts
> index ec43dee18094..6f77e73abc8e 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
> @@ -610,7 +610,7 @@ &sdmmc0 {
>  	disable-wp;
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&sdmmc0_bus4 &sdmmc0_clk &sdmmc0_cmd &sdmmc0_det>;
> -	sd-uhs-sdr50;
> +	sd-uhs-sdr104;

You then want both of them in the file.
The devicetree does not care about what mmc drivers do internally, aka
that fallback and the properties describe

SD UHS SDR50 speed is supported
and
SD UHS SDR104 speed is supported

So both are needed.

Thanks
Heiko



