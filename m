Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794784928;
	b=aWwW3iZpbXXZkQ2cuqux+nYY8mDaxQ3If8d1idtoOic+agi1GqBKASMmVyNYLfrTRpue
	 iy+0RdLGLKQTW/V2WH9HUelO5AhKD7czEMnqMUJyvsHNhOlmjUf4PmIeznoZ91glszCK0
	 DDykrfSbKZsuQ8lvqE8uY01qYb+oXUm22sMQmqs7k+vE85rQDiIj855R9vjlbLB+n62a3
	 9CzD2BoJ/rGj+uXAowwwVB9iHNDYSa+4q+PJoEnDQqLYgw+PBPGMIM56wnfDNqhl2nNyX
	 9i7BVRXc8spNK7cYxSorLoCJTchWoCxc/rg+O1NkeWNOPzqyd+C2oLJMDN5nZCzrl5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794784928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=QRwRXLM89UnoOEjo9EGn9AE3PBFxJ1gHBO963ekwGoI=;
	b=RufvPd+dszCeMqCrdEYZk8Kgq0s/YACsszA2iDeb29PVAr9NTwGZmJs59wrXi9ByB1Cw
	 SpOXV3kZnzL/cDKXg/FbTC3YStyQ29mJMKgVbGI2wKlZvwWb3An0XA9rK3RCogVG+f8u0
	 hl2vO/CxZx/jQ0c+2h6MnkOr9vAQ5XCLE3wmfTUJRCFKv0/Lp3OrjXCxhfnmrmQrrmFFf
	 8Qp1PallgXcTTfWAO8wQsQvdgX4MPy/KYCRQqBHu1qwe3gwJuPAXLzoUgDhsI00Lm+0oC
	 XYE6CkxlkRLUyrlkdkkPKBPqx1qZZsjY0RormxWzEe8L4AJ/J0YjE8/VivCdk6vlHjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="o/6V3BP7";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E7E606A33B
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12E7E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o/6V3BP7
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso30652065e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794784926; x=1795389726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QRwRXLM89UnoOEjo9EGn9AE3PBFxJ1gHBO963ekwGoI=;
        b=o/6V3BP7v5SqnH1VMrlr9rDsiLCgYQkmDJYbwXeHupyhuyuO8FxJKs4J4oRBJTuahd
         8yR24EZfPEELwq0Bq0FO8AYs3S0G+l6VCrCt5h4xOQxnWTYBwLZJPTuS9HgZs9qwESLc
         P/Fj6Z2c3eK7sQHAS4znS6iquVAba4meny19Lx+usXHCVRbMMoHBoPz+pZ6RtTdcd52n
         brs9VdafYl1dr+gkdU/jzM8i8eZtfTCFWTEUTvP+rgnygfCm7YEmlP1RURSsmxiJ8Xhc
         kKkA7LZe/uHCaEMA/JaLARIehM5x97zazZ5XzwIHl3kDoista8BIOTFwyCWI4BtXOVGD
         6s9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794784926; x=1795389726;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRwRXLM89UnoOEjo9EGn9AE3PBFxJ1gHBO963ekwGoI=;
        b=Xjh8I4TGgrtS+sSwgiIBMjgie2chG40E6ypE6q8W9LoJJyNy4OOpH+g/P3ZZZ4igq6
         Etmk/x+yonMos5awmbytmLcqmkn7jDPzfTmr1pCTIe6rKOQ1cBEQ6E0WgH6G8ACuMb68
         dxZ7TtDgxB1jh+tksFFiKdHvUtRttH1O0HaAtTFw2s49SgmFQS5jY19PgrUUBdFuOnOm
         b/3MML4M01NotqNbIxDUlrmQIEXDL1ghCQ3/PRnziHsA8S8o9wtg0utDk4ctiydrbfyW
         2Rd1/KKOz7iQOSZrwL1EL5MOOEC8ltkh8fInvMn0l15SO0biZrBtVpsRCGmrimA4Bya1
         TiRQ==
X-Forwarded-Encrypted: i=1; AL+hErHtC4ZiQtyvULOGl0ZXBK9W+bV9xfmnDEogA2uWljDK1NloT+0YPM0HR1F+k7Pb9JvTSycX2wjQt1e8oI4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QVGeOR/a3ZCet1P1kvnluG245cHkbOz9YQwcKQXizFj/EGjMC
	CTECzK935ljbpl27yCBZ6mrQTxI0+SZ9M2iUAy1EuPIQjAXZYOu2iZQj
