Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793938622;
	b=Z3A/DD30QoxCXi/AhpzRUaYN0ur2uiFvGxC1q0EnD0wZjQhDw4OU3UdBFybR2oTcoD0m
	 Xuj72XWNnNU23+3dszk5sMddrtAOpeLmZT7WNDSkfqfwsW7osn4nv3tL48eFLNtz8deAL
	 UtYwal6Q6vEgDq2d8+gUKDvjIjxgN0uk0VLPpsar6SK0/EdD4LViqhi1ccRH2AjMc+if7
	 s0KmvRXdb4A1HwVuCzxVUEtjWE69J3ZJNn5E0pTdbUxlTPdgNuk9EQdjol+qfukVahXQR
	 FIi+k7MmChJ/tbu9ABYRBOIgH23C09M8besgVQw/cOCRXAvDRhTz4OoE5J2qTqt8Blw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793938622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IFRCE426UTc7sdwYXe1TU+8o/imwLSKisQnbNMcuaUE=;
	b=U5JiPjkkSYj7O9eCkL38aJq/E9mGp5mARrkFCk9aQeFra73Vd+Ln6KHLknK/eW6Y+JN5
	 Jp4nQ0Wolroc8J2hdDTJLPoGQTC2xL5mbcnxCnHtEIjCAvEFBh6KxtuCN/bjMFzY7Qr5c
	 li60/rGS8XE7TF9MUwXujGEWm2RST9pH1dLGdXdysyuCMvGcsXRF9YtpISpya73jhFI3N
	 r+5Ldt4hrKnQTYvlNkXqJCTwKN44F295PbpETcqpJC00A7TJHkVW1ghHFiKrJAI3u9xBb
	 zJx5gHxD1WUKs5b6aK19U7p3kuzVubOwTEXaNU9XUYqJkjZ/5gwbeAqOciyhdLlUyZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0PSuoYQ/";
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A131606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A131606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PSuoYQ/
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1ae18eb9b69so356134c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793938620; x=1794543420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IFRCE426UTc7sdwYXe1TU+8o/imwLSKisQnbNMcuaUE=;
        b=0PSuoYQ/sCYEOgxrzrYUEjIs689Jf5aIAV/ibbqqocYuVykp3jPiOXUR6N8O0mRQ0g
         FxYoiOcpXXbj5DwaFwQIjWrFFbCgpi7EjrwRiykn3++Pj6+twbNrTV+jEtawKZgMlJFM
         SwhNl7gijMdnYJV3vldVZmtExXfOMWiSQCxMqOPwAfo9oN2/yxsGZivmuhmpeCGZcJM5
         WnBB0Sd2hyIYoHY89EYpDJ5cvhBnQ0glC22sFfqJWndLiUm+Sm/o4DpbJWrtsza/bVq+
         bx2zNKG6oJoTLNX6cuojFw16Lu7tNewxblxsSmEy75pjOQYUhzcpB/+WIZGXgzDjbWJ0
         55Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793938620; x=1794543420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IFRCE426UTc7sdwYXe1TU+8o/imwLSKisQnbNMcuaUE=;
        b=r3QEzfmxB1sJMdwqFxCC+dvRTLXRy7UpH4YTSKVhgEh5xIbT828uES4BnCxYvmnz0w
         GlMquUCEEpBtj5T6JWSzCVqN1DJUZOyuKqTuo91sXhPStRLM6cTLAgZCrSn94S3EFdHP
         QcyfPNMS37E31PTMBAy/bctxNAXpdRGsgRmF0IsKPIIsCocKMWq7nO1a2JnYMFUE4Srd
         5oTV9jyl2mSQ0RjfSVjq7OpJym8KfnwJvVAONqnLm7vH/fwWj/xPiocEpG/ChGi/nlbp
         j7VP5zX5juddI9OtEuzhDLt02/Z4rTAIUvsH9Q5jReVwAzztgqR0Oj8WQAjQAU5DrawC
         SYvg==
X-Forwarded-Encrypted: i=1; AKwUvBz2mwnvwDVvNV+9H7d/7ctwH6ZHbtIk8Cw8Jqb2Y0Obo6NXRFVkIIAPm0wFj4nUImnVtmRKcu44hWNBi2A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8W251LtQYpqJqcaKVuDvbHeUNRlYWwr9jQv4/JFvbxxTD3Flh8
	DwfQ8IAFp/yLOoLagzzgy/Gu7pUJfqJPPQw3dOFVvKqrLdXpoM+JvGKw
