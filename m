Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335894;
	b=xGpDpKm65K0GoWloqjbbjrkt6RXRi+i8ARXCKrxE6TSADAh9H2AqinX0qEpIwy96I5ow
	 M1b7ozvDE1GpEi9mFEBppKzCqSNG70sml8/TbhgRjjcg89txs6EL4aPq3vevo1TLvl57p
	 xU20wFei0P2MgoocpwEpz3V5vveA+qtsZBeBzRaIdKbIh2ddefRpFVpnoiQRJoCduddA+
	 TkuJE+Ra3E2tbhuojcGREDPD1kVbKrbcfzk9kMU4fiPJK+FNnNxvyDtLdnYOr0OAePWcS
	 b0oS6CO5EBpOQcQTNF00CRMZgxhj/SUdDoHN+yVMPKfWNFEJO0izg7jbsk3guDdfWBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335894;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:MIME-Version:Content-Type:Content-Disposition;
	bh=wU6boK9HIZsk3bw8/aieBeztp8l3LOTMXKhNuhTyRwk=;
	b=XzwhFLsLZXumdziVVjspxFsW5jaLDgxhXY+CnZWAZkDvc1utvOHuK4ko6bObGkm7iMob
	 asRzL/P9j3nM0+gl3U2KYv1gG8qCZYbdHLhYnqahKxtHrMVNIeI7zPW8BDUnS6yEvZ/bC
	 63uu7qw6BNFdtvpjpV5i5hGxR+xnH11nYgz3Fdj7FaWytvTSFGQ1LgWozhUOjVo4tzzwQ
	 DPlmD8yt3LSd1X6I8i5//d/9uvi/L4gJ7DbnU6HQ0O7PlBHDicvHPmofwxOMLjxtt/ZMe
	 2QF6vIUiffwYlzyI8YyVbakd5YYnt0G5KSaPE7e3WhFxXNR3jpUBSOzykhs7TVzWsaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lz8iNusP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B823A606A31C;
	Tue, 10 Nov 2026 18:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lz8iNusP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83741F0089F;
	Tue, 10 Nov 2026 18:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794335893;
	bh=wU6boK9HIZsk3bw8/aieBeztp8l3LOTMXKhNuhTyRwk=;
	h=Date:From:To:Cc:Subject;
	b=Lz8iNusPklyswCSMYD9Dfclz5p11GVDPswq19qfPBhW/JFrR6UxY5jM7ILaLzsyvV
	 ehBhPQ2sFuUtDWWAFsmowWqmPAHaZIf2VAlG1X+QWO4JcSZXDTbCUO6Q4y1+N+GPuB
	 yss3pkXYQeRjo/fMcOFLOB0t5B1ISgNZyqjEW4l+rrRnpY/SJabW5dR1+NJollYcLI
	 6+a8AhTfojf/wp36RxTWwdr8kVIhkDUdsr11Hy9yHxcka5/9bHCsLRs17m9Aknl64l
	 P8ofUNJ7F0+68OJ7p+MQGuCqYM5tBmkace9m3ukNbxBzG9fNG47Ejyy+lvXyyQLh31
	 m2m6+n7Pwgw5g==
Date: Tue, 10 Nov 2026 18:38:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>,
	Wireless <linux-wireless@vger.kernel.org>
Cc: Johannes Berg <johannes.berg@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Zhao Li <enderaoelyther@gmail.com>
Subject: linux-next: manual merge of the wireless-next tree with the wireless
 tree
Message-ID: <avNkkJb1ujR4lxdZ@sirena.org.uk>
Mail-Followup-To: Johannes Berg <johannes@sipsolutions.net>,
	Wireless <linux-wireless@vger.kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Zhao Li <enderaoelyther@gmail.com>
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
	protocol="application/pgp-signature"; boundary="XJybosBO3UR/NznJ"
Content-Disposition: inline


--XJybosBO3UR/NznJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the wireless-next tree got a conflict in:

  net/mac80211/link.c

