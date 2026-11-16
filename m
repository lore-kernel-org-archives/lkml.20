Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861665;
	b=MDLgfacyVAbjUaJY6Z5XjPIn+CglRw+eAMDQqhbN9UcZxlherorxXL48jBFQpmRf8o2P
	 OXhF09LlyoMFBCbhDPV/Fz3q0QcQ0esriamAPCLoArdWEQGTSMm5giCzUddZtONI2hyXL
	 1g8+DnTXfTl9r2HTX8LijVQ8r0L1E2xWku8Y9SFaadbl1Ab5iRuKJl2ANB6pTCHa/4rza
	 VeNBdhXL719eYNrYy3RzXUfvmpdeqPQ+2+YOySCd7sTk5LTttgLBwG7/0iqm+zM074qxg
	 uml0PisSmHKDkzZGdgcY46e0RP/vsi3RdTncnVHEFwfR3QTL1WyzbA7+e5TymT4PVJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1JOVMxOFhUKnmlrcXwJX+d7zl/tg9wPLTTafKHk50+8=;
	b=eHPVU2VmfIv1pNDeOPdNoCcJzzZj6ddruw6ie6ifs070khAOfeq0ZzS+VynV0qGCPXDB
	 bBts0d4SvT/H/Hn0HodZv6AAz1x1i5ccuPS+Ej6Y60/86CUIN1IkOqVMNfYudO8KjAzi+
	 zQb9Vh7HLsO+EnQjWKWSIIalOsntCp5heBmAyZuFANU+ZS7himW3ebokYj7/EG5b4doWT
	 EiHVykX//BpFlEW4o2uv+DKLf1H2VYdOXtz4kBlKm+qggnBVaZmig48tfNew6mNuP4M2V
	 zpS2mIcHVF4Vlm5+KOhpfQFLqnZD5drnsnt2PykF8t/ZY0lKghNFIKP9nVjFb1aULCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oRsrEEi4;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A9B606A891
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92A9B606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oRsrEEi4
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ed2bfe3252so14059885ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794861665; x=1795466465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1JOVMxOFhUKnmlrcXwJX+d7zl/tg9wPLTTafKHk50+8=;
        b=oRsrEEi4vtbNNz7BLgW3CjImVCA3A5qud/olh+ckIJF27znjYAO1y9GHnLyJ6qZ7Dg
         ubfHsRVtcJ3RagFplrkVK1pl9xM0HfLto3WfFFwMuP69Ns4I4AwAfb6cqHrRr8qibOev
         Q99Dv81eutPXIS6be6uSh4RST38TzuP1l1DOl7DYxO2k855R6TOei1lz6LUn6kyRw6d6
         aPKcVe0khuS2bWw3WKAJrQKF7pvkGHNP8qvgRVGr/VFlKsnfXujdzl9OkkFZgfeQ50ru
         9N2OFxy1djoKbNgJT8HUHoN8azGwck/MarpTx+5lv4cGdQlzp0fCmGARKXIgHqi/rfXU
         BaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861665; x=1795466465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1JOVMxOFhUKnmlrcXwJX+d7zl/tg9wPLTTafKHk50+8=;
        b=gROfTnrDPVBtG+NAnAOAOFS1W/cz6mYgOznBnw6x5YhoS+niNs9JcLQpIq/YCuVKZl
         P6Ximt8nSsh1QUAw52mNxneQabIqibPtXz8eeCLUjg6JEXJ/JJ/zWezr5ln4oqPC2bPh
         /3K6OycZikhCSuvxQL5/27QKZroa/L0rIvYA1SgH25k1yP10yR1BRAx82L+QfoWMJoX+
         eCd4k9pa8BZW5eTN8TUZihhgOUgIWcAon1q9x2y6JpRO1QxqHLC4Zdem3Lw2e32W8K1C
         l1JRHdJlgfxk1mj5da1ZyhZhd27ukq+SPT3DQ/RFbFFjxeQYfXAEr0CozBO1bvMEDJYd
         OUSw==
X-Forwarded-Encrypted: i=1; AL+hErEIcvbhzSvKfs6VAZQEn4mkUEkH9evEy8NgSiRtPeqy0l18wOQRoviaH7P53WhvSHrR8qNikq206kJpfRs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x5bofzidJnog68XnQCRzxmMx1puQmBpfqZDSXXj2aAf8b+nI9
	x03vHfMGO+SvFu4I1edAgDCYXuXmV4FQC4SV3F5oPNQVLh0c62pky9TE
