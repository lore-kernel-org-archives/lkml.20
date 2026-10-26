Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003317;
	b=R1r2+EuQVgrvpRvLJf675E9s1mAGfQPlcS4TkvdFEhj8iwV66clKudpZgvM+eK3kUn1n
	 ZuF5vM7vceT/vu5FmABvxavgGaxZ5XHAtthhgrG2GfWXd/juxpU1OwU4yHmma8s0UTSic
	 8C64x5AZZqlBhrjRGs3n0Q47JiXxf8CuyEI7S2omGiGEwA1+UqAErPPnN2X3QJoLUQbZ8
	 nPtJMsDIMFA5Fjw6zF9u/pEMW5cygoRqDWBp5prRVtaUtdRjexK0EKW9/R9wKUC+mUEGp
	 IEr/JgdKXTt5dKB84iRbLYPdodPVsCfTScSqvU0eTstcnRy2Bhc8ZrhFh+CUauglFFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EjCtGVYy8oVZbBDhEOaUUsJdWh7LVDwBlPS7EGRKlGg=;
	b=cptjinUDkBXUxdVCzCVl/KZ4XZ/IVDDJSLmkdH7v8CvuQDEysKJc1Cv8MEKNtVbfdZ2c
	 a4xG0u5TvTv8Dbw/eaqgXRnp3xJdk9sSrxaApkxDnB8IhvyUL1Qc1wE6utl8dZ/dwk5fN
	 jWIbOulOzAuLRH0B0KExDTSt5gr5zGd4BCuUkSLgbBtFv8kHCU13vlp8pcUSAtu34RzNW
	 KdLBoeBumAMufV52Q6GQ46Z3f3yQCaoX6HtzA0gexW/lelp1998MM/cmGYp06Kv61zl0G
	 dYQudUX4xe8R1OQOulgGpGKfstJBu094q51km30vvJfoT1EAgl0va/9T4OoeU/L4XjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="lGX6M/cV";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B66606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7B66606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lGX6M/cV
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36681e85e87so145164eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793003316; x=1793608116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EjCtGVYy8oVZbBDhEOaUUsJdWh7LVDwBlPS7EGRKlGg=;
        b=lGX6M/cV1LoTJcMaZ/TBu0ayjwwhkTFtefO3b5Z2FSFZQOzdhpxLHaHavxIAHNeVI1
         pBdtkgHwt66JEEAeYYiTO7+zXlSTIZDGL5nFe5xT77m+N2aeTBwroww9yk9WVTaoK8XI
         6tDN6XZ4XM5LNEBEo+GLGe+yLz6jZFqgsTbwU8W84yXv/K9oPSyF3V/Emda0gwqp5E0k
         pfjWNw39FaHJ18VyEevYiXfzmjZrIq8P+NcmqKvXGF3ktuSy27Rnmi4ygmH1GQysaVk6
         CbNZiV0IT/vT+3f5AnHM94QYUYpQGKdk/HPQWJ5a7C86QbayikziLADK98rwCLJH2YRx
         a9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003316; x=1793608116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjCtGVYy8oVZbBDhEOaUUsJdWh7LVDwBlPS7EGRKlGg=;
        b=uuj2ktVpndMBuIys3gSe2zvPSkylkRRS8XexsMnEmL/tR4IVL/7N5+qhAZxow6qkkq
         shh5ZKLqEiI/e9E6ShbDufGo83BXZhgdOHq2+HzQJFwptE3twZfOIvyxEgXpK6+f5b87
         CTVwnMOl7v3n8v2DHCW/RKW1owlKj/vzcpDAAgM2E6D6DXdlUy/WbTkC9awof3OZJkmj
         jtWtID0W1EI1o7sFojqdPTn/vTJKjIRfqTaNA6iLaz5CyTM14xmGSuJ3KS5TgS7cTC2F
         a0FGAnb5WIqsfvudoSLHQ8ThGKpS9MNAJ7Rhvh18vw0atG3KwvH1Fg7pXrl5YwNqXHqu
         UBYw==
