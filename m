Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF9850AC34;
	Thu, 17 Sep 2026 14:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656360; cv=none; b=lWZs/q5IqYlQYTkqIOeNPBDYnHQ4iWtZgqCbqBKuG9YkOgtn/mJUrYg70fXwPCn8qoKx09/CwOCt3dqpkPG/SZnaRBS0SojhDZK9JaNGGJf9kik8z9qkY/ynGR1wYoQ1FqXhOiNI0gtaeyFGWl2qDP1ZUnabfXXAbM71LovrU+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656360; c=relaxed/simple;
	bh=daVQI+qTWasJ8ocgi404tC3nyAFZlDzW2llpatpllHI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DkHJhCU6b3Zih9FtYuSeQo9AvfqnbOPe5k43ZZ62kxJqFCETfkoMtiPMTBsd1bRMZjI+7Tg7z4w3nMq3dN5j4jSGtcy2doOi83/L25ienItRJZEp1g0WrGd7PHSns5g+LPgR43RilYci8uapgtXb2VorUPtkRLu6wNDVYBYMVbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=C3K5D0t9; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="C3K5D0t9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789656341; x=1789915541;
	bh=jOBlXbqAr/UdxcO0mpeCEJrFIaWa0zp4c5j63AaUT+o=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=C3K5D0t9Jpvax0r8up6/8XAqscyLOlbWY7E0YTDRRtL/2iEuFDRKkNhkFvyuBQEba
	 0j4ncTzhw3qtWFTVRZ4wT+My1c3PZT6TG22+Ir4AA03QPX4dqQA4k7b8VCbFhzhpq8
	 ce2110Jak4Lg/DRx4Edm/AB9tWKBz/ITM23vidcz9ySWxU4SO4BTlmJrtpzv/E5QqB
	 rqTD4IGzJZoPnFWvYCIbGY9dUwDsujLeOMHl1N7TeEZhUtTQPV+rp4X7zlbrN65zOQ
	 2t3/WF2T2gXHhtqMQ3l3BkMmybKngmhdLWanCB1IBcAeTJwqY9iXpCenIBEPJNLjZg
	 ZCVVytmrj5L8w==
Date: Thu, 17 Sep 2026 14:45:35 +0000
To: linux-media@vger.kernel.org
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: ipu-bridge: Add upside-down quirk for Surface Pro 11
Message-ID: <20260917144527.24804-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 84976921d744c9300155ae0c92d6e26f49bb34ac
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Microsoft Surface Pro for Business 11th Edition with Intel mounts
its OV13858 rear sensor rotated 180 degrees, but reports a rotation of
0 in its SSDB and has no matching _PLD, so without a DMI quirk the
image is presented upside down.

Add a DMI quirk entry for this model so that a rotation of 180 degrees
is reported for its OVTID858 sensor.

Tested on the affected machine: camera_sensor_rotation reads 180 and
libcamera reports Rotation =3D 180. Confirmed independently on a second
machine of the same model, where GNOME Snapshot and Firefox present
the image the right way up once the quirk is applied; qcam, which
talks to libcamera directly, does not.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>
---
Changes in v2:
 - shortened the commit message, per Sakari's review of v1
 - moved the entry into vendor order, before the Samsung entries
 - added German Pablo Lindo's Tested-by

v1: https://lore.kernel.org/linux-media/20260913153526.80287-1-lsa.uz@pm.me=
/

The quirk only has an effect once OVTID858 is a recognised sensor, which
  https://lore.kernel.org/linux-media/20260913142034.5632-1-lsa.uz@pm.me/
adds; this patch applies to media/next independently of it.

 drivers/media/pci/intel/ipu-bridge.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel=
/ipu-bridge.c
index 952868ad8..0e4bb9d73 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -210,6 +210,14 @@ static const struct dmi_system_id upside_down_sensor_d=
mi_ids[] =3D {
 =09=09},
 =09=09.driver_data =3D "SONY471A",
 =09},
+=09{
+=09=09.matches =3D {
+=09=09=09DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+=09=09=09DMI_EXACT_MATCH(DMI_PRODUCT_NAME,
+=09=09=09=09=09"Surface Pro for Business 11th Edition with Intel"),
+=09=09},
+=09=09.driver_data =3D "OVTID858",
+=09},
 =09{
 =09=09/* Samsung Galaxy Book5 Pro 360 */
 =09=09.matches =3D {
--=20
2.54.0 (Apple Git-157)


