Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458F3392C3C
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788020770; cv=none; b=JItc9QRLtAFpjEYoxfoq74GKJjxMtSjvn/Vsrgt1aMbjiSBilcYBQtvdrS51oODgygOavNJpB8/JdxXvWnyrX1YqVBO7RzlfrAbbndLriwhIEXBXJioZBLDmYlc5t/bRYXQcQdOGI2AalP6X6Db1+4VPd66/3mmHAvImXbAg+pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788020770; c=relaxed/simple;
	bh=VvbFU0orbGq5GXqsfJRwdLZgjt+B5oLCdGxqVHcumTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GakunQArrJaklaaHHwGkHhGOb0logdolrJbX3Dh4lULF9GENWN1wk7b6m9yNXroHMaUfxIdVYorRxZjWWK15fakj0KDUnoTvTRFpHp3isx6vJRS8fYgTxJS/hB9CQ9z6vmFPui2b+lh4bhOq1wVTRS4NfMO8QQoTTOj8yNNurAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ojlh9iKN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ojlh9iKN"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso18486585e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788020766; x=1788625566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riHBGvJnWFIgnSmmlcRlU+TLt6jZpAQGsDXIjBsIX48=;
        b=Ojlh9iKNOZUgbzdOohBjAVXJgBPLREvcY8D4u9XqBk/6OqaEGAzMwszuKyQg74h/ht
         APAqa83MdYoKkx+NEs7uHVOHWVQaR+5gLWi2Qsd7O4rI7BPN3fThT5JIwlyi8GHsvJGD
         l8HPAMqFM4/MkfgOZGCtzrWBRMIS/XG+8RiYxxgX2549GIOiHCBvwSMXuTP0HgQjl5FN
         ssuPbOvtXqsQbWPLueu/IbXNQibFt9aV6ajzwyBxXjR9npdnZwCDVsc2Ev/MK4+5WEXE
         j3GbT5njsWvCjPxo8nSem1wpP5/yfUX3Ijd/dA583BDGnJ6Gr8bfPe0AfAaXs0vraESg
         RBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788020766; x=1788625566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=riHBGvJnWFIgnSmmlcRlU+TLt6jZpAQGsDXIjBsIX48=;
        b=rHhnzt1Cfgfdq74m29WxX9vi03w0P+Maw8Ko6SCEKVKT5tkO0zAdbRHKT4pX+RQiSr
         LymvNUkrKiynJZxgGsB1zk8WjJ1G0cmf/kx/15UT+1r7n6oNI55pNzohpr8v8HjAdMbc
         aXZwciwrnMA3MDtqzJrzbshMgJzCMnLLvqzop5vKNBItPpK6ud6iyP1ofLXPjUczmr2W
         TW6nvsXixCLiYWC+Urvj9qqiN8FR58UsFpG3q5uF1wS2SM9NLTrzhnPzJdJXHm/ZUy6D
         sR0YNeZ6PlqONAGz4EHFPfRl4asQArg2OoGN1D8dBimlP7Z/nkMUvnoj1pTN5eJtiExa
         f4Rg==
X-Forwarded-Encrypted: i=1; AHgh+RoLhGwBrBBsqWTqVUFoyG1TkG8hTSH/HbDZm4O5J39ey+mYO8Y86c4cO1bFedgmliV6Bg7uDPi+QSqDa5E=@vger.kernel.org
X-Gm-Message-State: AFuF++lCLsS51tXqHQ4YgWwdbaGNbo4h7s6uE+6D60ZTVQjWSCYgXQjI
	C3w7Koee+GjDnYnrYFjzd/ELWz8kkKHehuviKuPTnHz3T2h+DrNPIh0Y
