Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427290;
	b=H0K2hbK2OE8HJsoDUyFuOY0my1z+zj45KK8+pMgxf7TCTrsMwXN3tW/m7+G4hUfhLFmj
	 HAgW0r8afgzBnh8HVFMuwjCkE0CZVO7ZU2OeKcGdsLlL+LYQyF0LEKPooQpSrUGF48g1Q
	 V4CvQz0KAxGOxb/THwjZU0AQVOL6vhtfwySasj9lVhnwYlwGFC6NfDTVDORXJ+cTNNEMS
	 5J/IxdiNOZEZFgiJKRIZZUzO/Ksss1QIIszoBxJX6YKd5yAL/QpQpcsCGDUcpckamy7jt
	 R4eM76DhiOk9auk81Lo8ZR+jWHHMxEIzX8TCR+KpL/p9lGeupIfff/fcPbF774ebuEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427290;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=TEZtEk59ar5utkdkofEnlN7m91UDjSKwzqLEuSBAhEY=;
	b=l1D+0TCYd2CKnLUKzVfTQ+/i7FXDvaKQQyTC0lPRHgikQWnAciIS2HHAxzuUgDUDwpfI
	 Tpcx3OpqQiIGEr1ojVP5QWYmNvH5+qDZDonPGn95DUi8lB3RVicnrsNlOU0mnpRbmWhiV
	 qJdIebnXNboFvAO8IMTMPaBxjpfgTnoBqy1JylMonHrkpQWJ2d6Ya4MfKWtucYZXFm0Oe
	 w6rqeRGoaDfWoFLjKoafryMBPB6HEdoCaIe7suqcfIO3TCRrVmVc/YuYyOwli/PoQBGVY
	 Qs2jjQB+0q/jtm0MumQe7gUOR4KankTnABuxGrf59Vpux0Fo1gvZf8FGK19j3MIKVRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=FF2uy+gn;
	arc=none smtp.remote-ip=109.224.244.18
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2C5606A320;
	Mon, 19 Oct 2026 16:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A2C5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=FF2uy+gn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792427286; x=1792686486;
	bh=TEZtEk59ar5utkdkofEnlN7m91UDjSKwzqLEuSBAhEY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FF2uy+gnGYpqYl72bppS2dTU1h9vJxL/vEWW4cEY/3JMKaVcl1NMavFbTYJ1vf+p/
	 VqurxJJfrJe0iSmbRDD9M8l37rX5GEDronl/ZXL3/FXh2kZbmqkZzONirYlRU99WYE
	 8dgVdB368YObGCWigsR4B0NwnT/FwmIjogRrR7TxeyQT1bLGwWiU63PZtNjAdxeBZt
	 lT3RGL74SM78Y2oGhU6txHCij6PQ6/MQXgeiRE91x8sKbF//hoPa8iZDXgVU2/qLTi
	 yq3lLYFrcDCD2fmp6MlxXmt3LDdPwI7grGw6enZMwtT2V3iWxAx9M2YmYRRuLwUiP8
	 dDSxyA6Vv0lxw==
Date: Mon, 19 Oct 2026 16:28:00 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] media: ipu-bridge: Add ST VD55G0
Message-ID: <20261019162722.25587-4-lsa.uz@pm.me>
In-Reply-To: <20261019162722.25587-1-lsa.uz@pm.me>
References: <20261019162722.25587-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 33466a21e4a3f7beed11519693c373e9c7b43bd9
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The infrared camera of the Surface Pro 11 with Intel is an ST VD55G0,
enumerated by ACPI as SMO55F0 and wired to the IPU7 over one CSI-2 data
lane.

The vd55g0 driver takes only a link frequency whose MIPI rate, twice it,
is an integer multiple of the input clock. 396 MHz gives 792 Mbps, 33
times the 24 MHz the sensor's SSDB lists on the Surface Pro 8, 9, 10 and
11, and within the sensor's 750 to 1200 Mbps. Peter Marshall's earlier
patch for the Surface Pro 9 used 380 MHz, 760 Mbps, which is not a
multiple of 24 MHz, so the driver would refuse it:
https://lore.kernel.org/all/20260918221705.323510-4-pm@petermarshall.ca/

Assisted-by: Claude:claude-opus-5-5 sparse
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel=
/ipu-bridge.c
index 3739c4a2a8c..cb1d1582fa1 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -120,6 +120,8 @@ static const struct ipu_sensor_config ipu_supported_sen=
sors[] =3D {
 =09IPU_SENSOR_CONFIG("OVTI5693", 1, 419200000),
 =09/* Omnivision OV8856 */
 =09IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
+=09/* STMicroelectronics VD55G0 */
+=09IPU_SENSOR_CONFIG("SMO55F0", 1, 396000000),
 =09/* Sony IMX471 */
 =09IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
 =09/* Sony IMX471 (found on Lenovo X1 Carbon G14) */
--=20
2.54.0


