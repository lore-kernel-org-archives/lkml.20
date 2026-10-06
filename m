Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09AF3EEAEF
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 12:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291482; cv=none; b=Mnyx2Gl3cnd9D0qyyiOWp2icgCCN9aUmsQh43BN+c/zT3l+Px5zUe4tIVc1XEQXpA40tXIXfI8ECDtuC3EpHHgA3Hww4E0NipLd+e+lYtLll4W+bP9NJ3z61x5IFB/RqhKACr/x8Q5beFLajFSxVvtCZZmzhAjn/4QxZw8wqAqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291482; c=relaxed/simple;
	bh=S1AWXPdMqP9fWMAPIjgH6HcU79AG0t2hd0D9Pa/LaTc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YwJiidoPdrm4Xd6mO+1zuzRsXQLw9W/89TfgdOgxVJ/ta6rdlFNi5OEe1Sfy8Fzq8eSlYTj0ow5NZOdwFXNdM7ull5cK6GPT2LUskyT4/UdGc2VakCoClliv0mjvlhoQr6TnjIast4SdMxf7s0QYTDtCC/+d9oaBGNTK0LRqfLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=gEkB92Ir; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="gEkB92Ir"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2e4df2e26fso68378166b.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 05:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1791291478; x=1791896278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6GyRcaTB2G6/+iSdmqu+Ru7NPglY3iZB2zj/8sP57oc=;
        b=gEkB92IrIq211U3Hk0ZhGzyxOK0qUK0xZTjHKG7QypkfVvN6SMz+1OLVkeip2GO2/C
         gYbBKhsWmVzWSQ7M8e/G5OyiD9ViDboAn+QqdOoos0BhobA9T5JJy6l7GxfG8ECKNiMH
         IHtNQAZrPIwkmEdbnaZq24ITNIEy6oCLKZe79lfqkDbpp3mKnpWn7MeLoOvtkrGNjSkB
         Vv2m3HXRqy4m71UqvKzxRlCzC+yHwVkcTCPidi31yjX8srzpAEktySJfh1UC8tPjIrDM
         J5jhU/SKdfmoVbVDKSeKwfMf1RQZgkNXMOMbK2roGyT64xTBAGOdcccLFq13aIxJhluN
         KTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791291478; x=1791896278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GyRcaTB2G6/+iSdmqu+Ru7NPglY3iZB2zj/8sP57oc=;
        b=Fy3xenXFVG0wKZk5O36a02GDWtRAUVH40avXyjq9vrqjibLLHLSZ7/KXNlw5Rn+1RI
         NAyXjHacA81jeCBTB+f0uxzKyou+cmQVgj8bS+7rnn0XDemhtlWM4KsGrNX1R+sBQhPb
         tsN2w/j4xVssbWR5iU58BhSZ4mN7oECoY1aIzaALezxczIWzBX4yw3qDfmE2MPTbn/Pn
         5kainnIXaLG6xLl0gX0vNd0WJpP3p2KcJ4IVV1Jh1JDH4G3o0utMfE3g5ITBK7WUZaNg
         /qxB9fG3LMwdPaUmuuKlk5OfS7ei7JRaBZZizIHS5VNUVcH9jBUO2q7Lp2kHR7GUpwco
         VubQ==
X-Forwarded-Encrypted: i=1; AKwUvByKCe7McAG9IaJ9vtdHkJqOa0MDvDyiIM9ZTnIWjRjU2lKabBF5vTmCsMAW1imfAeOTLICa90smiw8YyrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4c3Lbxjq55eEJaFaNZ1kCUEkKQ6dQrJcOBYCogD709HmTkUjC
	Xg5+ksepCNxtrMO006r0WM6yeXWOewpI97dlU4YJ63RgsPbCDScnbAgvbCmETva3dw==
