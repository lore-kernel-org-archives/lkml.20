Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D46D3A9620
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789780089; cv=none; b=HocjIaocLPQy6UuoegYMcBE9vs6tQH8e0cNo48HeK0ax67GODfwSPpc+/JDs3+C3NjikDlCanzLKJAZwLfvWQeo4ove+QD+fmWPbZGexfAhNvtEQUB0K0/tFubFeX7gEovsOe0cVEZuhpgf4CsPHQk7rMJmDVVj7Emvn7O1tJB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789780089; c=relaxed/simple;
	bh=EQFrQWiJlGagT7w4+GhBtSvH31/scfS3RFyv8b+wXzA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u1Pzm/AgEWJF9MnLqaqaqYx8WIcBwdTEq91261/es/tXbM7cRsd4x4ppHjWtMJhC4F+JcoyCFrv589q2Ewhm1lCdo4gyaMcSMLpgfsUJLAo2j46lKeKNiKrJIVSkj7fYpKt1zCGD73nCHryqje/F2ByHYA0+qJJu5i1r34kRGZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSn6W/M2; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSn6W/M2"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb752so1140964a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789780083; x=1790384883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3Zb0gAgIAZPALGu7730yya+hZVxWCGnJ23L/bCuQ7k=;
        b=GSn6W/M2wO/XtXODftKeL6Q1pM6bfnO9W0/VB8Xum2z4o2GPs2fu/jEr9D8FipUpEu
         kP5kUG1cgXurRHUZjKvHjSZI28sH4gBvQJi6+zydyvYCcW1200D1G8gaBvZUWwDlBV+N
         kcFqATHROUJSZ31yXMqFnqMTyxmafGqD95IWF1wPrczyhpcThDRETshNMYa9+iKmtH4s
         4sCDde5W2ax2iXSJIW9g4i8+SokTOY7QMY2w0nNIQhj3umG+iQEsnG2tObqM7/ZodEyP
         nP44EKc3Q8H27QEEdLHR4zMSkRJ9NYgt/sGqu3ufbBHvzA5JHHs5/aeWNXx+h4bnm7uO
         lnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789780083; x=1790384883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3Zb0gAgIAZPALGu7730yya+hZVxWCGnJ23L/bCuQ7k=;
        b=RlDVwN/Z55WPkxGaAduBqVaLiVo59dR8arzODfFQaxnxoTq3L/UqnawgS/56NdPCmU
         455lUMz/Z1gH1kL75BAwsfy+sdDt4+29pc22txZPWhQpMwPKR1cG8ig6T0Z1asDjdeLU
         kVQBrfWmsGt7BCutS+gFRHMpzmz/sFKL3HYIwQm0CUrsgzF1lRpGMDCFZ/lF/fAiizon
         HhRwqSwASJDH51P5T0YJF+X0WdPI6Uzt7pMlcmwdTeVmA7GLp00NnrAozJY1l8swR/iK
         NSAHQRie58f63cXSxNUVJECNsmKHG94enLX6eESXMeX9tAoybr5HcsBfcNI1Uk189+k1
         RcgA==
X-Forwarded-Encrypted: i=1; AKwUvBy3hNw2fOyj07OQZ54kx0h6mlmGXum4eli+AYJ3X6AD1SpUAE9tgilNqhMs7kArZJ2DXqMj9DJ5N+WQgQ4=@vger.kernel.org
X-Gm-Message-State: AFuF++nY9nJNACAVmh+NJqSwbJ2Qc8qmCbNWdGGfLm2No1uKimlPBbRa
	mt5NwhMsJy+fdbjrXIDFnxfzwUTWxSzG+xOOEpMr0nFYsz3Fj/7Lw6kK
X-Gm-Gg: AYBFou2To/6F8RBlNRsu6S9GLJPCHL8HmSizhBVeq5oqigQhLFDvqi6O/kwRi5G3sLj
	43jlKL2GIQRjECTmEK8KWDIrLc2mub5kWl4Vja3Lv7t0i840+SYpRTxDyoeXzwpngz+Yht5ezyZ
	Z6xIsDU8fOZbeUTB7Zqa2OBSZ81wP6bXX0taGWgZBaBpNe4C3bx1TW33sihDtZMbxtzRI3zRDZk
	vbg8ITsqswfJ8gsd0kSCy0R6+vIfFH5hjELPvQyEqRo5mnAzrPojjTl6IRjce/VBn9XDz0QY9Kv
	/OPPZ93oFWdbBUvePK2khm71StJR2xytgL3QfHIbW5bKV5Afshs58CreLkunA4fiUtlNLUALc4r
	6rtz72pE/jRJ/vIEx7VYONiWj/1LUK84W5ZRwxtWZuVmiYCzr34g8KOESZwV+0vz2rcHglRXcCC
	ArSYsWNVH88Owi8/HMs1u7//otNZ26r3+g0QNWujRIp20MUGIdMMPcK/Iry7zWPBCnWukSYauVy
	A2hlgoNhsnyT5qJ2dTxwOAjiJTlVJCKT1MNJPiPEjVMWwdmWEmR2LhDpQfzwZPD1AUyOtTGlHt1
	6Zahzs43vCq0fdjAl1UgOrFDS1VgYNDd8aHQyttv+0RjkAsF
