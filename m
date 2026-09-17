Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69415569F1D;
	Thu, 17 Sep 2026 14:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789654219; cv=none; b=Vn41i6IgobfUsQaBfqdRCi8jmonysA7jijC0QEOCHCrehiomqvLheaJvipjkUf7FLzm+rsLjzGHpH1PsInMU1m4qCozt7TMUP6z70Qv4mbbdIfZXrcQ1iuNZ9l8RCmoNVyfLJt9ygmWWO2mS+YnUnH+WUaEm5kmA2drlvprOM6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789654219; c=relaxed/simple;
	bh=U0kQ20G2GyxZdcHxUkGcj/TBXWhOw07BqxWa+U6dizM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k/yoa6l2RKgEs5wKC7F9elEf9vhkT3bxlq/H088xZaY2PFePQezlZ+SLYqRinjnLF1LPkGJV3Oc8orRRFQrHD9WqBh5wC1V7WYn3un1Np/SqUNg3+erNyPlI4WfN1UfWCssrSBEphPVZEaxcTerXf89ouJ4qJoiYee3W8b+czu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=VpH4rEUB; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="VpH4rEUB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1789654209; x=1789913409;
	bh=U0kQ20G2GyxZdcHxUkGcj/TBXWhOw07BqxWa+U6dizM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VpH4rEUBVwNKZgtPJluSktDjlAEaDfH9VaOD8Ng8JlUBzmMpsjdlGr8CVNiWja20l
	 gO+htypaYTX/BL0L05eQMXuidQd9iztEmx6LJOJy1jYmXmLXWk6XsV76zS+eCsA9pJ
	 rzJxATVC1aU0YNUbVeDpfD5H0fQGgkEpzU/7kF+rYpOfCaxw2Cx2aYofu16/UFk3sX
	 sOd3eseesWQLxg21VH/VbgXWW6C+UF1annJDvjofIez00QrXGyM16DTiOKz5eB+lyb
	 7iyjkWnxJBtzIq0qxrVqwyrOhob62RKIfxEMdGJS1Rdj8Ig8BJKR/jFpKka0mW9gpZ
	 peV8noiaE7Cog==
Date: Thu, 17 Sep 2026 14:10:04 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: mtu3: introduce platform data
Message-ID: <W3RQEXxvwip3Mexf-O8unMK1o-0tjlq2OUYD6DJVSdy9d6JmV0JJsp6RmWGcecqc8KGiLlxpuP-vE2u03s29zsytiROc17Vp_EoVQdjqyIg=@protonmail.com>
In-Reply-To: <b3b2f2ae-1eb1-4d3d-9f4b-4de3868802f1@collabora.com>
References: <20260917-6595-mtu3-v1-0-a2ba7c230d68@protonmail.com> <20260917-6595-mtu3-v1-2-a2ba7c230d68@protonmail.com> <b3b2f2ae-1eb1-4d3d-9f4b-4de3868802f1@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 2e9365794284a1e4314c717f619a219150d8bd88
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Angelo,

On Thursday, September 17th, 2026 at 4:41 PM, AngeloGioacchino Del Regno <a=
ngelogioacchino.delregno@collabora.com> wrote:

> On 9/17/26 09:32, Roman Vivchar via B4 Relay wrote:
> > From: Roman Vivchar <rva333@protonmail.com>
> >
>=20
> That's good, but the commit title doesn't explain anything.
>=20
> usb: mtu3: Add SoC platform data for FIFO slots ?
>=20
> ...or anything else that actually explains what you're doing.

Ack.

>=20
> > Some SoCs, such as mt6595, require specific quirks for the MTU3 to
> > function properly.
> >
> > The mt6595 IP block doesn't support multiple slots for the FIFO,
> > resulting FIFO wrap.
> >
> > Fix this by adding platform data with a field to handle FIFO limitation=
.
>=20
> Well, also say that this commit brings no functional differences for the
> currently supported SoCs :-)

Indeed. Will do.

...

> > +=09unsigned single_slot:1;
>=20
> unsigned fifo_single_slot:1 ?
>=20
> ...or you can bring the entire pdata structure in there for easy future e=
xtension.
> Your choice.

I don't think it's worth pulling 4 or 8 bytes just for one flag. Let it
be a bitfield for now.

Other comments will be fixed in v2.

Best regards,
Roman
