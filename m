Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706183;
	b=VUDgo608rsJAHxsDvpoS5g2pmNePoEA0/qAthtNHP5gD0AENUloErC70HiEzlpDumD89
	 WSBMnPf7hXqoK+bD1pgm4k+ZORURtsRIlDO8f2qPXqmDnEniBSyYcei2j95UAPaEYdUK2
	 rplpQ77NGgW3m2XGfs78/PmRkU/lWDI/dyQpH0HUDUde6QioaArl1Osq5wXTkHycSR2Dz
	 u+ERXVTC4I0aAKzz8LfezKO6NDxnZp2Og5zwUbcq3Yrt1aIQbt2dRbVK7NVJTTQqg4uos
	 rZiED6MREirkHKrXrZpYZHHPMOfCFGZB1a0l2E0LGOyiAqptsu4ig9kAcbgUgjUEZWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706183;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-QQ-SENDSIZE:
	 Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=+zHiE5XcWww7tLTpXyIARkWQlwlTAcUnLfouLWCJeB4=;
	b=hQ0xL2JvTJhIIhfDrkSB/aCUFnoDtqKaKpZpVZMBQG9xIZCZeLvkkKufrlaSzTzkUbzl
	 YsLxSbvgnv0PbSEkBYQlOce3kCKRPnF87Bp2sjLVvXNhhd2ff9UTXVe9B9bXQmjfAXFBl
	 lfQdZypALKYiy0z1ZFOi8ncx9nq6QxxFW65rgs5A3s0Xd7xg70zjkZAcoaDYBLf6xrc61
	 7gdjQqz7dTxt0+kVVC7qXEJnrldKGV7cJ5DhCPcnHQRLyiVvRb+s1tV+LRFEPuPWrPetz
	 iuuO5qKeOMFz1cPAwyvhQbZojK6YzoH8Go/BANXF3XqeWoVqijK5HJtIN7ejQPbgmkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smail.nju.edu.cn;
	spf=pass smtp.mailfrom=smail.nju.edu.cn;
	dkim=pass header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.a=rsa-sha256 header.s=iohv2404 header.b=ymsNnxWy;
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7C1606EEB4
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A7C1606EEB4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.a=rsa-sha256 header.s=iohv2404 header.b=ymsNnxWy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1793706063;
	bh=+zHiE5XcWww7tLTpXyIARkWQlwlTAcUnLfouLWCJeB4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=ymsNnxWymso6ZLYtqUZzZNziUid16kBPt/L15jDDk1Gxulb61qoAGbOJRl4iC0fiI
	 AhCBT8LWjCELVItE6nASSaKkTZs6utJNR3rqVeMLcd58OfkuUYXzR2c4Eix+BQRZxQ
	 zd3xYhG6gXyfrBm6sZ5UkUUGPs3hclfYmYy1V92Q=
X-QQ-mid: zesmtpip4t1793706059t80501f17
X-QQ-Originating-IP: 1MCHwRi6gNt0bcBzShi+yjMARG4lYNZkcQfQtp8Ebn4=
Received: from workstation-Precision-7920-Towe ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 03 Nov 2026 19:40:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13736684038379576073
From: Kang Chen <k.chen@smail.nju.edu.cn>
To: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
	Dave Airlie <airlied@redhat.com>,
	Rosen Penev <rosenp@gmail.com>,
	Ben Skeggs <bskeggs@redhat.com>,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau/gsp: validate the ACPI backlight package
