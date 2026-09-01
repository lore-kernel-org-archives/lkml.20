Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE0A233955;
	Tue,  1 Sep 2026 14:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271555; cv=none; b=iagKzkJh/g7FldzH6DfZiv1uLRL12+cl3UbAhl/WIe5mPf+KT23+B1OPJuEJ+iytQlQFRoW5tLWQtA0iUFvYcbldWJ3fQ/qfE1jFK/GSwYBtcfrG7K6yAqKTqYBel8G1jrJdxkREGFoulUaoq5y9OTmCZU3n19U+HB9HR5YzmE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271555; c=relaxed/simple;
	bh=hSl74Ty80QanjmAcfeeH4PcXEtDVGMWMG+d2ehAWXvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GsDZmJhvVBqUSD+vSbhuRbuIO6finc5freeT5k0wYUYkmOXV+bvwkyNj1mZD3HGal+bg5Ve+43GVr+Y5nYl1zuVtaDzN9JcW7LfyFytHDjXoTTNiCyYw1AX5H0KEGBIzhT8jwPXNY2XWCnSpxiEvqXPiyV9+ZdFpaZuZTl/jjGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T86kfLFV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T86kfLFV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 205211F000E9;
	Tue,  1 Sep 2026 14:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788271553;
	bh=CTknvhEq1CqIlSFU97KLOYi0xL7I+CIZYWA6D4VploE=;
	h=Date:From:To:Cc:Subject;
	b=T86kfLFVzv/LMWWvJyWc1WE530O9FuOpMjrIXl6neg9oGlgX6g0lBXtH6jKHetxL7
	 zXvZp7uUE10ERST0HjFvWmXTWxf5EYwpVvjZxAUWHabk3x5GZikzzE6ComuEtTIat+
	 QorA2IKJwFl5bcsTQNGU9bwUGevZwJIHgjsSJSlO/bJdMUtWAXMhbOUayTxHqkVvoG
	 E7V8HutMlCqbyjfTlskw7cFIS/hTD3RCdbeot7JrZ35mJnP+sIjHFHvNLhLEyuZk/6
	 yxS7TjTBic9T46r0ig+77ZrH4w88F9EUzb4NK6ngJAs0NFGY2ALUv5f+wbfxkpoCII
	 bNr348SUOvCTA==
Date: Tue, 1 Sep 2026 15:05:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <apbbvQSfUbzYRFaw@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HmtZ0rKD4icBIn+t"
Content-Disposition: inline


--HmtZ0rKD4icBIn+t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/sound/soc/ti/omap-hdmi.c:408:6: error: no member named 'card' in 'struct hdmi_audio_data'
  408 |         ad->card = card;
      |         ~~  ^

Caused by commit

   699e5975e2a53 (drm/omap: Report HDMI hotplug events to the ASoC HDMI codec)

I have used the tree from next-20260831 instead.

--HmtZ0rKD4icBIn+t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqW27wACgkQJNaLcl1U
h9D+Twf+MFViDggeP6uPjB0hQptPtqvvGqn2LU6SMVynJ44NuwmfnkXxly8cPGWc
PzUZjHAp4mtUm/Bab6JdESaYJfmu/ydlauAFJHQykUx+GPHut+wbUpm8ZHLCfetT
m/nhGNCRglNttCg9B211khXpIlsJlmu94pY3c+dmTdIEfLXyQ8akTyPihRb9RCX2
ghWqUzPGGNuP9nFotyOZ2MCpV/MLXe6+piMBh0FEmrP+WUCdm2YnNmNjfY6TDp3Y
xQjU+pPPCtERj7lQcVZjzIDCbBMiW+zI3IRw/0Pn0+G2V/sX/dO5v+HZe6J5vlpq
uYYWqplrMmNzVMj1mVCeoLDZTwLZ9Q==
=2Ld1
-----END PGP SIGNATURE-----

--HmtZ0rKD4icBIn+t--