X-Forwarded-Encrypted: i=1; AKwUvBwyY2DFuZ9+89ASkR8XqzZEfW5IilquwPwkvPyqwDg3UaBmo8HmZDP0OxBjiHB8JwcEZqr2k4xS1FO2dec=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2rKSeKx5AouoaO+MTnBgboXFcGO00ObeHMP4j5Oub1f/t3PTO
	cClLN9fC04kwpkwdkD5kj0CeloTeanyXHkM0Z3iVR6zKUok/0KdI6joP
X-Gm-Gg: AYBFou25NNAOSLckeilFtQBsQS7rChXBxqXTnssYJqlHBWLstR3kFmEC3cfbwv7TwBY
	9hFfYhTyhV2vQsUNujuiv6d7vMLIo7Q0lfL5rJMgFcpTNMl+1C/Loj/QA41YV2ma1ZtDaYGdn9P
	Qbnu+jrVeIm+y9kZNHonutLdoa75iTh2DEF6MJGx3D6QN/ZTVrnfm7KAFlgEJho7Ab+UDN4o0sT
	SkZ5k0AkodIBAWmMAaYpCQiD0mVszzaLuNQBtLIiAwMp+7p39Cn1hwV2pwfr4bbcSRdSQyPp8Qu
	UknSFBXTn8bsbMjq3R2GXb9kFFUKnWV2iGmNOZNPcaQEfi14q75qjE4UQtcWKZwXjjy5xguS6JQ
	nFW9UaNo6Sz7aDpfVkOZali887gb3wIdA8E0YeXajVljiK4sDN78a0xBK2y28hvMguiV1euuV6i
	PcQAEYIQAwRwfdUQ+4hviDK4ZElyEM3dNNbZcN+I1PGmDM6VSZ9Hj8z3f7TisOh95qL2pioitYh
	D74XDxTx4I6XX8kGPuqEAvyk7Vo5+gce/tOw5WIFxH7QjI8UwMp8mo2yyzr8pKz7cr3d9lrph46
	wNWO
X-Received: by 2002:a05:693c:87c4:10b0:36a:43d:8ef7 with SMTP id 5a478bee46e88-36a043d9429mr1824611eec.18.1793003315844;
        Mon, 26 Oct 2026 01:28:35 -0700 (PDT)
Received: from NithishVelan.localdomain ([152.57.83.124])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ef6a71a4sm22301819eec.8.2026.10.26.01.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:28:35 -0700 (PDT)
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
Subject: [PATCH v3] staging: iio: impedance-analyzer: ad5933: use guard(mutex) in ad5933_show()
Date: Mon, 26 Oct 2026 08:28:28 +0000
Message-ID: <20261026082828.652-1-mnithishvelan@gmail.com>
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
Changes in v3:
 - Rename local variable 'ridx' to 'val' to avoid conflating range index
   with PGA gain bit (Jonathan Cameron).
 - Re-use 'val' in AD5933_IN_PGA_GAIN to keep sysfs_emit() simple
   (Andy Shevchenko).

Changes in v2:
 - Extract range index into local variable 'ridx' to prevent static
   analysis warnings (Andy Shevchenko).
 - Keep short return sysfs_emit() call on a single line (Andy Shevchenko).
 - Split AD5933_OUT_RANGE_AVAIL arguments logically across lines (Andy Shevchenko).
 - Remove redundant parentheses in AD5933_IN_PGA_GAIN ternary (Andy Shevchenko).
 - Resend using git-send-email to preserve tabs and whitespace.
 .../staging/iio/impedance-analyzer/ad5933.c   | 38 ++++++++-----------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index 798e62bae2..c05a5f4b42 100644
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
+	unsigned int val;
+
+	guard(mutex)(&st->lock);
 
-	mutex_lock(&st->lock);
 	switch ((u32)this_attr->address) {
 	case AD5933_OUT_RANGE:
-		len = sysfs_emit(buf, "%u\n",
-				 st->range_avail[(st->ctrl_hb >> 1) & 0x3]);
-		break;
+		val = (st->ctrl_hb >> 1) & 0x03;
+		return sysfs_emit(buf, "%u\n", st->range_avail[val]);
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
+		val = st->ctrl_hb & AD5933_CTRL_PGA_GAIN_1;
+		return sysfs_emit(buf, "%s\n", val ? "1" : "0.2");
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