Date: Tue,  3 Nov 2026 19:40:57 +0800
Message-Id: <20261103114057.73915-1-k.chen@smail.nju.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: OZZSS56D9fAjchVT4xJNCJSyJiNMtlL0KfIfG6a+e1vlo0Sy2yCiiaos
	0D3a9cGkWoIMxsmxTHFtCV0mvNQDJpmT3hfdh562/amTayAeqtnrT+GzlkN/t0Gnn6G6Xp5
	tbAIXQ2MNWBpMQEQfgRdHRncDIpg8JrJVsogu04Pi1u/B4T/rLr8L+TZe49GXfYHniwvMO/
	7uzO5zTCbxwrpajE5wN3W1GgqX8ccBnr1LYFdr16+ZXu7TVWmmtJw6rt32GMrnEPgde6QkD
	aN87KoaspempwIf9nMqCSPBvUZFO6BYMLB8XK/SfT8Wuq9aUn8IeerCAD/o/nRqRBX0DlKd
	V1zmb7o/IBkHdVULzJSXJY8hLoq+oLErTrWrFp4myWjOvTjGKRKqboNvKIW5pfmlAlMyf1X
	jJ+dAk3Sjb9Yjs6RzRjLeM+zAqPOnJsGdiDoKB7V3zsRmRgj+lvA33Tpd2y6tbjMbdzXL0C
	fT2u5+nIl8vTgIqOdg2y+CBi/85jn1nnh3ztB7U4sJpVO0afEINUt6U+VfGkZhwms0gwrp2
	k0T7rSkEWjpfIPASwm1dq3mtjoIgaczXBfBC6B3OrHz1X4xkkTReZmCAGaZZQc7U/z5Tfft
	PZQSHKwjUbpO9y/CPTT1uz4A8N2FjHoIFjRanJEj/FkqaFSrdSlBP8cEw5QZ1jqpIJ2jhgY
	OyEGdtvB+RjEtQn1xUyPfHYCdrM8SOHsuXPZX1fsQeXm2thvVJr2MaXwMbbUjjrARJ8rVVT
	zCmpb1gY9sat6iZPhC6WRv59oZ0erzeMu0hsCcMsCllIblUJQ+p57Evgd2yrEEhbIpbU7P1
	blh5ug3IFMP0JkfYLqFiAx5/Fa7yt2k5CXdTn6biI5ansT2+CwpZWGV9/W/GjQrvk9FRetY
	K/9aGuV01fpcGwnTlUYU/tUIyzqF1mq4ku83Qgym6vYVfXewSpurmmljIT5X/xXirp3LgUB
	rmVxmYGTZfGpH0w+IboYLTKQyNL+C5OzNIWYm+DFQeYAQreQLsWcZbHGkBqNLJl5cPEFXkM
	QubRjERobCo4H4aShOtd20VJJ4hRRYikjuDnci48+5/YEXMPeu
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

The _DSM handler for the internal brightness state load command walks
the returned package and copies every element into
ctrl->backLightData without checking the object type, the element type,
or the size of the destination.  A firmware-provided _DSM method can
return a non-package object, non-integer elements, or more data than
the 4 KiB backLightData array holds, causing out-of-bounds writes in
the RM control buffer.

Move the _DSM handling into helpers that validate the package and every
element, and that refuse to copy past the end of the destination.  The
destination size is only updated after the whole package has been
validated, and success is only reported to the RM control command in
that case.  Use a zeroed buffer for the _DSM input and reject an
invalid initial data size before subtracting it from the destination
length.

Fixes: 9e99444490238 ("drm/nouveau/disp/r535: initial support")
Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 142 ++++++++++++------
 1 file changed, 92 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index f5f22173fc2c..730bd08da911 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -1467,6 +1467,94 @@ r535_disp_get_static_info(struct nvkm_disp *disp)
 	return 0;
 }
 
