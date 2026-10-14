Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6357238B7C3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946159; cv=none; b=XrSJPDxJts/3ybqyBFi8tUF1fuTTFn9mNbsocE8VwNdJZzrkp1XXtJGZhm3vPMt7f9rIWO+Y/SNV31e2Q1KeCX2iEfpUs2TkE5YxHNUxwU2ZJO35uGn4/Dz9yOpAfmeoAAxpVH8m11MUMuKG+HLtlWmUf+fz6TpqYS7w71FMA8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946159; c=relaxed/simple;
	bh=+3SLjeuMdrynz9l40dS2Jq5P89i68VuZOoPVhtkeOjE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uf4dOBHVwg9t0L31tbnBZ4q6KGMKqnQNo9XQfJJ6HiV3sa8uusX9l/KoHwtQ36Gl/r1g9o3yAy+lppIhpIVFPJcv3PWAYcHpDBYgl3YoLf/Jl7DhMxKe4JFX2lOCRAbJ/4v8RpsHOCzmEPlAQmMO4P3pTsDygOykNq6VdzUuLMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JalSAVTf; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JalSAVTf"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1312721a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791946158; x=1792550958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G3ebFU2EzDxFvfDoimfKN4m5wsDUUHnrmGXuZIPxGIs=;
        b=JalSAVTfuxJVerCPLf/hixYMHp/eir6oI9yL6lAw0lZHjloD18Ovur9U0zhypnOwup
         wYSwAdwjYR66fRyqXXRbn89drNT7bCQz9tZ5rCwQfdFl2r78UijOD8bH8/hGe/2Kg3vC
         jwQKLgs6+jmvjlH0vp0n36cyUbbbCIfJoKzq0gHJvoxjHtvs+pkYyzkbg+wB7Kfr7khp
         4wv5RlhAXLXAQTF1PI+555QiTO93vyHVV/hwUuswl8fQ9duiiP7bjXC8eAn/roKpOCS+
         z9/mpNX4OE88S1XmEvCj0xE9j2zyE+980DEefUAtAqE3O7OIyn4wyxD6LYnviYgTObwD
         OgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791946158; x=1792550958;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G3ebFU2EzDxFvfDoimfKN4m5wsDUUHnrmGXuZIPxGIs=;
        b=Xi6l3OOg6SYDGJANYM04+jdAiAfmAPJE0ZeUcO+qzgLW6Rlgsi+Dpephmz25BAB4/N
         fq+UlY0s3CSZGclxZPpuGp+oRvtYHA149IPyDNKCdeb3N6EDsmVMi72LJSMZ9CfEIKy3
         P4PDd8R5VnNoBeOiMlHsNem/X5hBmS6f6kN0oskra2syOThMWeb3ipup0zg+QTK/CAfQ
         t+hTXLVOMrFECwYPSQs4tVxnpH42SxV7BRgEazJ8Tmp18zaVukZRbN1v2sNMj4T+Y2Sj
         Em7TCPUg70AEmzXNRlCNDcOQZ/6or/HfFqlIkIGc3FsIm9xLl0t0hjIOjd0plY5U/pJ6
         nU3g==
X-Forwarded-Encrypted: i=1; AKwUvBw3al7tPwLSC77O5ESFja7X0qsYw+ch3fOKu6eKygN/++nFICNftWnybRgvIHBm94ZC6vnQAPkMhNwh8Lk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSgYDN6KRzeVXdrTwn4JoOkn6ksufRbZOA/EXk9fOWDo1yH9i7
	qAU7GIbBIF1fR+oiBNaLTzVX1r+h/ZsJyY2OP507M86v4C7C+Us+zUrj
X-Gm-Gg: AYBFou1jBTOIchGlbjwEiR6cGgFgOZa/ibUgWbJfwmPUf44oDph8fxDZ9RYxKUamkKG
	JjzHJ4bP1UR5gJ37DIjftt/5Fv0m8rRynCCHSLXqQqOxespbJYKRZh91xq2bdPSIB0SFbB4PFcD
	F46J8yEmjnPkfPpfEnSCIiRWyc7bOCWlcMrNpeAYTfaAEL39VJXugHUGsLZiaduqbs9OG5Zc23i
	/X3BJHX/iqMYBy21QLEup0uIfcHzVdmc8tgVdvAgPtElzx2bC9esQ+7AUpuDZ+xYavhn1Fw+kN6
	ytjBQW9C4NTmM0nBgRT1KC2AMi1hFzqviOWeLchYRNKP9uXEu5zCi2UG342a9te1CY3w8W9vVCG
	8BKuLkXcxbk0zjNCPv3pRyBIRoLBwhHoj0PGR15LZTyFpk3yvqW9aEXYQF5fJjpgPnB7eoqt6VX
	oxevyG5eBvmzsXqKGBkRZbZGPQlrbUFOTiRO32lJ8nrqw2SGDad4H9Jdf3yMlkdXxi50WpVO8s1
	pd603wnzmKpi0OcykNDqPVuoCX/
X-Received: by 2002:a17:90b:390d:b0:3a0:9fe0:3aaf with SMTP id 98e67ed59e1d1-3ab3a7a42bamr12455478a91.48.1791946157601;
        Tue, 13 Oct 2026 19:49:17 -0700 (PDT)
Received: from drobotics-thinkpad-t14p-gen-1.. ([183.243.208.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac6069ca91sm2227687a91.12.2026.10.13.19.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 19:49:17 -0700 (PDT)
From: Baineng Shou <shoubaineng@gmail.com>
To: christian.koenig@amd.com
Cc: sumit.semwal@linaro.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Baineng Shou <shoubaineng@gmail.com>
Subject: [PATCH v2] dma-buf/test: add KUnit case for dma_fence_dedup_array() empty input
Date: Wed, 14 Oct 2026 10:49:09 +0800
Message-Id: <20261014024909.1769215-1-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630060436.1527498-1-shoubaineng@gmail.com>
References: <20260630060436.1527498-1-shoubaineng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a KUnit case verifying that dma_fence_dedup_array() returns 0,
not 1, when called with num_fences == 0. This locks down the
contract documented in the kernel-doc and prevents a regression
of commit 77a9298741f8 ("dma-fence: Make dma_fence_dedup_array()
robust against 0-count input").

Suggested-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
---

Changes in v2:
- Add Reviewed-by from Christian.
- Rebase onto v7.3-rc7.

 drivers/dma-buf/st-dma-fence-unwrap.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
index 4d9d313b460c..c5353b36f0e4 100644
--- a/drivers/dma-buf/st-dma-fence-unwrap.c
+++ b/drivers/dma-buf/st-dma-fence-unwrap.c
@@ -370,6 +370,15 @@ static void test_unwrap_merge_seqno(struct kunit *test)
 	dma_fence_put(f1);
 }
 
+static void test_dedup_empty(struct kunit *test)
+{
+	struct dma_fence *fence[1] = { NULL };
+	int ret;
+
+	ret = dma_fence_dedup_array(fence, 0);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
 static void test_unwrap_merge_order(struct kunit *test)
 {
 	struct dma_fence *fence, *f1, *f2, *a1, *a2, *c1, *c2;
@@ -595,6 +604,7 @@ static struct kunit_case dma_fence_unwrap_cases[] = {
 	KUNIT_CASE(test_unwrap_merge_order),
 	KUNIT_CASE(test_unwrap_merge_complex),
 	KUNIT_CASE(test_unwrap_merge_complex_seqno),
+	KUNIT_CASE(test_dedup_empty),
 	{}
 };
 
-- 
2.34.1

