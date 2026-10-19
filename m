Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427301;
	b=3J4OWG4xVTISm4cY+QSeJTSlEIUJfb+wrOLglsW4+smhnI4DjzJ2+F/1rnYP1ws3mu0a
	 kvsMG8mkfxL0+Uv5ryMFUH20wp/VTLbSRN4A4iR+22LGVJohD70Gj74WIncCnmiIdkiOB
	 d6b8XtJ8eaBptRfqIAUPEqQLwgsLO6yvCpwcyvFNNZ3ioIZrconfsCUNaSfABp12C7bV+
	 tsIMvAdxRfPsZ56povwHULweQyulDxQUkFKH3hgZVK216f6x1PpaUKVE9ihBPTEDR24z6
	 jxMwpU6bsYmvP/XxY4eImKkEknWBg0BZwqCfx2YimNI44Uqtwl1FCH4th8JaSYeWQoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427301;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=AUPj41ctOhJ+cZQoXn73t6Z/v6D9oxg5RLDX2zwJVW8=;
	b=mKwi7uaMdkxfAWYZlT7o+khDU17k+e4nQZf0ZrhPwXU8otccBXq3bUlCKDYCrX00fUrj
	 SBBMIngwvlY+sDcNtwZZuYax1q7yVBfZtx5jUb6fUkRQOuTHC78p8hyMl/QjA2+zW/7LE
	 IK5DgHp/2YPyzh5u+o+MJnCH3GOG6HnO3xdtBbLLyMYmHNdVRXdvMQTZCUmBmaAlC/wOs
	 sVUveZNwjENEWeWJNtrRma4Q1hvcaFAHcJyLpKNFovoq4nAtJHV6xOYTL+9uP7EO7Yo01
	 j2Ta5f9TW1xYv8rJFZYkswEen6fbdE2QAr9GLOydkzUexpANecCAy/2irNMq9UJky7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=KcLAl94c;
	arc=none smtp.remote-ip=109.224.244.123
Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9146560A2610;
	Mon, 19 Oct 2026 16:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9146560A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=KcLAl94c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792427298; x=1792686498;
	bh=AUPj41ctOhJ+cZQoXn73t6Z/v6D9oxg5RLDX2zwJVW8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KcLAl94cRsDTYQoCxS7MvJ7DzPoHXMGqTUQRdhP8PCnAipBJiIcRzUk0fwFT0Z972
	 gNBgBwe6eeVPECVdMlSaJ4X2WX0qer5nqk13QSi5FP07b3zXNs4Igegd18acaVZ80S
	 Kgg103gN6/1cQEo37eMprstfbCZ1KMQX2LNs1IWxvUrHU4xU03eoKh/KRATVf9gJth
	 LUJOj0A/KzIFn3KBMPZnjjdZOTgpE7QwazJP2oECTrdKweTETNz+tN5RVLzXWJCa1s
	 wpCTHTpJlkLtyDmQFmd/C93skYSoJbCmAy+tcCsKodVwHwwfMMhlskZAG3VIse9NXi
	 SnNV1l05/YiBA==
Date: Mon, 19 Oct 2026 16:28:11 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] media: ipu-bridge: Add the Surface Pro 11 infrared illuminator
Message-ID: <20261019162722.25587-5-lsa.uz@pm.me>
In-Reply-To: <20261019162722.25587-1-lsa.uz@pm.me>
References: <20261019162722.25587-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 48126862a596524f46a1020032fa9283563189d3
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

On the Surface Pro 11 with Intel the infrared illuminator is driven by the
VD55G0's GPIO 1, which strobes it during the exposure. The ACPI tables do
not describe it, so the sensor driver finds no st,leds and offers no
V4L2_CID_FLASH_LED_MODE.

Give the sensor's software node st,leds from a DMI match, as the
upside-down quirk gives a rotation. dev_properties gains an entry for it,
as a sensor can also have a lens-focus reference.

Assisted-by: Claude:claude-opus-5-5 sparse
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
 drivers/media/pci/intel/ipu-bridge.c | 60 +++++++++++++++++++++++++++-
 include/media/ipu-bridge.h           |  2 +-
 2 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel=
/ipu-bridge.c
index cb1d1582fa1..05aa6d92bbf 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -283,6 +283,39 @@ static const struct dmi_system_id upside_down_sensor_d=
mi_ids[] =3D {
 =09{} /* Terminating entry */
 };
