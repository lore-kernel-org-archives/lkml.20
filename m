Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794433730;
	b=S4xWoshu58Fx1eUtMTvCJZ52fHaOWySEiZx/TuwxfYXveQNcXEZ9qo68sGxTy4LtxUBp
	 Ddx/MUXUf5qBfe4AnrNwQrTOvBWk9uzq+2zf9Ehbezl83Yx2bDzNRfh9ciWxUHyyRcjcT
	 XxeYJ+jUhWbn0+MmW+i4qxExfxwt0WlnSdpGGTg/C+yOUP9w8Mx4oN6Kh/HOCtgCx7zG0
	 bYR9kx4FUPkpVgOtJWyE59xWMb8a2SCcF3g1SAnmJ6B3HldqX44xWlcFfaocG7om2v0l0
	 VPk1Th1Fk6syf1HjGppzd+9lr1KrhJO9HpqmQ2Vdyi3+D28bAYLaFMyKX05VGHaYyjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=in2H/EiTzu7oKMx0oXEGmqlnXShESJ9rcbe+oDUN+Fs=;
	b=pL5HKLZGu4FmINlHDOub9rjoov4mYPWT6JgG9jNy7ib5umRviZGa9TE0JHRFLvQ1z1sg
	 DfdAQieZMoId9Hi/yNRMJYRepthXOe5mOqwhDWfdtKTQET2pCIg5hOZwmg6bdGgLGsKVW
	 abM/KDqh+SY5qbncroTUnPJ5FTLJk30xqYrUQsKz7RxIwzzl80Nuggg258MUiOaGvpnTE
	 WiMAOhbLWTCm9BiBC/WhLq294P6wjuxDZDyISPLdAkBnRTqMMViFcK/qvMtFtKuWPjspv
	 9DwpJtH8hUOlaC0UunKvxwRdSuMDE6/3YjC+CzlmJUaxU6OW3VQYglmX+mFy2g03x3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MF0INbu5;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C8E606A888
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6C8E606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MF0INbu5
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so2263283a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794433729; x=1795038529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=in2H/EiTzu7oKMx0oXEGmqlnXShESJ9rcbe+oDUN+Fs=;
        b=MF0INbu5MaaNPwlPqfOGFWmfOBBlMsgwfTX9yqoOQukKszhiLhWsvensSmgg5EwMX0
         6xHhym5nnd39YYfADosiSRok6GnimKHgUbRgwEvwTzSdhR9TwY1aFdZy3PAvbHfDkxf4
         fwIbFP0hBOGfh5wEfRpIlV6YGjnwXsaDvaK34MsthoCLKaD9NkCqZlwMQdJ+xA8tT0qv
         l7Jmm2K6lqcavReO4u+S/hvMvGBUxKnCOEBaAmFlifxfixKEhojKyoJmNVskhij0z665
         iWs560WG4BQFURNTTvXOqXp0L9jbbhNh/EWEizzJs9SE4kU1tr5CPbxOfcCqT+FEy8i5
         vkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794433729; x=1795038529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=in2H/EiTzu7oKMx0oXEGmqlnXShESJ9rcbe+oDUN+Fs=;
        b=FW3pwaf+IkaLlUOyvUHBSomTBJJ+RCTuruWHSPm5OerB9tg/bzZMKflwAaAb9TtJds
         cA8IXGMVvT15vKi68UdAofNJ341Co0a2jmINBbmRXLgIi3mQ+ya2mjmVtyejL6vFpQsw
         zaIwkdbLrrFf4nV9RqmNvk4X1oBw6Zycn//SQnG90rPz+wkrWag+t697IJQMK3PAp7xx
         Qd/5r4Lk39VA/3veNcKNdYvt7zk5BRD8pKQK03Fy8J8Tbgv7nJaUR7GgYteMjNckBHQn
         VYoy++KLdra+uJ/d8IBq46ikI6TNtO7cjtDkE0pauw49D0YyLDzmuwYo0lrOk1oNwW8P
         2OLg==
