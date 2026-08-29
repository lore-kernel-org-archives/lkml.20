Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDC6418348
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788020787; cv=none; b=nFT7Zfim/Ti3y4yyKL002JS6ioWk4HJ30t5UfqjGP97kiihvtfwU4h1fRVH0tHwiApLLuSVSdKSmLzkSWXXbl4nXV3g6fnz+UGM4QHxDlKBQ8BUTRNOuqOiJjqgmeizUSlVL11fSKeAfP7v0F01ASgv/dwPodME+MUUGzpE33hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788020787; c=relaxed/simple;
	bh=sQVJMp3C2+a4ti+a7qwKMOTUI8kXgqbTgt5wFTn5j2s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oavzjeFgizl1UoOG+YTfQTm6Xe/xH9XNeJO/SBe1jot+6J3ppsjAVDsS6OQBnsGiXhOHBmVVMVoS9eZWOLDzLyV5AInQFmZxiKZO0N1vm9S+8kEd2eYrL6JSA9BXh13nadDKc5JzCKUTUG+ZalHepmJzKJad2S4dRZ9kc0pplfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E45fgCy4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E45fgCy4"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4956869750eso12993575e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788020773; x=1788625573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37NQ1+thP2Lwc8BjlF3YW6iY09VuBpxsUD1pSnN03YY=;
        b=E45fgCy4JYJ2S2A13Ute6L/t7dv10Mjz8O2SopdR06602fNo+kJ+7L3Kn8edASIt9H
         1o0urLvSr1aV8r68KeX1rdtXyVkU0mWDmZXUDtUldm030M9fAguxbJeKnkCFaXdHdrCT
         VUTFqyawcFoduB3H6vPnsQkl7FoKRqDe+gRDa3SL5gWKWpQQ9ByY/BRaSuH7IW+5JD2i
         fJgSWYxP66rOuAu1bdZmVUWG24XJRTpT7cthvuZl0Evled7J3oySAXDi5l6R2eaO29fR
         NCkv4FwMT+KPgyGioEuDg64dlU66QKbCAMYIwewNC+aVrUjK4MbxOnAFvQJOJNh1QD1Z
         dSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788020773; x=1788625573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37NQ1+thP2Lwc8BjlF3YW6iY09VuBpxsUD1pSnN03YY=;
        b=rpc61TY84BRSNODJEiplFTmoSqRm9EUdcnTOyh1Kw15+vNfhKxc978m9ZZaLLPZrye
         Fx9ZM6KlcmmIShKhjv7P3QZlPkPYIauvc9hZSvgSUnxfWcTGmb1t+CjVIsFRbFCnMon0
         Ofv1BhA9VKo9dPGD+pzKu/EUtAxes79qNRzwYuXEQpMosxfojJ1oruHyg/bPjTQuqF8w
         PzeRpGmHqiyY8k1cj/ALZkXxvFvGWvGBJ9KQGYZASjxz3eMY9zBVspvD0XZqcajiKX4h
         3n11sX/frH5ZSmJoS9C7vGABlyFhxXwI2x9p6l0ClJrEXdryue4QFTX1LVSgmxaavAo6
         gSWQ==
X-Forwarded-Encrypted: i=1; AHgh+RpArKAm3Dv62a9LLflVbnI+mmusiMr2G1Zx9uRchdg0NLZo5BY3z/0j9yNSDGynxW0BUfJcS6c/eQ9uzR8=@vger.kernel.org
X-Gm-Message-State: AFuF++lUTIFuFip5F29jU5s87ADJC4N3oU2i1zeBd7vjvFwnHyTmQGeM
	qmRjKPivzI22/pvXG9iLsl679hl/C9ylezowQkL3s7E+QD8H7l1xsUpk
