Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5396370D5E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787861799; cv=none; b=qFH3OyV8cXzwVmHC3CNhnThg7Ygv6/FtjXltJ1RZ8Ubt03LeAkQSoWke2TB39ne+0FCj/KpCGR5lc6oHoHvwbVjsG1JWstfkebUduIlZwpRyVjbFMV5WPQ+VsRr16w4nnNE/5M0Z8+5tsUpWIReLYV++DJh+SCehJyP74y8nVBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787861799; c=relaxed/simple;
	bh=ot5s3z0y3WkGd23yN8si0am4L6kSSGA+LkIE6cUufHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UFGEe7Dwsh/sTTCkY9Qh8H8/lbDOBZMs/qooLC0502NfMbgcRo0P4fGntZUXqfIEOOfZlwTbfN6d6ggqMVfkCfhhv2gOiroOfDDgRnu1lORtEw9yp6H0YCZOxXGXyZXLbZuNxtUCvhCS9zrB5LCr02fJ5u4qdB+NUr6u9R5EWBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJUZwU2r; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJUZwU2r"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49557167508so1863165e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787861790; x=1788466590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+YYaj9hB2BEbjd6/AK9OJyefsLzkvfj7sSU25cg5Eo=;
        b=bJUZwU2rDJFnl8s3+d5K7JXhpl7Rz8mlCo+N+ONlPsz4N+dUHFnOPDrHRXOMhoZ3Ku
         shu0tGRol+sQ/hnauYN/dO31fnAB8O/PBdwu9bVZuWsETT9gkQDXrHAnIr5bTHk+l+6E
         5JZI61nkeloNejkd3Diz7Lf9AZf1NFCJ3JuOqDEaOjrkzL9YZcephkrteVgRlfoFNUeo
         qc/7o1WYIFLtIDTHGiQ9/9X1m7UJGAZDVD0iNyK1sjmblJtRKLTyyQGCJoqVwXjtmrxu
         ctu6eOS7psYfRv89pR64l9TTPnoAui+C8Zu0EtSgMg/4IinZ0zS2h5kpTdOD6PZXeUah
         flqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787861790; x=1788466590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+YYaj9hB2BEbjd6/AK9OJyefsLzkvfj7sSU25cg5Eo=;
        b=bTR27QjoW6lbkxMqs+lDOxnlN9yRk26hs/Cq3FSSKbku2Bg1Gcs3y2Aa3rsVSSCLA2
         D2Egdo9SBJlu2UrlavPnf7D9Mq4SpMEC+UZtqDlm8sV9+3YSv/8bWOjcvNw2hxuLmGnk
         5nRWC3WxPmv9cuf9v2dqiC2z1tTSn4uffmmDPGy7OgyB9snGkN+x8wMydYUaRQ6JvvRM
         k7P4UsFCjZxJMbdAR6rvtm/i88Ouv1JWerB8bXe2zU5R8Ux7vwLsucvep8LkY2SAXovS
         pSMQ+K1AaPldIsWb2XlbLY9f36nbnv4c1bXGjEI8l3rbbX9bnKQbFMRDHx4korRyz4TV
         I01A==
X-Gm-Message-State: AFuF++mvKxZEXLS0jOjAqmJsVO3S9BHR7Hwb3q6wwHytObI5QExbH3O3
	MSLYzyL3aiptSHrmg5mBIySmTDlsQ1zFfBuuEKZo1WuOY6fpuVsdmQ2blQYQL0rR6pobdg==
X-Gm-Gg: AR+sD12cLWYg+R9cNyyKYF7k6hj4m4//Wwemd237GjgI+C190YQSbOjC9nxEMXXpKHV
	REo4zUCo9sK9VAqhme4jcpEh+nb15VRfBTH67tkqXpOSVUR/5RdjOEKwUSDPPtfJ+dHxT/geVLV
	+D0dIpQcJsFbjWMse6qACGPvjPsJp5NWx26XV8sCpGmB//QA2kMVr1T0KZN5/8A+9/hYJPJOopl
	HLpZwAMm/2D7rPujJOZ8HljzBjM7uNxQDu2T9FUE2b82At2vYNlI62W0lbKyGyGjWo5xxXuIJld
	sjM+KKKrPJbESZr/f8GWcQs5vy4iDvcq1Gzfq22pFaI3SJd7d64HbSy2Vfw/sbX82n3GTh8pMkG
	jj7K7Dihn5nLBQ62vZrLKpeJxFEVASUZEaVsgkmdpymhEEQhLvi96o7kAItzRtnjmnV0L2ZFlGv
	squA0YCrLsKbiXoQ22QT1dDFLPN3FTAXt5XMJ8UU34SRHOV3WT+roErZy0zdFpUm1ddR2a
X-Received: by 2002:a05:600c:6215:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49b91c1d5f4mr21884975e9.3.1787861790049;
        Thu, 27 Aug 2026 13:16:30 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:8824:7cb0:614c:86fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4961004bsm91899855e9.4.2026.08.27.13.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 13:16:29 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v9 6/6] media: ov8858: add ACPI device ID INT3477
Date: Thu, 27 Aug 2026 22:16:11 +0200
Message-ID: <20260827201611.99825-7-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827201611.99825-1-tchatard@gmail.com>
References: <20260827201611.99825-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
INT3477 to the ACPI match table so the driver binds when instantiated by
ipu_bridge.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/i2c/ov8858.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab..f0148c1f2 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1981,11 +1981,18 @@ static const struct of_device_id ov8858_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ov8858_of_match);
 
+static const struct acpi_device_id ov8858_acpi_ids[] = {
+	{ .id = "INT3477" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_ids);
+
 static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
 		.of_match_table = ov8858_of_match,
+		.acpi_match_table = ov8858_acpi_ids,
 	},
 	.probe		= ov8858_probe,
 	.remove		= ov8858_remove,
-- 
2.53.0

