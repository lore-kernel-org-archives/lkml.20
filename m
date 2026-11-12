Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466266;
	b=nqVqrF5XKjw/c2rPZDcbqzXI3ciUwhkaTnFhoU6aTFTFJ2dDThMG2oREfjVOmWnK9DXa
	 xwaxJJseF+QuGNKeKZ2bN/FfGU7m1efqpjQL1ncQAXlfNLCNMRadZ6BuFTkWYL4zXUtbg
	 m8oxtexbNFvLYr+RetP66xOSsu1gBXwNqejdPOFZ+pOPZGH4wsjfovvgY0FwPN4U+08Rk
	 gUAnwwcFbVpKIBKRsuy9zc6x2aGKTC7IvA0Ii7iR5/knq6+d+OwFem6aO2xEAKLPLoaJR
	 m0R54pRREtT30hObIpVG5goM+E8WPgU73hjLLvwrlgQxkek32aBFQAEiQFBELwtLAbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kiOAjw508mciKfyacuxKAhkD/CSrvZAn08VTWyigGlM=;
	b=CDJ3G2IKumx2qzt4wf+ngLyahqae5E8ojl5q9ZQ5m0QkzEtTLyWf3q+/oVLwyS/5xv6g
	 18dxd6VHACUkbP396DZ0CPPVgksGoLvIEVYdSXq51wtfR3RO5MeSe4ZjGAH8LE5RajwKd
	 uUfmBdetC4dWSQAEVPI2uBmCDfoaDPBU9ATXjMLieKpbnIT3QJYOjvHC9nP5755KRQIDI
	 TSLS6mYYizBApK/FCvLqgTQirxggSh6F7jgF9DkHejmtr8nEOQp/w7V12rX+8z544wAvV
	 cpRgjQb40UccEahjmhOsIYB/skhGRH3tyJumb4rRPnZVLXxPrVeogWy8BfMw+H0PkPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QmRZwGuc;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD6B606E928
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AD6B606E928
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QmRZwGuc
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36f6295304dso4655904eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466265; x=1795071065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kiOAjw508mciKfyacuxKAhkD/CSrvZAn08VTWyigGlM=;
        b=QmRZwGucrJ/Xqka2MHnrxgDhbtt47oO6SidE0J+2osYC4WrpJypN+cWdNA2ZfuLHMe
         GkGpM605TEs2AAxQIKXqc2dn8J4Dvkhi6HhXR9JVbqUxSdcgWsA5zcqnVxT9sLHmz5ye
         3kCelw+udGbw8xXj72vveKmtIOHGlFQTnHENilZnLwAyHwcQ91L17MPyCMdpP361ULra
         1Gx9pAEqz758BuP7s5vscXzsbjEZDpwO+hDDW+1Dge9Qud18zlBJoAfuxNMXn9jHGU4e
         NCRNguefBJ5/NijLX0BFL2yG1mE+fB5kzDzSbtkivVwAQhbiPes4N6VI97bikTeXfzH6
         sDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466265; x=1795071065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kiOAjw508mciKfyacuxKAhkD/CSrvZAn08VTWyigGlM=;
        b=TPWI1zskS5r9hIKN8WHfuH+mnV5Vw9ZkSxEOnKnOty+ybj/rra57zzijJQzskFkKWD
         xC+YrqUXFKxTGlfIPr+CVi77Ggoe1M/PZjuL5vGr/vqe5kXCfzER4uvgSKE3QV7mol+d
         1ikWHzY1GjGG3Ty7XFs2kEbYJU76gZWe5acKQkXjrvbeBGQnZdiBVXahlcsotSq/F2Z9
         +m7UosGXF1KsgoSMFDKbE0fKQ0taQUWSJPOM6G87GEDdouVRz9rsmd2A7aTU34h+HcD/
         xCOlzoxU4PZYpe6kbPd/fosc0MvS8BXCUI/ettm7PnzDCYzBRU60v2BivFPw3Qonr238
         OalA==
X-Forwarded-Encrypted: i=1; AL+hErGkpmIkcbL2W4yyI5PXc3jLFUk5Mz9/2xbCoAxLFKRb6r5s+b6LHdwg00InxV0rpAmJ/5H19jZITGCWQ+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8STEE2qURJvuUs3S5UIEMlsoROaUWzgWY2sqKWGG+JkjTEVeFi
	VzY+kkoZioR9Fx7rZNVwxfBKuD/uKsHgyPJEJjc+6sobNzAwp/Gp7mPc