X-Gm-Gg: AYBFou1dIi0mErCkIoIuLbeh8Wqw3/iVebPvyriQsJZez8rW5B0CX9a0Im+2neloe7O
	WbAxBlJKvVPtKpK/wVVlHtCLsi4V0588natXz2tgUnYaROkfTW1mpNVHjx1FRAux5XzEddA39Tp
	WPy7j+XvYKhdtLhFUiTevTuWodBmlqslektvYJtcs5qu8zlo22dgunURFXRN5vHyKPak4mcaoQt
	oKmk7iNqsigQpAUcvKDd0a8J0eKe2Yvbr5af+WBS2+RL9AQvvOa9l0lgveRs8IGa85ySNfmX3gV
	yZVexkl3+dOgOzvKv+ra0eoQ0yjhYwcNLR1GoQ+mscP26C5LKv8xDVUnEI8lqsYtEd9A4zKYql1
	pRF3S4f6p/b81V+Q3mbFF9V+4iWM/th8EGDx2eF5y8/E+1KyVTm8D0HlndUxWyXOHf1jhCfPB7e
	a5QiXlxsq6/g3GbH92s+j0Yn0WHImA7+KghquYIBOqF7lodB/Z2p3AqWcatm3S+xiEYN2BJDXcb
	LVxgEzrzpaxB3jD12Ul9nWl6T4Pao2t1GD0iSjhzKt10NPbkqe8aTX94P3jcJnMD1eq1DqfEur2
	hRg0tZeLcmQusuCLGgKSra/CpWO/meU29YVdMDctnjyZ1w/yDQjbhac=
X-Received: by 2002:a05:600c:19d2:b0:4bb:60bd:53b2 with SMTP id 5b1f17b1804b1-4bb60bd55eamr134252235e9.6.1794784926397;
        Sun, 15 Nov 2026 15:22:06 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f976esm127920955e9.3.2026.11.15.15.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 15:22:06 -0800 (PST)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Helge Deller <deller@gmx.de>,
	Peter Jones <pjones@redhat.com>
Cc: Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	linux-efi@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/6] efi: bgrt: add accessors for the boot graphics
Date: Mon, 16 Nov 2026 01:21:52 +0100
Message-Id: <20261116002156.1027726-3-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261116002156.1027726-1-maximpedraza@gmail.com>
References: <20261116002156.1027726-1-maximpedraza@gmail.com>
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

The DRM splash client shows the boot graphics the firmware left behind,
and needs the image address and size, its offsets and the status bits.
Reading them from bgrt_tab and bgrt_image_size works with drm_client_lib
built in, but it can be a module, and neither is exported:

  ERROR: modpost: drivers/gpu/drm/clients/drm_client_lib.ko: symbol 'bgrt_tab' undefined!
  ERROR: modpost: drivers/gpu/drm/clients/drm_client_lib.ko: symbol 'bgrt_image_size' undefined!

Rather than export the data, add an accessor for each of them, exported
GPL only, with stubs in efi-bgrt.h for CONFIG_ACPI_BGRT=n so that users
need no #ifdef of their own. The variables stay global for
drivers/acpi/bgrt.c, and are only written by efi_bgrt_init(): mark them
__ro_after_init.

The table gives the image address as a u64. efi_bgrt_has_image() only
says yes when phys_addr_t can hold it, and the address and size are 0
when it says no, so that they never disagree on kernels with 32-bit
physical addresses.

Reported-by: Mario Limonciello <mario.limonciello@amd.com>
Closes: https://lore.kernel.org/dri-devel/5d7067de-97b7-4232-9cf6-e4b978696482@amd.com/
Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/firmware/efi/efi-bgrt.c | 76 ++++++++++++++++++++++++++++++++-
 include/linux/efi-bgrt.h        | 39 ++++++++++++++++-
 2 files changed, 112 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/efi/efi-bgrt.c b/drivers/firmware/efi/efi-bgrt.c
index 1da451582812..8f5f5edf5ede 100644
--- a/drivers/firmware/efi/efi-bgrt.c
+++ b/drivers/firmware/efi/efi-bgrt.c
@@ -16,8 +16,8 @@
 #include <linux/efi.h>
 #include <linux/efi-bgrt.h>
 
-struct acpi_table_bgrt bgrt_tab;
-size_t bgrt_image_size;
+struct acpi_table_bgrt bgrt_tab __ro_after_init;
+size_t bgrt_image_size __ro_after_init;
 
 struct bmp_header {
 	u16 id;
@@ -89,3 +89,75 @@ void __init efi_bgrt_init(struct acpi_table_header *table)
 out:
 	memset(bgrt, 0, sizeof(bgrt_tab));
 }