X-Gm-Gg: AZFdTZcQr4rKaKj42uMIFqBGI7+Jy2BW7Wp0TDHirJ9rAxV7h6mO8uGx5TbYeqAxptC
	hWHQEhDoECG5lNi7xJ9iCeY0nCi0mU06YZGPYrUMwCT2GnE5OWaUgqyL3rdZsYXX2s/iKhyNai5
	CX7JAMohhNWhXIkuMOihDuquzxKdWseXTrcMKbRB1L/CxfiF1ZGOJoKIN2NHJj6Nj+zAymDMnj0
	XZHu2PYlwdxq9C56IXrnFor4hVL2sPAWO+5POZuGgtwrvpVdiiRENC+CRseDbZZ/Gq5Y91+BDOS
	Ndjj6wQsWMkE0eEqLFDx2B+uU/YTd24ckGNVr+P9lEWQU55ylUOpSWnydFPb3rqCYQlE/7KQLo/
	o4rDwiiwG1MdMlvA4sqKeoeM8b4BZc8NZ+rIIY/aHt6ulF9olXNkI/rm30FaKbtQv8i5oKX3IV3
	QkdFe5mb0nZrtuQ7VnJpMfumE2KLAIospvhCQWiGbX8eLJ8N5ovk8fHc6qdSMhxkRZi/eufXafr
	hEuGE+5dx2Tqyym84ijnahQ7OVJzhs/UgjcwH+HwZWKfBj5ME/XK+YDLA75Qz4fj/iwiwvpUahP
	755y3AP31Vy6rsCSAZl34YGzRvgn6+QjZl7SuDdEi3IQgiml3ki7jw9poSv/F7OTkyZ5HHQmu3G
	aUXgkCxvHIjp0svKFgAfBYURQ0bJo/bhH3bZ610+/HWGwRdQ5nt6XwxJ3mqoqxGRyeOYUcnT7na
	/jeyTcIwR34ojzGylsYNtdBSM=
X-Received: by 2002:a17:903:1904:b0:2e9:61bf:6587 with SMTP id d9443c01a7336-2ee0df758b3mr113876965ad.49.1794861664780;
        Mon, 16 Nov 2026 12:41:04 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a87202sm3833645ad.58.2026.11.16.12.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:41:04 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Morton <akpm@osdl.org>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] platform/x86: dell: dcdbas: Release the SMI buffer in remove
Date: Mon, 16 Nov 2026 12:40:51 -0800
Message-ID: <d9c1df9c5f28848f77beec2b4cbabc0eb4da6c70.1794861287.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794861287.git.rosenp@gmail.com>
References: <cover.1794861287.git.rosenp@gmail.com>
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

dcdbas_exit() frees the SMI data buffer before
platform_device_unregister() removes the sysfs attributes, and without
holding smi_data_lock. The comment claims that only at module exit can
all sysfs attributes be released, but device attributes do not pin the
module: while rmmod runs, smi_data_write() or smi_data_buf_size_store()
can still be executing. They can then memcpy() into the buffer as it is
freed, or allocate a new buffer that is never freed.

sysfs_remove_group() in dcdbas_remove() waits for running attribute
handlers, and dcdbas_pdev is still valid at that point. Free the buffer
there, or unmap the firmware-provided buffer when WSMT is in use, and
also do it when probe fails after dcdbas_check_wsmt() mapped the
firmware buffer. Reset the WSMT state with it so a later probe starts
clean.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dcdbas.c | 44 ++++++++++++++++++------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index cd72f8c29a86..0db278eed5d8 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -97,6 +97,20 @@ static void smi_data_buf_free(void)
 	dcdbas_smi_free(&smi_buf);
 }
 
+/* Free the SMI data buffer, or unmap the firmware one when WSMT is in use */
+static void dcdbas_release_buffer(void)
+{
+	if (wsmt_enabled) {
+		memunmap(bios_buffer);
+		bios_buffer = NULL;
+		smi_buf = (struct smi_buffer){};
+		max_smi_data_buf_size = MAX_SMI_DATA_BUF_SIZE;
+		wsmt_enabled = false;
+	} else {
+		smi_data_buf_free();
+	}
+}
+
 /**
  * smi_data_buf_realloc: grow SMI data buffer if needed
  */
@@ -685,11 +699,11 @@ static int dcdbas_probe(struct platform_device *dev)
 	 */
 	error = dma_set_coherent_mask(&dcdbas_pdev->dev, DMA_BIT_MASK(32));
 	if (error)
-		return error;
+		goto err_release_buffer;
 
 	error = sysfs_create_group(&dev->dev.kobj, &dcdbas_attr_group);
 	if (error)
-		return error;
+		goto err_release_buffer;
 
 	register_reboot_notifier(&dcdbas_reboot_nb);
 
@@ -697,12 +711,22 @@ static int dcdbas_probe(struct platform_device *dev)
 		 DRIVER_DESCRIPTION, DRIVER_VERSION);
 
 	return 0;
+
+err_release_buffer:
+	dcdbas_release_buffer();
+	return error;
 }
 
 static void dcdbas_remove(struct platform_device *dev)
 {
 	unregister_reboot_notifier(&dcdbas_reboot_nb);
 	sysfs_remove_group(&dev->dev.kobj, &dcdbas_attr_group);
+
+	/*
+	 * sysfs_remove_group() waited for any attribute handler still
+	 * running, so nothing else uses the buffer now.
+	 */
+	dcdbas_release_buffer();
 }
 
 static struct platform_driver dcdbas_driver = {
@@ -751,22 +775,6 @@ static int __init dcdbas_init(void)
  */
 static void __exit dcdbas_exit(void)
 {
-	/*
-	 * make sure functions that use dcdbas_pdev are called
-	 * before platform_device_unregister
-	 */
-	unregister_reboot_notifier(&dcdbas_reboot_nb);
-
-	/*
-	 * We have to free the buffer here instead of dcdbas_remove
-	 * because only in module exit function we can be sure that
-	 * all sysfs attributes belonging to this module have been
-	 * released.
-	 */
-	if (dcdbas_pdev)
-		smi_data_buf_free();
-	if (bios_buffer)
-		memunmap(bios_buffer);
 	platform_device_unregister(dcdbas_pdev_reg);
 	platform_driver_unregister(&dcdbas_driver);
 }
-- 
2.56.1