X-Forwarded-Encrypted: i=1; AL+hErH1Rm3gGQJovIfsXuk5q/DlVhds8LzxKXxh385LDGQf/zO2u3DOdrHhRq+eHdCHY2uv4pAa9D1UoVJ5upY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fl3GQX/UVaEd27NJMozZJwLtMYRnB8tQiRsR9HHRJI0+NyC/s
	dhg3zpyTAaEXVQiB0SehPdegNcyU/Upr9OeIhLhOzSF/j8IdXgKytEiO
X-Gm-Gg: AYBFou3I/PDDOxQtA9ELFQ8s7ExKQkO6yyUPJXj5ExP79ubVm6z7E4cZIPmTuHtPRHS
	zqgH8kGn8Z0t9byHvq31/Hc1YSywpr1kEvGw5d1bEVJYDI9DyWdxrozEqfwBLuTSmvolaup9obM
	jwFxu967YpCysYFcABgBOZs9eOiNGCzCgm+U4WyV94jnUaXThWBT1yEBRzLuoRerskNIaaqJWDm
	DEBQ2/3EY7PzGLcfo5mrQCH1MI9qf80rkhNgYWCxu66dM9B9O/0xAnhJf7bqYd7H06WpU/T9S18
	Lp3flb35G0JOi5aMZidbV+LBXkCDQTkdkf/mAYobwD7Q5Lqu3ipFxa+Fbyhsp1awgkX/0Wd8nKS
	whm0J0FTT/HBvHFgZFWbJyofyxxYpDr0PWz1iZuu8ItXXK/8XJk/vaFk9+6HF/9ij9MNFDJNiSc
	nJSKaRmGRENSjQi4Qx99ZUINdNIWLtoPYEocgEMzp3U9IoPKaHXxXANnAbm1Q0PGyl5LP7wUh6a
	CGQaOwiOOmk2UvCs9QCNMFLzCjoaGk3HoncmYfJChHqN73Pl8P3Zb+XbkPMaFEw1vQfSDUaNZfv
	xJfA9plvMmN755R31tRdbHNvqwulYf+d9IpcTPsKJAupXHNzE6hN/ZfJ68UV2T8GqnNc57H2eOd
	jspbUaw8ZwDRSLcdiK3kSswARn/9L0WZ3wKA/OnALLzU3sXBbUh/GyY2m4aPOTBjinGOrlf0USn
	uweg==
X-Received: by 2002:a17:90b:4ad0:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b182f1adcdmr3660412a91.60.1794433729109;
        Wed, 11 Nov 2026 13:48:49 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182de1dafsm2754761a91.3.2026.11.11.13.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:48:47 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: dell_rbu: Allocate large monolithic images contiguously
Date: Wed, 11 Nov 2026 13:48:26 -0800
Message-ID: <20261111214826.6577-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111214826.6577-1-rosenp@gmail.com>
References: <20261111214826.6577-1-rosenp@gmail.com>
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

Monolithic RBU images must live in a single physically contiguous block
below 4GB. img_update_realloc() gets that block from __get_free_pages(),
which cannot return more than MAX_PAGE_ORDER (4MB on x86). Current Dell
BIOS packages are larger than that: the Precision M4800 A26 image
(the PFS container extracted from the update executable) is about 16MB,
and SMBIOS structure 0xDE on that system reports no packet-mode support,
so the image cannot be loaded at all.

When the required order exceeds MAX_PAGE_ORDER, fall back to
alloc_contig_pages() with __GFP_DMA32 so the range is still below 4GB,
and free it with free_contig_range(). Smaller images keep using the
buddy allocator as before.

Tested on a Precision M4800 by uploading the 16MB A26 image through
/sys/class/firmware/dell_rbu and reading it back byte-for-byte from
/sys/devices/platform/dell_rbu/data; a 300KB image still uses the
buddy allocator path.

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell_rbu.c | 54 +++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
index a121f59a215d..d71fa9584831 100644
--- a/drivers/platform/x86/dell/dell_rbu.c
+++ b/drivers/platform/x86/dell/dell_rbu.c
@@ -41,6 +41,8 @@
 #include <linux/moduleparam.h>
 #include <linux/firmware.h>
 #include <linux/dma-mapping.h>
