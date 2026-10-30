Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357302;
	b=THYXRUa+Jnjgf0OCb3ZHv5glI1sO4YeT9DEApW+aNWj3dODnuvY41LtF2+GyD6IKiwuC
	 vTeBSb317ruwUeMqCCgzw7/OlHG35/to0hzvynzx9p3BjQoWAoYC/fjT9qA2FoF7ehWdJ
	 i0P4LkDyE9sEty5wIDFqKaxfQxVfmDvzJD3JOy1o7km+K+MKHbt//kULFxK7KDpeEWnKM
	 VLFwcwnZV1DzSURGdo1+E7/paJAwLHaak3x0A3GmWiR56pEU5cLKb3XP0Pq+KOC5mNRsH
	 01cP2vgWdOcTXGdsZEbJgCAvVun6rzGWzKSTNyoZ8bwKAnqsI3Yf1OnYDBwQRij1LNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QpStEmyGQQsu84SS4INTHakUVlKWH4EpwsSW4OFxdxk=;
	b=DwywNANyP+lsrgdn5XFQxZGEGhERcqDeckp2ob9tbbwsUltBAuHVSuAHNAVYKCfnn4v2
	 0d1CwsipAn9vFeRdXcqkm9UDujpV+pHf7lufCKtXEpPj7HdT13bJlBB1zHDtQiSMp1ahT
	 MEJIBcyf9YIgR2p7XAmnrCJO6TX6BwXVAmA5V8klO43WfvYuTuXQ+gs74pK6UN5GDvJk2
	 TOdKg+G0AbNpX3SraRcJZG9/Hn2Ryh/xCG5NV1uc41CQQo6q5EO2noi3eJH6JzS5GRVeH
	 gLSu1nrHOb4v4Y+UZHwENBX7W57LrS9TxjTU5AZIgWFWb7CJibPZwDMhMDg/JJXO5qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TgD7EExM;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6C0606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E6C0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TgD7EExM
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso517019f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793357300; x=1793962100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpStEmyGQQsu84SS4INTHakUVlKWH4EpwsSW4OFxdxk=;
        b=TgD7EExMtyLX1qNBHnezhB8JBhjJjNtwS9ret5xVef7xr1FZxQuVCJBSL8QXqaWLPh
         Pa2KsJ1BUKSAm7e2GHVtKOE+L3TqU3tq5yRoge6i1E24PkiIocgQfexJ6bv2ZVy7/5PN
         2SEdlTV8QmhWQdwsJNwWGFeSxzR42/QEz6IdOuxLum+hxvgoorU3j/lxqQumzs88zOaf
         Bs165BifaTvp7zvnFilHIDVSairKJDJk4MGH9YY5jq0nvYv+NJaipzT4fzEu4/eq0Gys
         1w0EQbazUBPYw976ABPowMYajY9jsaZA84nCI2axFc2g0z1TH3/6R7v8v88kV/Pb2fWZ
         4PEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357300; x=1793962100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QpStEmyGQQsu84SS4INTHakUVlKWH4EpwsSW4OFxdxk=;
        b=ciVjtMc4fHuZHoOsvRQZKj/Fcp2eXRh6MxWz4mHxe5C+BMP3bKDc3adSqG4vpnhJT0
         LgRQhTz84tt3aetIO+/YTxmJC1MwRMj9jvdRZ0a+vImr/9Ugbc66guq+b6aOviPdybeX
         mmzLE+6OmFcVGU0WcFF9p3f11MUIOlqiO+PjkhItOO/kKVpvmO0cdNFKsXDP6gqI1aje
         2dBfAWS/GQm5OxOVEY/M8R91w9AFOXdPkl/tOf/n3+HvCGgICoTrhN+XByYwVZRcledp
         519l4igF7ku4jkbjDkUgDML00Kn0sze3m3Z2Ab5qZnkhARRpRt8GfBmAgXrJ7KooBPjU
         9OLw==
X-Forwarded-Encrypted: i=1; AKwUvByX+YkVmNrjwToLWIHU4pymFjYhdnTfm4TpZCLh6nj3OpFT2LYbSqmVsELxLO5/pAyd8We5d8j9ZXJ2Y0o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcj+z1hdrIcY+7KLSLp4vIsFYrH5/mLRGczXeq9UDDeFT8haEr
	MRUGoRm2PwNLo+8zcLq3A06tlTsNECLBgGuein8cay5BDK+3rkqZ0dVW
X-Gm-Gg: AYBFou04lueTLo7Pa8ychkfR61H3TAb9edy9ljFGZkzhDlOst+XMhwbX/guz1wBBVxW
	QDOJRV/08j+SXtUmfeJSqW4SqpvDhRlhmzuAExfROp3ceY4bK4tu5iwN4gLqlfsXGZai9Uve3JQ
	nkBqWbqUfEcbVAF2ylvv3v+DiVRy1skhrKjP3nbP1rnRj5F6jZJmmHSXb3KoiXXfnX8I1Q/Oe+x
	JFK/qdHxWiUSDhcEmAgz8jhekDAwnSBN03J2YYerl3jjLA+l5lJUdSPQBg0sj6Zg6Uomxu2nXmp
	7IdVrsddLtOufIuXrWK47IvXqqT1wz/O6Oh5s5Bbpc21EFG5RKqBhvnAG1y/fmoSzmsu3x+8en5
	cXFwXjDb3b8pyTXgCSf2BbJM7EURCYMbpb7qZe0k30k4PyVoqY2hlJY4L0ld3dO9cGgAUGKTp0B
	7hR8FebfrLxjBXWjLcaj51n3vBlwzuHnH1o8NqMPvcj1eM5YVDfmZP1Dzwy3EQD6P+lINjsP5ar
	hkijE1KAnQcsx1tKSAtWco4LZiJOIE05xuN7axlpnBq03Qpy3O/hfrcpKnM75655yeFZHiXXSTo
	6d4OlJxP+/qGOx7mnPoD+i1RdZGMerwuuT0XLqw=
X-Received: by 2002:a05:6000:26c5:b0:48b:e50:714e with SMTP id ffacd0b85a97d-48e6e50d8a5mr4237079f8f.36.1793357300391;
        Fri, 30 Oct 2026 03:48:20 -0700 (PDT)
Received: from fedora ([154.183.179.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae25dsm2240473f8f.59.2026.10.30.03.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:48:20 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nuno Sa <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux@analog.com,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v2 1/2] staging: iio: addac: adt7316: replace kernel.h with bits.h and kstrtox.h
Date: Fri, 30 Oct 2026 12:47:44 +0200
Message-ID: <20261030104745.16693-2-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030104745.16693-1-abdelnasserhussein11@gmail.com>
References: <20261030104745.16693-1-abdelnasserhussein11@gmail.com>
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

Drop the proxy header <linux/kernel.h> and explicitly include
<linux/bits.h> for BIT() macro and <linux/kstrtox.h> for
kstrtou8(), kstrtou16(), and kstrtoint() conversions.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/addac/adt7316.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 20f6052cc7fb..d4b759ef637c 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -10,7 +10,8 @@
 #include <linux/irq.h>
 #include <linux/workqueue.h>
 #include <linux/device.h>
-#include <linux/kernel.h>
+#include <linux/bits.h>
+#include <linux/kstrtox.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 #include <linux/list.h>
-- 
2.56.0

