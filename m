Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969151;
	b=4oo5f+Ha53RhueNwb71El+zhG7Qg/eg5QSIO8v+rOQEwCq5K96VuZRWBKf5/0fuoXfK8
	 Eo4+U4NH1VqW1XE8q2ExoRgpxuVkP+XOvPhO9jSCIN1Feg6GIE8gI1fPkv9smAT2T0yOt
	 z9cz0OFnSj4thYBV3pKHaZUsfFa59Iuj+GVT7EEoDKx+OIDCCRlFRxLNdHmppqHxCgqY9
	 a9eukNgut+vT7LeNjon9OjZ7Z8nUoIX6T2gWEdfIFPWjU6oFGwGpVaWG7CHAC/b1cgTzA
	 GSGZ96Hhbi5Mf0uRuLHsFUJDImz/QOs3MVLb6zs/lGt/O97f+P5K/18XrnnZdZga1eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969151;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=SvCOCf3YteA9iimmP/e0lnCKLJTugesY45Fw5285iVw=;
	b=blhNbJF1EfMe2jBWQqiW2H3io2RI0TnLd9Ice5XeBObFIReGlAR+n2nt9QalHWuAIN0B
	 RUC9vJXFTtltXm/+9lH0vUtb/DuOQ1T2r0HKso5Opd6S24ljWBfYiZ+Tju8VA/eAxGO6O
	 KF0eUdDG/QU9c6jn25x00OIoAye3Wvb/e0ZvLosNnNBw4suvxHC4DWFLFigUbRXmMAx+P
	 +/g0tsT525L8+v3GMwdxe5xXUEDqicN6V78uLnEXnKvEGF1gJaF6PduBAB6gYhuwjx2YA
	 TT4gXE8wQZgHfcEuk0PAZjnDiyZrjGb7IIZcGmC/vHj7b/9GBVC9yAFwuFHBs+XCt6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=QSZCZtXd;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF947606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF947606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=QSZCZtXd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793969149; x=1794228349;
	bh=SvCOCf3YteA9iimmP/e0lnCKLJTugesY45Fw5285iVw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QSZCZtXdqU+7S8oGK81m5dtWVyyK2pLUfp8XDB2j7lZTm7xXDVZDDRdB+JSUCJHHw
	 RfuauBmStZCLCwBZXsu1md1ZMO73h0xEipezjF60ti5kmGV+67RhZlp29tWcMN8I4o
	 xO351TK50c+kADkedAxJEUqu+N5oz86eOaTfbXw2ZtNzKzYG9JRo7kKdb+9u7WheIv
	 iLxa39b/4C9OkB0AU21smxHGblE65tk6Cpvql1iqI4/WF6O9EohX/CfMPJrUDaI8gA
	 3FLEVwB7tMq/ylovZUl2VXqjTEfZCTGJ6HviX9b+uxvXQQbasqGsRTLipbhuI9gDir
	 9NuPKuULVnuQw==
Date: Fri, 06 Nov 2026 12:45:44 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, George Neacsu <geocausa@gmail.com>, sashiko-bot@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 3/3] media: ipu-bridge: Add Sony IMX681
Message-ID: <20261106124505.71429-4-lsa.uz@pm.me>
In-Reply-To: <20261106124505.71429-1-lsa.uz@pm.me>
References: <20261106124505.71429-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 83f751e65593d37a7ae0d24e615f62f4cf494344
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
index 3739c4a2a8c..2759c776cfc 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -124,6 +124,8 @@ static const struct ipu_sensor_config ipu_supported_sen=
sors[] =3D {
 =09IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
 =09/* Sony IMX471 (found on Lenovo X1 Carbon G14) */
 =09IPU_SENSOR_CONFIG("TBE20A0", 1, 200000000),
+=09/* Sony IMX681 */
+=09IPU_SENSOR_CONFIG("SONY0681", 1, 969600000),
 =09/* STMicroelectronics VD55G1 (found on Lenovo X1 Carbon G14) */
 =09IPU_SENSOR_CONFIG("TBE20A1", 1, 402000000),
 =09/* Toshiba T4KA3 */
--=20
2.54.0