+#if defined(CONFIG_ACPI) && defined(CONFIG_X86)
+static int
+r535_gsp_backlight_pkg(union acpi_object *obj, u8 *data, u16 *data_size,
+		       size_t data_len)
+{
+	size_t offset = *data_size;
+	unsigned int i;
+
+	if (offset > data_len)
+		return -EINVAL;
+
+	if (obj->type != ACPI_TYPE_PACKAGE)
+		return -EINVAL;
+
+	for (i = 0; i < obj->package.count; i++) {
+		union acpi_object *elt = &obj->package.elements[i];
+		u32 size;
+
+		if (elt->type != ACPI_TYPE_INTEGER)
+			return -EINVAL;
+
+		if (elt->integer.value & ~0xffffffffULL)
+			size = 8;
+		else
+			size = 4;
+
+		if (size > data_len - offset)
+			return -EINVAL;
+
+		memcpy(&data[offset], &elt->integer.value, size);
+		offset += size;
+	}
+
+	*data_size = offset;
+
+	return 0;
+}
+
+static bool
+r535_gsp_backlight_dsm(struct nvkm_device *device, u8 *data, u16 *data_size,
+		       size_t data_len)
+{
+	const guid_t nbci_dsm_guid =
+		GUID_INIT(0xD4A50B75, 0x65C7, 0x46F7,
+			  0xBF, 0xB7, 0x41, 0x51, 0x4C, 0xEA, 0x02, 0x44);
+	const guid_t nvhg_dsm_guid =
+		GUID_INIT(0x9D95A0A0, 0x0060, 0x4D48,
+			  0xB3, 0x4D, 0x7E, 0x5F, 0xEA, 0x12, 0x9F, 0xD4);
+	acpi_handle handle = ACPI_HANDLE(device->dev);
+	union acpi_object argv4, *obj;
+	bool ret = false;
+	bool nbci, nvhg;
+
+	if (!handle || !acpi_has_method(handle, "_DSM"))
+		return false;
+
+	nbci = acpi_check_dsm(handle, &nbci_dsm_guid, 0x00000102,
+			      1ULL << 0x00000014);
+	nvhg = acpi_check_dsm(handle, &nvhg_dsm_guid, 0x00000102,
+			      1ULL << 0x00000014);
+	if (!nbci && !nvhg)
+		return false;
+
+	argv4.buffer.type = ACPI_TYPE_BUFFER;
+	argv4.buffer.length = data_len;
+	argv4.buffer.pointer = kzalloc(data_len, GFP_KERNEL);
+	if (!argv4.buffer.pointer)
+		return false;
+
+	obj = acpi_evaluate_dsm(handle, nbci ? &nbci_dsm_guid : &nvhg_dsm_guid,
+				0x00000102, 0x14, &argv4);
+	if (!obj) {
+		acpi_handle_info(handle, "failed to evaluate _DSM\n");
+		goto out_free;
+	}
+
+	if (r535_gsp_backlight_pkg(obj, data, data_size, data_len))
+		acpi_handle_info(handle, "invalid _DSM response\n");
+	else
+		ret = true;
+
+	ACPI_FREE(obj);
+out_free:
+	kfree(argv4.buffer.pointer);
+	return ret;
+}
+#endif
+
 static int
 r535_disp_oneinit(struct nvkm_disp *disp)
 {
@@ -1528,56 +1616,10 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 
 		ctrl->status = 0x56; /* NV_ERR_NOT_SUPPORTED */
 
-		{
-			const guid_t NBCI_DSM_GUID =
-				GUID_INIT(0xD4A50B75, 0x65C7, 0x46F7,
-					  0xBF, 0xB7, 0x41, 0x51, 0x4C, 0xEA, 0x02, 0x44);
-			u64 NBCI_DSM_REV = 0x00000102;
-			const guid_t NVHG_DSM_GUID =
-				GUID_INIT(0x9D95A0A0, 0x0060, 0x4D48,
-					  0xB3, 0x4D, 0x7E, 0x5F, 0xEA, 0x12, 0x9F, 0xD4);
-			u64 NVHG_DSM_REV = 0x00000102;
-			acpi_handle handle = ACPI_HANDLE(device->dev);
-
-			if (handle && acpi_has_method(handle, "_DSM")) {
-				bool nbci = acpi_check_dsm(handle, &NBCI_DSM_GUID, NBCI_DSM_REV,
-						           1ULL << 0x00000014);
-				bool nvhg = acpi_check_dsm(handle, &NVHG_DSM_GUID, NVHG_DSM_REV,
-						           1ULL << 0x00000014);
-
-				if (nbci || nvhg) {
-					union acpi_object argv4 = {
-						.buffer.type    = ACPI_TYPE_BUFFER,
-						.buffer.length  = sizeof(ctrl->backLightData),
-						.buffer.pointer = kmalloc(argv4.buffer.length, GFP_KERNEL),
-					}, *obj;
-
-					obj = acpi_evaluate_dsm(handle, nbci ? &NBCI_DSM_GUID : &NVHG_DSM_GUID,
-								0x00000102, 0x14, &argv4);
-					if (!obj) {
-						acpi_handle_info(handle, "failed to evaluate _DSM\n");
-					} else {
-						for (int i = 0; i < obj->package.count; i++) {
-							union acpi_object *elt = &obj->package.elements[i];
-							u32 size;
-
-							if (elt->integer.value & ~0xffffffffULL)
-								size = 8;
-							else
-								size = 4;
-
-							memcpy(&ctrl->backLightData[ctrl->backLightDataSize], &elt->integer.value, size);
-							ctrl->backLightDataSize += size;
-						}
-
-						ctrl->status = 0;
-						ACPI_FREE(obj);
-					}
-
-					kfree(argv4.buffer.pointer);
-				}
-			}
-		}
+		if (r535_gsp_backlight_dsm(device, ctrl->backLightData,
+					   &ctrl->backLightDataSize,
+					   sizeof(ctrl->backLightData)))
+			ctrl->status = 0;
 
 		ret = nvkm_gsp_rm_ctrl_wr(subdevice, ctrl);
 		if (ret)
-- 
2.34.1

