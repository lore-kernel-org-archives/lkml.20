Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792943269;
	b=RwbMRrPs6WpMsS5IRaBxKrGamcnLauyPb4WWTkg/5jnkNAtfTuDUubZ6Chlmx4FVnoPL
	 rhbdV6+JROXWq6OQkpYSeJoQ+eqpoNGYgnOyhEMQ6vThMu4Ln7IStIiC/4Qw+BjQ+lJEb
	 bbHjg4l5b9fC704ZwaXf9GghInhFxbSyZZT4ons9F6De5QTER4eNWiR2QBzYl/W5VQ+gn
	 PVXnguqjV5jhvZyGeYOg4fZqw6Q/NVyvmG0/XEOzat/07f00uKfXwfU9aUNGse0Wuui+C
	 ML/XyCKvzETCapIfUx9/tmFnT2WdRJ398FRDk3O55HbA/tp+t16cFky6nLLBPZIz8CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792943269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1PFzcjS9a5ugm6SjW0wqUNsqPHzgzm9GT41d0aNyDjs=;
	b=rMkWGKjl19Oz1BDgEYyDy9MugGyDrGSznJKkyun0JIqTaEOAQS1oWoYzpgaNOyGhq3sg
	 WSX195CqZKu7MGveg4pmFkdMrcW0Ntia9QEFNOGx1yXuCWWDJFd+621JxgIasZw+AYToh
	 F+FarrhnRYBjWAaGNhMIIvZUhXn8o++2LHH3Fpdd/XXh2KkNSU4+VNp6OHlF7rAwUqQqO
	 cW0dwqG/ARUlT+PxVmZUViaApY1zRPj2ji0+h40HSBphWL7YlZRheghyjAfE65OnvH/cl
	 eOclIue1HV3clvkdiiRqzuPdWxvg2NQRvT04HAvcMgKqWVUD0f3xB4tM1Xpmc6BRu4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Whk9x7ig;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A02606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 15:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67A02606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Whk9x7ig
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso18118585e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792943268; x=1793548068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1PFzcjS9a5ugm6SjW0wqUNsqPHzgzm9GT41d0aNyDjs=;
        b=Whk9x7igyBJniH9ha6sp9vgTL8bJdcVKHEdSLYlnC5UbrY8iKdodDYcrAKR8hvI4Pe
         haGFB1VJAFbjKE/5uyJ0OPBPZPxHSx5tTkZpueBWt16lp2jPmOSgcRdvaXAYAud20mMO
         FPBOqRRJd67zfG9mnVOrTqhQe+upOMsfVh1EPc7IhwM9t4BGNhp25MANVzX6yeabutwQ
         7ThmRZPrdJYf0Wg22rkHxdfAa/d/xJwp/ftc78+3nODX7+O0/AdpxDxVEoIPz0eWQt2u
         i/xDp77ARpPzVAmvZpCtFChEo6+/qUlzExqKQ3ebiq1h5ITZ67n4G2rTbWI2owwU0Xmk
         EgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792943268; x=1793548068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1PFzcjS9a5ugm6SjW0wqUNsqPHzgzm9GT41d0aNyDjs=;
        b=E+Eem1jOSsib09WAOinpySQuCJicJMYT6byIGxB6LM6hZNuMbgUwRejx9oi2j6zhwB
         axnminuACFWGbsMC4QMcYvLFIadWw/kcQaf30ncBkykion8QCDOFFf9vpRnQD7Chp815
         u/DVvgrB4CgX0FiuAA+s+ylhYs6oqcNEklaNsXBhesJxIfSJdSXwcK50Yd5W2uJntxC1
         HPUDumMlm5zGmwPPcaypK7MuwsSFjcqq7aD6yD53YAxSA+gFpjUuGzTLiVAW0bwxW3Yz
         EmdLQ0j5N0MpTqGBfXXkbNXTm5HSTAZc1GOMBDC3cs1kTZnVAhefZ6Ao2qNwViht1d4n
         2YqA==
X-Forwarded-Encrypted: i=1; AKwUvBztKhv1ZYEdVzc0J12g1U2uaPFVK0j204XBbglyCM6VQvPZBLVDYn7z2yK8s9aaLh33IiCQM5k6rzPxgpA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+N0nfmqzY98Rj/hGJkKV7nKV/3b8WbhmxNFcxYTDydp0leRFA
	yBawutEM58gmwJimsPmJ3u5Hsin8hUbw/sN5IbGuQKQOauZteepzbfI=
