Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1427339DBD3
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789294190; cv=none; b=KdVYA8PoqHj2GIBi7VtqYmraZpzT2H/JPk7igpFu/Lk102+9B6uJxwlsWXSHVQ91dCV0CUG7u5td2exiEQwR/67fLhpq38H4CWxBETP8KccktWJ+TMTrWBhN35ZgmRJ4p9bFsz2oPBoaNPI/fQbNFQ2g26BRJFnMtooUwlRrKxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789294190; c=relaxed/simple;
	bh=2o5A4iiS1lqxNbhElujqUzvNFnCq2CieecwNMtvfuss=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JnDbpFe6xOOkqS30bo8f+v4/8ygozX+9wo5gDxy2fn54fFU9K/Bjg/x+EEQyEfWTu2NZOkrHtw/tU4dU3ZcKJsD9ayBmWAvHYSiBwRBB6JV+KAmHrMb3sFQTRPRRvnIVIu84KNwUHZXb0aW27wqibdMf9Iyr4M0WxTxZSlHSE7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=PfWJrnx4; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="PfWJrnx4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789294185; x=1789553385;
	bh=dUm3bWj/s/e7eyre3P749gvl3TnSgWTHWCSKqq5OrOc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=PfWJrnx4y/6PQNvWDLBfX/E6E/549RwLf6CySjcUIA/nwo1fvcR+VHtJqPW0Npjno
	 zfvM7seQZhX8KM2j4cpZhBCSvtoyEIdst3RKHRjVV466382PNa5taHZd2mUSSvyPVm
	 6zmtXVjXVuO6bPNaMSEiEFC8hxROvHylGqHpREZjnmFpsmp1gc2FFdLnYG3p5Jxx99
	 HgMboN7qskd9zJN3lWBSvJ/Y/k+byTHaqUYnHj4cX9rgvaG8ZWUwwH02jL4Vgb8358
	 65hwFIh5CnZgG4xxIMIB6D/ZFyDdm/O9i2MQaq8W5AQrYyM1uqsFlXB0KaVoTq9At1
	 fTN20K23s4QAQ==
Date: Sun, 13 Sep 2026 10:09:40 +0000
To: linux-media@vger.kernel.org
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] media: ipu-bridge: add the OV13858 rear sensor
Message-ID: <20260913100932.92087-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 3d750d2134485efee9e1b70ba0754c9dc062bb20
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Microsoft Surface Pro 11 for Business (Intel Lunar Lake, IPU7) carries
an OV13858 as its rear sensor, enumerated as ACPI device OVTID858. That
HID is not in ipu_supported_sensors[], so ipu_bridge_connect_sensors()
passes over it and the IPU is left with an empty graph:

  intel-ipu7 0000:00:05.0: no subdev found in graph

Nothing is logged about the sensor having been passed over, which makes
the failure hard to attribute: the ACPI device is present and enabled and
the i2c client exists.

ov13858 declares two link frequencies, in this order:

  #define OV13858_NUM_OF_LINK_FREQS=092
  #define OV13858_LINK_FREQ_540MHZ=09540000000ULL
  #define OV13858_LINK_FREQ_270MHZ=09270000000ULL

With the entry added the bridge connects the sensor and the graph is
built:

  intel-ipu7 0000:00:05.0: Found supported sensor OVTID858:00 (\_SB.PC00.I2=
C3.CAMR)
  intel_ipu7_isys.isys intel_ipu7.isys.40: bind ov13858 1-0010 nlanes is 4 =
port is 0

  - entity 247: ov13858 1-0010 (1 pad, 1 link, 0 routes)
                device node name /dev/v4l-subdev5
    pad0: SOURCE
          [stream:0 fmt:SGRBG10_1X10/4224x3136 field:none]
          -> "Intel IPU7 CSI2 0":0 [ENABLED,IMMUTABLE]

and libcamera captures from it, 30 fps at its own choice of 4220x3136 out
of the sensor's 4224x3136.

The rear camera on this hardware was reported dead publicly by German
Pablo Lindo, who traced it to int3472 not recognising GPIO type 0x08:

  https://lore.kernel.org/linux-media/20260903081557.16603-1-germanpapulind=
ez@gmail.com/

That is a different cause of the same symptom, fixed separately by
"platform/x86: int3472: support the POWER1 GPIO type", which is in
linux-next and not yet in media/next. The missing bridge entry is the
next one along. The sensor also needs power sequencing the in-tree
ov13858 driver does not do on this platform; that is a separate patch
and not a prerequisite for this one to be correct.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel=
/ipu-bridge.c
index 7e65491..8a16c81 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -88,6 +88,8 @@ static const struct ipu_sensor_config ipu_supported_senso=
rs[] =3D {
 =09IPU_SENSOR_CONFIG("OVTI08A1", 1, 500000000),
 =09/* Omnivision OV08x40 */
 =09IPU_SENSOR_CONFIG("OVTI08F4", 3, 400000000, 749000000, 800000000),
+=09/* Omnivision OV13858 */
+=09IPU_SENSOR_CONFIG("OVTID858", 2, 540000000, 270000000),
 =09/* Omnivision OV13B10 */
 =09IPU_SENSOR_CONFIG("OVTI13B1", 1, 560000000),
 =09IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
--=20
2.50.1 (Apple Git-155)


