Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792827464;
	b=uQHQs3m0F0sOIJmLeJxk6fmFwyjZT8MeFuIEEoGsFAVm3ChTdn09gq1zg58EKJhjvm7v
	 IK0ywOFrJQS4u5Klyq5gsxjg8OFsyvv+aBl9rowA/u79jXxK0+VIGlexODMiPs0FMokWZ
	 Y98cr+z5R05HgDwuwaeIN20cj9aeGxY0GGHw+g5vyPLmxPGZwVf6tFdxHX6GaupshaUxq
	 1thO/7Tryg31z9vaHZVSsmHymqOtKNq5UgVHTBISTvfoF5G/vtaxJ/vLPLSlFz+hTizFG
	 3Vw2RyEaR5/bPUWmma7KEG/H98Xr40eMGpUt3DpXidgFIFlloP5UFgt0/yLQsZs4Ecw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792827464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tc1XY534B8TE5CFUGmLcAlz66NS2raVPHqc7qDFoaz8=;
	b=YH1l9APj0Sb9uron8IiOzGRkK0mAiUummK682WGfHTx1nBBLk9j31GUXULjl3xnuPSqr
	 iHg4cQ1S17WEwl72eTe1W0+eB/gANHUDytFzytjnqlima52QOQWrTCNywCLZ3JZbo6xcJ
	 XbikIMT+pJfvheBACRUAI6B+MBuUFH1KJVFf8nOJDD76MrBGr/JOZpPFuHvid5iLThTkJ
	 D0a/NcFRCk8wuoFCUKbp6j1PU1tJ7TUBAU/tEM0jnSXBc3vTI+QohFfMzquTadGjtzQAM
	 AagHG8OmPAGoprbqmcT13dNrONEIQAmzRKloMZLRskYKcFKn4f9vYUZd0gMXGC2htWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qbtIkNoc;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF706606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF706606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qbtIkNoc
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35c76e9614aso2399546eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792827463; x=1793432263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tc1XY534B8TE5CFUGmLcAlz66NS2raVPHqc7qDFoaz8=;
        b=qbtIkNocUInzBbe1NJ0k2D2r6wGOBKFmnv9Dk7rD1iV1uktCGw//EErLXowyFxAibE
         6jDdJDp4WFaNf/bZtprPb88/jUYgkUbGwHYfEYdTJsPNrGwqhDvEdA0ZjJdtbslt85ev
         0dK11bWPJ6+GHnEjXe/Uc2co4foPmKmRcF6wSIY5r+wYwap6QF8gIa92EgzeS08Rp2yT
         nBCM/wknbNGriOk0IT6zcojAbnGZ3YqLcCUUgpTVI3/4kmSGdDfwFuF/9v6OYng5ATKe
         E86AXzwOoaAH8X1QiNv6YIGQY9tHtfA41XAPVIZXyLs/L1LGF97YG2QA+HC9fPH/jHJO
         GGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792827463; x=1793432263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tc1XY534B8TE5CFUGmLcAlz66NS2raVPHqc7qDFoaz8=;
        b=QCPKQu8TAQ7Xb5X3LxfNQ1DSXuHk7E8e5obXlnEbNzIBY2sgxxoxwuGXFnXBV9urjT
         zKRhSzmrJldIZtChs2b4ZkSreT+i1AX2JB05Hco+auRtCtJQu4ipqlt0OD/zKXtq1dwS
         N+kvlKmq2aqvAzu2MzT/hZSO/aXHz2KwqyhlOGVxSlZtooQjcDC7KNPrujlVt9K6fw+K
         FbVKfNW1RYkceeWp768uy2OynsVEIP0Yrj0+TQpO/iiHtQhbmhimJ/hjlp8PgDSXc1aD
         MVG9T4Auu7982aDkh2lM6++Dl+bGqwqcIgRJ4ro2jPXze++RoD7fqiqwQClk/oO7VvmK
         +hBg==
X-Forwarded-Encrypted: i=1; AKwUvByw1efSgIUqQAmHcxwi7gADHG2I+6gtZKbqsw9ltVUYaaf0nnzRQR4PXJ7SJHbTSQtAFCUfrhBpaV75mBw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7a3zqVhQqsnRP/IkOWy6LxweDLJyvi3OBot6FH/Ba4+tycRRf
	NuwaY4h1TWSREtLzw5Ra7kBhDDv/ZgA5JIe59mrs/3x7PliE46GtjVCc
X-Gm-Gg: AYBFou0imkaXl9G+y7JlZA363RYZZ6ISfvj54B8HTukWqa0DDS8uLry7FBpOsLaChzk
	5hwnpUa2TRNFH0fcRPBLX4sZ1T02A6fqITaw3XMnxGNj9/tMvVi21ofB7xH8LVneevZYMfOenkq
	URuYC5AnHkfOmBE1qVYyfLJjtLkMwuvReyWbHpdC0i7OznCxSKAeIo4aPqHYm+bWwFaDzexMAZT
	PdBSXr0nUn/CGgdXO44Kupyc/iJDRefH1E9opNrLpF9P8UmefYL3BG9SEB5fmZcoB5tpEVvdJJ2
	u8hBzv3I5EnMla/rCFvFlTaoPcJj6xoYQUX8XcXDRIgL66vYWRzwkFsAGwCd1fGdtNdwjKMznH/
	v21K0iZLC0Yv5boh/usKYfIbDOoRF//bL+XK50qB+kbexl32csjWoO2HaauINvFGamDBuIMJknD
	N00Hax3loOy801EowSxzRg99mAjxi1GkFgzk5XIKhAGKUCvXxXX2hSbgYzpwXNabH73aCj2LGVX
	e3IeQ5/oAdx8F5SN+Ci3/IcFrqbFlKdUYH2n9vWii2lP8iNNwA7rn8OYw2LKg1iwO/XCKfPruSz
	1OnyFir5Fd2Kk6yp83IS
