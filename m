Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08A238DC75
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975797; cv=none; b=DD2eL8MoWdL+gSNbpSmGulfB0u6bX/I7RYUvcpm/ObaVidYqy9YkjDdq+gN/Ok3Juo4ua4O7oyWcTC5k+cU+2GgSJZsTJaPtd5HLtIwROCYhsjJgbT1VzZMpFOy3b9of2DZzma+3h9935HdKpoH+ZHNt6mFSK3VpcPYPgUnhJ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975797; c=relaxed/simple;
	bh=TU9tS4wITpHYBcAVM8/pudHRv+AetuJo3E3c70HNOzI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B9p5psJONQgWV/N9VnclOkM4oUFwNGwdQIEe0odkOjL1t0/z9pZjeXOWaRdjfmE1sjkMqHD26pfTPuSzUfWSW9AS0XktXz1YgWcumJ3Oh+ow7uMIzM0okkf8K8q+zvvKbvkc6n6M3UDOST0zAdqozHKDRyX8pOpyMs6XY1GgV5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=VAySXNbo; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="VAySXNbo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788975793; x=1789234993;
	bh=TU9tS4wITpHYBcAVM8/pudHRv+AetuJo3E3c70HNOzI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VAySXNbohPKn9odshLNOEj7EXBtljB+Xc8gItTEQdey3kfaww+Tjj+zrdUrwAV/9s
	 HJYf7RJ9lw9KZAqUGSMlQ2MDqNiMm+MYUjm/K3v5dZG2PbmaxZs5uCZ+8TY9GuTho6
	 6wE/fYRfMQDP7G6A3d0VK71D+hjbW8RgOqj4IgABIlOamSnGFXlignQps4xewwmjOX
	 ii7qplsb8dfZCQ1KNg5SutEhm5MeL1zTh/UihlucZgz23rhRbSaWhoubavcqnfAagq
	 lAnIJhrpBqMBfamOpnwkw0TowRfd0k8xZTr5GyuGLSgHvJsE1eFZF6aMrWSWQwbrXq
	 rRICffZicgu/g==
Date: Wed, 09 Sep 2026 17:43:09 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] media: ipu-bridge: Add Sony IMX681
Message-ID: <20260909174240.80023-4-lsa.uz@pm.me>
In-Reply-To: <20260909174240.80023-1-lsa.uz@pm.me>
References: <20260909174240.80023-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 4ed3d1adb5984c6e0c54595963826e6bab48123d
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


