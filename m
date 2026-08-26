Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AFA14EC73
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751104; cv=none; b=mKtnRR0yxRmgj/1O1Jhg1GMp9HhtX9hJVk9NgG9oHDCuLkaoDdOdJWrm8nSxwvZatJcbvnMWGGYk0HUXlaQYBVjKF1c2+7o6kyD5+abvHQGBa5f8H3ZhDcfdEqI8wy4cmqzGcPIntVd7tdhzulJ2eHySY7fCRRRyjqorLVbg+k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751104; c=relaxed/simple;
	bh=ld4QhYWYapTYFWkeEHP/og+kPvuqcXsvwgb+JCgmWz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skgtZIQwVG1FTr5oQNkxIlLYaCxnsKKQHj5/zJAalz/1N7qNHi0HAa/B4x+Wzmpg6d9gK1lu5qOqore3xzEgpwtEzfTzEiIkPnHvq+9mjrU2qn7bo5nXG21wsSL2eW/mmid2Kh8vYxlzs0wpYD5yEazKZ44IoS99M00itjywvKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AveYCEPO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AveYCEPO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA36B1F000E9;
	Wed, 26 Aug 2026 13:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787751103;
	bh=ld4QhYWYapTYFWkeEHP/og+kPvuqcXsvwgb+JCgmWz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AveYCEPOgKoNaZaPd2+uZC9WbQc4jsDlg2ECLTzPhciM5dstuNQF+Y/P4pXc1c5/i
	 yPCcS9tnLkGrLowkYtnXFJqN9B2Py9KPwZ2KKv1PuTNHDphu+1SiXm9ya2vfA7TlpJ
	 IYDdODwPaZJTGEonVKUwcKtiWfbhq1GWYIsyZTnLGYx8hdnUI2Dxq0hlzrxGuFeeTC
	 sll/yfpHHtu0qthluDWnrrJ+RTMy8Gm4Cu8OJT2UziuajqvbmwXg4CMwg7Fl7k5Oqw
	 flkdKyQ/nY/UqA5YSG+gQJUEk4MSjaRRf5z8quYf5MbOqFPkrBDI5/Vb7WnsK4whru
	 XNYS3kp99DIjw==
Date: Wed, 26 Aug 2026 14:31:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Yang Zi <2959243019@qq.com>
Cc: lgirdwood@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: max8660: Fix NULL pointer dereference in probe
Message-ID: <ab860e6c-29ad-4a50-bd31-70371a0dda62@sirena.org.uk>
References: <tencent_7AEB516C2A94CD5BE16C6C06295527FBC005@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mn/0tbs7xJCW66Oi"
Content-Disposition: inline
In-Reply-To: <tencent_7AEB516C2A94CD5BE16C6C06295527FBC005@qq.com>
X-Cookie: Don't vote -- it only encourages them!


--Mn/0tbs7xJCW66Oi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 25, 2026 at 04:58:59PM +0800, Yang Zi wrote:
> max8660_probe() dereferences pdata->num_subdevs without first checking
> that platform data is available. When the device is instantiated without
> a device tree node and without platform data, pdata remains NULL and probe
> crashes with a NULL pointer dereference.

This doesn't apply against current code, please check and resend.

--Mn/0tbs7xJCW66Oi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqO6rsACgkQJNaLcl1U
h9DiPgf/SE5C/lHWC5q5W0BFWH1g1/OvVNWJgeWdQaFy3yiE+Nf9badMwQbZYyFt
mDYYZIVORsxk5bW822fd3URPRjDU99+zcx8kUhxMkMK9jSOwynyiwuTT1TvxlyAW
+zk49i/ZUYZ1pRfIZr/8pP3kdAJZKg8r98ZG39mi/6g807/np2BmK5JetI4slcaq
or5H2FwnyBsj+jwjAaGMxC6JXpjpA2z/M5ZdMPOBB6VuBi8FA3Mg0o+7YadesHmG
KDogD2suO9/zs4qeA+WgvRTqgjT0ZNLzEkkigd041N8jtGUDTxoqLdwJLzXAUO1z
HL8l/KRsugCEpgSJgNaMtNy/90iZXQ==
=NiCY
-----END PGP SIGNATURE-----

--Mn/0tbs7xJCW66Oi--
