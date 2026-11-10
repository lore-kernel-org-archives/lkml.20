Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329241;
	b=VXUwLi5v4NFSYCoZNL2CCqOLZ+U9n3Db45ucdDi/lbu0CUF9TRfbnyeCaTB5ZWsAs/2Q
	 PO47SBnrXH5nmh+zOloUhDgI22whlwZpuOPsUMnlgelIgscOr7EQYWw1++uttWagtQAM8
	 DBJjjVjAvWfXmHnc+ibnXN4QL09mzDVruMEA/2Euzbvs0yGBbgdbxuNYSb8TQJalDbu/h
	 qHQXCWDT067oizVhCn32FW7kxZv6e9K298aYdUXSikxehFABDff75Li2zgkhtYrRNkSJM
	 HdWhNzUUS6DLvstYtpbcRL8yv9YM9c0xjsJhlJp5PMNigLyylCTI3iZaBJguCb87CcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UDRMQaN490Igz0plCrZ/DYl/p/Z4M+tLu42qQn9xGzM=;
	b=PEKAm2S5EVykkEJbuTu2etlITRjLGj6w46sTDvNRdUSgmueXyDr2XFgTbRUBWFj4DWF1
	 kEudkNqObUOcHhVYxrR8O/u4Nw5B/Ot/cAg/zUhgzFxKbgFdr7IMKGyKDqVl5b2wHLsl7
	 I8iR2UrVtG1yKyRNhW5zvz6fMcfcdBLou2n6vGQFMo92sGtvJrWFocTBE819M/wZNQfWG
	 tXHxaje7YVnLEGXLLF81tq05zqlqTz+CTYex37ofqicKWA5iKdPHrjn282PcL0btkWAfY
	 SLtDzyL5vBBjeqx6SiuqZjn246O+uAV3/YNzHBu6fSuWWoOz68iHOKnDhbr+6BrFCEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfEmc021;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A675606A335
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A675606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfEmc021
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so2359842c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329241; x=1794934041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UDRMQaN490Igz0plCrZ/DYl/p/Z4M+tLu42qQn9xGzM=;
        b=tfEmc021XtcNNXLoPLHhYdRbzlobH//iHlHvISNGq1uRSVvn/X1x1g0wCqT+UpI6NW
         hgyZnAdxvRNXMsPI+eSsyP7sZizkBYaNoN/fOXY6saDVpuH5WAtwOEGJQxasBLxl5ILG
         Q82nZ4TMhYtqQE9fAXmly6saMGDTDhCgWAUJ3L8fHeTDMPYazUleq/vAA8afTpmGzyrL
         1n4TiRVzmz4aJpck+nBDF27g3UafaOgrQuMxqup7d9cw47EYD1KIq/gLx+8ZOnPe+w3h
         06EqDi+WKIXzHNEbgbFIBgfc8es/cwfNP2fJYp115bFqU+lAKupfSZaUoGuArSDH3mtK
         zBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329241; x=1794934041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UDRMQaN490Igz0plCrZ/DYl/p/Z4M+tLu42qQn9xGzM=;
        b=S9A/N94r93E0ouBtpCJoyZb0WOgVxhqLNdCcHOBMxL2+vI9XEuFobGHha+VpffMdqd
         SfUWaYxcFWpGsD+MWjAg2u29sKKbQ44ltm6cAW6Bynwm/wxLvVji9hxUJtpRqkdHyvSN
         ju5VYuxTLASKa0JguRkf9ROb4LXapzJT+OHxmzsM30G6tOyAsGIuYbWmqlwMqPpesPcZ
         I32/4k71c2Ip40uMbbzXk865GBLCFoDRHxx1SESBP6kPTlvipCCqgkKFAReMkeRFRH7+
         9OZ658+pgSeuiKHRErdEZYZi2uqfVHaD2k3tEiRvrzRx/ui2uxSAqiVU+SiDYR6OMULe
         cYGQ==
X-Forwarded-Encrypted: i=1; AL+hErE64p7ssXqC3kkVC4K/qYIYPEsciB/khNt12OHk/XgGCh5tuHU03n8hnvFCDxHldgVnJBVQb9sDy7p8CGo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qVJ8SucSXi/3fN9bpEzizy2mVoAcqCkwdXArmDVErEd3xpukp
	dp/OLlS9DJdpT11f2MhhxZvDIISLJkj6VwbeoRttCgR4J394u/+fhXPb
