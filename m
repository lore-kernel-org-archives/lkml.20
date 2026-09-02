Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3198129B78F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.88.110.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788311818; cv=none; b=nGGt7zbHwyxNz1ci1QPCxTXbYzeySITgmi7lSJgkLBN7hGetpxvEMLmehkZcyyCNB9UWaBQhS+dXfa8s+H8WxubBnFrWYFuybxG/QuRZvCMt+SvDFYv58o2qOxa3vP4uEc+mxgFTARx2n5i5bor7sJO3PjEny8ai4/s+RuRsJho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788311818; c=relaxed/simple;
	bh=ebeWsw/dv3nBGXHdntVt3cRqdDCIzpBc/6uDEjPSN+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UwGcKeRoVzQBv5RSwujQeo+dOUGWCZMK94iKwrhIzNaKvx1SLLLqN2YiqjX4IpmxE1UOIqKc9m1MvpHfB4WJmJxDNPe43Ifc/2M23pxqpXAn4k+FOg70Kzkg18dK+eKco0wcKbUMzxwsUzo97n4wgG5TEtWkqy4thRDkCeKH5X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com; spf=pass smtp.mailfrom=savoirfairelinux.com; dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b=FszSB5c6; arc=none smtp.client-ip=208.88.110.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b="FszSB5c6"
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 898A93D80350;
	Tue,  1 Sep 2026 21:07:02 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id kmvISv9OruWJ; Tue,  1 Sep 2026 21:07:01 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 943C03D816BC;
	Tue,  1 Sep 2026 21:07:01 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 943C03D816BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1788311221; bh=PCIjiH/RIxkpROf3JPRP9Gia/W9nF2ro02U5ljcPHOg=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=FszSB5c6XPlrp5OCozSytAZc0uEL5zaI/rjCGtap6FoOjwqXvRhaq7ZW5cia83WV/
	 552hFUN37msBR7qCuC+3EIDu9OFYKU2v4XORtQsXAqLox7CalAYwFkGAtKhWzF6TFx
	 UmYvc08Cgck7fhznVIV9xuF5ofdmdxJx2YFGMX6T6nYlc/cJ44g7BlwsSPcBD85IZ8
	 0M2z7LGwXQf+LcTQLwarJwJmcPqDfCc9n0Ul2CJ1gRe2w+VH3StI0k9S7j23N2xTJe
	 Nf7ElGfUMwtncFFbjvo2j6Xxaf/4gwru20pz/t0u/5Sw1CgYj6ClIyp7/dVwHtpeoO
	 BHfADL04jxkpA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id juNjQrO1w2Jz; Tue,  1 Sep 2026 21:07:01 -0400 (EDT)
Received: from aojha-pc.mtl.sfl (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 4295E3D80350;
	Tue,  1 Sep 2026 21:07:01 -0400 (EDT)
From: Abhishek Ojha <Abhishek.ojha@savoirfairelinux.com>
To: Mark@mail.savoirfairelinux.com, Brown@mail.savoirfairelinux.com,
	broonie@kernel.org
Cc: Liam@mail.savoirfairelinux.com,
	Girdwood@mail.savoirfairelinux.com, lgirdwood@gmail.com,
	Tim@mail.savoirfairelinux.com, Harvey@mail.savoirfairelinux.com,
	tharvey@gateworks.com, linux-kernel@vger.kernel.org,
	Abhishek Ojha <Abhishek.ojha@savoirfairelinux.com>
Subject: [PATCH] regulator: ltc3676: don't read the write-only HRST and CLIRQ registers
Date: Tue,  1 Sep 2026 21:07:01 -0400
Message-ID: <20260902010701.3360310-1-Abhishek.ojha@savoirfairelinux.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

HRST (0x1e) and CLIRQ (0x1f) are write-only command strobes. Writing HRST
triggers a hard reset of the chip and writing CLIRQ clears the interrupt;
reading them returns nothing useful, and the read itself fires the comman=
d.

The result is that a plain register dump resets the board:

  cat /sys/kernel/debug/regmap/2-003c/registers

walks every readable register, hits HRST, and the board reboots.

Split the callback back in two so HRST and CLIRQ stay writable but are no
longer readable. The readable range is left unchanged
(LTC3676_BUCK1 ... LTC3676_IRQSTAT).

Fixes: 37b918a034fe ("regulator: Add LTC3676 support")
Cc: stable@vger.kernel.org
Signed-off-by: Abhishek Ojha <Abhishek.ojha@savoirfairelinux.com>
---
 drivers/regulator/ltc3676.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/ltc3676.c b/drivers/regulator/ltc3676.c
index 307c6f7a155d..d67cee4e0be0 100644
--- a/drivers/regulator/ltc3676.c
+++ b/drivers/regulator/ltc3676.c
@@ -232,7 +232,7 @@ static const struct regulator_desc ltc3676_regulators=
[LTC3676_NUM_REGULATORS] =3D
 	LTC3676_FIXED_REG(LDO4, ldo4, LDOB, 2),
 };
=20
-static bool ltc3676_readable_writeable_reg(struct device *dev, unsigned =
int reg)
+static bool ltc3676_writeable_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
 	case LTC3676_BUCK1 ... LTC3676_IRQSTAT:
@@ -243,6 +243,15 @@ static bool ltc3676_readable_writeable_reg(struct de=
vice *dev, unsigned int reg)
 	return false;
 }
=20
+static bool ltc3676_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case LTC3676_BUCK1 ... LTC3676_IRQSTAT:
+		return true;
+	}
+	return false;
+}
+
 static bool ltc3676_volatile_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -255,8 +264,8 @@ static bool ltc3676_volatile_reg(struct device *dev, =
unsigned int reg)
 static const struct regmap_config ltc3676_regmap_config =3D {
 	.reg_bits =3D 8,
 	.val_bits =3D 8,
-	.writeable_reg =3D ltc3676_readable_writeable_reg,
-	.readable_reg =3D ltc3676_readable_writeable_reg,
+	.writeable_reg =3D ltc3676_writeable_reg,
+	.readable_reg =3D ltc3676_readable_reg,
 	.volatile_reg =3D ltc3676_volatile_reg,
 	.max_register =3D LTC3676_CLIRQ,
 	.use_single_read =3D true,
--=20
2.43.0

