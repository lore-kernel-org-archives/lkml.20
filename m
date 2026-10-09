Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B2545A2A0;
	Fri,  9 Oct 2026 07:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529296; cv=none; b=e5TPVtnlqVrfF1XMwvf00Zvv5T0FQ/qENv2y5YqN0DmdigldvhXxdLdwPg5f6AXI1sCwXFCVUMk/Y4xi4QZzrLQHN+NNN63/CGBtMAfXo/119eX8t5yl6B1aoLb7cEBMvRmzFzSauqj2YuufNu4IbacKyg5HcY2pzmbldg4LS0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529296; c=relaxed/simple;
	bh=+91t35kC9azxaJ7tn5uxXVCt7p73eVSoJGIMEFZ9A0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOig4hag6PfFFNBHhuzC5QQ4zdVPD0aEU+29MqLI+jbDv3v/4hw9XrGTM/aOk+oYlkgGycar8DULNsqVzyXExSi7jaHA7VCsgAOIvPa2wv3ymSCVx5klTYPjDkLfbrurC73E7U5yHBQ21zTE/ubCeMfBndi/Hi5HMOf19rtbZNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cP/hEPkh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cP/hEPkh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971AE1F000FF;
	Fri,  9 Oct 2026 07:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791529294;
	bh=bIN6kVXaJOz/2xV7De35B3BNaqdax21dBtC4ofIPkDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cP/hEPkhU/PGlPuC5tF3GDsygpQaZ5CgIeRIAn1PKrh95VqTa9VjZ3hAr6EjFff76
	 rCgspSzDCC810jAhBBVjLKUL9iWvxWLq1uK/zssIfxZP6tbf5zn3kIstzlPVZ8kpzR
	 KkJwXG0JlBZF6JndDcgDZR1mNg1FZ4i1sJqPvaizEs+i4ir3Y6m4MLQtRFgAM8uoXf
	 SiCj0+h+t33tVIBV0dgTTgG/jf6zEmvrD4VKKZGFybkB7a38ef3jCQX1o04/PmOdGC
	 2/3LlaPGuiwLjOGQ762oVLm13dpCUxZONvjJFmNC5byFcAC6ZLJd5QlSK09EflpMME
	 dllTs+xGK1PEQ==
Date: Fri, 9 Oct 2026 09:01:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Steven Price <steven.price@arm.com>, =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: gpu: mali-bifrost: Add the MT8188
 MFGCFG phandle
Message-ID: <20261009-sparkling-broad-dormouse-ae1ff8@quoll>
References: <20261003200132.866240-1-michal@nozomi.space>
 <20261003200132.866240-2-michal@nozomi.space>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261003200132.866240-2-michal@nozomi.space>

On Sat, Oct 03, 2026 at 10:01:30PM +0200, Micha=C5=82 Kope=C4=87 wrote:
> On MT8188 the GPU timestamp counter only counts once a register in the
> MFG configuration block routes the SoC system timer to it, and the
> setting is lost whenever the GPU power domain is turned off. The GPU
> driver has to restore it on every power-up, so it needs a reference to
> that block.

This looks rather like power domain issue, e.g. missing restore of
registers. Otherwise next time there will be one more phandle and then
one more, each for one register being lost during power down.

>=20
> Add an optional mediatek,mfgcfg phandle. Allow it on MT8370 as well,
> which shares the GPU and the MFG block with MT8188 and its GPU node in
> mt8188.dtsi. It is optional so that existing devicetrees stay valid;
> without it the timestamp counter reads zero, as before.
>=20
> Signed-off-by: Micha=C5=82 Kope=C4=87 <michal@nozomi.space>
> ---
>  .../bindings/gpu/arm,mali-bifrost.yaml          | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Best regards,
Krzysztof

