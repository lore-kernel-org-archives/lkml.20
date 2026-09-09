Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4211158E2A2;
	Wed,  9 Sep 2026 21:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788988124; cv=pass; b=duPO/lpC3i1agccGIan/rVeIOM6+L+AXDUG0ohtDbdABWeb0WzFHGDSWtB6xJb36vjgDMpy7SF5uXLE2/4SyIbwttdV6aBd6yVD4mmKj80r6gEaKmv4UukotHiZiKN83Ukx0n5v10cRy/vRGwcaTpEhFBqEYSeYX6x84iAGaHp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788988124; c=relaxed/simple;
	bh=tj/bEIU1bcu8t022BqWb+Qu+7tbxn3sUWiwo2QeLhKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGMRrQ6l2JE/ywg0bq6ertBq20jd0QlSRLZpHEBYhvveknVwePmn8ar3qwY4x5KFKbqAFtswvmquwX00a0lnJ6dWUXp5o8MW5bO/l1Xh3MIj6vNJ+p9aaGVtji2yDwqsYm7EP6Dd5nGAUKdcPUsf6Q5F3pcJInLmllRTMpl7DKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=EmASXpM1; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="EmASXpM1"
ARC-Seal: i=1; a=rsa-sha256; t=1788988113; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CpD6VP6KZMOrlJhjQVEp3m2dy6Ey/biNn+DSAbVi4EgvHeDVRriB+nB+D3QvOC18WUaJX7S2Br+HEOLhUYQ2QWunOjERd4M9u3VC/pU+8IkGcOdm7vQwz5Qv8K4FxoutH/sXGBX2wW+PXCxLO/eByLK3540ZZ+i7eOwKEYnvUAg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788988113; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=i20i/ggCALMNwDadOAv6mdnZuvWfc14LrBp1z4LLOr0=; 
	b=D8MgXatBd7g78cinmgSi55n9sHMgN/O4IlrNAHpR9JgbWfpnxXl5T1nKF2kepmkdrprvyGLvM5MR5188D9N5tCr6QV1y8EuHNw3K6zS08VeYgBDKvTIcYwvBSY80GXZZ0O6pRDEnku2fVHfF4BejbNNFYRBC9t+M/vWCg+WfbRo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788988113;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=i20i/ggCALMNwDadOAv6mdnZuvWfc14LrBp1z4LLOr0=;
	b=EmASXpM1N46pu71p6ZHd999oEuT2GFWBnbT7+psLaJdhDcNY8qPKaonvI5a+l2eo
	pWfAB6MKph8mJFvitVRvuhOHExB6VsfkmR3rqZK+mkGNozWu1bRW4XTIFryPGyMJkBQ
	EyKU+vP5s23IS7/CbENiP38xSLzEKYowb0s0jZrE=
Received: by mx.zohomail.com with SMTPS id 1788988111194745.2781428972909;
	Wed, 9 Sep 2026 14:08:31 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 8B1C2183377; Wed, 09 Sep 2026 23:08:27 +0200 (CEST)
Date: Wed, 9 Sep 2026 23:08:27 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: amitsd@google.com
Cc: Badhri Jagan Sridharan <badhri@google.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, RD Babiera <rdbabiera@google.com>, 
	Kyle Tso <kyletso@google.com>
Subject: Re: [PATCH] usb: typec: tcpm: Support native battery energy
 properties in battery AMS
Message-ID: <aqHJtbFkepedz7BO@venus>
References: <20260820-tcpm-energy-props-upstream-v1-1-0a0167863848@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="deq6sdnandm5mu3o"
Content-Disposition: inline
In-Reply-To: <20260820-tcpm-energy-props-upstream-v1-1-0a0167863848@google.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/288.982.46
X-ZohoMailClient: External


--deq6sdnandm5mu3o
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] usb: typec: tcpm: Support native battery energy
 properties in battery AMS
MIME-Version: 1.0

Hi,

