Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E27414429
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790198339; cv=none; b=DIWFYwQ08uPddIJuhhBH7PnO1Y/MCyMa+fkt6oZc0LygGh4+llpIQCrti5TISa7aV0+hZuch87mRNrV4bpycWrDHkJpVSwIshhXVJjMKJhHQL6Vlp2qBFsfGf3qGFtmCayhtRjnpq2gYfX4Z+WLNZ71kAjiIRFpcqat/X5cJ5mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790198339; c=relaxed/simple;
	bh=/c4aAsyg4wk9o6KE/BZZp42wDVt5nAVLd6jz/4l5Tc4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NTqibI7EIx75y2Kmr56zCdPWMlCUHcH1X42t4TgghcZ4rX1KNKk6dq46T8XcJOwIfJ2jQ+ebyFlm1noF6KD0AeVyiHJEXpRbe2I1NGBdS6OdkI0Xj9NH+hn3qgK33GAgbzOWc5AbvvAhZ76/2zHl+mCyR5CgXF0wPFMLea+MvcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=CZ4qEioO; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="CZ4qEioO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790198327; x=1790457527;
	bh=/c4aAsyg4wk9o6KE/BZZp42wDVt5nAVLd6jz/4l5Tc4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=CZ4qEioOK3qJwt6N+okpS+DIwZddjjXEYYZ0XN9DUfC9X6X6KBHZF51IOlSHqyyxs
	 PmmYQkrq0K2rGKI5ltogNl/C9FDkHqn/C6OHpBzi8zkwLbSKoOkI1IpEtdoEcGR5lb
	 e6SLBong9eemrUupANHxQiPI6qkm82Ia5qeEapNGQMI8PQNiD0XjQYnTGrxH48vScE
	 B3AJVJQ1CN5SgGytXvUncEwFQDPXgRqbg43OcAaryWft/N/jefSz8MhdErhl6QCZyl
	 ukUkzlmKjB2hxfV5mdMhpUAt3t672jy/tipTH9SEeJeq0gfPc701lV88O1CjsaME4h
	 i33E6EmgZ+1Jw==
Date: Wed, 23 Sep 2026 21:18:42 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, sashiko-bot@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/3] media: ipu-bridge: Add Sony IMX681
Message-ID: <20260923211816.89954-4-lsa.uz@pm.me>
In-Reply-To: <20260923211816.89954-1-lsa.uz@pm.me>
References: <20260923211816.89954-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: a55b593134d28a821f351b023e80d3e1aa2fec1e
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
index 77257311d1d..a1a4023f813 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -116,6 +116,8 @@ static const struct ipu_sensor_config ipu_supported_sen=
sors[] =3D {
 =09IPU_SENSOR_CONFIG("OVTI5693", 1, 419200000),
 =09/* Omnivision OV8856 */
 =09IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
+=09/* Sony IMX681 */
+=09IPU_SENSOR_CONFIG("SONY0681", 1, 969600000),
 =09/* Sony IMX471 */
 =09IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
 =09/* Sony IMX471 (found on Lenovo X1 Carbon G14) */
--=20
2.54.0 (Apple Git-157)