X-Gm-Gg: AYBFou21DhJv4BbvBR4T1xtzG5CgWbo+kin8Sq7+ySCAqtyMKcRSgfBWMLOOj6ayHXY
	9aJUJYi1T3tJNdj9R1+piQ7P4jAdFt08gnWXBNtFONBBUwuT/syZ1PxIfwH86PMNgJxAiHviska
	Lb6jvRcfR7/CI10ycqCEB60dy6f/dG9VUPWzudsU3Iwp6pAIIXqYADE4QTxUiR1go8eLp5J/WwR
	56ux0q7SJnH9eyIq5tY2AHIlE2u+WHzOOhk+olcvSlVFJEPsHEO1haP/6eBgLSHq+4NA7RIjCdk
	J5dme07+BHC5uNG5eA12YvVMdGpdw9XfJ4FCQo3xJjBFgSD4KsNC1GBgjA19pPAAABLLHeMF06M
	I+bvFyEqyK61pR+yCHQDJsEHr/lCtq560E+eWpl5aQO/SWv+F0MN99Ya4RT/b3qAQNoRZf7+i1d
	QOoQWbR6vrICSva3OUGsotXiST3HUbRRx8cAM9Pqnoz0pe6p28tt+9dGOb6Wfy5eK8cwcgTducj
	XW3/X+BMmNHdhMMlLhrdByr
X-Received: by 2002:a05:600c:1c03:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4a642ccc7b2mr7207065e9.17.1792943267753;
        Sun, 25 Oct 2026 08:47:47 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fc1207sm102382235e9.1.2026.10.25.08.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:47:46 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: even.xu@intel.com,
	xinpeng.sun@intel.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] HID: intel-thc-hid: validate ACPI buffer length before memcpy
Date: Sun, 25 Oct 2026 15:47:45 +0000
Message-ID: <20261025154745.2734805-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024205850.4051206-1-tristmd@gmail.com>
References: 
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

The QuickI2C and QuickSPI ACPI helper functions copy firmware-returned
buffers into caller-provided structures without verifying the buffer
length. Malformed or short ACPI tables could cause an out-of-bounds
read from the firmware buffer, and oversized responses could overflow
the destination struct.

Additionally, quicki2c_acpi_get_dsd_property() does not validate the
returned ACPI object type before accessing buffer fields, and does not
free the allocated ACPI buffer on the success path, leaking memory on
every call.

Add a buf_size parameter to the ACPI helper functions and reject
responses larger than the destination buffer. Accept shorter responses
to handle firmware that returns buffers without struct tail padding
(e.g. ISUB tables returning 177 or 145 bytes for a 184-byte struct).
Zero-initialize caller stack structures so fields beyond the firmware
response length are deterministic. Add the missing type check and
kfree to the DSD helper.

Fixes: 5282e45ccbfa ("HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C ACPI interfaces")
Fixes: 7cb06f08ef13 ("HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI ACPI interfaces")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v2:
- Use overflow-only check (>) instead of exact-match (!=) so firmware
  returning shorter buffers (e.g. 177 or 145 bytes for 184-byte ISUB
  struct, or 1 byte for 4-byte SPI opcode) is accepted
- Zero-initialize caller stack structures for deterministic behavior
  with short firmware responses
- Add missing type validation and kfree in DSD helper
- Add braces per coding style

 .../intel-quicki2c/pci-quicki2c.c             | 40 ++++++++++++++-----
 .../intel-quickspi/pci-quickspi.c             | 36 ++++++++++-------
 2 files changed, 51 insertions(+), 25 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index 7a913f717efaad..dd21864d16b05b 100644
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
@@ -75,10 +76,15 @@ static int quicki2c_acpi_get_dsm_property(struct acpi_device *adev, const guid_t
 		return -ENODEV;
 	}
 
-	if (type == ACPI_TYPE_INTEGER)
+	if (type == ACPI_TYPE_INTEGER) {
 		*(u32 *)prop_buf = (u32)obj->integer.value;
-	else if (type == ACPI_TYPE_BUFFER)
+	} else if (type == ACPI_TYPE_BUFFER) {
+		if (buf_size > 0 && obj->buffer.length > buf_size) {
+			ACPI_FREE(obj);
+			return -ENOSPC;
+		}
 		memcpy(prop_buf, obj->buffer.pointer, obj->buffer.length);
+	}
 
 	ACPI_FREE(obj);
 
