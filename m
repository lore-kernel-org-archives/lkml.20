Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA95302163;
	Mon, 28 Sep 2026 12:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599730; cv=none; b=H1QdSV+1nvANRYl3yWpyh9q/spGeKHzzlRtJpEWxZMI2cAeoKSLVM2rdzMES8NYkrichro+p2zHcS5o07RIlLz2l71VhAyszt6Lr502inT/++MSG5/gw35ecuoDqVJ3fasJTps3/X8zVJ1SqeUDoQOKT2DdjVrjjv0LE21hy4gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599730; c=relaxed/simple;
	bh=HIDhVWT0EB8YowBO/MowLnmlTTBlPJjNtf15Xkqd+So=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dojmIqi/lHmZJDuEI0uuY5alEjc8FR2GC7Kow1OIfFD/JjZw+pDX8jtOXyxxENrxKWaR1c+2IKG3V+sIK3zt0FDZJMRs7dGGweUg2n46RMNCKYggK/mu9M3X9STmSmyPdka7wIg9UDJWh+FQV3X3fCu3FWj+qLRzWgK8DyS93s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9cKCFIB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9cKCFIB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BE91F000FF;
	Mon, 28 Sep 2026 12:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790599727;
	bh=0NnsofduRsl3NF64WyuRsBOR6KNBl43fSt3WnHZsj0c=;
	h=Date:From:To:Cc:Subject;
	b=f9cKCFIB33WUeIPrl6rl7TewtFT8Br1MH6/+WClCQ2fLbaDlFpvQNYEFUuvXzrLk4
	 XRLEYpu6+DU1HISz5mIBKhcupk7W+AAo2/am8QwLB0teHscMIcrQVM3YeDqd68N+rQ
	 yiiTrsnV27DDAyUTzpQqfuNdM76pBJyNyVOpuMfYAOcnUw/jsO0DFH0oDUwTK0yZ+w
	 PSsLexhtrmQNyRZD5vtXh0eyJL+ToVkhw/DRt0WAXNKRbhr1u6zHIpf8iIDyqzm+kw
	 MjoD6C5YMugkP0fz3tnvU4kqJf86vcSQLedfB4LEbD8d4NSd5/2JSl/vB9ds4IkN3g
	 tJTuBucP1dxrQ==
Date: Mon, 28 Sep 2026 13:48:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alessandro Zini <alessandro.zini@siemens.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tom Verdonck <tom.verdonck@inspiral.be>
Subject: linux-next: manual merge of the hwmon-staging tree with the
 hwmon-fixes tree
Message-ID: <arpiK1_aHlI2bfjo@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fcwhvrGLJvSnAWHM"
Content-Disposition: inline


--fcwhvrGLJvSnAWHM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the hwmon-staging tree got a conflict in:

  drivers/hwmon/sht4x.c

between commit:

  61406e9cac695 ("hwmon: (sht4x) Fix jiffies wraparound in heater-ready che=
ck")

=66rom the hwmon-fixes tree and commit:

  3a4bf85531c55 ("hwmon: (sht4x) Add support for Sensirion STS4x temperatur=
e sensors")

=66rom the hwmon-staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/hwmon/sht4x.c
index da2b6130fca7e,fd1f950448f06..0000000000000
--- a/drivers/hwmon/sht4x.c
+++ b/drivers/hwmon/sht4x.c
@@@ -67,7 -74,8 +74,8 @@@ enum sht4x_chips=20
   */
  struct sht4x_data {
  	struct i2c_client	*client;
+ 	enum sht4x_chips	chip_id;
 -	unsigned long		heating_complete;	/* in jiffies */
 +	u64			heating_complete;	/* in jiffies */
  	bool			data_pending;
  	u32			heater_power;	/* in milli-watts */
  	u32			heater_time;	/* in milli-seconds */
@@@ -92,14 -100,18 +100,19 @@@ static int sht4x_read_values(struct sht
  	u8 crc;
  	u8 cmd[SHT4X_CMD_LEN] =3D {SHT4X_CMD_MEASURE_HPM};
  	u8 raw_data[SHT4X_RESPONSE_LENGTH];
+ 	size_t response_length =3D data->chip_id =3D=3D sts4x ?
+ 				 STS4X_RESPONSE_LENGTH : SHT4X_RESPONSE_LENGTH;
 -	unsigned long curr_jiffies;
 +	u64 curr_jiffies;
 =20
- 	curr_jiffies =3D get_jiffies_64();
- 	if (time_before64(curr_jiffies, data->heating_complete))
- 		msleep(jiffies_to_msecs(data->heating_complete - curr_jiffies));
+ 	if (data->chip_id !=3D sts4x) {
 -		curr_jiffies =3D jiffies;
 -		if (time_before(curr_jiffies, data->heating_complete))
++		curr_jiffies =3D get_jiffies_64();
++		if (time_before64(curr_jiffies, data->heating_complete)) {
+ 			msleep(jiffies_to_msecs(data->heating_complete - curr_jiffies));
++		}
+ 	}
 =20
  	if (data->data_pending &&
 -	    time_before(jiffies, data->heating_complete + data->update_interval)=
) {
 +	    time_before64(get_jiffies_64(), data->heating_complete + data->updat=
e_interval)) {
  		data->data_pending =3D false;
  	} else {
  		next_update =3D data->last_updated +
@@@ -406,11 -428,15 +429,15 @@@ static int sht4x_probe(struct i2c_clien
  	if (!data)
  		return -ENOMEM;
 =20
+ 	data->chip_id =3D (uintptr_t)i2c_get_match_data(client);
  	data->update_interval =3D SHT4X_MIN_POLL_INTERVAL;
  	data->client =3D client;
- 	data->heater_power =3D 200;
- 	data->heater_time =3D 1000;
 -	data->heating_complete =3D jiffies;
 +	data->heating_complete =3D get_jiffies_64();
+ 	if (data->chip_id !=3D sts4x) {
+ 		data->heater_power =3D 200;
+ 		data->heater_time =3D 1000;
+ 		groups =3D sht4x_groups;
+ 	}
 =20
  	crc8_populate_msb(sht4x_crc8_table, SHT4X_CRC8_POLYNOMIAL);
 =20

--fcwhvrGLJvSnAWHM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6YisACgkQJNaLcl1U
h9C5PAf8CeJT2/w9st94eeHhK55natfS8zmdq2Gsa36uaMOw3m9+zGIyrLDRpVco
pqafRUKEHFcgywQmw2N7YF3lV10OUzFiCDh1Ebm0nbX7UZTdVaQXBZjtzTN8aM2R
JrfqGH9U1h3vqFHGvL0VkaE0hh1Jj+pYVgGWbHdypULleHkRPAYih/ao+TTMC9Mk
d1Vw3cFYrKMD6GPozm/E+2jSA6a5YytkG/IntwqnDCSGA8Af6c/VbPmdNwEHUT3h
o1wRayJIAqeMcwRL2VNl+YP0Dxl4fxrnxV9s+t8FPGPwxfm+oHa2aCeTNWGNmWXf
C7pdLpFwOEw7W8LBGtG6muwhIg68Jg==
=zG+g
-----END PGP SIGNATURE-----

--fcwhvrGLJvSnAWHM--
