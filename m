Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335905;
	b=N1aPTjcDYLjVMWVy9lbi2uzWPah6QdqG97xLwVs9sgyySFmPuf+2xh7m34aXyWR03hHs
	 CzeWSbaNWktmzu00Zb2AkCZu8KAtvBn85JEaM53JnOmF06oOyDN+tQbjs8umwOlv21hky
	 fOu+bTRUJec4PP/VXqxxUiQQIJnLkjFoV1F/WWm07G3C1mse8gPl1eTQydwbWuFNIbY6j
	 Xn+GoFzr8mfid9EcZ9s+vcLVaA3Qu1YK9cqNA2G92/iWcB9l5r+mojs+WNtsluC/7kUFs
	 5SHIYEjsL+SE8FsZ7YPgzcmAe7mqTqj0dM/OtScK83EY3ErVz31naTA8tAAGExCWdKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335905;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:MIME-Version:Content-Type:Content-Disposition;
	bh=mKdOvaOn4HSWA9Ds2Oo+Efh7wRd4xkw0x8BsJCaM+C4=;
	b=ikzGcOH/DeRE32hjj09LX8YEWeOpHk60RSZcZNq+GWv1uLcT3nDRGp+8pF2J6od20kcn
	 dSrnv6tcgOUIfE42xxVqZ4LI3O6X82tpvMxcRJwnOFcrhfSsKqlGNIllfBWY1a6YI0uBc
	 1DDkxiX1SsS/awSmNS5poLbGvYIShsNklQ/Jvt7rL+1kDiEoePa1Irp7kyNinXnHbc9lG
	 lR2Zft4TUPlrbzWdm1HY8fioboIIbKuBtD+pkGTKl9qq6fMbsVEaAzJ+zz6TtSxmdmUYW
	 nFKeZnYX9yqzEVS1l4EVfVvj5q05xWrBl9aMMA+WHNw7y0CECiuMdYQ2OClAqqLLeEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aiYUVWFJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07569606A32A;
	Tue, 10 Nov 2026 18:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aiYUVWFJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF831F0089F;
	Tue, 10 Nov 2026 18:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794335904;
	bh=mKdOvaOn4HSWA9Ds2Oo+Efh7wRd4xkw0x8BsJCaM+C4=;
	h=Date:From:To:Cc:Subject;
	b=aiYUVWFJWKeG3tH3E+k37w82TGrQarjmZz+VOsM7wOZ3yi4F5tnyWuFX5azofG/h2
	 QGVlLprJTr7tFZkM2BEwO6sr5npagG+FTpSg4oec15bdAfw7A5G8WjvGItILwL5OB5
	 rjsj5OT1mK6lMRd05sQ3AGzEp3sgI5wFYKUh709DusP3YSswgw3bWKWmLNRaNnF7Pw
	 rKvCXeoXslZNkF/96Ehx73rxANPEdSUzGPZh0A7TD047OFUUYLntVCOK8TVHSy0KdV
	 aUjYNEOSaX7lQCRdsyMFmp2h9AR330Y9Ix1eEvqXjCnQBKc7Tlg/psvC+78vdPylVQ
	 WgitzpvGpzzsQ==
Date: Tue, 10 Nov 2026 18:38:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>,
	Wireless <linux-wireless@vger.kernel.org>
Cc: Johannes Berg <johannes.berg@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the wireless-next tree with the wireless
 tree
Message-ID: <avNknAkxmfCcf4Ra@sirena.org.uk>
Mail-Followup-To: Johannes Berg <johannes@sipsolutions.net>,
	Wireless <linux-wireless@vger.kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
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
	protocol="application/pgp-signature"; boundary="13qAi4U3V0gvNGsk"
Content-Disposition: inline


--13qAi4U3V0gvNGsk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the wireless-next tree got a conflict in:

  net/mac80211/mlme.c

between commit:

  4af2b71495a3f ("wifi: mac80211: fix use-after-free on TTLM disconnect")

=66rom the wireless tree and commit:

  1d8b10787a3d3 ("wifi: mac80211: mlme: partially handle UHR updates")

=66rom the wireless-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc net/mac80211/mlme.c
index b5efc6ccc9853,456b289bb072b..0000000000000
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@@ -8488,9 -8983,12 +8985,13 @@@ static void ieee80211_rx_mgmt_beacon(st
  					       elems->cisco_dtpc_elem);
 =20
  	ieee80211_ml_reconfiguration(sdata, elems);
 -	ieee80211_process_adv_ttlm(sdata, elems,
 -				      le64_to_cpu(mgmt->u.beacon.timestamp));
 +	if (!ieee80211_process_adv_ttlm(sdata, elems,
 +					le64_to_cpu(mgmt->u.beacon.timestamp)))
 +		goto free;
+ 	if (!ieee80211_rx_mgmt_beacon_uhr_param_upd(local, link, link_sta, elems,
+ 						    config_bw_out.ap_non_dbe_width,
+ 						    dbe_enabled_before))
+ 		goto free;
 =20
  apply:
  	ieee80211_link_info_change_notify(sdata, link, changed);

--13qAi4U3V0gvNGsk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzZJwACgkQJNaLcl1U
h9BjAwf/ew+L+dUwmMO18voeptA+nJNY8kpCO/ji9x+Saf3ajXjdurRSbsZNjLzz
zJm9K+BDLJL11C0JfPhIet0QdUSTg4KSwjy/+BKoZput+kkjcKFLSdZZzpYqT9DN
8RyHLkRDANi+edBB2mnfToUbYGtCXw4C62F73jbtGAf5ZLG+tMD/1ZDQ+j75A671
mlfWV23G0HHxOdc+sM293yfi3wfDDFca0ILgC+aJuSaFNb6daXL9XNAoEkqa58Sk
5pSLkDNb6UVjF1+u3X8ZHSafsqypSiovaH9d6REaD/WHnXGiHFBWRfQY30N9vFDJ
yKWmMk7fJoXFF5zBHhHBp4DdZrzVXg==
=MqN3
-----END PGP SIGNATURE-----

--13qAi4U3V0gvNGsk--
