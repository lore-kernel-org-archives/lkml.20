Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216901;
	b=unQI/kOaYLZMEXotG2cVN8ivaNpNzG1G3bxUus+J/ULd5MB/zJhIp90FgwsxfyBfXH5C
	 wW2upFS6uNUrNpXAFNRioFf/6PHbW5mw12XotqFAYLsR6AGeLOoXTHOn31Nw2s2yzSymi
	 JdDPJ3JyLnY9hPkmVOhvrASOjReIbF3kEP59ZOoYXc1tNhmYfmqSkYM+y+Rrte8BEW8I0
	 hwe+x8MRdUfQT2UIoNiKbfDIqKokxf0B6B++I+KOoIgb6tLS9mXwdhJ7D32z4OVjggEKG
	 yohqd9W8n9zO59PT/Qn26SSjTCTdLF6DKHwsqE3tWYR5LNsCHFyooEYQPwjund2WwgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216901;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=8QDOiIrFq9d9zPkD3MbgEKaxPlnCuUeJKOCRgNAL7wc=;
	b=LmNkLNVnOi2w/RFCXrdGlEzj0S/QmQjFbJqg2N8UdwlFXZbSIELj4q4PK0/AyIIYSzzw
	 EHEuvg4cPTXzEvW1QbcBmmmp1YPQUVjM/KAddEWpiyGtelBpMtw50qRe+NiNLrpB1AS+l
	 0Vk7IlDAxIGfLBXS5Z+dozjeBGhX4iS80vTHw7aze1s/iO4qGrTPynAw4varm0VjXOkXY
	 9cVv12b72/ImhOthmmOHRMn4cICPwbW2U1vZ6XazSxEpSygAPM4oEmO1wf7jbGbEIQNvy
	 G269YjLe3ikInwQ3SD7q9LXG3BDLIMyIU335U4JZF7Mgk3oC5WhoefpzmPjhUyK5xAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=O9A74aSl;
	arc=none smtp.remote-ip=185.70.43.100
Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9D2606D80A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F9D2606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=O9A74aSl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794216898; x=1794476098;
	bh=8QDOiIrFq9d9zPkD3MbgEKaxPlnCuUeJKOCRgNAL7wc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=O9A74aSlekAcTauohTZd8SlsjrcV/vHHVJZXIkDam3DIWiTmDFjDoPOeK/C7S6HQ3
	 Z01IPsH13iKNm9Y9WMlgjLW7MoVPN8cMfdh6ne966vTo09kujHil1vvasmlPh6T81P
	 9UOyQRr/uO3+QGQzvb+hpqniTXK2xwXRpH2r9MAlKD6FRYi1ORoemiQn+kQEhjbIRP
	 5lTOSmoZ/lM0fSB3V56F8/jlYIeD8F+bUphmZ3n7CrVnAG4eNfjFh5mezxDiOq0lBI
	 fSbwMUX/mXFwDhykEuAGCTe07gbNomQuB1ps3D4bdUEyPrxMA3tBNcKF83ajDihaJY
	 jWOd2w6xodz4g==
Date: Mon, 09 Nov 2026 09:34:50 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] media: ipu-bridge: Add the Surface Pro 9 and 11 infrared illuminator
Message-ID: <20261109093353.3757-5-lsa.uz@pm.me>
In-Reply-To: <20261109093353.3757-1-lsa.uz@pm.me>
References: <20261109093353.3757-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 17716d4d0b38517f4ff4c07889187a5375b7ca17
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

On the Surface Pro 9 and on the Surface Pro 11 with Intel, the infrared
illuminator is driven by the VD55G0's GPIO 1, which strobes it during
the exposure. The ACPI tables do not describe it, so the sensor driver
finds no st,leds and offers no V4L2_CID_FLASH_LED_MODE.

Give the sensor's software node st,leds from a DMI match, as the
upside-down quirk gives a rotation. dev_properties gains an entry for it,
as a sensor can also have a lens-focus reference. The software nodes
outlive the module, so the property name goes into struct
ipu_property_names and the GPIO numbers into struct ipu_sensor, where
nothing points into the module image.

Tested-by: Fernando Rimoli <fernandorimoli11@gmail.com> # Surface Pro 9, IP=
U6
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
v3: no change.
v2: the st,leds name and GPIO numbers live in the bridge's own
structs, as the software nodes outlive the module (Fernando); the
Surface Pro 9 is added (Fernando).

D. Manresa's ipu-bridge series changes the same lens-focus line;
whichever of the two lands second needs a trivial rebase:
https://lore.kernel.org/all/20261026082549.662885-1-dmanresa@gmail.com/

 drivers/media/pci/intel/ipu-bridge.c | 68 +++++++++++++++++++++++++++-
 include/media/ipu-bridge.h           |  6 ++-
 2 files changed, 71 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel=
