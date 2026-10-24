Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792875535;
	b=jZVRaBbUeFZcg5UsUEol4Wbl+rC5AqZEDbiKecGvaQUHMnRnaxZWWD3J1OzC8AhUg6dI
	 Klh/f4DhCheblncBBnGBWe7r0Q7n61zPy3e1ShfeiI9X3WfMy9U18I50DJmLgd8W2U8Qy
	 wL7FAkrr3P33CSoUWvyQtT3jnJu63MCwWzhJ0EXERJAuMOsMl0fYpAlAt7EBt7mjO2wA5
	 HZXmfY0+9XjBEqPB1jx1RC0zRMinyei3o1w0UV2tHxkduqbTDjwXbP0bBYrcruOgKVqcY
	 U3wgFzakGPb5BtTrMB5DO963HPTMzogMNeS0c+IrbLQNArdssUXnBshYOE+5hjaZ37Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792875535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0gEEqY5moJFLyXTDq3FJpo70RB3nQcSkzxwqlez+5HY=;
	b=AxSoFLW4IVc6ITLeBsxu/USHQ36VRh0WXapVmKlNyi+lwuPd/CaYB3w8TI4OAjE2vnfY
	 uwNpnQDbJNv1gn+QqoFymM1LnoMsomSNHDzJgqLGd/ord0zEOjFJ22QWTsvBFdnKSVS2d
	 u1Q5HUz0wae8mwCFm/dgZR2/tV9YafX6gph1xp+YH5H8LWTLS+QCPlLkLp9UJP2fAghF3
	 6D8HPJA2gG4n7UWYE63rihF8Jkz8za6xTnLyKTwpJkKgQy2n1dfMFCstSVpx8qXNnPqQp
	 +0JzSv+vE6k56aCTJJtlkP7PFvJ6ax5UnYu8piADJPOPfE3ZLKrlMi9sePouyROlwQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A671s1j3;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB9A606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBB9A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A671s1j3
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so114965e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792875533; x=1793480333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0gEEqY5moJFLyXTDq3FJpo70RB3nQcSkzxwqlez+5HY=;
        b=A671s1j3cd4WMgNieeS0Ogl2fqknNfjsy6cJ0DvylYWrlrlqcn5Pd50guNSxZu2WkQ
         nL6y34agPKiPL2lSIL6xvSHnULVH6vr14x94avLDxw4swX7RsuN6TRPePe8QhFlib5UJ
         IKnj2WhlgniNNvkQSjb8HVrB6VYHBHV0Z7caDf5s4gu9D+yYexXJCl+ktntSujVUl4WX
         Afm4hyVRDM1I88OR+WBJeTk668L2x3rJpmB7B96lqYPaoqlIxiuAFTI4TIji3ixh1RTS
         7MqmUOjoknwxJefHgHYXKmjDrz4YiE6wZ+mfMV2CIrchvkfWz9DmIcrIB7GX1zqY/Lr8
         qhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792875533; x=1793480333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0gEEqY5moJFLyXTDq3FJpo70RB3nQcSkzxwqlez+5HY=;
        b=SBKRX5RAekGzdBrT3jVNew7pHRYlUXWOTKTrW5ibxTmbSveOyPPjLDAMavMV0MfJ3H
         0vxgTbuZU0+wxUACVyovwHnvNvmVw5ou2fs/ZwE5RYkz7gwsc0+sJMWn6NEPdqsC67jV
         JV71BEzZvIEp6QxYT5xXLrYANggJPClOnFWoMkBMxoyU2vjfbaT1t8y1rCXvEcITZybf
         tFxG2SvsdFHE5Nsu0Xjs87STWZnRcsUzAUhL3mJCGqmfPweZmjALekFTMska3uoVAB28
         AzgIO5w1hZzqswFpxmDEgEoEKfOpf+SzAm9aA/fsv9b6Qx0LbHfLygPllPXjHdeSDOBn
         By3g==
X-Forwarded-Encrypted: i=1; AKwUvBx6+H1rY0z2RDrGjMCpiPpjr/adkuzk5/tmCsdTUgUZ5gCz6xllAIENoayGpK45GvR8q2zNT68r2g71zfE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLusETH98ayhJUeBm1EZULBDiIGWFrqX5AY/NA1tFqx2RkUzURC
	z+pwLwS/H/cFtUHvD8nocmkcyM5wQuE2/tRLJpo3kMZqBW/IHIopIUopaHm7