+
+/**
+ * efi_bgrt_has_image() - Whether the firmware left a boot graphic
+ *
+ * Return: true if the BGRT points at a BMP image, which efi_bgrt_init()
+ * checked and reserved, at an address that phys_addr_t can hold. The
+ * other accessors only mean something when it returns true.
+ */
+bool efi_bgrt_has_image(void)
+{
+	return bgrt_tab.image_address &&
+	       bgrt_tab.image_address == (phys_addr_t)bgrt_tab.image_address;
+}
+EXPORT_SYMBOL_GPL(efi_bgrt_has_image);
+
+/**
+ * efi_bgrt_image_address() - Physical address of the boot graphic
+ *
+ * Return: the address of the BMP image, or 0 if there is none.
+ */
+phys_addr_t efi_bgrt_image_address(void)
+{
+	return efi_bgrt_has_image() ? bgrt_tab.image_address : 0;
+}
+EXPORT_SYMBOL_GPL(efi_bgrt_image_address);
+
+/**
+ * efi_bgrt_image_size() - Size of the boot graphic
+ *
+ * Return: the size of the BMP image, as its header gives it, or 0 if there
+ * is none.
+ */
+size_t efi_bgrt_image_size(void)
+{
+	return efi_bgrt_has_image() ? bgrt_image_size : 0;
+}
+EXPORT_SYMBOL_GPL(efi_bgrt_image_size);
+
+/**
+ * efi_bgrt_status() - Status field of the BGRT
+ *
+ * Return: the status byte. Bit 0 tells whether the image is still on
+ * screen and, since ACPI 6.2, bits 1-2 how far it has to be turned to show
+ * upright (ACPI_BGRT_ORIENTATION_OFFSET).
+ */
+u8 efi_bgrt_status(void)
+{
+	return bgrt_tab.status;
+}
+EXPORT_SYMBOL_GPL(efi_bgrt_status);
+
+/**
+ * efi_bgrt_image_offset_x() - Horizontal position of the boot graphic
+ *
+ * Return: the X offset, in pixels, at which the firmware drew the image.
+ */
+u32 efi_bgrt_image_offset_x(void)
+{
+	return bgrt_tab.image_offset_x;
+}
+EXPORT_SYMBOL_GPL(efi_bgrt_image_offset_x);
+
+/**
+ * efi_bgrt_image_offset_y() - Vertical position of the boot graphic
+ *
+ * Return: the Y offset, in pixels, at which the firmware drew the image.
+ */
+u32 efi_bgrt_image_offset_y(void)
+{
+	return bgrt_tab.image_offset_y;
+}
+EXPORT_SYMBOL_GPL(efi_bgrt_image_offset_y);
diff --git a/include/linux/efi-bgrt.h b/include/linux/efi-bgrt.h
index e6cd51005633..1c287e5fd388 100644
--- a/include/linux/efi-bgrt.h
+++ b/include/linux/efi-bgrt.h
@@ -9,7 +9,14 @@
 void efi_bgrt_init(struct acpi_table_header *table);
 int __init acpi_parse_bgrt(struct acpi_table_header *table);
 
-/* The BGRT data itself; only valid if bgrt_image != NULL. */
+bool efi_bgrt_has_image(void);
+phys_addr_t efi_bgrt_image_address(void);
+size_t efi_bgrt_image_size(void);
+u8 efi_bgrt_status(void);
+u32 efi_bgrt_image_offset_x(void);
+u32 efi_bgrt_image_offset_y(void);
+
+/* The BGRT data itself; only valid if efi_bgrt_has_image(). */
 extern size_t bgrt_image_size;
 extern struct acpi_table_bgrt bgrt_tab;
 
@@ -21,6 +28,36 @@ static inline int __init acpi_parse_bgrt(struct acpi_table_header *table)
 	return 0;
 }
 
+static inline bool efi_bgrt_has_image(void)
+{
+	return false;
+}
+
+static inline phys_addr_t efi_bgrt_image_address(void)
+{
+	return 0;
+}
+
+static inline size_t efi_bgrt_image_size(void)
+{
+	return 0;
+}
+
+static inline u8 efi_bgrt_status(void)
+{
+	return 0;
+}
+
+static inline u32 efi_bgrt_image_offset_x(void)
+{
+	return 0;
+}
+
+static inline u32 efi_bgrt_image_offset_y(void)
+{
+	return 0;
+}
+
 #endif /* !CONFIG_ACPI_BGRT */
 
 #endif /* _LINUX_EFI_BGRT_H */
-- 
2.39.5

