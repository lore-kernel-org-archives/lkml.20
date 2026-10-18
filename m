Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB2243846B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792353701; cv=none; b=LUy8PlINAB2vuIZMO3sNTnzqp70WQioNDWexrVf/3ODPUbwYs0lagjXVishA67ypUbWfXYK9JmDGt2h5Ievh4G3l1yWwQX0nfLS7cBPBbmBDMiZ/NesstCLueOtCM6t/NFHf+Kkfzos/DqITIzK8rL7uaUi66LZPEkCXfH7EJo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792353701; c=relaxed/simple;
	bh=Hx2Qj+l8OFcg63fIdID0ARo7fsSvD3MoqrRN8F5jdQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pyVpfzkIHwEhP48eubvlUZPDVgKaiiOZdZzHRqW0Di2yo54TD4MwTYbAqehBXWopfPUPwVYemJASDmz5nONSpSX9UiIKc6S6CWwTmad3BX4yiWKJ1XE6iM2/zNzxgI4YUNkglhHyE/uyXythzL2fPZKQWeP0UlUC3xv/VNmOSFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AygePdDG; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AygePdDG"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3514b90bb89so3685976eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792353699; x=1792958499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=78g9KK4RW/XUg9Q6d51RdojUrkDXmguxkjVsTLKd+rM=;
        b=AygePdDGZ+YkNxZvmkSZhGTn9muge/1me4I0AmQ/XL7hTsT6tCohL2NHq7NCR3ha3E
         MsBAXjbNhuVx7gQwkCNZcov/PHBnWnGTQskbWl9eRc06MYWZx9INPWyBk+5bSWU++B6L
         iCwu67rri9WxC1lYw/1PswxeeJOfe0QsINd4RZU1u1cYbHoaL21qD/KZ330ocxLrRmT+
         Rz7S9RX9Fz7HeHeT8iS1jHj5taX/Ix8XoOBUIe1h8+3rx0kI16CEbjg4raWvwzkR5PiD
         +HCBgEoVnRTqye+Qe3R5e3ENOMUy1RNg1XBMxSIFYSgGDkVX8DRA6Nduv/jWCjhCBwoZ
         hcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792353699; x=1792958499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=78g9KK4RW/XUg9Q6d51RdojUrkDXmguxkjVsTLKd+rM=;
        b=m3Uqi0J9hG5ViHDPt5E6YJUtwldgnBfob9UXbrv1BX0vpGVaFCltSFIEqXpFC7nZF5
         Ok+69aUnmvzOqFHJCKTjfDNpezKbyrBcMo4tbJFvuYehigvfpxT4X6hk2+HBb9gAw/VV
         eeuba+76vZQdTzkXI+1Fq8+OP1s/mC97zJ/Thn5CRMy7oR2RqYD8MxhmZ0qsFlPg5vJ3
         XWamcYkTRcjWsyGKHyk+KpaDc6kR9z84kHQNE35kF4EJ1+V4W3cVziF5VUqnkyRHHW5O
         pkH06k9yU3d4Zr9RjYHGdsixXjyDxP45haMk1RADBGIt9Vt9AafxfctwnSy4XHq+4EHZ
         CHNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoAV70+7/0pqogcIBG1+TMH5kPXD/vMlLYzPqnL+SFKvSn4ulXH7hQvF61HnBxiJ9s5evblTHtM5dRDK4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkSSQF3Efr3CxRSp8oibZPVBJQQNAsfMOrtzdP1OXlK51AdqPf
	MXpM6GF8HiFPOOdxghOI6wg5tFeov9/2PEcDBr0TK2fYRCjGwQIgS3E1
X-Gm-Gg: AYBFou3Ycj2lq6Ra2kgUtrPmN9DY05qcjAY5GUkXdYSB9b6I3SPpmAwHQzD5ZUrN/HT
	n0Ud34MOUvfwetPSuUQMcLQZmAAkVdzE6baJCygrCKFhN2Z71fZECNHb4k4gQsin1nr+4WocNn/
	Qp9141vqiLceCJvvq5V89Hxe4JNR7AtaGv1o/QOBRj0M9Jxjsn3i8jqS7wgMtOO5LXHNGn055Fc
	W27Kvyg4RHgTG8dovA5kglcPSKv2ObMJAPDsBKwESGMakq/9sD0RzzDGj/VmEbn4TYiuK7jZKn6
	G4hY2ayEtzgLldkmentQsIKIN9QI+/XJRMnUwFZBxDP//q6XchYgcgO+etiNlcH+sMVbE+MsC1X
	GoY7rp+zPuN/y9xhR+ZxBBk092Pr98D5sPrhkDLIs4Rv4EcgsayznkREnNPzRswgWCQa9FxSYcZ
	dXPKCMtJB9bSj9zIQrXoSM/KzXklGZfs42++gwnVuwIDUDNLgZrqI8zhKcdbh9yA6guXx5tvdHG
	B97QH42x4AaezZ78qtzoCA=
X-Received: by 2002:a05:7300:d588:b0:360:58a9:2704 with SMTP id 5a478bee46e88-361a1471311mr9142824eec.6.1792353699112;
        Sun, 18 Oct 2026 13:01:39 -0700 (PDT)
Received: from NithishVelan.localdomain ([152.57.94.185])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082784ec8sm24693980eec.22.2026.10.18.13.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 13:01:38 -0700 (PDT)
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
Subject: [PATCH] staging: iio: impedance-analyzer: ad5933: use guard(mutex) in ad5933_show()
Date: Sun, 18 Oct 2026 20:01:27 +0000
Message-ID: <20261018200128.642-1-mnithishvelan@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use guard(mutex) to automatically manage the state lock in
ad5933_show(). This simplifies the function by allowing direct returns
from each switch case, eliminating the mutable return variables and
manual mutex_unlock() calls.

Signed-off-by: Nithishvelan M <mnithishvelan@gmail.com>
---
 .../staging/iio/impedance-analyzer/ad5933.c   | 38 ++++++++-----------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index 798e62bae2..024c6b5a06 100644
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
 
-	mutex_lock(&st->lock);
+	guard(mutex)(&st->lock);
+
 	switch ((u32)this_attr->address) {
 	case AD5933_OUT_RANGE:
-		len = sysfs_emit(buf, "%u\n",
-				 st->range_avail[(st->ctrl_hb >> 1) & 0x3]);
-		break;
+		return sysfs_emit(buf, "%u\n",
+				  st->range_avail[(st->ctrl_hb >> 1) & 0x3]);
 	case AD5933_OUT_RANGE_AVAIL:
-		len = sysfs_emit(buf, "%u %u %u %u\n", st->range_avail[0],
-				 st->range_avail[3], st->range_avail[2],
-				 st->range_avail[1]);
-		break;
+		return sysfs_emit(buf, "%u %u %u %u\n", st->range_avail[0],
+				  st->range_avail[3], st->range_avail[2],
+				  st->range_avail[1]);
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
+				  (st->ctrl_hb & AD5933_CTRL_PGA_GAIN_1) ?
+				  "1" : "0.2");
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

