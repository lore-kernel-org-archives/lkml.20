Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E501390C9A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789309257; cv=none; b=Hjen0Z5OqfFw085LxDoAeyVRsNLtW6VJ554hpCRbdkfNLHNRCYBF8IPWTd6ld1DvHD/SW7hEI1WIcu6ygkA9jeiwXIJcWg+19HTU75LZC1uDvEVd60wVbIx3WrPnK+kGfvuR4TUW/AsVWxSOFOhQKdodoKLLnz4Vy221X97xsMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789309257; c=relaxed/simple;
	bh=YNjzl8n+PXt2mDKHZd5UmT/m2STCivhleGjjPRVWfgI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EmfgvTQLBaQH7sAgeEAQqRoJsI3mqJrGK7O1yegftoMAK48n0iq6Cxz3ALs96pQh1AlHqO8V7e37Td6lFfKOdAW6Cg6aINHu1MlUfzkuIhB2TKmD5HTwwvsft4JsMnVnwyHZ7Xy6llej9jrffwRRJvQtQsNS7bz9cPE0TeOcV/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=iDCY9bAr; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="iDCY9bAr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789309246; x=1789568446;
	bh=hxYQSvvbCFeQ7xu4WK5iaFxM0qwaTFDmTAidpAMVsKM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iDCY9bAr3G4hzEQtGvYnCx6Fyktetqi5FCuX5P9f6FZGvTjeQOLYZHcrx7FomkkCY
	 rOMxWG9MsGDR8SlqDxZ/RGH+4B4Tkn8abfCSB/EHJLaSFNwn8yGw/0IWugeIDF2tNz
	 7YMEppi8DGTyEI0SRZb7HA+4bE8J+9S4RuvrQa/u4EqHHFmxxMcRGyOn6p2cZg7tGD
	 jHlrXXIZwWmDxkJ8hC/WTdgzOnUDX0NwZJeYKfj6+wfwTUn9Ohn3slQx/2/yt86r1p
	 iYsd/jmFiRNdDFdrDjzrneyKNxCkklnWeRSMh/5FVexKDdpePLcJi5o5OrX6GKdejt
	 HIxt2EQ901yMQ==
Date: Sun, 13 Sep 2026 14:20:40 +0000
To: linux-media@vger.kernel.org
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: ipu-bridge: add the OV13858 rear sensor
Message-ID: <20260913142034.5632-1-lsa.uz@pm.me>
In-Reply-To: <20260913100932.92087-1-lsa.uz@pm.me>
References: <20260913100932.92087-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 3831d14dc5aee3952985ae51e7a8167c37fbe31f
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

  intel-ipu7: Found supported sensor OVTID858:00 (\_SB.PC00.I2C3.CAMR)
  intel_ipu7_isys: bind ov13858 1-0010 nlanes is 4 port is 0

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
v1: https://lore.kernel.org/linux-media/20260913100932.92087-1-lsa.uz@pm.me=
/

v2: no functional change. The Media CI robot flagged one over-75 line in th=
e
    commit message, and fixing only that moved the warning to the next quot=
ed
    log line, so both are shortened: the PCI address is dropped from the
    intel-ipu7 line and the full device path from the intel_ipu7_isys one.
    What the lines say is unchanged; only this machine's slot numbering is
    gone. checkpatch is now silent.

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


