Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794598398;
	b=xgtsb81cmt8DUVKPMpIl/5nkC//SZUueM/cqHOIgwd2YvNncw4WofUCAaHRjI0216eah
	 hMEqSRcAU3bVK3V1XXrUmLus/QYOIotgIrn0AKI9o0kTtdaBpmVzV4iXWkxl/bT5h+em+
	 plHDgF2ljNuz31eIDlCKQ+0uDv/sAAaFvVfUWjpMlbc+Ib+9mJoo3JnPqJ5n70hbuvieD
	 XKD8z4aIcCvOWUDEVHM62bnBMdslnq0kVnxqCvDctVbmHLXUdrt+EpeDuzz/GzIwpLm+e
	 lw99cLNf9IolQicVnMDgi8sq2Mv9mpOqdGGn3jsEApOEIXisbCS3AwS/tog/lCJVpkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794598398;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=3cvVB8oLNqlQFPwFKMUuhi1X/vDmZWiN//JjPAVvjJ0=;
	b=GhLeXWSZyIyJSzDVPNOcAeNkZUBHrUcIsKap3iWgnJdOnxtzVWC7dVR6xpidKwr71PuD
	 YMNwTq/5Hb3L3sWtEKDN6jwoPcqcLW5OUwP0XwaU6HJM3AIY5SSGJ02o7PsVYU89Y78J9
	 PB7cIFCCxVeJMyc2J1yKre2N8nfBvkTmJUtB4yjgirsWPNR8Is0UFMZVid8ipNfhQPVaK
	 kpaSrs4rFkzjLzU2eYYlX5l0wL0Kzm+uWCs2VdCujw/J3lh93Lh+r6a5PdzgQsYKQshKS
	 PIW3U6TuIWvT2Qie9R9XtSLtU8RFqatd96wbw3TrQ1wB6qmR3pCuHVVthIwIsb3qnjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=fVZBrCXJ;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C7E606A32D;
	Fri, 13 Nov 2026 19:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4C7E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=fVZBrCXJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=3cvVB8oLNqlQFPwFKMUuhi1X/vDmZWiN//JjPAVvjJ0=; b=fVZBrCXJTi5Hl1cAhnGXFJnaRu
	uMXsLtdE1sDHiPTxTusPdRssUAoUOYtakcLkZ/LWCPzewerEA1H1XO/EZ/1+lY8yrLmMxmnww+xHq
	TZhwZ4BjqUxm8JjFT1Hh3b49h1JZt9p7NQ94uXiguQuVByGvEoGY5VDTSNns4d+IwCt+VW1ca3SkI
	Axbdal++FeVlMIzagivufXUhlzcz4hKODHuTW4TjeORRK2WMgIdicX2nI4vrJdtK/sV4UNs1YY+sV
	7FFhJSFN9utZgqJg85ShL++yfXstm5Vo43AtuVyoyAEbPQkr2OLkSFMbocetyE+yxZ1lBA1TNVFRW
	w48brsbA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Tim Surber <me@timsurber.de>
Cc: Tim Surber <me@timsurber.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Valentin =?UTF-8?B?SMSDbG9pdQ==?= <valentin.haloiu@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/1] arm64: dts: rockchip: fix HDMI RX 5V detection pin on CM3588
 NAS
Date: Fri, 13 Nov 2026 20:33:09 +0100
Message-ID: <7ONBekS7Tj-N3VFFry-6aA@sntech.de>
In-Reply-To: <20261111210059.3489502-2-me@timsurber.de>
References:
 <20261111210059.3489502-1-me@timsurber.de>
 <20261111210059.3489502-2-me@timsurber.de>
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

Hi Tim,

Am Mittwoch, 11. November 2026, 22:00:27 Mitteleurop=C3=A4ische Normalzeit =
schrieb Tim Surber:
> The HDMI receiver node uses GPIO3_D4 both as the receiver's HPD output
> (hdmim1_rx_hpdin) and as its 5V detection input (hpd-gpios and the
> hdmirx_hpd pin group). Both pin groups are in the same pinctrl state and
> the later one wins, so the pin ends up as a GPIO input with pull-up.
> The controller can then never drive HPD: the source sees HPD asserted
> all the time, and the 5V detection reads back the HPD line instead of
> the source's 5V.
>=20
> The driver relies on HPD being low while it writes the EDID, at probe
> and on VIDIOC_S_EDID. With HPD stuck high, a source may read the EDID
> while it is being written. A source that does so at boot keeps the
> damaged copy, as it never sees the HPD pulse that should make it read
> the EDID again. On a CM3588 NAS with HDMI0 looped back into HDMI RX
> this happened on 3 of 10 boots: HDMI0 logged "EDID has corrupt header",
> found no valid EDID and fell back to 1024x768. Changing the EDID with
> VIDIOC_S_EDID was not noticed by the source at all.
>=20
> FriendlyElec's vendor device tree for the CM3588 uses GPIO1_D5, active
> low with pull-up, for the 5V detection. The NanoPC-T6 uses the same pin
> upstream. Use that pin and leave GPIO3_D4 to the HPD function.
>=20
> With this change the pin multiplexing shows GPIO3_D4 in the HPD
> function, the source's HPD interrupt fires on every EDID update, and a
> changed EDID reaches the source within 0.5 s. In 10 boots (5 power
> cycles, 5 reboots) the EDID read by HDMI0 always matched the one
> written by the receiver, and HDMI0 came up at its native mode every
> time. The receiver still detects the source's 5V and locks to its
> signal.
>=20
> Using the pin in two groups also made pinctrl warn on every unbind of
> the receiver ("not freeing pin 124 (gpio3-28) as part of deactivating
> group hdmim1-rx-hpdin - it is already used for some other setting"),
> and in earlier testing the following bind sometimes failed with
> -EINVAL. With this change the warning is gone.

you're fixing _one_ gpio, this does not need a novel size explanation.
Please make sure you're writing commit descriptions yourself and not
let an LLM run amok on it please.


Thanks
Heiko




