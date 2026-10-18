Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE422D1F77
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 08:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792313610; cv=none; b=kqAKG/TNIlqNwC+h7xKlhOshV5QJjC7FgQ+VPW5ODbukCgn5RUUim/CScpkv72tNsj3N20vUnaJzooCrkCAxKdhi01J7JgOgupzTGmR88vv3LcU+hrClz7H+blUqPGY/rHQ5oIDBsk+DvJIALpvI5Eb2Ok84QF9cztyNZcwcYl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792313610; c=relaxed/simple;
	bh=Y9ypoCueT+OgqGp/oXmNO2rGcG9Rjd0SGYEuE5ExVeg=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cZocMtM2AkdewYr1nd+yeKpbI/cD0zzDjgFnBX/C8rLu1nazHw+qgx4VoXdXxIcVeur5eYu7XtoxV0inlpPsBQ6jLTFj6hoT+ei1LCgW84r6NqWO9eEKEoGpvcqVvcz3lDBM93hVErtLcGXN52aL2I1HpflpM3zSomcsdO7sURs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=W/EgDCZh; arc=none smtp.client-ip=79.135.106.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="W/EgDCZh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792313600; x=1792572800;
	bh=EtzvZnRE+wRYUO6R1ALz2RggC9SretVTgsKeF3ah/kc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=W/EgDCZhnZa/hKB9H7I8EqXAAtA+/fvaCjuuBNUWHA12w71+TTXx56qYMUxQs6fGG
	 h1zIIdPgWVgyhJmwGwcpzZGZxIV64tQyeBvYSnUiNUd6ZXVFbnBxRx3VivcciQHElw
	 Z1epkrmwCSZaoJxLV5P6zzUyw8popONhFsShheI1IlrZPkuNUCDuuBG4JA0+H9Pj5o
	 q3FwxvKkvXGRY1/S0BAQ27GGyERtlf8U3KRsMn8g1dQgP3v/kCXsG+8uMPJboXtc9L
	 faHdDxS0RzKyoDoD9TS7JhcczNiGnAuxq6SUCkwv9KUUPbMNV0xEyWdvhQcv0a3/20
	 NBTKFUtuSkCoA==
Date: Sun, 18 Oct 2026 08:53:14 +0000
To: linux-kernel@vger.kernel.org
From: "Michael C. Pratt" <mcpratt@pm.me>
Cc: "Michael C. Pratt" <mcpratt@pm.me>, =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Christian Marangi <ansuelsmth@gmail.com>, Tomasz Maciej Nowak <tmn505@gmail.com>, Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH v2 RESEND] nvmem: layouts: u-boot-env: handle quotes in MAC post process
Message-ID: <20261018085253.30432-1-mcpratt@pm.me>
Feedback-ID: 27397442:user:proton
X-Pm-Message-ID: 3e237a5721a7412e6a9184846bea2a9961ade7a4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Although it is not common, some board models from some vendors have
a MAC address stored in u-boot environment as a quoted form, e.g.

    ethaddr=3D"AA:BB:CC:DD:EE:FF"

This is acceptable formatting for a u-boot environment variable, however,
it makes parsing MACs in post processing inconsistent and currently fails.

Add a second condition for processing to match the MAC address with quotes
by allowing a longer length and setting a shifted offset to compensate.

The mac_pton() function has strict behavior on the length and location
of delimiters for each octet and that each digit is hexadecimal,
so attempting different offsets of the same string is not problematic.

Signed-off-by: Michael C. Pratt <mcpratt@pm.me>
---
v1: https://lore.kernel.org/all/20260820211654.8794-1-mcpratt@pm.me/
v2: rebased and relocated changes to match style due to commit
    45cb0223740b ("nvmem: layouts: u-boot-env: check earlier for ethaddr le=
ngth")

 drivers/nvmem/layouts/u-boot-env.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/nvmem/layouts/u-boot-env.c b/drivers/nvmem/layouts/u-b=
oot-env.c
index 33ec2350386f..588996c1c11b 100644
--- a/drivers/nvmem/layouts/u-boot-env.c
+++ b/drivers/nvmem/layouts/u-boot-env.c
@@ -77,6 +77,13 @@ static int u_boot_env_parse_cells(struct device *dev, st=
ruct nvmem_device *nvmem
 =09=09=09info.bytes =3D ETH_ALEN;
 =09=09=09info.read_post_process =3D u_boot_env_read_post_process_ethaddr;
 =09=09}
+=09=09/* Handle quotation which increases length by 2 and offset by 1 if p=
resent. */
+=09=09if (!strcmp(var, "ethaddr") && info.bytes =3D=3D MAC_ADDR_STR_LEN + =
2) {
+=09=09=09info.offset =3D data_offset + value - data + 1;
+=09=09=09info.raw_len =3D strlen(value);
+=09=09=09info.bytes =3D ETH_ALEN;
+=09=09=09info.read_post_process =3D u_boot_env_read_post_process_ethaddr;
+=09=09}
=20
 =09=09nvmem_add_one_cell(nvmem, &info);
 =09}
--=20
2.30.2


