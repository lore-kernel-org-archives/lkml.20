Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24E047F2CA;
	Fri, 16 Oct 2026 12:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153084; cv=none; b=RuefdlYnkTAvJXBZJrr1dYhnle2D0sxo0zRz+uXeAhRjX/paG/pxXIkqcUQnJASsBVrhrMSXDrJeIzwtwqiqGEbu630sx6HkIoH2UyMuJ+pGjle/ddeBBlLPTmX1r/jDy6S1sxmP7B1hZA7IMdm/gt8PtSUOo4xIBS2AwgmuF20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153084; c=relaxed/simple;
	bh=8bve0J8qBl7msxr6VN3bEfAfnn18MRXNNNL4kJoSZg8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G/6a1xUL2Q8zXS1WpJIvBKEoYcKQtXdw81GIG5awIpT9PnH/SuQ4dN/3+7YZLmPP8yXeTEpcFGACtIB8rWp4vqm1vPMmPvwWqQsIEybF7JVLuz/ImsWI6NjlEopzs5qYdfYeA/lUMyo4SyrI4mo//fcNuZJ0Gyz1JvbCmUy2rIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W3VNJpao; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3VNJpao"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB5D1F000C4;
	Fri, 16 Oct 2026 12:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792153082;
	bh=scmmiHmloNp0QeKx28eTFfiWE13pWpJ8+0kBe/f75yc=;
	h=Date:From:To:Cc:Subject;
	b=W3VNJpaorKUp3fmQosGYIp1RYxtN+DpgRPmEAnETEBVIhajIInhqwhcshDwd5ijpI
	 Sxb3KkDK5qndLzIix03ToiZ8MDswj8G0q+ZBR/ONNzglv/ZecuEzKTt9Uv0bRwYrEY
	 qaUc6Ex+W8usdjr86L/qmiwO+A/n0H1nmbM29ncQGozpoZMrEKlVcVyeH0p25pmvLR
	 PsSV38lDc3wSImktp4OvFrzeJshjJj9C79m1LLN/kD+bDdyz/0hWRl0BkpB8pcHFCC
	 CQo1l+avh2IRK8mQfs9akrgjMa8ImNNeIPYukPOvPL1kXJRmU+kQvfdRkOtOgawav3
	 XgVqm2yDMOPQw==
Date: Fri, 16 Oct 2026 13:17:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Nikolas Koesling <nikolas@koesling.info>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the hid tree
Message-ID: <atIV9kBYjdaxLov3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FgVeoX98tE4dsFZl"
Content-Disposition: inline


--FgVeoX98tE4dsFZl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the hid tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

/tmp/next/build/drivers/hid/hid-pulsar.c:742:4: error: expected '}'
  742 |           .driver_data = TYPE_KYSONA },
      |           ^
/tmp/next/build/drivers/hid/hid-pulsar.c:730:52: note: to match this '{'
  730 | static const struct hid_device_id pulsar_table[] = {
      |                                                    ^
/tmp/next/build/drivers/hid/hid-pulsar.c:742:32: error: expected ';' at end of declaration
  742 |           .driver_data = TYPE_KYSONA },
      |                                       ^
      |                                       ;
/tmp/next/build/drivers/hid/hid-pulsar.c:743:2: error: expected identifier or '('
  743 |         { HID_USB_DEVICE(USB_VENDOR_ID_ATK, USB_DEVICE_ID_ATK_VXE_R1_SE_WIRED),
      |         ^
/tmp/next/build/drivers/hid/hid-pulsar.c:752:1: error: extraneous closing brace ('}')
  752 | };
      | ^
/tmp/next/build/drivers/hid/hid-pulsar.c:767:1: error: definition of variable with array type needs an explicit size or an initializer
  767 | MODULE_DEVICE_TABLE(hid, pulsar_table);
      | ^
/tmp/next/build/include/linux/module.h:256:21: note: expanded from macro 'MODULE_DEVICE_TABLE'
  256 | static typeof(name) __mod_device_table(type, name)                      \
      |                     ^
/tmp/next/build/include/linux/module.h:247:2: note: expanded from macro '__mod_device_table'
  247 |         __PASTE(__mod_device_table__,   \
      |         ^
/tmp/next/build/include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
   16 | #define __PASTE(a, b) ___PASTE(a, b)
      |                       ^
/tmp/next/build/include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
   15 | #define ___PASTE(a, b) a##b
      |                        ^
<scratch space>:37:1: note: expanded from here
   37 | __mod_device_table__kmod_hid_pulsar__hid__pulsar_table
      | ^
5 errors generated.

Caused by commit

   e55cf379e822b (HID: pulsar: add driver for Pulsar gaming mice)

I have used the tree from next-20261015 instead.

--FgVeoX98tE4dsFZl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrSFfUACgkQJNaLcl1U
h9DuKgf9HfFQemLTyQ/6pO1IxkxWaTAt2JC8eqzy8xokA7AwvL4xEdFND4Ss7tIB
hAag6uNa/mbjMJ9MBFwuXhG3DWm6I08QYNwE6TfwB0yHPTkOexnwBcv2gLwnZkU9
JX89o2uuJ59f1bUO21sigr1/qFgCDeaMK1DAYua4E4l7TfeSG4WE52R4E03muIvr
tOqlYBFmrVKdrtazM48EhEKW8WAHuzfZc7qOi2D1/cIBglUxtp4Is2LPXTBAWg/f
fc3chVEjNF7aP4+W33Fe+IB20IN84eV+2BCEVdcdD0lRDDiIfg5kqVJqJxai5D6A
/AFfdP2SmWXsBfkc7ttwPir3g30YMw==
=WjYy
-----END PGP SIGNATURE-----

--FgVeoX98tE4dsFZl--
