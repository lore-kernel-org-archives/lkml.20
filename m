Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BFD37BE9E;
	Mon,  5 Oct 2026 08:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791187858; cv=none; b=RWwgnjJaV66Px5DpGLh5WGNTpVu5BPkbPEuvOm/llZTYcuSQu7O/jjtGElPMfG+41Z90gYtsZPH9ZHtgD9jDWnQ2YPIngZyIhIRqEhdcqACNsuRm9RnhuyWECAZqG1yjbZf/0Ov9jk2HJlhoQ+ESWTrcUFaoLBAhpbiY7Kqj6nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791187858; c=relaxed/simple;
	bh=x1W0d+UxyN6NyR02OWmZk3vrZ/qpuzcycxmpO18/UqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGk3bKlOnlGxuxQ3dVcGEdYzC+KeskJao93ZS42pp8cOveOHzIgprhvNMOJFEomVUd+Knu/fqz0hG1K29YqvuvEaA8qzhoTbTk/GHsqCScn1jcik09hyeAEVisDAxywDfFiCOrEnZaEYOdshKwBUkTpEozotTR0xwtu5wwxPl8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CSpKwxqN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CSpKwxqN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D901F00893;
	Mon,  5 Oct 2026 08:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791187856;
	bh=x1W0d+UxyN6NyR02OWmZk3vrZ/qpuzcycxmpO18/UqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CSpKwxqNWyx2EIT6SI+NsQM6C0H17sq5KiRmYKWdcHTFMmSIXRMGjLGgYB9w9QHeC
	 u/fcZoZLK6xiDItwlfhgKoni0AryDPcnheJlQYZVBu5l0AJ4+svgWwXCktAihFBMgc
	 AOT7si3UMiODyJsyxWE+Sb3K+62/hKhyARoWR1W/n52uqYkngdg9x/v5Cq0z5pKK4/
	 92ucD2to4qOUKzpoWu7ANL+moCoz/bLHpigdtw/mNwk2vGPhZQXrBYefHI05XMsnOK
	 4hVD9J1k8mv+7wsG02mocmj/FCpnjWN0eqAvSyX9dmVeY4bOEIloLAvJcZzGS+Y/2k
	 j90VzZDaX2SCA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 2F1AB1AC57CE; Mon, 05 Oct 2026 09:10:53 +0100 (BST)
Date: Mon, 5 Oct 2026 10:10:53 +0200
From: Mark Brown <broonie@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/14] ASoC: mediatek: mt8195: Fix FE startup error
 handling
Message-ID: <asNbjSrPYVbeqSae@sirena.co.uk>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
 <20260925044908.450775-7-phucduc.bui@gmail.com>
 <asKt42FgsbhSbQUP@sirena.org.uk>
 <CAABR9nFyEJBwXP=4SjuGNfGQJub2y_DPE87c6j6BPmqMBgjESA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sUcAnahCRvqeHeGI"
Content-Disposition: inline
In-Reply-To: <CAABR9nFyEJBwXP=4SjuGNfGQJub2y_DPE87c6j6BPmqMBgjESA@mail.gmail.com>
X-Cookie: You will forget that you ever knew me.


--sUcAnahCRvqeHeGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 05, 2026 at 02:12:38PM +0700, Bui Duc Phuc wrote:

> > This will return 1 if a new constraint is installed which is not a
> > failure.

> Do you mean snd_pcm_hw_constraint_integer() rather than
> snd_pcm_hw_constraint_step()?

Sorry, yes - Noticed it in the _fe_startup() that was called just
before as you say and didn't specifically check that function.

--sUcAnahCRvqeHeGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasNbjQAKCRAv73Ows9A4
iRNfAP4wqJV7pRyYOXXDTCy+JSwPo1kGj0jzlAZ1N4Sz4PZCegEAngA2eR4CykXu
huQWaGzmx7Q8fpn7SbSPhCVbfBI9WAI=
=F9Hz
-----END PGP SIGNATURE-----

--sUcAnahCRvqeHeGI--
