Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9535111AF;
	Wed, 23 Sep 2026 19:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790192340; cv=none; b=YiabtxtNP/O6aK9tl0iyWRla2rOtAntRdO6A/bhJ1b9FEAt5cVskbGiJ5Pwmkj7ZXWDhWAtjv4MVAYbqdqsqQ1Yj7BySqwNsD7FDDU8yirG71xE3Sd1tAeJAma29p1WkGMOMjAaaB778F/BeOz0ew1SZxS1Y32qYfF3Cc/MVrOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790192340; c=relaxed/simple;
	bh=/c4aAsyg4wk9o6KE/BZZp42wDVt5nAVLd6jz/4l5Tc4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GFYg55/H88e0ZhreaR/3zBGH/dlYSXKz52vumz+3Ew/9kteGwJko+DUJ8qCOlLXRPHnmXpwWPW3OxOk54p/SyAoySi8U74WN7AWr8ZlzquJnIZSMtppzxc70ol4tQ7InqQTd0nnHVtQ95y2DijM+mqlA20q4z6sjg5zbosQwXng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=BevtsdKY; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="BevtsdKY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790192328; x=1790451528;
	bh=/c4aAsyg4wk9o6KE/BZZp42wDVt5nAVLd6jz/4l5Tc4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=BevtsdKYhtKRRyzozhonSgBowArTWrp5FHvAD9A5JJAj9mrdlJFR4CsejRO+6p9VZ
	 31BGEQtIczPlgrGw2NtUWZPC1sC7zcSjvR59QG8ZKLXWm25nkqkOkc8QGNP85xMEh8
	 jQrkfCoLKcga1vB0G+xEuBdVsTXXeRfldIzQNC3F/GG1ijktsE60CXY6ytI6JQ6hla
	 VyE2NRlB8hhrlDF4W5f3cEDEIsJ/FK5gLHOINLRU6uYF1+SLAqs+buZB3q76eOARAX
	 +bybMsss4JD1yZsHPPa+LDUawoMXruKiyKyZtA4jU1S1W7QCb5XL/q2xqjCqJgdcOg
	 iG4Oi7GJF++NA==
Date: Wed, 23 Sep 2026 19:38:43 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/3] media: ipu-bridge: Add Sony IMX681
Message-ID: <20260923193805.83998-4-lsa.uz@pm.me>
In-Reply-To: <20260923193805.83998-1-lsa.uz@pm.me>
References: <20260923193805.83998-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: a7db8f2a6c398cdd7262f06584a9c1c2a95c95a2
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


