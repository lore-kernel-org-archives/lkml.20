Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239542;
	b=I7chQ3jqkNp1HfmgfXE9GZFb1Vz9mFG42flg91rJZwGpaBd7nNqPJMB/uiQRcExymA9L
	 xkVUNbHa+EK/scfemVbhopyA/hdFOlnSEzMVnt5DNK/AtAbnVRex/YjGZIRCCjzBZND8E
	 zIGJovd/yfKkZ8YU2iWxp3NexXygqMPwg+0g76ySy8JEiYYCFiY0Lfg5KyBMwLLkrTHHj
	 dDJ16AfdDUo2POvBoYTI/zMO8ud8gQK1hG5usXcsez+kdIJKJDGSV5+bwLlWmj6grrjaZ
	 j4n4PmkAiyqWo+goYC7LQDZB8U7r+Rutq3HmLlBJDWgboz8Tnz8mrXAFa6f0nQ4xJig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y58qGbx1bt3ohAjkcIc78J8UW3dBJ8T2wsogW/UvgDY=;
	b=OEBJ5VnrGpFvsSa2NzMdTh55rrW2ZZpQeDvNvUNoAoerifG5jBel2T6qBx4k5ln1+AD2
	 XaG/5zsydnhL+aEPepFdyTmjpzOgr1qRBTqYd6V6z+Uu4VYYxcx5EPQyS41bFBFl41z1B
	 gJD2o6DjaAWbNR8LwnKdDAMA2CNlXvFD7gdiBSzkqPlKsxeSFy6+gWq0e3pSITdxysQ23
	 ufOCCaIcb93ZTUTaQaG9P8sDB95zDzKRhOTw3wu1ecpkWltoa61EYflHkW+cG5YzYGigR
	 RsIiT8eL/cEpFiImDZgW0/MoiioK7vWLEW1rnz4Vc0rdssMyqEmbiw06Am4x4ohRDuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=ZAhudugl;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E73F606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E73F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=ZAhudugl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so12680265e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1794239540; x=1794844340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y58qGbx1bt3ohAjkcIc78J8UW3dBJ8T2wsogW/UvgDY=;
        b=ZAhuduglP4V6Sq5L9NljUG+kywu7Tw+j6bsYVtcHZqa5WEHxIz52rj2q79CMklZPfe
         2W0BGhdOZPufgeBFgNzN3oqrlr828snCTM0VAJVRGpxjvMx0P4voxVUvxg2T7dK9cCjA
         1Ht9rRNqSBRg/j6Ail2uzPy1WfpO1XulAL6f3W35/HH6zGbwWi/01wXKLFGfzE5RSvWs
         mWy3qbH1vx7sP3dM2QsFTBF4YXS8CZnCacHG2Xl2UdEBYSNJy7WgexLFpxvxXowQzc+V
         ue/o5xMURGFWjw4ASuMYsNrwfNBx6wy6zWAbVvtHp7x5BFpd0jvaiR6USk9thmBGeYYv
         INZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239540; x=1794844340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y58qGbx1bt3ohAjkcIc78J8UW3dBJ8T2wsogW/UvgDY=;
        b=B5scN4/7+Yj8gaq/uUl7GUTovLwbLRTzBO8++kQ4Ew9ebTrtWZ3gKgARzwcAMPaHbs
         KkCXyCXyNyhmbRS1c4aniBdCoR2CCidW4HEk5QyY3ntE2Wdx3MC+Y1LDMHauNNNN/fLn
         jaHV/beio2zx+pSmjFdCRz3A7uxcKTjIxv8w8Jz405AIdx9icGMxf23f21w6oB7S6v6w
         MYk+mSBZ5PXZf3z5KICtZa+ludI2WGvCKYpE2Lhg8/7ZRZzSn7dOkOlOgb4x4E4+60E/
         MALOwE4wTNjpNQkaYnwhvE9gE6WyJ13mf2l32EK/Rpn7TL5vpqfgsiUIkVZ75g6T8uTQ
         wkuw==
X-Forwarded-Encrypted: i=1; AL+hErFco2JVmGowaNYKbN8U75NXwH+GuSOIn0h75o3lJg7fTpSncw18RQhr+cu/TS/6XCiyodJ/zkG6TgufO/0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kFxd3/G4ANasY28zu9awqFcK2P3SfeuOWwwlG+i6OsdGigXSN
	LCgvH9ECXVgJa/HJwSsoNHasQfCzzG9FTQD6+CrXPFMxpGg5on0Km5a5OSoH8ocGrZI=
