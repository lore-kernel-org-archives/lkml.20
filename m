Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427751;
	b=im8cH+X2vyUT6ZLWlW3zbZSkLmSLm+fXCKGPsRUBLi38mFRTSXE7gSGJfVXfNwX9VFG4
	 iCz/VfwMTcVB0mxj4GYT86+fu6cY5STsbNHcqrSW8H4kNNDnTyfFS1IyoIEobq/1yfLVd
	 zRco5/34Wk1Qnx6pbUlCRnj8OSOfYk78k9ypr+3Gvaj4irEa0JApE3ZkALpvgsqCYmzhB
	 OSM35kEXVvxliZW4iAEr+BPWgEWaKE825FWeOgCgs+CVr7wfPVywEKJTp+U+lGoVXWk60
	 EhZCjQX5x2VW6He+InT6CNtjrXyf00VuuEDLsi+Ae0UlgUY//kaifHGEqvEtnbilT/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=koWQk9IFmwWKNpZkYe74gKtLy4Xq+ageqFKT3LrEOyk=;
	b=ru36VbUrjjzHzm7665BKjIv0lYHSx5rJDwJgSqfgUv0UaXrFc58Ar/G582wxfKVLqlfN
	 aab2XjIzBEA8FvDnSB0+n6E/nDsZIH1i2Ms8KTkT44ze47kTsBPNfyPoWmeH/WPVxnatv
	 bOm+S8WPf8NmmEXt6GjJUXmCV5qyISuFpUytY6ozJTJCnsWZCSEYNGdfQd89wdO3NHFuX
	 E8BKTVZ4M2uLY/hi6c4RleQe5aJJFI1avlLFbGeOwRsW/wHmcMe0ABipKAWIkNR6wRLiM
	 qOzsxNZ4Q7gDqa4DORHHVk9sz5PKp90K/NZzrksu3GCIC8Q/dgxQi6aOhlt0BNuNdSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XCOz7NZG;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31893606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31893606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XCOz7NZG
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48af4ba4425so258743f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792427749; x=1793032549; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=koWQk9IFmwWKNpZkYe74gKtLy4Xq+ageqFKT3LrEOyk=;
        b=XCOz7NZGQ7TGB3TPiSn+eYo3r4QrFuXkXGePCK/ue6tv9nyzmwBcn8/gtIOQqVKh2k
         sQsfGslDIUZsoU7q4wKVaMbl2DhkjY3ulEL9c1fHBfG14h0foKbeMEh13n9OLr8lFZZK
         nBDWOljdjLcmWuPwzbx/PkbZ02qoWhvxoHnzDr631YN5o9ptxd9x/vgNDt2CCdYFgTtG
         Bwbq1nNmhCkhP8V6RPNbJ23lerRIdot6pLWRj//SsxygxWvX+fjdwnx8lBtZ16YL9d39
         Y/mQq1jptNBlxprBh3/lLDYz7YT+g/TSG1YNZE1JlT6hS+Dt/d7mOc0srvoqSpHDV5ye
         UeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427749; x=1793032549;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=koWQk9IFmwWKNpZkYe74gKtLy4Xq+ageqFKT3LrEOyk=;
        b=WE2SrO3pUV8WoLRzM+nn84jojUA2gbL+d8+ZUN+7VXEebKx2ghg95QxiXzMaxCVQ7T
         WNzyqoSbt7/90E8l+1GgnVSjdrq4udxkslKYDJyzCTyfOovWg0zijB7wruXB03hQkagU
         DR18B792QL9426SLll1H0pw8jr2sEHUiCf3ZXQG15+STtsNmcdB5WLlYfUwGNSssLxKo
         BHjYrL6ZNp9MFknxsDKdfZodmhYIalcLvtTkapT9MbH5BuIKR9cSBCF7VmOUdhzIiz8r
         jM60GrCEgkOtg02f1AB8WmF5c/Emzr/peCYDI9K/oHlcFnCTGx/HT4SyebU/DItVF4kP
         f+NA==
