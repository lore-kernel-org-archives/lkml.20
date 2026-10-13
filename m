Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B03151FCD5;
	Tue, 13 Oct 2026 17:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910829; cv=none; b=YY0+t22lKkLrBius6OeB/d/c6T0fzm/CS5ynmKI3g0gxjjrRr4DZKdRago446kNADULEHh2sDveUeF1g+9+xZBkD5m0LEw4UVcVyeAPfw9kYemWS9LqusUOmJdMc3q96UUWD6uC1afK0OqzZ3/IeOfoHRHcI9nBvvHB/noq8vkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910829; c=relaxed/simple;
	bh=BgzjvTaakEn4iX622Q/nL4ksfZfBVOwlZhnMujpI3hI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FPtKR9IzFfb57w/xJDNETQsByJDL+q4SafWLXmzjRO63sEJcBZezdize9q3ArWuS8F8/c2luBiqle3eFykV+DaqfFWrWa9/d9ePTSsfo2toOvlxI638PBduZREiZHgL8P49P67kalV1llyKZYruGRneexCUP1zs9m0nKAW22LAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nb7+cMgc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nb7+cMgc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA671F000FF;
	Tue, 13 Oct 2026 17:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791910827;
	bh=PRzuxl3gO7abIXX4763gV4Qiao2RiDfSPDHWB8ksAl8=;
	h=Date:From:To:Cc:Subject;
	b=Nb7+cMgct6OoKmVZkqZ3HdaZB6jgVxJHRAj40cPAj8PJbQuo0QHvI/MExIkNxJy1k
	 GNDlNvJtzWYWI3DQR9W5JwWH3cHEJtc4PLerr1Y5XWfAuSfLcjTVyTmA2HwPezHZgQ
	 vqZQkINQbisPL9yrpv9u/knWt6e67gcjaaBR+yPHnl6WQfmXQcszK9H1b2nvvb3rz7
	 /P1CwijXKJybpvU+PglC5Qi5E19wFCwgPSlFnUc8o7ooJKMvLbfvfDee0pJT6+MVj2
	 k+8zjxFWqDQCXFZCXpPd3TH1Nw34KGf+IeES0uCEFXQe+imRptLXlcgWxMrTJJs2UV
	 5vCSeCv19bx7Q==
Date: Tue, 13 Oct 2026 18:00:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Ma Ke <make_ruc2021@163.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: linux-next: manual merge of the sound tree with the pm tree
Message-ID: <as5jp0sHNb9GeYY5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A8XH1yemkQbFKFhd"
Content-Disposition: inline


--A8XH1yemkQbFKFhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sound tree got a conflict in:

  sound/hda/codecs/side-codecs/cs35l41_hda.c

between commit:

  2f47382b3ea31 ("ALSA: hda: cs35l41: Switch to use acpi_bus_get_primary_de=
vice()")

=66rom the pm tree and commit:

  8d70e364e866b ("ALSA: hda: cs35l41: Fix ACPI device reference leak on pro=
be failure")

=66rom the sound tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc sound/hda/codecs/side-codecs/cs35l41_hda.c
index 32abb71dd4019,d50c3d8f5303c..0000000000000
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@@ -1926,11 -1925,10 +1925,9 @@@ static int cs35l41_hda_read_acpi(struc
  	}
 =20
  	cs35l41->dacpi =3D adev;
 -	struct device *physdev __free(put_device) =3D
 -		get_device(acpi_get_first_physical_node(adev));
 +	struct device *physdev __free(put_device) =3D acpi_bus_get_primary_devic=
e(adev);
- 	if (!physdev) {
- 		acpi_dev_put(adev);
+ 	if (!physdev)
  		return -ENODEV;
- 	}
 =20
  	sub =3D acpi_get_subsystem_id(ACPI_HANDLE(physdev));
  	if (IS_ERR(sub))

--A8XH1yemkQbFKFhd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOY6YACgkQJNaLcl1U
h9CmqAf+IiYVk3EG98pwQfh+5DiYF5vNb/wEuk/dnbpzT/7UYyP/el/3+6NCuf0J
d+TKH2go1I72BTOn442t8JMsB9eP81memx59H1VeuLa2oLa8xPAbJ0khSh/yBZzR
uVlDRYLFjijT7Yqvi4HrYr+xwBPV4jzHImBA7Lv9DT7MIUXstZxrqOC9e8kQWubd
UTwmKkesC3OMafeuKOZ7Dn6gZpxAomFjM1oGCZjwfYwEx5dw7mmCKY8w/+ibaAi7
X6mer/aX0ZHKjf+hUR9ly8zqTa4YL79NWrTpjGZQXLLJjrQRjPzz7CMlnRVaPO3l
isok58CWpcT3tve0AGFqSWGfuGttKw==
=LLFR
-----END PGP SIGNATURE-----

--A8XH1yemkQbFKFhd--
