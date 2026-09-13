Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52339223328;
	Sun, 13 Sep 2026 18:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325302; cv=none; b=lXjH7NOlXYfISO8Q0PFRY8T7pLBcrMrl+bZ52cqTTlyNxMwpiaSPb9n25Mj5orL5P2hUheJSiyLYptIqmeljaXiIxmXUph8cgU3D/Lo4dyPHHLQuRLicj6AWqiB4GOkrHjVx1DPsVJPSstQUiE4fOothiTXNNaVuMUk56YVqIt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325302; c=relaxed/simple;
	bh=jcaY9vDpPQPnm2z4c2QDBO8e+9rw8kjZxKZUVN8kGm4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CzTUD/BqtBAhUOMIqPuph1daCe1skI4svJgci1F3P6VFr9I/Q9UyYEmdX2inoSRa3/BY9/Qy8YQTTRwxVDIUHsnoyoz9ph5ff7F3oZg0RkTOEQ285LPYy3B2ibLoOtqTmBDyNhy+KgXyGAD7XLuPNQct3wMKyQco9UwSrcwfkvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=0spi0UP0; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="0spi0UP0"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 26091CD5E7;
	Sun, 13 Sep 2026 21:48:18 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 26091CD5E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789325299;
	bh=hIsApCk96FJaTy7D6trr0qoINnteumJJYvVlzQmSrCM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=0spi0UP0Svzah9cOFJv77bm64KYf3dPozPu+imCvsymNNJ9Bqp+bFDrLXRaJycjAB
	 anLB3CIODst5GtcEv80FZ6+FfuBokaGRynR3azoYZui1aG+gzDpYWCzXMWkE8ynueA
	 BGBBVW22i3jlM72g4uQyHul8FwulezR1og7YV/Fwhj5P6e6e3CdEluJgBCvObwJ2/m
	 4dxVAis279ofj9m8a3QYhAe6eTd1I2vcln5m9i/xQTVrj6cfCNzfbr59DZG3jiu9Bu
	 Mi1SE5ytK5Yo+48Xj0ea5OsS72dKIAqTn48CFT0/96XvAo/KCeuHA0QnkFJ3kwH1ug
	 G6l3yK9r+9C3w==
Message-ID: <afcd18d7eb29c5b17fd132888d31b1215cc5a725.camel@rendec.net>
Subject: Re: [PATCH 0/2] dt-bindings: interrupt-controller: chrp,open-pic:
 Miscellaneous fixes
From: Radu Rendec <radu@rendec.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Gleixner
	 <tglx@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sun, 13 Sep 2026 14:48:16 -0400
In-Reply-To: <cover.1788426169.git.geert+renesas@glider.be>
References: <cover.1788426169.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-09-03 at 11:06 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
>=20
> Just two miscellaneous fixes for the OpenPIC DT bindings.
> Don't ask why I looked at that file (my CHRP box died 22y ago)...
>=20
> Thanks for your comments!
>=20
> Geert Uytterhoeven (2):
> =C2=A0 dt-bindings: interrupt-controller: chrp,open-pic: Typo s/pci/pic/
> =C2=A0 dt-bindings: interrupt-controller: chrp,open-pic: Fix dangling
> =C2=A0=C2=A0=C2=A0 reference
>=20
> =C2=A0.../bindings/interrupt-controller/chrp,open-pic.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 7 ++++---
> =C2=A01 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Radu Rendec <radu@rendec.net>