/ipu-bridge.c
index c99c85b7e6f..8d2025acf7a 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -283,6 +283,42 @@ static const struct dmi_system_id upside_down_sensor_d=
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
+=09u32 gpios[IPU_MAX_LED_GPIOS];
+=09unsigned int nr_gpios;
+};
+
+/* The infrared illuminator, strobed by the VD55G0's GPIO 1 */
+static const struct ipu_sensor_leds surface_pro_ir_leds =3D {
+=09.hid =3D "SMO55F0",
+=09.gpios =3D { 1 },
+=09.nr_gpios =3D 1,
+};
+
+static const struct dmi_system_id sensor_leds_dmi_ids[] =3D {
+=09{
+=09=09.matches =3D {
+=09=09=09DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+=09=09=09DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Pro 9"),
+=09=09},
+=09=09.driver_data =3D (void *)&surface_pro_ir_leds,
+=09},
+=09{
+=09=09.matches =3D {
+=09=09=09DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+=09=09=09DMI_EXACT_MATCH(DMI_PRODUCT_NAME,
+=09=09=09=09=09"Surface Pro for Business 11th Edition with Intel"),
+=09=09},
+=09=09.driver_data =3D (void *)&surface_pro_ir_leds,
+=09},
+=09{} /* Terminating entry */
+};
+
 static const struct ipu_property_names prop_names =3D {
 =09.clock_frequency =3D "clock-frequency",
 =09.rotation =3D "rotation",
@@ -292,6 +328,7 @@ static const struct ipu_property_names prop_names =3D {
 =09.remote_endpoint =3D "remote-endpoint",
 =09.link_frequencies =3D "link-frequencies",
 =09.clock_noncontinuous =3D "clock-noncontinuous",
+=09.st_leds =3D "st,leds",
 };
=20
 static const char * const ipu_vcm_types[] =3D {
@@ -563,6 +600,22 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, st=
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
@@ -570,7 +623,8 @@ static void ipu_bridge_create_fwnode_properties(
 {
 =09struct ipu_property_names *names =3D &sensor->prop_names;
 =09struct software_node *nodes =3D sensor->swnodes;
-=09unsigned int i =3D 0;
+=09const struct ipu_sensor_leds *leds;
+=09unsigned int i =3D 0, d =3D 3;
=20
 =09sensor->prop_names =3D prop_names;
=20
@@ -624,10 +678,20 @@ static void ipu_bridge_create_fwnode_properties(
 =09if (sensor->vcm_type) {
 =09=09sensor->vcm_ref[0] =3D
 =09=09=09SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_VCM]);
-=09=09sensor->dev_properties[3] =3D
+=09=09sensor->dev_properties[d++] =3D
 =09=09=09PROPERTY_ENTRY_REF_ARRAY("lens-focus", sensor->vcm_ref);
 =09}
=20
+=09leds =3D ipu_bridge_get_leds(cfg);
+=09if (leds) {
+=09=09memcpy(sensor->led_gpios, leds->gpios,
+=09=09       sizeof(sensor->led_gpios));
+=09=09sensor->dev_properties[d++] =3D
+=09=09=09PROPERTY_ENTRY_U32_ARRAY_LEN(names->st_leds,
+=09=09=09=09=09=09     sensor->led_gpios,
+=09=09=09=09=09=09     leds->nr_gpios);
+=09}
+
 =09sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_BUS_TYPE)] =3D
 =09=09PROPERTY_ENTRY_U32(names->bus_type,
 =09=09=09=09   V4L2_FWNODE_BUS_TYPE_CSI2_DPHY);
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 3ef94c2b767..7383bdf5a45 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -12,6 +12,7 @@
 #define IPU_MAX_LANES=09=09=09=094
 #define IPU_MAX_PORTS=09=09=09=094
 #define MAX_NUM_LINK_FREQS=09=09=093
+#define IPU_MAX_LED_GPIOS=09=09=094
=20
 /* Values are educated guesses as we don't have a spec */
 #define IPU_SENSOR_ROTATION_NORMAL=09=090
@@ -136,6 +137,7 @@ struct ipu_property_names {
 =09char remote_endpoint[16];
 =09char link_frequencies[17];
 =09char clock_noncontinuous[20];
+=09char st_leds[8];
 };
=20
 struct ipu_node_names {
@@ -178,8 +180,10 @@ struct ipu_sensor {
 =09const char *vcm_type;
=20
 =09struct ipu_property_names prop_names;
+=09/* The software nodes outlive the module, so these values live here */
+=09u32 led_gpios[IPU_MAX_LED_GPIOS];
 =09struct property_entry ep_properties[IPU_BRIDGE_EP_NUM_ENTRIES];
-=09struct property_entry dev_properties[5];
+=09struct property_entry dev_properties[6];
 =09struct property_entry ipu_properties[3];
 =09struct property_entry ivsc_properties[1];
 =09struct property_entry ivsc_sensor_ep_properties[4];
--=20
2.54.0


