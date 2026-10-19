Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B215B47A0DE
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792386438; cv=none; b=eRe2qyy1NbbrL3TjtBZYuGJvbajISeNJrrW3awlfia+hCVtihiWpafRqKga0LWeWEJtXLbFCoixKY4fd8oN2P52Y9Rz4i/NXjMuIkAZC+j0IxgAG4uk0HIt58T0XyLk8Ql5jSTtfSwHcwqIAwe1eLsqKefuq6+t1fqF8ovDvY2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792386438; c=relaxed/simple;
	bh=x9wpxUyL530Iiw6P0N+3kTeiF91l97A3dxOFL5oObNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N26z2CBhXiz5MX/N5yLnt/OIDUD90F86Gm/nl/9i9bQPbu9N74Aglx2t/Bcq9DxcZuHMUBUgYHyK/c7OVqhcEcTsqIedmOW+zAdu6MmJc1fL3CZTo7mAFIdmCNfv3zDKeBSf1ykW2LuSCtKZ/ne5spnW2XZooe/mSgiuAKgtEF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlN3EpQ8; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlN3EpQ8"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso953661eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 22:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792386432; x=1792991232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fva8zL+n1OCI0oMJodhd5ulLyrv34XE8ucuw+gfKNzI=;
        b=YlN3EpQ8H0+82aX+vWfFofSCYkGN7VEFNdl1mEMwqEvOUWMrZSWXIEFDoX3y1CYKiU
         JG+VbOCGRFc+b5ejda+fE+5RT8aIVJiacmrCZOZYmRHgVGn9FHIA1XMfemUC1FlwFxsu
         KXFX37t7TyCJb7PGu4DbSz+t5l7thYYBV9CZA3Tv2jDZnmKxOpfaRObk44JajtalTYZS
         NOj1AJVh1AbxgN9PHaT0Je4+bImkUs9pj877tycdIpOkBrsh9PBcDStFoaMw6CKnIbSz
         yeVYDpbkyiFPrwxfMIGJJGFVOoDebZ5FcwZCIQJMe+gKhh3T63sGXNv2suAsJ9cN48XC
         ILPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792386432; x=1792991232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fva8zL+n1OCI0oMJodhd5ulLyrv34XE8ucuw+gfKNzI=;
        b=Mfi3n9X0hTY6d8FnODDrBZ6oaC7m6z1FStGVtsfeyFG4S+GmFcdqtT7LG3ftL892aF
         OY/bgptfls60f4sI/bHeFPIss2VZGglFZQS+f/hBgDaYa9X1MBkfj+g4O+hOdI50dBRb
         xsADVWXr1ZECuPUEs/3z+YoMTAnSXT8HjPsvyQCSaKs1hLoXvVTJIiA3s08wBA789rpL
         lxTki/UIrEBhiieDv3TGfGAF0G+9HHLw9FvNdgyR4cJYa6GbAkXJHTklxl4ODwtaIJqB
         DnSKTTNiUdQISVNPR04fHKf4augGa8fTrJ5Y7p3NSFHFOa+9IZotjFiNKtCamqGy392d
         8uqw==
X-Forwarded-Encrypted: i=1; AKwUvByJyWglUQf+vHpZekhcAlthIwQF8SjPRFJCtmVKTSFh/m8SlxVntyjp8nCutx2K6D4LCniHDsQ4MYWZvLs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqSA+Cbh4lRw+0HZ+i5M3jcdsEiibhHtzQE4AW66EEe4kmKBin
	Envfxkljf9OqhTFpEzYrQ73P16oJytpiyMfYFBMSh14jGaa+tZ+8PJe8
X-Gm-Gg: AYBFou1NYwT6ME/D9tlFpCccnE+hfP2WL5YLaUIdfR7fA2YU92bXbew9tJcvP2xALmk
	AYSCc48vxL9CSKTQuddRkbGU7foRT9NDCNz/XXJDiMw1PT6tEPzr5mB+LCo+h8PajYgnCpobM1H
	VoiQU7I1cTUnP2rNitCOypKBRL9+jypZq4o1GlYCjxfqxo7+6FWFeVtUOaJHXbJW4Db7zKcVEjW
	LLvl6WPT0yss3krzcO6LTwEjQIw2URgE53cj/qLNQbbNL4539HDs/k9fB3Q6S8PaxcmIH8gIgm+
	gvCx2e5NPALO+UkWu9ROBy7eFQR9QsDEUg7z7ryirDbAPt1lAwh2M2h5TjxOlkjkr5NTO6Woxl7
	n86MoUy86TLg+UwmelXUXwQCq7lr1jyfNOd5Sh/tw6zWUgs3+UQMCeMBJ3dmiHCqdEOUEAFBdMe
	k/Y2sr8OBRUE0rnlr+7YX658yO1jcxOQ0woEGtSM1VE5tgICGlLNkGKSnJiKARo9Qb+T4FttIlr
	DptEv1Kac7rCbIYMyBmyg==
X-Received: by 2002:a05:7022:302:b0:157:cbf6:89c4 with SMTP id a92af1059eb24-18514350f17mr15503005c88.26.1792386431972;
        Sun, 18 Oct 2026 22:07:11 -0700 (PDT)
Received: from NithishVelan.localdomain ([152.57.90.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314ef8ed8sm23760564c88.3.2026.10.18.22.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 22:07:11 -0700 (PDT)
From: Nithishvelan M <mnithishvelan@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nithishvelan M <mnithishvelan@gmail.com>
Subject: [PATCH v2] staging: iio: impedance-analyzer: ad5933: use guard(mutex) in ad5933_show()
Date: Mon, 19 Oct 2026 05:07:02 +0000
Message-ID: <20261019050702.419-1-mnithishvelan@gmail.com>
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
v2:
 - Resend using git-send-email to preserve tabs and whitespace (v1 was
   sent via Gmail web composer and had mangled whitespace).
 - No code changes.

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

