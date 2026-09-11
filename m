Received: from mx.prosyst.ru (m2.prosoftsystems.ru [46.48.77.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420D025B092
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.48.77.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123681; cv=none; b=TydUvd7nbPilAX11rcNrVaZiiEvnw0GLeEUKyIS2CzpOZ/cTZvqVQFWhJOek8DICDTJ4VN2XVJ3WaqSge9c2IdXf4aX9753KoFvdr94rKLfD9v1LdOp1AzCBG9Z4TRI9EFHNRe4TdDkhmzm96UUmXX8j5IO/FCtMNoSLIa7iob8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123681; c=relaxed/simple;
	bh=kVjYpzvs7SSXNsXhryb14V268Jy4BkL4a6JSVONVtOM=;
	h=Content-Type:From:To:CC:Subject:Date:Message-ID:MIME-Version; b=YIrPM4DbgEXs7QTjLmQd7XOOnzIkBEcweAy/+F8TFPUBCgdz89kLEZheR0Gb77ibZGCm/e6pD8FvXM4qvxxtJDmPih7ZGEXBwZYBk8ULRr80SLCMjkW90zSAOlxDQMULWywh8/ra9t1azvUEIZ+UImS8aL7KZ7FZdmtIpDICzK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prosoftsystems.ru; spf=pass smtp.mailfrom=prosoftsystems.ru; dkim=pass (2048-bit key) header.d=prosoftsystems.ru header.i=@prosoftsystems.ru header.b=jtpiRGky; arc=none smtp.client-ip=46.48.77.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prosoftsystems.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prosoftsystems.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=prosoftsystems.ru header.i=@prosoftsystems.ru header.b="jtpiRGky"
Content-Language: ru-RU
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=prosoftsystems.ru; s=ps;
	c=relaxed/relaxed; t=1789123673; h=from:to:date:message-id:subject;
	bh=Bltucx8uiSFniYx53HvnLGvc1/IBX4rsQwiymh/t3pw=;
	b=jtpiRGkyvPw6fiEyowV1rME90sj5ozye/lh54t8y6l/NhRhSGhJ/0wjZp6HDx+lP4pN+3hQn6Lo
	jRsKs10ZDGF2z8E6eyz3aO/HWtDklNz/FbHM9FW9YRDZtQ+MecGUrkuyibYmrzK+goB5hV/FiGEFP
	yclzXvbDdviUEyR/IdhKSPQNGD0WipKWgn34K+exbt9CO7ByUcuVkxGqQ/S+FmBRGCBN7sDl70nN6
	AtfSeCtCYAMmCgt2Mk2oJzbnAa7mscVAF9b/Zl+c1KwPYfx1jpEbfd9Azsh1KAeUotnLBMwFaeQeY
	PknYJIMSsVGN9nYD9dGqvhaEtHwNSMPf4OKg==
Received: from echo-2.prosoft.ural.ru (172.21.245.22) by mx.prosoftsystems.ru
 (172.21.240.33) with Microsoft SMTP Server (TLS) id 15.1.396.30; Fri, 11 Sep
 2026 15:47:53 +0500
Received: from echo-2.prosoft.ural.ru (172.21.245.22) by
 echo-2.prosoft.ural.ru (172.21.245.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Fri, 11 Sep 2026 15:47:53 +0500
Received: from echo-2.prosoft.ural.ru ([::1]) by echo-2.prosoft.ural.ru
 ([fe80::c1a2:90f7:8820:c669%17]) with mapi id 15.02.1748.039; Fri, 11 Sep
 2026 15:47:53 +0500
From: =?koi8-r?B?9sHNwsHLycXXIPLBxMnKIPLJy8HSxMnOz9fJ3g==?=
	<r.zhambakiev@prosoftsystems.ru>
To: Liam Girdwood <lgirdwood@gmail.com>
CC: =?koi8-r?B?9sHNwsHLycXXIPLBxMnKIPLJy8HSxMnOz9fJ3g==?=
	<r.zhambakiev@prosoftsystems.ru>, Mark Brown <broonie@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
Subject: [PATCH] regulator: ti-abb: drop unused ret assignments before
 skip_opt
Thread-Topic: [PATCH] regulator: ti-abb: drop unused ret assignments before
 skip_opt
Thread-Index: AQHdQdr/PkIVvXfkpkSEiHGyctyeQg==
Date: Fri, 11 Sep 2026 10:47:53 +0000
Message-ID: <20260911104731.141511-1-r.zhambakiev@prosoftsystems.ru>
Accept-Language: ru-RU, en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

From: Radiy Zhambakiev <r.zhambakiev@prosoftsystems.ru>

In ti_abb_probe(), the two 'ret =3D -ENODEV;' assignments that precede a
'goto skip_opt;' are dead stores. After the jump, ret is immediately
overwritten at the skip_opt label by of_property_read_u32(), so the
-ENODEV value is never read.

Drop the redundant assignments.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Radiy Zhambakiev <r.zhambakiev@prosoftsystems.ru>
---
 drivers/regulator/ti-abb-regulator.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/regulator/ti-abb-regulator.c b/drivers/regulator/ti-ab=
b-regulator.c
index 04133510e5af..b77812b02147 100644
--- a/drivers/regulator/ti-abb-regulator.c
+++ b/drivers/regulator/ti-abb-regulator.c
@@ -751,7 +751,6 @@ static int ti_abb_probe(struct platform_device *pdev)
 	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, pname);
 	if (!res) {
 		dev_dbg(dev, "Missing '%s' IO resource\n", pname);
-		ret =3D -ENODEV;
 		goto skip_opt;
 	}
=20
@@ -770,7 +769,6 @@ static int ti_abb_probe(struct platform_device *pdev)
 	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, pname);
 	if (!res) {
 		dev_dbg(dev, "Missing '%s' IO resource\n", pname);
-		ret =3D -ENODEV;
 		goto skip_opt;
 	}
 	abb->ldo_base =3D devm_ioremap_resource(dev, res);
--=20
2.53.0
