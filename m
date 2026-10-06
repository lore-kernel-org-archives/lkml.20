Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2D23F107F
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 08:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791276430; cv=none; b=hpyhOLnybfUTlDaS//QU5BUI2TKkDqgR5o+zoTPN/mMP6hyy8fItxAXCN0PH3+XHIt7iH72N4XcRed3Jk9vyInGhWTTS2ugDlorNnf82Toh84tcFEb3MM3zD5lp5jVFPiImnYtE5JsxR7+yGgq5vgXcThMeEoq1z8eWKnL/35Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791276430; c=relaxed/simple;
	bh=Y5I/CL1DWi/QmLGmTujVQuDA4qOWChsyqtJ54JZGcwk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fXc0Ej4t9zyxnOIN1QLjI26/6t+yTgeNj+hGT9lf8bkBh+arO3oTMVkW6F1ldRRNaJ+FlR8XyFKJGi556kMZ6U+3ukYknoncJdp03RC+Q5PETY+bjbT94edeWhAG+XjX4Dd42oSOXO6ggpB9uljuwNz+af39A7aT55LnxIWlnoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oG79txoC; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oG79txoC"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-144f7915346so841886c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 01:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791276427; x=1791881227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WhUQkB5ApWubW83wi3NSnOcuN7HDiWQBERp7rOqWnYc=;
        b=oG79txoCf7Sza+JWT2OIrYi/Cltd6FgYjpBOhQRdBNKdA92XhNIWpf7HlwE1QCXdB4
         z36QPMmZeH5CxAvwnDBwhEIoNl35Kv1/cPRYidIOdwhrV0lt5gBDANdfCwYa3nLQo1NO
         OWVHdZf1v1kcJbqgvZF9hsv9sheHJb9ahc8+7KyYbqtxwQY7MZX0c8saT33eDox+WaqC
         SeIAmZ9Gh29ILUNupxT8RA/h/ZEX1icQjR32lJ7LXIN4g6o5LhzgKOKhvrCcl2Kk/2Ob
         6y9XWZSfiuaxDPY1/BNOihyRys1AZuCkP9jCZwSvCyzFT78JCaPUMS1hzEntg4hHRT6q
         je9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791276427; x=1791881227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhUQkB5ApWubW83wi3NSnOcuN7HDiWQBERp7rOqWnYc=;
        b=cmmzccXQWJe2/U475saT8gHDy0KBVzFnxN+eUOnVBbAjE7bqP5fthlBLYR7u39ZqSD
         oUj/xs2jAnJO+my/2FMeCn+OeI0JA47R8fxM8G0XbFhUSw7GMbowchhi+jkr00BTMp+U
         Jws1yZDg6xggnqYfEnbyF/3CGx7e67uBdxFWhua/CJhlKVRzOgDRKQTL9hiuE3hQ8phG
         xx5qUoQ6dyl9YMD17UdLQT7lNiVtu4NwjiALNNTBb+foHX45kRtX33c472iI8zb2LYLc
         hY1PgXQUoBi2AsXy11PQfizsQnJeEkI3MW2au6+PqqxzCYI2Y1611drAaYL6dRFyUR8W
         +v8A==
X-Forwarded-Encrypted: i=1; AKwUvBwMU/qm4J2F/OjeplCB7GUtrTLjJ+S8SVw2ohnvnAfof1OoE66TC+9gJ52wkGLwBb4C47pPdHT7qQQHBII=@vger.kernel.org
X-Gm-Message-State: AFuF++kv7O4Hn4x3IO4FOx5ZJ9JWpAjFBWArRDiqn+1k4cWkoQ72hT+s
	CWIWIRixVQbtaK4W3awBqBaR17Sup1Pz5xcFS4u6wJOFqdSn1VV7v7Xmc6DAlQMN
X-Gm-Gg: AYBFou0dCYJ7cbUT8TxG1avcGAT8b+AX7+wYxoBb842ZKLGm7ZlGQ7oxezpR0oSprPV
	BoPFd+yrDjjS4pgk2VIf3GDzasA6+Cft3vMOv0qjD4stBD5j3uh03a0z5pXkOW23OJXLeAElVa/
	q72kniPsfBljWsrMdMNbI3GAagHOnDytzdkgnp5EVz/BJXq2cVIZj8rYV6QqyaMEpcXlc83gKQh
	ORs65MPdqkYqi17lrTusT5rD/cgLnx1a4yjr+jedvl6Fm/ed2J9QsPGR3Hk8ypBLi1zi0aOUG+Z
	ayK7DzL1HHb19kp+Mb75SQEVtR4PmD9N7OrEeWh9FVfZl2CZMRbcLKNtDD/V+NKVtMBcMlFBwmH
	yDBuhte8BVoR+ROSBNHwVzGucwgwe5AQ9Xh/KBnFTn0EOgHh8esqNdrnxfQMuQKlyluCRSWKtQ4
	C32tV3KdHwssMXdXJ89Ezox4/v/e16B63Tmay2TCzlijj8poVEQ5YKkdHf7YcXcEouM2otsJSpl
	rpWuBjV2B3F/mDBiz7ClDk=
X-Received: by 2002:a05:701b:4588:20b0:147:9ad0:cf10 with SMTP id a92af1059eb24-15ece6d2ce6mr1097108c88.47.1791276427314;
        Tue, 06 Oct 2026 01:47:07 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d83d6ac9esm6966415c88.11.2026.10.06.01.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 01:47:06 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: ppc4xx: fix typo "contoller" in comment
Date: Tue,  6 Oct 2026 14:17:02 +0530
Message-ID: <20261006084702.5748-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment above XOR_ENGINES_NUM is missing an "r" in "controller".

Link: https://lore.kernel.org/all/asSzFW-ZJ16xhFnA@parshuram/
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
Split out of "dmaengine: fix typos in comments" as you asked.  The rest
of that patch was the "upto" change and is dropped.

 drivers/dma/ppc4xx/xor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ppc4xx/xor.h b/drivers/dma/ppc4xx/xor.h
index da1230df2817..0931e18cd0d3 100644
--- a/drivers/dma/ppc4xx/xor.h
+++ b/drivers/dma/ppc4xx/xor.h
@@ -12,7 +12,7 @@
 
 #include <linux/types.h>
 
-/* Number of XOR engines available on the contoller */
+/* Number of XOR engines available on the controller */
 #define XOR_ENGINES_NUM		1
 
 /* Number of operands supported in the h/w */
-- 
2.47.3

