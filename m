Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C078A231829;
	Sat, 10 Oct 2026 08:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791620599; cv=none; b=StUMYzLSUSp+vNB+igqhGXXoq1O2TXNUFHXrxcm5vJepMxLQTusIccx2pPAwGkoVOWsM82oqOumOL2QGp3W7/ZWErSZIbo4Z0dv+uWO5UxfaOKPqJ3f/HqGU7U1A0lMfjYKwmrGQfaofbKS+Rk9fidnnOlE2NK2jsLzcXzNBo6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791620599; c=relaxed/simple;
	bh=pUwp5JfQhcF0FlXaZwCC6zujP2YgEWFchDAxrDJmUWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rUCWzoIMtGljWDPEgoEvfTWTkLJMjXv4kBj/VyUDg/fXnNsCs/9EvUyszRSNJ0IkpupNI9m87k/NwDXpS7xuep6LluVF2HXrvK1xH+jBmmZbNWqhN7TgZZa7U4WKJZr/m3tiSQlReUguIdlr0sTGLoyRCDCrO2/fCASYpXl3h98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=cFVjYeYZ; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="cFVjYeYZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=q4qTEshWt2clqHxr23WGLtu4UlZg52O4Ci4zCAvCwC8=; b=cFVjYeYZKyuGX3EcWxgxbyoF3C
	7+1zMGHoT2ABfwun6/n8tM2UUPYKc8IBW0tdmoFbltnNuVKnaSjnht0yRtNeBp+pPFacyMnfXQtJS
	CdZFFvL0FoXVvRLVenBbrakpnavaS3Up8y68oePOXhdwx5l58anSb8+8HKwNvMVKo1rxuVweGsPuX
	e9aoxUD7dCjDj32ZLzuKAHxlymuuaoBcarrB6gItH+s3H0ccucmd4YmyNwHTnpXoCiybIQrXc4ENM
	XzdosyEiTRrI2KHRZ7943pMuqA3mTy/GOaXRwrppaZL8LKTKDne0rnOkwVbmcp1ONR468z1WEmjj5
	7DeaUGKQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the rockchip tree
Date: Sat, 10 Oct 2026 10:23:06 +0200
Message-ID: <3462051.VqM8IeB0Os@phil>
In-Reply-To: <askUvlHM8oVO4y-e@sirena.co.uk>
References: <askUvlHM8oVO4y-e@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 9. Oktober 2026, 18:22:22 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Mark Brown:
> Commit
>=20
>   f204f28bd1fa9 ("arm64: dts: rockchip: enable NPU on Radxa E52C")
>=20
> is missing a Signed-off-by from its committer

thanks for noticing, I've amended the commit now with the missing
Signed-off-by.

Thanks
Heiko