+#include <linux/gfp.h>
+#include <linux/mm.h>
 #include <asm/set_memory.h>
 
 MODULE_AUTHOR("Abhay Salunke <abhay_salunke@dell.com>");
@@ -55,6 +57,7 @@ static struct _rbu_data {
 	unsigned long image_update_buffer_size;
 	unsigned long bios_image_size;
 	int image_update_ordernum;
+	unsigned long image_update_contig_pages;
 	spinlock_t lock;
 	unsigned long packet_read_count;
 	unsigned long num_packets;
@@ -335,6 +338,37 @@ static void packet_empty_list(void)
 	rbu_data.imagesize = 0;
 }
 
+/*
+ * Monolithic images must sit in one physically contiguous block below 4GB.
+ * Current BIOS images (16MB on some systems) exceed what the buddy allocator
+ * can hand out (MAX_PAGE_ORDER), so fall back to the contiguous range
+ * allocator for those when it is available.
+ */
+#ifdef CONFIG_CONTIG_ALLOC
+static void *img_alloc_contig(unsigned long nr_pages)
+{
+	struct page *page;
+
+	page = alloc_contig_pages(nr_pages, GFP_KERNEL | __GFP_DMA32 | __GFP_NOWARN,
+				  first_online_node, NULL);
+	return page ? page_address(page) : NULL;
+}
+
+static void img_free_contig(void *buf, unsigned long nr_pages)
+{
+	free_contig_range(PHYS_PFN(virt_to_phys(buf)), nr_pages);
+}
+#else
+static void *img_alloc_contig(unsigned long nr_pages)
+{
+	return NULL;
+}
+
+static void img_free_contig(void *buf, unsigned long nr_pages)
+{
+}
+#endif
+
 /*
  * img_update_free: Frees the buffer allocated for storing BIOS image
  * Always called with lock held and returned with lock held
@@ -349,13 +383,18 @@ static void img_update_free(void)
 	 */
 	memset(rbu_data.image_update_buffer, 0,
 		rbu_data.image_update_buffer_size);
-	free_pages((unsigned long) rbu_data.image_update_buffer,
-		rbu_data.image_update_ordernum);
+	if (rbu_data.image_update_contig_pages)
+		img_free_contig(rbu_data.image_update_buffer,
+				rbu_data.image_update_contig_pages);
+	else
+		free_pages((unsigned long) rbu_data.image_update_buffer,
+			rbu_data.image_update_ordernum);
 
 	/*
 	 * Re-initialize the rbu_data variables after a free
 	 */
 	rbu_data.image_update_ordernum = -1;
+	rbu_data.image_update_contig_pages = 0;
 	rbu_data.image_update_buffer = NULL;
 	rbu_data.image_update_buffer_size = 0;
 	rbu_data.bios_image_size = 0;
@@ -375,6 +414,7 @@ static int img_update_realloc(unsigned long size)
 {
 	unsigned char *image_update_buffer = NULL;
 	unsigned long img_buf_phys_addr;
+	unsigned long contig_pages = 0;
 	int ordernum;
 
 	/*
@@ -404,8 +444,13 @@ static int img_update_realloc(unsigned long size)
 	spin_unlock(&rbu_data.lock);
 
 	ordernum = get_order(size);
-	image_update_buffer =
-		(unsigned char *)__get_free_pages(GFP_DMA32, ordernum);
+	if (ordernum <= MAX_PAGE_ORDER) {
+		image_update_buffer =
+			(unsigned char *)__get_free_pages(GFP_DMA32, ordernum);
+	} else {
+		contig_pages = PAGE_ALIGN(size) >> PAGE_SHIFT;
+		image_update_buffer = img_alloc_contig(contig_pages);
+	}
 	spin_lock(&rbu_data.lock);
 	if (!image_update_buffer) {
 		pr_debug("Not enough memory for image update: size = %ld\n", size);
@@ -420,6 +465,7 @@ static int img_update_realloc(unsigned long size)
 	rbu_data.image_update_buffer_size = size;
 	rbu_data.bios_image_size = rbu_data.image_update_buffer_size;
 	rbu_data.image_update_ordernum = ordernum;
+	rbu_data.image_update_contig_pages = contig_pages;
 	return 0;
 }
 
-- 
2.56.1