X-Forwarded-Encrypted: i=1; AKwUvBzVDP/b9rUJWmuuU94GdLyhX2audZR91n81uCvNrxwYY/5KSErA+ELcNGYI7apJerN0W2+MD+zdPU89Agw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJb/NpQRO0PjLXFD1kqFpWvAH+KZg2GKvYB9JyEI/AHx0dpmwJ9
	epkQA05tyYj9kU+y6WYicbz7wcIVk80zrZ5ApwEuG7Yf3VrCknK5OK48
X-Gm-Gg: AYBFou0KIAG96dWymIu/7MS6oC2gTpp3Ym0fjmYADZVNgvGg26RouvChE/MX46mtINO
	CHVU5fkznPjTnojhSagULPOn92x6yNr8At8wHeYbO6QSu84VtSqyeS4HYgjyFXiiKRyJKAV4RpR
	zwUnDpX+j+sDL/r40RsiwRvNmC+HXID76jS0EvCegP2KlBanWtV5UOI3pF+x2woXXWhFU8hkws6
	FRgNtajpQA8BG/c5dZ2U8Rg+9jxJSLokNDSvPotIvrQTyHDCmzJhwBXKCf88mGXgnxG0+BoSxdQ
	QOvl7AhWO4sF2PTqGlELk92+5ZLoXnXiyV+rLqoCuE8zctnsc8KgTATt5XGBmIkO5bKACvZ0SEL
	WOIQGcw+FdjgkL3EwW1JDpbHitw/QRXBAdu8DcK3hxKYukoC3fzigu2FCEzPLJ0rQS0OYVfT0Kw
	PR4jlYsNw7AWrM9p0PNqbeECLSSXNFHGePaY2Xrp5qHFQTSmC7jKRnBMyTGaIgLQcu2K4TK/jjP
	DiMMi3VwDkZpMUvIFA=
X-Received: by 2002:a5d:588c:0:b0:48d:fb3d:bf28 with SMTP id ffacd0b85a97d-48e07ba797cmr17862050f8f.3.1792427749215;
        Mon, 19 Oct 2026 09:35:49 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.71.84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5008e7sm23860300f8f.43.2026.10.19.09.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:35:48 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: alexander.deucher@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	paulmck@kernel.org,
	rostedt@goodmis.org,
	ast@kernel.org,
	peterz@infradead.org,
	gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org,
	Arnaud Bonnet <abo@medichon.fr>
Subject: [PATCH v3] drm/amd/display: remove unused cgs register accessor typedefs
Date: Mon, 19 Oct 2026 17:35:38 +0100
Message-ID: <20261019163538.28793-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017130047.42080-1-emmaonana18@gmail.com>
References: <20261017130047.42080-1-emmaonana18@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

kernel-doc reports prototype mismatches for the cgs register accessor
typedefs, e.g.:

  drivers/gpu/drm/amd/include/cgs_common.h:89: expecting prototype
  for cgs_read_register(). Prototype was for uint32_t() instead

Each of the four typedefs is used exactly once, as the type of a struct
cgs_ops member, so they are merely an unnecessary layer of indirection.
Drop the typedefs along with their kernel-doc comments and write the
function pointer types directly in struct cgs_ops.

While at it, drop the unused cgs_handle_t and cgs_get_firmware_info
typedefs, and document the members of struct cgs_firmware_info.

Suggested-by: Christian König <christian.koenig@amd.com>
Link: https://lore.kernel.org/all/981f01e1-0c3b-4854-9d72-8bf22af9fc64@amd.com/
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Tested-by: Arnaud Bonnet <abo@medichon.fr>
---
added kernel-doc comments for struct cgs_firmware_info

 drivers/gpu/drm/amd/include/cgs_common.h | 74 +++++++++---------------
 1 file changed, 26 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/cgs_common.h b/drivers/gpu/drm/amd/include/cgs_common.hZZ