X-Gm-Gg: AYBFou1fmKs54SgyHp/LLMC6DYSIC8wJ40R7DAXVQ3xNotfSh7mNxIOrnKMcRLnyK4v
	wHuQUZxBZqObEnVxOUF+3pWZgZm8l4Ius3zh98kRuNP8WM6tyRofTeyDIVIpr9xjp4N0O1ws9Di
	tnqLNgFhp7QOIrN1hAmvlo4D1O+OKP/wFGXvzqT1gDJ5zqxiO8qqFrePHpQQjedoA/EVGIzM/v2
	oH+hYGxKWxeJbSiGO+1rCrkuERQv0ADO1tRFKyb7zKyn96Ys04M3NDo9v65Rlz9F4WpWlmndEWE
	uXa0x4pO0szcZDuYhHrAX+s5bjvPxip/A9uDzOdBhgznpPfZFFci4VQ3sxl0IfFpX2gELSLIwRA
	L7sbyEO0YRA/HEvWueFbt/dFSqc9DHTCuv/rFa/lC68GNBUJqXc8erct87HBB1rmU5FXi4Ao4kt
	m+kdRV4uCjq6ncm/AkUHNopX5dswvzGyWlKKNlzPlGc6DpofC1nSyPragiGpY2nuqBPMfuEapHi
	9Nju1i/DKyHo9XEJyhOuijBtpgCvXxYPbEIXrYVhWowtqFnt03RdSAhpcxvvESLrypI60qwB9nr
	0uQoOnyCUBGX3WAKQt6dy8aSBggCB3hDdqIaUEHMnhTdjhSb
X-Received: by 2002:a05:701b:281c:b0:1b2:5f31:21c9 with SMTP id a92af1059eb24-1b3b5e651e9mr3703067c88.6.1794329239066;
        Tue, 10 Nov 2026 08:47:19 -0800 (PST)
Received: from NithishVelan.localdomain ([27.60.174.111])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b54431sm7882587c88.17.2026.11.10.08.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:47:18 -0800 (PST)
From: Nithishvelan M <mnithishvelan@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nuno Sa <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nithishvelan M <mnithishvelan@gmail.com>
Subject: [PATCH] staging: iio: frequency: ad9832: use guard(mutex)
Date: Tue, 10 Nov 2026 16:47:11 +0000
Message-ID: <20261110164711.552-1-mnithishvelan@gmail.com>
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

Use guard(mutex) to automatically manage the state lock in
ad9832_write(). This simplifies error handling by allowing direct
returns from each switch case and error branch, eliminating the
manual mutex_unlock() calls and the goto error label.

Signed-off-by: Nithishvelan M <mnithishvelan@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 47 +++++++++++++++++---------
 1 file changed, 31 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 35f823f24..227dcd739 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -8,6 +8,7 @@
 #include <linux/array_size.h>
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/dev_printk.h>
 #include <linux/err.h>
@@ -188,52 +189,65 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 
 	ret = kstrtoul(buf, 10, &val);
 	if (ret)
-		goto error_ret;
+		return ret;
+
+	guard(mutex)(&st->lock);
 
-	mutex_lock(&st->lock);
 	switch ((u32)this_attr->address) {
 	case AD9832_FREQ0HM:
 	case AD9832_FREQ1HM:
 		ret = ad9832_write_frequency(st, this_attr->address, val);
+		if (ret)
+			return ret;
+
 		break;
 	case AD9832_PHASE0H:
 	case AD9832_PHASE1H:
 	case AD9832_PHASE2H:
 	case AD9832_PHASE3H:
 		ret = ad9832_write_phase(st, this_attr->address, val);
+		if (ret)
+			return ret;
+
 		break;
 	case AD9832_PINCTRL_EN:
 		st->ctrl_ss &= ~AD9832_SELSRC;
 		st->ctrl_ss |= FIELD_PREP(AD9832_SELSRC, val ? 0 : 1);
 
 		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SYNCSELSRC) |
-						  st->ctrl_ss);
+				       st->ctrl_ss);
 		ret = spi_sync(st->spi, &st->msg);
+		if (ret)
+			return ret;
+
 		break;
 	case AD9832_FREQ_SYM:
 		if (val == 1 || val == 0) {
 			st->ctrl_fp &= ~AD9832_FREQ;
 			st->ctrl_fp |= FIELD_PREP(AD9832_FREQ, val ? 1 : 0);
 		} else {
-			ret = -EINVAL;
-			break;
+			return -EINVAL;
 		}
 		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_FPSELECT) |
-						  st->ctrl_fp);
+				       st->ctrl_fp);
 		ret = spi_sync(st->spi, &st->msg);
+		if (ret)
+			return ret;
+
 		break;
 	case AD9832_PHASE_SYM:
-		if (val > 3) {
-			ret = -EINVAL;
-			break;
-		}
+		if (val > 3)
+			return -EINVAL;
 
 		st->ctrl_fp &= ~AD9832_PHASE_MASK;
 		st->ctrl_fp |= FIELD_PREP(AD9832_PHASE_MASK, val);
 
 		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_FPSELECT) |
-						  st->ctrl_fp);
+				       st->ctrl_fp);
 		ret = spi_sync(st->spi, &st->msg);
+		if (ret)
+			return ret;
+
 		break;
 	case AD9832_OUTPUT_EN:
 		if (val)
@@ -242,16 +256,17 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 			st->ctrl_src |= FIELD_PREP(AD9832_RESET, 1);
 
 		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SLEEPRESCLR) |
-						  st->ctrl_src);
+				       st->ctrl_src);
 		ret = spi_sync(st->spi, &st->msg);
+		if (ret)
+			return ret;
+
 		break;
 	default:
-		ret = -ENODEV;
+		return -ENODEV;
 	}
-	mutex_unlock(&st->lock);
 
-error_ret:
-	return ret ? ret : len;
+	return len;
 }
 
 /*
-- 
2.53.0

