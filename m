Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DC344C659;
	Fri,  2 Oct 2026 08:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929592; cv=none; b=WmyRAma29D1DhUVOgcBG4t56rthb35/yxHq9qBttpmmNVtoEyN0acdkdfuVcfRrzHGeDrQ8UrnRBINrUOMTTkmzJ0MumevCh7OGeyxARWHgriIi+aOx9TKWtvO5Jxucx6ujLHHP3V8GXR6AVecY8Cco7A2vl80eaSfU16Qw07go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929592; c=relaxed/simple;
	bh=GPt5QiWyQfcd9gTLrHwGhz/yTpEBfeywxwurUGfQhq4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AFR29w0Km5Uqfc1yGso4P/WWIvvqzxGyHS+sAXW1kWMWqWj3rkljMMlSzJmBy0epEbuHubeqt3mHQACvIGCnij76PfZalxEzW/7QN9ZfJYmfArtTlAi4eaaIpfHoecaihmsyCFeuR6Bm5iLDOToHUBaZWxdJGb7am8ihoccF/gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=bay31VPy; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="bay31VPy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790929573; x=1791188773;
	bh=GPt5QiWyQfcd9gTLrHwGhz/yTpEBfeywxwurUGfQhq4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bay31VPy/n5ewCm3P9fg94l+RSgBizOEvN+pEuD5KVrfT/iBE8tlP2PgZEBsaY/4z
	 TDOLw7Wsp6xO423XcS6WXW2a9Xe6fFB1w2hSxjrSbukBZlNZzqSzdIHveD/PzvNyWH
	 KHSHvoC1QyheL6rQtaOaoMV0lf086C8/TKOB02BusTO4mjoKvWtcmYn6t9XQeLfgc8
	 T21YJ5gc2zHuOrWN4H+8AeW51j+h5Xuuq7aXgsWqiWhIW0onWOJwVbzPAUE3wbaLA8
	 bJZzBjy6s38hYgv2E6uT/0U1ihFoaJepGNG0WqUUgYADz00yNaHtXYuc6sAUlePZoa
	 eVxAhCkGYn+hw==
Date: Fri, 02 Oct 2026 08:26:08 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, sashiko-bot@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/3] media: ipu-bridge: Add Sony IMX681
Message-ID: <20261002082537.74084-4-lsa.uz@pm.me>
In-Reply-To: <20261002082537.74084-1-lsa.uz@pm.me>
References: <20261002082537.74084-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 25bc23d44ae156c9fb1933c5ed8db98bb0646499
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

Assisted-by: Claude:claude-opus-5-5
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