X-Gm-Gg: AR+sD10r3QvBTbMD11ybN8fCVoVDak4UBKPN5aCllKHLa4/eSQ14YWb0qNt0kZGYcEX
	b1hydxbwF733PKRmBd8UQ9cl8d4cmRI18mXGQbZroeWCNDBRDge/kYqZa4MY/1HCrcgFLBY3KMO
	biCMas+5I2Zfs9ajbvN3OZB8l0GtCQp+04apavfU9pZ90Xv8Y+Mz7IzMIn9Qs8mbhiWGlYBlBEt
	FRdT0NknqQLV6hUOnHDA9ANjPtprqlOt/W8FtSSSJ1FI0ixh8K/CpHqPiw5GcuX1+GJmw8EltlI
	AABGCoGNp703omTMINeQ+l/8uzBy36WKU/9vQgawKa1LaxBpZdNaZaobrHicgzlw40lUaFDOKAe
	7kOBj6EnznnspWWNjhkKyol4xwai1v2PFAUX3vt6Qn58MA7A11vTQcX2xGKHRDbUT3CwGB27Mag
	jj5b2vVHcrNhfSEMDPiZg2Di5W5xTmiRvvXpnljqtffBIWOLWzEcnjDm5W2f+WMjsStBZ28olVX
	zzHykOt1EcD6Z9t65fID1a/BpQygB4fjZan3/FqPqJjpGOkoj9sqNm21ZQdhvC7gzunmbSMj46V
	NnR6Q6/1IDVev9yLEPeOb9JpKsioVJo2MvIXuC1uyFU6fgjXucbGr26NnParODuCbH9fiviV66B
	amQfUnGaVZ4bm2YJjUMWbRtIKX5BRhzvoJik=
X-Received: by 2002:a05:600c:8b86:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-49b91c2777emr259876155e9.7.1788020772776;
        Sat, 29 Aug 2026 09:26:12 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92679be5sm137861705e9.3.2026.08.29.09.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 09:26:12 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sat, 29 Aug 2026 18:26:08 +0200
Subject: [PATCH v2 11/11] iio: temperature: tsys02d: make headers conform
 to IWYU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-kernel-header-removal-v2-11-c67739d5dedf@gmail.com>
References: <20260829-kernel-header-removal-v2-0-c67739d5dedf@gmail.com>
In-Reply-To: <20260829-kernel-header-removal-v2-0-c67739d5dedf@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Crt Mori <cmo@melexis.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788020764; l=1873;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=sQVJMp3C2+a4ti+a7qwKMOTUI8kXgqbTgt5wFTn5j2s=;
 b=PDDTE3Ssmq27mEZddwEE7tj0c4EuQj5HRH2JegwaoBBBOj3IUVxhfhK4J376cavbir2b459rP
 hz9V/vF1eBPCLtlJC++UIqVKOpVI4fKZ7XJfCnX1BGjsXhhMRHuzLUg
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

Remove the catch-all kernel.h header, add missing headers and remove
unused headers.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
Header changes explained:
Added:
- <linux/array_size.h>: for ARRAY_SIZE()
- <linux/bits.h>: for GENMASK() and BIT() macros
- <linux/i2c.h>: for i2c_client and i2c_device_id
- <linux/mutex.h>: for struct mutex and mutex_lock/unlock
- <linux/sysfs.h>: for sysfs API
- <linux/types.h>: for fixed-width integer types (u8, u16, etc.)
Removed:
- <linux/init.h>: not directly used in this driver
- <linux/kernel.h>: catch-all header no longer needed
---
 drivers/iio/temperature/ltc2983.c | 1 -
 drivers/iio/temperature/tsys02d.c | 8 ++++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/temperature/ltc2983.c b/drivers/iio/temperature/ltc2983.c
index b8deb9aa9d48..6c4de6854683 100644
--- a/drivers/iio/temperature/ltc2983.c
+++ b/drivers/iio/temperature/ltc2983.c
@@ -11,7 +11,6 @@
 #include <linux/bitops.h>
 #include <linux/completion.h>
 #include <linux/container_of.h>
-#include <linux/dev_printk.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
diff --git a/drivers/iio/temperature/tsys02d.c b/drivers/iio/temperature/tsys02d.c
index 377e27b45fdd..4946d0b14632 100644
--- a/drivers/iio/temperature/tsys02d.c
+++ b/drivers/iio/temperature/tsys02d.c
@@ -10,11 +10,15 @@
  *  http://www.meas-spec.com/downloads/Digital_Sensor_TSYS02D.pdf
  */
 
+#include <linux/array_size.h>
+#include <linux/bits.h>
 #include <linux/device.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
+#include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/stat.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>

-- 
2.55.0

