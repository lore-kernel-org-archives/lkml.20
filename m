Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A89333FE05
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856249; cv=none; b=WSVyzFHUopgKR0yJUAujccdBEhaV6ZLEPegbPkjv8MCJrf9OP7Va+6sBgTSI+dQI7XierP4LEgEVvbh10T66hN+2767YRhiNJa3cJIzkTDlLIbkYU7qNO7nrnaOj64uMm3JWEdpJa9sg4sEvCI43Gq+qx3R7BSKso6VcKxzDM14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856249; c=relaxed/simple;
	bh=QyHI2b8vUjfsZshB7ZA4R+b8UOgMbtTR6vWVwk9K8Bw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jxl60+x59GEqrpnBZRHfxpLgD8wn2pbU3bRLdwfeR/oNeebIjQRvPp5dEk1ZtCkDPvi/7+QbrP5fzl+b2PYfdOO8uA6kiIocgVVNA/b+WGRkyOVsESqKDvJTwykdfUVl5A1hBkCzF58WplimwbtwTupNFIQtrhFtNjFJ5k5hrN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TrVWu2kK; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrVWu2kK"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea34ef3so1549155a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856247; x=1790461047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gTQzb9hcxrg8y0CPqmDSwjH9nAbj97Ik48As79CZ6M8=;
        b=TrVWu2kKo2NNhxx0yPNCs1SsW40TgKofnczlS4AvhnAuQ6XLY77/CsQmJjSrw2p7OB
         Yu/dVZPrTR5rInpogl9c/toHhuPXcQ5mqEtx4a4Tu/wa0YZH9NqZJ7XyW88Mo/i/31Sd
         tlhvkvNmBlRdyRskAlif0tbEl6BYqBnax8r6onBPsFRuqNZJ9hUURecbHQFFsUXELgbQ
         jCg4lJByxk1PzWK8CPzIHehQRCY1lsxdDoxUwaI/Y6+DCcbbIEWVY/Rr6tzmiKg1FeZ9
         Raki0blG7VQNbASkSY6NUTzuW1BYZHOgk/g/MpBWmfTNi062qc9gghmS/OzIYdjf9QuD
         d4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856247; x=1790461047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTQzb9hcxrg8y0CPqmDSwjH9nAbj97Ik48As79CZ6M8=;
        b=cLBYOUlak83i2EjyZVGwisj8GtG7ym+kd/pHb12JbH8V9iOtanFrXeJK0B9RywSalT
         Xv2AxwD2ipGyniujx+kVWyp45W7sPFrqE3u69YCx2njKzhi58VQGyXrh8z0vRFxIY7Fi
         HR/RTX2jgbUMnwpHGv8boEk1N6EgC1L0lGEjGNr8hbLiVmfAe2HUTw/UzcigP/MtD7GV
         FBOb2cWCLTlrqfkcyBGHeuINLPe4gOyGWz+JQD+ZaagGXLYv4aS4vR2dKnHQHfQ/4Lcu
         0wqi/AHd8aQahcSFk1h5fa60HNiAQwK1F6KanxjaC4rCB27buzyAeHL9B2lxLMrlU6Nh
         CP8Q==
X-Forwarded-Encrypted: i=1; AKwUvByRPC2YUt8PIxkKiHfumlwnBdQLjgrNJ65fJYFOxuh+35LLD3VHrSg+2p2avF++ndbr+GlRXY5ejDrgfJk=@vger.kernel.org
X-Gm-Message-State: AFuF++n73glVpvXROfq1RyJ1pum9yASYKPXapiVASvC/B1YUmqt7WE5g
	/quDFvFG+Q+cu32LFBToqhPMjadm424tUvuOZfkAvI4ngbePY72H+1gs
X-Gm-Gg: AYBFou2yhJw7rfM+hbeZcibqD369qxuJic8JT1avxHuw09fMVwrty5EPJ+uytJ0QQlJ
	P7t1JNrxa0bfPID94XpXzes0LoZL0uePbCKk7I1r18M4ls2+Q/n7zRR6be/6momxnxUCAZ3D+rd
	SEiBQt+KAdHFtigeyknERPwDk6wKvQL+z0Rw/TyzHJ7SI0eRIqF3k1iDxaHgcye0vi738l8wbf9
	sdlufEuYcjuQRUNEXjDAH+TmqbwAo871wdcRkTDYYGNWTbmfkZh+6LDix82G4GxfJXV9Wk0z32j
	9raqE/8VzfudIvAmWAcnvNmvI/CtqP+U8SsBIj76klgqS2/xQyABHwj2HWsCkS+NjbP7XzpN0ZY
	CyL/oQWRQLm09I/GZ+zD/e7guQrFGIe9u2hFrs6BlPFccRV1s/F54QYsdPOh0yfFr2Y4vMQrt61
	pGMTd3VpSPS5AVHYQdgmqXFJey7rLcwox8FtaWpKt7bh5G7P57qqkBIYledBK4rUVR2MNHbJy2I
	mKrnhU8h/kqcKXLwSyWMoQk1citonVXtAMNKkLuDz6Fsr51pl6JmIk2X70XlyWr7y1XEihbd5i6
	BOYjX6Sa/g==
X-Received: by 2002:a17:90a:6090:b0:39e:6d82:dca with SMTP id 98e67ed59e1d1-39e6d822139mr3123163a91.30.1789856247537;
        Sat, 19 Sep 2026 15:17:27 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c615f05sm6424373a91.15.2026.09.19.15.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:17:26 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring: fix cloned compound buffer accounting and R_DISABLED restriction bypass