X-Gm-Gg: AYBFou1WQmI1svd54WEjmgmXWus9xJvyIejXRYI/JEUTS/rRpmOKKJS8cvfPye4ROSm
	Nt0UbNTDn/xHg9WadixlYTkpLcm5YjnqMUyfz2M5QHbqBZe/ogKfQknxB6q/t+CCAFKYgJx7iIG
	BEoinod21WaGJ8/08+LfDvibQjBPMqrkWISWPjsw/HijC7H/gkRB4pbLE1TzsIRL4qWp0N4B2c2
	M6pVWW9bK8g24QIlMFmp71urg9oSELaQd7YJc4Aqqy3O0LdSpBDGW5hL3rvKwaId9z/1tCh9BJp
	j4C1gliEXq4FRJeGqUY77CZd4q9pzHudNDr+ce54IeQlVMsvjNczv4o+aolTMuFavYB39xVBQdS
	hOrfc3TXVILwQRi+s3ueeSg/N5Bst1ZJ/F49MTY9EWVQDjDWe6N+hfIlXMgnSFEG/d74nIIrjN2
	OSS1mOloORctygMOhkUJDSANhxbl0qzUdscyve6POFalbSlfjOqdLVvuqvgtEkkwI1HQcI0yiLB
	4uj5IgEAL34uhgbOPkbaGkW
X-Received: by 2002:a05:600c:3b82:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4a35ae71a3emr46309225e9.6.1792875533189;
        Sat, 24 Oct 2026 13:58:53 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a4cb7bece3sm25238465e9.10.2026.10.24.13.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:58:52 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Even Xu <even.xu@intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Xinpeng Sun <xinpeng.sun@intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] HID: intel-thc-hid: validate ACPI buffer length before use
Date: Sat, 24 Oct 2026 20:58:50 +0000
Message-ID: <20261024205850.4051206-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

The QuickI2C and QuickSPI ACPI helpers copy firmware-returned buffers
into fixed-layout caller structs without checking the buffer length
against the destination size:

1. Buffer copies use the firmware-reported length without checking
   it against the destination buffer size, allowing stack overflows
   from oversized responses.
2. Undersized buffer responses leave caller struct fields
   uninitialized, as fixed-layout structs like i2c_param and
   i2c_config are consumed field-by-field after the call.
3. The QuickI2C DSD helper does not validate the returned ACPI
   object type before accessing buffer-specific fields.

Add a buf_size parameter to all three helpers and enforce exact
buffer size matching for BUFFER type properties. Add type validation
in the DSD helper (the DSM helpers already receive type-checked
results from acpi_evaluate_dsm_typed()).

Fixes: 5282e45ccbfa ("HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C ACPI interfaces")
Fixes: 7cb06f08ef13 ("HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI ACPI interfaces")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 .../intel-quicki2c/pci-quicki2c.c             | 40 ++++++++++++++----
 .../intel-quickspi/pci-quickspi.c             | 41 ++++++++++++-------
 2 files changed, 58 insertions(+), 23 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index 2537288b50261..a3d71f296b462 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -62,7 +62,8 @@ static const struct acpi_gpio_mapping quicki2c_gpios[] = {
  * Return: 0 if success or ENODEV on failure.
  */
 static int quicki2c_acpi_get_dsm_property(struct acpi_device *adev, const guid_t *guid,
-					  u64 rev, u64 func, acpi_object_type type, void *prop_buf)
+					  u64 rev, u64 func, acpi_object_type type,
+					  void *prop_buf, size_t buf_size)
 {
 	acpi_handle handle = acpi_device_handle(adev);
 	union acpi_object *obj;
@@ -75,10 +76,17 @@ static int quicki2c_acpi_get_dsm_property(struct acpi_device *adev, const guid_t
 		return -ENODEV;
 	}
 
-	if (type == ACPI_TYPE_INTEGER)
+	if (type == ACPI_TYPE_INTEGER) {
 		*(u32 *)prop_buf = (u32)obj->integer.value;
-	else if (type == ACPI_TYPE_BUFFER)
+	} else if (type == ACPI_TYPE_BUFFER) {
+		if (buf_size > 0 && obj->buffer.length != buf_size) {
+			int err = obj->buffer.length > buf_size ? -ENOSPC : -EINVAL;
+
+			ACPI_FREE(obj);
+			return err;
+		}
 		memcpy(prop_buf, obj->buffer.pointer, obj->buffer.length);
+	}
 
 	ACPI_FREE(obj);
 
@@ -97,7 +105,8 @@ static int quicki2c_acpi_get_dsm_property(struct acpi_device *adev, const guid_t
  * Return: 0 if success or ENODEV on failed.
  */
 static int quicki2c_acpi_get_dsd_property(struct acpi_device *adev, acpi_string dsd_method_name,
-					  acpi_object_type type, void *prop_buf)
+					  acpi_object_type type, void *prop_buf,
+					  size_t buf_size)
 {
 	acpi_handle handle = acpi_device_handle(adev);
 	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
@@ -113,7 +122,18 @@ static int quicki2c_acpi_get_dsd_property(struct acpi_device *adev, acpi_string
 
 	ret_obj = buffer.pointer;
 
+	if (ret_obj->type != type) {
+		kfree(buffer.pointer);
+		return -EINVAL;
+	}
+	if (buf_size > 0 && ret_obj->buffer.length != buf_size) {
+		int err = ret_obj->buffer.length > buf_size ? -ENOSPC : -EINVAL;
+
+		kfree(buffer.pointer);
+		return err;
+	}
 	memcpy(prop_buf, ret_obj->buffer.pointer, ret_obj->buffer.length);
+	kfree(buffer.pointer);
 
 	return 0;
 }
@@ -145,7 +165,7 @@ static int quicki2c_get_acpi_resources(struct quicki2c_device *qcdev)
 					     QUICKI2C_ACPI_REVISION_NUM,
 					     QUICKI2C_ACPI_FUNC_NUM_HID_DESC_ADDR,
 					     ACPI_TYPE_INTEGER,
-					     &hid_desc_addr);
+					     &hid_desc_addr, 0);
 	if (ret)
 		return ret;
 