X-Gm-Gg: AYBFou07V1AykD8x129i78I0gvtFek7qet4dQHwFsB/xwZ+1f8/SbT/lk4o5TSq3dR4
	cWcwZ1PLVjDWFv8Cc/zS+XwnFOokIELifT5mCEXwtYaUu6aYwpF/ZZrupEGOQ/7iWqG1wrPnolZ
	+kNoEzhvv4E+sbiZsXFUXSQTL0oOyCBA+XtKjMr+Q3ngPaRImRADyqBtKn08pEKZDxkgR4+T63i
	VW6ixsISggXYgoCak4Y3EqDxwuz5rUMOdsNr2QNSaZsOrLUDf3cfqUog8TQ9I069yA8F2gM8+Z+
	6411Qq+eEwS1sWzmdyibFGj43rAJsBhgZA9L+lrhaYDrEBJ86hG/UDitjjd+4Iw3gEZJogKHpLT
	GBhV+U9PxI6J8hZ72Z+Ha537oZzRHjF+JvucCwqFz+TQ5lFqyigPn6zFN1lc7d7y4+3hTx3zoSe
	dEWPce/c+Z8rH+om04zms7YNsIkcKGlcTevngi9As+Ena1gZwxvJUiTDorv2XnRW75JOPx8SrJP
	4fLtf0p7sdge9tg2I33qOsy7xbMlCBRRhIfZSl/E37p9t3/u4t4QEQcUQFmVYo4Fr8guzjigrZN
	F3EpSjpmOiS9JAZh/BQG81meMRsTOeB9loExOzDjxBhqtP9DWjHdBst0nR31
X-Received: by 2002:a05:7022:5f1a:b0:1b2:4e79:bfb0 with SMTP id a92af1059eb24-1b25d31aafcmr1190947c88.23.1793938620004;
        Thu, 05 Nov 2026 20:17:00 -0800 (PST)
Received: from homik.search.charter.net ([2603:8002:ad40:56f0:5644:8cb0:c50e:37b6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4f03f5sm1698464c88.21.2026.11.05.20.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:16:58 -0800 (PST)
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org,
	justinstitt@google.com,
	morbo@google.com,
	alx@kernel.org,
	shlomojune6@gmail.com,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>
Subject: [PATCH v3] media: siano: Replace strlcat() with seq_buf in sms_ir_init()
Date: Thu,  5 Nov 2026 20:16:53 -0800
Message-ID: <20261106041653.439536-1-nikitash.mariiaw@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104090239.311074-1-nikitash.mariaw@gmail.com>
References: <20261104090239.311074-1-nikitash.mariaw@gmail.com>
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

In preparation for removing the deprecated strlcat() API[1],
replace the strscpy() and strlcat() calls with seq_buf operations
to construct the IR device path.

This preserves the resulting string, including truncation behavior.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
---
Changes in v3:
- Replace snprintf() with seq_buf operations after reproducing
  the GCC -Wformat-truncation warning noted by David Laight.
- Drop the previous Reviewed-by tags due to the implementation change.

Changes in v2:
- No code changes.
- Remove the statement about buffer capacities from the commit message.
- Add Reviewed-by tags from Alejandro Colomar and Shihuang Liu.

 drivers/media/common/siano/smsir.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/siano/smsir.c b/drivers/media/common/siano/smsir.c
index 283770d583d5..faca379ceebc 100644
--- a/drivers/media/common/siano/smsir.c
+++ b/drivers/media/common/siano/smsir.c
@@ -12,6 +12,7 @@
 
 #include "smscoreapi.h"
 
+#include <linux/seq_buf.h>
 #include <linux/types.h>
 #include <linux/input.h>
 
@@ -41,6 +42,7 @@ int sms_ir_init(struct smscore_device_t *coredev)
 	int err;
 	int board_id = smscore_get_board_id(coredev);
 	struct rc_dev *dev;
+	struct seq_buf s;
 
 	pr_debug("Allocating rc device\n");
 	dev = rc_allocate_device(RC_DRIVER_IR_RAW);
@@ -55,8 +57,10 @@ int sms_ir_init(struct smscore_device_t *coredev)
 	snprintf(coredev->ir.name, sizeof(coredev->ir.name),
 		 "SMS IR (%s)", sms_get_board(board_id)->name);
 
-	strscpy(coredev->ir.phys, coredev->devpath, sizeof(coredev->ir.phys));
-	strlcat(coredev->ir.phys, "/ir0", sizeof(coredev->ir.phys));
+	seq_buf_init(&s, coredev->ir.phys, sizeof(coredev->ir.phys));
+	seq_buf_puts(&s, coredev->devpath);
+	seq_buf_puts(&s, "/ir0");
+	seq_buf_terminate(&s);
 
 	dev->device_name = coredev->ir.name;
 	dev->input_phys = coredev->ir.phys;
-- 
2.43.0