index f40b6a03fe63..79522e1bec4f 100644
--- a/drivers/gpu/drm/amd/include/cgs_common.h
+++ b/drivers/gpu/drm/amd/include/cgs_common.h
@@ -63,6 +63,14 @@ enum cgs_ucode_id {
 
 /**
  * struct cgs_firmware_info - Firmware information
+ * @version: firmware header version
+ * @fw_version: firmware version reported by the IP block
+ * @feature_version: firmware feature version
+ * @image_size: firmware image size in bytes
+ * @mc_addr: GPU address of the firmware image
+ * @ucode_start_address: ucode start address (SMU firmware only)
+ * @kptr: kernel virtual address of the firmware image
+ * @is_kicker: whether this is a "kicker" (k) firmware variant
  */
 struct cgs_firmware_info {
 	uint16_t		version;
@@ -78,45 +86,6 @@ struct cgs_firmware_info {
 	bool			is_kicker;
 };
 
-typedef unsigned long cgs_handle_t;
-
-/**
- * cgs_read_register() - Read an MMIO register
- * @cgs_device:	opaque device handle
- * @offset:	register offset
- *
- * Return:  register value
- */
-typedef uint32_t (*cgs_read_register_t)(struct cgs_device *cgs_device, unsigned offset);
-
-/**
- * cgs_write_register() - Write an MMIO register
- * @cgs_device:	opaque device handle
- * @offset:	register offset
- * @value:	register value
- */
-typedef void (*cgs_write_register_t)(struct cgs_device *cgs_device, unsigned offset,
-				     uint32_t value);
-
-/**
- * cgs_read_ind_register() - Read an indirect register
- * @cgs_device:	opaque device handle
- * @offset:	register offset
- *
- * Return:  register value
- */
-typedef uint32_t (*cgs_read_ind_register_t)(struct cgs_device *cgs_device, enum cgs_ind_reg space,
-					    unsigned index);
-
-/**
- * cgs_write_ind_register() - Write an indirect register
- * @cgs_device:	opaque device handle
- * @offset:	register offset
- * @value:	register value
- */
-typedef void (*cgs_write_ind_register_t)(struct cgs_device *cgs_device, enum cgs_ind_reg space,
-					 unsigned index, uint32_t value);
-
 #define CGS_REG_FIELD_SHIFT(reg, field) reg##__##field##__SHIFT
 #define CGS_REG_FIELD_MASK(reg, field) reg##__##field##_MASK
 
@@ -133,18 +102,27 @@ typedef void (*cgs_write_ind_register_t)(struct cgs_device *cgs_device, enum cgs
 #define CGS_WREG32_FIELD_IND(device, space, reg, field, val)	\
 	cgs_write_ind_register(device, space, ix##reg, (cgs_read_ind_register(device, space, ix##reg) & ~CGS_REG_FIELD_MASK(reg, field)) | (val) << CGS_REG_FIELD_SHIFT(reg, field))
 
-typedef int (*cgs_get_firmware_info)(struct cgs_device *cgs_device,
-				     enum cgs_ucode_id type,
-				     struct cgs_firmware_info *info);
-
+/**
+ * struct cgs_ops - Common Graphics Services operations
+ * @read_register: read register value
+ * @write_register: write register value
+ * @read_ind_register: read indirect register value
+ * @write_ind_register: write indirect register value
+ * @get_firmware_info: get firmware information
+ */
 struct cgs_ops {
 	/* MMIO access */
-	cgs_read_register_t read_register;
-	cgs_write_register_t write_register;
-	cgs_read_ind_register_t read_ind_register;
-	cgs_write_ind_register_t write_ind_register;
+	uint32_t (*read_register)(struct cgs_device *cgs_device, unsigned int offset);
+	void (*write_register)(struct cgs_device *cgs_device, unsigned int offset,
+			       uint32_t value);
+	uint32_t (*read_ind_register)(struct cgs_device *cgs_device, enum cgs_ind_reg space,
+				      unsigned int index);
+	void (*write_ind_register)(struct cgs_device *cgs_device, enum cgs_ind_reg space,
+				   unsigned int index, uint32_t value);
 	/* Firmware Info */
-	cgs_get_firmware_info get_firmware_info;
+	int (*get_firmware_info)(struct cgs_device *cgs_device,
+				 enum cgs_ucode_id type,
+				 struct cgs_firmware_info *info);
 };
 
 struct cgs_os_ops; /* To be define in OS-specific CGS header */
-- 
2.43.0

