Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D68146D55A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519027; cv=none; b=cKFsAAVYuHBsuHi11+eFMHm4Ugb6PpYRQ9eT76V775fVywJIRZVUL3kL9E0j3k5medv7BlrHnrj+bB7+na/pGGn6/9tOkxX2Spf1YpwfPEULZ+QRyyBs0HROKnIcnP5vN2xKV/9X9gguruEbXn8NhdtbswqczUP6FPZUtfxAg/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519027; c=relaxed/simple;
	bh=od+ImMTt4C64EYwhe+EWTEU35dKdrFyxn4Bd2TFuh9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rN9+GrW70PJJiK9SgPIKON+/Vyh1WyBOyd2Q/V0D+tvu66NWP+2RVmcQzubbOYdhKkmalBTly2ni7MiEcMgkO4rsV1W+q0KocoahP1yK0ppUhcMSd5bgZgKGEaRBq0fHeCEewPPWi4AOS2qMjggejDPP2WN2KmCkXvuTfSamC+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oxDtO5uv; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oxDtO5uv"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so1860292a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519025; x=1789123825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FjCZfeP0EDpt/v1y7ef/1qHRIUkfgxbZIZOgx9/zeeU=;
        b=oxDtO5uvJpsdU8KyWCqbo7Ii920l+oL7s6ps0Vgq5mdBWJFq3IGfHyvrjWKo7jZvDC
         sFJswHMmHJSiABVSTeQ4ol6ATWil7yHZWBEy1wYlarhrGSatAYxOmduwMI5Gtnjlgzh0
         C6oZ/mRAB6CCg/WRhaQYLO+3NbVKt1bj1TL4FTAN3JkK4NX8+JtfYl7ycSbgMuQ953mb
         fKSm3EfRirjsD0NDWPQ+R8dVjpq1tXWJzSOn68cHZqt6QUzGCb3Dvl61Q9i9bcJg5UBo
         kBKUsAJ5VJAIBmsopnXQPboXX/tZVdIOsznsq7u225jsG1JT2jKzBTZX0i8PQLkbeT2y
         IkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519025; x=1789123825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FjCZfeP0EDpt/v1y7ef/1qHRIUkfgxbZIZOgx9/zeeU=;
        b=rNs/04U3/m3axP+3TjfkNMgZafK8Mmo9qmozgHVrZpo/VpmC9CJiukwA7qlUWoOPP2
         IaJOlxRFFdZa4frEVAXZS/xvv9fYzkrGQiyF2u4cvN83jpKZYCPoJE0w9SOkZxXmcUwJ
         x0ac7a2xJ0ZmJ5ARZgXEvl7KlQ/NeN0X5jqY3MOhBd+VLbAXCCl9uKB2Tw0Lq3ds1QTh
         3frvYI4YLsLlvEOdg6tBoeeIX9N4DZoEbQLkTWfdm+F/J5MYjefqYb7kHNcrmRkVS4vZ
         QB+6ynoL8yDd+vzkHmLMpCqRdMj6wwrSxeb+6H1IjeJ56q5SQ10JiV8x2hDmDKV6RILM
         6cLQ==
X-Gm-Message-State: AFuF++m5IeRsettwikcjOSdD3BTCisaJ7+P/9zcCsfziaDlIYgeVbsBC
	q3manFrL+WYYNyOY+x++QjMrq8hv4R3G1/UMASns/yP/EjEvyfq89seJ
X-Gm-Gg: AYBFou2KW5xlyIjKH1DoZVwxHow+3cNZxoXC5Wms1WuPtZo6tY9zbLeuKcji1I9S9N5
	dGGdMu6H6JMV1k8ST57fdOpyyQlZwm777HDao0G+Kl5RN/wO2uhmskB56QMEQxrkAwpGyE5sIc2
	1fHpH6joara7thbJ6mDjsgKZhsFWT9vlzkafguGzmiw4vj2VCwySY4qTPVfMX/kCzuUibT/G0aX
	GDfD+LaakFuvl0n4cX+JRJSeyZuourr0mgvdj/UP/pshvweSH+CscfjmWdvcbbjalw0s+Uz3u/8
	acyCY7eF3q6Q+37pVC02Ak3C351yFw7jjzvmBn+lnv6B6DNzZg6RpWSnaRjyoFu5l5XMfOfNFIR
	k6T63IM0tx7fvQgAQlMI3VRq37ER5w6rwONxnCZ0IswTniT8zAUeUwuW8bRFtQoL5af/jzHi+ie
	NM5ysdcLasNf7kRBYLPMEOMjP1ExDXZ5k4dSw0asRYLPvTYaK5rvF7tGZkwSj2H0DjVPopmraOA
	MuXmiocYkRmUF4=
X-Received: by 2002:a17:90b:5604:b0:398:c6e1:dceb with SMTP id 98e67ed59e1d1-39b07fead40mr13435287a91.9.1788519025321;
        Fri, 04 Sep 2026 03:50:25 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm6421454eec.21.2026.09.04.03.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:50:23 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH 2/2] i2c: fix repeated word 'to' in comment
Date: Fri,  4 Sep 2026 16:20:08 +0530
Message-ID: <20260904105010.27405-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904105010.27405-1-hemanth.selam@gmail.com>
References: <20260904105010.27405-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'to', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/i2c/busses/i2c-viperboard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-viperboard.c b/drivers/i2c/busses/i2c-viperboard.c
index f596efcc291c..859d9aa6fad4 100644
--- a/drivers/i2c/busses/i2c-viperboard.c
+++ b/drivers/i2c/busses/i2c-viperboard.c
@@ -317,7 +317,7 @@ static int vprbrd_i2c_xfer(struct i2c_adapter *i2c, struct i2c_msg *msgs,
 			amsg->addr = pmsg->addr;
 			amsg->unknown1 = 0x00;
 			amsg->len = cpu_to_le16(pmsg->len);
-			/* send the addr, the data goes to to board */
+			/* send the addr, the data goes to board */
 			ret = vprbrd_i2c_addr(vb->usb_dev, amsg);
 			if (ret < 0)
 				error = ret;
-- 
2.48.1