On Thu, Aug 20, 2026 at 09:17:58PM +0000, Amit Sunil Dhamne via B4 Relay wr=
ote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> Some fuel gauges report battery telemetry in energy rather than charge.
> Add support for querying native energy properties for Battery Status and
> Battery Capabilities AMS, falling back to calculating energy from charge
> and average voltage when primary properties are not supported.
>=20
> +---------+--------------------+----------------------------------+
> | Sr. No. | Primary            | Fallback                         |
> +---------+--------------------+----------------------------------+
> | 1       | ENERGY_NOW         | CHARGE_NOW + VOLTAGE_AVG         |
> | 2       | ENERGY_FULL_DESIGN | CHARGE_FULL_DESIGN + VOLTAGE_AVG |
> | 3       | ENERGY_FULL        | CHARGE_FULL + VOLTAGE_AVG        |
> +---------+--------------------+----------------------------------+
> Note: All properties above are to be prefixed with POWER_SUPPLY_PROP_.
>=20
> Closes: https://lore.kernel.org/all/amVJ1u67qHENBQ5l@venus/
> Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Assisted-by: Gemini:gemini-3.1-pro
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>  drivers/usb/typec/tcpm/tcpm.c | 57 +++++++++++++++++++++++++++----------=
------
>  1 file changed, 36 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index a8cd1959c426..0d7dc0b51c87 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -410,6 +410,9 @@ struct pd_timings {
>  /* Convert microwatt to watt */
>  #define UW_TO_W(pow)				(div_u64((pow), 1000000))
> =20
> +/* Convert micro-Watt-hours to USB PD energy (increments of 0.1Wh) */
> +#define UWH_TO_PD_ENERGY(energy)		(UW_TO_W((u64)(energy) * 10))
> +
>  /*
>   * As per USB PD Spec Rev 3.18 (Sec. 6.5.13.11), the number of fixed bat=
teries
>   * that a port can be queried is restricted to 4.
> @@ -1580,8 +1583,7 @@ static u16 tcpm_charge_to_energy(int charge, int vo=
ltage)
>  {
>  	u64 energy =3D div_u64((u64)charge * voltage, 1000000);
> =20
> -	/* Battery telemetry is reported in increments of 0.1Wh */
> -	return (u16)UW_TO_W(energy * 10);
> +	return UWH_TO_PD_ENERGY(energy);
>  }
> =20
>  static int tcpm_pd_send_batt_status(struct tcpm_port *port)
> @@ -1612,16 +1614,17 @@ static int tcpm_pd_send_batt_status(struct tcpm_p=
ort *port)
>  	else
>  		batt_present =3D val.intval > 0;
> =20
> -	ret =3D power_supply_get_property(batt, POWER_SUPPLY_PROP_CHARGE_NOW,
> -					&val);
> +	ret =3D power_supply_get_property(batt, POWER_SUPPLY_PROP_ENERGY_NOW, &=
val);
>  	if (!ret) {
> -		charge_now =3D val.intval;
> -		ret =3D power_supply_get_property(batt,
> -						POWER_SUPPLY_PROP_VOLTAGE_AVG,
> -						&val);
> -		if (!ret)
> -			present_charge =3D tcpm_charge_to_energy(charge_now,
> -							       val.intval);
> +		present_charge =3D UWH_TO_PD_ENERGY(val.intval);
> +	} else {
> +		ret =3D power_supply_get_property(batt, POWER_SUPPLY_PROP_CHARGE_NOW, =
&val);
> +		if (!ret) {
> +			charge_now =3D val.intval;
> +			ret =3D power_supply_get_property(batt, POWER_SUPPLY_PROP_VOLTAGE_AVG=
, &val);
> +			if (!ret)
> +				present_charge =3D tcpm_charge_to_energy(charge_now, val.intval);
> +		}
>  	}
> =20
>  	ret =3D power_supply_get_property(batt, POWER_SUPPLY_PROP_STATUS, &val);
> @@ -1678,19 +1681,31 @@ static int tcpm_pd_send_batt_cap(struct tcpm_port=
 *port)