@@ -155,7 +175,7 @@ static int quicki2c_get_acpi_resources(struct quicki2c_device *qcdev)
 					     QUICKI2C_ACPI_REVISION_NUM,
 					     QUICKI2C_ACPI_FUNC_NUM_ACTIVE_LTR_VAL,
 					     ACPI_TYPE_INTEGER,
-					     &qcdev->active_ltr_val);
+					     &qcdev->active_ltr_val, 0);
 	if (ret)
 		return ret;
 
@@ -163,12 +183,13 @@ static int quicki2c_get_acpi_resources(struct quicki2c_device *qcdev)
 					     QUICKI2C_ACPI_REVISION_NUM,
 					     QUICKI2C_ACPI_FUNC_NUM_LP_LTR_VAL,
 					     ACPI_TYPE_INTEGER,
-					     &qcdev->low_power_ltr_val);
+					     &qcdev->low_power_ltr_val, 0);
 	if (ret)
 		return ret;
 
 	ret = quicki2c_acpi_get_dsd_property(adev, QUICKI2C_ACPI_METHOD_NAME_ICRS,
-					     ACPI_TYPE_BUFFER, &i2c_param);
+					     ACPI_TYPE_BUFFER, &i2c_param,
+					     sizeof(i2c_param));
 	if (ret)
 		return ret;
 
@@ -180,7 +201,8 @@ static int quicki2c_get_acpi_resources(struct quicki2c_device *qcdev)
 	qcdev->i2c_config.target_addr = i2c_param.device_address;
 
 	ret = quicki2c_acpi_get_dsd_property(adev, QUICKI2C_ACPI_METHOD_NAME_ISUB,
-					     ACPI_TYPE_BUFFER, &i2c_config);
+					     ACPI_TYPE_BUFFER, &i2c_config,
+					     sizeof(i2c_config));
 	if (ret)
 		return ret;
 
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
index ad676fde211b6..ec15ded2e91ea 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
@@ -81,7 +81,8 @@ static const struct acpi_gpio_mapping quickspi_gpios[] = {
  * Return: 0 if successful or ENODEV on failed.
  */
 static int thc_acpi_get_property(struct acpi_device *adev, const guid_t *guid,
-				 u64 rev, u64 func, acpi_object_type type, void *prop_buf)
+				 u64 rev, u64 func, acpi_object_type type,
+				 void *prop_buf, size_t buf_size)
 {
 	acpi_handle handle = acpi_device_handle(adev);
 	union acpi_object *obj;
@@ -94,10 +95,20 @@ static int thc_acpi_get_property(struct acpi_device *adev, const guid_t *guid,
 		return -ENODEV;
 	}
 
-	if (type == ACPI_TYPE_INTEGER)
+	if (type == ACPI_TYPE_INTEGER) {
 		*(u32 *)prop_buf = (u32)obj->integer.value;
-	else if (type == ACPI_TYPE_BUFFER)
+	} else if (type == ACPI_TYPE_BUFFER) {
+		if (buf_size > 0 && obj->buffer.length != buf_size) {
+			int err = obj->buffer.length > buf_size ? -ENOSPC : -EINVAL;
+
+			acpi_handle_err(handle,
+					"_DSM buffer size mismatch: %llu vs %zu\n",
+					(unsigned long long)obj->buffer.length, buf_size);
+			ACPI_FREE(obj);
+			return err;
+		}
 		memcpy(prop_buf, obj->buffer.pointer, obj->buffer.length);
+	}
 
 	ACPI_FREE(obj);
 
@@ -129,7 +140,7 @@ static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
 				    ACPI_QUICKSPI_REVISION_NUM,
 				    ACPI_QUICKSPI_FUNC_NUM_INPUT_REP_HDR_ADDR,
 				    ACPI_TYPE_INTEGER,
-				    &qsdev->input_report_hdr_addr);
+				    &qsdev->input_report_hdr_addr, 0);
 	if (ret)
 		return ret;
 
