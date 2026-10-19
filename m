Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422181;
	b=076oWEfmWDvZlziLdhrIDAMdt4Rwi+US9OQP8E8npL6UBtJYoWLQWQB/ubiR2SqGg6r6
	 5H/rzvhwxOx770tQ6QgxtOWknb5iRGZnXCg26yy9dJID0LWQy3JY90eje+jDIhcaykSMq
	 RCgNbdFxFI7NqeghC0iStk+YeMX+In7lIH9hIhW360AcLisx//e3hr4LE0qjFz8bySyS9
	 RxcBpWG37i3C/hwuaHBAzr/GPrllz1IYGeHVC89kdAHeeEmRymoirAxFUZpTBSrokNTae
	 i1zzps515TvFpUumTN9UyDWH5YYieoyyy9xQhYMGWUqBF1GJJ1VNowvZfaEVEWIkerQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8ggX77WU3hUpk89gP84ckJ0nyPjIYp6mZHbVSorQiSI=;
	b=kHhu9VaqRyR49IX+Aoddo2z3BHPApwikOr0OCDII+mPgGcfJM3USJWJSVCori/oqhOfa
	 2gHrMHHlEo5wT7/DL2avuh8ZTtbzJXxdRD8H9+TqP2/XbJCv4aH25IVdbxjcGSZ4zs7AC
	 EhWPDxmhVFbfHuP7P6qB/asYpNSvqc3AXzfS9txHah2mNJytjNp5qu0g0fbDBfuWnlR6f
	 GuJgdjA/rbIZlsLlrg7qFVa1aZG/Z2KWHeW3xopArygYXizPjQerVBxqpCGdKdXczPOJc
	 ZztrpaCol01TK4EjGB1S0u1+5yQqaEmaZdJO2o9OybUPZOmE2Jr7I9aB4tLxrDzPCkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MrrcT9uf;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A0E607D344
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7A0E607D344
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MrrcT9uf
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35c76e9614aso4293545eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792422180; x=1793026980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ggX77WU3hUpk89gP84ckJ0nyPjIYp6mZHbVSorQiSI=;
        b=MrrcT9ufpw/FWHjRmfOLinDhB5piOvvNb9TkNUWnzYizbo/y3DAP+/tN1//zCiHeLj
         gNi6FhqoYcvQDmhw7rq5Xjbyv7AOSy3pnXDsHpgoaVHzA4Z4PmfRNFDNKjUBWLFQk8gC
         XOrSes2HX/VD9NP+puVIcUhhLhFG4otSUMwtPxfmhkC2JMoUTaQD7Mo73pvorlNhHz0n
         bnGV9dGgZH0hcN4uEOnO+aoTKIq0KV38fIbjiKxFilBxwFo6TTxIIAKeHFqHwjM8sJ3C
         RGD4tUQRpUHt/M++cNCat6hIo+p7VPAp59Ke0xqmNQBoyQrVcH6Z4/uX+Ou++fF3vGJT
         M9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792422180; x=1793026980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ggX77WU3hUpk89gP84ckJ0nyPjIYp6mZHbVSorQiSI=;
        b=bI+3e7bYl2Ntx4ylTk3v4uCKE7ykE/N1EBmfQ9qre9OzhlkP7Wa8KhuRHw62LbELBw
         wSyELActKGrH2g4ODZNLx6bv2UTGEQMS7fUpG6aF3/vvbAMtvkU0kF+9RLp4Wiv2hE77
         q0swa8ScxuUkG/0zLSBtciOohUQcI6bfDxjUlLqtzvRiLFYwMjliYEEj5GGDBgoZG+QC
         RlXCL0je4yEWr0P0+P6fzDhn8XDik9HJDF+e4ls3U8NEoTMIp4gllb6Nz23T2w2muDlh
         ZLQrta5nWzUcK71+WfVPrqNcooXbB+F3BloY/WgkDO1itHo0kHPscxjEJO3TQoC5mKfW
         zQQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGOId08/G8MtvZDib3LlhEf3+pua03Ju/xXt4woKDXYTJxWk+gI7Z22ZZzpBJTegKV1C1095wkSDF4n04=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLXWrBeBBcBC3hbZn9yGahpKtpWWACz8tywROICQzBljGGpm1v
	3I285exdvPO/QTo2tcuR/WmHEljoowYyhbQevYeMZgCIhznyDOU3bfcb
