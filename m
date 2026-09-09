Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159015592F4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957308; cv=none; b=oUc2LT0Ihu1n7bHBb0RzxjbPpABA7TXh1Z+1L+qtZ9QeKSQ2b3di8waRNvqVLxElfchF84aFloTR2ao5yhzcFLGoZXRAa+g2xGA3kknHEkF6afGsHSlcG3Qhd+8auV8sLGA9izNV+u4FlSddW0zyPkEwmhPRlPDclCwngYM0osY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957308; c=relaxed/simple;
	bh=yVtL9D1/Wj7jW4CgDSaIkKq7ZVcdtGzj+1oinlRj6+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fGrpym2TOuOoNqiaI9acxprTO0tpdiPIOmTTu0/wRzQ71NY4Sif3VVht4anJh5/5ZSQQvJsPRjDnJ9wFRtu/XxEnWDW2jN+N8VVRw3mE1s8YFfe2CK6f0M6FLk5EMmJeX3zH4nvGoip04fOnFIWsLh/lfSHfhTNCAg71AOzq7f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dB1dnvD5; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dB1dnvD5"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8686f46e4adso111971b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788957306; x=1789562106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyKDUP1nZZUAqox8fiTqoJmWbZILKCs3z/CNmlWToyk=;
        b=dB1dnvD5jMKuiemDBdn6176fPKheqDZ5zI+/5L8mGdYqWteE+NjyIvM7H1foSQWZzX
         zfDnhFO/PJbDBXOtfL0zYRcC8sfri228P3kBkVKDbfjZIqpXZDBl5fOIdrsxfMF5OytN
         O16B9PtBTuqLB+rB0bFoSWFyGUGU/YJZbTbd54DfJ8aMkFaanpzOKT6QuadOfgTVZkYn
         GikTcS8JoO6+CEFlhj8+IafR93ngwSYH3MsvwyMpy7JuglgRw1a9oXu10CSanK2Q5cGL
         /iyzBP67EOdaeFr4Kf5vLT1AgyvLxmrgNlolELv5ohUble//ELGQs68EoQEGLr1iCPAw
         I8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957306; x=1789562106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyKDUP1nZZUAqox8fiTqoJmWbZILKCs3z/CNmlWToyk=;
        b=DQXyO/xDWxRFo6RXMcbCJuWbwMhJ1xfZVqU2S2kBMW2aLOGnGuFvIzTPm/BKVt51cX
         LFAPJKdAGz1vYXeQbpOHZmT2TmiTxv0tz4oNmFzLaqDOwexz/BGTDKQ7zTNQXTKoX/vO
         LxNBpvpxRmVy02v2okbMDObpIm0wv9H+nP+/ff8kZqjW/AmHnkEuxUTcd63xz5AyfAv4
         FPZ0+X5ekw0wJ6i4+ZGXWaCP4oQTIgaGAjOXf0PL7LEH3312pxQZ9jvKEufk0zVTOXhR
         sROwFDu1l66/Yw9pZeXKX48n5DkYe1ar6IPfsFht8+lEGvIaZkZzXXCri61f/pna6ykG
         8hLw==
X-Forwarded-Encrypted: i=1; AKwUvBwLn/V1aC4lR3lC5USoyzJnRV+5Mxm8VhTtnoxdHCPKIXaqyEioiZordfml807bd8zPS608gXBQsUpWTuA=@vger.kernel.org
X-Gm-Message-State: AFuF++kV7+v2xVVAcsNCGOJ1Zz54zv+vWD9/qgdlTILgUw9peR+SL6vJ
	PzkvKzm4OwGwPec8IINQc8m246DWdPS7Pu7hwMEvBdBZLukpsTAIDnW1
X-Gm-Gg: AYBFou3txYjaFkoLpMV4AgHYH1pN1ro8ReW4I3Ww8imHxrNNdcXa1YB8UnQIn1ffrEB
	V6C5H49aX1ojouGs+jdaC5+RbjMc2TCV9+eyI8k5Q/Lhl/g9k+qiJWbuCcOpHW8808+gOV8+aSg
	zAmoPrkuUjW8QZypRO3lE+OqcK0ebAxQSxRFPpT0QExO5VoX4qMeAf43JWM67K+spnSUiwsOOVi
	VlSdJS/4Q1E8PwdIWS82SiJBeGlnTVdO/YGYTNPRZSwYKcij8RSS0r9HQnr1p0y0Yx0fvNRWGuE
	Joo2CBePAQVQRUb4zWqwhwyLdFxIBameCZKt8DvRNsUngPIiDNgh1g0i8GZ8rIN+R6h4S+u22xa
	AYIMr+4fLD6DfDs70RdAUq4dcVAjelfNQdU3qaI6RJQOitdNk+nT8e2tvFiFEQ8kkgrTjyd/Yo1
	+ZcT7fXv2yXR/vJgjdW1BmnTX7Ii3Tv9iLW4Enu8E20pvxzW0dwsmcJXxX/jbRSSbrg2FZ0UQp9
	CyweFXebHw3TSwfx6xmPNM6rQ==
X-Received: by 2002:a05:6300:6702:b0:3c3:b57b:627d with SMTP id adf61e73a8af0-3dacbdba23dmr1334869637.12.1788957306260;
        Wed, 09 Sep 2026 05:35:06 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm69514341c88.4.2026.09.09.05.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:35:05 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] of: fdt: fix "Cound" typo in fdt_translate_address()
Date: Wed,  9 Sep 2026 18:05:01 +0530
Message-ID: <20260909123501.215711-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment above the count_cells() call reads "Cound address cells"
where it should read "Count address cells", which is what the call below
it does.

Comment only, no functional change.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/of/fdt_address.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/fdt_address.c b/drivers/of/fdt_address.c
index f358d2c80754..2e4e46a58cb6 100644
--- a/drivers/of/fdt_address.c
+++ b/drivers/of/fdt_address.c
@@ -172,7 +172,7 @@ static u64 __init fdt_translate_address(const void *blob, int node_offset)
 		goto bail;
 	bus = &of_busses[0];
 
-	/* Cound address cells & copy address locally */
+	/* Count address cells & copy address locally */
 	bus->count_cells(blob, parent, &na, &ns);
 	if (!OF_CHECK_COUNTS(na, ns)) {
 		pr_err("Bad cell count for %s\n",
-- 
2.48.1

