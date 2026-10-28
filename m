Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195048;
	b=JzEqJvPfnRJdPPrxWSrkabwlM2ROLhfvgRVvhdeRNmguRf8f+Fupv/d/y/r46JRcJpvM
	 iVqfj6R9OIKCiTUHbBLXkEb4r3A7FnejBAAXnELzbcxIyWYvBGrg6Iy7LcQqInblg80Nu
	 811fen7TVScuzxrk70uBdrbMoM4E+YtpC4lOryfyFOjWvyyKvO4zTHGmqs8eTmUdhC9aY
	 hPP3nzbJ2f1+0NtIVkPHdvAO7YC+S0eAHSzsrIX4nh6TdK+zDrwcVD3c86vuu7EyDFLeg
	 bPOVYejSVBYuYX+Qf/yKk54TNMBCBUoMlyxHWnh0Pd3r4Lo/702rTFm9YDe7kqsKNgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195048;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=0F9qs9e4Bp6igALqMO8Z/9sbXVyVE1i0oy0JLqsS03I=;
	b=MVSni0zFVVPAmyfSe6jARIGia/FUhI8tkB0Gwh4E0uh5exhb97Ezd4Sc86vtFwUA1LIm
	 zeEeoje1iltqeWaDoRqWcThpJJOUzt7X0oR7LCzHJMI4szHAzW4qlQN1pxidPxsyLMhgx
	 8oV4IdQbyaoikG5Dx3UWHcPYFjsDL5kGKoJlakinakbLPxxdA+IOYHaTBKe4Dpq5/aCN2
	 NsXKLViSl4k/kzZUof2KJlvxEJHIjG6HcRso67VwrbmNRin7wIr7Vnfl6jq9PWclpGF1j
	 sZOO4lE2z1n5A2vvrMo/8wxEBz28HUVQv1WXnk+3EAyxDP7oOt7NPAsPqAEh1vCPv1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HbUWnEBa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52F3606A31A;
	Wed, 28 Oct 2026 13:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HbUWnEBa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339F51F01825;
	Wed, 28 Oct 2026 13:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793195047;
	bh=0F9qs9e4Bp6igALqMO8Z/9sbXVyVE1i0oy0JLqsS03I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HbUWnEBatjqsz+CpxDpXrfL0ipkt2xIuMbA0LZXaJefKYJZ5lRQakGxvXu5mi52dl
	 0BljvlFa0x+ijluMlUMNvZQYIiLUw84DimbD167DW1z59vHNWTaWqqet3e4bvwpu/B
	 qtRTABbI3cYz54kyJbicrEqRoAiTeFMzmPcu4nTjhn1haILI06cNYYn623AbE37tkZ
	 o6uhngt7l0Uw97gGt2JaYNFVoun/iY/YD3BkUoAWosFNJgz2tI1fnk4o66xqiunVtk
	 VjK/JNkgoACAi8bzzjBVxHhedYg2NzrbbV6ErgAqxZ8q+dg8kV6YMlMKtd+9vWqAyv
	 gjxEgCzcOiLkA==
Date: Wed, 28 Oct 2026 13:44:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Kevin Wang <kevin.wang@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the amdgpu tree with the origin tree
Message-ID: <cb647aad-e931-467e-a693-05207dfdd9ce@sirena.org.uk>
References: <auH4hkxipwOwNz44@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="Bgo1tJgDojouYbhj"
Content-Disposition: inline
In-Reply-To: <auH4hkxipwOwNz44@sirena.org.uk>
X-Cookie: Pushing 30 is exercise enough.


--Bgo1tJgDojouYbhj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 01:28:42PM +0000, Mark Brown wrote:
> Hi all,
>=20
> Today's linux-next merge of the amdgpu tree got a conflict in:
>=20
>   drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
>=20
> between commit:
>=20
>   a2eae9f4fa1b0 ("drm/amd/pm: add zero fan stop temperature support on sm=
u 14.0.2")
>=20
> from the origin tree and commits:
>=20
>   f990c94a2633d ("drm/amd/pm: add zero fan stop temperature support on sm=
u 14.0.2")
>   1b63bb397db20 ("drm/amd/pm:restate all customized OD features on every =
table upload for smu 13.0.0/smu 14.0.2")
>   d2c1e98658b6c ("drm/amd/pm: report smu energy accumulator updates")
>   8d4ce79aff1cd ("drm/amd/pm: preserve committed OD features for SMU 14.0=
=2E2")
>=20
> from the amdgpu tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Also needs this additional fixup to cope with the cherry picking:

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c b/drivers=
/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
index cdd308ced4f9a..24a3d61d8ea66 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
@@ -2603,10 +2603,6 @@ static int smu_v14_0_2_od_restore_table_single(struc=
t smu_context *smu, long inp
 		od_table->OverDriveTable.FanZeroRpmEnable =3D
 					boot_overdrive_table->OverDriveTable.FanZeroRpmEnable;
 		break;
-	case PP_OD_EDIT_FAN_ZERO_RPM_STOP_TEMP:
-		od_table->OverDriveTable.FanZeroRpmStopTemp =3D
-					boot_overdrive_table->OverDriveTable.FanZeroRpmStopTemp;
-		break;
 	case PP_OD_EDIT_FAN_ZERO_RPM_STOP_TEMP:
 		od_table->OverDriveTable.FanZeroRpmStopTemp =3D
 					boot_overdrive_table->OverDriveTable.FanZeroRpmStopTemp;

--Bgo1tJgDojouYbhj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrh/CIACgkQJNaLcl1U
h9AjsAf+KGLv9i9ZEeoz4S32AMjh8iUBArxGCKnb0Qbvuo5nKSqcVf8XjCEkwpE+
gSC5mtRkB7w2fUwktTOVQfFW/tNTq6F8XsltDN62gmLTA3leGz0w46VWl921bqzi
C33Br4nNWt78LivcDVzpTX5fnsA6VrYLt63gtyJklotGZM5rzyW1K2iYx9x1nazq
Xsk2nXNSf05aA8eV+eSEImZaqU5B0HqmdbinvLFx4HVBWk3k5Wc6SgGXqDy4VdEH
bucKWBxlOnjb4YyzXGqpteskTarG5mAyw70a+sTCY6RrTkPi9kS4R4y6LqYjS5Da
4NhwnWlmgwFGRj2KlzfmWcP3PF3okA==
=qJMJ
-----END PGP SIGNATURE-----

--Bgo1tJgDojouYbhj--
