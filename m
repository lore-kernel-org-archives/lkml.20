Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20BD53D0BA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871425; cv=none; b=PQGFUvrEkf+YMiHg+jtSGjhEkUAWGtPvmN42cFR1gRnXhGlZoLXRcrLrp8xeTVXkfyTzTueJQBtPUHMAvFBN4A+YFd87kr3p6DUeW2ZtwUjAvrgtDI45397jd6Yozr7mQkiOI20h711NBEABCEHD/pTCqYL5++77v2MiDAKXTr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871425; c=relaxed/simple;
	bh=UJSjgFhs32spsSbz3nbqM96IYqNhxGGxV940WNPjSmk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=giOaFsL5LnInCnjNbRfmjxYfnq2sXKSUQkuqCq9srxkT9opBlJ6ytXkH1/mv/KJ1b2auPLxwteiVmSTyqXwUORiPvcTqaG0MyNd5oKJIbF2hcJWBB01HSe0OEoJw3x7BlcophKHovZn9tijsuRKRprtdAAurDdKXEOP7c3+/Ihc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=I8GKxt+4; arc=none smtp.client-ip=185.70.43.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="I8GKxt+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1788871415; x=1789130615;
	bh=UJSjgFhs32spsSbz3nbqM96IYqNhxGGxV940WNPjSmk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=I8GKxt+4AZwRUYSxuDSeZW+bx2VdPBQpQx6MCOgAPMoyegYxzYC2bSAB77qHdacB7
	 u1hR7INWFLurEv2MhCUc/USgQjpJEN7yrkaoAgIj4oDAZTVdgvo/8Yw4AMOdAlBWhc
	 KOE6JsLl4YSoU+VirPSvJ4IdYydVpXKywvjyo1650+uL0bKjDRcWqPV/qCxmxWEM5t
	 MLkqawmub0hKX7dI4KTQkd7ugm3bAbxVQKw59ggttMd1PBaTmZukBfHAVUy6d454rP
	 3WH1Nh03P9hPVvyTHuizwoIJz76N2ZW0ZYSz062l2W4BskrnPGMpaJZ3IMgCDB+jSa
	 jBOwNRqfvdAlg==
Date: Tue, 08 Sep 2026 12:43:29 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "moderated list:ARM SUB-ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 3/3] soc: mediatek: pwrap: add mt6572 support
Message-ID: <hbDKbnlOf7yqJYJuWVg6P8y7T2ltx6kphF6V0jho-1Z1KNKWNxqD0ffPp6rhjGDfXW88hP4ynycDkZF_1VQZj1PpRHekJqeorEijupq4GRY=@protonmail.com>
In-Reply-To: <27cdcc55-b9b1-49ad-82f3-25e38e3e0e50@collabora.com>
References: <20260715-6572-pwrap-v2-0-bea1d801c81b@protonmail.com> <20260715-6572-pwrap-v2-3-bea1d801c81b@protonmail.com> <27cdcc55-b9b1-49ad-82f3-25e38e3e0e50@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 6ad0deee7d7c11f91a563fe03d94143783dac5a4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Angelo,

On Wednesday, July 15th, 2026 at 4:23 PM, AngeloGioacchino Del Regno <angel=
ogioacchino.delregno@collabora.com> wrote:

> On 7/15/26 14:26, Roman Vivchar via B4 Relay wrote:
> > From: Roman Vivchar <rva333@protonmail.com>
> >
> > Add mt6572 registers and platform data for the pmic wrapper.
> >
> > While vendor kernel source code suggests that mt6572 can be paired with
> > the mt6320 PMIC, no such devices have been found yet. Hence, registers
> > that not included in the mt2701 array are omitted.
> >
> > The mt2701 SoC-specific initialization function is used because they
> > share the same GPS_INTF settings.
> >
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Could you please take a look at this series? It has ack for dt-bindings pat=
ch and your reviews for the rest.

Thanks,
Roman
