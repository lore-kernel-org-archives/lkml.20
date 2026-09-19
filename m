Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDB437EFE3
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789801740; cv=none; b=uuM7S6opSY0DyLh4cPkW3BX/7fY2lKCIBdPldkm2+3oYa7ZQ55sv02TPwhkPtyhh4kFtjJBZn/YYNj1o1s35Lw/fwOXLoSINJenI2s8ehZR4TjeOe0UIVi34/Hsr36ctAhGc6XV0fXE9l+aBOOuX5zpTZ4mGBouA8B+MgiDedZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789801740; c=relaxed/simple;
	bh=vwN6BG6lRlunveBc2QdFheFfI69WoVgjH+V04jr7+yU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AzBhheCSB8Fw/H88Moblz69zwUUY4yhBc1UUPA0JEa9cUQmruq/0+yk2Ug+YYuD+JxztXSGzn8HIos0yl1GZO0XbFjewRlk0+NUQncA7S+fDfy8kBoCyLkA4MwQj14gUm8u8zXDRgxUKHgRzqov4AWvT547+ZuO5FfwE70cdFyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=MmUbOqt2; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="MmUbOqt2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789801728; x=1790060928;
	bh=TQAsvmWL/GXjjYYZ0OeIATjGXy70BfH/u8AoyffHR6I=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=MmUbOqt2SLDd2RBacFflQafeVgTbF7hL9Pahz4cRD33LgJLletWCIro/m0U3R9+Kn
	 wsfMC9Huq/2iGQapNWrjYm1FoF2+OsTeCOaMAt8uIVCT02eTUVuH2hc08qRStlnJOH
	 LKNabjAXhRadzYYLUAVlc+UibYKJeIZo8mvNVKdJl3AeaXiYyJ7l4ZQQEVGJzCdKeD
	 m0SgqPkifY/nSxKpmbExxJ1/YD1YAFbuB9naKzCVmMRzOKRX4muElxn+Zoc/bJv8ik
	 XoOvybIIJQcFpNjOC6uv4abPUrGrJwa03in6YsIbgGiVDDp1lL+tMsRxu8p0Cx61r8
	 P0ZAZp/OMqVRg==
Date: Sat, 19 Sep 2026 07:08:42 +0000
To: linux-media@vger.kernel.org
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, German Pablo Lindo <germanpapulindez@gmail.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: ipu-bridge: Add OV13858 sensor config
Message-ID: <20260919070837.92720-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: cbfea0fc3050cc0ff7b65bc487e37baad52707fb
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Microsoft Surface Pro 11 for Business (Intel Lunar Lake, IPU7) carries
an OV13858 as its rear sensor, enumerated as ACPI device OVTID858. That HID
is not in ipu_supported_sensors[], so ipu_bridge_connect_sensors() passes
over it without logging anything and the IPU is left with an empty graph:

  intel-ipu7 0000:00:05.0: no subdev found in graph

Add the entry, with the two link frequencies ov13858 declares. The bridge
then connects the sensor:

  intel-ipu7 0000:00:05.0: Found supported sensor OVTID858:00
  intel_ipu7_isys: bind ov13858 1-0010 nlanes is 4 port is 0

This machine needs two further fixes before the sensor streams, neither of
them a prerequisite for this entry to be correct: "platform/x86: int3472:
support the POWER1 GPIO type" from Jakob Berg Jespersen, and power
sequencing the in-tree ov13858 driver does not do on this platform. With
all three, libcamera streams SGRBG10 at 4224x3136, 29.95 fps.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
Tested-by: Fernando Rimoli <fernandorimoli11@gmail.com> # Surface Pro 9, IP=
U6 Alder Lake-P (8086:465d)
Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>
---
Changes in v3:
 - rebased on media/next; v2 applied only with an offset since
   "media: ipu-bridge: Match sensor configs per IPU and add config flags"
   landed and moved the table
 - commit message cut to the length of the neighbouring entries, and three
   things in it corrected against the machine: a quoted log line carried a
   parenthesised fwnode the kernel it came from does not print, the capture
   figures were stale, and only one of the two other fixes this machine
   needs was named
 - subject follows the convention of those entries
   ("media: ipu-bridge: Add OV01A1B sensor config"); the diff is unchanged
 - carried Tested-by from Fernando Rimoli and German Pablo Lindo

The entry sits between OV08x40 and OV13B10, where the table's existing
grouping by part name puts OV13858.

v1: https://lore.kernel.org/linux-media/20260913100932.92087-1-lsa.uz@pm.me=
/
v2: https://lore.kernel.org/linux-media/20260913142034.5632-1-lsa.uz@pm.me/

 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel=
/ipu-bridge.c
index 952868ad8d5..532a0bfbbbc 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -102,6 +102,8 @@ static const struct ipu_sensor_config ipu_supported_sen=
sors[] =3D {
 =09IPU_SENSOR_CONFIG("OVTI08A1", 1, 500000000),
 =09/* Omnivision OV08x40 */
 =09IPU_SENSOR_CONFIG("OVTI08F4", 3, 400000000, 749000000, 800000000),
+=09/* Omnivision OV13858 */
+=09IPU_SENSOR_CONFIG("OVTID858", 2, 540000000, 270000000),
 =09/* Omnivision OV13B10 */
 =09IPU_SENSOR_CONFIG("OVTI13B1", 1, 560000000),
 =09IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
--=20
2.54.0 (Apple Git-157)