=20
+/*
+ * Sensor GPIOs that drive an illuminator, for machines whose ACPI tables =
do
+ * not say which. They reach the sensor driver as its own leds property.
+ */
+struct ipu_sensor_leds {
+=09const char *hid;
+=09const char *property;
+=09const u32 *gpios;
+=09unsigned int nr_gpios;
+};
+
+/* The infrared illuminator, strobed by the VD55G0's GPIO 1 */
+static const u32 surface_pro_11_ir_gpios[] =3D { 1 };
+
+static const struct ipu_sensor_leds surface_pro_11_ir_leds =3D {
+=09.hid =3D "SMO55F0",
+=09.property =3D "st,leds",
+=09.gpios =3D surface_pro_11_ir_gpios,
+=09.nr_gpios =3D ARRAY_SIZE(surface_pro_11_ir_gpios),
+};
+
+static const struct dmi_system_id sensor_leds_dmi_ids[] =3D {
+=09{
+=09=09.matches =3D {
+=09=09=09DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+=09=09=09DMI_EXACT_MATCH(DMI_PRODUCT_NAME,
+=09=09=09=09=09"Surface Pro for Business 11th Edition with Intel"),
+=09=09},
+=09=09.driver_data =3D (void *)&surface_pro_11_ir_leds,
+=09},
+=09{} /* Terminating entry */
+};
+
 static const struct ipu_property_names prop_names =3D {
 =09.clock_frequency =3D "clock-frequency",
 =09.rotation =3D "rotation",
@@ -563,6 +596,22 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, st=
ruct ipu_sensor *sensor)
 }
 EXPORT_SYMBOL_NS_GPL(ipu_bridge_parse_ssdb, "INTEL_IPU_BRIDGE");
=20
+static const struct ipu_sensor_leds *
+ipu_bridge_get_leds(const struct ipu_sensor_config *cfg)
+{
+=09const struct dmi_system_id *dmi_id;
+=09const struct ipu_sensor_leds *leds;
+
+=09for (dmi_id =3D dmi_first_match(sensor_leds_dmi_ids); dmi_id;
+=09     dmi_id =3D dmi_first_match(dmi_id + 1)) {
+=09=09leds =3D dmi_id->driver_data;
+=09=09if (!strcmp(cfg->hid, leds->hid))
+=09=09=09return leds;
+=09}
+
+=09return NULL;
+}
+
 static void ipu_bridge_create_fwnode_properties(
 =09struct ipu_sensor *sensor,
 =09struct ipu_bridge *bridge,
@@ -570,7 +619,8 @@ static void ipu_bridge_create_fwnode_properties(
 {
 =09struct ipu_property_names *names =3D &sensor->prop_names;
 =09struct software_node *nodes =3D sensor->swnodes;
-=09unsigned int i =3D 0;
+=09const struct ipu_sensor_leds *leds;
+=09unsigned int i =3D 0, d =3D 3;
=20
 =09sensor->prop_names =3D prop_names;
=20
@@ -624,10 +674,16 @@ static void ipu_bridge_create_fwnode_properties(
 =09if (sensor->vcm_type) {
 =09=09sensor->vcm_ref[0] =3D
 =09=09=09SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_VCM]);
-=09=09sensor->dev_properties[3] =3D
+=09=09sensor->dev_properties[d++] =3D
 =09=09=09PROPERTY_ENTRY_REF_ARRAY("lens-focus", sensor->vcm_ref);
 =09}
=20
+=09leds =3D ipu_bridge_get_leds(cfg);
+=09if (leds)
+=09=09sensor->dev_properties[d++] =3D
+=09=09=09PROPERTY_ENTRY_U32_ARRAY_LEN(leds->property, leds->gpios,
+=09=09=09=09=09=09     leds->nr_gpios);
+
 =09sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_BUS_TYPE)] =3D
 =09=09PROPERTY_ENTRY_U32(names->bus_type,
 =09=09=09=09   V4L2_FWNODE_BUS_TYPE_CSI2_DPHY);
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 3ef94c2b767..f56ac1c4e96 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -179,7 +179,7 @@ struct ipu_sensor {
=20
 =09struct ipu_property_names prop_names;
 =09struct property_entry ep_properties[IPU_BRIDGE_EP_NUM_ENTRIES];
-=09struct property_entry dev_properties[5];
+=09struct property_entry dev_properties[6];
 =09struct property_entry ipu_properties[3];
 =09struct property_entry ivsc_properties[1];
 =09struct property_entry ivsc_sensor_ep_properties[4];
--=20
2.54.0