X-Gm-Gg: AYBFou1LKmbRBATffTo1bkTqTSUnG5iidAZVnrSn+B6FAiQqdFJy1eLXtpdvcgEAK70
	RmKYH3ICYdlGtypmej0VaSJWCD/t0ATr0ULBWLjU541EYtZ09jTzb9ZfUshMbrxk+eokhltOuy3
	cOln8IX2ROm4+6eVmCCJhb9DPTRw6Le+bDMLD9MAIDOIBz40dzLq7H8VvQ3jVLVbUJ2kVZ6snBh
	oMfXuE6kcBQHHHZKtOV12n0X6I6m/sCul3Np50VZClNMnKARPfrhZn2SWcPBhsXVZBp2qRDiz4Z
	fLZpENJhb51t3yDURKpy2js9QeZsAIlXnf/LRl9vmx//k2TcBvPumB2zm9zRxfLwGeV7Xzq+Plz
	WwXbrj6ufP+yOa837CBXPSP5N9YeMtjlXx2gdvkuE/EWCu7fqftSya2pGMw1Jpw+zB6nmzU0IyB
	baa4Qt9RAc8CT+Q6EsdadUDjzRDU8cQgdwDnUjaeYa5sdLQbKxDU3l1lEZl6lEgbfgct0RCRCC+
	X/rkoDpOskCPOuPAQ2MoQ==
X-Received: by 2002:a05:7301:6497:b0:35e:5f8f:9665 with SMTP id 5a478bee46e88-361a254373dmr12519563eec.29.1792422179073;
        Mon, 19 Oct 2026 08:02:59 -0700 (PDT)
Received: from NithishVelan.localdomain ([152.57.90.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm41480843eec.20.2026.10.19.08.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:02:58 -0700 (PDT)
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
Subject: [PATCH v2] staging: iio: impedance-analyzer: ad5933: use guard(mutex) in ad5933_show()
Date: Mon, 19 Oct 2026 15:02:48 +0000
Message-ID: <20261019150248.416-1-mnithishvelan@gmail.com>
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
ad5933_show(). This simplifies the function by allowing direct returns
from each switch case, eliminating the mutable return variables and
manual mutex_unlock() calls.

Signed-off-by: Nithishvelan M <mnithishvelan@gmail.com>
---
Changes in v2:
 - Extract range index into local variable 'ridx' to prevent static
   analysis warnings (Andy Shevchenko)
 - Keep short return sysfs_emit() call on a single line (Andy Shevchenko)
 - Split AD5933_OUT_RANGE_AVAIL arguments logically across lines (Andy Shevchenko)
 - Remove redundant parentheses in AD5933_IN_PGA_GAIN ternary (Andy Shevchenko)

 .../staging/iio/impedance-analyzer/ad5933.c   | 38 ++++++++-----------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index 798e62bae2..7c3af47e0c 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -333,39 +334,30 @@ static ssize_t ad5933_show(struct device *dev,
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad5933_state *st = iio_priv(indio_dev);
 	struct iio_dev_attr *this_attr = to_iio_dev_attr(attr);
-	int ret = 0, len = 0;
+	unsigned int ridx;
+
+	guard(mutex)(&st->lock);
 
-	mutex_lock(&st->lock);
 	switch ((u32)this_attr->address) {
 	case AD5933_OUT_RANGE:
-		len = sysfs_emit(buf, "%u\n",
-				 st->range_avail[(st->ctrl_hb >> 1) & 0x3]);
-		break;
+		ridx = (st->ctrl_hb >> 1) & 0x03;
+		return sysfs_emit(buf, "%u\n", st->range_avail[ridx]);
 	case AD5933_OUT_RANGE_AVAIL:
-		len = sysfs_emit(buf, "%u %u %u %u\n", st->range_avail[0],
-				 st->range_avail[3], st->range_avail[2],
-				 st->range_avail[1]);
-		break;
+		return sysfs_emit(buf, "%u %u %u %u\n",
+				  st->range_avail[0], st->range_avail[3],
+				  st->range_avail[2], st->range_avail[1]);
 	case AD5933_OUT_SETTLING_CYCLES:
-		len = sysfs_emit(buf, "%d\n", st->settling_cycles);
-		break;
+		return sysfs_emit(buf, "%d\n", st->settling_cycles);
 	case AD5933_IN_PGA_GAIN:
-		len = sysfs_emit(buf, "%s\n",
-				 (st->ctrl_hb & AD5933_CTRL_PGA_GAIN_1) ?
-				 "1" : "0.2");
-		break;
+		return sysfs_emit(buf, "%s\n",
+				  st->ctrl_hb & AD5933_CTRL_PGA_GAIN_1 ? "1" : "0.2");
 	case AD5933_IN_PGA_GAIN_AVAIL:
-		len = sysfs_emit(buf, "1 0.2\n");
-		break;
+		return sysfs_emit(buf, "1 0.2\n");
 	case AD5933_FREQ_POINTS:
-		len = sysfs_emit(buf, "%d\n", st->freq_points);
-		break;
+		return sysfs_emit(buf, "%d\n", st->freq_points);
 	default:
-		ret = -EINVAL;
+		return -EINVAL;
 	}
-
-	mutex_unlock(&st->lock);
-	return ret ? ret : len;
 }
 
 static ssize_t ad5933_store(struct device *dev,
-- 
2.53.0