> =20
>  	invalid_ref =3D false;
>  	batt =3D port->fixed_batt[batt_id];
> -	ret =3D power_supply_get_property(batt, POWER_SUPPLY_PROP_VOLTAGE_AVG,
> -					&val);
> -	if (!ret) {
> -		vol =3D val.intval;
> -		ret =3D power_supply_get_property(batt,
> -						POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN,
> -						&val);
> +
> +	ret =3D power_supply_get_property(batt, POWER_SUPPLY_PROP_ENERGY_FULL_D=
ESIGN, &val);
> +	if (!ret)
> +		design_cap =3D UWH_TO_PD_ENERGY(val.intval);
> +
> +	ret =3D power_supply_get_property(batt, POWER_SUPPLY_PROP_ENERGY_FULL, =
&val);
> +	if (!ret)
> +		charge_cap =3D UWH_TO_PD_ENERGY(val.intval);
> +
> +	if (design_cap !=3D BATTERY_PROPERTY_UNKNOWN && charge_cap !=3D BATTERY=
_PROPERTY_UNKNOWN)
> +		goto send_cap;
> +
> +	ret =3D power_supply_get_property(batt, POWER_SUPPLY_PROP_VOLTAGE_AVG, =
&val);
> +	if (ret)
> +		goto send_cap;
> +
> +	vol =3D val.intval;
> +	if (design_cap =3D=3D BATTERY_PROPERTY_UNKNOWN) {
> +		ret =3D power_supply_get_property(batt, POWER_SUPPLY_PROP_CHARGE_FULL_=
DESIGN, &val);
>  		if (!ret)
>  			design_cap =3D tcpm_charge_to_energy(val.intval, vol);
> +	}
> =20
> -		ret =3D power_supply_get_property(batt,
> -						POWER_SUPPLY_PROP_CHARGE_FULL,
> -						&val);
> +	if (charge_cap =3D=3D BATTERY_PROPERTY_UNKNOWN) {
> +		ret =3D power_supply_get_property(batt, POWER_SUPPLY_PROP_CHARGE_FULL,=
 &val);
>  		if (!ret)
>  			charge_cap =3D tcpm_charge_to_energy(val.intval, vol);
>  	}
>=20
> ---
> base-commit: e1e6e541c5c9cf548e9fdc35fc26808c82074440
> change-id: 20260820-tcpm-energy-props-upstream-a493353f0054
>=20
> Best regards,
> --=20
> Amit Sunil Dhamne <amitsd@google.com>
>=20
>=20
>=20

--deq6sdnandm5mu3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmqhyscACgkQ2O7X88g7
+pp1cQ//e6lmtujD0Yb0vr0irVWyua8bCpQyKIA/YNOeHE02WIRDmvBScuqsQDXK
/02HJUS03X4UVKtn1r0LkiaBElSdouay6hUIaz8pkbzZ/KZdTugFe7cK4Dcdp80W
4Whu/cZD6+mT7sYFNui4JOIKZECas+9Szo+IhyYZh4lrkwihv1X/oOSiS1NKEWqS
tyitONuftplvKOAgOpp7JcSBSXAN1PymrTpbD8VnKcMmBbUUaXFKlTXKGsOvBxRq
T7hsjaMHpQUcQwxZs0DELuJu9t1cHjdoVZGUmYD6t3/YdJJFwop8MWeOFOau5RBC
nMcWpU27uFLGw7zR6kl8OnM2rXMcnkkuGMpBjv0v1PGyzwmFdxlnrqaaB0CByWQ0
stAPgd90KEaZiuXKtDllptdF9Bme8ccIGd3/gz48D5KWRCuPaI12amRqEAlXwTNj
LE2OLAICljX/DR31J6ryFKoSBOMi7SvJODiOHjiwgZBn3YCCYwE7EApfrx9rQ6m5
dmAmNueV8mcryZl4UQju7e9P+4ieu29zHLgGymCSkBdSKyok9y7wx8iGDFcRPOov
QAcEJBQeZozuMTzWhCruHUSLxZaLMTK164gWDIvvtGMxR3aQcSx85Z0hV1QNoQb3
1nOuEC9L4fDgqff4Zz0sjCy5z5pyde7FI0gnnKTV3GGYWShT+4E=
=b/yb
-----END PGP SIGNATURE-----

--deq6sdnandm5mu3o--
