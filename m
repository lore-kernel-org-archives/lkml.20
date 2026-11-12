Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460178;
	b=09g3V/ysswjub52VUuuip5lC6KG7RAp8TIh2N6pqz3SyxddkYPsskHJyGqqET/3z7Q+N
	 H631hFHcwHFjaDhkcZUCdlVDx2LBF8xAwMqlV//tJGv0Czqvb6hIMhYTyio/pwz40a2dX
	 P59gULALErvCesgv4E3fC8M5JbFEU20IElDl7OaqymfXwJuiM7A+VtCLVSw2B5Wpi72TS
	 ndGJA3aNEiTOXay0lj3OqdYZFyfEyJDy6lxo4RP5N1R4Rmvums15PvgMA3nOQtEHJSKYR
	 EUyJMazT7e5r3/G8Da7+fjJuoRgCzShilDF51YzfotddxHVrW1mIs2DRHAjSX2LPtxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GX4UBF4+o9VP0UVeZf0hRho2t5z7boGHcIQ9wJV6Itc=;
	b=uu0MWr7OLu3h4KQ20xaVYeNY3nAa1y/Pnm1SVA+Z3AzKuD+aulPWauX89GdqoBFdKGcx
	 NFyh1t1YszqN77BsN25bb6Ud9CrqkpPxhSr5uafO2x5uuawYu3GaM6Ofx4PyjSxWhX8L5
	 s6T7t0xEOluyjQy9uciCV9XS8+xk0b07JXavEPWb72HElBCK92RQJyaedGbvB39UAunby
	 RCDI5OyLkAPR3OECQ4FwAyryb3QWgi2/1C8QfofsSZ6tKrQe/yk/Xz9Sa5RRAKnvL8BG4
	 U5KDddhpn2v0S3y/d4HNgMeIKlVzy+oIHdnZjjmKdP1Zijxkhi22hImnLHCK4Tj7Vew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uvEgGSAJ;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B82606A324
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0B82606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uvEgGSAJ
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3704d30b84fso4943560eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794460177; x=1795064977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GX4UBF4+o9VP0UVeZf0hRho2t5z7boGHcIQ9wJV6Itc=;
        b=uvEgGSAJdPlE+0MbfNEHzpFg9qOC+Z5pg1ohg/tyFdZoj3SQRH/5iqUEQFcL0J/EqF
         BLqPwIeXiU9TnULiEHHHKOp4U/IbJOcVeFMEgXf2eF5Z3idUzzH/GIJSeRsRdURcSmN+
         A0yoqh2Y1JyYYTcVH4chUFmZwMcqEs2s2QTZB821tlZo85XR/5uXGHOhcC93i9q/FR0E
         eR1DUNR2zRvulBBzCuBc/R2ZS/GVV5aeV+mK/iNV221j91cfyTbZNjtBkNIAER/JzCvI
         4KujnxLVtVVraJ93Mm4qhyfJIn6B6TgREMaCD+ywiIjYjlKRx/6xNuXHB0vIExJpW43X
         aNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460177; x=1795064977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GX4UBF4+o9VP0UVeZf0hRho2t5z7boGHcIQ9wJV6Itc=;
        b=IftJtSzpMT6JYU4K6+QCH9e6KBKoqWLNEReIlXiZ5ExuWNPP/R/jsO+TSvKFMsYmze
         oQAgyOC6jbka0eK62SheWXH9SC+lKe8MYMDI2Ri77ylaRRLefUddmnh2ocq4rJ5YVbSj
         5SJ5S8o/K43Nof2pzK6k0i0sl+sYWMdqbVSBH1LyyWMsP9ryaen7j/9uRrvNtvMbyXmm
         rArE8DjKzaqtgh/H+2oJ5AdtKt3jIbrli47ThBb1ZfE1gqpF2YXL4jUD2/9GdcJEbFKI
         F9IDq9rQx3AncHaIGYImL6g6TvZ4XwFToEmM/xSoiQw5O0U1QGKr3h2kPh5qmRzuEsXc
         B+eg==
X-Forwarded-Encrypted: i=1; AL+hErGJQOR64DV0T5gsfXYGzoUhHZCgTLKb4dWuYG2cGpqOP3k/605mV/RRRHXGWLGj8dh/M1REipw4cdLMlko=@vger.kernel.org
X-Gm-Message-State: APuU4Z8E5D/QW6RMdb29bze4V6hyo0lZDBbbcH44dGMRANObVSJyzV5L
	HMzZkdf0ucWGsMiQw4kgCXgq1xqSyNje3yWg9P6g9IA/dWfPSpgP3ioB