X-Gm-Gg: AYBFou3QA/jtFDnfJbJdDz5XewpIxZV3xkdhr0G+38FzmZ4VdeoL5iz3jfaPSzb+r1K
	Ta+RoABz5Fmeu+3LMwtWGwUh2cWmB5n54KvuIoSxuHrizy2OXxsM2bygnwTmrSUzBRtr01hDeeG
	KhIvvqqqP6h6dwpl/hDIj9Jl8wi67r5YBSweFCkvTYXVH2vYnl+kNAlEbOJuF4YUS1H+fwfI2tR
	mkTlTr67GJgyxm4NozL00MmHFO+0Zrk4tvt0bGDK5Sv5PdUhKNOsAIHlokjfafoykWo4IWoaEgz
	TUOx40Pcrj8uqHPe1Hmuz9i2laFKw0cb+OQSwYfSpg1Fjqz9aixmxJbQ1K2FtSG80Ey5rlM9lal
	so8MyF46GioOGotT0+hbB1dp8OeD0j6nQ2DT7SeR340wyd7Wp/zkn0+CtDt8G8iIxyuj/DlJLal
	g0byPJe2vCTtnj6+qJuGBlxBZQlroTDpZNCVh9k7SEcadQfdIbKmSxQWF3jhS9aYyU5hW1fGQSF
	xmW3Ge21YBxivEiqYmFP/gTVzkH2GpIcGbh7GyYEEUc2rnykLM8BPz7qenzXLVI84tGkszjel63
	OLJOhNVeH9p+l3b0rH1/Ue2S
X-Received: by 2002:a05:600c:4eca:b0:4a2:5267:3cd4 with SMTP id 5b1f17b1804b1-4b94d762f4dmr78506415e9.3.1794239540400;
        Mon, 09 Nov 2026 07:52:20 -0800 (PST)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b9f93c04afsm91196685e9.3.2026.11.09.07.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:52:19 -0800 (PST)
From: Andrey Misiurov <amisiurov@cloudlinux.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] drm/radeon: Bound GPIO I2C table entry count from VBIOS
Date: Mon,  9 Nov 2026 16:52:15 +0100
Message-ID: <20261109155215.3946844-1-amisiurov@cloudlinux.com>
X-Mailer: git-send-email 2.43.7
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

radeon_atombios_i2c_init() derives the number of GPIO I2C entries from
the size field of the VBIOS GPIO_I2C_Info table and stores a bus for
every valid entry in rdev->i2c_bus[i], which has RADEON_MAX_I2C_BUS
(16) slots.  A table that claims more than 16 entries makes it write
past the end of the array into the rest of struct radeon_device.  A
size smaller than the common header wraps the subtraction and the loop
walks far past the table.  radeon_lookup_i2c_gpio() uses the same
calculation.

Reject undersized tables and cap the entry count at
RADEON_MAX_I2C_BUS.

Fixes: f376b94fbc0a ("drm/radeon/kms: unify i2c handling")
Cc: stable@vger.kernel.org
Signed-off-by: Andrey Misiurov <amisiurov@cloudlinux.com>
---
Found by code inspection.  Not reproduced at runtime; it needs a VBIOS
with a malformed GPIO_I2C_Info table.

 drivers/gpu/drm/radeon/radeon_atombios.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
index 3dd9724..c4e1272 100644
--- a/drivers/gpu/drm/radeon/radeon_atombios.c
+++ b/drivers/gpu/drm/radeon/radeon_atombios.c
@@ -125,6 +125,22 @@ static struct radeon_i2c_bus_rec radeon_get_bus_rec_for_i2c_gpio(ATOM_GPIO_I2C_A
 	return i2c;
 }
 
+/*
+ * The VBIOS table size is not checked against the image; cap the
+ * entry count to RADEON_MAX_I2C_BUS, the size of rdev->i2c_bus[].
+ */
+static int radeon_atombios_gpio_i2c_num_entries(uint16_t size)
+{
+	u32 bytes;
+
+	if (size < sizeof(ATOM_COMMON_TABLE_HEADER))
+		return 0;
+
+	bytes = size - sizeof(ATOM_COMMON_TABLE_HEADER);
+	return min_t(u32, bytes / sizeof(ATOM_GPIO_I2C_ASSIGMENT),
+		     RADEON_MAX_I2C_BUS);
+}
+
 static struct radeon_i2c_bus_rec radeon_lookup_i2c_gpio(struct radeon_device *rdev,
 							       uint8_t id)
 {
@@ -142,8 +158,7 @@ static struct radeon_i2c_bus_rec radeon_lookup_i2c_gpio(struct radeon_device *rd
 	if (atom_parse_data_header(ctx, index, &size, NULL, NULL, &data_offset)) {
 		i2c_info = (struct _ATOM_GPIO_I2C_INFO *)(ctx->bios + data_offset);
 
-		num_indices = (size - sizeof(ATOM_COMMON_TABLE_HEADER)) /
-			sizeof(ATOM_GPIO_I2C_ASSIGMENT);
+		num_indices = radeon_atombios_gpio_i2c_num_entries(size);
 
 		gpio = &i2c_info->asGPIO_Info[0];
 		for (i = 0; i < num_indices; i++) {
@@ -176,8 +191,7 @@ void radeon_atombios_i2c_init(struct radeon_device *rdev)
 	if (atom_parse_data_header(ctx, index, &size, NULL, NULL, &data_offset)) {
 		i2c_info = (struct _ATOM_GPIO_I2C_INFO *)(ctx->bios + data_offset);
 
-		num_indices = (size - sizeof(ATOM_COMMON_TABLE_HEADER)) /
-			sizeof(ATOM_GPIO_I2C_ASSIGMENT);
+		num_indices = radeon_atombios_gpio_i2c_num_entries(size);
 
 		gpio = &i2c_info->asGPIO_Info[0];
 		for (i = 0; i < num_indices; i++) {
-- 
2.43.7