X-Gm-Gg: AYBFou1+fJAgC76OCjsSASRnh7b5InYRWQnYJwjh33jovjMfUr0urPaVe3m7WjDHt/X
	+CqISBi1oV7jVw+atUELaUadzXvmaTSUDOx6ous4vDu9OMdHWcV8PnhJhLZHRrqti+bihW83Wep
	34h70PTCgyKFJIdd3rkn0bTIL5tL3KsA/t7VXhtyMpI+xafFOfGaDALU4du73NZOqkc+uAlm/Pe
	777g8LqbCE+ai3xh1ifsoHBXs9g4/SUOpk1Yq4AsO7TBTBS6zBI1Qt8WA3GFbiBYqxtDd3hlELS
	btQMzraZeMbXxFkjR9FPvikSFzT5T/Q0XaG3DNyrl7+e5fy+TvD4OUQquV0nivFcO8S/FE7O1kU
	iKhEtIYsuc4ZRRBU22oaKpbGpJehkqIztwGCIIUNXOjSWI+kAaBo46BTqX9zVnvAcqGR1Dptn5I
	Na41abMeQB3mKDUBnhY8jQu4490tKAFnjrFiDLywul7huV2DbAWJqnfqDFArm0BgzCGrRl2VPca
	PRTwPDxWpPCI3jWJayGVDX8aPftzaLDKSw0jya/hj0Xbo4Cpm8YgJQL5ob4Rd/daY5/1Nv2oIvw
	hLcmCQUd8103No3cMu7I2qohmK02U5em3RXMI5fixqonBe/oDCO+L6uHD8A0ITyIh7n4jlhvxUT
	TuwJ95fO1I9jqxHmR
X-Received: by 2002:a05:7301:796:b0:36e:a321:5353 with SMTP id 5a478bee46e88-3768385f3ecmr4818851eec.2.1794466265270;
        Wed, 11 Nov 2026 22:51:05 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306casm20788624eec.9.2026.11.11.22.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:51:04 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kim Kyuwon <q1.kim@samsung.com>,
	Evgeniy Dushistov <dushistov@mail.ru>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Input: max7359_keypad - fix coding style issues
Date: Wed, 11 Nov 2026 22:50:58 -0800
Message-ID: <20261112065059.1802480-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261112065059.1802480-1-dmitry.torokhov@gmail.com>
References: <20261112065059.1802480-1-dmitry.torokhov@gmail.com>
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

Include <linux/bits.h> and switch the configuration register definitions
to use the BIT() macro. Also align the arguments with the open
parenthesis in max7359_initialize().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/max7359_keypad.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/input/keyboard/max7359_keypad.c b/drivers/input/keyboard/max7359_keypad.c
index 686832fe2931..c6673bda67ba 100644
--- a/drivers/input/keyboard/max7359_keypad.c
+++ b/drivers/input/keyboard/max7359_keypad.c
@@ -10,13 +10,14 @@
  * Datasheet: http://www.maxim-ic.com/quick_view2.cfm/qv_pk/5456
  */
 
-#include <linux/module.h>
+#include <linux/bits.h>
 #include <linux/i2c.h>
-#include <linux/slab.h>
-#include <linux/interrupt.h>
-#include <linux/pm.h>
 #include <linux/input.h>
 #include <linux/input/matrix_keypad.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/pm.h>
+#include <linux/slab.h>
 
 #define MAX7359_MAX_KEY_ROWS	8
 #define MAX7359_MAX_KEY_COLS	8
@@ -37,11 +38,11 @@
 /*
  * Configuration register bits
  */
-#define MAX7359_CFG_SLEEP	(1 << 7)
-#define MAX7359_CFG_INTERRUPT	(1 << 5)
-#define MAX7359_CFG_KEY_RELEASE	(1 << 3)
-#define MAX7359_CFG_WAKEUP	(1 << 1)
-#define MAX7359_CFG_TIMEOUT	(1 << 0)
+#define MAX7359_CFG_SLEEP	BIT(7)
+#define MAX7359_CFG_INTERRUPT	BIT(5)
+#define MAX7359_CFG_KEY_RELEASE	BIT(3)
+#define MAX7359_CFG_WAKEUP	BIT(1)
+#define MAX7359_CFG_TIMEOUT	BIT(0)
 
 /*
  * Autosleep register values (ms)
@@ -143,8 +144,8 @@ static void max7359_close(struct input_dev *dev)
 static void max7359_initialize(struct i2c_client *client)
 {
 	max7359_write_reg(client, MAX7359_REG_CONFIG,
-		MAX7359_CFG_KEY_RELEASE | /* Key release enable */
-		MAX7359_CFG_WAKEUP); /* Key press wakeup enable */
+			  MAX7359_CFG_KEY_RELEASE | /* Key release enable */
+			  MAX7359_CFG_WAKEUP); /* Key press wakeup enable */
 
 	/* Full key-scan functionality */
 	max7359_write_reg(client, MAX7359_REG_DEBOUNCE, 0x1F);
-- 
2.56.0.567.gdb80ae8cd5-goog

