Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5CD448BA4
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835772; cv=none; b=CwtDfaR037mxKp+9V+m3v5xPtz32cB/kI44BuW5TpKW/qfJ4kkUVeIZx2ATWo5jCAdi7MZcCMoIFImOExpGIJVPsd381Ya90g/lndPWMEAg1f8vDzBugWcHXsgkis401Gn+ecBVk5oF3OdxRA6xZfYthheqCeqqQHwruF/zUPQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835772; c=relaxed/simple;
	bh=5o6ANdOnsEwvHNkc68cYshSKpXo+cUGt41qHOl1Tkjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NdWg67+gP5KxbDT7UWtuzIf0nPY4q4dgvoHFHBsXELfO3F2e3eTDKiV1BDsTbzIGsQOZK9v+NMBmgRNaTS2R8yiuMzemHWU3I7Zf3GjerofK63Iy/MA0rQxzL9+Ow8pLNw4c/JsGvhOFHLNbXLA8ZSPDo/18dsqfejrpyd/kkcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJsnhU/m; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJsnhU/m"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7f4b94d72acso2051753a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787835756; x=1788440556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+YbfpkMbK/g+UAyxQUtADUS+ulixTWRPAVGbjBEwn60=;
        b=aJsnhU/mWHFN0gredSJKoQhgBZ/rL9W4AWSF5ne0MH5cB7Ux8HQ69+zjpUMCFK9QqE
         mSEf0jtrCnRRk3gSqymNEd5Yb5Oh5/uH09ryRBaAwev8UCP2ol9zcltMcFGy+Y0iYxg7
         I+KVm0c2F+cHhYv/J3kqjl0CzuA6/eXhycTdVmJPBt/cbojLqmPJbho8A7j4xQFKMpK0
         zfW5QpOdQvAoL/cMOwaEYDF37lXqAK7HBUmsbamoezVPr4lF8unD0iNMUwjEJs4Tw4sZ
         rZS2uYR44gFTzqa2lol/egznT4HIhsagkvdqmmDsuN/nULRHGv8Fuz9qh5ja5TCgwabZ
         zvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787835756; x=1788440556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+YbfpkMbK/g+UAyxQUtADUS+ulixTWRPAVGbjBEwn60=;
        b=Pd+6c1GFdYV21JK7b2j4HMH7hIj+bzhd1/Xs3Tk0gbwozQ2ZedGsKXkj97sGf9Qrsm
         i9m4PxiEiZxCvHP90HixQvAXR5R7RnvW65/fvVGvpagDas5p1BSpCZ7rIskTZoNX1NcT
         ICDdpJj62Odj3/GXGlm5jsRU6VrzJCt70NlCjI4gyJGXReiJxS2xPxORsiveA9CvrHdN
         EkxsYdXWKI1X5Yn+++DCDV4dYpNFhPVzdF9JGW3ph5YTk75m54oaYYB8LCJrVltbHce6
         OGarhAQ7f3hJGQE8QoEDmMGERahZO91g40CsIz3mE5PDkGc0n89oC6JK8A/xI98r1or1
         Yb2w==
X-Forwarded-Encrypted: i=1; AHgh+RpEdYFqjK9naVAfLz3hn/t3kqfRw8da4NptzCKfxJYNSQbLECAA7OTmJVFgEduAEcRFy6vwpBJ/MflFCc8=@vger.kernel.org
X-Gm-Message-State: AFuF++kDjPUSopchC0V62oViXm2r3l2zIqz/Jx7CQ4O4zeFUrUQShcOn
	dMpdgGceEHLPxEfWiu+EZV59G0AbA2ey7ba19AyO+Mj5XTJn3juoT2I3
X-Gm-Gg: AR+sD1109rcsqTKiw/mUu4w+cUSOrLEtoTMMAI4EG1aHEF+jqHLDNs3CHoKJh83XU1D
	68oyv0MIBYyqmSjHti42xWrYcnB2cEJY9DFKgLqwjGlBM3d2zD6G8g19JYu25TQ6GLFOVLw60gw
	ol2PwCdfWy7I44Dw0QNcar9y1viKcbPOGl0dQ0NKVYTyVS2GHu5zu91o1QO0MWTCD1XY/Bx1TgT
	YeMi2fWHOQRGwQRwtQ3YFOCl/WZGsX7bHT/eYYHP67apGqUsPhLWrThWTr/MaSjsEYCwaSJIxCD
	SH8KWGC5VUhmb8pHzjFZJuIOtdkrFf4zACOI7OFmEc30YDfNR5NWCjk/eRI+DTeXv3LZxLBCtpV
	n1koXby/6Ifq/kh7nlcfbuhmSKetvlftckiQp7tbyaW5r0qUD0Z9t4tXqkjIRYjCBIFgvG7WKWe
	ZAyWZHLSZ5xVmsK5nY61obiEqW8SSmNUADDoptkMIZ9iXc1sBhP9gzu9ra1HCW
X-Received: by 2002:a05:6820:4c0f:b0:6b1:afdf:a01 with SMTP id 006d021491bc7-6b1afdf50c4mr7622702eaf.18.1787835746080;
        Thu, 27 Aug 2026 06:02:26 -0700 (PDT)
Received: from machine ([182.69.183.109])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a9035ff1sm15598089c88.11.2026.08.27.06.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:02:25 -0700 (PDT)
From: Kartik Panesar <kartikpanesar@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kartik Panesar <kartikpanesar@gmail.com>
Subject: [PATCH v1] staging: media: ipu3: remove unnecessary dev_dbg function trace
Date: Thu, 27 Aug 2026 18:30:40 +0530
Message-ID: <20260827130040.117697-1-kartikpanesar@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a dev_dbg() call that only logs function entry via __func__,
flagged by checkpatch.pl as unnecessary ftrace-like logging .

Function entry/exit is already available through ftrace's function
and function_graph tracers making this redundant.

Signed-off-by: Kartik Panesar <kartikpanesar@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-css.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 8063401246fb..b2c8fb7d6813 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -290,7 +290,6 @@ int imgu_css_set_powerup(struct device *dev, void __iomem *base,
 
 void imgu_css_set_powerdown(struct device *dev, void __iomem *base)
 {
-	dev_dbg(dev, "%s\n", __func__);
 	/* wait for cio idle signal */
 	if (imgu_hw_wait(base, IMGU_REG_CIO_GATE_BURST_STATE,
 			 IMGU_CIO_GATE_BURST_MASK, 0))
-- 
2.55.0

