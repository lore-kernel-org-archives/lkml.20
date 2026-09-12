Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3C7415F0E
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789207784; cv=none; b=p+Hsqyp0wxidDYq92fRmA+eYtqB1YYbC6FpSdfr7RxJMtFZmOL8jrB3aw9ikOYeJVEfLE85iObOmJvYUV3C8HxU7DIBMl9zYqFsqmdZvPygXPHgFUxrcf9D6W1CFeC0X50xwO8CvnAUbo68PwyNe7NiWkNNLvkho6MVAHtK0MRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789207784; c=relaxed/simple;
	bh=v9ViFWCtxW/zxHuQufqiHJMj7bOlWvbo9EOZPYRc76E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MDGL+JiJyXQIDqdWe2gHY9A4TRlLA1RWo5vy0pWhaFapgK40kyn3oV1Ig7dcPCOgsQRFNDxXTgafGDmQrgAAhpzYoL1pYqPChRutqDjZ0kkYd2EdRpAHijZVOQqS9EGzNgRp7Gxw5++ms1jjue+bxOnCiiPcOSp7O5InXs4Hn/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NauLUaHs; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NauLUaHs"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso4652555e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789207781; x=1789812581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1W8AsMdmrXRE5TTBDW1GBqzHNpVIxdQkkdveRPDbSJ4=;
        b=NauLUaHsLpxxOgKsKIO+WK/rBNt9nwy8Tv2nP95Qigdyruab4SSxtIIOISqaWxSji0
         lQO/D3AATe6ObazCgiIKruIBQ2UB24trCvRlzLONP3tQvVR2zWgH5ngWqBSTal+vofNI
         Y/Ud7UZ8FL46sTzbKlnOA5uH08HraSzS/0cgqWtuJloId1MFzI0inB8KBZZt7tUvfVuh
         6KHBUxh4rJWL7wnQcnF7sfZ3HhCr83Dye5QksGSMJIvyFxrJjj5PCqowfM355RDRWk6c
         lTJj3uSL3wWM6fhRJAGkhpHs4JtKPafzkWchvvHQrHKVuzF1M7ial/Wn3UegisB0LKtx
         YdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789207781; x=1789812581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1W8AsMdmrXRE5TTBDW1GBqzHNpVIxdQkkdveRPDbSJ4=;
        b=RxZiCNgG2vWOf+2lLhINBvtEqLa11yPcgzPq6BSeYHay0sqeseAgvY2UOgu4i9U4CD
         fGvbEw7ouUXrPjGYPGVo7HFvmpwV3o26M6NAK2VCf1DWUvgSu5LVs7AIfKKjMNaa6KwH
         SdfRzkWYnYyL2dXMSCTRmeYdAtz+DmicAP10/48NuqY5kRC19/qmhMM9bpoGfWPvv8uE
         sElX2FiG9126HJHz8V9mnRecaKHGU/CDjW156UvmNspxejfz3CFt+38KYXD8+OcK4Lnc
         RDki8VIkgx0u5LOH22dzhBQ33iwUUc9Vjz64kjTREWHvp8dURMKZR5msdAA5ZjmAQlq/
         BANA==
X-Forwarded-Encrypted: i=1; AKwUvBxU1BmpOAt0Z+uWcXF/CNrOUQRbM5vUpTFhMj2e+A3bvsCn0DlbZ5zkqC9aWLMp4E4a+kc0h+qcEcwgtWQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ltbPo+9XhFHaknXVYN62hhUJp1kDMnvM2W5QTK5QU+n9hEzA4K
	5ZV6KPYwY1SEqp+VEmE0B7gw2MNgf+49MfHCugXXnY4kMGkZAXzumY4s
X-Gm-Gg: AYBFou0keU4072Xy63WKYIElDF7Af+GJfNwJSJfb/lQIdFFkiAB0tkCT+CnWF8kWXmT
	I2Tyr2BsNhPr3Rp8Zeaj33oJQLVI3tJ2HAtcsz5KfMzVRSmC1mhDXgJzdIMHJCrpfISYHm2OJXY
	P7q5EFL4+RX5QFMSHnaV0b+dW+O8IgASyR5Abx2oZY9RVAhq7vkH8T5O+8PtBnaA8PIKr3JZacK
	6f/+gNBbBIzrLjFHpQEE4EZsQsN+wl33HDCYcEg8jpqXZUgKhvrQY2UM+I2coLyH0KT5ahc4xGv
	k7/Svb6ok3hTep+6eNoOkeoC4nWzcgestvg7yjEFS4BwbcCyX48gKJ21YYpZkUC0EfyM/HUF4cu
	EpglZyDc3muHHub8gXjBpo6OBGW8Gvw8cI6uRbXlQaMR1utxF4yQi4jFg5DobLsDNAiz/YhwU2u
	NfFceMNziqqPbvRPjWMLkf8PRYMuSo+N0H98peIurzU4r0sEZzcpGMD73EAgh+OSnMpyICIKoGm
	+lPz6dq+oTSAoulHu9iVoQn1+V1b0JXKVIdjYbt6MH5TPBUyuO7hqj2xgxW+V/DgZEHaDFozjEY
	AjtAQ8rF8aYPqtVb/HttqtJyLx6wgmfNQMeXhC/zHl17D3/P8uPm0BHBIYztpCHdhdFaq+xeCs4
	MUw==
X-Received: by 2002:a05:600c:3b11:b0:49c:f617:7cf with SMTP id 5b1f17b1804b1-49e61645c2fmr153458935e9.0.1789207781220;
        Sat, 12 Sep 2026 03:09:41 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60acff8bsm149239155e9.9.2026.09.12.03.09.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 03:09:40 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Moritz Fischer <mdf@kernel.org>,
	Xu Yilun <yilun.xu@intel.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alan Tull <atull@kernel.org>,
	Tom Rix <trix@redhat.com>,
	linux-fpga@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fpga: Fix of_fpga_mgr_get() reference in fpga_mgr_lock() docs
Date: Sat, 12 Sep 2026 12:09:37 +0200
Message-Id: <20260912100937.86316-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fpga_mgr_lock() comment lists of_fpga_mgr_put() as a source of a
manager pointer. The helper which obtains that pointer is
of_fpga_mgr_get(). Correct the reference.

Fixes: ebf877a51ad7 ("fpga: mgr: separate getting/locking FPGA manager")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/fpga/fpga-mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fpga/fpga-mgr.c b/drivers/fpga/fpga-mgr.c
index 2672070ced026b022454e730520ab147fb02431d..5a0b7780b335887f36f7f182c28c8514f75e1733 100644
--- a/drivers/fpga/fpga-mgr.c
+++ b/drivers/fpga/fpga-mgr.c
@@ -744,7 +744,7 @@ EXPORT_SYMBOL_GPL(fpga_mgr_put);
  * @mgr:	fpga manager
  *
  * Given a pointer to FPGA Manager (from fpga_mgr_get() or
- * of_fpga_mgr_put()) attempt to get the mutex. The user should call
+ * of_fpga_mgr_get()) attempt to get the mutex. The user should call
  * fpga_mgr_lock() and verify that it returns 0 before attempting to
  * program the FPGA.  Likewise, the user should call fpga_mgr_unlock
  * when done programming the FPGA.
-- 
2.39.5 (Apple Git-154)