@@ -97,7 +103,8 @@ static int quicki2c_acpi_get_dsm_property(struct acpi_device *adev, const guid_t
  * Return: 0 if success or ENODEV on failed.
  */
 static int quicki2c_acpi_get_dsd_property(struct acpi_device *adev, acpi_string dsd_method_name,
-					  acpi_object_type type, void *prop_buf)
+					  acpi_object_type type, void *prop_buf,
+					  size_t buf_size)
 {
 	acpi_handle handle = acpi_device_handle(adev);
 	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
@@ -113,7 +120,16 @@ static int quicki2c_acpi_get_dsd_property(struct acpi_device *adev, acpi_string
 
 	ret_obj = buffer.pointer;
 
+	if (ret_obj->type != type) {
+		kfree(buffer.pointer);
+		return -EINVAL;
+	}
+	if (buf_size > 0 && ret_obj->buffer.length > buf_size) {
+		kfree(buffer.pointer);
+		return -ENOSPC;
+	}
 	memcpy(prop_buf, ret_obj->buffer.pointer, ret_obj->buffer.length);
+	kfree(buffer.pointer);
 
 	return 0;
 }
@@ -129,8 +145,8 @@ static int quicki2c_acpi_get_dsd_property(struct acpi_device *adev, acpi_string
 static int quicki2c_get_acpi_resources(struct quicki2c_device *qcdev)
 {
 	struct acpi_device *adev = ACPI_COMPANION(qcdev->dev);
-	struct quicki2c_subip_acpi_parameter i2c_param;
-	struct quicki2c_subip_acpi_config i2c_config;
+	struct quicki2c_subip_acpi_parameter i2c_param = {};
+	struct quicki2c_subip_acpi_config i2c_config = {};
 	u32 hid_desc_addr;
 	int ret = -EINVAL;
 
@@ -145,7 +161,7 @@ static int quicki2c_get_acpi_resources(struct quicki2c_device *qcdev)
 					     QUICKI2C_ACPI_REVISION_NUM,
 					     QUICKI2C_ACPI_FUNC_NUM_HID_DESC_ADDR,
 					     ACPI_TYPE_INTEGER,
-					     &hid_desc_addr);
+					     &hid_desc_addr, 0);
 	if (ret)
 		return ret;
 
@@ -155,7 +171,7 @@ static int quicki2c_get_acpi_resources(struct quicki2c_device *qcdev)
 					     QUICKI2C_ACPI_REVISION_NUM,
 					     QUICKI2C_ACPI_FUNC_NUM_ACTIVE_LTR_VAL,
 					     ACPI_TYPE_INTEGER,
-					     &qcdev->active_ltr_val);
+					     &qcdev->active_ltr_val, 0);
 	if (ret)
 		return ret;
 
@@ -163,12 +179,13 @@ static int quicki2c_get_acpi_resources(struct quicki2c_device *qcdev)
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
 
@@ -180,7 +197,8 @@ static int quicki2c_get_acpi_resources(struct quicki2c_device *qcdev)
 	qcdev->i2c_config.target_addr = i2c_param.device_address;
 
 	ret = quicki2c_acpi_get_dsd_property(adev, QUICKI2C_ACPI_METHOD_NAME_ISUB,
-					     ACPI_TYPE_BUFFER, &i2c_config);
+					     ACPI_TYPE_BUFFER, &i2c_config,
+					     sizeof(i2c_config));
 	if (ret)
 		return ret;
 
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
index 53023e30cf8d47..e4331ba4e503d9 100644
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
@@ -94,10 +95,15 @@ static int thc_acpi_get_property(struct acpi_device *adev, const guid_t *guid,
 		return -ENODEV;
 	}
 
-	if (type == ACPI_TYPE_INTEGER)
+	if (type == ACPI_TYPE_INTEGER) {
 		*(u32 *)prop_buf = (u32)obj->integer.value;
-	else if (type == ACPI_TYPE_BUFFER)
+	} else if (type == ACPI_TYPE_BUFFER) {
+		if (buf_size > 0 && obj->buffer.length > buf_size) {
+			ACPI_FREE(obj);
+			return -ENOSPC;
+		}
 		memcpy(prop_buf, obj->buffer.pointer, obj->buffer.length);
+	}
 
 	ACPI_FREE(obj);
 
@@ -129,7 +135,7 @@ static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
 				    ACPI_QUICKSPI_REVISION_NUM,
 				    ACPI_QUICKSPI_FUNC_NUM_INPUT_REP_HDR_ADDR,
 				    ACPI_TYPE_INTEGER,
