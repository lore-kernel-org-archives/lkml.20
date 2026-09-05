Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F9A36A36C
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 13:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788615683; cv=none; b=YDkaHnFYXaYW1ftjPkBwUbhA+sjerYxTGERGlGVpj45BQKde2bAl2A9jsRLRIZSWEjK7MsGtb3a5XPnFjoOOTimBKPN3FulNSC+mTarePPAv65cMB0//LWeoUTYObaAe4VffQ0FvAuuHVqmtENfb5/IlU3ONBUjH5pdxrgVxbmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788615683; c=relaxed/simple;
	bh=D+yih9vLuUcIdBEoAKFCK9erjoUJS5S9ZmpeB1vBSIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uGeRF/pnO74p6nmiRAw11iuuoFWF2ilteznOMhGLBKC9z1Wp7c+G+6a2vHr1DJ4/P5nrEtRZ6+ZIMAOuZKsOM/AmSXPmqXhmUo2syHkYF5iuDabFl/dzKHWDbQw0L9oFjPhoXiOqd8gXtKvSqf0U8jk10rj1UjgHdNsOtv+4DK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IfFZoqlB; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IfFZoqlB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=3A
	Bn9x+GRJCZGQVM/vtpHJYjaY9XQ+3Oq3XRKqm9WIg=; b=IfFZoqlBXupQvJZ6DA
	/N98ZSezJuMDLkeKWWHdKUzQzYzDI2m1RQm5AFkiJw6ou51lCuY5dSqbE+Zxh+yy
	q8xgJOKFCq4/JulWcM0LAZTlonPlqvK0YWHFPhnO5Kgq3GvcgSK/2nFwf9WivTbc
	fSgs0qko08zVSNIOoqhnY5mZI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDX5tDlG5xqsxhkAw--.24726S2;
	Sat, 05 Sep 2026 21:40:54 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: Lee Jones <lee@kernel.org>
Cc: "hpp.iscas" <hppiscas@163.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aaron Kling <webgeek1234@gmail.com>
Subject: [PATCH] mfd: max77620: publish I2C and OF module aliases
Date: Sat,  5 Sep 2026 21:40:51 +0800
Message-ID: <20260905134051.66545-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:_____wDX5tDlG5xqsxhkAw--.24726S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw1fuFW5CFy8Jw4DAF4fZrb_yoW8Wr18pa
	y5trWYv3yxWF4a9FW7Wa18ZFn8Gws5KrWUtryUWw1IqFsxAFy7XF40gF1Ykr15XFyfJr13
	XrWUt3s8Cay0q37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UrDGOUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxgbBimqcG+YndQAA3S

MFD_MAX77620 became tristate without publishing any module alias for the=0D
I2C driver. Device Tree I2C clients emit OF modaliases, while legacy=0D
board-info clients use the existing I2C IDs, so both supported=0D
enumeration paths need module metadata.=0D
=0D
Publish the I2C table and add an OF table for the three documented=0D
compatibles. Keep i2c_client_get_device_id() as the source of chip data=0D
and leave MFD child registration unchanged.=0D
=0D
Fixes: 0d084ee9ba87 ("mfd: max77620: Allow building as a module")=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 drivers/mfd/max77620.c | 10 ++++++++++=0D
 1 file changed, 10 insertions(+)=0D
=0D
diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c=0D
index c4f89a9..6a624e6 100644=0D
--- a/drivers/mfd/max77620.c=0D
+++ b/drivers/mfd/max77620.c=0D
@@ -699,6 +699,15 @@ static const struct i2c_device_id max77620_id[] =3D {=
=0D
 	{"max77663", MAX77663},=0D
 	{},=0D
 };=0D
+MODULE_DEVICE_TABLE(i2c, max77620_id);=0D
+=0D
+static const struct of_device_id max77620_of_match[] =3D {=0D
+	{ .compatible =3D "maxim,max77620" },=0D
+	{ .compatible =3D "maxim,max20024" },=0D
+	{ .compatible =3D "maxim,max77663" },=0D
+	{ }=0D
+};=0D
+MODULE_DEVICE_TABLE(of, max77620_of_match);=0D
 =0D
 static DEFINE_SIMPLE_DEV_PM_OPS(max77620_pm_ops,=0D
 				max77620_i2c_suspend, max77620_i2c_resume);=0D
@@ -706,6 +715,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(max77620_pm_ops,=0D
 static struct i2c_driver max77620_driver =3D {=0D
 	.driver =3D {=0D
 		.name =3D "max77620",=0D
+		.of_match_table =3D max77620_of_match,=0D
 		.pm =3D pm_sleep_ptr(&max77620_pm_ops),=0D
 	},=0D
 	.probe =3D max77620_probe,=0D

