Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751046;
	b=Xkq2XMxtC5d0BX1aQVYpS6/8r+GzpfuxElKoWwUjrUvwk5wEawsbP/p63GiwHVmeNVDq
	 eVTLLbiAFTGlnQ9juQQ3S/7+EQGsH2qYTHEUJa6WJkyXwyv0dItwzT1coxxSnLjqMooJT
	 slSjbELkRmP0C1fEYlJE1F4Jk9WolKbQr4sKWjK7ITIkqXqz8HKDSmDqBRL/Y6YAWozDQ
	 eJVgkzRLA9Jq3/zNPWCoMeEc12athi5tlEhCqHNSiJkOakGEBIKKUr9jaKGOYBpuALyu2
	 uzebUIzSVy84fo6s88jvsTLsQNiPWJpky48rpAFK/5NpsJZRKDb9l9VHFzDJcZxiS1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751046;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=3vylrWaRZ6HTp6CEg2k0KLkoq+UuiUfB7tpMoG7CCXM=;
	b=j9rOnHGApSWJczMg/mqqCdh9kekih2RR5CyYVj0z/xiIyZTRG1AbavmpapSyj24G0Xol
	 FR2zx4hUTp6X1WkzcRubb0Yup/IhDBHYnVD0xXRUNcNBjP3ShemrUdOkV4KlUi0DmB2Fo
	 Bw6pOg7pEDnaW9xHI/JKJ9KEf0nxX17J8I61NGJwMVXUmNq3504a+3vr33XmybFDHZlVU
	 cZOC8VuY9QjV8JvsZrxSELT430OcsLT3SU4Eko2R/rLafw0fE3Oc0Hdyly07LgcchkVtU
	 7oVg2fSKMJyDyZs/ZWYdiusTGknCgoiI++emcu/yHQBiHi0RXe+fNw3cQVgsaKefuyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=LcTLJLdN;
	arc=none smtp.remote-ip=79.135.106.103
Received: from mail-106103.protonmail.ch (mail-106103.protonmail.ch [79.135.106.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF37B606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF37B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=LcTLJLdN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1793751043; x=1794010243;
	bh=3vylrWaRZ6HTp6CEg2k0KLkoq+UuiUfB7tpMoG7CCXM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=LcTLJLdN7dls1Eb42LjjU0sljfzej/j0mRoJCoI/JEqpz84Og45n/iAdrYUTB7qG7
	 g4zwCByzoKv14Lg9zt0AEEq+MZ7AXrWsiw2bO47lSaY3F9cMLdb2KF3mrra2drFOcl
	 +RIsuP+9RS5hgnNbCT6DbgLsdNEUrnYeGkDfevYF6tFuuC1uugqvLCCm7i5u6NZaQ+
	 /yNolww2zoiJrn668P4B5LcgdEQNEDrwd2tJbeDdRh+0xUYcD/XQ+e/poKB7QTGEZv
	 iJORxSXjVKAOJfrDjGJSiXAXYNG0ArLRwPuYYH46IQ9RcfJ71dBvuQ2mXwmMoXysPp
	 NHyujTgIkhH8A==
Date: Wed, 04 Nov 2026 00:10:38 +0000
To: Jonathan Cameron <jic23@kernel.org>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>, David Lechner <dlechner@baylibre.com>, =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] iio: adc: mt6359-auxadc: correct channel types to IIO_VOLTAGE
Message-ID: <NgiLKE_H7ipL5Sr4a9BtoD_3Vgwbi2p9ENNExEER_LDALvpVi6rifnVhx_RgWJGljssso5HfyJ6KD61_viHbOnbv5EAQ7HpKZXWy4vsSf5c=@protonmail.com>
In-Reply-To: <20261103234237.0dbbe924@jic23-hlaptop>
References: <20261103-6768-6358-fixes-v1-0-2a868a33152b@protonmail.com> <20261103-6768-6358-fixes-v1-1-2a868a33152b@protonmail.com> <20261103234237.0dbbe924@jic23-hlaptop>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 301f01c9cbd70ca9bf64fe0e7c75769350a9adc5
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi Jonathan,

On Wednesday, November 4th, 2026 at 1:42 AM, Jonathan Cameron <jic23@kernel=
.org> wrote:

> On Tue, 03 Nov 2026 18:32:07 +0200
> Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wro=
te:
>=20
> > From: Roman Vivchar <rva333@protonmail.com>
> >
> > All mt6357, mt6358, mt6359 and mt6363 declare their channel types as
> > voltage, resistance and temperature. This is wrong, since the PMIC
> > doesn't include any built-in conversion block. It simply measures
> > voltage, while consumers are supposed to convert these readings to
> > the actual temperature or resistance using efuse calibration.
> Hi Roman,
>=20
> Useful to have an example of the consumer that is doing this.

I have sent a PMIC thermal driver in the past for mt6323. I will send
a new version soon, but it will take some time. It should be compatible
with both mt6323 and mt6358, since they use very similar formulas.

>=20
> >
> > Correct all channel types to IIO_VOLTAGE.
> >
> > Fixes: 3587914bf61d ("iio: adc: Add support for MediaTek MT6357/8/9 Aux=
iliary ADC")
> > Fixes: d6f49313272b ("iio: adc: mt6359: Add support for MediaTek MT6363=
 PMIC AUXADC")
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
>=20
> This one makes me very nervous, not because it is wrong but rather
> because there may be a bunch of userspace relying on these wrong
> channel types.
>=20
> It is horrible but I think we can't touch that :(  What we can do is
> put the right interface in place as well. Thankfully it looks like
> the channel index is independent of the channel type so we can duplicate
> the wrong channels with voltage ones + some comments to make sure this
> doesn't propagate to any new supported devices.

I believe it's a bug, because all MediaTek PMICs I know can't report
temperature or resistance without consumer. Some channels like battery
voltage were overflowing sysfs, producing garbage result.

> AngeloGioacchino, why did you go with the different channel types?
>=20
> If we do decide to go ahead with this approach, are there other channels
> that are validly using the channel type for non voltage? If not change
> the macro to drop the parameter.

I think mt6359 may be able to report battery current. I can't really tell
though. mt6358 seems to wire current sensing to FGADC, which is separate
block. Perhaps someone from MediaTek or ChromeOS knows more about this.

Best regards,
Roman