between commits:

  a155ef2ef7953 ("wifi: mac80211: fix use-after-free when MLO link setup is=
 rolled back")
  745f5d04395df ("wifi: mac80211: drain link readers before stopping remove=
d links")
  bb22f3b2d8f8a ("wifi: mac80211: restore dormant links when link updates f=
ail")

=66rom the wireless tree and commit:

  89e2600dc1f29 ("wifi: mac80211: refactor link handling")

=66rom the wireless-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc net/mac80211/link.c
index f43c0dec8cc9f,428759f8dec30..0000000000000
--- a/net/mac80211/link.c
+++ b/net/mac80211/link.c
@@@ -206,17 -255,13 +256,18 @@@ static void ieee80211_tear_down_links(s
  		if (WARN_ON(!link))
  			continue;
  		ieee80211_remove_link_keys(link, &keys);
- 		ieee80211_link_debugfs_remove(link);
 -		ieee80211_link_stop(link);
 +		stop[link_id] =3D link;
+ 		if (link =3D=3D &sdata->deflink)
+ 			ieee80211_link_debugfs_remove(link);
  	}
 =20
 +	/* drain RCU readers before cancelling work they may queue */
  	synchronize_rcu();
 =20
 +	for (link_id =3D 0; link_id < IEEE80211_MLD_MAX_NUM_LINKS; link_id++)
 +		if (stop[link_id])
 +			ieee80211_link_stop(stop[link_id]);
 +
  	ieee80211_free_key_list(sdata->local, &keys);
  }
 =20
@@@ -404,16 -440,14 +447,15 @@@ static int ieee80211_vif_update_links(s
  		ret =3D 0;
 =20
  	if (ret) {
- 		/* restore config */
- 		memcpy(sdata->link, old_data, sizeof(old_data));
- 		memcpy(sdata->vif.link_conf, old, sizeof(old));
+ 		/* restore config; add/rem can overlap on link 0, so detach first */
+ 		for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS)
+ 			ieee80211_link_detach(&links[link_id]->data);
+ 		for_each_set_bit(link_id, &rem, IEEE80211_MLD_MAX_NUM_LINKS)
+ 			ieee80211_link_attach(old_data[link_id]);
 -		ieee80211_set_vif_links_bitmaps(sdata, old_links, dormant_links);
 +		ieee80211_set_vif_links_bitmaps(sdata, old_links, old_dormant);
- 		/* drain RCU readers before cancelling work they may queue */
++
+ 		/* the new links were published, wait before freeing them */
  		synchronize_rcu();
- 		for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
- 			ieee80211_link_debugfs_remove(&links[link_id]->data);
- 			ieee80211_link_stop(&links[link_id]->data);
- 		}
  		/* and free (only) the newly allocated links */
  		memset(to_free, 0, sizeof(links));
  		goto free;

--XJybosBO3UR/NznJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzZJAACgkQJNaLcl1U
h9CwqQf8D8dcxwy6LphMqA4DF0g+UGlGty9eRaCOoM9ZbSN38gTMQT4xdr91mkQw
2Ks5N3x8DvpyJ2OL4eTWQWUMFSecGKleSbBxTOBF+4r6odMyRM5H3Fo9nQR/Vv9S
mWaTVJmHGsaNbPy/yGVYa9mEm8yYH/igG2AlhOquLhcu7uu0IY4Rc/TNTEW5HjcH
/5dHlntTGHpfmCfGkNFz9XYe7vltRn1xKZ5pP1/8/B28djjvguDDBDQqHz6SfWwo
kmILIRD2EqGeT0cFKOOb4t+p3qOeC5C+7VSG00u6wDnJr2vkwXscRaSRQTnbrkfF
j/rjm9e9kEqDYEWvrmnHX+ZiHzM4Pg==
=WNCl
-----END PGP SIGNATURE-----

--XJybosBO3UR/NznJ--