X-Received: by 2002:a05:7301:1694:b0:368:da6c:4fb6 with SMTP id 5a478bee46e88-369e84ba936mr2974905eec.18.1792827462776;
        Sat, 24 Oct 2026 00:37:42 -0700 (PDT)
Received: from himanshubakshi ([2401:4900:1c9b:1c1b:d646:355d:1105:8655])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d93663sm5294951eec.13.2026.10.24.00.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 00:37:42 -0700 (PDT)
From: himanshu bakshi <himanshu.bakshi478@gmail.com>
To: sudipm.mukherjee@gmail.com
Cc: teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Subject: [PATCH] staging: sm750fb: clean up PLL calculation code
Date: Sat, 24 Oct 2026 13:05:49 +0530
Message-ID: <20261024073549.29531-1-himanshu.bakshi478@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>

Improve the PLL calculation function's documentation and
readability.

Simplify candidate selection by skipping candidates that do
not improve the frequency error, and defer updating the PLL
parameters until the best candidate has been selected.

Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
---
 drivers/staging/sm750fb/ddk750_chip.c | 84 +++++++++++++++++----------
 1 file changed, 54 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_chip.c b/drivers/staging/sm750fb/ddk750_chip.c
index aa78d0bc1..74ce320b6 100644
--- a/drivers/staging/sm750fb/ddk750_chip.c
+++ b/drivers/staging/sm750fb/ddk750_chip.c
@@ -269,21 +269,18 @@ int ddk750_init_hw(struct initchip_param *p_init_param)
 }
 
 /*
- * monk liu @ 4/6/2011:
- *	re-write the calculatePLL function of ddk750.
- *	the original version function does not use
- *	some mathematics tricks and shortcut
- *	when it doing the calculation of the best N,M,D combination
- *	I think this version gives a little upgrade in speed
+ * Calculate the PLL parameters that produce the clock frequency
+ * closest to the requested frequency.
  *
- * 750 pll clock formular:
- * Request Clock = (Input Clock * M )/(N * X)
+ * The SM750 PLL uses the following formula:
  *
- * Input Clock = 14318181 hz
- * X = 2 power D
- * D ={0,1,2,3,4,5,6}
- * M = {1,...,255}
- * N = {2,...,15}
+ *     request_clock = (input_clock * M) / (N * 2^D)
+ *
+ * M ranges from 1 to 255, N from 2 to 15, and D from 0 to 6.
+ * The selected parameters minimize the difference between the
+ * resulting clock frequency and the requested frequency.
+ *
+ * Original implementation by Monk Liu @ 4/6/2011.
  */
 unsigned int sm750_calc_pll_value(unsigned int request_orig,
 				  struct pll_value *pll)
@@ -293,12 +290,15 @@ unsigned int sm750_calc_pll_value(unsigned int request_orig,
 	 * N located in 2,15 and M located in 1,255
 	 */
 	int N, M, X, d;
+	unsigned long N_best, M_best, POD_best, OD_best;
+	unsigned int diff;
 	int mini_diff;
 	unsigned int RN, quo, rem, fl_quo;
 	unsigned int input, request;
 	unsigned int tmp_clock, ret;
 	const int max_OD = 3;
 	int max_d = 6;
+	bool found_best = false;
 
 	if (sm750_get_chip_type() == SM750LE) {
 		/*
@@ -335,26 +335,50 @@ unsigned int sm750_calc_pll_value(unsigned int request_orig,
 			X = BIT(d);
 			M = quo * X;
 			M += fl_quo * X / 10000;
+
 			/* round step */
-			M += (fl_quo * X % 10000) > 5000 ? 1 : 0;
-			if (M < 256 && M > 0) {
-				unsigned int diff;
-
-				tmp_clock = pll->input_freq * M / N / X;
-				diff = abs(tmp_clock - request_orig);
-				if (diff < mini_diff) {
-					pll->M = M;
-					pll->N = N;
-					pll->POD = 0;
-					if (d > max_OD)
-						pll->POD = d - max_OD;
-					pll->OD = d - pll->POD;
-					mini_diff = diff;
-					ret = tmp_clock;
-				}
-			}
+			if ((fl_quo * X % 10000) > 5000)
+				M++;
+
+			/* Reject M values outside the supported range. */
+			if (M >= 256 || M <= 0)
+				continue;
+
+			/* Calculate the resulting clock frequency. */
+			tmp_clock = pll->input_freq * M / N / X;
+			diff = abs(tmp_clock - request_orig);
+
+			/*
+			 * Skip candidates that do not
+			 * improve the frequency error.
+			 */
+			if (diff >= mini_diff)
+				continue;
+
+			/* Update the best PLL parameters. */
+			M_best = M;
+			N_best = N;
+			POD_best = 0;
+
+			if (d > max_OD)
+				POD_best = d - max_OD;
+
+			OD_best = d - POD_best;
+			mini_diff = diff;
+			ret = tmp_clock;
+
+			found_best = true;
 		}
 	}
+
+	/* Apply the best PLL parameters if a valid candidate was found. */
+	if (found_best) {
+		pll->M = M_best;
+		pll->N = N_best;
+		pll->POD = POD_best;
+		pll->OD = OD_best;
+	}
+
 	return ret;
 }
 
-- 
2.56.0

