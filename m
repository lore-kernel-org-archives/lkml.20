Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190969;
	b=E0abG3dZ61flpFpLEPdOGeW1KYIz26yxQrTAbg8n9dkaXnpCwddPh+wygsWZda4Zq+h4
	 kTyfOEU54rRI7b4dTvli1aR412Cz5XA12Nj+2xpla0LnfyKqeGzgRQiUxzRB+tGoVK5HK
	 sLcKpFqX38VS+IfweU/pMIdTK43FddR6mtNWu7Pf+0WQFqttnoaJSX2wD4CnjqkmIdhlX
	 t11QJGat4fLj3C2HQzWSaLeXRETziBswJmzIFhlPGnQf11NsPBOaC5Xpvjdkfz5m77QOb
	 jTMnNNzRtpiL9bK4Xj7Wfb8zr/oe6fQCSDxeKfe7eDnyzSWA6lYa7ftl22jiMQNR6Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190969;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=RN66CKdSFH5BokxN8gXeYXM9ec3pclcfHKHj0hdU+y0=;
	b=e7QDrZ3VHpfc4bwavxge5fIEmL2Eiy7r3ghJhADyMmYs5qCoAlXeBXlxcwT1rPlyFJzt
	 Gq9w/AdOhii4hr8NVfyYI/WEpnE774/XU5+t1USpgF1xRmW38AVdImpAIiuNT7jYUPcll
	 OeKeTyMu/50q6+Vm5nZlkG+n0I+T/3tgmHxalEMPsJCoxn41q/Agm3pehGoDLA4XI4u6Y
	 PFGQPL1pKRrWj4a422/sYcMtvBYBlg1AXFAWA4O9xCC5dtDqUE+oMmq17XxkmeYfzRO/c
	 qslRv7ULB+M1lpiUo+fbyg27cxc04ynjH1ip27xLZ09gap5SCwZ/i2B/eFEjkBv56Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IkgVIPPI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE083606A31A;
	Wed, 28 Oct 2026 12:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IkgVIPPI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3021F01825;
	Wed, 28 Oct 2026 12:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793190968;
	bh=RN66CKdSFH5BokxN8gXeYXM9ec3pclcfHKHj0hdU+y0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IkgVIPPIqTICtUeItkxA6P4kKztnYtrCCrmcCp4fEOjTuAyrrVfcAMNC+ew4l1wnh
	 nQanSAshIhnQaG+Ac/EVzx87EvjI1VbMaILCRwRbnz6KibJeqcKVcP+vfPt/CQrZJz
	 4EDPudw1BaAh8uMmIABVfRHG6ja+v7eSDaLTQ52FZr3mKLRUzAx6eHBJzW7z4fwARG
	 dtU7ksepKRECIZEr/vLNDkyF6EOu1SCxZu3HlBxsZGonLyPD8WzUkhuhjhMDZuZ8uN
	 7Xa/0+zsuTo6fj+QzyaYH8080hwxOUxWJNyVInwqRidowNlrwUwvHxUB8yIPh2Khfe
	 AxsGOANE3YreA==
Date: Wed, 28 Oct 2026 12:36:04 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Ram=F3n_Jes=FAs?= Miranda <ramonjesusmiranda@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: lpass-macro: release macro and dcodec
 clocks in runtime suspend
Message-ID: <706ee7bf-4f61-4f0d-adb0-a7b0476c671c@sirena.org.uk>
References: <20261023173216.6245-1-ramonjesusmiranda@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LsvMrbdD0nz4dxp3"
Content-Disposition: inline
In-Reply-To: <20261023173216.6245-1-ramonjesusmiranda@gmail.com>
X-Cookie: Pushing 30 is exercise enough.


--LsvMrbdD0nz4dxp3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 05:32:16PM +0000, Ram=F3n Jes=FAs Miranda wrote:
> The LPASS rx, tx, wsa, and va macro codec drivers prepare and enable their
> "macro" and "dcodec" clocks (which correspond to q6prm LPASS_HW_MACRO and
> LPASS_HW_DCODEC clock votes to the ADSP) in probe() and only release them
> in remove(). Their runtime PM callbacks only toggle mclk, npl, and fsgen.

This doesn't apply against current code, please check and resend.

--LsvMrbdD0nz4dxp3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrh7DMACgkQJNaLcl1U
h9DtMQf+OinpQt+Pqh4v46Satg70DJeawqG5u6goCnkANGda/vECBmWijbd5ykVF
wpX68CFXd6lBOWuPIAl3oJon4otePmTyG/9RApHgU59Kbc2/29u6HwgaRDGa7OcM
bmPBrcZWj4jqitkEreBaTXyVo9rrtmmqhm2Fl3M2Ozwit0SOfMskIqPkV0YvG6T0
HfX7eqLa4fKcYVPJHIGSptDJYcck1upd1dxE+j7472Mj+xOqYdtuRkKHAzXi8zG8
nWlwPX+JQe7fGWeiKpmUJ3hl9MkP6ZnQZrHlpuPzWKjdr3gMpD6+Ep6OSTVAFgiE
K2I24vmeHJoZR0RPsnMFIDmEYW2ufw==
=4IJn
-----END PGP SIGNATURE-----

--LsvMrbdD0nz4dxp3--