X-Gm-Gg: AYBFou2GmuarBXZLqtZUbcMezceLPhVQbvawxQ9Ctg8n7oPMWoKqTS0mIowwBsRBaOE
	9L7pNTHRxk6Q33r2I9tooWUUS+0GR1TklEApgYtNuBcqVvVBI8JqMyP+Lb+Q4Ityjs3vH9Un3yv
	sW9As2y85eU/nQxGXbOma+nqjvnwbdOCS8mtcydUwzL2vHcW8OFI/UiE2mE2VlCklmItH+a3H+Q
	m13UNdQP4UkKXzfwld6qZsgSlSdNqeZw8hPU4pUH+J6Ldm9r3a0SMybSXVfFy5AfXBkyojIDfFB
	NYu0aBaG5HKQx7JSOsiOQskv09+FwTkVczSlu5qEu9sPIQLZtRnv/xPV/LVgP6LLAUCP9rcOt1R
	+alrYzg5qrtkeLMHMpCoy9nasMhinQjNsKV0VMRhZQfIczM5496YeOX6SENE17Kuu8oRvG2kVXl
	lzEckGGTGyRKRPjXK4ELbN8thzG2cxWLj74SWkezjR3QNrIp9kdr3WN6A3CHOLtQG4uMuokOrGF
	QfWBJn3Q9NVRaUM9uL4KQ==
X-Received: by 2002:a17:907:2da4:b0:c2e:2fb6:ff37 with SMTP id a640c23a62f3a-c3169fb09ffmr141582266b.21.1791291477565;
        Tue, 06 Oct 2026 05:57:57 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31562da31esm201740666b.38.2026.10.06.05.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 05:57:57 -0700 (PDT)
From: hengyul@cs.unc.edu
To: Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>,
	io-uring@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hengyu Liang <hengyul@cs.unc.edu>,
	stable@vger.kernel.org
Subject: [PATCH] io_uring: do not charge the SQ/CQ rings to RLIMIT_MEMLOCK
Date: Tue,  6 Oct 2026 08:57:32 -0400
Message-ID: <20261006125732.3425762-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hengyu Liang <hengyul@cs.unc.edu>

Commit 8078486e1d53 ("io_uring: use region api for SQ") and commit
81a4058e0cd0 ("io_uring: use region api for CQ") made io_uring_setup()
allocate the rings with io_create_region().

However, io_create_region() charges the memory to RLIMIT_MEMLOCK, and
the rings had been exempt from that limit since commit 26bfa89e25f4
("io_uring: place ring SQ/CQ arrays under memcg memory limits"). As of
now, a user without CAP_IPC_LOCK gets ENOMEM from io_uring_setup() when
their rings exceed the limit, which is 8 MiB by default. PostgreSQL
developers have already hit this in their io_uring tests [1].

The issue can be reproduced with a simple liburing program, run as an
unprivileged user:

    #include <liburing.h>
    #include <stdio.h>

    int main(void)
    {
            static struct io_uring ring[64];
            int i;

            for (i = 0; i < 64; i++)
                    if (io_uring_queue_init(4096, &ring[i], 0) < 0)
                            break;
            printf("%d rings\n", i);
            return 0;
    }

Before those commits (v6.13), it prints "64 rings". After those commits
(v6.14), it prints "21 rings".

This patch makes io_create_region() take the user to charge, and passes
no user for the SQ/CQ rings.