X-Received: by 2002:a17:90b:498c:b0:39e:6c69:776e with SMTP id 98e67ed59e1d1-39e6c69790bmr3148763a91.23.1789780083241;
        Fri, 18 Sep 2026 18:08:03 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c615f05sm1742115a91.15.2026.09.18.18.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 18:08:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-crypto@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Antoine Tenart <atenart@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Richard van Schagen <vschagen@icloud.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] crypto: eip93 - bound the wait for PE completion
Date: Fri, 18 Sep 2026 18:08:00 -0700
Message-ID: <20260919010800.754521-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tasklet drains result descriptors by polling the descriptor's ready
bits in an unbounded loop. If the DMA engine stalls or reports an error
state instead of PE_READY, the loop busy-waits in softirq context and
locks up the CPU (soft lockup).

Replace the open-coded loop with read_poll_timeout_atomic(), giving the
hardware a 1 ms window to write the result before the tasklet gives up
and re-enables the RDR interrupt.

Fixes: 9739f5f93b78 ("crypto: eip93 - Add Inside Secure SafeXcel EIP-93 crypto engine support")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../crypto/inside-secure/eip93/eip93-main.c   | 31 ++++++++++++++-----
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/crypto/inside-secure/eip93/eip93-main.c b/drivers/crypto/inside-secure/eip93/eip93-main.c
index e62785952b0d..11e20ce33dce 100644
--- a/drivers/crypto/inside-secure/eip93/eip93-main.c
+++ b/drivers/crypto/inside-secure/eip93/eip93-main.c
@@ -11,6 +11,7 @@
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -183,6 +184,22 @@ static int eip93_register_algs(struct eip93_device *eip93, u32 supported_algo_fl
 	return ret;
 }
 
+#define EIP93_PE_READY_POLL_TIMEOUT_US	1000
+
+static inline u32 eip93_ctrl_status(const struct eip93_descriptor *rdesc)
+{
+	return READ_ONCE(rdesc->pe_ctrl_stat_word);
+}
+
+static inline bool eip93_desc_is_ready(const struct eip93_descriptor *rdesc,
+				       u32 pe_ctrl_stat)
+{
+	return FIELD_GET(EIP93_PE_CTRL_PE_READY_DES_TRING_OWN,
+			 pe_ctrl_stat) == EIP93_PE_CTRL_PE_READY &&
+	       FIELD_GET(EIP93_PE_LENGTH_HOST_PE_READY,
+			 READ_ONCE(rdesc->pe_length_word)) == EIP93_PE_LENGTH_PE_READY;
+}
+
 static void eip93_handle_result_descriptor(struct eip93_device *eip93)
 {
 	struct crypto_async_request *async;
@@ -191,7 +208,6 @@ static void eip93_handle_result_descriptor(struct eip93_device *eip93)
 	bool last_entry;
 	int handled, left, err;
 	u32 pe_ctrl_stat;
-	u32 pe_length;
 
 get_more:
 	handled = 0;
@@ -216,13 +232,12 @@ static void eip93_handle_result_descriptor(struct eip93_device *eip93)
 			break;
 		}
 		/* make sure DMA is finished writing */
-		do {
-			pe_ctrl_stat = READ_ONCE(rdesc->pe_ctrl_stat_word);
-			pe_length = READ_ONCE(rdesc->pe_length_word);
-		} while (FIELD_GET(EIP93_PE_CTRL_PE_READY_DES_TRING_OWN, pe_ctrl_stat) !=
-			 EIP93_PE_CTRL_PE_READY ||
-			 FIELD_GET(EIP93_PE_LENGTH_HOST_PE_READY, pe_length) !=
-			 EIP93_PE_LENGTH_PE_READY);
+		err = read_poll_timeout_atomic(eip93_ctrl_status, pe_ctrl_stat,
+					       eip93_desc_is_ready(rdesc, pe_ctrl_stat),
+					       1, EIP93_PE_READY_POLL_TIMEOUT_US,
+					       false, rdesc);
+		if (err)
+			return;
 
 		err = rdesc->pe_ctrl_stat_word & (EIP93_PE_CTRL_PE_EXT_ERR_CODE |
 						  EIP93_PE_CTRL_PE_EXT_ERR |
-- 
2.55.0

