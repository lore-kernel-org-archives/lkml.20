Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F872D7DCF;
	Thu,  3 Sep 2026 22:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788474768; cv=none; b=gl4c52ledK50/LU6+5OBbgG6C9NnQaoKR0uCFgWCRpUj0Tfw9k9du4mueVk0WhWHzxj3bzPL3W50gsUmLFN67Xz9Tvj9MLn+IBhAcY2Lfw/zrzHYnSAIZe2/skHYus9ZI9y1htwSW36GzYtzwtWCnDMQUw8tobNREv3GxAZYihs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788474768; c=relaxed/simple;
	bh=cB1ClQeQDbJ8pWCw7Jdb170p29RCCAlLa+oCj5X+01A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VANO8CFGEfGFk8ylRVZFWW8P7Ahg5BeN2vJ6q4FkJHsZTfXIvLJu4c+FNa9bYSIMix/0+32AehNN0RqCbmNEh1x+oPf3abbknS5/PiLDT7XiCPekAadTM4inFYokytUGfPlYRh4a0YvVysI8qZxzYoQDV7SIG2IDHduZfWbouXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UaCvhMXp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UaCvhMXp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9471F000E9;
	Thu,  3 Sep 2026 22:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788474767;
	bh=cB1ClQeQDbJ8pWCw7Jdb170p29RCCAlLa+oCj5X+01A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UaCvhMXpxeiOT6RAs7xtrl3Bk7sxHP89rtqTL3AKIGmo0h8uwO9K2E89kC/9hCKCD
	 ioJWHNbPNK2oudrtfXDnbnySQEfLGaZnd9G7WteV8N86A6uCFNK+EWU80761VqXX1d
	 /OJDdBpRJ0xUyxHGLNtVU1WGSWs59Xe20MvL8K01flbkMZz4LBJ1WcV9pt0Aj07xy3
	 h8nV2HmCQmaicZu1OdDyR/ZJ187oTVAjzpU/LZOiNa7kxY9mCBfRZAnRJl51MKyAsT
	 7sWP+SEq64oJ2fVcclI9Q9ZDRRBW+pxKXX61fTZeH1ThgLaz/l8T91ImM99QOw+XSX
	 HogaShfBQgcPw==
Date: Thu, 3 Sep 2026 23:32:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: doc: Fix bracket and move place holder
Message-ID: <80dca031-b8f8-468c-a98d-94cfe5a6d60d@sirena.org.uk>
References: <20260902150510.706055-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VQn8Ro0bDjb+tdGn"
Content-Disposition: inline
In-Reply-To: <20260902150510.706055-2-manuelebnerli@mailbox.org>
X-Cookie: One picture is worth 128K words.


--VQn8Ro0bDjb+tdGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 02, 2026 at 05:05:10PM +0200, Manuel Ebner wrote:
> Remove '{' and change place holder
> '< ... more DAI links above ... >' to
> '< ... more DAI links here ... >' and move a couple lines up.

> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
> I'm not sure if this fix is good, please review.

I can't tell from your changelog what this is intended to fix?

--VQn8Ro0bDjb+tdGn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqZ9YkACgkQJNaLcl1U
h9BcQQf9HpZa2TltuTv5qFEpaTouPjVxkMSsOGGRSo4CX56KuStm2Gm8dpDuCdQF
+4aYgEGrqbsVpg9xaOBcXSyMhOc5B463SonNPFK95rZ/IINC4c34R44tjx4+n6fq
HrmXIZ9hclHedSNHQ+OZhLI9Nx3iw6R3OfE8zZKRfPHU+PLi5TN1pHdPH6tt99dY
6ahCU0BDNTMLlL6siI6JD4mdBg/gxKYUF9VnkyUOb3/ZGPCJk5iZaJ7ryPrnJDpP
AB4QW8KcnZXfgnFdkIITQi84Xt1iRtoKQS3pqUZGQxx9mBoDIA/DdfZpzoxvrnBe
bYEHozM2+OwbDS28NxJQ8BSKYxUzXA==
=jtbo
-----END PGP SIGNATURE-----

--VQn8Ro0bDjb+tdGn--
