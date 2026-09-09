Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1AC5867E1
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986293; cv=none; b=DdrjBKyVS+U3LHeTW4WDiK4cEQty2JK2+OL8eb++pm1EhIDu9KWZV+QGMXl4aOGJ5y2QyE6WVl+slsctXdO+veaYyAJTar1sOtCzUY6gEjd5sCzW3dPKmOGNiKCHYIj1BI2xIboIxqd5NzEj1TRJTvulIliBY/yp3Tt3KJbaHtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986293; c=relaxed/simple;
	bh=TU9tS4wITpHYBcAVM8/pudHRv+AetuJo3E3c70HNOzI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jz04GrGFu7n9BKJ3I43Sjo/Wd/06vTaVXoRQsL/wqbPj5bbOSvplTMQ7k8zSm54PkZZLa9uevavgvcM73GBTGslDAULxL3rgMLZvC4mYc411tcRDY9mKHeWG+obVdyto3HObUL+4ueN2vi+pdqg0eGBp6zOUts0Ki89IvpN9x4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Ew1g0X5+; arc=none smtp.client-ip=109.224.244.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Ew1g0X5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788986275; x=1789245475;
	bh=TU9tS4wITpHYBcAVM8/pudHRv+AetuJo3E3c70HNOzI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Ew1g0X5+o+F+N08SELWATyiIARiszM8zgi5CNgF6khecqOiNpVsmeGbW6LqB56igz
	 bQwAvHbnP5ZaJSTYkKZebEuUlUZY+RemNPqBBmK7cMe6E6F2GkegeXv5N4Kk7WYMSb
	 3JKZEy76QiJxUx/5ZZhxQuvpuSi/az5WKN+moIXHx4Ljn2GfIwVklNXNbVNqwVv33b
	 KPxLOomrjqfsGUAfc6WU/kUKKlXSmudnAwtYkmJnhNYkGhwO/UVcl/tIsE4nN6sRD9
	 vIF7X/Uv85lT8xXPtCTlfd6T5NHujALoioHb+sgjGXFVIkLhV7DNYomD95wSWO7p4H
	 bo4ocnzTlldVw==
Date: Wed, 09 Sep 2026 20:37:49 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] media: ipu-bridge: Add Sony IMX681
Message-ID: <20260909203717.90605-4-lsa.uz@pm.me>
In-Reply-To: <20260909203717.90605-1-lsa.uz@pm.me>
References: <20260909203717.90605-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: dbe18e390f058b7322a395242d278e71e738bf16
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Microsoft Surface Pro 11 for Business (Intel Lunar Lake, IPU7) carries
a Sony IMX681 as its user-facing sensor, enumerated as ACPI device
SONY0681. Add it so ipu_bridge_connect_sensors() builds its half of the
graph; without the entry the sensor is never connected, whatever driver is
present.

One link frequency, 969.6 MHz, on two CSI-2 lanes.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel=
/ipu-bridge.c
index 7e65491fa..68c2eb326 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -97,6 +97,8 @@ static const struct ipu_sensor_config ipu_supported_senso=
rs[] =3D {
 =09IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 =09/* Omnivision OV8856 */
 =09IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
+=09/* Sony IMX681 */
+=09IPU_SENSOR_CONFIG("SONY0681", 1, 969600000),
 =09/* Sony IMX471 */
 =09IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
 =09/* Sony IMX471 (found on Lenovo X1 Carbon G14) */
--=20
2.53.0