Date: Sat, 19 Sep 2026 22:17:25 +0000
Message-ID: <20260919221725.3706704-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two issues in io_uring buffer registration and restriction
enforcement:

1. In io_uring/rsrc.c, when registered compound buffers are cloned
   across rings via IORING_REGISTER_BUFFERS2 /
   IORING_RSRC_REGISTER_SPARSE, unaccounting on release can underflow
   mm->pinned_vm and user->locked_vm if head pages are unaccounted
   multiple times or against a different accounting context. Track per-
   imu accounting ownership cleanly.
2. In io_uring/register.c, enforce IO_RING_F_REG_RESTRICTED on rings
   created with IORING_SETUP_R_DISABLED so restricted opcodes cannot be
   invoked before restrictions are registered and enabled.

Fixes: 735729844819 ("io_uring: move rsrc related data, core, and commands")
Fixes: c43203154d8a ("io_uring/register: move io_uring_register(2) related code to register.c")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/io_uring/register.c b/io_uring/register.c
index 02bc103bcc9d..ad6f2a3c98a0 100644
--- a/io_uring/register.c
+++ b/io_uring/register.c
@@ -764,7 +764,7 @@ static int __io_uring_register(struct io_ring_ctx *ctx, unsigned opcode,
 	if (ctx->submitter_task && ctx->submitter_task != current)
 		return -EEXIST;
 
-	if ((ctx->int_flags & IO_RING_F_REG_RESTRICTED) && !(ctx->flags & IORING_SETUP_R_DISABLED)) {
+	if (ctx->int_flags & IO_RING_F_REG_RESTRICTED) {
 		opcode = array_index_nospec(opcode, IORING_REGISTER_LAST);
 		if (!test_bit(opcode, ctx->restrictions.register_op))
 			return -EACCES;
diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 51b46e624ddd..1efaf29514e8 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -174,8 +174,8 @@ static void io_free_imu(struct io_ring_ctx *ctx, struct io_mapped_ubuf *imu)
 		kvfree(imu);
 }
 
-static unsigned long io_buffer_unaccount_pages(struct io_ring_ctx *ctx,
-					       struct io_mapped_ubuf *imu)
+static unsigned long io_imu_unaccount_hpages(struct io_ring_ctx *ctx,
+					     struct io_mapped_ubuf *imu)
 {
 	struct page *seen = NULL;
 	unsigned long acct = 0;
@@ -188,17 +188,14 @@ static unsigned long io_buffer_unaccount_pages(struct io_ring_ctx *ctx,
 		struct page *page = imu->bvec[i].bv_page;
 		struct page *hpage;
 
-		if (!PageCompound(page)) {
-			acct++;
+		if (!PageCompound(page))
 			continue;
-		}
 
 		hpage = compound_head(page);
 		if (hpage == seen)
 			continue;
 		seen = hpage;
 
-		/* Unaccount on last reference */
 		if (hpage_acct_unref(ctx, hpage))
 			acct += page_size(hpage) >> PAGE_SHIFT;
 		cond_resched();
@@ -207,18 +204,38 @@ static unsigned long io_buffer_unaccount_pages(struct io_ring_ctx *ctx,
 	return acct;
 }
 
+static unsigned long io_imu_unaccount_reg_pages(struct io_ring_ctx *ctx,
+						struct io_mapped_ubuf *imu)
+{
+	unsigned long acct = 0;
+	int i;
+
+	if (imu->flags & IO_REGBUF_F_KBUF || !ctx->user)
+		return 0;
+
+	for (i = 0; i < imu->nr_bvecs; i++) {
+		if (!PageCompound(imu->bvec[i].bv_page))
+			acct++;
+	}
+	return acct;
+}
+
 static void io_buffer_unmap(struct io_ring_ctx *ctx, struct io_mapped_ubuf *imu)
 {
-	unsigned long acct_pages = 0;
+	unsigned long acct_pages;
 
-	/* Always decrement, so it works for cloned buffers too */
-	acct_pages = io_buffer_unaccount_pages(ctx, imu);
+	/* Compound hpages are accounted per-ring in ctx->hpage_acct */
+	acct_pages = io_imu_unaccount_hpages(ctx, imu);
 
 	if (unlikely(refcount_read(&imu->refs) > 1)) {
-		if (!refcount_dec_and_test(&imu->refs))
+		if (!refcount_dec_and_test(&imu->refs)) {
+			if (acct_pages)
+				io_unaccount_mem(ctx->user, ctx->mm_account, acct_pages);
 			return;
+		}
 	}
 
+	acct_pages += io_imu_unaccount_reg_pages(ctx, imu);
 	if (acct_pages)
 		io_unaccount_mem(ctx->user, ctx->mm_account, acct_pages);
 	imu->release(imu->priv);
@@ -1280,6 +1297,7 @@ static int io_buffer_acct_cloned_hpages(struct io_ring_ctx *ctx,
 					struct io_mapped_ubuf *imu)
 {
 	struct page *seen = NULL;
+	unsigned long acct = 0;
 	int i, ret = 0;
 
 	if (imu->flags & IO_REGBUF_F_KBUF || !ctx->user)
@@ -1302,10 +1320,14 @@ static int io_buffer_acct_cloned_hpages(struct io_ring_ctx *ctx,
 		ret = hpage_acct_ref(ctx, hpage, &acct_new);
 		if (ret)
 			break;
+		if (acct_new)
+			acct += page_size(hpage) >> PAGE_SHIFT;
 
 		cond_resched();
 	}
 
+	if (!ret && acct)
+		ret = io_account_mem(ctx->user, ctx->mm_account, acct);
 	if (!ret)
 		return 0;
 
