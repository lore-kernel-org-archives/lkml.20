Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7993CC7DB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982837; cv=none; b=Gb3PEwjUOh2nFjdi20JqlJs43+yzq9U23w0jYH4bFHQjYeI1v9RMSLME/Wvr5w1uFvbPjVSVjDEab2aXgM3kNEz1OKkoY1hsQ4ApAlO01DFPVSR4s4l/RC4OvDytPaST9O8dnWPib+PcNuXRvJx1LvOzKwM4dp1bgzKJrbjAZNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982837; c=relaxed/simple;
	bh=TU9tS4wITpHYBcAVM8/pudHRv+AetuJo3E3c70HNOzI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YA9CPQofkqhx8EfB18gUBbsYlEbi4agGrCYrHHe+95A31Z0lliJdR/o4P+5MzSiOyVKZ/hALIGVGxaFU1Sg2sN+dcDgr7pI//bG29ezOWW2K30xL739FwTW2c4Zywn2TQUUK5UUSK+YjqWyCjTXKx6emSZ668h0UqtlSK7FKEPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=T1shfXax; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="T1shfXax"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788982832; x=1789242032;
	bh=TU9tS4wITpHYBcAVM8/pudHRv+AetuJo3E3c70HNOzI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=T1shfXaxZYHaMKF4BiWfgNYO03mY5sxmR29BByY/OBw5TiQkG66+IIUnlE1PYtYrV
	 Sxt4fDifpbhKF40J6ePTOd1EmWJ4QCohUN/Tra+PiYedK+ee09FrT0stxmTv16edGl
	 zWnNqv/jBJx9OlO5lgwixoc8C1URxvNiR3nNpFpGKLSBCG+syACyPeSV9z8U7Dd3qz
	 0SvvOq0LsDrvgNDyYrWmJhJAVya+DY+GHrgWex8Q6uYE0ASIVSEfumnfU/nTMvtBIi
	 5KVNTdiwNhrOfWb0Zf/K6h/x6Q9/ylf+W+JePxpBmqwyeMRxF6Q8Bj/UIB6dbauarm
	 pXGRQ6bWw5+Mg==
Date: Wed, 09 Sep 2026 19:40:29 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] media: ipu-bridge: Add Sony IMX681
Message-ID: <20260909193953.86192-4-lsa.uz@pm.me>
In-Reply-To: <20260909193953.86192-1-lsa.uz@pm.me>
References: <20260909193953.86192-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 950077151668ae279c0a15af86edd10aa4c419c7
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


