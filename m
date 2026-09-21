Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BCA38DC5D;
	Mon, 21 Sep 2026 19:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790018727; cv=none; b=XDkRUAAT2FLLXK89TeU4HJAJ7NQ3UiW2/+dsTnF+LAjj4e0/Uu5QsV3/EC3Q3nbUOfoVLwii46SYzbbow8cxneGCwGyINXJxLtYacFMQ3Rsa4twvKGgBZBUtxd6hXel6VHXt8EMpjJPefOWQG9aJMRtf/gzkIptfcEQ/lmJRnt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790018727; c=relaxed/simple;
	bh=h9Trgpq+IKaW7jFGrhNGqF9VOhmwiuANsQLufQFcwWA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X7beeUpQu8q2JpbgSrsjZw5LUOYD8BldJiep3lB9vaHlaY5FRTX0Q2Ht6rsPkSpREGBwKcgKeNIy95oxlQ3iq/cD6mP0ysWtEqULeuwkIGb0cCoyPmyjzp1M4wg7331gL7VBFOfD/qrqZP96z993h2Bc7w9SxGAZY+KYisfa3/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=qar9lRDP; arc=none smtp.client-ip=109.224.244.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="qar9lRDP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790018718; x=1790277918;
	bh=h9Trgpq+IKaW7jFGrhNGqF9VOhmwiuANsQLufQFcwWA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=qar9lRDPkIM0UkiJjfUgrGPCOg8yeVqhCgfKpqaBjP1RZGmz+OBVHhA3WuZgBUMym
	 tUjEPkvS91tJHlZ7SetAlTJUJbwAte6PcyxFlzBp3MaFx4z8F13J9vU4sTnMWvMF9u
	 14C6LyUQhN5pREgJVm1eskskUt/XTBLLVzZ3QfHc5rs5LAxf5yyPwX2PYq72yss/yW
	 o/C+6iK6QB912iDMt7EuBMMK8voVM2FlK7FSE6tFwCzeAgv64/7ee6SbiNDmX7HDIQ
	 t89DzDepuaDRnHkuwJOsanPNLZybwuo+THm94WigbKn1BeJN2sbnbtbxbA7Ir57jD2
	 0TtDdacNgsxPg==
Date: Mon, 21 Sep 2026 19:25:13 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] media: ipu-bridge: Add Sony IMX681
Message-ID: <20260921192450.21811-4-lsa.uz@pm.me>
In-Reply-To: <20260921192450.21811-1-lsa.uz@pm.me>
References: <20260921192450.21811-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: f8a8323559918e895ce9fbf9f3bb4b6d95af4214
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
index 77257311d1..a1a4023f81 100644
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