X-Gm-Gg: AYBFou3k8N6ZPLRMVJiyIcoimudTk8RVC0I6sSUK1KlP+hjjsww2IZjV8mpCHNSmRJK
	xs9/gpBPwO+fZIPi60x6QXCdfFR+K1ISocYevQMNQPTIGl8Hx6UPJFaQTcRqtMqJMj/tZzVSJQ8
	LrIXEp5/9IpoxVj8xjjb2t8eaNbN11qLNP7Tw7q2KosjVWdfHn0yUNun4ShWM+iFPukw0fBERPu
	C7v7tHhZiyNsLvByK1NwMbhGS/p8Cy9If4pzNoXUPShbytdYAYGfrFQgfJu1x8B2hn/LNIGaMcu
	58tK+WbMl4qy+rXe1NJy78rJ7OtVWw+5+T4t5/PIFdL+gK+dGVTes7BVwDlu8kwPtm74iJi3Lf4
	6C6pHacsehWbcQpmwRD6FRpiJdxPAmOpCn1eAT6B0Afyf8+8/LZVYjLDWUYfxuQUegjoTcB/yIB
	qJYoQhie/WgYyk5LX2bN7DF53ZvZ1rY3qJ7USehnT9uRgjP2ZAi9py093PgHxjh4bKW0Tajns+W
	5lBwz3Vi5PVlpuWG+ZPU7GqyN1E92sVb4F3fqX44fVM1uG7E21S4bPAduG23sUv8vadJqyH+4Ek
	fKw9KGwDWfYo6Ztpv5zkER/hFEZZ3yJW6pv8FcD9RW/jPaICC0XVQUE=
X-Received: by 2002:a05:7300:d404:b0:372:32a1:b384 with SMTP id 5a478bee46e88-3768695036dmr4937182eec.33.1794460176694;
        Wed, 11 Nov 2026 21:09:36 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:37ea:9b2d:3d7a:8379])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520608b52sm19537627eec.13.2026.11.11.21.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:09:36 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-kernel@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Subject: [PATCH] wifi: brcm80211: move the USB bootloader definitions to a shared header
Date: Thu, 12 Nov 2026 13:08:15 +0800
Message-ID: <20261112050816.2795512-1-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The Broadcom USB bootloader downloads firmware the same way for other
USB chips than the FullMAC ones of brcmfmac.  Move its commands, states,
firmware header and response layouts from brcmfmac's usb.c to a header
in the shared include directory, so that other drivers can use them.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
In preparation for the brcmbmac driver.

 .../broadcom/brcm80211/brcmfmac/usb.c         | 68 +---------------
 .../broadcom/brcm80211/include/brcm_usb_rdl.h | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+), 67 deletions(-)
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/include/brcm_usb_rdl.h

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
index b41949a9bd..e48f064682 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
@@ -12,6 +12,7 @@
 #include <brcmu_utils.h>
 #include <brcm_hw_ids.h>
 #include <brcmu_wifi.h>
+#include <brcm_usb_rdl.h>
 #include "bus.h"
 #include "debug.h"
 #include "firmware.h"
@@ -26,8 +27,6 @@
 #define BRCMF_USB_RESET_GETVER_SPINWAIT	100	/* in unit of ms */
 #define BRCMF_USB_RESET_GETVER_LOOP_CNT	10
 
-#define BRCMF_POSTBOOT_ID		0xA123  /* ID to detect if dongle
-						   has boot up */
 #define BRCMF_USB_NRXQ			50
 #define BRCMF_USB_NTXQ			50
 
@@ -52,71 +51,6 @@ static const struct brcmf_firmware_mapping brcmf_usb_fwnames[] = {
 	BRCMF_FW_ENTRY(CY_CC_4373_CHIP_ID, 0xFFFFFFFF, 4373)
 };
 