Link: https://www.postgresql.org/message-id/flat/667f7dcf-404b-4898-a426-57ca6e0617f6@gmail.com [1]
Fixes: 8078486e1d53 ("io_uring: use region api for SQ")
Fixes: 81a4058e0cd0 ("io_uring: use region api for CQ")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
 io_uring/io_uring.c | 10 ++++++----
 io_uring/kbuf.c     |  2 +-
 io_uring/memmap.c   | 10 +++++-----
 io_uring/memmap.h   |  2 +-
 io_uring/register.c | 12 +++++++-----
 io_uring/zcrx.c     |  2 +-
 6 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 61053421d809..26890f4de206 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2068,8 +2068,9 @@ int io_submit_sqes(struct io_ring_ctx *ctx, unsigned int nr)
 
 static void io_rings_free(struct io_ring_ctx *ctx)
 {
-	io_free_region(ctx->user, &ctx->sq_region);
-	io_free_region(ctx->user, &ctx->ring_region);
+	/* ring memory is not charged to RLIMIT_MEMLOCK, hence no user */
+	io_free_region(NULL, &ctx->sq_region);
+	io_free_region(NULL, &ctx->ring_region);
 	ctx->rings = NULL;
 	RCU_INIT_POINTER(ctx->rings_rcu, NULL);
 	ctx->sq_sqes = NULL;
@@ -2733,7 +2734,8 @@ static __cold int io_allocate_scq_urings(struct io_ring_ctx *ctx,
 		rd.user_addr = p->cq_off.user_addr;
 		rd.flags |= IORING_MEM_REGION_TYPE_USER;
 	}
-	ret = io_create_region(ctx, &ctx->ring_region, &rd, IORING_OFF_CQ_RING);
+	/* ring memory is not charged to RLIMIT_MEMLOCK, hence no user */
+	ret = io_create_region(NULL, &ctx->ring_region, &rd, IORING_OFF_CQ_RING);
 	if (ret)
 		return ret;
 	ctx->rings = rings = io_region_get_ptr(&ctx->ring_region);
@@ -2747,7 +2749,7 @@ static __cold int io_allocate_scq_urings(struct io_ring_ctx *ctx,
 		rd.user_addr = p->sq_off.user_addr;
 		rd.flags |= IORING_MEM_REGION_TYPE_USER;
 	}
-	ret = io_create_region(ctx, &ctx->sq_region, &rd, IORING_OFF_SQES);
+	ret = io_create_region(NULL, &ctx->sq_region, &rd, IORING_OFF_SQES);
 	if (ret) {
 		io_rings_free(ctx);
 		return ret;
diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index 7c309173dd19..7c59ab9cfc8b 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -676,7 +676,7 @@ int io_register_pbuf_ring(struct io_ring_ctx *ctx, void __user *arg)
 		rd.user_addr = reg.ring_addr;
 		rd.flags |= IORING_MEM_REGION_TYPE_USER;
 	}
-	ret = io_create_region(ctx, &bl->region, &rd, mmap_offset);
+	ret = io_create_region(ctx->user, &bl->region, &rd, mmap_offset);
 	if (ret)
 		goto fail;
 	br = io_region_get_ptr(&bl->region);
diff --git a/io_uring/memmap.c b/io_uring/memmap.c
index 48c0eb012412..d4d716946971 100644
--- a/io_uring/memmap.c
+++ b/io_uring/memmap.c
@@ -204,7 +204,7 @@ static int io_region_allocate_pages(struct io_mapped_region *mr,
 	return 0;
 }
 
-int io_create_region(struct io_ring_ctx *ctx, struct io_mapped_region *mr,
+int io_create_region(struct user_struct *user, struct io_mapped_region *mr,
 		     struct io_uring_region_desc *reg,
 		     unsigned long mmap_offset)
 {
@@ -230,8 +230,8 @@ int io_create_region(struct io_ring_ctx *ctx, struct io_mapped_region *mr,
 		return -EOVERFLOW;
 
 	nr_pages = reg->size >> PAGE_SHIFT;
-	if (ctx->user) {
-		ret = __io_account_mem(ctx->user, nr_pages);
+	if (user) {
+		ret = __io_account_mem(user, nr_pages);
 		if (ret)
 			return ret;
 	}
@@ -240,7 +240,7 @@ int io_create_region(struct io_ring_ctx *ctx, struct io_mapped_region *mr,
 	if (reg->flags & IORING_MEM_REGION_TYPE_USER)
 		ret = io_region_pin_pages(mr, reg);
 	else
-		ret = io_region_allocate_pages(mr, reg, mmap_offset, ctx->user);
+		ret = io_region_allocate_pages(mr, reg, mmap_offset, user);
 	if (ret)
 		goto out_free;
 
@@ -249,7 +249,7 @@ int io_create_region(struct io_ring_ctx *ctx, struct io_mapped_region *mr,
 		goto out_free;
 	return 0;
 out_free:
-	io_free_region(ctx->user, mr);
+	io_free_region(user, mr);
 	return ret;
 }
 
diff --git a/io_uring/memmap.h b/io_uring/memmap.h
index f4cfbb6b9a1f..0714bb5a9616 100644
--- a/io_uring/memmap.h
+++ b/io_uring/memmap.h
@@ -18,7 +18,7 @@ unsigned long io_uring_get_unmapped_area(struct file *file, unsigned long addr,
 int io_uring_mmap(struct file *file, struct vm_area_struct *vma);
 
 void io_free_region(struct user_struct *user, struct io_mapped_region *mr);
-int io_create_region(struct io_ring_ctx *ctx, struct io_mapped_region *mr,
+int io_create_region(struct user_struct *user, struct io_mapped_region *mr,
 		     struct io_uring_region_desc *reg,
 		     unsigned long mmap_offset);
 
diff --git a/io_uring/register.c b/io_uring/register.c
index 02bc103bcc9d..d11a53d68431 100644
--- a/io_uring/register.c
+++ b/io_uring/register.c
@@ -480,8 +480,9 @@ struct io_ring_ctx_rings {
 static void io_register_free_rings(struct io_ring_ctx *ctx,
 				   struct io_ring_ctx_rings *r)
 {
-	io_free_region(ctx->user, &r->sq_region);
-	io_free_region(ctx->user, &r->ring_region);
+	/* ring memory is not charged to RLIMIT_MEMLOCK, hence no user */
+	io_free_region(NULL, &r->sq_region);
+	io_free_region(NULL, &r->ring_region);
 }
 
 #define swap_old(ctx, o, n, field)		\
@@ -529,7 +530,7 @@ static int io_register_resize_rings(struct io_ring_ctx *ctx, void __user *arg)
 		rd.user_addr = p->cq_off.user_addr;
 		rd.flags |= IORING_MEM_REGION_TYPE_USER;
 	}
-	ret = io_create_region(ctx, &n.ring_region, &rd, IORING_OFF_CQ_RING);
+	ret = io_create_region(NULL, &n.ring_region, &rd, IORING_OFF_CQ_RING);
 	if (ret)
 		return ret;
 
@@ -559,7 +560,7 @@ static int io_register_resize_rings(struct io_ring_ctx *ctx, void __user *arg)
 		rd.user_addr = p->sq_off.user_addr;
 		rd.flags |= IORING_MEM_REGION_TYPE_USER;
 	}
-	ret = io_create_region(ctx, &n.sq_region, &rd, IORING_OFF_SQES);
+	ret = io_create_region(NULL, &n.sq_region, &rd, IORING_OFF_SQES);
 	if (ret) {
 		io_register_free_rings(ctx, &n);
 		return ret;
@@ -730,7 +731,8 @@ static int io_register_mem_region(struct io_ring_ctx *ctx, void __user *uarg)
 	    !(ctx->flags & IORING_SETUP_R_DISABLED))
 		return -EINVAL;
 
-	ret = io_create_region(ctx, &region, &rd, IORING_MAP_OFF_PARAM_REGION);
+	ret = io_create_region(ctx->user, &region, &rd,
+			       IORING_MAP_OFF_PARAM_REGION);
 	if (ret)
 		return ret;
 	if (copy_to_user(rd_uptr, &rd, sizeof(rd))) {
diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index 86d580d4410d..62cabfdf0206 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -431,7 +431,7 @@ static int io_allocate_rbuf_ring(struct io_ring_ctx *ctx,
 	mmap_offset = IORING_MAP_OFF_ZCRX_REGION;
 	mmap_offset += (u64)id << IORING_OFF_ZCRX_SHIFT;
 
-	ret = io_create_region(ctx, &ifq->rq_region, rd, mmap_offset);
+	ret = io_create_region(ctx->user, &ifq->rq_region, rd, mmap_offset);
 	if (ret < 0)
 		return ret;
 
-- 
2.53.0

