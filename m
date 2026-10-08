Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9B13A3E97
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 03:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430921; cv=none; b=qU6nuXCZw0CP9RYluMGZuAA+sofDwzhOAx/gTze0PDYMXFUjU8PPqmHD0H2ceO29HXRmW1ucPWjScF8hHGY0Z5cxu2YnCx2r6Xabcz/2Nb981ae7B7eJ+E0Br4nEbyv434MLnXgeM21nrdlZ0tdviYO5RsclAIlc/byyHiqGa1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430921; c=relaxed/simple;
	bh=Y9ypoCueT+OgqGp/oXmNO2rGcG9Rjd0SGYEuE5ExVeg=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gxLeQTQN0rxwlWKwL647C/WOaTgoWA0idX+7knLVPJlP1rpVjVIGiqJp8y3maOpKSeOln7cb0/0ZSgLdgjosJRnbsUF5mR9OkghtiD6YxkCICddS7aE/E7vvyMvB4RdjX51qCoGzXpZTS+kSpdvH1TLtLx6R/6dDw+sbiUaCYOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=oN9/jfN9; arc=none smtp.client-ip=109.224.244.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="oN9/jfN9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1791430910; x=1791690110;
	bh=EtzvZnRE+wRYUO6R1ALz2RggC9SretVTgsKeF3ah/kc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=oN9/jfN9s72LLMKbXgvXXgjL9uiSjJMz0Msv5lqlvZulYHcjKosOJiu1Nnrzfrksk
	 cSahZehmwH2zZW7mw/AXM8pkWXloVMuCUKNKnW/M1gMEVoRmhHVSuZCwjIT3T2wf7A
	 i7mM+fBfnHYnxFJyUEuVnyf+bnkE1czpWADaep7q9WdQ0bT7wQjI2ZP0FMwlWDpxDZ
	 Fi116Ei4+RkZ56ZcGeipy/vJNz+f5sRVoRy+NymjiC996aB1fs+84qHGkkHcZf1JNB
	 cyP7y7hSQ6sEmEzIb4+h3NsODEkIKp+flL+6SNmgtNhPv7GxbEereoITlQLI48drI4
	 AdxlC2Jx/AHPA==
Date: Thu, 08 Oct 2026 03:41:49 +0000
To: linux-kernel@vger.kernel.org
From: "Michael C. Pratt" <mcpratt@pm.me>
Cc: "Michael C. Pratt" <mcpratt@pm.me>, =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Christian Marangi <ansuelsmth@gmail.com>, Tomasz Maciej Nowak <tmn505@gmail.com>, Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH v2] nvmem: layouts: u-boot-env: handle quotes in MAC post process
Message-ID: <20261008034108.15143-1-mcpratt@pm.me>
Feedback-ID: 27397442:user:proton
X-Pm-Message-ID: 7edd786cc226e9ec5d2f7f0672e615f74a476ecd
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