@@ -137,7 +148,7 @@ static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
 				    ACPI_QUICKSPI_REVISION_NUM,
 				    ACPI_QUICKSPI_FUNC_NUM_INPUT_REP_BDY_ADDR,
 				    ACPI_TYPE_INTEGER,
-				    &qsdev->input_report_bdy_addr);
+				    &qsdev->input_report_bdy_addr, 0);
 	if (ret)
 		return ret;
 
@@ -145,7 +156,7 @@ static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
 				    ACPI_QUICKSPI_REVISION_NUM,
 				    ACPI_QUICKSPI_FUNC_NUM_OUTPUT_REP_ADDR,
 				    ACPI_TYPE_INTEGER,
-				    &qsdev->output_report_addr);
+				    &qsdev->output_report_addr, 0);
 	if (ret)
 		return ret;
 
@@ -153,7 +164,8 @@ static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
 				    ACPI_QUICKSPI_REVISION_NUM,
 				    ACPI_QUICKSPI_FUNC_NUM_READ_OPCODE,
 				    ACPI_TYPE_BUFFER,
-				    &qsdev->spi_read_opcode);
+				    &qsdev->spi_read_opcode,
+				    sizeof(qsdev->spi_read_opcode));
 	if (ret)
 		return ret;
 
@@ -161,7 +173,8 @@ static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
 				    ACPI_QUICKSPI_REVISION_NUM,
 				    ACPI_QUICKSPI_FUNC_NUM_WRITE_OPCODE,
 				    ACPI_TYPE_BUFFER,
-				    &qsdev->spi_write_opcode);
+				    &qsdev->spi_write_opcode,
+				    sizeof(qsdev->spi_write_opcode));
 	if (ret)
 		return ret;
 
@@ -169,7 +182,7 @@ static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
 				    ACPI_QUICKSPI_REVISION_NUM,
 				    ACPI_QUICKSPI_FUNC_NUM_IO_MODE,
 				    ACPI_TYPE_INTEGER,
-				    &qsdev->spi_read_io_mode);
+				    &qsdev->spi_read_io_mode, 0);
 	if (ret)
 		return ret;
 
@@ -184,7 +197,7 @@ static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
 				    ACPI_QUICKSPI_REVISION_NUM,
 				    ACPI_QUICKSPI_FUNC_NUM_CONNECTION_SPEED,
 				    ACPI_TYPE_INTEGER,
-				    &qsdev->spi_freq_val);
+				    &qsdev->spi_freq_val, 0);
 	if (ret)
 		return ret;
 
@@ -192,7 +205,7 @@ static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
 				    ACPI_QUICKSPI_REVISION_NUM,
 				    ACPI_QUICKSPI_FUNC_NUM_LIMIT_PACKET_SIZE,
 				    ACPI_TYPE_INTEGER,
-				    &qsdev->limit_packet_size);
+				    &qsdev->limit_packet_size, 0);
 	if (ret)
 		return ret;
 
@@ -205,7 +218,7 @@ static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
 				    ACPI_QUICKSPI_REVISION_NUM,
 				    ACPI_QUICKSPI_FUNC_NUM_PERFORMANCE_LIMIT,
 				    ACPI_TYPE_INTEGER,
-				    &qsdev->performance_limit);
+				    &qsdev->performance_limit, 0);
 	if (ret)
 		return ret;
 
@@ -215,7 +228,7 @@ static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
 				    ACPI_QUICKSPI_REVISION_NUM,
 				    ACPI_QUICKSPI_FUNC_NUM_ACTIVE_LTR,
 				    ACPI_TYPE_INTEGER,
-				    &qsdev->active_ltr_val);
+				    &qsdev->active_ltr_val, 0);
 	if (ret)
 		return ret;
 
@@ -223,7 +236,7 @@ static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
 				    ACPI_QUICKSPI_REVISION_NUM,
 				    ACPI_QUICKSPI_FUNC_NUM_LP_LTR,
 				    ACPI_TYPE_INTEGER,
-				    &qsdev->low_power_ltr_val);
+				    &qsdev->low_power_ltr_val, 0);
 	if (ret)
 		return ret;
 
-- 
2.47.3