-				    &qsdev->input_report_hdr_addr);
+				    &qsdev->input_report_hdr_addr, 0);
 	if (ret)
 		return ret;
 
@@ -137,7 +143,7 @@ static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
 				    ACPI_QUICKSPI_REVISION_NUM,
 				    ACPI_QUICKSPI_FUNC_NUM_INPUT_REP_BDY_ADDR,
 				    ACPI_TYPE_INTEGER,
-				    &qsdev->input_report_bdy_addr);
+				    &qsdev->input_report_bdy_addr, 0);
 	if (ret)
 		return ret;
 
@@ -145,7 +151,7 @@ static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
 				    ACPI_QUICKSPI_REVISION_NUM,
 				    ACPI_QUICKSPI_FUNC_NUM_OUTPUT_REP_ADDR,
 				    ACPI_TYPE_INTEGER,
-				    &qsdev->output_report_addr);
+				    &qsdev->output_report_addr, 0);
 	if (ret)
 		return ret;
 
@@ -153,7 +159,8 @@ static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
 				    ACPI_QUICKSPI_REVISION_NUM,
 				    ACPI_QUICKSPI_FUNC_NUM_READ_OPCODE,
 				    ACPI_TYPE_BUFFER,
-				    &qsdev->spi_read_opcode);
+				    &qsdev->spi_read_opcode,
+				    sizeof(qsdev->spi_read_opcode));
 	if (ret)
 		return ret;
 
@@ -161,7 +168,8 @@ static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
 				    ACPI_QUICKSPI_REVISION_NUM,
 				    ACPI_QUICKSPI_FUNC_NUM_WRITE_OPCODE,
 				    ACPI_TYPE_BUFFER,
-				    &qsdev->spi_write_opcode);
+				    &qsdev->spi_write_opcode,
+				    sizeof(qsdev->spi_write_opcode));
 	if (ret)
 		return ret;
 
@@ -169,7 +177,7 @@ static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
 				    ACPI_QUICKSPI_REVISION_NUM,
 				    ACPI_QUICKSPI_FUNC_NUM_IO_MODE,
 				    ACPI_TYPE_INTEGER,
-				    &qsdev->spi_read_io_mode);
+				    &qsdev->spi_read_io_mode, 0);
 	if (ret)
 		return ret;
 
@@ -184,7 +192,7 @@ static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
 				    ACPI_QUICKSPI_REVISION_NUM,
 				    ACPI_QUICKSPI_FUNC_NUM_CONNECTION_SPEED,
 				    ACPI_TYPE_INTEGER,
-				    &qsdev->spi_freq_val);
+				    &qsdev->spi_freq_val, 0);
 	if (ret)
 		return ret;
 
@@ -192,7 +200,7 @@ static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
 				    ACPI_QUICKSPI_REVISION_NUM,
 				    ACPI_QUICKSPI_FUNC_NUM_LIMIT_PACKET_SIZE,
 				    ACPI_TYPE_INTEGER,
-				    &qsdev->limit_packet_size);
+				    &qsdev->limit_packet_size, 0);
 	if (ret)
 		return ret;
 
@@ -205,7 +213,7 @@ static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
 				    ACPI_QUICKSPI_REVISION_NUM,
 				    ACPI_QUICKSPI_FUNC_NUM_PERFORMANCE_LIMIT,
 				    ACPI_TYPE_INTEGER,
-				    &qsdev->performance_limit);
+				    &qsdev->performance_limit, 0);
 	if (ret)
 		return ret;
 
@@ -215,7 +223,7 @@ static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
 				    ACPI_QUICKSPI_REVISION_NUM,
 				    ACPI_QUICKSPI_FUNC_NUM_ACTIVE_LTR,
 				    ACPI_TYPE_INTEGER,
-				    &qsdev->active_ltr_val);
+				    &qsdev->active_ltr_val, 0);
 	if (ret)
 		return ret;
 
@@ -223,7 +231,7 @@ static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
 				    ACPI_QUICKSPI_REVISION_NUM,
 				    ACPI_QUICKSPI_FUNC_NUM_LP_LTR,
 				    ACPI_TYPE_INTEGER,
-				    &qsdev->low_power_ltr_val);
+				    &qsdev->low_power_ltr_val, 0);
 	if (ret)
 		return ret;
 
-- 
2.47.3

