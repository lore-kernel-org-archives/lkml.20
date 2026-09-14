Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B710441DEF7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378626; cv=none; b=a8VvYjvUGL8bQGEHefiuC3VNMEw8ao2ZggF3Ccj2kxDTNpd9RQRMRAt8HGQf+kDDDsNUpb0el6VlSt/b/Uuubmdx/XBiSC7sH67S0chH5bs0SzKUKyoMWhTNIrKf32AH+1u+aKlgJFo+GUxK425nPdXjkadj+Cx3rdbRI+HgeIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378626; c=relaxed/simple;
	bh=ETEUsxXQbykssZtM3WUEGlwHnlcTZBq+iXCp31uNlsg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=YVzJ7MOfRT8YHP2yccBmBQUSBGrqOV+I/5l6TFciwVzTpIzlvSO/WLENsP4mO8F/NvqjX18cJlw9NWiiLtXPeQwlqo0BeL24S9xVCxb2mwMBZtD+DpJp/11cXAfqimDv99r3btzrxv1iIThkNdUN3vCbrprZdRIvASSrAu+MytY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1q0VWeC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1q0VWeC"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C9F1D1F000FF;
	Mon, 14 Sep 2026 09:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789378624;
	bh=EEczusL60kIlaGDXpaeA4vSKeh8P7cute24deuMG9pU=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=f1q0VWeCoNCUqItX9fug//25Wrlsf+h1SaY/TONriAPkz9r4XL4YH1bLUIVRsegAc
	 0YQyBMdsBbETqyrLSZ7YzycFR0Y3an3clkhyL4Bv+UIW7jnV1c2AnozvQTVqNCf9CI
	 OSaxHJ7pk7F+UYH3RNnrPW0sp96egIvJe4gtPsSkz/oWxeIG6igurNwzFfSdUsVMP1
	 BoTSSBS0Gl+puw2Ku3FGzF7EZWVKC5eYjXunjTYU2ffE8igv4F60NE6AL6bcsxLCGb
	 29cfeu2UgAYwOGyyl17xVogECKj9xeS18RselvvdYF+S2diJnGYyU0mQqM0nTSPou3
	 dNsVC/xY5JUmg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=6772bacee958a6c0e9d12f720d351f228d2b58bd69892be9ac587ac6df17;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 14 Sep 2026 11:37:00 +0200
Message-Id: <DLEXS5VCYB1P.1NJI7ZU6HYUHF@kernel.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: spansion: Assign .fixups to
 s25fs256s1
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: <Takahiro.Kuwano@infineon.com>, <pratyush@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <tudor.ambarus@linaro.org>, <alex@sverdlin.org>
X-Mailer: aerc 0.20.0
References: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
 <20260914-s25fs256s-fixup-v1-2-e94019455c1e@infineon.com>
 <DLETVUMUX3AN.3SSH7NN2CKAIU@kernel.org>
 <fb4398e88939472eaa86cdc098a3d265@infineon.com>
In-Reply-To: <fb4398e88939472eaa86cdc098a3d265@infineon.com>

--6772bacee958a6c0e9d12f720d351f228d2b58bd69892be9ac587ac6df17
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Takahiro,

On Mon Sep 14, 2026 at 9:11 AM CEST, Takahiro.Kuwano wrote:
> Hi Michael,
>
>> On Mon Sep 14, 2026 at 6:50 AM CEST, Takahiro Kuwano via B4 Relay wrote:
>> > From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
>> >
>> > s25fs256s1 has incorrect SFDP entries, like s25fs512s and s25fs128s1.
>> > Assign the common s25fs_s_nor_fixups to s25fs256s1 to fix its page siz=
e
>> > and sector map.
>>=20
>> Do you have an SFDP dump by chance? I haven't found one on the list
>> for this flash.
>>=20
>
> Yes, but param tables are located beyond PAGE_SIZE(1000h)...

Could you test the following patch if that helps?

--- a/drivers/mtd/spi-nor/sysfs.c
+++ b/drivers/mtd/spi-nor/sysfs.c
@@ -99,10 +99,26 @@ static umode_t spi_nor_sysfs_is_bin_visible(struct kobj=
ect *kobj,
 	return 0;
 }

+static size_t spi_nor_sysfs_bin_size(struct kobject *kobj, const struct bi=
n_attribute *attr, int n)
+{
+	struct spi_device *spi =3D to_spi_device(kobj_to_dev(kobj));
+	struct spi_mem *spimem =3D spi_get_drvdata(spi);
+	struct spi_nor *nor =3D spi_mem_get_drvdata(spimem);
+	struct sfdp *sfdp =3D nor->sfdp;
+	size_t sfdp_size =3D sfdp->num_dwords * sizeof(*sfdp->dwords);
+
+	if (attr =3D=3D &bin_attr_sfdp)
+		return sfdp_size;
+
+	return 0;
+}
+
+
 static const struct attribute_group spi_nor_sysfs_group =3D {
 	.name		=3D "spi-nor",
 	.is_visible	=3D spi_nor_sysfs_is_visible,
 	.is_bin_visible	=3D spi_nor_sysfs_is_bin_visible,
+	.bin_size	=3D spi_nor_sysfs_bin_size,
 	.attrs		=3D spi_nor_sysfs_entries,
 	.bin_attrs	=3D spi_nor_sysfs_bin_entries,
 };

--6772bacee958a6c0e9d12f720d351f228d2b58bd69892be9ac587ac6df17
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaqfAPBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hMygF+PxyjWh8LmZT+QsgsGPiLePGUj9fSwJXR
qP1kY11p9hlGNsL9zWcF9dsOTwI/7relAYDN3ggcmfiNvgwBVcBQeGpyPfF4gvql
K+3pfOtE5QLDfXSdKz6IoPxDbnmsRIPvk5Y=
=6G4J
-----END PGP SIGNATURE-----

--6772bacee958a6c0e9d12f720d351f228d2b58bd69892be9ac587ac6df17--