-#define TRX_MAGIC		0x30524448	/* "HDR0" */
-#define TRX_MAX_OFFSET		3		/* Max number of file offsets */
-#define TRX_UNCOMP_IMAGE	0x20		/* Trx holds uncompressed img */
-#define TRX_RDL_CHUNK		1500		/* size of each dl transfer */
-#define TRX_OFFSETS_DLFWLEN_IDX	0
-
-/* Control messages: bRequest values */
-#define DL_GETSTATE	0	/* returns the rdl_state_t struct */
-#define DL_CHECK_CRC	1	/* currently unused */
-#define DL_GO		2	/* execute downloaded image */
-#define DL_START	3	/* initialize dl state */
-#define DL_REBOOT	4	/* reboot the device in 2 seconds */
-#define DL_GETVER	5	/* returns the bootrom_id_t struct */
-#define DL_GO_PROTECTED	6	/* execute the downloaded code and set reset
-				 * event to occur in 2 seconds.  It is the
-				 * responsibility of the downloaded code to
-				 * clear this event
-				 */
-#define DL_EXEC		7	/* jump to a supplied address */
-#define DL_RESETCFG	8	/* To support single enum on dongle
-				 * - Not used by bootloader
-				 */
-#define DL_DEFER_RESP_OK 9	/* Potentially defer the response to setup
-				 * if resp unavailable
-				 */
-
-/* states */
-#define DL_WAITING	0	/* waiting to rx first pkt */
-#define DL_READY	1	/* hdr was good, waiting for more of the
-				 * compressed image
-				 */
-#define DL_BAD_HDR	2	/* hdr was corrupted */
-#define DL_BAD_CRC	3	/* compressed image was corrupted */
-#define DL_RUNNABLE	4	/* download was successful,waiting for go cmd */
-#define DL_START_FAIL	5	/* failed to initialize correctly */
-#define DL_NVRAM_TOOBIG	6	/* host specified nvram data exceeds DL_NVRAM
-				 * value
-				 */
-#define DL_IMAGE_TOOBIG	7	/* firmware image too big */
-
-
-struct trx_header_le {
-	__le32 magic;		/* "HDR0" */
-	__le32 len;		/* Length of file including header */
-	__le32 crc32;		/* CRC from flag_version to end of file */
-	__le32 flag_version;	/* 0:15 flags, 16:31 version */
-	__le32 offsets[TRX_MAX_OFFSET];	/* Offsets of partitions from start of
-					 * header
-					 */
-};
-
-struct rdl_state_le {
-	__le32 state;
-	__le32 bytes;
-};
-
-struct bootrom_id_le {
-	__le32 chip;		/* Chip id */
-	__le32 chiprev;		/* Chip rev */
-	__le32 ramsize;		/* Size of  RAM */
-	__le32 remapbase;	/* Current remap base address */
-	__le32 boardtype;	/* Type of board */
-	__le32 boardrev;	/* Board revision */
-};
-
 struct brcmf_usbdev_info {
 	struct brcmf_usbdev bus_pub; /* MUST BE FIRST */
 	spinlock_t qlock;
diff --git a/drivers/net/wireless/broadcom/brcm80211/include/brcm_usb_rdl.h b/drivers/net/wireless/broadcom/brcm80211/include/brcm_usb_rdl.h
new file mode 100644
index 0000000000..bf6665d33f
--- /dev/null
+++ b/drivers/net/wireless/broadcom/brcm80211/include/brcm_usb_rdl.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: ISC */
+/*
+ * Copyright (c) 2011 Broadcom Corporation
+ */
+
+#ifndef	_BRCM_USB_RDL_H_
+#define	_BRCM_USB_RDL_H_
+
+#include <linux/types.h>
+
+#define BRCMF_POSTBOOT_ID		0xA123  /* ID to detect if dongle
+						   has boot up */
+
+#define TRX_MAGIC		0x30524448	/* "HDR0" */
+#define TRX_MAX_OFFSET		3		/* Max number of file offsets */
+#define TRX_UNCOMP_IMAGE	0x20		/* Trx holds uncompressed img */
+#define TRX_RDL_CHUNK		1500		/* size of each dl transfer */
+#define TRX_OFFSETS_DLFWLEN_IDX	0
+
+/* Control messages: bRequest values */
+#define DL_GETSTATE	0	/* returns the rdl_state_t struct */
+#define DL_CHECK_CRC	1	/* currently unused */
+#define DL_GO		2	/* execute downloaded image */
+#define DL_START	3	/* initialize dl state */
+#define DL_REBOOT	4	/* reboot the device in 2 seconds */
+#define DL_GETVER	5	/* returns the bootrom_id_t struct */
+#define DL_GO_PROTECTED	6	/* execute the downloaded code and set reset
+				 * event to occur in 2 seconds.  It is the
+				 * responsibility of the downloaded code to
+				 * clear this event
+				 */
+#define DL_EXEC		7	/* jump to a supplied address */
+#define DL_RESETCFG	8	/* To support single enum on dongle
+				 * - Not used by bootloader
+				 */
+#define DL_DEFER_RESP_OK 9	/* Potentially defer the response to setup
+				 * if resp unavailable
+				 */
+
+/* states */
+#define DL_WAITING	0	/* waiting to rx first pkt */
+#define DL_READY	1	/* hdr was good, waiting for more of the
+				 * compressed image
+				 */
+#define DL_BAD_HDR	2	/* hdr was corrupted */
+#define DL_BAD_CRC	3	/* compressed image was corrupted */
+#define DL_RUNNABLE	4	/* download was successful,waiting for go cmd */
+#define DL_START_FAIL	5	/* failed to initialize correctly */
+#define DL_NVRAM_TOOBIG	6	/* host specified nvram data exceeds DL_NVRAM
+				 * value
+				 */
+#define DL_IMAGE_TOOBIG	7	/* firmware image too big */
+
+struct trx_header_le {
+	__le32 magic;		/* "HDR0" */
+	__le32 len;		/* Length of file including header */
+	__le32 crc32;		/* CRC from flag_version to end of file */
+	__le32 flag_version;	/* 0:15 flags, 16:31 version */
+	__le32 offsets[TRX_MAX_OFFSET];	/* Offsets of partitions from start of
+					 * header
+					 */
+};
+
+struct rdl_state_le {
+	__le32 state;
+	__le32 bytes;
+};
+
+struct bootrom_id_le {
+	__le32 chip;		/* Chip id */
+	__le32 chiprev;		/* Chip rev */
+	__le32 ramsize;		/* Size of  RAM */
+	__le32 remapbase;	/* Current remap base address */
+	__le32 boardtype;	/* Type of board */
+	__le32 boardrev;	/* Board revision */
+};
+
+#endif /* _BRCM_USB_RDL_H_ */
-- 
2.53.0