X-Gm-Gg: AR+sD10vONzzO4lmHkEaGsfH5QhhUuW+ObaYvzoxtE2KWFwtGTB5mLv+yp7EBRYdyBu
	tYsFubHzZ8DxMy0keWyDLCMg2+D//RYB97jO6b+YHP4V7UKcOg3Z8UgAQ3ODftO7QGbbx6SCWG1
	dVgXe4DbphiudBkzJ3ska8AYlGvhaGRZFq+FWwCidS48oj7N9QiIGdfuRcUmoiKmdpACRRph2pi
	kLtK9TKjHpD/NGevnHsV6oMoQZ4QHP4A/Fk79rGguGq2ShJ3UOWSOZSUaKMwv6y3KddtBTmWdCI
	a/gF8/LUo5KKWKH0h9hpqO8EZOkgec7tmD/DSHOxiCevn9QSMZ4/9VaRKvC72iD5me6Qc4vhzpf
	k+R036cjEdEJ5N4PeIL9g7oVazlWQU9LDgpzCiswilyG561R7PzOCx8WbQbb4uvF4E1oalBnujm
	7l2uqOTr2WYOq9/MzagdD6RM6YBjL9JY7apBxRNIVPmKmGQd9/id3fq2fmS10XcRzC1+IP2pxQF
	2Rk/Vffw+eqHTrF/tZUWePb6R/rA1K57SfKMi+2HU/owUlTDbKi/+Cn/y2CTnm7nYH2phbkUVMT
	nxoChFKuKCWbXMUBLrb1mjJz6xrz5GdYa1zHqz0KeWtyAErU3ZMStReVkZbAHPuZyhmU+s4Sybr
	6DszNqN2DGfKPwd2dS/tH43rsxA==
X-Received: by 2002:a05:600c:34d2:b0:49c:cbad:1c44 with SMTP id 5b1f17b1804b1-49ccbad1cf1mr101316995e9.6.1788020766117;
        Sat, 29 Aug 2026 09:26:06 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92679be5sm137861705e9.3.2026.08.29.09.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 09:26:05 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sat, 29 Aug 2026 18:25:58 +0200
Subject: [PATCH v2 01/11] iio: temperature: iqs620at-temp: make headers
 conform to IWYU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-kernel-header-removal-v2-1-c67739d5dedf@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788020764; l=1382;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=VvbFU0orbGq5GXqsfJRwdLZgjt+B5oLCdGxqVHcumTw=;
 b=AiTMY5GdSteZUcLB1xTHEg8sc7VLvWP1T3Xo7eB+Yghlh9Mk1Nd1+KHGocOaYVPuinSaBUO2j
 IS4SeczG5JiBC8UPDpBjo0e4vJ2xH26dDBWyhGipQSpjy5Cp6m1IJQJ
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

Remove the catch-all kernel.h header and add the missing headers to
enforce IWYU.

Additionally, separate the IIO specific header from the generic
<linux/*> headers.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
Header changes explained:
Added:
- <asm/byteorder.h>: for endianness helpers
- <linux/array_size.h>: for ARRAY_SIZE()
- <linux/bits.h>: for GENMASK() and BIT() macros
- <linux/types.h>: for fixed-width integer types (u8, u16, etc.)
Removed:
- <linux/kernel.h>: catch-all header no longer needed
---
 drivers/iio/temperature/iqs620at-temp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/temperature/iqs620at-temp.c b/drivers/iio/temperature/iqs620at-temp.c
index e2f878d57af7..3a3b1f256585 100644
--- a/drivers/iio/temperature/iqs620at-temp.c
+++ b/drivers/iio/temperature/iqs620at-temp.c
@@ -5,13 +5,18 @@
  * Copyright (C) 2019 Jeff LaBundy <jeff@labundy.com>
  */
 
+#include <linux/array_size.h>
+#include <linux/bits.h>
 #include <linux/device.h>
-#include <linux/iio/iio.h>
-#include <linux/kernel.h>
 #include <linux/mfd/iqs62x.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/types.h>
+
+#include <asm/byteorder.h>
+
+#include <linux/iio/iio.h>
 
 #define IQS620_TEMP_UI_OUT			0x1A
 

-- 
2.55.0

